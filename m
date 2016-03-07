From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/3] Correct line lengths in libfdt.h
Date: Sun,  6 Mar 2016 20:12:47 -0700
Message-ID: <1457320368-27248-3-git-send-email-sjg@chromium.org>
References: <1457320368-27248-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ALC3CnfEPv9b+bX/OcluBzGvUIZhyPkWhSlNxierCW8=;
        b=cv7HZMuT+v41ilDrLF20H3TDPYjfX0mCNJ9Ey9soNsm93/W/EIOKjxaZMwjNjLb4wF
         91A7NUTO4/DbAmH4TgJx/wpx1Jwl/Hm4by0nAJ3x3bhXfXJWA7Sa3lh0JBDp/u6Tf9bU
         MNDG+4ah/hEr7MqKKDKFPjXpw7Nc30kuIeozY/RYCLdWle/oK6hEvolO1tIT1aeYLiSr
         zqjrLiG+V4cy1IV8WO0h26zttp88deo+wZdCFbckSvqX9y25ADrF7SfYQtIu7XJIUiZo
         952WXHDdIiu9DDWA3hyukcGBzPGLS/n7AfmSvhIvhwny3RAUDvAaMrSlQRdZeKWtCdmo
         74MQ==
In-Reply-To: <1457320368-27248-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

There are a few lines that are over 80 columns. Fix these.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 libfdt/libfdt.h | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 25311cb..2c7b4e8 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -318,8 +318,9 @@ int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
  * returns:
  *	structure block offset of the requested subnode (>=0), on success
  *	-FDT_ERR_NOTFOUND, if the requested subnode does not exist
- *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE tag
- *      -FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE
+ *		tag
+ *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
  *	-FDT_ERR_BADSTRUCTURE,
@@ -351,7 +352,8 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
  * address).
  *
  * returns:
- *	structure block offset of the node with the requested path (>=0), on success
+ *	structure block offset of the node with the requested path (>=0), on
+ *		success
  *	-FDT_ERR_BADPATH, given path does not begin with '/' or is invalid
  *	-FDT_ERR_NOTFOUND, if the requested node does not exist
  *      -FDT_ERR_BADMAGIC,
@@ -375,10 +377,12 @@ int fdt_path_offset(const void *fdt, const char *path);
  *
  * returns:
  *	pointer to the node's name, on success
- *		If lenp is non-NULL, *lenp contains the length of that name (>=0)
+ *		If lenp is non-NULL, *lenp contains the length of that name
+ *			(>=0)
  *	NULL, on error
  *		if lenp is non-NULL *lenp contains an error code (<0):
- *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
+ *			tag
  *		-FDT_ERR_BADMAGIC,
  *		-FDT_ERR_BADVERSION,
  *		-FDT_ERR_BADSTATE, standard meanings
@@ -490,7 +494,8 @@ const struct fdt_property *fdt_get_property_namelen(const void *fdt,
  *	NULL, on error
  *		if lenp is non-NULL, *lenp contains an error code (<0):
  *		-FDT_ERR_NOTFOUND, node does not have named property
- *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
+ *			tag
  *		-FDT_ERR_BADMAGIC,
  *		-FDT_ERR_BADVERSION,
  *		-FDT_ERR_BADSTATE,
@@ -575,7 +580,8 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
  *	NULL, on error
  *		if lenp is non-NULL, *lenp contains an error code (<0):
  *		-FDT_ERR_NOTFOUND, node does not have named property
- *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
+ *			tag
  *		-FDT_ERR_BADMAGIC,
  *		-FDT_ERR_BADVERSION,
  *		-FDT_ERR_BADSTATE,
@@ -680,7 +686,8 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
  *	structure block offset of the node at node offset's ancestor
  *		of depth supernodedepth (>=0), on success
  *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
- *	-FDT_ERR_NOTFOUND, supernodedepth was greater than the depth of nodeoffset
+ *	-FDT_ERR_NOTFOUND, supernodedepth was greater than the depth of
+ *		nodeoffset
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -959,7 +966,8 @@ const char *fdt_stringlist_get(const void *fdt, int nodeoffset,
  * returns:
  *	0 <= n < FDT_MAX_NCELLS, on success
  *      2, if the node has no #address-cells property
- *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid #address-cells property
+ *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid
+ *		#address-cells property
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -979,7 +987,8 @@ int fdt_address_cells(const void *fdt, int nodeoffset);
  * returns:
  *	0 <= n < FDT_MAX_NCELLS, on success
  *      2, if the node has no #address-cells property
- *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid #size-cells property
+ *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid
+ *		#size-cells property
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -1603,9 +1612,11 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
  * change the offsets of some existing nodes.
 
  * returns:
- *	structure block offset of the created nodeequested subnode (>=0), on success
+ *	structure block offset of the created nodeequested subnode (>=0), on
+ *		success
  *	-FDT_ERR_NOTFOUND, if the requested subnode does not exist
- *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE
+ *		tag
  *	-FDT_ERR_EXISTS, if the node at parentoffset already has a subnode of
  *		the given name
  *	-FDT_ERR_NOSPACE, if there is insufficient free space in the
-- 
2.7.0.rc3.207.g0ac5344
