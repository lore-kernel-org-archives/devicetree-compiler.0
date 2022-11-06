From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>
Subject: [RFC] libfdt: add fdt_alignprop
Date: Sun,  6 Nov 2022 15:12:47 +0100
Message-ID: <20221106141247.867853-1-bjorn@mork.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1667743970; bh=KRUWdhKWy0yCURPX/ftliYLrsQHbs57QEJSgbU5qDWU=;
        h=From:To:Cc:Subject:Date:Message-Id:From;
        b=Ky9UR6g+e0YPnPMG/ibuE+VaOV28o6M4cMe9scLkcZxFsHKA+rbDeXamrn8KYhDOd
         7Sal51dS6sXiE3NYrFmi6B1j7AwKcEi7fTQeGAtVMhCJ1G6OqGz/bTC4ZwCrl36RhR
         /rwCg0JP2izNJnEOEqMPzeDViQTf28eV/rZzFQ/Y=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn-yOkvZcmFvRU@public.gmane.org>

Properties are sometimes used to store data with stricter alignment
requirements than the 4-byte fdt tag alignment. Aligning the offset
of the property data will alloe a client to directly address it,
without reloaction, provided the fdt is loaded on a similarily
aligned boundary.

One known use-case for this is the U-Boot FIT images, which may
embed nested fdt blobs inside properties of the outer FIT fdt.
Although strongly discouraged, U-Boot can be configured to use these
embedded blobs "in place". This is discouraged because if only will
work if the offset of the property value, i.e. the embedded fdt,
happens to match the 8-byte boundary required by the devicetree
spec.

Adding the ability to align property data allows U-Boot tools to
reliably create FIT images for such use.

Other use cases are currently not known, but anticipated.

Signed-off-by: Bjørn Mork <bjorn-yOkvZcmFvRU@public.gmane.org>
---
Throwing out this idea as an RFC here to get an idea whether
this route is worth following or not.  I've not yet tested this
on the U-Boot community so I don't know if they actually want
it.

But I would not be surprised if people find other uses for this
than my example use case.

Please comment, if only to say "go away!" :-)


Bjørn


 libfdt/fdt_rw.c          | 26 ++++++++++++++++++++++++++
 libfdt/fdt_wip.c         |  2 +-
 libfdt/libfdt.h          | 30 ++++++++++++++++++++++++++++++
 libfdt/libfdt_internal.h |  1 +
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 3621d3651d3f..797132cfef74 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -330,6 +330,32 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 	return fdt_splice_struct_(fdt, prop, proplen, 0);
 }
 
+int fdt_alignprop(void *fdt, int nodeoffset, const char *name, size_t align)
+{
+	struct fdt_property *prop;
+	int err, len, diff;
+
+	FDT_RW_PROBE(fdt);
+
+	if (align != FDT_TAGALIGN(align))
+		return -FDT_ERR_BADOFFSET;
+
+	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
+	if (!prop)
+		return len;
+
+	diff = FDT_ALIGN((uintptr_t)prop->data, align) - (uintptr_t)prop->data;
+	if (!diff)
+		return 0;
+
+	err = fdt_splice_struct_(fdt, prop, 0, diff);
+	if (err)
+		return err;
+
+	fdt_nop_region_(prop, diff);
+	return 0;
+}
+
 int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 			    const char *name, int namelen)
 {
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index c2d7566a67dc..10a75058f0f0 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -48,7 +48,7 @@ int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 						   val, len);
 }
 
-static void fdt_nop_region_(void *start, int len)
+void fdt_nop_region_(void *start, int len)
 {
 	fdt32_t *p;
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index d0a2ed2741f3..6c4060c9e492 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -2016,6 +2016,36 @@ int fdt_appendprop_addrrange(void *fdt, int parent, int nodeoffset,
  */
 int fdt_delprop(void *fdt, int nodeoffset, const char *name);
 
+/**
+ * fdt_alignprop - align property data to a given boundary
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to nop
+ * @name: name of the property to nop
+ * @align: requested alignment boundary in bytes (must be multiple of 4)
+ *
+ * fdt_alignprop() will align the property data to a chosen boundary
+ * by injecting nop tags in front of the given property.  The
+ * alignment must be a multiple of 4.
+ *
+ * This function may insert nop tags in the blob, and will therefore
+ * change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		move the property to the new boundary
+ *	-FDT_ERR_NOTFOUND, node does not have the named property
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		or the requested alignment was not a multiple of 4
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_alignprop(void *fdt, int nodeoffset, const char *name, size_t align);
+
 /**
  * fdt_add_subnode_namelen - creates a new node based on substring
  * @fdt: pointer to the device tree blob
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 16bda1906a7b..ce4aedd19965 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -22,6 +22,7 @@ int fdt_check_node_offset_(const void *fdt, int offset);
 int fdt_check_prop_offset_(const void *fdt, int offset);
 const char *fdt_find_string_(const char *strtab, int tabsize, const char *s);
 int fdt_node_end_offset_(void *fdt, int nodeoffset);
+void fdt_nop_region_(void *start, int len);
 
 static inline const void *fdt_offset_ptr_(const void *fdt, int offset)
 {
-- 
2.30.2

