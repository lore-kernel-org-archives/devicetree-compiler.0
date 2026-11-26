Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692249;
	b=VTT5y2qyFhmLdhvzrIg5IiRJn2f7aF8AROpG3kjK95qEj9ilz9bxkWombVf8ww+07ARz
	 THcNOyDnsJx8BK3ezsqRZu5A/XZiZlOGcrpmGiBUiT4C4KDbQ67BOfbwRSgCwNoyo6avc
	 1/laV+uFnu6arrSEvPJh7PrtSXNC3FiWaOh9xmv5l+t75M7R2JwB0jmyvdAQ56QdwAYam
	 bE1B0LYQOhX1O8eabFgE9VnMu5UHWVuQX64QPbMHGyY/0OB+X4o22qX4qqemtmgJvHxu8
	 ywy7AuffFoEFks8CRmT471MhphpjhROuaq/FKYpEI3UcjnP6TV6Pz2PEgRKwjXKOw4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692249;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=NmgXVNFXoxvBcXwk+YdolEolybPU5GlFzLJkBSY3fw4=;
	b=HVNjTkScFCsDQ5oelOKXi9Vge21mKx+4x1chbvWMQ487sOlgcMHcQuNKeVPczw3wi12a
	 SwCKVzapD5Ha8G4f3GGxEHyhm5Serl3DIX569zB2XFGHfSltqsgtASzL93bbZNrdzwcze
	 8pU7sRfxO+uEPhaxi32WsJ3wGAiTpJzfwnBJjL7GFYxqql0PW56t2Kdr4kDVOu9/9h4QW
	 uyWoBqdUCLn6Eqfdfe0VB5wO6EbZ2YZV12dkCJ7/NcHnrdNgoM4EYfkZBNT8orpK838Kf
	 gFMVh/C7K/F0hsGCrq6IDhJjpFq3DYXVjOM31xuYZIIfofMy9QthuxLjLPgtCI9ap5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=db0WuFA9;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D43606A32A;
	Thu, 26 Nov 2026 11:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D43606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=db0WuFA9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 234021A1807;
	Thu, 26 Nov 2026 11:24:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9C7B60237;
	Thu, 26 Nov 2026 11:24:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 647CD11E6B36B;
	Thu, 26 Nov 2026 12:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692241; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=NmgXVNFXoxvBcXwk+YdolEolybPU5GlFzLJkBSY3fw4=;
	b=db0WuFA9TbxuB0IgksOqd0aVhgOcjvuA0CL+mOS77250hI9gnj/ipJWz3ksBznxum6iUM+
	xn2AFIK9W2LiCtKeBZn1k4DX5KRYysZeW6WjVMIolSbfRJEbmd9NHTZNSsnd0D/QrPvA+d
	rLqa9YaFuC5zapr9oAPMtKxcNpOvpyWzOr9oLmpbOO3Qv9Ql80SG/k47UQTOXljw24EK+5
	kq7zeNIpE2BHYZTaXW0qUGqpCrtEog6Njpd7n5JpwhFGTMdCnaP89Hmjng5ogEB0SB4fAl
	8d0gx1TPPgBMhENyLUPJD9+E0y28VuFZfaTFG357XbNToI5F0Wxkrl8q09nikA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
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
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v4 11/22] tests: treegen: Move base harness trees to treegen_base.c
Date: Thu, 26 Nov 2026 12:22:28 +0100
Message-ID: <20261126112239.636284-12-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Harnesses have been recently introduced and tree generation primitives
are accessible from outside treegen.c.

Simplify treegen.c by moving the base harness trees to their specific
file: treegen_base.c.

