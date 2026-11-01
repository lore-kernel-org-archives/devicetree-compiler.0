Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570633;
	b=a4ZXzXcDQuJALjGyL4CF4w0e2hC1OWiJRH8OTZHoGYxHmHNaA/KtfWVt9WpjGHgyPa0k
	 uyhhFHYlIkwmMOOKfyRDsWEZxezKHHBP0nkIxfgBAvHsVAMEVBkzwsfWJNpDfjsFI/HTU
	 JH6ThwVV50y5yGZwl3JPwGmjMxHjxPgWqZ8xNuxz2M8YWGn2iRa9vExTl+MDjTzxjxtKG
	 kx0xX3sDnfPQMY4zFQGgEipzuqU7PX+vgT4r+SaT/F/UeI71GW4UuWN7gTmLG8BQkDF0Y
	 ijRbu6jwRvb4tq8tv0fOVP1qi/H6mkRH4cPE37LNxlDgWuOyEAIhAMIkpNvq4Z6TNcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ua2VboypW5aNhhHvco3/R0nCLYZnZACPiM6sk8Dfv1Y=;
	b=UJcsvjh89Zt9SyDYR5575LS2vnOsaPcLU3c/+N+MxpibdflJJZ89bymnzv+bjeN1Yhc7
	 nra+fJNv+5+WDEvr8bvzA6WEZ9QpwxWeCsZXsb9S3Mc9TCD9HGzYtDDtYfL1sp50l8y1t
	 vjynLsRYjJvApXRVXoWNaFMKH/Bj4DyB+4d8JgbF6+xPO3WrXq7KKXZksqHJpDQmSww5M
	 j8ghZzaPknWmyOtHsFjVQAw3JQSyFZPw/WWas97f9WEGHisMPuJ0rKo1/Twf3PWc/821Q
	 bqIRTRUhBRGzxhlazonOB+td3nrRM8eaKXuln1/BpxNqUr7uTK8NgOHMM0Wf0CBCqoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="E9h4+K+/";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAB2606A324
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAB2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E9h4+K+/
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso3295559c88.0
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570632; x=1794175432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ua2VboypW5aNhhHvco3/R0nCLYZnZACPiM6sk8Dfv1Y=;
        b=E9h4+K+/4l/lRhF8Jk06ZZDPRZsL04sH5a9ZhX0bDRbWTHoZ6CxGgcBUd5WTsHwi/0
         TOxVeK4tfj8TsJmlIU8jRIMELSbHqeOEPjdQUtSaaywGbVe1eHO02FfMXa/c7s/VQ9Fb
         MT/xpgivNIkvuqaog6LKOvL7po+iFYcyeb/zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570632; x=1794175432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ua2VboypW5aNhhHvco3/R0nCLYZnZACPiM6sk8Dfv1Y=;
        b=ZcKeCQxz5w/T17fZ5fmUpA9ICCQIKkjwYs8xEGiiD8uz6UNn6LKg8WlzKt9Ng7I1b5
         Rtb6nH+8/jNAOXgqVIYCQyxhxcamSJEcPTDJZPmNhE3Heq5dvjRcXdDsolLOUaE2V1cI
         lXJ7XseEQexvNbFjaBu1c5jZvWvQNCXRuX7I4REQAOMc98H7sEPA3fOioQMNxIU+N5X6
         ibVsGVYCpq8TcUYFze/dOYUdIBuoNmiZwTYcEx0VpqicIXffziXukI1k/THhMqUq/tWW
         TSXw1AC4SrF25rWLOU/fcA8mLV2B4Qj6bVRrTlpo2Q3dQJFV611/Vq6slRtYzh8Lf+QF
         ktiA==
X-Gm-Message-State: AFq9FYLN5FUH+/8C53hZdQ/Xf+sBItZ+wfUgjudftjIVbsAU61u/ffo0
	EWqnazwHLDQTEvo8OWqi5nGOmerXrUCKqwWNGyyLXemtY4ODLWVr473E8mnocl7AZEOaXfNDPm/
	gLYlE/czI
