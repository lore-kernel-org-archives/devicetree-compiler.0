Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD79289833
	for <devicetree-compiler@vger.kernel.org>; Fri,  1 Aug 2025 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754064045; cv=none; b=cqIkgIPFimiH8jSu0YLqo02/7nTi0+cdlwLIoMGCZ/fDJiBMITlldZG/FbMKj512Tlcn0phOHD1rKs0oOb1kFzXb9bFP3lt/kSSgMeJe0+AEoPt6cxWDxs/3Nbx+tlNTRREkpT4x7hip1cDdC/aS6Jn8LhwAXBdaq+SopTSpRnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754064045; c=relaxed/simple;
	bh=pqeZjAOaEbzJtsPKGR6Zq+TMMjlrgXHnR4M4G4iU0ng=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lXAsk0q2bVn/p5suhAYpX97++s78t6j2i4iqUaAtK/YN+f271169nooVIZ1u91EicfXuJxd0cwRCAFg9QIuCMgVH48T2Fw05qZuQqT0DeOpRUsYQKSqm1ol20Ov/WIkmRN87OMTskn6GN08kvC64ql6xb98w8Bzuqy4e/PTzpRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eYxGqC37; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eYxGqC37"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so234410366b.1
        for <devicetree-compiler@vger.kernel.org>; Fri, 01 Aug 2025 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754064039; x=1754668839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZAnje3MDsW5LP9Xkz24VLEl4tep9bs3IXfKdTE4XLw=;
        b=eYxGqC37V46mIHpYfyw2FUhqidmaEF3HIAa9jYBDs9T4OeK0wgvjRCvVmtahNCw7qR
         UmEDvl3z/pNod8D3388Liroh2lmmWBSFEhJKrgbx5/EyGS7paV/rb/bcgUQm9ACqRDxE
         kmtfWzAotoVDISp63oYbx/BhQopLKPW09f3/H97Yk7eK7aJtArL/78YAhrHX3Ej9v60I
         lzrKoOGe/m/wyOf4HMgqJq5wc15Ik8DAkk17T/Y6Byq2JLC9DpIOIlpW5Fxc7a7RCW56
         gwwmI2aUQFDRICtpMxVONPj/xkUdUU6QnVdaTGr5du90RnvfMyOCtt5qUjJbZ/+Bo41D
         ZmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754064039; x=1754668839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZAnje3MDsW5LP9Xkz24VLEl4tep9bs3IXfKdTE4XLw=;
        b=LtP+qRYDvSRi2DI5+GtmWmKmdVHPZ0eSd4gZLj33eA0akVZ7+APj/+Bo/DZ96Rp3f6
         yCxNIKrmWd3HKRav+xa7d86p+XtAH6RaoJNfqQfgRm8Aq82kGJEiNRxy1FnXwk4ItbF7
         0Ll0vhwF2SxalwcaZ/hXFbCMKTTQg+531a85dhwHm+XCbDqcFlhlHJWoJJ2waUYVGffY
         F5pYhmB6yNwdzzqF7FhDrBOMzzDrmXLIZxSwPh2TZLL5TIUXrpY3b/P2sIUVUiiZl5jz
         8Ln4Q1MND1i+V+GwuY1tHn+e8qR/0WtfOrBaixUlUMUbPQkgQqeGg1skrPDmgRKuOMl4
         Ha6A==
X-Gm-Message-State: AOJu0Yyn8Fiqa1rdM6pbQnmglkxw2W6IFbqabM9wA+/XPrSNjZOMlYoA
	FpNnOzHXB4sVHxxF5rQHYqsLmGbM14D2+JdQxp0k3BDPUrv6/pf86dB8TGhdWYY1dI+GfBXp3/d
	piKXU
X-Gm-Gg: ASbGncvGkPGXtrxEYcEKji+59XXYWoGYmCRp8I2mpgYo9wACPh3g+QdG/MlgIU3gwfj
	Jpg9WF7YbtGBoCsZQf+VJp5oHhGQnQ1ckziFCQcbwwqqHartACsjz3D+6M4dVX4lNdOhf8jqTt4
	V5jYeF1MT3ZD/0ZArV7vZu9FPgEsBzx0hyz5bG4ieLko+IG99+GVFZTGegedjEoAq6DaKhQprBh
	VPJWmlG634UuWTGqkxhOOuhSQM1ndIqvzCwpWN6csOhBKq4WLfxRWWAo9O/iHRgXLY2ZumPOQgz
	t1Ej5yQp/x4GNkLg0A4bzwqCEkiSu3byTDi7nlxQRiqvO/fJY5H3Ri9wqWLWI9eXAEsCVvBLZT8
	JhoGrOrOs3QW7d8gQeMf99CgeLpnLRjO3v8xbywfGx+/LDNne9QNIgnrdLQ3Z0p8AEfkijf9Wks
	o=
