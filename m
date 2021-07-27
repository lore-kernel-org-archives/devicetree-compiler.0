From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 5/5] treesource: Maintain phandle label/path on output
Date: Tue, 27 Jul 2021 12:30:23 -0600
Message-ID: <20210727183023.3212077-6-robh@kernel.org>
References: <20210727183023.3212077-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20210727183023.3212077-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The dts output will just output phandle integer values, but often the
necessary markers are present with path or label references. Improve the
output and maintain phandle label or path references when present in dts
output.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v3:
 - Add phandle properties to type-preservation test
v2:
 - New patch
---
 tests/type-preservation.dt.yaml |  3 +++
 tests/type-preservation.dts     |  3 +++
 treesource.c                    | 25 +++++++++++++++++++------
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/tests/type-preservation.dt.yaml b/tests/type-preservation.dt.yaml
index ee8cfdebe9be..a0cc64cc4b69 100644
--- a/tests/type-preservation.dt.yaml
+++ b/tests/type-preservation.dt.yaml
@@ -13,8 +13,11 @@
     int64: [!u64 [0x200000000]]
     int64-array: [!u64 [0x100000000, 0x0]]
     a-string-with-nulls: ["foo\0bar", "baz"]
+    a-phandle: [[!phandle 0x1]]
+    a-phandle-with-args: [[!phandle 0x1, 0x0, 0x1], [!phandle 0x1, 0x2, 0x3]]
     subsubnode:
       compatible: ["subsubnode1", "subsubnode"]
+      phandle: [[0x1]]
       subsubsubnode:
         compatible: ["subsubsubnode1", [0x1234], "subsubsubnode"]
 ...
diff --git a/tests/type-preservation.dts b/tests/type-preservation.dts
index 3e380ba6c8a5..921ea21172d1 100644
--- a/tests/type-preservation.dts
+++ b/tests/type-preservation.dts
@@ -16,9 +16,12 @@
 		int64 = /bits/ 64 <0x200000000>;
 		int64-array = /bits/ 64 <0x100000000 0x00> int64_array_label_end:;
 		a-string-with-nulls = "foo\0bar", "baz";
+		a-phandle = <&subsub1>;
+		a-phandle-with-args = <&subsub1 0x00 0x01>, <&subsub1 0x02 0x03>;
 
 		subsub1: subsubnode {
 			compatible = "subsubnode1", "subsubnode";
+			phandle = <0x01>;
 
 			subsubsub1: subsubsubnode {
 				compatible = "subsubsubnode1", <0x1234>, valuea: valueb: "subsubsubnode";
diff --git a/treesource.c b/treesource.c
index db2ff69f5ccb..33fedee82d58 100644
--- a/treesource.c
+++ b/treesource.c
@@ -208,26 +208,39 @@ static void write_propval(FILE *f, struct property *prop)
 		size_t chunk_len = (m->next ? m->next->offset : len) - m->offset;
 		size_t data_len = type_marker_length(m) ? : len - m->offset;
 		const char *p = &prop->val.val[m->offset];
+		struct marker *m_phandle;
 
 		if (is_type_marker(m->type)) {
 			emit_type = m->type;
 			fprintf(f, " %s", delim_start[emit_type]);
 		} else if (m->type == LABEL)
 			fprintf(f, " %s:", m->ref);
-		else if (m->offset)
-			fputc(' ', f);
 
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

