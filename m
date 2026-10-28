Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224599;
	b=O4KBULyVk+PaEQX2oSTQfXH8WFquQdtmGq/fWNhG6CA2xbmL4rlPiNf88JreJvlNCsJx
	 NkICWN7nKBQrs94W/0y9VEQPJJlcGE2w21DqSY6MRtjk/Y0lnZ8Vy47GgFzHMxG1cEFWy
	 HUo3cSbHHFg7yy7Wv53icE7vjnHTG/9mjvPidA5V9/KLwCsgmjSxHhmoVJmKVZE0NAgxJ
	 HauBt5o3JIuh6Jm3kPNGY4sVW8tTz7WqONW0Tv/55tkH1AcPlVIPB9LWLeVKMQCnlViY0
	 WvXxCZ+C1lts2IuV4IMSGrnoI7hzH59hlAsufnR5jaZskcuL3tzk/3Z9MHFIgKCETmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h4HKRMUyyVkUrUI+YJ3JgmkowAX5KVGFd9xGnSrbsX4=;
	b=swYpRzrijCC57xo4J+fceDJInyqd2+NNSULV/LOsywziQ1KGBmLXvnOkXwdwCNKOnvCK
	 o6Kq737d0abAnycY3OAqi2pvLGPttGyaGnFE/oxrNqyNcOQXez+wrzqYr6Vg9+GZaTK5G
	 v1DrplYv78c9dqIODl90VkFW/AYovkcG3/EvZ+WT64MmuQnb8ON616GehC/TWeCjSZzcd
	 Y43aX7tZ27doPU6tmkqeZzGh+DPZJ06guenHOriz/fgmDzE69frlZNi8auPJg2tgcTIIN
	 yqlPum5Ghg0LwkqGmyasFrgPgbvbJzr9Fap5OuYGI3dt8vsqk0OSm43ydRKTz3hJkYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iYTzqz6Y;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283AB60A263F
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283AB60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iYTzqz6Y
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so1542195eec.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224597; x=1793829397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4HKRMUyyVkUrUI+YJ3JgmkowAX5KVGFd9xGnSrbsX4=;
        b=iYTzqz6YPcJmE2qSwQzaPYHIE024dfvGm9L3oILacF0YrmIWqvp3ei0Z6QaYJAc+Hp
         Xp3V0jnf+kMXBoI1UQ+wimHUElRyAKPGtDht59P/gUm7MFLdsFrbCqm9s+cBjnd3oO/F
         eOFVWgAvU2OnR3J+j/teuuqLl6QDgkO2bvef4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224597; x=1793829397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4HKRMUyyVkUrUI+YJ3JgmkowAX5KVGFd9xGnSrbsX4=;
        b=FD29MDYhkccWSIncoO1MGF2R5Sexz+yn0NFInQFW5RDBgEzGGoK2GggI/V2lVdzeHJ
         leNfxyMWtgmM46te4Zu6gIDGPFUif7qexVVVkIklOcwE8hsZptcWYn0M+EgXQzYfbqy0
         NTvSVCrrbnyzv7ywNx25aaGP0ZcgJEJ0FXuvihpML6ZEkxOPLwEbPev4G4zshX/g5+2n
         tNls4fusVaowQtd5gS+gAMVmj/MfuRiQygbQYmtgYmtrRKnPoPoDIsoYSxh4E95LpvEJ
         rtx49tCQ5L2wb2HkF9xyhNSJP8H4NG3v7U9gWHseeSJeqPpJTrgmJEnmD3Lsp0DaVTvn
         cfvg==
X-Gm-Message-State: AFq9FYKGexKbKB7DHCEZqTxBNTiKUwGrwVJxdLN42/Jp+0eLSJlz91LP
	SMWCAVpMgHawAyHWl3upZ3cosF7wcLHLWd83CP/gJOg+g+LZMw5jHXq9pRETQjpnsgHFyD9pz9m
	fpvu06e9H
