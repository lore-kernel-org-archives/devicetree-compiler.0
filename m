Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224600;
	b=jrO31dXmSP/62v8B5+Wdz1/Bu+LHeEqCV4KnjueR8PSx0GsX5/2THdIsfsHRgO7e48Yk
	 dDI5kdIb5ctYUpcHys4oBm6bo1OquIlyldoZeITJs2grBCBtxuGHw2IhaqXykS6cLV/1K
	 70kSbeMf3EVjVp6z00tW8Mjj+8GV/eLCKn7GChTm6KltTXhsdwSnFfZcb9ffMr8CgFzMs
	 fVEIeAf9ekubdZjfOEXDhr8vntFPGOj9OzsYdDLxf/GPt1ewnRahW+cyQx37SSMulcTpI
	 zYTL/z6a4C6XEWHdHWtDfA6C17OeI59vpPppMBQOars2QYyPEr4eGTRwufzY3jM42/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RhCp/61kQDDZJEt9zu5kg04zSyX2rdFkpQ6rLDYQN6Q=;
	b=E5U+CQds4wxg+YSRTjiJ2scmaEZtscPZPD9tLDYcUf0vgSf6UkFl6cpK7F91StgA24p5
	 4vdV0aQ2DoboAsOc5aFoSTeV7p1AKB6VXUfzjv/RcTYtpm62dQtGkg+F/wwd42vf4GUaG
	 Pcg5S245hc/6wIhHkLSvFGnErnbG2NdO6rrqZ1sqi8HLkEgilupkS3IB52dlyqiDlNNuS
	 BNGJZRL3vVec9CKTwTcYs71/KMFvLg4nLt6Sk5GBNcII02OC3Y32huRzM+tLxTZ6Y72kp
	 Dam3yg+gsuUvcWuA6/Djr32Akc2x/IYhNYPVDTXf5axYB6Nakqmz0Cu/ptrcMKAS6wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RbPng09J;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A66D60A2638
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A66D60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RbPng09J
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a1947498bso47256eec.1
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224600; x=1793829400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhCp/61kQDDZJEt9zu5kg04zSyX2rdFkpQ6rLDYQN6Q=;
        b=RbPng09J1uUuo4smSeIG++PvHgPwDC+JSS6fKpiGKnMtAN7asPstkwl9u2USLxyWoo
         AEGOojCM8Ems6zlpK8UJmdCbh+ru0y7EPkm68M8tk4G0OgCIeH4zpECk2xDQoPIdDiV/
         bQVkazqXLH7RUxdQi+bv70Gl/T7yJY4p5ppiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224600; x=1793829400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhCp/61kQDDZJEt9zu5kg04zSyX2rdFkpQ6rLDYQN6Q=;
        b=2kKokrHNTF5/zpUBSp9QJFUSbdRnyrtnHqNGcOuJd+tcLsHcINNhX8uReAxckNlucw
         x+pcAg9NKS2ZbX6BFgN0NOkYCLtHyXH05sZHiReOe3Ljrrzd4QG/pdW4gfDLMCvda3Fl
         skxR+55Gd1yB4Xg8+XtALAFVwf+2TOgn1utHgcRfdt6/sfobhRNOIw37n4eKRn8W5yaV
         DjPmGRXhUpMMgCKxMkONelUBIOwRZM+xukmIXxh7XxtWswifX4uXPxBTou6O1871/+in
         6TLmBHt4LxJdEom9QafqCIjWH2GMvWppUyaa3Me4HfL7RrD0YUy+slm/+NWlZ3T7uKZs
         gW4w==
X-Gm-Message-State: AFq9FYLUItSSyGEHgYIqzIHlXrbmjVFsNQArRKSUXz/1j3dXtVgdEveI
	bgMuPIqAHLL8IRqRbA60LPPvS3WyVw8Zw713evUE1zZ8Ug5IZHO4dfLz70+OSNpRVjbJQyOSpek
	4bOol6oZO
