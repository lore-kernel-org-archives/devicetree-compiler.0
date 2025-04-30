Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1E20CCE4
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026772; cv=none; b=sWvYAn4kEGwe7q+NhK/vBR39c6nQBkivmZxEtarWmslgvaI1fNI2ITXV5JfldDsRi/VeMrI3Iwqe8g2hIInT8NlRjn+jbEj0oTyJbZpmbNXX5X5bRxxNAtMHMxhkPaIk0YBRISu4gR1IBvLRaBYAqGiMeHrNhmvZoPcHbiE4kLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026772; c=relaxed/simple;
	bh=87dgP3SGZF7SeNNLyHuDKh8tlXG/Facn2dYhtORdOnY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxJ5v+S0/MYJN5CjXCsm1QIA0yVrEyYp2Shlq4n43ulmd/MXXovc57TRJwwRhBmB4tL8NqPoxr/LC5gw3hm9ui6cRfTAbJvemvAA2m1oV7E/Av8u1gI0nHkOP/v7HjL/1ZHeEdHapRGWRg3Rw45kGAXTQbctaU76BY4MtoFu25E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkE/HVbr; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkE/HVbr"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso113616d6.3
        for <devicetree-compiler@vger.kernel.org>; Wed, 30 Apr 2025 08:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026769; x=1746631569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBFelkOGrv6AFocP1ufRawiNUzuOFNS/lT6N3/lDMWw=;
        b=EkE/HVbr1BgDitmYNIn9sIUerBEEgdfI+C+qIGgGQ+I5S5RQrbtGGaT4UUaQSr6Dr8
         ab9uxGUVcs+swYLJri/JJvsAiAsWt3ldPZWg/xTm5ZYMcGDLzWxzVeIY02q2MGQ8+snN
         Emw6hFMIOO9CWogQpi3PzlX2jn1+Z8Xu/aJrtckfHSefr1Cq4UEHglzfyLyy9Jxy4Grf
         o87unNMQ10rg3QboziAbtnplDTKZLJWBPd17mVaqILQzBVKzT3AG/jdshiSVeUpb+w44
         vstcR6i2PeNIxSfkLnbZfImUUQJVsAOsMTvjO+sEPhHiDHI5vcPnT4QrR9+xXgBJwJWW
         FBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026769; x=1746631569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBFelkOGrv6AFocP1ufRawiNUzuOFNS/lT6N3/lDMWw=;
        b=I04WPp7Cgw+Z2qIg8RZhzv/YGVC9qQoJsMZDXYZUHSauTcL5hWlrMfZse3sGeUFdlZ
         uqOpsgIYQl5N94wJPeO3eICFL7NDxPpXIJa2MdPXKEWpHe3b50vqxzewkZJ5EZE25CHK
         8KkXaFzGYqbvG+yA/Oqb9B1u2TXgSy8jYLE57auHdu3IvLEvTWIC2/Y2RkHUuTr4VWaK
         Wbv3/m9jddmAs8aamtRJU9BlNT9dgI0MArBuQScvAcuK+Kr59l2JbGqE8bIbdu0dzNIL
         wwk0gG7UpHqsi2t3is9sFnBjHCAn6BJC/iNe4rBI+hNc9Yg2ZT7iY+EWfK8tNZxjgFBs
         7kDA==
X-Gm-Message-State: AOJu0Yzse+g33VURJqPldtemeCzcyrfxzgLwNW7AdDpuLFR4/7c0D14x
	6ukQ2uhrshaQx90LEo8mFpcZcSK0uJ/PATUuGB9HOOihdFGsNbL5btlgsQ==
X-Gm-Gg: ASbGnctK7Jy4UXawExsjIoGJSOnUoyNn2OJZjvIdyRf63IPv/FHtlsBqTB4ZgIvg0ml
	4YL0gA/3G8+o8RE+WOjvzjAV9RJETuf3C4++ooAVOzaQxY6hN5cUlul4DVq99hcE+E9+7lM8qBC
	O48p10ndo5fQ/kVws0ZKLG/1UvpgKg4DIwvwdR7yFm7u0PbRLlazq0XGfFvbkUc5KpCs7ITIz+7
	5WtXPI/J90JoNSmfT6yKoKeAGDNtAyr+RcNR6M4aub0nBoHPodFe82LnDV3psCanrVnHay28aVx
	CEA8wmVqZI/BStSJAzAr1bdOQ4EyK2vXa5Gc+w==
X-Google-Smtp-Source: AGHT+IEp8ZUunQMKgN8PpOoJnbJ4Xeb+P3kvoeFKvt6m//YyVERFr23z3MkX+q1ON1lAaGwCRSBsBQ==
X-Received: by 2002:ad4:5ca6:0:b0:6e8:ed7f:1a79 with SMTP id 6a1803df08f44-6f4fcf90f8emr64656276d6.32.1746026769144;
        Wed, 30 Apr 2025 08:26:09 -0700 (PDT)
Received: from acleverhostname.lan ([2603:6011:3f0:6f00::12ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe85d881sm9228086d6.105.2025.04.30.08.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:26:08 -0700 (PDT)
From: Eli Schwartz <eschwartz93@gmail.com>
X-Google-Original-From: Eli Schwartz <eschwartz@gentoo.org>
To: devicetree-compiler@vger.kernel.org
Subject: [PATCH v3 1/2] Makefile: deprecate in favor of Meson
Date: Wed, 30 Apr 2025 11:25:25 -0400
Message-ID: <20250430152601.43554-2-eschwartz@gentoo.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430152601.43554-1-eschwartz@gentoo.org>
References: <aBI_wad4TnNRCTWA@zatzit>
 <20250430152601.43554-1-eschwartz@gentoo.org>
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
noisy but means we don't need to have every target depend on a PHONY
target (preventing built targets from being seen as up to date).

Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index a00123d..6ab5f97 100644
--- a/Makefile
+++ b/Makefile
@@ -3,6 +3,10 @@
 # Device Tree Compiler
 #
 
+$(warning WARNING: Building dtc using make is deprecated, in favour of using Meson (https://mesonbuild.com))
+$(warning )
+$(warning Use `meson setup builddir/ && meson compile -C builddir/` to build, `meson test -C builddir/` to test, or `meson configure` to see build options.)
+
 #
 # Version information will be constructed in this order:
 # DTC_VERSION release version as MAJOR.MINOR.PATCH
-- 
2.49.0

