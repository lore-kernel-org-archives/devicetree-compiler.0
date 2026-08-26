Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC403B9D80;
	Wed, 26 Aug 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733177; cv=none; b=aDJlPbCm95E43niSfXU4IaBA11oQCxhgk8LPbb7IZ6VvjMUfRuI1aGxIwhHu1CmSIw09pn7g+3xLBiUz2E1wEdbtGD9qtyNk+b6JLV/sO32yKngtro9FjtNDBHfbc6veffiXau7izg0Q5fh4N/bkQpcVpcb071PRGRqEtOxb9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733177; c=relaxed/simple;
	bh=mWWP/Mq0dmFdgdQKWf3OHgWJSShbhrYNhKhwhXn55+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7oRIyxH02KkwTMN8CJ1JAf++GklNMD275jmJy5hq50RFAx2YKIOJDRQxdIy7O0HKQrCH8CRA9S/Rdpks4EpzmaefVZgS94NCkS6N+TInOZgyK5ai8uddOxhFp7AUxrgGEKigMf7H+ITPBx04YrcCy9BtMfF+BYeUFg0eP+PO2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LE9od/ZQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LE9od/ZQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F15901A1844;
	Wed, 26 Aug 2026 08:32:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDB99604EC;
	Wed, 26 Aug 2026 08:32:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31EDA11C7AB70;
	Wed, 26 Aug 2026 10:32:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733172; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yf3H7SVuVcK0WphDMYA5ife05YxHxK0TfuE9N0nAOHA=;
	b=LE9od/ZQYf70EGAzsm3LuS4UK4FRmS1yeUkQezXZDF/kZ9Uahwe9b0pl4Uj7FtDM/XrcNk
	27E1QHj7d+75RgDYSE5ZJsg8At0bDe5UqjLZAYIzeGousaSu8tgmC3Oo6CTjkOSjr0/STZ
	BESXVeAT/jKa5GoQ6Fu2Elux4Gw8vgGzzJ0vQLvuxAE3UZ57zwtizuc/JbbyQjM0wnzwpe
	WeWUk3RSg9qXkSQhc80lOvP2LmdeUzPABDO9eCZf9MqSlvC0nv094h9X2Hw8ou6aGXV9aP
	voSO4Lp4POEtq608a8dNWNPP2nbTFa7SZhDkyZvt1v41e+ZuAiHUK3EA9QFjZA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 07/15] fdtdump: Handle unknown tags
Date: Wed, 26 Aug 2026 10:31:38 +0200
Message-ID: <20260826083146.304291-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826083146.304291-1-herve.codina@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The structured tag value definition introduced recently gives the
ability to ignore unknown tags without any error when they are read.

Add support for those structured tags in fdtdump and introduce a command
line option to dump unknown tags that should be ignored.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 fdtdump.c                              |  45 ++++++-
 tests/Makefile.tests                   |   3 +-
 tests/meson.build                      |   2 +
 tests/run_tests.sh                     |  41 +++++++
 tests/treegen.c                        | 162 +++++++++++++++++++++++++
 tests/unknown_tags_can_skip.dtb.expect |  29 +++++
 6 files changed, 278 insertions(+), 4 deletions(-)
 create mode 100644 tests/unknown_tags_can_skip.dtb.expect

