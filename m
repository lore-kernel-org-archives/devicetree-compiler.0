Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570608;
	b=ckxkNVDFHpT26p3rUBm8a+KE7ctelC6UxehxLU53D0HvNDlXoLlBwin7FVotUmVyqXdf
	 h0t55ONOaFVuKLIKkav1IPhSQBsbaPzR9pfaHvIp33+wMtgVJ7jHcy8xQOoAoFp4NFrs9
	 MbY8a6RN/6XbqR7wUqjYa5y1lT/YdEVJOiYDoe8c2hw55ZSvVqflNnoeLYHFf1DE2UXqp
	 WN3xF4+INTNjMRhrYuZW72KsBfakWw9Km+AAROMOn9cy2A/LGgB6VKVITcEQHl/8Wlj90
	 ZrxLNvKxaKCUFJouMa+8l77aCthYe4CFJgPGnOZgg0lLRMiSD7z4s8Wvo4oJBy58FaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z5HwIFPda1w4a8mgq8cAR9fw2WdrV327kIQbUNNoV+Y=;
	b=wNdN2o2da9+Vy0ajQyQ/X73kdu2n2HV63mVjwY6g0RorGRT64MJXidbuRqk2LPZl2LtA
	 5omVAtiXss25843dsuPBsJ0xHER2+Ne91Ql/mtOczlU4ArhtjwLuck1WwSUh90SdNGOoK
	 alnDeZSkRy0LEv7hEAF95CcOGiWPpbHCsMNsCZNI7kP71sTbsqUav8TosxAWgwxd905uu
	 UmC6LEW3NweEdjkUUmcp33q8YEfWZhUGzXm5vrg5uFC1l3/u1aL4i8tJmpg20IdBehWmy
	 xBG9cW2/SXdQ2a+UWU+7I1RTlH6YcJOnWoEcHdleieL6xnIZiKygZ2t4dCuaFvLqzhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Oh0Wa4AK;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA800606A32E
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA800606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Oh0Wa4AK
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2554017c88.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570607; x=1794175407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5HwIFPda1w4a8mgq8cAR9fw2WdrV327kIQbUNNoV+Y=;
        b=Oh0Wa4AKdc7iROHr31BGwvbHlO/NJGLhoESDgT8sSOB1NzFqWpVVXTVzj14BuO/uJI
         +X4kINBdEpOUfCF78tdKmT14rd91xZBfOIUPjcUumd+9eere6w3TiR5SYooBNMS7mxGc
         omaDkWqfjFwf9/yzSfoiurmYaGttHpgVpBK1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570607; x=1794175407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z5HwIFPda1w4a8mgq8cAR9fw2WdrV327kIQbUNNoV+Y=;
        b=FEabrneMNuOPYMRWYDB7mi2qMff8w1rcGEVjZ2yPZwxa6aP42cxOUocvA8ujbDBBJn
         tx4DicYpbHt/p63z0Z2GzjQy9cxzsoOYoOQN8/HIuBClSieDr4DjG6C4hYGfbwj2uyCm
         DlTNcqbs8lXmcrVJxB+Ee3N/7Li4M37Hfs1ztRaAPRB/O9MOMFhXzGSYraljZZMHTOQo
         9qLJ0Jx0S5VRK0jLibU4GChNY2uPijFD833ieSAZ0f7j2HsmKPGBZBjkBzIyfp48fdE1
         Znz3L7KFg7m7k9nbDBtmoceUp3dLleNB/zITiLm65eYUz/1DYxyHvD/AAzv82DdgDWru
         6UeQ==
X-Gm-Message-State: AFq9FYI4R3KwRy2WUmXry9TbYisiW77jS989Od6v+6PHg7n4yw/sxlrg
	+MdhNkVocLTVArVSZ9fwmJWDk0STDZbSjq6r0q1ZpxqxIgIPxBQb8NUjS1vjSOirBpodfxgYH/N
	QD0dqcHlV
X-Gm-Gg: AYBFou2G8tu+7RlEi0nR9XzNdj0CleKIX6HJw0fwDiKcTJyM1DRC0t1tqed3GtY6RNf
	5xc5KCXoZpi0DU2DlnSk+W9FRCCLcEze9TCt8cIeAEl4RnNvOtBlyx0K0xct0o1DwErhndt7yo3
	n4rGy4bbsHPzyeq0JTE6VM+yBJMS9+UyBAOqS0iv8kV7WlyTdTciAPWmew2lLxOh/Qjg8IPDw89
	g6xkpSUENdfMnbz1LiAVyArTwCIAfU1fwHmSKPD89txwhJziAwSMog6vfDpqGsxLXyOI11WOprA
	7PHM344wQhbpv+zzPAOMtCwFQvnvecovFJbn+LhN/CtSbk3AF9Iy8fpWPuQJyXKfhEPIbnhBdIN
	fNtWPZdnps9WPPLpfMIB8iZ21EHZXJaT6RLLJ1f39SQ5R/QZ6b7g+vRpEzZ9dWySDJyvELXFs1T
	nrH3xIzil4MvPuLhf+FZ5kU817JwxlxdhJGkNjKaFCOfYq9RgbLf5fXl5kps6RzSCEawrWQ76J2
	11xFvB65i6fEVbQ0CCqe7+YDyiMzIS+XSrdIZMvIYwt5lbcs9AD60p3LDcF6RhU8fhhGR5LIdH9
	6uMejh7GtDkDs+wcokOYVO96vFk5UkaxEU2c7pbtzz3OHo3L4wUCRLdPyadjXLTi9v+ZhNiH9tH
	TKJWaUx8PiWLZxg==
X-Received: by 2002:a05:701b:4348:b0:196:d6e1:108b with SMTP id a92af1059eb24-1aed79b3f6amr8350791c88.10.1793570606920;
        Sun, 01 Nov 2026 14:03:26 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:22 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 02/15] libfdt: overlay: Drop redundant *sep != ':' checks after memchr()
Date: Sun,  1 Nov 2026 14:01:09 -0800
Message-ID: <20261101220224.1436242-3-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
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

In `overlay_fixup_phandle()`, `sep` is obtained via `memchr(..., ':',
...)`. When `sep` is non-NULL, `*sep` is guaranteed to be `':'`, so the
`|| *sep != ':'` checks are redundant. Drop them.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split the removal of redundant *sep != ':' checks out of "libfdt:
  overlay: Prepare fixup and fragment path helpers for reuse" into a
  standalone patch

 libfdt/fdt_overlay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index c6dc4774cff3..8d96428af04f 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -432,7 +432,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 
 		path = fixup_str;
 		sep = memchr(fixup_str, ':', fixup_len);
-		if (!sep || *sep != ':')
+		if (!sep)
 			return -FDT_ERR_BADOVERLAY;
 
 		path_len = sep - path;
@@ -442,7 +442,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		fixup_len -= path_len + 1;
 		name = sep + 1;
 		sep = memchr(name, ':', fixup_len);
-		if (!sep || *sep != ':')
+		if (!sep)
 			return -FDT_ERR_BADOVERLAY;
 
 		name_len = sep - name;
-- 
2.56.0.317.g454f8302e1-goog