X-Google-Smtp-Source: AGHT+IHPtDhez9Zf8WJKBoULVQFPzBUkanEfvZXW0+qTRL4eUuQyfwBwR71mcTM7R/EqM//Hbs0IDw==
X-Received: by 2002:a17:906:6a12:b0:ae0:ded9:7f54 with SMTP id a640c23a62f3a-af9401ee951mr33137366b.28.1754064039072;
        Fri, 01 Aug 2025 09:00:39 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a0a25casm308633966b.34.2025.08.01.09.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 09:00:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH] livetree: Add only new data to fixup nodes instead of complete regeneration
Date: Fri,  1 Aug 2025 18:00:31 +0200
Message-ID: <20250801160031.624886-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6252; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=pqeZjAOaEbzJtsPKGR6Zq+TMMjlrgXHnR4M4G4iU0ng=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBojOSfmacMDKAWPfa6/OrKKllWwsvQ5qClgF4z1 FOhl0K2cpOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIzknwAKCRCPgPtYfRL+ TvxFCACgGJ8UsGXcDwOaXqrvxIMcCBNMoDZR/3+0n0BlnX8F5zF9PmFeHBnCriWwcVOtWOSSN0I hKEcXE/4sQnYNJJ4L/vT/cE9K7eYlutqn+4sBflpZVfdx4LMbTRu4RREVVmkKbcRFLmYO+v3/yf s3TTxB6pUVgMmV+7wvuLSWMfowjfq4Pa2jRvOLiUYDywRGpENz/AaM8B57H0+yoMnFnCdlZex9u /1vHPFz4rXbqXT5I3b0dY4ERXL0uyMO3GdSRWYTgIfxW/3BwtnIiuXNforpKsDuaYZ6tl631sXL nk9rMkYgIqb1PsweizChTLLyFjTMs5YJcEzKaIytyiAo+jWD
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Removing the complete __fixups__ and __local_fixups__ tree might delete
data that should better be retained. See the added test for a situation
that was broken before.

Fixes: 915daadbb62d ("Start with empty __local_fixups__ and __fixups__ nodes")
Closes: https://github.com/dgibson/dtc/issues/170
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this fixes the fallout of commit 915daadbb62d ("Start with empty
__local_fixups__ and __fixups__ nodes") that was found while discussing
https://github.com/dgibson/dtc/pull/151 .

I'm a bit annoyed by the github workflow, so here comes a patch on the
mailing list :-)

Best regards
Uwe

 livetree.c              | 75 +++++++++++++++++++++++++++++++----------
 tests/retain-fixups.dts | 29 ++++++++++++++++
 tests/run_tests.sh      |  5 +++
 3 files changed, 92 insertions(+), 17 deletions(-)
 create mode 100644 tests/retain-fixups.dts

diff --git a/livetree.c b/livetree.c
index d51d05830b18..24f7c561d77e 100644
--- a/livetree.c
+++ b/livetree.c
@@ -356,6 +356,60 @@ void append_to_property(struct node *node,
 	}
 }
 
+static void append_unique_str_to_property(struct node *node,
+					  char *name, const char *data, int len)
+{
+	struct data d;
+	struct property *p;
+
+	p = get_property(node, name);
+	if (p) {
+		const char *s;
+
+		for (s = p->val.val; s < p->val.val + p->val.len; s = strchr(s, '\0') + 1) {
+			if (strcmp(data, s) == 0)
+				/* data already contained in node.name */
+				return;
+		}
+
+		d = data_add_marker(p->val, TYPE_STRING, name);
+		d = data_append_data(d, data, len);
+		p->val = d;
+	} else {
+		d = data_add_marker(empty_data, TYPE_STRING, name);
+		d = data_append_data(d, data, len);
+		p = build_property(name, d, NULL);
+		add_property(node, p);
+	}
+
+}
+
+static void append_unique_u32_to_property(struct node *node, char *name, fdt32_t value)
+{
+	struct data d;
+	struct property *p;
+
+	p = get_property(node, name);
+	if (p) {
+		const fdt32_t *v;
+
+		for (v = (const void *)p->val.val; (const void *)v < (const void *)(p->val.val + p->val.len - 3); v++) {
+			if (*v == value)
+				/* value already contained */
+				return;
+		}
+
+		d = data_add_marker(p->val, TYPE_UINT32, name);
+		d = data_append_data(d, &value, 4);
+		p->val = d;
+	} else {
+		d = data_add_marker(empty_data, TYPE_UINT32, name);
+		d = data_append_data(d, &value, 4);
+		p = build_property(name, d, NULL);
+		add_property(node, p);
+	}
+}
+
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
@@ -939,7 +993,7 @@ static void add_fixup_entry(struct dt_info *dti, struct node *fn,
 
 	xasprintf(&entry, "%s:%s:%u",
 			node->fullpath, prop->name, m->offset);
-	append_to_property(fn, m->ref, entry, strlen(entry) + 1, TYPE_STRING);
+	append_unique_str_to_property(fn, m->ref, entry, strlen(entry) + 1);
 
 	free(entry);
 }