diff --git a/fdtdump.c b/fdtdump.c
index 0e7a2659..7a8b2784 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -44,7 +44,7 @@ static const char *tagname(uint32_t tag)
 #define dumpf(fmt, args...) \
 	do { if (debug) printf("// " fmt, ## args); } while (0)
 
-static void dump_blob(void *blob, bool debug)
+static void dump_blob(void *blob, bool debug, int dump_unknown)
 {
 	uintptr_t blob_off = (uintptr_t)blob;
 	struct fdt_header *bph = blob;
@@ -146,20 +146,55 @@ static void dump_blob(void *blob, bool debug)
 			continue;
 		}
 
+		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
+			sz = 0;
+			switch (tag & FDT_TAG_DATA_MASK) {
+			case FDT_TAG_DATA_NONE:
+				break;
+			case FDT_TAG_DATA_1CELL:
+				sz = FDT_CELLSIZE;
+				break;
+			case FDT_TAG_DATA_2CELLS:
+				sz = 2 * FDT_CELLSIZE;
+				break;
+			case FDT_TAG_DATA_VARLEN:
+				/* Get the length */
+				sz = fdt32_to_cpu(GET_CELL(p));
+				break;
+			}
+
+			if (dump_unknown) {
+				printf("%*s// Unknown tag ignored: 0x%08"PRIx32", data len %d",
+				       depth * shift, "", tag, sz);
+				if (dump_unknown > 1 && sz != 0) {
+					printf(" ");
+					for (i = 0; i < sz; i++)
+						printf("%02hhx", *(p + i));
+				}
+				printf("\n");
+			}
+
+			/* Skip the data bytes */
+			p = PALIGN(p + sz, 4);
+			continue;
+		}
+
 		die("** Unknown tag 0x%08"PRIx32"\n", tag);
 	}
 }
 
 /* Usage related data. */
 static const char usage_synopsis[] = "fdtdump [options] <file>";
-static const char usage_short_opts[] = "ds" USAGE_COMMON_SHORT_OPTS;
+static const char usage_short_opts[] = "dus" USAGE_COMMON_SHORT_OPTS;
 static struct option const usage_long_opts[] = {
 	{"debug",            no_argument, NULL, 'd'},
+	{"unknown",          no_argument, NULL, 'u'},
 	{"scan",             no_argument, NULL, 's'},
 	USAGE_COMMON_LONG_OPTS
 };
 static const char * const usage_opts_help[] = {
 	"Dump debug information while decoding the file",
+	"Dump unknown tags information while decoding the file (-uu to dump data)",
 	"Scan for an embedded fdt in file",
 	USAGE_COMMON_OPTS_HELP
 };
@@ -183,6 +218,7 @@ int main(int argc, char *argv[])
 	const char *file;
 	char *buf;
 	bool debug = false;
+	int dump_unknown = 0;
 	bool scan = false;
 	size_t len;
 
@@ -198,6 +234,9 @@ int main(int argc, char *argv[])
 		case 'd':
 			debug = true;
 			break;
+		case 'u':
+			dump_unknown++;
+			break;
 		case 's':
 			scan = true;
 			break;
@@ -242,7 +281,7 @@ int main(int argc, char *argv[])
 	} else if (!valid_header(buf, len))
 		die("%s: header is not valid\n", file);
 
-	dump_blob(buf, debug);
+	dump_blob(buf, debug, dump_unknown);
 
 	return 0;
 }
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index af5d309c..63e201ae 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -44,7 +44,8 @@ TESTS = $(LIB_TESTS) $(DL_LIB_TESTS)
 TESTS_TREES_L = test_tree1.dtb bad_node_char.dtb bad_node_format.dtb \
 	bad_prop_char.dtb ovf_size_strings.dtb truncated_property.dtb \
 	truncated_string.dtb truncated_memrsv.dtb unterminated_memrsv.dtb \
-	two_roots.dtb named_root.dtb
+	two_roots.dtb named_root.dtb unknown_tags_can_skip.dtb \
+	unknown_tags_no_skip.dtb
 TESTS_TREES = $(TESTS_TREES_L:%=$(TESTS_PREFIX)%)
 
 TESTS_TARGETS = $(TESTS) $(TESTS_TREES)
diff --git a/tests/meson.build b/tests/meson.build
index c6ac2d7f..779e6bc7 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -17,6 +17,8 @@ treegen_dtb = custom_target(
     'unterminated_memrsv.dtb',
     'two_roots.dtb',
     'named_root.dtb',
+    'unknown_tags_can_skip.dtb',
+    'unknown_tags_no_skip.dtb',
   ]
 )
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 842b5430..f3647e63 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -196,6 +196,40 @@ check_align () {
     )
 }
 
