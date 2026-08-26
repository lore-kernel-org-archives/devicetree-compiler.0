Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC56B3BCD17;
	Wed, 26 Aug 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733185; cv=none; b=bBcHe57UXjksFlPkM+GPXVd8+DcRl9oZECeVNUzHHbpJt+YoKIlG8Gxmb91g4wFPkNOJ7Fo64zyA9SxiQvQF6+tTjXO00oSS/TIN4e+MMwfMRhIyZO0oShw3YMrQ0iN0oFZyPuAbQpzyMvzsMA+5V4vHnGrg+KgpXYxmbTGR7q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733185; c=relaxed/simple;
	bh=Xw+lLkeHOdNK/RVttK7odw2ffNcux/6YzZuNE+EPAxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxME01qrL9FeiRtLdU3xcYVyxJ2f9eQ4G4lH1C/I0knlT5jroc4fo+XiUAO5lVg3vwnC8UmqIiFkoWc3vrOuj0QjKadZ/5WDW16nFrCVE3VzF5Um9DFlGDuCdPfr72sdvQhtMikBGhneZdl3FLmTWSE3Jbo3hLfnDXrWIqxgSwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dZlTQO5F; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dZlTQO5F"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 582A21A183B;
	Wed, 26 Aug 2026 08:33:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C33E604EC;
	Wed, 26 Aug 2026 08:33:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C078411C7AC7E;
	Wed, 26 Aug 2026 10:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733181; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6vGE5JHlVYso6AMZWaa842fc1ufJ/3MtKzaefu5tSXI=;
	b=dZlTQO5FolvC82YRcRRYZQXn8nIZ1jivHBjx8dV+hindmX7G0mU+4LMzggv4cwzsh/gQAl
	cTY+ySIVJuaUTp1B/oMDpNHMleNzW6E3vdlBdOsIdMeXxcQaI9ja4vTCy4Jed/Z0wgDYk2
	oOyggECfj/iALr+2liHCnFh1Ae0r/GEqeUwAtWW+coE2oCWZ3gH6dARE5ZS0Y1X/PkQMaj
	EDKirwcY5oJD6waZJ5q3EyozwXDd0rm/jaGALdic79zemGZ7PsZ4U97JSNlpbm0THSmBUH
	m22OHHcBdkTNU+3bdSYCjmVY6/B3O6l0h//sxjhcvjHJMc1ij92qdr2NbigvZg==
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
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 11/15] libfdt: Introduce fdt_getprop_by_offset_w()
Date: Wed, 26 Aug 2026 10:31:42 +0200
Message-ID: <20260826083146.304291-12-herve.codina@bootlin.com>
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

Future operations, such as handling unknown tags on dtb modifications,
need to modify properties retrieved by their offset.

fdt_getprop_by_offset() already exists to get a preperty by its offset
but the property returned is read-only. A writable returned property is
needed.

Fill the lack and introduce fdt_getprop_by_offset_w(), the write enabled
variant of fdt_getprop_by_offset().

