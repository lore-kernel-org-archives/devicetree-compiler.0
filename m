Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570634;
	b=brjIHZXVqRae2UA1JCh+RVGOsp9v9OmEzYxdI93uILwRLPmJIItQ+PkNjVNOInbk3OoF
	 OgXHlwYBT3gPuRsz8TZ8nWZGVJ13jMCfL24RWl+lxCoSnlW2urLHGuZAszL7bhflIabmx
	 xUgzIRBiPauE6vVN0bBS9U8tElqaYLu+zbHwxn+Daa7MiWbPbZG3Q9z1OYXBLBxK8rKmB
	 RujHloD5hpnHI0DiKHb99go0licVw8Uhc99TQoH+8LVqeM1sgcPHJlIOzUCjmpeOiH9n7
	 KJnKouYJx3LjmCleK0LbDxQZvgpqNAFf19Bg0TRaDiU9swxU+uyCJlzYVLa6f4lnfAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FTgirQjK8v+h6bBIdw7yINH0jFX7wTeSxRtCfIzO3b0=;
	b=vnGw9XVDHEg48ogkR32iz06jBCnpw22gxI/2cjeQGp+9ekvO4mnTWFxXUEJECOnl93Pf
	 yxXTH6OeUxSSQ45PsF02uPKlM7h+sVHzQvbl3vWSvKgGXoCjMpcIhXaqNbCwdkfvqJPGA
	 E3b0xNeUf6Y5eufH8+BLRQez7h4NCjlJneDM4TcJ9UDEJjWa7h5ECT5z+8quWczhKM8nQ
	 WjqgEHHEAK3jeb5hJ2NP2F84vL4AMoKX9GA/h9wKhl9/S0CSnPWI7PntSdqM+8AS8i81O
	 f3lZ7f6njocAO2+KTxPNaVYZIsjAGc4F5gK8lGECTE8smA6YVkqHfD31aSVmF13T0bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NDbRPLIW;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF9606A335
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AF9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NDbRPLIW
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2554429c88.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570633; x=1794175433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTgirQjK8v+h6bBIdw7yINH0jFX7wTeSxRtCfIzO3b0=;
        b=NDbRPLIWhu00ercRXlZ71a+tzkP7hVAIAQUnLdJNmeFgQEpqbfzDjL28+khq0RpBmN
         /i78gByfpNvPgN24KJ4BAJX+XlMx+Apoo/KlqJCwzJiTbxCl1HnrWJo9svW7KofJjTX8
         J1VS0XADlvhrFz7SioNX+Mm/BbRrRGY9zVEig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570633; x=1794175433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTgirQjK8v+h6bBIdw7yINH0jFX7wTeSxRtCfIzO3b0=;
        b=ND57GJCdAXMgh0G33jpnHMsvEzBKtBZOVS7R/2V020TW8tkWfvCVxx6KBHZnypMevG
         sd6N6d2d11sgHCbkBK3gG2r111nUWGeSUn22Btzty7eQzZ2tGwQNyvnlHFv/UjW6uqiZ
         ekHc/Xp7+fH2cdgu2TqRjy7iSGkUOhjlAuPZ4bY0Qz7i9V8vkIOFAeTjcBACEtfp2slv
         aKDWmTwg8ie9mCKkaqX0BLcA1ahdOO60TTTHSpnPFuBBjgftZgAS7YLVn40vC0jxR+AY
         WiWkkeRzeaM+ZZGpLJPsy/JBzlU470nunt2GqhgrvhZyBlZn7dsBBjcXrHEgzDnQmkjf
         CFZA==
X-Gm-Message-State: AFq9FYLPPxg5yBr3DjD6VKd47wE/Z/FmGvaTuOdQa5awHRAU3vBJkc0g
	y8RQ2WTTcI0hbFVLsgxm9mJTUDN+cNgbCVJVc33QXESimUZ0Jars+OyBYi9nB6UbokavVt04IwW
	BNXzKI+yc
