Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F711F3BA3
	for <devicetree-compiler@vger.kernel.org>; Thu, 13 Mar 2025 19:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741894048; cv=none; b=eP7zCy/TeObkp96QkttYkyY2kn9UiJ2yl1DW77bhK0V+cuBUxwFty7bP0oyGTvzdILgEEWE+NI+UtyoWeODDHcA0OYIyuvVpKzgxyxeyawOGw9EAuZNR5TddHrK3yVcD/Fvr5+QN8Pmgf/ofUCbm4nPtyxr7KSqW00GxPDUeXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741894048; c=relaxed/simple;
	bh=SV9TbbEPTyVrBzZPZS+CKvEh/1mt0elYdFDt4ezd8CY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gGPqyB3ZiLL0A6o41rDBxEjd3CKVUBXyM3dFh88eaEHTWZE+9igSHSDWqtrkzRM1mAgMzfrd+npzoNs0j41NZb85CGRwq5zei8fs6Kn2rSFund2k4V/11MQM1xn/Zq+JxWUME0GLUqIBVByMbpBvX7cviB8oCRjF1kvo2buPfvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cMg+H7LO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cMg+H7LO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741894044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X9KdKCS0ly8MMvjMemC6uGT4jzDm0lu5Zult7XfIyVg=;
	b=cMg+H7LOQp7CCzOh1uIjI6aKJ/5mliMlJ4Abq/fgRT8Ov6vHXVD5W6uR7tIY/TFpDGagYA
	jiOQ0UtwVJzehu/uBuuQfLlO2ZDgZUR/Q4twdv3s46bCj7Jtgedn+cYR7AdbJf9pq7+oJe
	mK3CapzdRtphfpeVLjDH6p+N9zf2kTs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-ZF0Pr2YcPoOkkhxL6MJFUg-1; Thu,
 13 Mar 2025 15:27:23 -0400
X-MC-Unique: ZF0Pr2YcPoOkkhxL6MJFUg-1
X-Mimecast-MFC-AGG-ID: ZF0Pr2YcPoOkkhxL6MJFUg_1741894042
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40E431801A06
	for <devicetree-compiler@vger.kernel.org>; Thu, 13 Mar 2025 19:27:22 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.26])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 355351955BCB
	for <devicetree-compiler@vger.kernel.org>; Thu, 13 Mar 2025 19:27:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH] Use __ASSEMBLER__ instead of __ASSEMBLY__
Date: Thu, 13 Mar 2025 20:27:18 +0100
Message-ID: <20250313192718.1561683-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Both, Clang and GCC define __ASSEMBLER__ automatically when
compiling .S files, so this macro is a much better fit for
fdt.h - programs that want to use it from .S files don't have
to manually #define __ASSEMBLY__ that way.
While we're at it, also change it in testdata.h, then we don't
have to define __ASSEMBLY__ in the Makefile / meson.build file
anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile          | 2 +-
 libfdt/fdt.h      | 4 ++--
 tests/meson.build | 2 +-
 tests/testdata.h  | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index f1f0ab3..a00123d 100644
--- a/Makefile
+++ b/Makefile
@@ -360,7 +360,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
 
 %.o: %.S
 	@$(VECHO) AS $@
-	$(CC) $(CPPFLAGS) $(AFLAGS) -D__ASSEMBLY__ -o $@ -c $<
+	$(CC) $(CPPFLAGS) $(AFLAGS) -o $@ -c $<
 
 %.d: %.c
 	@$(VECHO) DEP $<
diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 0c91aa7..a07abfc 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -7,7 +7,7 @@
  * Copyright 2012 Kim Phillips, Freescale Semiconductor.
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct fdt_header {
 	fdt32_t magic;			 /* magic word FDT_MAGIC */
@@ -45,7 +45,7 @@ struct fdt_property {
 	char data[];
 };
 
-#endif /* !__ASSEMBLY */
+#endif /* !__ASSEMBLER__ */
 
 #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
 #define FDT_TAGSIZE	sizeof(fdt32_t)
diff --git a/tests/meson.build b/tests/meson.build
index 52d657e..37bfd47 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,4 +1,4 @@
-trees = static_library('trees', files('trees.S'), c_args: '-D__ASSEMBLY__',
+trees = static_library('trees', files('trees.S'),
                        build_by_default: false,
                        include_directories: libfdt_inc)
 
diff --git a/tests/testdata.h b/tests/testdata.h
index 4f9e3ba..fcebc2c 100644
--- a/tests/testdata.h
+++ b/tests/testdata.h
@@ -1,4 +1,4 @@
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define ASM_CONST_LL(x)	(x)
 #else
 #define ASM_CONST_LL(x)	(x##ULL)
@@ -46,7 +46,7 @@
 #define TEST_MEMREGION_SIZE_HI	0x0fedcba900000000
 #define TEST_MEMREGION_SIZE_INC	0x1000
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 extern struct fdt_header test_tree1;
 extern struct fdt_header truncated_property;
 extern struct fdt_header bad_node_char;
@@ -57,4 +57,4 @@ extern struct fdt_header truncated_string;
 extern struct fdt_header truncated_memrsv;
 extern struct fdt_header two_roots;
 extern struct fdt_header named_root;
-#endif /* ! __ASSEMBLY */
+#endif /* ! __ASSEMBLER__ */
-- 
2.48.1

