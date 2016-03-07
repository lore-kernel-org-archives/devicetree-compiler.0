From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/3] Correct space-after-tab in libfdt.h
Date: Sun,  6 Mar 2016 20:12:46 -0700
Message-ID: <1457320368-27248-2-git-send-email-sjg@chromium.org>
References: <1457320368-27248-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SaQmvQGVcj0GwjOTVfonI+JMtNPYvJloFmkJchJEUlc=;
        b=Nodu/8O1sBB2t2dGb9QdXl59f4+t6YeXCpR/YxnkMWnUIS9M5G7EMTU2MfScXyVVHi
         8GjpN75udC5lIkdrgzMAXDtMixB8+9KvR0F2FfQUVRpev2ttPNLlArMcWzF1VU0+Rr5v
         5zekmQiDMscj/isD/GbiDGqiMi/FHX7dIMlcRccJZckQ7x1G/fykDlynbAJmjmYMdrdX
         o2HcfOxLfX8o3ajcA6xhJifkA3fyscUYgLFOHwkZiAx8J6i4yuZgU+Ps7bAcV+p2oogS
         HQZY0U6Up658120Tmza0W6IPOjdIefAGEQRPaTGD0gR3TYc6CUlIuo8AcK8z5CYxbJQn
         HFeg==
In-Reply-To: <1457320368-27248-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

There are a few places with a space before a tab in this file. Fix them.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 libfdt/libfdt.h | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 78adb12..25311cb 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -174,15 +174,15 @@ int fdt_next_subnode(const void *fdt, int offset);
 
 #define fdt_get_header(fdt, field) \
 	(fdt32_to_cpu(((const struct fdt_header *)(fdt))->field))
-#define fdt_magic(fdt) 			(fdt_get_header(fdt, magic))
+#define fdt_magic(fdt)			(fdt_get_header(fdt, magic))
 #define fdt_totalsize(fdt)		(fdt_get_header(fdt, totalsize))
 #define fdt_off_dt_struct(fdt)		(fdt_get_header(fdt, off_dt_struct))
 #define fdt_off_dt_strings(fdt)		(fdt_get_header(fdt, off_dt_strings))
 #define fdt_off_mem_rsvmap(fdt)		(fdt_get_header(fdt, off_mem_rsvmap))
 #define fdt_version(fdt)		(fdt_get_header(fdt, version))
-#define fdt_last_comp_version(fdt) 	(fdt_get_header(fdt, last_comp_version))
-#define fdt_boot_cpuid_phys(fdt) 	(fdt_get_header(fdt, boot_cpuid_phys))
-#define fdt_size_dt_strings(fdt) 	(fdt_get_header(fdt, size_dt_strings))
+#define fdt_last_comp_version(fdt)	(fdt_get_header(fdt, last_comp_version))
+#define fdt_boot_cpuid_phys(fdt)	(fdt_get_header(fdt, boot_cpuid_phys))
+#define fdt_size_dt_strings(fdt)	(fdt_get_header(fdt, size_dt_strings))
 #define fdt_size_dt_struct(fdt)		(fdt_get_header(fdt, size_dt_struct))
 
 #define __fdt_set_hdr(name) \
@@ -647,7 +647,7 @@ const char *fdt_get_alias(const void *fdt, const char *name);
  *	0, on success
  *		buf contains the absolute path of the node at
  *		nodeoffset, as a NUL-terminated string.
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_NOSPACE, the path of the given node is longer than (bufsize-1)
  *		characters and will not fit in the given buffer.
  *	-FDT_ERR_BADMAGIC,
@@ -677,11 +677,10 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
  * structure from the start to nodeoffset.
  *
  * returns:
-
  *	structure block offset of the node at node offset's ancestor
  *		of depth supernodedepth (>=0), on success
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
-*	-FDT_ERR_NOTFOUND, supernodedepth was greater than the depth of nodeoffset
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_NOTFOUND, supernodedepth was greater than the depth of nodeoffset
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -703,7 +702,7 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
  *
  * returns:
  *	depth of the node at nodeoffset (>=0), on success
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -726,7 +725,7 @@ int fdt_node_depth(const void *fdt, int nodeoffset);
  * returns:
  *	structure block offset of the parent of the node at nodeoffset
  *		(>=0), on success
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -766,7 +765,7 @@ int fdt_parent_offset(const void *fdt, int nodeoffset);
  *		 on success
  *	-FDT_ERR_NOTFOUND, no node matching the criterion exists in the
  *		tree after startoffset
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -813,7 +812,7 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle);
  *	1, if the node has a 'compatible' property, but it does not list
  *		the given string
  *	-FDT_ERR_NOTFOUND, if the given node has no 'compatible' property
- * 	-FDT_ERR_BADOFFSET, if nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, if nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -850,7 +849,7 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
  *		 on success
  *	-FDT_ERR_NOTFOUND, no node matching the criterion exists in the
  *		tree after startoffset
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
-- 
2.7.0.rc3.207.g0ac5344