+# $1: generated file
+# $2: expected file
+check_diff () {
+    printf "check_diff $1 $2:	"
+    local fgen="$1"
+    local fref="$2"
+    (
+        if diff $fref $fgen >/dev/null; then
+            PASS
+        else
+            if [ -z "$QUIET_TEST" ]; then
+                echo "DIFF :-:"
+                diff -u $fref $fgen
+            fi
+            FAIL "Results differ from expected"
+        fi
+    )
+}
+
+# $1: dtb file
+# $2: out file
+wrap_fdtdump () {
+    printf "wrap_fdtdump -uu $1:	"
+    local dtb="$1"
+    local out="$2"
+    (
+        if $FDTDUMP -uu ${dtb} 2>/dev/null >${out}; then
+            PASS
+        else
+            FAIL
+        fi
+    )
+}
+
 run_dtc_test () {
     printf "dtc $*:	"
     base_run_test wrap_test $VALGRIND $DTC "$@"
@@ -1008,6 +1042,13 @@ utilfdt_tests () {
 
 fdtdump_tests () {
     run_fdtdump_test "$SRCDIR/fdtdump.dts"
+
+    base_run_test wrap_fdtdump unknown_tags_can_skip.dtb unknown_tags_can_skip.dtb.out
+    # Remove unneeded comments
+    sed -i '/^\/\/ [^U]/d' unknown_tags_can_skip.dtb.out
+    base_run_test check_diff unknown_tags_can_skip.dtb.out "$SRCDIR/unknown_tags_can_skip.dtb.expect"
+
+    run_wrap_error_test $FDTDUMP unknown_tags_no_skip.dtb
 }
 
 fdtoverlay_tests() {
diff --git a/tests/treegen.c b/tests/treegen.c
index 28943d43..f07c8963 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -707,6 +707,166 @@ static struct buf make_named_root(void)
 	return b;
 }
 
+/* Tree with "unknown" tags that can be skipped
+ * Use a really future dtb version to check version downgrade on
+ * modification.
+ */
+static struct buf make_unknown_tags_can_skip(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p_int, p_str;
+	size_t p_sn1_int;
+	size_t p_sn2_int1, p_sn2_int2;
+	size_t p_sn2ssn_bool;
+
+	hdr = emit_fdt_header_vers(&b, 0xffffffff, 0x10);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_u32(&b, FDT_TEST_1CELL_CAN_SKIP);
+		emit_u32(&b, 0x1);
+
+		emit_begin_node(&b, "");
+			emit_u32(&b, FDT_TEST_NONE_CAN_SKIP);
+
+			p_int = emit_prop_u32(&b, 0, 0x3201);
+
+			emit_u32(&b, FDT_TEST_1CELL_CAN_SKIP);
+			emit_u32(&b, 0x110);
+
+			p_str = emit_prop_str(&b, 0, "abcd");
+
+			emit_u32(&b, FDT_TEST_2CELLS_CAN_SKIP);
+			emit_u32(&b, 0x120);
+			emit_u32(&b, 0x121);
+
+			emit_u32(&b, FDT_TEST_VARLEN_CAN_SKIP);
+			emit_u32(&b, 3);
+			emit_bytes(&b, (const uint8_t []){0x10, 0x11, 0x12}, 3);
+			emit_align(&b, FDT_TAGSIZE);
+
+			emit_begin_node(&b, "subnode1");
+				p_sn1_int = emit_prop_u64(&b, 0, 0x640100006402);
+				emit_u32(&b, FDT_TEST_NONE_CAN_SKIP);
+			emit_end_node(&b);
+
+			emit_begin_node(&b, "subnode2");
+				emit_u32(&b, FDT_TEST_1CELL_CAN_SKIP);
+				emit_u32(&b, 0x121);
+
+				p_sn2_int1 = emit_prop_u64(&b, 0, 0x6402000064021);
+
+				emit_u32(&b, FDT_TEST_2CELLS_CAN_SKIP);
+				emit_u32(&b, 0x1220);
+				emit_u32(&b, 0x1221);
+
+				p_sn2_int2 = emit_prop_u32(&b, 0, 0x32022);
+
+				emit_begin_node(&b, "subsubnode");
+					emit_u32(&b, FDT_TEST_2CELLS_CAN_SKIP);
+					emit_u32(&b, 0x1230);
+					emit_u32(&b, 0x1231);
+					p_sn2ssn_bool = emit_prop_nil(&b, 0);
+				emit_end_node(&b);
+
+				emit_u32(&b, FDT_TEST_VARLEN_CAN_SKIP);
+				emit_u32(&b, 3);
+				emit_bytes(&b, (const uint8_t []){0x21, 0x22, 0x23}, 3);
+				emit_align(&b, FDT_TAGSIZE);
+			emit_end_node(&b);
+
+			emit_u32(&b, FDT_TEST_VARLEN_CAN_SKIP);
+			emit_u32(&b, 4);
+			emit_bytes(&b, (const uint8_t []){0x31, 0x32, 0x33, 0x34}, 4);
+			emit_align(&b, FDT_TAGSIZE);
+		emit_end_node(&b);
+
+		emit_u32(&b, FDT_TEST_1CELL_CAN_SKIP);
+		emit_u32(&b, 0x2);
+
+		emit_u32(&b, FDT_TEST_VARLEN_CAN_SKIP);
+		emit_u32(&b, 2);
+		emit_bytes(&b, (const uint8_t []){0x40, 0x41}, 2);
+		emit_align(&b, FDT_TAGSIZE);
+
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+		size_t s;
+
+		s = emit_string(&b, "prop-int");
+		fill_prop_name(&b, strs, p_int, s);
+		fill_prop_name(&b, strs, p_sn1_int, s);
+
+		s = emit_string(&b, "prop-str");
+		fill_prop_name(&b, strs, p_str, s);
+
+		s = emit_string(&b, "prop-int1");
+		fill_prop_name(&b, strs, p_sn2_int1, s);
+
+		s = emit_string(&b, "prop-int2");
+		fill_prop_name(&b, strs, p_sn2_int2, s);
+
+		s = emit_string(&b, "prop-bool");
+		fill_prop_name(&b, strs, p_sn2ssn_bool, s);
+
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+/* Tree with "unknown" tags that cannot be skipped */
+static struct buf make_unknown_tags_no_skip(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p_prop_u64;
+
+	hdr = emit_fdt_header_vers(&b, 0xffffffff, 0x10);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+			emit_u32(&b, FDT_TEST_NONE_NO_SKIP);
+
+			emit_begin_node(&b, "subnode1");
+				p_prop_u64 = emit_prop_u64(&b, 0, 0x100000002);
+			emit_end_node(&b);
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+		size_t s;
+
+		s = emit_string(&b, "prop-int");
+		fill_prop_name(&b, strs, p_prop_u64, s);
+
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
 /* Tree table and main */
 
 static struct {
@@ -722,6 +882,8 @@ static struct {
 	TREE(unterminated_memrsv),
 	TREE(two_roots),
 	TREE(named_root),
+	TREE(unknown_tags_can_skip),
+	TREE(unknown_tags_no_skip),
 };
 
 int main(int argc, char *argv[])
diff --git a/tests/unknown_tags_can_skip.dtb.expect b/tests/unknown_tags_can_skip.dtb.expect
new file mode 100644
index 00000000..5ad9964e
--- /dev/null
+++ b/tests/unknown_tags_can_skip.dtb.expect
@@ -0,0 +1,29 @@
+/dts-v1/;
+
+// Unknown tag ignored: 0xd0000000, data len 4 00000001
+/ {
+    // Unknown tag ignored: 0xc0000000, data len 0
+    prop-int = <0x00003201>;
+    // Unknown tag ignored: 0xd0000000, data len 4 00000110
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data len 8 0000012000000121
+    // Unknown tag ignored: 0xf0000000, data len 3 101112
+    subnode1 {
+        prop-int = <0x00006401 0x00006402>;
+        // Unknown tag ignored: 0xc0000000, data len 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data len 4 00000121
+        prop-int1 = <0x00064020 0x00064021>;
+        // Unknown tag ignored: 0xe0000000, data len 8 0000122000001221
+        prop-int2 = <0x00032022>;
+        subsubnode {
+            // Unknown tag ignored: 0xe0000000, data len 8 0000123000001231
+            prop-bool;
+        };
+        // Unknown tag ignored: 0xf0000000, data len 3 212223
+    };
+    // Unknown tag ignored: 0xf0000000, data len 4 31323334
+};
+// Unknown tag ignored: 0xd0000000, data len 4 00000002
+// Unknown tag ignored: 0xf0000000, data len 2 4041
-- 
2.55.0