Add also its related test.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 libfdt/libfdt.h           |  6 +++
 tests/.gitignore          |  1 +
 tests/Makefile.tests      |  2 +-
 tests/get_prop_offset_w.c | 84 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |  1 +
 tests/run_tests.sh        |  1 +
 tests/tests.h             |  1 +
 tests/testutils.c         | 18 +++++++++
 8 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 tests/get_prop_offset_w.c

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 7a1915a5..82965e32 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -856,6 +856,12 @@ static inline struct fdt_property *fdt_get_property_w(void *fdt, int nodeoffset,
 #ifndef SWIG /* This function is not useful in Python */
 const void *fdt_getprop_by_offset(const void *fdt, int offset,
 				  const char **namep, int *lenp);
+static inline void *fdt_getprop_by_offset_w(const void *fdt, int offset,
+					    const char **namep, int *lenp)
+{
+	return (void *)(uintptr_t)fdt_getprop_by_offset(fdt, offset, namep,
+							lenp);
+}
 #endif
 
 /**
diff --git a/tests/.gitignore b/tests/.gitignore
index 69693129..1091174a 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -30,6 +30,7 @@ tmp.*
 /get_phandle
 /getprop
 /get_prop_offset
+/get_prop_offset_w
 /incbin
 /integer-expressions
 /fs_tree1
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 63e201ae..0d4d399f 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -16,7 +16,7 @@ LIB_TESTS_L = get_mem_rsv \
 	sw_tree1 sw_states \
 	move_and_save mangle-layout nopulate \
 	open_pack rw_tree1 rw_oom set_name setprop del_property del_node \
-	appendprop1 appendprop2 propname_escapes \
+	appendprop1 appendprop2 propname_escapes get_prop_offset_w \
 	string_escapes references path-references phandle_format \
 	boot-cpuid incbin relref_merge \
 	extra-terminating-null \
diff --git a/tests/get_prop_offset_w.c b/tests/get_prop_offset_w.c
new file mode 100644
index 00000000..dbfa5dd7
--- /dev/null
+++ b/tests/get_prop_offset_w.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Testcase for fdt_getprop_by_offset_w()
+ * Copyright (C) 2026 Bootlin.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+#define SPACE		65536
+
+int main(int argc, char *argv[])
+{
+	const void *exp_val;
+	const char *name;
+	char *modif_val;
+	void *propval;
+	int proplen;
+	int exp_len;
+	int poffset;
+	void *fdt;
+	void *buf;
+	int err;
+
+	test_init(argc, argv);
+	fdt = load_blob_arg(argc, argv);
+
+	buf = xmalloc(SPACE);
+
+	err = fdt_open_into(fdt, buf, SPACE);
+	if (err)
+		FAIL("fdt_open_into(): %s", fdt_strerror(err));
+
+	free(fdt);
+	fdt = buf;
+
+	/* Retrieve the offset of the 'prop-str' property */
+	poffset = get_poffset(fdt, 0, "prop-str");
+	if (poffset < 0)
+		FAIL("Property 'prop-str' not found");
+
+	/* Get the property value for modification */
+	propval = fdt_getprop_by_offset_w(fdt, poffset, &name, &proplen);
+	if (!propval)
+		FAIL("fdt_getprop_by_offset_w(%d): %s", poffset,
+		     fdt_strerror(proplen));
+
+	/* Check original values */
+	if (strcmp(name, "prop-str"))
+		FAIL("Name mismatch : %s instead of prop-str", name);
+
+	exp_len = strlen(TEST_STRING_1) + 1;
+	if (proplen != exp_len)
+		FAIL("Original size mismatch on property \"%s\": %d instead of %d",
+		     name, proplen, exp_len);
+
+	exp_val = TEST_STRING_1;
+	if (memcmp(exp_val, propval, exp_len))
+		FAIL("Original data mismatch on property \"%s\"", name);
+
+	if (exp_len < 4)
+		CONFIG("Property \"%s\" should be at least 4 bytes", name);
+
+	/* Modify the property value */
+	modif_val = xmalloc(proplen);
+	memcpy(modif_val, propval, proplen);
+	modif_val[1] = (modif_val[1] != 'A') ? 'A' : 'a';
+	modif_val[3] = (modif_val[3] != 'B') ? 'B' : 'b';
+	memcpy(propval, modif_val, exp_len);
+
+	/* Check that the modified value is taken into account */
+	if (!check_get_prop_offset(fdt, poffset, "prop-str", exp_len, modif_val))
+		FAIL("Modified property 'prop-str' not found");
+
+	PASS();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 779e6bc7..dae6a941 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -50,6 +50,7 @@ tests = [
   'get_path',
   'get_phandle',
   'get_prop_offset',
+  'get_prop_offset_w',
   'get_next_tag_invalid_prop_len',
   'getprop',
   'incbin',
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 225c22f8..419a24d8 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -419,6 +419,7 @@ tree1_tests_rw () {
     run_test setprop $TREE
     run_test del_property $TREE
     run_test del_node $TREE
+    run_test get_prop_offset_w $TREE
 }
 
 check_tests () {
diff --git a/tests/tests.h b/tests/tests.h
index 578d8c1a..37ed3394 100644
--- a/tests/tests.h
+++ b/tests/tests.h
@@ -109,6 +109,7 @@ const void *check_get_prop_offset(void *fdt, int poffset, const char *in_name,
 const void *check_getprop_addrrange(void *fdt, int parent, int nodeoffset,
 				    const char *name, int num);
 
+int get_poffset(void *fdt, int nodeoffset, const char *propname);
 int nodename_eq(const char *s1, const char *s2);
 void vg_prepare_blob(void *fdt, size_t bufsize);
 void *load_blob(const char *filename);
diff --git a/tests/testutils.c b/tests/testutils.c
index 6d69e872..d35a1978 100644
--- a/tests/testutils.c
+++ b/tests/testutils.c
@@ -230,6 +230,24 @@ const void *check_getprop_addrrange(void *fdt, int parent, int nodeoffset,
 	return propval;
 }
 
+int get_poffset(void *fdt, int nodeoffset, const char *propname)
+{
+	const char *name;
+	int poffset;
+
+	fdt_for_each_property_offset(poffset, fdt, nodeoffset) {
+		if (fdt_getprop_by_offset(fdt, poffset, &name, NULL)) {
+			if (!strcmp(name, propname))
+				return poffset;
+		}
+	}
+
+	if (poffset < 0)
+		return poffset;
+
+	return -FDT_ERR_NOTFOUND;
+}
+
 int nodename_eq(const char *s1, const char *s2)
 {
 	int len = strlen(s2);
-- 
2.55.0