X-Gm-Gg: AYBFou1trggVRiOeBq1y1EZdjcdmmBlMAM0JsN7KcHwwGoKGUr4Mqg/7boXMiXzgQQM
	K9btUyebUyZYrgGGwbF5Yx6Kxp6qZo0dYVdiQnZqMIjkpD6NEMnsJMBzTwmNRoEKXGCV3+1bFId
	ye1ASlMCmWXnQL59UftblyC1Ijy7F/HG7kaw7/m/Uh8sfDj+61axmXzKRmU59QKnANOQkFargs1
	3PwIFAK8l1Mf+lkDs+z+TXzOcOM7f02+IMGUhL1rc+CbiJwNM+xNreSYSLHtIqfjRQJvhTIEsN9
	cMI8ttmgDGWJVSNkhAT7/rbSPNPkn6cNC4ZVTi6jmiCTn4bB/ukZz7ACoyqfZNmfeuaHmhNdIqh
	vH9+Z8R94nkSF2LlyE2RT+Z9JlWCmy/vO3bZU4Xg4optMpCxfiF4/J8AyNgoq+TJFN1EjmaRnJM
	ggmBmjJ88n+ssTJ68CUF4cvg4w0V3r2wqsgvZazrKy1Qv4fX9y3cctIrAHpqwoZRJ9pc1DIDBj4
	1/OmRxRtbk5BDreA+YEgi4zXsfmeyae8Zme0R64Cf86Attr/1AXVvYeNuyoTxHmJc9HIzTGxGG1
	VRvMeTW5ln01uqIP4/S8xVbd8zTuh0tS50LH/webKwYn17KjPce+BaaTGp3Agp8nV3BPvx7bPMf
	PdHovqIcU8a7g
X-Received: by 2002:a05:7301:4683:b0:35e:51d6:9f6f with SMTP id 5a478bee46e88-36a20418ca8mr5788681eec.27.1793224599384;
        Wed, 28 Oct 2026 14:56:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path helpers for reuse
Date: Wed, 28 Oct 2026 14:46:54 -0700
Message-ID: <20261028215600.1713475-6-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
In-Reply-To: <20261028215600.1713475-1-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org>
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

Clean up `overlay_parse_fixup_entry()` and generalize
`overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` so both can be
reused when updating `/__local_fixups__`:

- Change `poffset` from `int` to `uint32_t` in
  `overlay_fixup_one_phandle()`, `overlay_parse_fixup_entry()`, and
  `overlay_fixup_phandle()`, and parse into `unsigned long` before
  validating the range.
- Require `*(sep + 1)` to be an ASCII digit (`'0'..'9'`) and bound
  `poffset` to `INT32_MAX - sizeof(uint32_t)` so negative strings (such
  as `"-4"`), leading whitespace, or large values cannot silently
  truncate or wrap around in `fdt_setprop_inplace_namelen_partial()`.
- Drop the redundant `*sep != ':'` checks after `memchr(..., ':', ...)`.
- Generalize `overlay_split_fragment_path()` to accept a length-bounded
  `path` slice that is not necessarily NUL-terminated (using `memchr()`
  instead of `strchr()`, and keeping the NUL-terminated property check
  in `overlay_symbol_update()`) so it can also split `:`-delimited paths
  from `/__fixups__`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch tightening fixup offset parsing and generalizing
  overlay_split_fragment_path() for non-NUL-terminated paths in
  libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 46 +++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index f9d1a555ed5d..eb87b356145f 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -330,7 +330,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