X-Gm-Gg: AYBFou3ONgFxJhDreLvpyv03fCp5kYrKmUy6esH5LQhpk+AgdNu4Ak/mg6YxIznFoGr
	V/51+Ql7hj8gRqDhEM95r6Ra5+2LsU1f8GB8pls/s9SCm5dHPmmb4adJKZKaOB7T1sPrjKXrGGn
	VvbQqbI/fCx3LDYO1ABxA66ETFFB3CDwC1rCk7MqkTs0PtdObvUMjxpG9Ds195ycxZiZr/YkZXl
	ztWvwIwqVizuvN+3829oOkfDJZ+ntDoVv/TBYGVTar4n4d/iHMKHhdcN3sdpdC6pupPBTw1XD2f
	k5OT2hhyNwNHrzhgvtBY4bPWdFEphS6su/k1EJIe45ZviRU7qEBGEExYK/qdeQACiPw3fTVgJ0l
	7bY8ZPTsmlCXxjHSUgBUJ56+CLU/Mg+VYP3h/E6bSYjWHVYJugdOJiS3QcWF1NBLrhr4w6IxlAc
	j6ummwvV6anviacNyJxPwCxe0TMN9OEL4LY3r7GKajQaIPXMok58TLwH81tVgoV2o71pOFcrP5d
	i2OFj5fIJ4omThKvVJ6N5T1oZFc6KDGyN/7gyfa5X1Yr0R09Uu48XMX9SqAfT+y7c2AhhsStsgn
	n89Hz/+uQHP0ult8HMDMaDQul/eh+KMTQh4Bs3zZsdNsS+XlqVcF64OqGAK3nRzyIFOm4DCIt/X
	TdXCFQ5q/nyPt
X-Received: by 2002:a05:693c:639b:20b0:36a:1904:60a3 with SMTP id 5a478bee46e88-36a203d0975mr5134289eec.15.1793224597294;
        Wed, 28 Oct 2026 14:56:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:36 -0700 (PDT)
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
Subject: [PATCH v2 04/10] libfdt: overlay: Factor out fixup and fragment path parsing helpers
Date: Wed, 28 Oct 2026 14:46:53 -0700
Message-ID: <20261028215600.1713475-5-dianders@chromium.org>
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

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch factoring out overlay_parse_fixup_entry() and
  overlay_split_fragment_path() helpers in libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 226 +++++++++++++++++++++++++++++--------------
 1 file changed, 154 insertions(+), 72 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 51a3859620a4..f9d1a555ed5d 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -351,6 +351,72 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 						   sizeof(phandle_prop));
 }
 
