From: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v3 1/4] dtc: Add marker type functionality to dtc.h
Date: Sun,  6 Sep 2020 14:12:17 +0100
Message-ID: <20200906131220.6192-2-andrei.ziureaev@arm.com>
References: <20200906131220.6192-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9BLt+NvT3qQUqVQ7/nM/KwsNkkjVGldh31YgXbL7TIQ=;
        b=tX6A1YsmIdrzmCZlK6Xnn/z2WTDCNuHPqt0EwOivaCAcRGAof/ioHu52SbBDdsYbO0
         h5nIwHUAaotv+z0jNRstSCexf4lVWvhtskTWnNs7cejm4O2xGIq8jHOGMPOApjO1xMJs
         UUErxFeztSIB7hbDosUm2/pjAtTTlz/YhbLRxlYIlwopGEo7K+g/ahLSHkArvp4aEUCe
         Nu+gtP0PhVPnYzxA2BWU9FAwTXY7kzlALzZVxMHs3dfM50heMi22bjzwAxiBfUk2BVAW
         DRO/7GgBwZz6Ti6uCbwBeJQimTsJBKq5lZ6KofxVMUcKkKUmOpTRjiE3r3jyPjUVlUd+
         FqbQ==
In-Reply-To: <20200906131220.6192-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrei.ziureaev-5wv7dgnIgG8@public.gmane.org

Add an inline helper function to dtc.h that checks if there's a marker
of a type at an offset.

Also, there are two useful static functions in treesource.c. Make them
public, add their prototypes to dtc.h and rename one of them.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Andrei Ziureaev <andreiziureaev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 dtc.h        | 11 +++++++++++
 treesource.c |  8 ++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/dtc.h b/dtc.h
index a08f415..286d999 100644
--- a/dtc.h
+++ b/dtc.h
@@ -125,6 +125,17 @@ struct data {
 	for_each_marker(m) \
 		if ((m)->type == (t))
 
+static inline bool markers_have_type_at_offset(struct marker *m, enum markertype type, int off)
+{
+	for_each_marker_of_type(m, type)
+		if (m->offset == off)
+			return true;
+
+	return false;
+}
+
+bool marker_has_data_type_information(struct marker *m);
+struct marker *next_type_marker(struct marker *m);
 size_t type_marker_length(struct marker *m);
 
 void data_free(struct data d);
diff --git a/treesource.c b/treesource.c
index 061ba8c..0785d83 100644
--- a/treesource.c
+++ b/treesource.c
@@ -124,14 +124,14 @@ static void write_propval_int(FILE *f, const char *p, size_t len, size_t width)
 	}
 }
 
-static bool has_data_type_information(struct marker *m)
+bool marker_has_data_type_information(struct marker *m)
 {
 	return m->type >= TYPE_UINT8;
 }
 
-static struct marker *next_type_marker(struct marker *m)
+struct marker *next_type_marker(struct marker *m)
 {
-	while (m && !has_data_type_information(m))
+	while (m && !marker_has_data_type_information(m))
 		m = m->next;
 	return m;
 }
@@ -230,7 +230,7 @@ static void write_propval(FILE *f, struct property *prop)
 		size_t data_len = type_marker_length(m) ? : len - m->offset;
 		const char *p = &prop->val.val[m->offset];
 
-		if (has_data_type_information(m)) {
+		if (marker_has_data_type_information(m)) {
 			emit_type = m->type;
 			fprintf(f, " %s", delim_start[emit_type]);
 		} else if (m->type == LABEL)
-- 
2.17.1