-				     int poffset, uint32_t phandle)
+				     uint32_t poffset, uint32_t phandle)
 {
 	fdt32_t phandle_prop;
 	int fixup_off;
@@ -368,7 +368,7 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 				     const char **pathp, uint32_t *path_lenp,
 				     const char **namep, uint32_t *name_lenp,
-				     int *poffsetp)
+				     uint32_t *poffsetp)
 {
 	const char *path, *name, *fixup_end;
 	const char *fixup_str = *valuep;
@@ -376,7 +376,7 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 	uint32_t fixup_len;
 	const char *sep;
 	char *endptr;
-	int poffset;
+	unsigned long poffset;
 
 	fixup_end = memchr(*valuep, '\0', *lenp);
 	if (!fixup_end)
@@ -388,7 +388,7 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 
 	path = fixup_str;
 	sep = memchr(fixup_str, ':', fixup_len);
-	if (!sep || *sep != ':')
+	if (!sep)
 		return -FDT_ERR_BADOVERLAY;
 
 	path_len = sep - path;
@@ -398,15 +398,17 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 	fixup_len -= path_len + 1;
 	name = sep + 1;
 	sep = memchr(name, ':', fixup_len);
-	if (!sep || *sep != ':')
+	if (!sep)
 		return -FDT_ERR_BADOVERLAY;
 
 	name_len = sep - name;
 	if (!name_len)
 		return -FDT_ERR_BADOVERLAY;
 
+	if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
+		return -FDT_ERR_BADOVERLAY;
 	poffset = strtoul(sep + 1, &endptr, 10);
-	if ((*endptr != '\0') || (endptr <= (sep + 1)))
+	if ((*endptr != '\0') || (poffset > (INT32_MAX - sizeof(uint32_t))))
 		return -FDT_ERR_BADOVERLAY;
 
 	*pathp = path;
@@ -470,8 +472,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 
 	do {
 		const char *path, *name;
-		uint32_t path_len, name_len;
-		int poffset, ret;
+		uint32_t path_len, name_len, poffset;
+		int ret;
 
 		ret = overlay_parse_fixup_entry(&value, &len, &path, &path_len,
 						&name, &name_len, &poffset);
@@ -925,8 +927,8 @@ static int get_path_len(const void *fdt, int nodeoffset)
 
 /**
  * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
- * @path: Input NUL-terminated path property string
- * @path_len: Length of @path in bytes (including trailing NUL)
+ * @path: Input path string (need not be NUL-terminated)
+ * @path_len: Length of @path in bytes (excluding any terminator)
  * @frag_namep: Output pointer to the fragment name
  * @frag_name_lenp: Output length of @frag_namep in bytes
  * @rel_pathp: Output pointer to the relative subnode path after __overlay__
@@ -935,7 +937,7 @@ static int get_path_len(const void *fdt, int nodeoffset)
  *
  * returns:
  *      0 on success
- *      -FDT_ERR_BADVALUE if @path is not a valid NUL-terminated '/' path
+ *      -FDT_ERR_BADVALUE if @path does not start with '/'
  */
 static int overlay_split_fragment_path(const char *path, int path_len,
 				       const char **frag_namep,
@@ -951,18 +953,14 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 
 	*is_overlayp = false;
 
-	/* verify it's a string property (terminated by a single \0) */
-	if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
-		return -FDT_ERR_BADVALUE;
-
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
@@ -972,13 +970,13 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 	frag_name = path + 1;
 	frag_name_len = s - path - 1;
 
-	/* verify format; safe since "s" lies in \0 terminated prop */
+	/* verify format */
 	len = sizeof("/__overlay__/") - 1;
-	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
+	if ((e - s) >= len && (memcmp(s, "/__overlay__/", len) == 0)) {
 		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
 		rel_path = s + len;
-		rel_path_len = e - rel_path - 1;
-	} else if ((e - s) == len
+		rel_path_len = e - rel_path;
+	} else if ((e - s) == (len - 1)
 		   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
 		/* /<fragment-name>/__overlay__ */
 		rel_path = "";
@@ -1049,7 +1047,11 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if (!path)
 			return path_len;
 
-		ret = overlay_split_fragment_path(path, path_len,
+		/* verify it's a string property (terminated by a single \0) */
+		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
+			return -FDT_ERR_BADVALUE;
+
+		ret = overlay_split_fragment_path(path, path_len - 1,
 						  &frag_name, &frag_name_len,
 						  &rel_path, &rel_path_len,
 						  &is_overlay);
-- 
2.56.0.313.g2479322e68-goog