X-Gm-Gg: AYBFou2uTIkckwQhroxJlReiNNXHmlWnxHFmh9/mXcB5K4CYXMsaPzRzdCC1gtFEzCm
	RfCuEs+608j2oAKkTUfMdZkaikx7Eq3pt447Hmwu7qWLaTycUCgTEf0VaUJErFI2CQo/q4aKp6u
	ZJ0+S8dtEb/jEJCx8ASAdR9dC2T/IdpAMh+vRqVqaGRPTiyM7ADSGVXeYtiJAOBWvqqyWZ+BWdW
	B0lBtuJqjb62KyMvizhSQkB2ZbRiZeOJ1CaBu7UQl52KZPEUXl8oJKq2tZMFcQIg+PWD1dECEME
	K3ZaNzsnM5wdqmLlkdlQRmX40mTR1qARlXogSO36h+MsREFFimvbg7ZX16fo90XeJgPse+CGuPF
	RuwZaQqq1MlXqXBOWmNZTyItZHRG+S9Xduagazinot8CCoqg1hZLo0i8zlsUXZfp+PinA0ppNsJ
	P3JVFszlvmeZinMb2U0kSg/HMUt0P6jfU823HVHytWTy2Afe5dnAuUqLRSMCBfQ+8dpIB8VWp7m
	98uVlTst2AbDXRSl1mmc7JiOOSPqHxexSWm6bbMzdCq04j4jtlOECH6OE/cq/a4gkft5lsZ00Qh
	NgNj2n4X6g5bh3nUTCuHvL5ygD1C7aS9JmD0HfgHlscpfJjAZCjnzhumaBy6nIDtKGsDeD9Kyzp
	iIT0tLJ7hr+kNjyQ=
X-Received: by 2002:a05:701b:451c:20b0:18b:755:ae06 with SMTP id a92af1059eb24-1ac5c555461mr11685834c88.37.1793570631444;
        Sun, 01 Nov 2026 14:03:51 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:50 -0800 (PST)
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
Subject: [PATCH v3 08/15] libfdt: overlay: Factor out fixup and fragment path parsing helpers
Date: Sun,  1 Nov 2026 14:01:15 -0800
Message-ID: <20261101220224.1436242-9-dianders@chromium.org>
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

In preparation for updating the base device tree's `/__local_fixups__`
node during `fdt_overlay_apply()`, factor out two helper functions in
`libfdt/fdt_overlay.c`:

- Factor out `overlay_parse_fixup_entry()` from
  `overlay_fixup_phandle()` to parse `"path:name:offset"` entries in
  `/__fixups__` properties.
- Factor out `overlay_split_fragment_path()` from
  `overlay_symbol_update()` to validate and split
  `"/<fragment>/__overlay__[/<rel>]"` paths into the fragment name and
  relative subnode path.

This commit is pure code movement with no functional change.

Reviewed-by: Simon Glass <sjg@chromium.org>
Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Document in overlay_parse_fixup_entry()'s comment that @valuep and
  @lenp are advanced past the consumed entry (David Gibson)
- Return 1 (under __overlay__), 0 (not under __overlay__), or
  -FDT_ERR_BADVALUE from overlay_split_fragment_path() instead of taking
  a bool *is_overlayp out-parameter (David Gibson)

Changes in v2:
- New patch factoring out overlay_parse_fixup_entry() and
  overlay_split_fragment_path() helpers in libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 230 ++++++++++++++++++++++++++++---------------
 1 file changed, 153 insertions(+), 77 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 8d96428af04f..978c9c23bd56 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -361,6 +361,81 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 	return ret;
 }
 