No functional changes.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/Makefile.tests |   6 +
 tests/meson.build    |   5 +-
 tests/treegen.c      | 573 +------------------------------------------
 tests/treegen_base.c | 551 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 563 insertions(+), 572 deletions(-)
 create mode 100644 tests/treegen_base.c

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index f6b22fbd..cc35c66a 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -71,6 +71,12 @@ $(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o util.o $(LIBFDT_dep)
 	@$(VECHO) LD [libdl] $@
 	$(LINK.c) -o $@ $^ $(LIBDL)
 
+TREEGEN_OBJS =  $(TESTS_PREFIX)treegen.o \
+		$(TESTS_PREFIX)treegen_base.o
+
+$(TESTS_PREFIX)treegen: $(TREEGEN_OBJS)
+	$(LINK.c) -o $@ $^
+
 $(TESTS_TREES): $(TESTS_PREFIX)treegen
 	@$(VECHO) TREEGEN
 	cd $(TESTS_PREFIX); ./treegen . >/dev/null
diff --git a/tests/meson.build b/tests/meson.build
index 3d16ae23..1c530b71 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,4 +1,7 @@
-treegen = executable('treegen', files('treegen.c'),
+treegen = executable('treegen',
+                     files('treegen.c',
+                           'treegen_base.c'
+                     ),
                      build_by_default: false,
                      dependencies: [util_dep])
 
diff --git a/tests/treegen.c b/tests/treegen.c
index b65f8eb5..20b2de33 100644
--- a/tests/treegen.c
+++ b/tests/treegen.c
@@ -8,18 +8,14 @@
 #include <assert.h>
 #include <stdarg.h>
 #include <stdio.h>
-#include <stdlib.h>
 #include <string.h>
-#include <stdint.h>
 #include <unistd.h>
 #include <fcntl.h>
 
 #include <libfdt_env.h>
 #include <fdt.h>
 
-#include "testdata.h"
 #include "util.h"
-
 #include "treegen.h"
 
 #define CHUNKSIZE	1024
@@ -251,573 +247,8 @@ size_t emit_prop_strings_(struct buf *b, int nameoff, ...)
 	return off;
 }
 
-/*
- * Tree generators
- *
- * Each function builds a complete DTB in a buffer.
- */
-
-static struct buf make_test_tree1(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-	size_t p_compatible, p_prop_int, p_prop_int64, p_prop_str,
-	       p_address_cells, p_size_cells;
-	size_t p_s1_compatible, p_s1_reg, p_s1_prop_int;
-	size_t p_s1ss_compatible, p_s1ss_placeholder, p_s1ss_prop_int;
-	size_t p_s2_reg, p_s2_linux_phandle, p_s2_prop_int,
-	       p_s2_address_cells, p_s2_size_cells;
-	size_t p_s2ss0_reg, p_s2ss0_phandle, p_s2ss0_compatible,
-	       p_s2ss0_prop_int;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	{
-		size_t rsvmap = start_block(&b);
-
-		emit_rsvmap_entry(&b, TEST_ADDR_1, TEST_SIZE_1);
-		emit_rsvmap_entry(&b, TEST_ADDR_2, TEST_SIZE_2);
-		emit_rsvmap_term(&b);
-		finish_rsvmap(&b, hdr, rsvmap);
-	}
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		p_compatible = emit_prop_str(&b, 0, "test_tree1");
-		p_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_1);
-		p_prop_int64 = emit_prop_u64(&b, 0, TEST_VALUE64_1);
-		p_prop_str = emit_prop_str(&b, 0, TEST_STRING_1);
-		p_address_cells = emit_prop_u32(&b, 0, 1);
-		p_size_cells = emit_prop_u32(&b, 0, 0);
-
-		emit_begin_node(&b, "subnode@1");
-		p_s1_compatible = emit_prop_str(&b, 0, "subnode1");
-		p_s1_reg = emit_prop_u32(&b, 0, 1);
-		p_s1_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_1);
-
-		emit_begin_node(&b, "subsubnode");
-		p_s1ss_compatible = emit_prop_strings(&b, 0,
-						     "subsubnode1", "subsubnode");
-		p_s1ss_placeholder = emit_prop_strings(&b, 0,
-						       "this is a placeholder string",
-						       "string2");
-		p_s1ss_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_1);
-		emit_end_node(&b);
-
-		emit_begin_node(&b, "ss1");
-		emit_end_node(&b);
-
-		emit_end_node(&b);
-
-		emit_begin_node(&b, "subnode@2");
-		p_s2_reg = emit_prop_u32(&b, 0, 2);
-		p_s2_linux_phandle = emit_prop_u32(&b, 0, PHANDLE_1);
-		p_s2_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_2);
-		p_s2_address_cells = emit_prop_u32(&b, 0, 1);
-		p_s2_size_cells = emit_prop_u32(&b, 0, 0);
-
-		emit_begin_node(&b, "subsubnode@0");
-		p_s2ss0_reg = emit_prop_u32(&b, 0, 0);
-		p_s2ss0_phandle = emit_prop_u32(&b, 0, PHANDLE_2);
-		p_s2ss0_compatible = emit_prop_strings(&b, 0,
-						      "subsubnode2", "subsubnode");
-		p_s2ss0_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_2);
-		emit_end_node(&b);
-
-		emit_begin_node(&b, "ss2");
-		emit_end_node(&b);
-
-		emit_end_node(&b);
-
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	{
-		size_t strs = start_block(&b);
-		size_t s;
-
-		s = emit_string(&b, "compatible");
-		fill_prop_name(&b, strs, p_compatible, s);
-		fill_prop_name(&b, strs, p_s1_compatible, s);
-		fill_prop_name(&b, strs, p_s1ss_compatible, s);
-		fill_prop_name(&b, strs, p_s2ss0_compatible, s);
-
-		s = emit_string(&b, "prop-int");
-		fill_prop_name(&b, strs, p_prop_int, s);
-		fill_prop_name(&b, strs, p_s1_prop_int, s);
-		fill_prop_name(&b, strs, p_s1ss_prop_int, s);
-		fill_prop_name(&b, strs, p_s2_prop_int, s);
-		fill_prop_name(&b, strs, p_s2ss0_prop_int, s);
-
-		fill_prop_name(&b, strs, p_prop_int64,
-			       emit_string(&b, "prop-int64"));
-
-		fill_prop_name(&b, strs, p_prop_str,
-			       emit_string(&b, "prop-str"));
-
-		fill_prop_name(&b, strs, p_s2_linux_phandle,
-			       emit_string(&b, "linux,phandle"));
-
-		fill_prop_name(&b, strs, p_s2ss0_phandle,
-			       emit_string(&b, "phandle"));
-
-		s = emit_string(&b, "reg");
-		fill_prop_name(&b, strs, p_s1_reg, s);
-		fill_prop_name(&b, strs, p_s2_reg, s);
-		fill_prop_name(&b, strs, p_s2ss0_reg, s);
-
-		fill_prop_name(&b, strs, p_s1ss_placeholder,
-			       emit_string(&b, "placeholder"));
-
-		s = emit_string(&b, "#address-cells");
-		fill_prop_name(&b, strs, p_address_cells, s);
-		fill_prop_name(&b, strs, p_s2_address_cells, s);
-
-		s = emit_string(&b, "#size-cells");
-		fill_prop_name(&b, strs, p_size_cells, s);
-		fill_prop_name(&b, strs, p_s2_size_cells, s);
-
-		finish_strings_block(&b, hdr, strs);
-	}
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_truncated_property(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-	size_t p;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		p = emit_prop_header(&b, 0, 4);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	{
-		size_t strs = start_block(&b);
-
-		emit_string(&b, "truncated");
-		fill_prop_name(&b, strs, p, strs);
-		finish_strings_block(&b, hdr, strs);
-	}
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_bad_node_char(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		emit_begin_node(&b, "sub$node");
-		emit_end_node(&b);
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	finish_strings_block(&b, hdr, start_block(&b));
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_bad_node_format(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		emit_begin_node(&b, "subnode@1@2");
-		emit_end_node(&b);
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	finish_strings_block(&b, hdr, start_block(&b));
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_bad_prop_char(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-	size_t p;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		p = emit_prop_u32(&b, 0, TEST_VALUE_1);
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	{
-		size_t strs = start_block(&b);
-
-		fill_prop_name(&b, strs, p,
-			       emit_string(&b, "prop$erty"));
-		finish_strings_block(&b, hdr, strs);
-	}
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_ovf_size_strings(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		emit_prop_u32(&b, 0x10000000, 0);
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	{
-		size_t strs = start_block(&b);
-
-		emit_string(&b, "x");
-		finish_strings_block(&b, hdr, strs);
-	}
-
-	((struct fdt_header *)(b.data + hdr))->size_dt_strings =
-		cpu_to_fdt32(0xffffffff);
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_truncated_string(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-	size_t p_good, p_bad;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		p_good = emit_prop_nil(&b, 0);
-		p_bad = emit_prop_nil(&b, 0);
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	{
-		size_t strs = start_block(&b);
-
-		fill_prop_name(&b, strs, p_good, emit_string(&b, "good"));
-		fill_prop_name(&b, strs, p_bad, emit_bytes(&b, "bad", 3));
-		finish_strings_block(&b, hdr, strs);
-	}
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_truncated_memrsv(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-
-	hdr = emit_fdt_header(&b);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	finish_strings_block(&b, hdr, start_block(&b));
-
-	{
-		size_t rsvmap;
-
-		emit_align(&b, 8);
-		rsvmap = start_block(&b);
-		emit_rsvmap_entry(&b, TEST_ADDR_1, TEST_SIZE_1);
-		finish_rsvmap(&b, hdr, rsvmap);
-	}
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_unterminated_memrsv(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-
-	hdr = emit_fdt_header(&b);
-
-	{
-		size_t rsvmap;
-
-		emit_align(&b, 8);
-		rsvmap = start_block(&b);
-		emit_rsvmap_entry(&b, TEST_ADDR_1, TEST_SIZE_1);
-		finish_rsvmap(&b, hdr, rsvmap);
-	}
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	finish_strings_block(&b, hdr, start_block(&b));
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_two_roots(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		emit_end_node(&b);
-		emit_begin_node(&b, "");
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	finish_strings_block(&b, hdr, start_block(&b));
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_named_root(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "fake");
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	finish_strings_block(&b, hdr, start_block(&b));
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-/* Tree with the root node at the offset 12 */
-static struct buf make_root_offset_12(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-	size_t p_int, p_sn_int;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_u32(&b, FDT_NOP);
-		emit_u32(&b, FDT_NOP);
-		emit_u32(&b, FDT_NOP);
-
-		emit_begin_node(&b, "");
-			p_int = emit_prop_u32(&b, 0, 0x1);
-
-			emit_begin_node(&b, "subnode");
-				p_sn_int = emit_prop_u32(&b, 0, 0x2);
-			emit_end_node(&b);
-		emit_end_node(&b);
-
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	{
-		size_t strs = start_block(&b);
-		size_t s;
-
-		s = emit_string(&b, "prop-int");
-		fill_prop_name(&b, strs, p_int, s);
-		fill_prop_name(&b, strs, p_sn_int, s);
-
-		finish_strings_block(&b, hdr, strs);
-	}
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-static struct buf make_bad_proplen(void)
-{
-	struct buf b = buf_init();
-	size_t hdr;
-
-	hdr = emit_fdt_header(&b);
-	emit_align(&b, 8);
-
-	emit_rsvmap_empty(&b, hdr);
-
-	{
-		size_t ss = start_block(&b);
-
-		emit_begin_node(&b, "");
-		/* Property with length exceeding the remaining blob size */
-		emit_u32(&b, FDT_PROP);
-		emit_u32(&b, 0x80000000);	/* proplen: exceeds blob */
-		emit_u32(&b, 0);		/* nameoff */
-		emit_end_node(&b);
-		emit_fdt_end(&b);
-		finish_struct_block(&b, hdr, ss);
-	}
-
-	{
-		size_t strs = start_block(&b);
-
-		emit_string(&b, "x");
-		finish_strings_block(&b, hdr, strs);
-	}
-
-	finish_totalsize(&b, hdr);
-
-	return b;
-}
-
-/* Tree generator */
-struct treegen {
-	struct buf (*generator)(void);
-	const char *filename;
-};
-#define TREE(name)	{ make_##name, #name ".dtb" }
-
-/* Tree harness */
-struct treeharness {
-	const char *name;
-	const struct treegen *tab_treegen;
-	unsigned int nb_treegen;
-};
-#define TREEHARNESS(name_, tab_treegen_) \
-	{ \
-		.name = name_, \
-		.tab_treegen = tab_treegen_, \
-		.nb_treegen = ARRAY_SIZE(tab_treegen_), \
-	}
-
-/* Tree base generators */
-static const struct treegen treegens[] = {
-	TREE(test_tree1),
-	TREE(bad_node_char), TREE(bad_node_format), TREE(bad_prop_char),
-	TREE(ovf_size_strings),
-	TREE(truncated_property), TREE(truncated_string),
-	TREE(truncated_memrsv),
-	TREE(unterminated_memrsv),
-	TREE(two_roots),
-	TREE(named_root),
-	TREE(root_offset_12),
-	TREE(bad_proplen),
-};
-
-/* Tree base harness */
-struct treeharness treeharness_base = TREEHARNESS("base", treegens);
+/* Available harnesses */
+extern struct treeharness treeharness_base;
 
 /* Tree harnesses */
 static const struct treeharness *tab_treeharness[] = {
diff --git a/tests/treegen_base.c b/tests/treegen_base.c
new file mode 100644
index 00000000..726b9741
--- /dev/null
+++ b/tests/treegen_base.c
@@ -0,0 +1,551 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * treegen_base - generate base device tree blobs
+ *
+ */
+#include "treegen.h"
+#include "testdata.h"
+#include "libfdt_env.h"
+#include "fdt.h"
+
+static struct buf make_test_tree1(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p_compatible, p_prop_int, p_prop_int64, p_prop_str,
+	       p_address_cells, p_size_cells;
+	size_t p_s1_compatible, p_s1_reg, p_s1_prop_int;
+	size_t p_s1ss_compatible, p_s1ss_placeholder, p_s1ss_prop_int;
+	size_t p_s2_reg, p_s2_linux_phandle, p_s2_prop_int,
+	       p_s2_address_cells, p_s2_size_cells;
+	size_t p_s2ss0_reg, p_s2ss0_phandle, p_s2ss0_compatible,
+	       p_s2ss0_prop_int;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	{
+		size_t rsvmap = start_block(&b);
+
+		emit_rsvmap_entry(&b, TEST_ADDR_1, TEST_SIZE_1);
+		emit_rsvmap_entry(&b, TEST_ADDR_2, TEST_SIZE_2);
+		emit_rsvmap_term(&b);
+		finish_rsvmap(&b, hdr, rsvmap);
+	}
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		p_compatible = emit_prop_str(&b, 0, "test_tree1");
+		p_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_1);
+		p_prop_int64 = emit_prop_u64(&b, 0, TEST_VALUE64_1);
+		p_prop_str = emit_prop_str(&b, 0, TEST_STRING_1);
+		p_address_cells = emit_prop_u32(&b, 0, 1);
+		p_size_cells = emit_prop_u32(&b, 0, 0);
+
+		emit_begin_node(&b, "subnode@1");
+		p_s1_compatible = emit_prop_str(&b, 0, "subnode1");
+		p_s1_reg = emit_prop_u32(&b, 0, 1);
+		p_s1_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_1);
+
+		emit_begin_node(&b, "subsubnode");
+		p_s1ss_compatible = emit_prop_strings(&b, 0,
+						     "subsubnode1", "subsubnode");
+		p_s1ss_placeholder = emit_prop_strings(&b, 0,
+						       "this is a placeholder string",
+						       "string2");
+		p_s1ss_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_1);
+		emit_end_node(&b);
+
+		emit_begin_node(&b, "ss1");
+		emit_end_node(&b);
+
+		emit_end_node(&b);
+
+		emit_begin_node(&b, "subnode@2");
+		p_s2_reg = emit_prop_u32(&b, 0, 2);
+		p_s2_linux_phandle = emit_prop_u32(&b, 0, PHANDLE_1);
+		p_s2_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_2);
+		p_s2_address_cells = emit_prop_u32(&b, 0, 1);
+		p_s2_size_cells = emit_prop_u32(&b, 0, 0);
+
+		emit_begin_node(&b, "subsubnode@0");
+		p_s2ss0_reg = emit_prop_u32(&b, 0, 0);
+		p_s2ss0_phandle = emit_prop_u32(&b, 0, PHANDLE_2);
+		p_s2ss0_compatible = emit_prop_strings(&b, 0,
+						      "subsubnode2", "subsubnode");
+		p_s2ss0_prop_int = emit_prop_u32(&b, 0, TEST_VALUE_2);
+		emit_end_node(&b);
+
+		emit_begin_node(&b, "ss2");
+		emit_end_node(&b);
+
+		emit_end_node(&b);
+
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+		size_t s;
+
+		s = emit_string(&b, "compatible");
+		fill_prop_name(&b, strs, p_compatible, s);
+		fill_prop_name(&b, strs, p_s1_compatible, s);
+		fill_prop_name(&b, strs, p_s1ss_compatible, s);
+		fill_prop_name(&b, strs, p_s2ss0_compatible, s);
+
+		s = emit_string(&b, "prop-int");
+		fill_prop_name(&b, strs, p_prop_int, s);
+		fill_prop_name(&b, strs, p_s1_prop_int, s);
+		fill_prop_name(&b, strs, p_s1ss_prop_int, s);
+		fill_prop_name(&b, strs, p_s2_prop_int, s);
+		fill_prop_name(&b, strs, p_s2ss0_prop_int, s);
+
+		fill_prop_name(&b, strs, p_prop_int64,
+			       emit_string(&b, "prop-int64"));
+
+		fill_prop_name(&b, strs, p_prop_str,
+			       emit_string(&b, "prop-str"));
+
+		fill_prop_name(&b, strs, p_s2_linux_phandle,
+			       emit_string(&b, "linux,phandle"));
+
+		fill_prop_name(&b, strs, p_s2ss0_phandle,
+			       emit_string(&b, "phandle"));
+
+		s = emit_string(&b, "reg");
+		fill_prop_name(&b, strs, p_s1_reg, s);
+		fill_prop_name(&b, strs, p_s2_reg, s);
+		fill_prop_name(&b, strs, p_s2ss0_reg, s);
+
+		fill_prop_name(&b, strs, p_s1ss_placeholder,
+			       emit_string(&b, "placeholder"));
+
+		s = emit_string(&b, "#address-cells");
+		fill_prop_name(&b, strs, p_address_cells, s);
+		fill_prop_name(&b, strs, p_s2_address_cells, s);
+
+		s = emit_string(&b, "#size-cells");
+		fill_prop_name(&b, strs, p_size_cells, s);
+		fill_prop_name(&b, strs, p_s2_size_cells, s);
+
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_truncated_property(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		p = emit_prop_header(&b, 0, 4);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+
+		emit_string(&b, "truncated");
+		fill_prop_name(&b, strs, p, strs);
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_bad_node_char(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		emit_begin_node(&b, "sub$node");
+		emit_end_node(&b);
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	finish_strings_block(&b, hdr, start_block(&b));
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_bad_node_format(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		emit_begin_node(&b, "subnode@1@2");
+		emit_end_node(&b);
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	finish_strings_block(&b, hdr, start_block(&b));
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_bad_prop_char(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		p = emit_prop_u32(&b, 0, TEST_VALUE_1);
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+
+		fill_prop_name(&b, strs, p,
+			       emit_string(&b, "prop$erty"));
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_ovf_size_strings(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		emit_prop_u32(&b, 0x10000000, 0);
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+
+		emit_string(&b, "x");
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	((struct fdt_header *)(b.data + hdr))->size_dt_strings =
+		cpu_to_fdt32(0xffffffff);
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_truncated_string(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p_good, p_bad;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		p_good = emit_prop_nil(&b, 0);
+		p_bad = emit_prop_nil(&b, 0);
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+
+		fill_prop_name(&b, strs, p_good, emit_string(&b, "good"));
+		fill_prop_name(&b, strs, p_bad, emit_bytes(&b, "bad", 3));
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_truncated_memrsv(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+
+	hdr = emit_fdt_header(&b);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	finish_strings_block(&b, hdr, start_block(&b));
+
+	{
+		size_t rsvmap;
+
+		emit_align(&b, 8);
+		rsvmap = start_block(&b);
+		emit_rsvmap_entry(&b, TEST_ADDR_1, TEST_SIZE_1);
+		finish_rsvmap(&b, hdr, rsvmap);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_unterminated_memrsv(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+
+	hdr = emit_fdt_header(&b);
+
+	{
+		size_t rsvmap;
+
+		emit_align(&b, 8);
+		rsvmap = start_block(&b);
+		emit_rsvmap_entry(&b, TEST_ADDR_1, TEST_SIZE_1);
+		finish_rsvmap(&b, hdr, rsvmap);
+	}
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	finish_strings_block(&b, hdr, start_block(&b));
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_two_roots(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		emit_end_node(&b);
+		emit_begin_node(&b, "");
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	finish_strings_block(&b, hdr, start_block(&b));
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_named_root(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "fake");
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	finish_strings_block(&b, hdr, start_block(&b));
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+/* Tree with the root node at the offset 12 */
+static struct buf make_root_offset_12(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+	size_t p_int, p_sn_int;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_u32(&b, FDT_NOP);
+		emit_u32(&b, FDT_NOP);
+		emit_u32(&b, FDT_NOP);
+
+		emit_begin_node(&b, "");
+			p_int = emit_prop_u32(&b, 0, 0x1);
+
+			emit_begin_node(&b, "subnode");
+				p_sn_int = emit_prop_u32(&b, 0, 0x2);
+			emit_end_node(&b);
+		emit_end_node(&b);
+
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+		size_t s;
+
+		s = emit_string(&b, "prop-int");
+		fill_prop_name(&b, strs, p_int, s);
+		fill_prop_name(&b, strs, p_sn_int, s);
+
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+static struct buf make_bad_proplen(void)
+{
+	struct buf b = buf_init();
+	size_t hdr;
+
+	hdr = emit_fdt_header(&b);
+	emit_align(&b, 8);
+
+	emit_rsvmap_empty(&b, hdr);
+
+	{
+		size_t ss = start_block(&b);
+
+		emit_begin_node(&b, "");
+		/* Property with length exceeding the remaining blob size */
+		emit_u32(&b, FDT_PROP);
+		emit_u32(&b, 0x80000000);	/* proplen: exceeds blob */
+		emit_u32(&b, 0);		/* nameoff */
+		emit_end_node(&b);
+		emit_fdt_end(&b);
+		finish_struct_block(&b, hdr, ss);
+	}
+
+	{
+		size_t strs = start_block(&b);
+
+		emit_string(&b, "x");
+		finish_strings_block(&b, hdr, strs);
+	}
+
+	finish_totalsize(&b, hdr);
+
+	return b;
+}
+
+/* Tree generators */
+static const struct treegen treegens[] = {
+	TREE(test_tree1),
+	TREE(bad_node_char), TREE(bad_node_format), TREE(bad_prop_char),
+	TREE(ovf_size_strings),
+	TREE(truncated_property), TREE(truncated_string),
+	TREE(truncated_memrsv),
+	TREE(unterminated_memrsv),
+	TREE(two_roots),
+	TREE(named_root),
+	TREE(root_offset_12),
+	TREE(bad_proplen),
+};
+
+/* Harness */
+struct treeharness treeharness_base = TREEHARNESS("base", treegens);
-- 
2.56.1

