From: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 2/6] dtc: Add bytestring type
Date: Tue, 14 Jul 2020 16:45:38 +0100
Message-ID: <20200714154542.18064-3-andrei.ziureaev@arm.com>
References: <20200714154542.18064-1-andrei.ziureaev@arm.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200714154542.18064-1-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Differentiate between the /bits/ 8 <...> and [...] formats in dts output
by adding a TYPE_BYTESTRING type. This could be useful if we later end
up exporting the internal livetree to plugins.

Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
---
 dtc-parser.y                    |  2 +-
 dtc.h                           |  1 +
 tests/type-preservation.dt.yaml |  2 ++
 tests/type-preservation.dts     |  6 ++++--
 treesource.c                    | 24 +++++++++++++++---------
 5 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/dtc-parser.y b/dtc-parser.y
index a0316a3..c8c1875 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -520,7 +520,7 @@ integer_unary:
 bytestring:
 	  /* empty */
 		{
-			$$ = data_add_marker(empty_data, TYPE_UINT8, NULL);
+			$$ = data_add_marker(empty_data, TYPE_BYTESTRING, NULL);
 		}
 	| bytestring DT_BYTE
 		{
diff --git a/dtc.h b/dtc.h
index a08f415..e3225ab 100644
--- a/dtc.h
+++ b/dtc.h
@@ -100,6 +100,7 @@ enum markertype {
 	TYPE_UINT32,
 	TYPE_UINT64,
 	TYPE_STRING,
+	TYPE_BYTESTRING,
 };
 extern const char *markername(enum markertype markertype);
 
diff --git a/tests/type-preservation.dt.yaml b/tests/type-preservation.dt.yaml
index ee8cfde..98f05df 100644
--- a/tests/type-preservation.dt.yaml
+++ b/tests/type-preservation.dt.yaml
@@ -5,6 +5,8 @@
     compatible: ["subnode1"]
     reg: [[0x1]]
     int-array: [[0x0, 0x1], [0x2, 0x3]]
+    byte: [!u8 [0x56]]
+    bytestring: [!u8 [0x0, 0x12, 0x34, 0x56]]
     int8: [!u8 [0x56]]
     int8-array: [!u8 [0x0, 0x12, 0x34, 0x56]]
     int16: [!u16 [0x3210]]
diff --git a/tests/type-preservation.dts b/tests/type-preservation.dts
index 3e380ba..24c9eeb 100644
--- a/tests/type-preservation.dts
+++ b/tests/type-preservation.dts
@@ -8,8 +8,10 @@
 		prop_label: compatible = value_label: "subnode1";
 		reg = <0x01>;
 		int-array = <0x00 0x01>, int_value_label: <0x02 0x03>;
-		int8 = [56];
-		int8-array = [00 12 34 56] label:;
+		byte = [56];
+		bytestring = [00 12 34 56] label:;
+		int8 = /bits/ 8 <0x56>;
+		int8-array = /bits/ 8 <0x00 0x12 0x34 0x56> int8_label:;
 		int16 = /bits/ 16 <0x3210>;
 		int16-array = /bits/ 16 <0x1234 0x5678 0x90ab 0xcdef>;
 		int16-matrix = /bits/ 16 <0x1234 0x5678>, <0x90ab 0xcdef>;
diff --git a/treesource.c b/treesource.c
index 061ba8c..322d9e7 100644
--- a/treesource.c
+++ b/treesource.c
@@ -99,7 +99,8 @@ static void write_propval_string(FILE *f, const char *s, size_t len)
 	fprintf(f, "\"");
 }
 
-static void write_propval_int(FILE *f, const char *p, size_t len, size_t width)
+static void write_propval_int(FILE *f, struct marker *markers,
+			      const char *p, size_t len, size_t width)
 {
 	const char *end = p + len;
 	assert(len % width == 0);
@@ -107,7 +108,10 @@ static void write_propval_int(FILE *f, const char *p, size_t len, size_t width)
 	for (; p < end; p += width) {
 		switch (width) {
 		case 1:
-			fprintf(f, "%02"PRIx8, *(const uint8_t*)p);
+			if (markers->type == TYPE_BYTESTRING)
+				fprintf(f, "%02"PRIx8, *(const uint8_t*)p);
+			else
+				fprintf(f, "0x%02"PRIx8, *(const uint8_t*)p);
 			break;
 		case 2:
 			fprintf(f, "0x%02"PRIx16, dtb_ld16(p));
@@ -146,18 +150,20 @@ size_t type_marker_length(struct marker *m)
 }
 
 static const char *delim_start[] = {
-	[TYPE_UINT8] = "[",
+	[TYPE_UINT8] = "/bits/ 8 <",
 	[TYPE_UINT16] = "/bits/ 16 <",
 	[TYPE_UINT32] = "<",
 	[TYPE_UINT64] = "/bits/ 64 <",
 	[TYPE_STRING] = "",
+	[TYPE_BYTESTRING] = "[",
 };
 static const char *delim_end[] = {
-	[TYPE_UINT8] = "]",
+	[TYPE_UINT8] = ">",
 	[TYPE_UINT16] = ">",
 	[TYPE_UINT32] = ">",
 	[TYPE_UINT64] = ">",
 	[TYPE_STRING] = "",
+	[TYPE_BYTESTRING] = "]",
 };
 
 static enum markertype guess_value_type(struct property *prop)
@@ -190,7 +196,7 @@ static enum markertype guess_value_type(struct property *prop)
 		return TYPE_UINT32;
 	}
 
-	return TYPE_UINT8;
+	return TYPE_BYTESTRING;
 }
 
 static void write_propval(FILE *f, struct property *prop)
@@ -245,19 +251,19 @@ static void write_propval(FILE *f, struct property *prop)
 
 		switch(emit_type) {
 		case TYPE_UINT16:
-			write_propval_int(f, p, chunk_len, 2);
+			write_propval_int(f, m, p, chunk_len, 2);
 			break;
 		case TYPE_UINT32:
-			write_propval_int(f, p, chunk_len, 4);
+			write_propval_int(f, m, p, chunk_len, 4);
 			break;
 		case TYPE_UINT64:
-			write_propval_int(f, p, chunk_len, 8);
+			write_propval_int(f, m, p, chunk_len, 8);
 			break;
 		case TYPE_STRING:
 			write_propval_string(f, p, chunk_len);
 			break;
 		default:
-			write_propval_int(f, p, chunk_len, 1);
+			write_propval_int(f, m, p, chunk_len, 1);
 		}
 
 		if (chunk_len == data_len) {
-- 
2.17.1

