Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94236A01E
	for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 20:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729062; cv=none; b=T/L80dNG8rJpGYaPXtsv9bLIqotxiBx+WzeVcDtKwwaOzA/8mc+J4qigP9lSTUtQ8JW2Ww6jrp6KrnEmOElcw6Qb5fPrjIaGWSmztgjKrZbSv27Qf3GKF9jbZyGinbll5FGcDsOhXH/6I5CH+crkDffioqUhWju2Xf4AOConhrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729062; c=relaxed/simple;
	bh=ylHA6dopZxqZdu70MnyZdEbu3HPPerdSVXBABcQ5hf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GbqmErJGOHUliaa2KOE7hmJtzgNGhc71pXCjA+WQ8pk4poneKFSoN2uZM6lq67EVnYA8yyI7O3raXJubNrjo+WLBZuYyjEDULIODFkOQaapBsx3EkFLkqR3kIM4ywpYYSiCbXaMDEUPuCmQQvmyraQKC1ah3r3OYfK1oHgKspUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UVvOIRCX; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UVvOIRCX"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30beab3af9eso592865eec.1
        for <devicetree-compiler@vger.kernel.org>; Wed, 17 Jun 2026 13:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781729061; x=1782333861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zAzJHqCfyzT/fB0ahxtU/ElAip7GVwZ17zIMRkJYuHE=;
        b=UVvOIRCXGgvi1oY9nhPjz6cM8ijKqhr0pjJe3vZho+2pxtArumwFX86GiJER3IY+3m
         WWhVlz48rV3thYBRtogkFPOSCCzZm/fsIMWBiArU9umXwFk8rsKN35WYHfAwZjN/jvsn
         RK059sF/MbcLhuDhO2Oe4duMRIoLlzxrgRi1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781729061; x=1782333861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAzJHqCfyzT/fB0ahxtU/ElAip7GVwZ17zIMRkJYuHE=;
        b=Rwl/d9ZhgNxvY5CGTjR5ei+LrfqhsWbKXRAztKzpTbAarZxc2A7phcmGktOEw0PfDr
         zsJUerxdflhtWlQWcn3tjaoh6rGa8lijm72rGcCt8X5dHFiclVUwJfXjwrDGm5n8EgNs
         sR265uP60CBVCuB46SARJa7z6uWkVaWq0Fu3HiIuE8wfmoBFDPBtd3jEVDN+Sx04A/o0
         sLE8eL6ArW2IUSyvDZiiQueO9t9GzUDXfr60GSlF1GAgSSDplowyUfj6HRY7gqyzWfDx
         wHVFtFzacgPhcaDXFdtRpO8hqwwlRA44Dbs6T6UB4AmMn448xuarKbJtphPKxwcVPiEc
         eHHQ==
X-Gm-Message-State: AOJu0YzEIujTeVWi3oA4O/bDOU1my+BQEPlO7pNDHDkym9YZt3WfsQur
	3vnCnvv/7f/bagumoOSkDU+FLueu+7My8WLNRwAljEwyOyFGBJFOwACPyaWYeLHj3rIZUi+pSFo
	Cyyk=
X-Gm-Gg: AfdE7ckWb/ZDUW5ZPg3xXEDx7ISb0qcn9vvt9P494SX26ah/SQvKy0wFkDAUCkVieuc
	vgHEosOycQzOOgbZnPcxEe5QjygAXqAjjXTB681VCSf9UfDmBwgnNuFcaWipxw4kjU+f1XNzKhv
	felO+/usDlx6uVbszgCkJiIEuWGli6/iENaCufkBHpu4ZXXlPfvBLfFA1ireBmB5crayaAFBxwy
	dm05u89SJ+ZVx/pByGNf8an6jFGsvCcdBtdp+g2NcQShtRZv98D1fs0yKvawebDy3TthbUdoXyP
	2mC1Fu9ac8KooRglC/0yspOtKtHKr+OJjyk8mB6Ikgmy+8rXs1zBkBYhSmAWbJYIge9YGMsT/9w
	AG6StDFTTIk96dCRe7p4k4lQBUE8nzHY0518aBa9xmgiJgHMYiomUIAEF1+AjX5X5nIQfLRj+1f
	oYw88TFx69MwVzZKxeA8ir8wWBM3531con4TN41NqgbcZKt44oLpc=
X-Received: by 2002:a05:7300:730b:b0:304:4f23:68d3 with SMTP id 5a478bee46e88-30bc9f539d8mr3410922eec.18.1781729060652;
        Wed, 17 Jun 2026 13:44:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:2a7e:b696:e1bd:476c])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3081e91f878sm23825543eec.17.2026.06.17.13.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 13:44:20 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: devicetree-compiler@vger.kernel.org