@@ -1020,7 +1074,7 @@ static void add_local_fixup_entry(struct dt_info *dti,
 	free(compp);
 
 	value_32 = cpu_to_fdt32(m->offset);
-	append_to_property(wn, prop->name, &value_32, sizeof(value_32), TYPE_UINT32);
+	append_unique_u32_to_property(wn, prop->name, value_32);
 }
 
 static void generate_local_fixups_tree_internal(struct dt_info *dti,
@@ -1056,29 +1110,16 @@ void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
 
 void generate_fixups_tree(struct dt_info *dti, const char *name)
 {
-	struct node *n = get_subnode(dti->dt, name);
-
-	/* Start with an empty __fixups__ node to not get duplicates */
-	if (n)
-		n->deleted = true;
-
 	if (!any_fixup_tree(dti, dti->dt))
 		return;
-	generate_fixups_tree_internal(dti,
-				      build_and_name_child_node(dti->dt, name),
+	generate_fixups_tree_internal(dti, build_root_node(dti->dt, name),
 				      dti->dt);
 }
 
 void generate_local_fixups_tree(struct dt_info *dti, const char *name)
 {
-	struct node *n = get_subnode(dti->dt, name);
-
-	/* Start with an empty __local_fixups__ node to not get duplicates */
-	if (n)
-		n->deleted = true;
 	if (!any_local_fixup_tree(dti, dti->dt))
 		return;
-	generate_local_fixups_tree_internal(dti,
-					    build_and_name_child_node(dti->dt, name),
+	generate_local_fixups_tree_internal(dti, build_root_node(dti->dt, name),
 					    dti->dt);
 }
diff --git a/tests/retain-fixups.dts b/tests/retain-fixups.dts
new file mode 100644
index 000000000000..7b7b52210659
--- /dev/null
+++ b/tests/retain-fixups.dts
@@ -0,0 +1,29 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	fixup-node {
+		property = <0xffffffff>;
+		property-with-fixup = <0xffffffff>;
+		property-with-label = <&somenode>;
+		property-with-label-and-fixup = <&somenode>;
+	};
+
+	label: local-fixup-node {
+		property = <0xffffffff>;
+		property-with-local-fixup = <0xffffffff>;
+		property-with-local-label = <&label>;
+		property-with-local-label-and-fixup = <&label>;
+	};
+	
+	__fixups__ {
+		somenode = "/fixup-node:property-with-fixup:0", "/fixup-node:property-with-label-and-fixup:0";
+	};
+
+	__local_fixups__ {
+		local-fixup-node {
+			property-with-local-fixup = <0x00>;
+			property-with-local-label-and-fixup = <0x00>;
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index fecfe7cc09b3..1c9278d93689 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -666,6 +666,11 @@ dtc_tests () {
         run_test dtbs_equal_ordered $tree.test.dtb $tree.test.dts.test.dtb
     done
 
+    # Check preservation of __fixups__ and __local_fixups__
+    run_dtc_test -I dts -O dtb -o retain-fixups.test.dtb "$SRCDIR/retain-fixups.dts"
+    run_fdtget_test "/fixup-node:property-with-fixup:0 /fixup-node:property-with-label-and-fixup:0 /fixup-node:property-with-label:0" retain-fixups.test.dtb /__fixups__ somenode
+    run_fdtget_test "property-with-local-fixup\nproperty-with-local-label-and-fixup\nproperty-with-local-label" -p retain-fixups.test.dtb /__local_fixups__/local-fixup-node
+
     # Check -Oyaml output
     if ! $no_yaml; then
             for tree in type-preservation; do

base-commit: 84d9dd2fcbc865a35d7f04d9b465b05ef286d281
-- 
2.50.1

