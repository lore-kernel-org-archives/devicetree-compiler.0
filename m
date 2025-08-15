Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC162505A5
	for <devicetree-compiler@vger.kernel.org>; Fri, 15 Aug 2025 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755264913; cv=none; b=jTPN/U+X6gjKVE55dfDWiaiGMlunRwqym4bJeQiyVzVzfZFkAn2oczQgnRJerouHC/tuoKFc0bJGB46d8jxUPoXkHaxZh4ARPTkeY0D4fsXQRROck4fi+n6FsqX2ESWXV23+IxJ/FlKFjexx+BD+LAnqq2KhAlNEPuAeLeksWgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755264913; c=relaxed/simple;
	bh=n38gFLH1qoLOOgnmo1fbRTCct4eW8vGAP0ySCL9yy1E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJWSAwia1TzyrnjTm29dL3K+LVUcBMhQnMKP57YtjrOslJDwVvvokvwmgh4qXwyvyi3r1+pc1kxAC07cGi74ddqsSFfqd7Elq6OgQrrSr9T9H5r8IkgHcQbdbYQlYnK983/RrCqKgedaUBFLUYFLgCNLBMAz8sRPHFY/L5VUDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hzG3RiVf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hzG3RiVf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso10751985e9.0
        for <devicetree-compiler@vger.kernel.org>; Fri, 15 Aug 2025 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755264908; x=1755869708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5h0jaaJ/vB8Jxg3k24FwZFbb5fBo4Ss97RGkWRnpKFI=;
        b=hzG3RiVfPiv178Q0+tx6xjnWFfnz6X0aLgbbXWYvidE5R71/L09OkyOuOxpho3KJyz
         McBncnK4T/+0u5eWmxkq/eW6sQ6P3pbV++TZFZpulEpzRcaug5NHNyg+4I/9szvR16RJ
         +iixqjPX1GhSZ1msfiVzt98XEUjatuT0D69YfCumAmFBv9FtkPuzOiWOlVKn6tDihMUl
         co5PZDjlFPpTJv3uTnorguXl+W9ni1Uj6+MIpIdWZTB8qksZv/Kze5RzBi0tDYLu6IP8
         VtcTHvaqTBNsN9VYGI3xQHON6RxbwOwbyavXpcJ4Eg4N6X50ks9VBrsEF8xjb7fdki/p
         EB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755264908; x=1755869708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h0jaaJ/vB8Jxg3k24FwZFbb5fBo4Ss97RGkWRnpKFI=;
        b=LyCgO72ELo4Fp+Lytzd8p2jw/8eI5yfp8UNupK4jLrQjvOV7ZsV8/Hw2DQGiXGdc5q
         uZq5P5GwjcTz2PJuIwdeEZVBR5/nAYcgGq29dXD1CrKLlTlh9VylskmIFo1fBOBSmejh
         4jfJ/71UGarmZLf/gfr8QxqHmMqwjRb+o+7VFaW52glan2d0wT8dWeAoogxcjxKcyqZa
         dFmNZ0jz1FPvyvzznNO6g5X2x+EZxHHC8CLYMoy86dB6qq/7t8zHG3rw0py4/oqYZ89S
         F8IgAC/rkRTlRtv25xaTCOQkekkD1xVpElIfCUZMON4DpC7HZ6yfrTUBmYaRuqGQ2z1X
         d+wQ==
X-Gm-Message-State: AOJu0YwtpIQJVZkQb4DPHnf5OxRrxrjIn2ID9RxjdPbr+E8SA7Oo3sct
	Jq23ALhsfwAXaS1RZMfw6NQBkj3pHvMl8AxGVvGDnORd/DiXcS7wwc8SPQ2u1AJWF2IZPekpdgd
	y+WZF
X-Gm-Gg: ASbGncs7cNEllv9j1SvaFANm6Ozvw7X86bZQptXpxUZ+8VEYReXImofu78RXcckW3UX
	dd2NKVbaXxX0C5YcOBX8ZswvPxfCBevKrrAwWMGHlqoDnBDSgDHRrfRuOeRrX6G5stwhTPbt6Q8
	KT+VkAhvgcj19sF6qjDecbM5eS+meKLWTytyJ2SPu5KA8/A0dX/HAw3ix3InprpPSAdszQn54DC
	rlpgDPZ0ZlnT5V4L2W6FSh4Lh1J+y20ovvQbdxo5hNfZddxg13gDOsj1NlM6YAR/YXvXloZV4LF
	7PdaoWOx27t58UBjjllx5o6iZIrDrsAGzRGdBaCIhaBmV13LujUKc//FKERcfhMa8RHZk4VWGLZ
	Vqq96bkDgBWEQjPMOLIJ+qFe3roBeX2rGqaES5T+nQ94XsZNMgocvNkvogqb1bZGi
X-Google-Smtp-Source: AGHT+IEEFDr/BTH3Dou2fx/doUBhtPqDmf6870c0oNmQDfQCTmhtpCB1im1CFunYfl/tHohecBmTfQ==
X-Received: by 2002:a05:600c:37c7:b0:455:bd8a:7e7 with SMTP id 5b1f17b1804b1-45a21ab1574mr20149975e9.9.1755264907976;
        Fri, 15 Aug 2025 06:35:07 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb68079336sm1918596f8f.53.2025.08.15.06.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:35:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH v2 2/2] livetree: Add only new data to fixup nodes instead of complete regeneration
