Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF6D38A9DB
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Feb 2026 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744878; cv=none; b=NrQe8gKAxcwpqx/QDqMCOuRg4kvuS3dZ7I4ZxcK/B7OJQr3WQ2hZvYh6JI1SEbBEnWSMEnO0IX6zDGAaRuD+LoNLyGAJOSK5wAd2Fub9WRxEMQDyorBe+qwsiUDxB1jGWfTuyl2SffqLrnZtILzUmN2p5EXjjMvjBnqtQgqzf/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744878; c=relaxed/simple;
	bh=6oSS3Gjaq5pHhOjJKcEyJyHC93xQI35PkBt/9oTWx8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/DpddWMfRONlmxb1fVEtUebvcXWY2D6o47JmlS7wJfsmK+9QGb6gg3JdW0PftspfZxVjix6r6tP+6UotXzNypORoQLlOOJSJoeXW0bkVWt/IlHPPaMar6V1VzNK8X9jQeSiS3V41NtruMwfnGFOd+1nGAOCqiDqSleIaR3YQQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BFc8JhG3; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BFc8JhG3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E570DC8F450;
	Tue, 10 Feb 2026 17:34:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 860C9606BD;
	Tue, 10 Feb 2026 17:34:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C8B810B921D3;
	Tue, 10 Feb 2026 18:34:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770744874; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cRSd/rE0sOqm3dI53YYlvF6U6UePz1Pna27Ugbu+jEQ=;
	b=BFc8JhG3YWPJfIopswd+qeoY5P3GKsvGF8+jGdCHiYS+JVZHWviNik/zCTNIurXkJMRXz+
	utMSxpi3x/UK/ojievODKwcXAjkW0IPUUhmVDXEPfwp0++QV8ufwHycgLLL/UwmhDoVbxT
	uyMqbgxwpAFt2SY0ejPnFYAmG90ptNRHPh6LhqOrOOy/Ls597q6NWQ1+eOQIlPIWlvJS2v
	QUiU/JL0aq+CuvrQMk157LDKNzdt9HSvyGLM8ARTZmLROoqa/9sycAL1PiEiuJWvvuhFKa
	lNPl7TF7LFm5ix/9vMJ+jOGp3on54Ws73OG9A7mzkYHPMev+Y1Ao368PPJqpoA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH 10/15] fdtdump: Handle unknown tags
Date: Tue, 10 Feb 2026 18:33:38 +0100
Message-ID: <20260210173349.636766-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210173349.636766-1-herve.codina@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
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

Handle those structured tag.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 fdtdump.c                              |  45 +++++++++-
 tests/dumptrees.c                      |   4 +-
 tests/run_tests.sh                     |  41 +++++++++
 tests/testdata.h                       |   2 +
 tests/trees.S                          | 110 +++++++++++++++++++++++++
 tests/unknown_tags_can_skip.dtb.expect |  26 ++++++
 6 files changed, 224 insertions(+), 4 deletions(-)
 create mode 100644 tests/unknown_tags_can_skip.dtb.expect

