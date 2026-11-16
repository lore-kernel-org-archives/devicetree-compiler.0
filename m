Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862441;
	b=pGRoY3Ujsey+A3kH2Fmj1SBerMTIOrSr5YimT9FQF/asu4BDL8mMRlMnePaeS87NGncM
	 2a3XFpLfduHIvZPFXdlyHXFwm8e3ZxXq22veeKcerV+SpKHbR4vg9qirjwg4zR+C81cTH
	 qSRU0hZMf+sstTsfBJbPeJbDfFFvbqAlYkMDOHnKQIT5A71qiOcn5haAOCAnyonI2p0BJ
	 cCGgspKgbe3GzDzvtTza4rGYAWizWfuFIgZVkSpQMmkc5S4juVjy7un/3pG234Om9ZW83
	 sxIMevCYHCHoLxlUJbey5yxLnz+j5LsE+cUmyTzBQRgrHAjPGZSOEaPdo+vQGxqyqJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rEU3wqeOzNiSYTryYSCT989FnGz9Q5wgICHvgeAsaoQ=;
	b=n21wAm72jt04orGG7eEZwcKuWXgQGTXqKEOLu5rl7YJTVwWvvUSiOaNDQ1AawP/WJDXu
	 ARxIx2hp6TmgQ0DS82Kgl7IiD8Z40im0wi+t1qMBKxuvEdE+mmTiKjn9/OIJgS3gImLir
	 Wj9yQ9LIyZkzvL13DRY09nizirn03XDdkgkteZQBFPmbMAP/dFJHDpJ1MEF4+sSs1Z1Vw
	 p9l1BXJIZkTQcTMT/sWqqfQL4P295mzVjPQ1mVnKxWqoJCYtY3N9RyacSmlVenPIYbicj
	 AjB3GFxOAZxDXXDcUP+c97snntVWbUWHxvvXUaQSnJD4MG88KTRmZnTwxkc6gPXpP0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="V/WQ14Z5";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7BB606A8AA
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7BB606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V/WQ14Z5
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3791619605cso7363298eec.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862439; x=1795467239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEU3wqeOzNiSYTryYSCT989FnGz9Q5wgICHvgeAsaoQ=;
        b=V/WQ14Z5JsS299GMVO38nLTCesW0lZD2nRskeGbbhT6RTJz/XsPAzhwpwkvVmvVjSS
         l5OxNg1HaYGVQrA9bJeY4mXPTZVTSZHNUYMyFCxIbkas13W86sKNbEsiA6qzSBiH+vQd
         jBw9vYYYOoUOFDhvmirgTPn/SH21BNtQ3OBVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862439; x=1795467239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEU3wqeOzNiSYTryYSCT989FnGz9Q5wgICHvgeAsaoQ=;
        b=vUDLRAH7GFbAbJaFspl49/yMN5LHIj9pEexxWcCr7U58Kat3WACVDqxoibovW8SjjG
         Pn/x3vjqRwh5YIrcp3B7PzpKsBG2R/FOIJ2IQAsuV9fuTFVNiR1GdeIehr2Su1klVYm/
         0bklmv790g/GB/RIEk5IfXU/Hqvksbz/p/WHAm5g322VE4f/Hos2L6qyInt4q0FhKPXV
         RNirIIzPyOPoDCyCIW6A8WU6Y6SSDgifTP3aMfqCLEHLXHPvnN9nZC2LK0IGy9KcHM8V
         9vXnDGvegdbieeSrlruqs97zHrbTH98zXWx1Kpce6eMZpahVO2RPK1hsLYIKpuHODMt8
         WeRA==
X-Gm-Message-State: APuU4Z9RQGfnqOXkEPVpl3TJN3gabr29f/gb26vrNpFAKaKaBQmC4tZU
	gyCgkhNZprV7dFN1fdT7HBXT8M2Osn8uM8D8/KqK2XupvTsBs3AH/xR2LeWT5lNjtV6x9VHjF8Q
	lLTEL4g==
X-Gm-Gg: AYBFou3nu8fU+08XYigQZqOhaSbJrIrwqq8XnSfb3o6ankXAurGVNQlLdb2sHxdxzLy
	D4+gp/acYarIhWHMrye7Q5cLezRpy9mdwyrw1hgfGxIi8+vq83mz6kka9DM7GGb/hs06glxduws
	7FSYh/wxGffvtNwpzY6w/TfcA+xZPiHtC8CHbYEJ/kN2d9n6/Qmnz0857e0O3Ge07+TtllCS+Lx
	zfSMDor8I0fMLMrfBdRnzevyO7siPdQLsTumpU53NHhnfejghsLX/wQLT0lxHCm2e01hJWa1L2L
	W5x4cXTW51tr7rt4FC8tKcbqqeNqNpH9x6OPDcJCPLgb0h/2H97oeGFTX+cfYLCl2zHh6tX61oG
	3uEFEDz6/BFTHnYm1JkcC1PqBXzJ/f1vvOtqdu76mk8gRAbqH9ZT8eRvVKth02PjYZRFgW9EbTi
	lZK2IfdgU5jx2deDDJl1cbRSG3H2aaxK9Gk/THx9ilgEKATqLXbtavy5tr3idCNxDngKo8lJe7e
	5cRyXjhWukahd0vbEolns4C6IN4xBsxpoZuZDjAxFr+pZg6JZbdvxyOkg2O0s/89PP0xwOtyLMm
	1Yn52gPi7xKK4XH9Zhe74XGmXtVOcYSb4ZUE4TQhtTWLwmQ+f0ADroCFf55jdX10UbzXcI8j4I6
	7UvqsEo2csvJR5w==
X-Received: by 2002:a05:693c:4146:20b0:36f:551:2bd5 with SMTP id 5a478bee46e88-379e16d093cmr11060171eec.32.1794862439198;
        Mon, 16 Nov 2026 12:53:59 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:57 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
Date: Mon, 16 Nov 2026 12:53:05 -0800
Message-ID: <20261116205320.1621386-9-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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

`fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
across the string table (`for (p = strtab; p <= last; p++)`). When
building or modifying trees with large string tables (such as DTBs and
overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
`fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
byte dominates serialization time.

Advance `p` between candidate first-byte matches using `memchr()` (with
an explicit `slen == 0` check for empty property names and a `tabsize <
slen + 1` bounds check before computing `last`), preserving identical
suffix-sharing behavior.

On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
DTBs) this reduced `fdt_property()` time by ~5.6x.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch speeding up fdt_find_string_len_() with memchr()

 libfdt/fdt.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index d9ccb70345d0..c7cedfba7815 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -348,12 +348,20 @@ int fdt_next_subnode(const void *fdt, int offset)
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
 				 int slen)
 {
-	const char *last = strtab + tabsize - (slen + 1);
-	const char *p;
+	const char *last;
+	const char *p = strtab;
 
-	for (p = strtab; p <= last; p++)
+	if (tabsize < slen + 1)
+		return NULL;
+	if (slen == 0)
+		return memchr(strtab, '\0', tabsize);
+
+	last = strtab + tabsize - (slen + 1);
+	while (p <= last && (p = memchr(p, s[0], last - p + 1)) != NULL) {
 		if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
 			return p;
+		p++;
+	}
 	return NULL;
 }
 
-- 
2.56.0.679.gc527c65306-goog