Date: Fri, 15 Aug 2025 15:34:54 +0200
Message-ID: <68b0f2845c5b7b439c3d5decb518ec3e236c426c.1755264521.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755264521.git.u.kleine-koenig@baylibre.com>
References: <cover.1755264521.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6393; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=n38gFLH1qoLOOgnmo1fbRTCct4eW8vGAP0ySCL9yy1E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBonzeBwayAWTTPFlLgXFCY4BwDsiXUmKxH0M0w1 Q3vSedAan2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaJ83gQAKCRCPgPtYfRL+ TgnyCACJV5cNn7R56REaYqjOKSeTuF1Aol/MQmET3Wlb/sJWNkIMVZJk2zBIGx/AKCnCorIZ9c0 M/pP+UETENvSn3Lk+PQdWuMYhYeTRMbnF6UZM889Y7E8IRPeLuFrz4zEfZW64kVl7lh/YXPZjlS eJqBM6PHvnLfIsJXsUYGABDX+IkZyimndgssnW7PFE5Tam6Mk2UWw4PvmJpYdPpapCmFvjD0EJO fW3uAg7meZSoJ3j6KCI6CLho7y8KjAJJIPCumElSY8IF0ThDS9XnPUcyQFF4gMEkB8d9zxcMQXn Rm//9t1kK1d/oa1JRDoHaopLJPg/3mFN1P0Ma2tONEJ6kUGY
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Removing the complete __fixups__ and __local_fixups__ tree might delete
data that should better be retained. See the added test for a situation
that was broken before.

Note that without removing /__fixups__ and /__local_fixups__ in
generate_fixups_tree() and generate_local_fixups_tree() respectively
calling build_and_name_child_node() isn't safe as the nodes might
already exist and then a duplicate would be added. So build_root_node()
has to be used which copes correctly here.

Fixes: 915daadbb62d ("Start with empty __local_fixups__ and __fixups__ nodes")
Closes: https://github.com/dgibson/dtc/issues/170
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 livetree.c              | 75 +++++++++++++++++++++++++++++++----------
 tests/retain-fixups.dts | 29 ++++++++++++++++
 tests/run_tests.sh      |  5 +++
 3 files changed, 92 insertions(+), 17 deletions(-)
 create mode 100644 tests/retain-fixups.dts

diff --git a/livetree.c b/livetree.c
index 6127d604d528..f23988483b01 100644
--- a/livetree.c
+++ b/livetree.c
@@ -352,6 +352,60 @@ void append_to_property(struct node *node,
 	p->val = data_append_data(p->val, data, len);
 }
 
+static void append_unique_str_to_property(struct node *node,
+					  char *name, const char *data, int len)
+{
+	struct property *p;
+
+	p = get_property(node, name);
+	if (p) {
+		if (p->val.val[p->val.len - 1] == '\0') {
+			const char *s;
+
+			for (s = p->val.val; s < p->val.val + p->val.len; s = strchr(s, '\0') + 1) {
+				if (strcmp(data, s) == 0)
+					/* data already contained in node.name */
+					return;
+			}
+		} else {
+			fprintf(stderr, "Warning: appending string to non-string property %s/%s\n",
+				node->fullpath, name);
+		}
+	} else {
+		p = build_property(name, empty_data, NULL);
+		add_property(node, p);
+	}
+
+	p->val = data_add_marker(p->val, TYPE_STRING, name);
+	p->val = data_append_data(p->val, data, len);
+}
+
+static void append_unique_u32_to_property(struct node *node, char *name, fdt32_t value)
+{
+	struct property *p;
+
+	p = get_property(node, name);
+	if (p) {
+		if (p->val.len % 4 == 0) {
+			const fdt32_t *v, *val_end = (const fdt32_t *)p->val.val + p->val.len / 4;
+
+			for (v = (const void *)p->val.val; v < val_end; v++) {
+				if (*v == value)
+					/* value already contained */
+					return;
+			}
+		} else {
+			fprintf(stderr, "Warning: appending u32 to property %s/%s with an unalign length\n",
+				node->fullpath, name);
+		}
+	} else {
+		p = build_property(name, empty_data, NULL);
+		add_property(node, p);
+	}
+	p->val = data_add_marker(p->val, TYPE_UINT32, name);
+	p->val = data_append_data(p->val, &value, 4);
+}
+
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
@@ -935,7 +989,7 @@ static void add_fixup_entry(struct dt_info *dti, struct node *fn,
 
 	xasprintf(&entry, "%s:%s:%u",
 			node->fullpath, prop->name, m->offset);
-	append_to_property(fn, m->ref, entry, strlen(entry) + 1, TYPE_STRING);
+	append_unique_str_to_property(fn, m->ref, entry, strlen(entry) + 1);
 
 	free(entry);
 }
@@ -1016,7 +1070,7 @@ static void add_local_fixup_entry(struct dt_info *dti,
 	free(compp);
 
 	value_32 = cpu_to_fdt32(m->offset);
-	append_to_property(wn, prop->name, &value_32, sizeof(value_32), TYPE_UINT32);
+	append_unique_u32_to_property(wn, prop->name, value_32);
 }
 
 static void generate_local_fixups_tree_internal(struct dt_info *dti,
@@ -1052,29 +1106,16 @@ void generate_label_tree(struct dt_info *dti, const char *name, bool allocph)
 
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
index 000000000000..ec09db8b441c
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
-- 
2.50.1

