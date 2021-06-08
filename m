From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/3] treesource: Maintain phandle label/path on output
Date: Tue,  8 Jun 2021 15:46:26 -0500
Message-ID: <20210608204626.1545418-4-robh@kernel.org>
References: <20210608204626.1545418-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210608204626.1545418-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The dts output will just output phandle integer values, but often the
necessary markers are present with path or label references. Improve the
output and maintain phandle label or path references when present in dts
output.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
 - New patch
---
 treesource.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/treesource.c b/treesource.c
index 061ba8c9c5e8..36c5c1ec683e 100644
--- a/treesource.c
+++ b/treesource.c
@@ -229,6 +229,7 @@ static void write_propval(FILE *f, struct property *prop)
 		size_t chunk_len = (m->next ? m->next->offset : len) - m->offset;
 		size_t data_len = type_marker_length(m) ? : len - m->offset;
 		const char *p = &prop->val.val[m->offset];
+		struct marker *m_phandle;
 
 		if (has_data_type_information(m)) {
 			emit_type = m->type;
@@ -238,17 +239,31 @@ static void write_propval(FILE *f, struct property *prop)
 		else if (m->offset)
 			fputc(' ', f);
 
-		if (emit_type == TYPE_NONE) {
-			assert(chunk_len == 0);
+		if (emit_type == TYPE_NONE || chunk_len == 0)
 			continue;
-		}
 
 		switch(emit_type) {
 		case TYPE_UINT16:
 			write_propval_int(f, p, chunk_len, 2);
 			break;
 		case TYPE_UINT32:
-			write_propval_int(f, p, chunk_len, 4);
+			m_phandle = prop->val.markers;
+			for_each_marker_of_type(m_phandle, REF_PHANDLE)
+				if (m->offset == m_phandle->offset)
+					break;
+
+			if (m_phandle) {
+				if (m_phandle->ref[0] == '/')
+					fprintf(f, "&{%s}", m_phandle->ref);
+				else
+					fprintf(f, "&%s", m_phandle->ref);
+				if (chunk_len > 4) {
+					fputc(' ', f);
+					write_propval_int(f, p + 4, chunk_len - 4, 4);
+				}
+			} else {
+				write_propval_int(f, p, chunk_len, 4);
+			}
 			break;
 		case TYPE_UINT64:
 			write_propval_int(f, p, chunk_len, 8);
-- 
2.27.0