Cc: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] checks: Avoid warnings for reg override in __overlay__
Date: Wed, 17 Jun 2026 13:44:01 -0700
Message-ID: <20260617204401.2275738-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A simple overlay case can hit a number of false warnings just because it
provides a 'reg' property [1]:

 * avoid_default_addr_size: the generated fragment@0 node is an
   artificial node, where #address-cells/#size-cells can't exist.

 * reg_format: we're assuming the wrong/default #address-cells here, so
   the analysis is wrong. (We don't know how many cells should be in
   this 'reg', in isolation.)

 * unit_address_vs_reg: we don't know the real node name here. (It's not
   actually going to be "__overlay__".)

All these cannot be checked by the overlay compiler in isolation.
Suppress them when we identify we're running in plugin mode, and we're
likely looking at a generated __overlay__ hierarchy that can't be
analyzed in this way.

[1]
$ dtc -I dts -O dts tests/overlay-reg-override.dtso
tests/overlay-reg-override.dtso:5.2-14: Warning (reg_format): /fragment@0/__overlay__:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
tests/overlay-reg-override.dtso:4.6-6.3: Warning (unit_address_vs_reg): /fragment@0/__overlay__: node has a reg or ranges property, but no unit name
<stdout>: Warning (pci_device_reg): Failed prerequisite 'reg_format'
<stdout>: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
<stdout>: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
<stdout>: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
<stdout>: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on default #address-cells value
tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size): /fragment@0/__overlay__: Relying on default #size-cells value
<stdout>: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
<stdout>: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
/dts-v1/;

/ {

	fragment@0 {
		target = <&foo>;

		__overlay__ {
			reg = <0x00>;
		};
	};

	__fixups__ {
		foo = "/fragment@0:target:0";
	};
};

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 checks.c                        | 17 ++++++++++++++---
 tests/overlay-reg-override.dtso |  6 ++++++
 tests/run_tests.sh              |  1 +
 3 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 tests/overlay-reg-override.dtso

diff --git a/checks.c b/checks.c
index a6037ed08000..dd6824dce6ea 100644
--- a/checks.c
+++ b/checks.c
@@ -368,9 +368,12 @@ static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
 	const char *unitname = get_unitname(node);
 	struct property *prop = get_property(node, "reg");
 
-	if (get_subnode(node, "__overlay__")) {
-		/* HACK: Overlay fragments are a special case */
-		return;
+	/* HACK: Overlay fragments are a special case */
+	if (dti->dtsflags & DTSF_PLUGIN) {
+		if (get_subnode(node, "__overlay__"))
+			return;
+		if (streq(node->name, "__overlay__"))
+			return;
 	}
 
 	if (!prop) {
@@ -774,6 +777,10 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
 	if (!prop)
 		return; /* No "reg", that's fine */
 
+	/* Overlay nodes are special */
+	if ((dti->dtsflags & DTSF_PLUGIN) && streq(node->name, "__overlay__"))
+		return;
+
 	if (!node->parent) {
 		FAIL(c, dti, node, "Root node has a \"reg\" property");
 		return;
@@ -1210,6 +1217,10 @@ static void check_avoid_default_addr_size(struct check *c, struct dt_info *dti,
 	if (!node->parent)
 		return; /* Ignore root node */
 
+	/* Overlay nodes are special */
+	if ((dti->dtsflags & DTSF_PLUGIN) && streq(node->name, "__overlay__"))
+		return;
+
 	reg = get_property(node, "reg");
 	ranges = get_property(node, "ranges");
 
diff --git a/tests/overlay-reg-override.dtso b/tests/overlay-reg-override.dtso
new file mode 100644
index 000000000000..7e5e13883b51
--- /dev/null
+++ b/tests/overlay-reg-override.dtso
@@ -0,0 +1,6 @@
+/dts-v1/;
+/plugin/;
+
+&foo {
+	reg = <0x0>;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 842b543059bb..8f3265afa5cc 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -752,6 +752,7 @@ dtc_tests () {
     check_tests "$SRCDIR/unit-addr-leading-0x.dts" unit_address_format
     check_tests "$SRCDIR/unit-addr-leading-0s.dts" unit_address_format
     check_tests "$SRCDIR/unit-addr-unique.dts" unique_unit_address
+    check_tests "$SRCDIR/overlay-reg-override.dtso" -n reg_format unit_address_vs_reg avoid_default_addr_size
     check_tests "$SRCDIR/bad-phandle-cells.dts" interrupts_extended_property
     check_tests "$SRCDIR/bad-gpio.dts" gpios_property
     check_tests "$SRCDIR/good-gpio.dts" -n gpios_property
-- 
2.54.0.1189.g8c84645362-goog

