Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD71ADC6D
	for <devicetree-compiler@vger.kernel.org>; Tue, 29 Apr 2025 01:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745890976; cv=none; b=Sdf2gZHqFGwslIKjVMz3b0U7mdJ9L1iJL6HlRBJ77/5HO06NBALdUPak7s3+RbEY52GshVSdrSYWNQykVw51XuDjF/WTdwKfY9K9iaE/gn4/sMvPm67P3efGiwHU4p03BcpYTeje1UsUrqZB3no7/wiKBr9j832dXff2a9MkmgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745890976; c=relaxed/simple;
	bh=daSktgaONyW/+fA5sIlVnxktR5RruOpy2xFVjApbL7E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVdMqupNcYCWR9rNjDypKBW1lCA1adeEqs7Quwh/OURYecRDddUQeSxYqORZpdyJuzfv1Q7kLcGjosyd5aGdQtTiD2rW0ykw3oSFn1m0q+wqND+QBR0FfjbtxliHDjz8rHYwPMSNwHQYc7HLVl0LK+ZkVwkTpcF2PFGHXX+SceE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcB44mre; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcB44mre"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0ad744811so41081196d6.1
        for <devicetree-compiler@vger.kernel.org>; Mon, 28 Apr 2025 18:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745890973; x=1746495773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UJnVr4+t59frmYzwdvdchwfY59MSYUieiSlthwy6nQ=;
        b=IcB44mrefeuvAR8emteBIRRq0YNvbSrzDZs6BI9Aw/5aCsBOMu8HGBxztQLQs9EAag
         a4ByyNXJ+iQTbPEoSF/vx+xzrDSpODTGmo2rbyfKn0kTOSMf/3aUucmx+qEP/krv7E/N
         tq6uGpEygqJgA6kQZGmk6sG2dWJssUveXsebKwx5GE6PrYr3SqEXY7zHnbuCdhETG9e/
         B3Uyxos2Orc9tgp4BpwwFfjPLXH66cBkl/+xaEyh67CjO+bEaSTt8Pb4YEZRGqFs8Eqz
         5GCEH57kDk1tgB2XUtMsvUh/hUnLy7jFcDjJb1jr/Pcy9N3tiMeBkIA6qkWr6/xeKetA
         3Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745890973; x=1746495773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UJnVr4+t59frmYzwdvdchwfY59MSYUieiSlthwy6nQ=;
        b=nSEHId+ki3RLSOGq+qN3RLgDdOvvCnBw9b4rv/hQ6Lvc/brhoFSCY1YL4A6M5jinSK
         BwbwO7mn0YjCFmT6fcWTSL6P6COBAsIS/vqM+k8p+zY/ADsTAcYx3H9kmS7VqLZmwzkT
         Q7uZmt8BuHKPjM4q1C8TVMeQqbqGDhqEkvaD+pG5zqhKFC15c+7SbHBPI4V3TOggugbv
         p02qfg/8OjtYm8A4Lz+fCTIHM7kzMnmIkz7jRw7DVbmtJF1Fi2KtOYKFCTINbXzKYmHN
         I4YSKLL2+83dcsZvtnU/vo9Ll3NDL+48wMCzyX6QjWf5I0VRzr1uuaZJOYHVy+RB3PxD
         oj8g==
X-Gm-Message-State: AOJu0Yz17cpUYSKAgzJ7dS6xKVvbnhdp0Ft6QEn8mptl9xCuOD+UbUkE
	U3LtuvQw3wh4BhFxYZanQHdhKGChw+w9TlGB2uSu7PrATQHYzNLIA93RVCP5
X-Gm-Gg: ASbGncvU84UpJq/sfNfZH2/0M/wuYV36tNVMfmJi9pfAfkqR6U+A0RSGqEK/3vzDrkb
	i8iWYT1zVtqPN4XJICPAOww/KywsDTtlMqJW4XVr/XyZ0+UzkVIDtElZ3ufhsUL2hZH6AfM5lbT
	6Lz8FeahKk9g5w5t6NMgM0nNKFnBjSo+tvW5ME+piYvU1girKxz6k186twwXQQDBaiDo+4VIQ1H
	tdT1zeNBIPBVGc12rGdxZ9ArtVyK0unHv3aVp1+89su+AUyXni7oInGwoJH+KFlYKEm7o9Uz7N/
	ghiYykDfI+IyDkRiCOxqrVuiKU8q9OatRNP4VA==
X-Google-Smtp-Source: AGHT+IEnyrugDS2G0eoZvbYZUhj4I34bNpZT81YQ6BVL/nTa4eqcr+qzdaqnmhXbsElz1n6czvphFg==
X-Received: by 2002:ad4:5761:0:b0:6e8:fe16:4d4f with SMTP id 6a1803df08f44-6f4f05ad763mr28822446d6.26.1745890973207;
        Mon, 28 Apr 2025 18:42:53 -0700 (PDT)
Received: from acleverhostname.lan ([2603:6011:3f0:6f00::12ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a7419asm67034126d6.89.2025.04.28.18.42.52
        for <devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 18:42:52 -0700 (PDT)
From: Eli Schwartz <eschwartz93@gmail.com>
X-Google-Original-From: Eli Schwartz <eschwartz@gentoo.org>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH v2 1/2] Makefile: deprecate in favor of Meson
Date: Mon, 28 Apr 2025 21:41:42 -0400
Message-ID: <20250429014241.90681-2-eschwartz@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429014241.90681-1-eschwartz@gentoo.org>
References: <3a024c31-bdeb-442a-9eab-305c0d8fec41@gentoo.org>
 <20250429014241.90681-1-eschwartz@gentoo.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the python bindings is complicated and not very practical to do
in a Makefile. The setuptools invocations previously used are confusing
and don't work very well compared to Meson. Having two build systems
that do different things is also confusing though.

Since Meson can do everything that Make can do, but the reverse is not
true, we deprecate the latter and warn when you use it.

GNU Make can emit a $(warning) on every Makefile run, which is a bit
noisly but means we don't need to have every target depend on a PHONY
target (preventing built targets from being seen as up to date).

Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index a00123d..000dd85 100644
--- a/Makefile
+++ b/Makefile
@@ -3,6 +3,12 @@
 # Device Tree Compiler
 #
 
+$(warning WARNING: Building dtc using the Makefile is deprecated, in favor of using the Meson build system instead.)
+$(warning )
+$(warning https://mesonbuild.com)
+$(warning )
+$(warning Use `meson setup builddir/ && ninja -C builddir/` to build, or `meson configure` to see build options.)
+
 #
 # Version information will be constructed in this order:
 # DTC_VERSION release version as MAJOR.MINOR.PATCH
-- 
2.49.0