+/**
+ * overlay_parse_fixup_entry - Parse one "path:name:offset" entry from /__fixups__
+ * @valuep: In/out pointer to the current NUL-terminated fixup string
+ * @lenp: In/out remaining length of the /__fixups__ property value
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
+				     int *poffsetp)
+{
+	const char *path, *name, *fixup_end;
+	const char *fixup_str = *valuep;
+	uint32_t path_len, name_len;
+	uint32_t fixup_len;
+	const char *sep;
+	char *endptr;
+	int poffset;
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
+	if (!sep || *sep != ':')
+		return -FDT_ERR_BADOVERLAY;
+
+	path_len = sep - path;
+	if (path_len == (fixup_len - 1))
+		return -FDT_ERR_BADOVERLAY;
+
+	fixup_len -= path_len + 1;
+	name = sep + 1;
+	sep = memchr(name, ':', fixup_len);
+	if (!sep || *sep != ':')
+		return -FDT_ERR_BADOVERLAY;
+
+	name_len = sep - name;
+	if (!name_len)
+		return -FDT_ERR_BADOVERLAY;
+
+	poffset = strtoul(sep + 1, &endptr, 10);
+	if ((*endptr != '\0') || (endptr <= (sep + 1)))
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
@@ -403,44 +469,14 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		return -FDT_ERR_NOTFOUND;
 
 	do {
-		const char *path, *name, *fixup_end;
-		const char *fixup_str = value;
+		const char *path, *name;
 		uint32_t path_len, name_len;
-		uint32_t fixup_len;
-		const char *sep;
-		char *endptr;
 		int poffset, ret;
 
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
-		if (!sep || *sep != ':')
-			return -FDT_ERR_BADOVERLAY;
-
-		path_len = sep - path;
-		if (path_len == (fixup_len - 1))
-			return -FDT_ERR_BADOVERLAY;
-
-		fixup_len -= path_len + 1;
-		name = sep + 1;
-		sep = memchr(name, ':', fixup_len);
-		if (!sep || *sep != ':')
-			return -FDT_ERR_BADOVERLAY;
-
-		name_len = sep - name;
-		if (!name_len)
-			return -FDT_ERR_BADOVERLAY;
-
-		poffset = strtoul(sep + 1, &endptr, 10);
-		if ((*endptr != '\0') || (endptr <= (sep + 1)))
-			return -FDT_ERR_BADOVERLAY;
+		ret = overlay_parse_fixup_entry(&value, &len, &path, &path_len,
+						&name, &name_len, &poffset);
+		if (ret)
+			return ret;
 
 		ret = overlay_fixup_one_phandle(fdto, symbols_off,
 						path, path_len, name, name_len,
@@ -887,6 +923,80 @@ static int get_path_len(const void *fdt, int nodeoffset)
 	return len;
 }
 
+/**
+ * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
+ * @path: Input NUL-terminated path property string
+ * @path_len: Length of @path in bytes (including trailing NUL)
+ * @frag_namep: Output pointer to the fragment name
+ * @frag_name_lenp: Output length of @frag_namep in bytes
+ * @rel_pathp: Output pointer to the relative subnode path after __overlay__
+ * @rel_path_lenp: Output length of @rel_pathp in bytes
+ * @is_overlayp: Set to true if @path is under an __overlay__ subnode
+ *
+ * returns:
+ *      0 on success
+ *      -FDT_ERR_BADVALUE if @path is not a valid NUL-terminated '/' path
+ */
+static int overlay_split_fragment_path(const char *path, int path_len,
+				       const char **frag_namep,
+				       int *frag_name_lenp,
+				       const char **rel_pathp,
+				       int *rel_path_lenp,
+				       bool *is_overlayp)
+{
+	int len, frag_name_len, rel_path_len;
+	const char *s, *e;
+	const char *frag_name;
+	const char *rel_path;
+
+	*is_overlayp = false;
+
+	/* verify it's a string property (terminated by a single \0) */
+	if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
+		return -FDT_ERR_BADVALUE;
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
+	*is_overlayp = true;
+	return 0;
+}
+
 /**
  * overlay_symbol_update - Update the symbols of base tree after a merge
  * @fdt: Base Device Tree blob
@@ -907,7 +1017,6 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 {
 	int root_sym, ov_sym, prop, path_len, fragment, target;
 	int len, frag_name_len, ret, rel_path_len;
-	const char *s, *e;
 	const char *path;
 	const char *name;
 	const char *frag_name;
@@ -934,47 +1043,20 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 
 	/* iterate over each overlay symbol */
 	fdt_for_each_property_offset(prop, fdto, ov_sym) {
+		bool is_overlay;
+
 		path = fdt_getprop_by_offset(fdto, prop, &name, &path_len);
 		if (!path)
 			return path_len;
 
-		/* verify it's a string property (terminated by a single \0) */
-		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
-			return -FDT_ERR_BADVALUE;
-
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
+						  &rel_path, &rel_path_len,
+						  &is_overlay);
+		if (ret)
+			return ret;
+		if (!is_overlay)
 			continue;
-		}
 
 		/* find the fragment index in which the symbol lies */
 		ret = fdt_subnode_offset_namelen(fdto, 0, frag_name,
-- 
2.56.0.313.g2479322e68-goog

