From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] libfdt: place new nodes & properties after the parent's
 ones
Date: Tue,  4 Feb 2020 13:58:44 +0100
Message-ID: <20200204125844.19955-1-m.szyprowski@samsung.com>
References: <CGME20200204125854eucas1p19ace564a5f45b9231e0fba8af07009cd@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200204125854euoutp02d0f653d63134eff5f933ed7840cd38d5~wNHJGACug2459424594euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1580821134;
        bh=OpcxaeFkkMnFoF4KDR3jWlSTbVAXsa0PzMZkJ48/Klw=;
        h=From:To:Cc:Subject:Date:References:From;
        b=nmTN3EPJbeOEiyv73LIhyH7Ssbv9xllRlaDl5KXSJJ8eugDoIf7LruXQuhgHC+I+J
         iQpy5lb0Ya6Kip9ztltpgTDVum05kvtsvfPyhVZxSumC6FYpVuXcPvsHYlIeKF+ahQ
         0QcU8krZTDbiGdn81UKsiMc69NVpC6CfL9PoxvL4=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

While applying dt-overlays using libfdt code, the order of the applied
properties and sub-nodes is reversed. This should not be a problem in
ideal world (mainline), but this matters for some vendor specific/custom
dtb files. This can be easily fixed by the little change to libfdt code:
any new properties and sub-nodes should be added after the parent's node
properties and subnodes.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 libfdt/fdt_rw.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 8795947..88c5930 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -189,19 +189,27 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 			     int len, struct fdt_property **prop)
 {
 	int proplen;
-	int nextoffset;
+	int offset, nextoffset;
 	int namestroff;
 	int err;
 	int allocated;
+	uint32_t tag;
 
 	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
 		return nextoffset;
 
+	/* Try to place the new property after the parent's properties */
+	fdt_next_tag(fdt, nodeoffset, &nextoffset); /* skip the BEGIN_NODE */
+	do {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+	} while ((tag == FDT_PROP) || (tag == FDT_NOP));
+
 	namestroff = fdt_find_add_string_(fdt, name, &allocated);
 	if (namestroff < 0)
 		return namestroff;
 
-	*prop = fdt_offset_ptr_w_(fdt, nextoffset);
+	*prop = fdt_offset_ptr_w_(fdt, offset);
 	proplen = sizeof(**prop) + FDT_TAGALIGN(len);
 
 	err = fdt_splice_struct_(fdt, *prop, 0, proplen);
@@ -321,6 +329,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	struct fdt_node_header *nh;
 	int offset, nextoffset;
 	int nodelen;
+	int depth = 0;
 	int err;
 	uint32_t tag;
 	fdt32_t *endtag;
@@ -333,12 +342,21 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	else if (offset != -FDT_ERR_NOTFOUND)
 		return offset;
 
-	/* Try to place the new node after the parent's properties */
+	/* Try to place the new node after the parent's subnodes */
 	fdt_next_tag(fdt, parentoffset, &nextoffset); /* skip the BEGIN_NODE */
 	do {
+again:
 		offset = nextoffset;
 		tag = fdt_next_tag(fdt, offset, &nextoffset);
-	} while ((tag == FDT_PROP) || (tag == FDT_NOP));
+		if (depth && tag == FDT_END_NODE) {
+			depth--;
+			goto again;
+		}
+		if (tag == FDT_BEGIN_NODE) {
+			depth++;
+			goto again;
+		}
+	} while (depth || (tag == FDT_PROP) || (tag == FDT_NOP));
 
 	nh = fdt_offset_ptr_w_(fdt, offset);
 	nodelen = sizeof(*nh) + FDT_TAGALIGN(namelen+1) + FDT_TAGSIZE;
-- 
2.17.1