diff --git a/fdtdump.c b/fdtdump.c
index 0e7a265..eb8cda9 100644
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
+			case FDT_TAG_DATA_LNG:
+				/* Get the length */
+				sz = fdt32_to_cpu(GET_CELL(p));
+				break;
+			}
+
+			if (dump_unknown) {
+				printf("%*s// Unknown tag ignored: 0x%08"PRIx32", data lng %d",
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
+	"Dump unknown tags information while decoding the file (-uu to have data)",
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
diff --git a/tests/dumptrees.c b/tests/dumptrees.c
index 08967b3..4732fff 100644
--- a/tests/dumptrees.c
+++ b/tests/dumptrees.c
@@ -25,7 +25,9 @@ static struct {
 	TREE(truncated_property), TREE(truncated_string),
 	TREE(truncated_memrsv),
 	TREE(two_roots),
-	TREE(named_root)
+	TREE(named_root),
+	TREE(unknown_tags_can_skip),
+	TREE(unknown_tags_no_skip)
 };
 
 #define NUM_TREES	(sizeof(trees) / sizeof(trees[0]))
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f07092b..b69b61b 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -196,6 +196,40 @@ check_align () {
     )
 }
 
+# $1: f1 file
+# $2: f2 file
+check_diff () {
+    printf "diff $1 $2:	"
+    local f1="$1"
+    local f2="$2"
+    (
+        if diff $f1 $f2 >/dev/null; then
+            PASS
+        else
+            if [ -z "$QUIET_TEST" ]; then
+                echo "DIFF :-:"
+                diff -u $f1 $f2
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
@@ -1007,6 +1041,13 @@ utilfdt_tests () {
 
 fdtdump_tests () {
     run_fdtdump_test "$SRCDIR/fdtdump.dts"
+
+    base_run_test wrap_fdtdump unknown_tags_can_skip.dtb unknown_tags_can_skip.dtb.out
+    # Remove unneeded comments
+    sed -i '/^\/\/ /d' unknown_tags_can_skip.dtb.out
+    base_run_test check_diff unknown_tags_can_skip.dtb.out "$SRCDIR/unknown_tags_can_skip.dtb.expect"
+
+    run_wrap_error_test $FDTDUMP unknown_tags_no_skip.dtb
 }
 
 fdtoverlay_tests() {
diff --git a/tests/testdata.h b/tests/testdata.h
index fcebc2c..aef04ab 100644
--- a/tests/testdata.h
+++ b/tests/testdata.h
@@ -57,4 +57,6 @@ extern struct fdt_header truncated_string;
 extern struct fdt_header truncated_memrsv;
 extern struct fdt_header two_roots;
 extern struct fdt_header named_root;
+extern struct fdt_header unknown_tags_can_skip;
+extern struct fdt_header unknown_tags_no_skip;
 #endif /* ! __ASSEMBLER__ */
diff --git a/tests/trees.S b/tests/trees.S
index 4db2b9b..221c9fd 100644
--- a/tests/trees.S
+++ b/tests/trees.S
@@ -328,3 +328,113 @@ named_root_strings:
 named_root_strings_end:
 
 named_root_end:
+
+
+	/* Tree with "unknown" tags that can be skipped
+	 * Use a really future dtb version to check version downgrade on
+	 * modification.
+	 */
+	treehdr_vers	unknown_tags_can_skip 0xffffffff 0x10
+	empty_rsvmap	unknown_tags_can_skip
+
+unknown_tags_can_skip_struct:
+	fdtlong	FDT_TEST_1CELL_CAN_SKIP
+	fdtlong	0x1
+
+	beginn	""
+		fdtlong	FDT_TEST_NONE_CAN_SKIP
+
+		propu32	unknown_tags_can_skip, prop_int, 1
+
+		fdtlong	FDT_TEST_1CELL_CAN_SKIP
+		fdtlong	0x11
+
+		propstr	unknown_tags_can_skip, prop_str, "abcd"
+
+		fdtlong	FDT_TEST_2CELLS_CAN_SKIP
+		fdtlong	0x12
+		fdtlong	0x12
+
+		fdtlong	FDT_TEST_LNG_CAN_SKIP
+		fdtlong	3
+		.byte 0x13
+		.byte 0x13
+		.byte 0x13
+		.byte 0 /* padding */
+
+		beginn	"subnode1"
+			propu64	unknown_tags_can_skip, prop_int, 1, 2
+			fdtlong	FDT_TEST_NONE_CAN_SKIP
+		endn
+
+		beginn	"subnode2"
+			fdtlong	FDT_TEST_1CELL_CAN_SKIP
+			fdtlong	0x121
+			propu64	unknown_tags_can_skip, prop_int1, 1, 2
+			fdtlong	FDT_TEST_1CELL_CAN_SKIP
+			fdtlong	0x122
+			propu64	unknown_tags_can_skip, prop_int2, 1, 2
+			beginn	"subsubnode"
+				fdtlong	FDT_TEST_1CELL_CAN_SKIP
+				fdtlong	0x123
+				propu64	unknown_tags_can_skip, prop_int, 1, 2
+			endn
+			fdtlong	FDT_TEST_1CELL_CAN_SKIP
+			fdtlong	0x124
+		endn
+
+		fdtlong	FDT_TEST_LNG_CAN_SKIP
+		fdtlong	5
+		.byte 0x14
+		.byte 0x14
+		.byte 0x14
+		.byte 0x14
+		.byte 0x14
+		.byte 0 /* padding */
+		.byte 0 /* padding */
+		.byte 0 /* padding */
+	endn
+
+	fdtlong	FDT_TEST_1CELL_CAN_SKIP
+	fdtlong	0x2
+
+	fdtlong	FDT_TEST_LNG_CAN_SKIP
+	fdtlong	2
+	.byte 0x3
+	.byte 0x3
+	.byte 0 /* padding */
+	.byte 0 /* padding */
+
+	fdtlong	FDT_END
+
+unknown_tags_can_skip_struct_end:
+
+unknown_tags_can_skip_strings:
+	string	unknown_tags_can_skip, prop_int, "prop-int"
+	string	unknown_tags_can_skip, prop_int1, "prop-int1"
+	string	unknown_tags_can_skip, prop_int2, "prop-int2"
+	string	unknown_tags_can_skip, prop_str, "prop-str"
+unknown_tags_can_skip_strings_end:
+
+unknown_tags_can_skip_end:
+
+
+	/* Tree with "unknown" tags that cannot be skipped */
+	treehdr	unknown_tags_no_skip
+	empty_rsvmap	unknown_tags_no_skip
+
+unknown_tags_no_skip_struct:
+	beginn	""
+	fdtlong	FDT_TEST_NONE_NO_SKIP
+		beginn	"subnode1"
+			propu64	unknown_tags_no_skip, prop_int, 1, 2
+		endn
+	endn
+	fdtlong	FDT_END
+unknown_tags_no_skip_struct_end:
+
+unknown_tags_no_skip_strings:
+	string	unknown_tags_no_skip, prop_int, "prop-int"
+unknown_tags_no_skip_strings_end:
+
+unknown_tags_no_skip_end:
diff --git a/tests/unknown_tags_can_skip.dtb.expect b/tests/unknown_tags_can_skip.dtb.expect
new file mode 100644
index 0000000..32e3f46
--- /dev/null
+++ b/tests/unknown_tags_can_skip.dtb.expect
@@ -0,0 +1,26 @@
+/dts-v1/;
+
+/ {
+    // Unknown tag ignored: 0xc0000000, data lng 0
+    prop-int = <0x00000001>;
+    // Unknown tag ignored: 0xd0000000, data lng 4 00000011
+    prop-str = "abcd";
+    // Unknown tag ignored: 0xe0000000, data lng 8 0000001200000012
+    // Unknown tag ignored: 0xf0000000, data lng 3 131313
+    subnode1 {
+        prop-int = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xc0000000, data lng 0
+    };
+    subnode2 {
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000121
+        prop-int1 = <0x00000001 0x00000002>;
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000122
+        prop-int2 = <0x00000001 0x00000002>;
+        subsubnode {
+            // Unknown tag ignored: 0xd0000000, data lng 4 00000123
+            prop-int = <0x00000001 0x00000002>;
+        };
+        // Unknown tag ignored: 0xd0000000, data lng 4 00000124
+    };
+    // Unknown tag ignored: 0xf0000000, data lng 5 1414141414
+};
-- 
2.52.0

