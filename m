From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 3/4] libfdt: Add support for disabling internal checks
Date: Mon,  2 Mar 2020 12:02:54 -0700
Message-ID: <20200302190255.51426-3-sjg@chromium.org>
References: <20200302190255.51426-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r781mGov4SKJGxL46qCPefMM0/Vtso7CDgR2mxO5MdM=;
        b=QPubvCHaTXiqbsnerd43NfQQwsX8LQjWVzN+5CRtz+F1z0iZMAXnRDxy9052Hul24H
         wuDCtFB2raBlDkgr4E6NYv7YXZm8bUy64brodmsFEghKQKyGBRxAb6fqAk2kqQVpHtM1
         pq+z++4KGWad7h0jTnfBCX2GLJI7YUDavLKXw=
In-Reply-To: <20200302190255.51426-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

If libfdt returns -FDT_ERR_INTERNAL that generally indicates a bug in the
library. Add a new assumption for these cases since it should be save to
disable these checks regardless of the input.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Suggested-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
I have left other FDT_ERR_INTERNAL sites alone for now. I see that
fdt_check_full() returns -FDT_ERR_INTERNAL which seems to be different
from what you said about this only being for libfdt bugs.

 libfdt/fdt_ro.c          | 4 ++--
 libfdt/libfdt_internal.h | 9 +++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 1945503..e03570a 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -402,7 +402,7 @@ static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
 		const struct fdt_property *prop;
 
 		prop = fdt_get_property_by_offset_(fdt, offset, lenp);
-		if (!can_assume(VALID_DTB) && !prop) {
+		if (!can_assume(LIBFDT_FLAWLESS) && !prop) {
 			offset = -FDT_ERR_INTERNAL;
 			break;
 		}
@@ -634,7 +634,7 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
 
 	err = fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
 	if (err)
-		return (can_assume(VALID_INPUT) || err < 0) ? err :
+		return (can_assume(LIBFDT_FLAWLESS) || err < 0) ? err :
 			-FDT_ERR_INTERNAL;
 	return nodedepth;
 }
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 7999f6a..d4e0bd4 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -145,6 +145,15 @@ enum {
 	 * device tree is correctly ordered. See fdt_blocks_misordered_().
 	 */
 	ASSUME_LIBFDT_ORDER	= 1 << 4,
+
+	/*
+	 * This assumes that libfdt itself does not have any internal bugs. It
+	 * drops certain checks that should never be needed unless libfdt has an
+	 * undiscovered bug.
+	 *
+	 * This can generally be considered safe to enable.
+	 */
+	ASSUME_LIBFDT_FLAWLESS	= 1 << 5,
 };
 
 /**
-- 
2.25.0.265.gbab2e86ba0-goog