+/**
+ * overlay_parse_fixup_entry - Parse one "path:name:offset" entry from /__fixups__
+ * @valuep: In/out pointer to the current NUL-terminated fixup string;
+ *          advanced past the terminating NUL byte to the next entry
+ * @lenp: In/out remaining length of the /__fixups__ property value;
+ *        decremented by the consumed entry length (including its NUL byte)
+ * @pathp: Output pointer to the target node path
+ * @path_lenp: Output length of @pathp in bytes
+ * @namep: Output pointer to the target property name
+ * @name_lenp: Output length of @namep in bytes
+ * @poffsetp: Output byte offset within the target property
+ *
+ * returns:
+ *      0 on success
+ *      -FDT_ERR_BADOVERLAY if the fixup entry is malformed
+ */
+static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
+				     const char **pathp, uint32_t *path_lenp,
+				     const char **namep, uint32_t *name_lenp,
+				     uint32_t *poffsetp)
+{
+	const char *path, *name, *fixup_end;
+	const char *fixup_str = *valuep;
+	uint32_t path_len, name_len;
+	uint32_t fixup_len;
+	const char *sep;
+	char *endptr;
+	unsigned long poffset;
+
+	fixup_end = memchr(*valuep, '\0', *lenp);
+	if (!fixup_end)
+		return -FDT_ERR_BADOVERLAY;
+	fixup_len = fixup_end - fixup_str;
+
+	*lenp -= fixup_len + 1;
+	*valuep += fixup_len + 1;
+
+	path = fixup_str;
+	sep = memchr(fixup_str, ':', fixup_len);
+	if (!sep)
+		return -FDT_ERR_BADOVERLAY;
+
+	path_len = sep - path;
+	if (path_len == (fixup_len - 1))
+		return -FDT_ERR_BADOVERLAY;
+
+	fixup_len -= path_len + 1;
+	name = sep + 1;
+	sep = memchr(name, ':', fixup_len);
+	if (!sep)
+		return -FDT_ERR_BADOVERLAY;
+
+	name_len = sep - name;
+	if (!name_len)
+		return -FDT_ERR_BADOVERLAY;
+
+	/*
+	 * Require an initial ASCII digit because strtoul() accepts leading
+	 * whitespace and '+'/'-' signs (wrapping negative values to unsigned
+	 * long).
+	 */
+	if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
+		return -FDT_ERR_BADOVERLAY;
+	poffset = strtoul(sep + 1, &endptr, 10);
+	if ((*endptr != '\0') || (poffset > UINT32_MAX))
+		return -FDT_ERR_BADOVERLAY;
+
+	*pathp = path;
+	*path_lenp = path_len;
+	*namep = name;
+	*name_lenp = name_len;
+	*poffsetp = poffset;
+	return 0;
+}
+
 /**
  * overlay_fixup_phandle - Set an overlay phandle to the base one
  * @fdt: Base Device Tree blob
@@ -413,52 +488,14 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		return -FDT_ERR_NOTFOUND;
 
 	do {
-		const char *path, *name, *fixup_end;
-		const char *fixup_str = value;
-		uint32_t path_len, name_len;
-		uint32_t fixup_len;
-		const char *sep;
-		char *endptr;
-		unsigned long poffset;
+		const char *path, *name;
+		uint32_t path_len, name_len, poffset;
 		int ret;
 
-		fixup_end = memchr(value, '\0', len);
-		if (!fixup_end)
-			return -FDT_ERR_BADOVERLAY;
-		fixup_len = fixup_end - fixup_str;
-
-		len -= fixup_len + 1;
-		value += fixup_len + 1;
-
-		path = fixup_str;
-		sep = memchr(fixup_str, ':', fixup_len);
-		if (!sep)
-			return -FDT_ERR_BADOVERLAY;
-
-		path_len = sep - path;
-		if (path_len == (fixup_len - 1))
-			return -FDT_ERR_BADOVERLAY;
-
-		fixup_len -= path_len + 1;
-		name = sep + 1;
-		sep = memchr(name, ':', fixup_len);
-		if (!sep)
-			return -FDT_ERR_BADOVERLAY;
-
-		name_len = sep - name;
-		if (!name_len)
-			return -FDT_ERR_BADOVERLAY;
-
-		/*
-		 * Require an initial ASCII digit because strtoul() accepts
-		 * leading whitespace and '+'/'-' signs (wrapping negative
-		 * values to unsigned long).
-		 */
-		if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
-			return -FDT_ERR_BADOVERLAY;
-		poffset = strtoul(sep + 1, &endptr, 10);
-		if ((*endptr != '\0') || (poffset > UINT32_MAX))
-			return -FDT_ERR_BADOVERLAY;
+		ret = overlay_parse_fixup_entry(&value, &len, &path, &path_len,
+						&name, &name_len, &poffset);
+		if (ret)
+			return ret;
 
 		ret = overlay_fixup_one_phandle(fdto, symbols_off,
 						path, path_len, name, name_len,
@@ -905,6 +942,72 @@ static int get_path_len(const void *fdt, int nodeoffset)
 	return len;
 }
 