X-Gm-Gg: AYBFou2oE5PXmsuOYFDAH/dBKLiGq54xq6CFI065NgEu80+fMwqHkreW2a/oey86gRg
	/uau2t/UEvsqpXPgzxyz+k/xTC2EfbXmWfA7c8JFHmNeUmUVyhaU2IB904Cf19K9f8welJEgEJa
	lHQb/cV+4zAyAKYQ0Py+A9F6VipCzE9y76eAcKpfEWiH9FXBAX3oRRb0xgFjwkz0GjlPDYUbBTb
	ksu5rG4hfjCK76y95EyPKNgBcGcUKA/FIbzyqAmSCe7Brbe/iR/bo4vtWnRvVjtqYHGYpphLdII
	BuUrspNRTOad26jBN8wXjzgFsV/x4ku0T2YSfcGQTS216gHrWYISzGX0k5feu7MNppUnZI8ehOl
	QBqONFKqxf2Uv+dGuGWN0VOWoweUz78SdqEsmnYWu0e4b7F1dHNEY7A6577muJayCx/Qm1vFlrC
	mrAt5tvNH5auahU7qwX5uym9QzgXIq3GTSFadLL5BRw5v2J0AacHLYZwNj1rmRHQ3pLB7UcmGw9
	PmCS3gLaGjL8xtSWHPviNdi6tq8YJeo4O2TyMFbYYJXgiShxrunoLbdLC5ZLEXRhQae2nDiIjWA
	kGw5SYNbQMrBNDZ9MHfNPT54st8Id2z+WXtApZ1mMFNtUwPjEDz7e2BHfuUJp0jAipcjyJQB6Cq
	wHb0h31ByPS1bVSE=
X-Received: by 2002:a05:7022:3a06:b0:1a5:1c15:9ea3 with SMTP id a92af1059eb24-1ac5ac4b77amr13607573c88.17.1793570633519;
        Sun, 01 Nov 2026 14:03:53 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:52 -0800 (PST)
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
Subject: [PATCH v3 09/15] libfdt: overlay: Prepare fragment path helper for reuse
Date: Sun,  1 Nov 2026 14:01:16 -0800
Message-ID: <20261101220224.1436242-10-dianders@chromium.org>
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

Generalize `overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` to
accept a length-bounded `path` slice that is not necessarily
NUL-terminated (using `memchr()` instead of `strchr()`, moving the
NUL-terminated property check back into `overlay_symbol_update()`, and
rejecting a trailing `'/'` after `"/__overlay__/"`) so it can also split
`:`-delimited paths from `/__fixups__` when updating
`/__local_fixups__`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Move the fixup offset overflow fix into its own standalone patch at
  the start of the series (Simon Glass)
- Move the removal of the redundant *sep != ':' checks into its own
  standalone patch
- Reject paths ending with a trailing slash ("/<frag>/__overlay__/") in
  overlay_split_fragment_path() (David Gibson)

Changes in v2:
- New patch generalizing overlay_split_fragment_path() for
  non-NUL-terminated paths in libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 978c9c23bd56..36f2377cf7d8 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -944,8 +944,8 @@ static int get_path_len(const void *fdt, int nodeoffset)
 
 /**
  * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
- * @path: NUL-terminated input path string
- * @path_len: Length of @path in bytes (including terminating NUL)
+ * @path: Input path string (need not be NUL-terminated)
+ * @path_len: Length of @path in bytes (excluding any terminator)
  * @frag_namep: Output pointer to the fragment name
  * @frag_name_lenp: Output length of @frag_namep in bytes
  * @rel_pathp: Output pointer to the relative subnode path after __overlay__
@@ -970,11 +970,11 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 	/* keep end marker to avoid strlen() */
 	e = path + path_len;
 
-	if (*path != '/')
+	if (path_len < 1 || *path != '/')
 		return -FDT_ERR_BADVALUE;
 
 	/* get fragment name first */
-	s = strchr(path + 1, '/');
+	s = memchr(path + 1, '/', path_len - 1);
 	if (!s) {
 		/* Symbol refers to something that won't end
 		 * up in the target tree */
@@ -984,13 +984,16 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 	frag_name = path + 1;
 	frag_name_len = s - path - 1;
 
-	/* verify format; safe since "s" lies in \0 terminated prop */
+	/* verify format */
 	len = sizeof("/__overlay__/") - 1;
 	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
 		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
 		rel_path = s + len;
-		rel_path_len = e - rel_path - 1;
-	} else if ((e - s) == len
+		rel_path_len = e - rel_path;
+	} else if ((e - s) == len && (memcmp(s, "/__overlay__/", len) == 0)) {
+		/* Trailing slash after /__overlay__/ is invalid */
+		return -FDT_ERR_BADVALUE;
+	} else if ((e - s) == (len - 1)
 		   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
 		/* /<fragment-name>/__overlay__ */
 		rel_path = "";
@@ -1062,7 +1065,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
 			return -FDT_ERR_BADVALUE;
 
-		ret = overlay_split_fragment_path(path, path_len,
+		ret = overlay_split_fragment_path(path, path_len - 1,
 						  &frag_name, &frag_name_len,
 						  &rel_path, &rel_path_len);
 		if (ret < 0)
-- 
2.56.0.317.g454f8302e1-goog