+/**
+ * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
+ * @path: NUL-terminated input path string
+ * @path_len: Length of @path in bytes (including terminating NUL)
+ * @frag_namep: Output pointer to the fragment name
+ * @frag_name_lenp: Output length of @frag_namep in bytes
+ * @rel_pathp: Output pointer to the relative subnode path after __overlay__
+ * @rel_path_lenp: Output length of @rel_pathp in bytes
+ *
+ * returns:
+ *      1 if @path is under an __overlay__ subnode
+ *      0 if @path is a valid path not under an __overlay__ subnode
+ *      -FDT_ERR_BADVALUE if @path is malformed
+ */
+static int overlay_split_fragment_path(const char *path, int path_len,
+				       const char **frag_namep,
+				       int *frag_name_lenp,
+				       const char **rel_pathp,
+				       int *rel_path_lenp)
+{
+	int len, frag_name_len, rel_path_len;
+	const char *s, *e;
+	const char *frag_name;
+	const char *rel_path;
+
+	/* keep end marker to avoid strlen() */
+	e = path + path_len;
+
+	if (*path != '/')
+		return -FDT_ERR_BADVALUE;
+
+	/* get fragment name first */
+	s = strchr(path + 1, '/');
+	if (!s) {
+		/* Symbol refers to something that won't end
+		 * up in the target tree */
+		return 0;
+	}
+
+	frag_name = path + 1;
+	frag_name_len = s - path - 1;
+
+	/* verify format; safe since "s" lies in \0 terminated prop */
+	len = sizeof("/__overlay__/") - 1;
+	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
+		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
+		rel_path = s + len;
+		rel_path_len = e - rel_path - 1;
+	} else if ((e - s) == len
+		   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
+		/* /<fragment-name>/__overlay__ */
+		rel_path = "";
+		rel_path_len = 0;
+	} else {
+		/* Symbol refers to something that won't end
+		 * up in the target tree */
+		return 0;
+	}
+
+	*frag_namep = frag_name;
+	*frag_name_lenp = frag_name_len;
+	*rel_pathp = rel_path;
+	*rel_path_lenp = rel_path_len;
+	return 1;
+}
+
 /**
  * overlay_symbol_update - Update the symbols of base tree after a merge
  * @fdt: Base Device Tree blob
@@ -925,7 +1028,6 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 {
 	int root_sym, ov_sym, prop, path_len, fragment, target;
 	int len, frag_name_len, ret, rel_path_len;
-	const char *s, *e;
 	const char *path;
 	const char *name;
 	const char *frag_name;
@@ -960,39 +1062,13 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
 			return -FDT_ERR_BADVALUE;
 
-		/* keep end marker to avoid strlen() */
-		e = path + path_len;
-
-		if (*path != '/')
-			return -FDT_ERR_BADVALUE;
-
-		/* get fragment name first */
-		s = strchr(path + 1, '/');
-		if (!s) {
-			/* Symbol refers to something that won't end
-			 * up in the target tree */
-			continue;
-		}
-
-		frag_name = path + 1;
-		frag_name_len = s - path - 1;
-
-		/* verify format; safe since "s" lies in \0 terminated prop */
-		len = sizeof("/__overlay__/") - 1;
-		if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
-			/* /<fragment-name>/__overlay__/<relative-subnode-path> */
-			rel_path = s + len;
-			rel_path_len = e - rel_path - 1;
-		} else if ((e - s) == len
-			   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
-			/* /<fragment-name>/__overlay__ */
-			rel_path = "";
-			rel_path_len = 0;
-		} else {
-			/* Symbol refers to something that won't end
-			 * up in the target tree */
+		ret = overlay_split_fragment_path(path, path_len,
+						  &frag_name, &frag_name_len,
+						  &rel_path, &rel_path_len);
+		if (ret < 0)
+			return ret;
+		if (!ret)
 			continue;
-		}
 
 		/* find the fragment index in which the symbol lies */
 		ret = fdt_subnode_offset_namelen(fdto, 0, frag_name,
-- 
2.56.0.317.g454f8302e1-goog

