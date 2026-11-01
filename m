Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570602;
	b=TN8y63bHfiA3tS+vvXaOv1u5D/PT2nowiZ+SypkheVq8QdvEtU4ob692kI/JKTSVDr88
	 SZwKeraeOaY4NjftHD/MHFRVk/qOFBYBlArIjIEOfFN9VJAyIMp2dMQF+cAot+QQlPfoD
	 W22cdB27DicLE3mOK8hfuZvVEdT7Yvh7Tx1CJM9M691b/JsJp7EueL6kCyYrqAtDkj7va
	 5TSkH0ZxVlXEubKayH3BeABocWK1veRxmYR7o1VEuGuXGwBfScpSuD7qByAG3nDRedTTd
	 jqTYBheSwFMfsjD1GHluxFfaDumCAZqZt2ZJulqCmtxktzF6kGrPjVHTKHIsPmoLY3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=flmKDheRArZmX/2v3f6eDFdui2G8g69FBXprbtqj4hw=;
	b=YSMtiOhAiqhjEEjNtmzbmqSjVvv55MSJj7zTZpnEDMSFc5vNV65OM0wciLDF6uuqJF/Z
	 SOFqYRILiB0cApdQ3hUje00ew96OcASHowlHupXPVnNSaF1U3Z6EOZbtvonAIrc/sjF7y
	 5RxNRqcR2B1tsnEfOuu01QF4UwJ54KhuymHzUzeoUQzUCnA8QGjnXrUhUhJw3k3FlsrWs
	 R2Y9wyWRlSECdSqoOCGCnJAHIFk5pP//dzRcM1RgFxwaWPr2M3yJ2WDtTrMo64FNgvBQ5
	 sv0c3M0C240goD6/3XvmJeZL+w7Ad0qajAgXH/I1V5X46etM6pWC8uDv6gozUi6FHJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Git5RT/C";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BCB606A32E
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 22:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BCB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Git5RT/C
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a1947498bso1682564eec.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 14:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570601; x=1794175401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flmKDheRArZmX/2v3f6eDFdui2G8g69FBXprbtqj4hw=;
        b=Git5RT/Cg+AjU2u5XDvpUym5BISJATNTvCgGIeoccpQwXCb9/ElAloWjmSUuo9QFyC
         0eiPK6gfypqZtp8QKsO5hvMJe2I7RtL/DAnI72nGdg/eqRznkcUADHiV9lLMMpDNM3Ck
         sLRRRh6dJwCW34LGjc+bt8uSSSXqwNBCs8lcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570601; x=1794175401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flmKDheRArZmX/2v3f6eDFdui2G8g69FBXprbtqj4hw=;
        b=mpol9ruSDSIYwKmQ8fazPAHLJN++7nzYuZzhNkN1WyabQxJAmAglvjdSvDUqB9aFTO
         ILpGniQQ+nWgkfnYvXrxE2spKcW+gTom00Uq/0V2R1AMD79CfC3V1uS+jFxvQUx3V09J
         BJpmD8R+x70l4dnIu+3WhGY+pSHy3FAYIDjxDdegQ462i02Q7HEcbzXrAtD4Hma/MgrU
         nqcsdzDKRzwdrK5mUoYkNUdtUuEqGrgihHGg99bm7Il2gzoRxwdig5I32Zn+/GqBZbIx
         K2M7vBksfMWlqpVV5oBDzZvwqgEgL17h7m7k8XsRkWl1xLtPF/NE0EaHt4wYyuLHC1fX
         GK1g==
X-Gm-Message-State: AFq9FYKqh4qn1BBkJt9vRhMFUkKW9+Wg26dNReUXc1J0fI/8cp+Etrz0
	j8b7WVMpnJHtvXRAS95F5EUC27k39lLAdWGQO710v41yO22wRFN5NaySLXaetN/9IlMvfAfgzqa
	yAiQGCXWe
X-Gm-Gg: AYBFou2Rcag11OxOA9PoY/4zcyjwNXlhkEVKIdrl9AKgM9Lv2ThMcrKg5oT+v4gz7wG
	Hkb2E5lcWMM92OR8taikzEDromPGeiheR410RfJb8L4tBGhwo7xmU1MNkMD107XjxMjiew/s/jw
	k4sdZysfssOI6xdKf8JylT57NV8y8Ohn+ssqjjlwvePMclVC7bL1yClEIexB+A9lxK0ctdTBMd8
	j+eehLyMsR6JXFzbI8nA/j33zDoAX8E5VeiOT85yjHRKN3K6R31TbHFgf1t3uaOv88laGnRLluE
	/0AF5TFvF/KzR21bnguuNaPeoTNqYgW+jPoxYUukMDxs3iPLD0sMivn/KBEF27vcfiCsjldnyoO
	ZkpFaBGzeUEfBV84KCklhKsIVfW8nMg/r6cc8qUPbaB1W0eY58BkVwQePYIixUxW6xBkG9WMoQg
	38+RWI9OJ5MIYG11wWEQqqg9iYN+W04stTCofAduCSjd3qxSr7bD8ypnqT1CjsyiQuAFVPg/pnY
	Bm23gpR2ihNUSZgpFbJLYe4ogCOwNX5VEQqvouqloYrAFr2+qlkKB9J5ITH148CRi6quFkrQJge
	3yI8Cp6taksVxXpAkGu1Du48o2dlK4ymEwaOWHpoNDtU8X/uYrOOVSQIExGh6/pBCOEb9KlP2mw
	/2YbSLqrtAiIg7w==
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr12469921c88.10.1793570601027;
        Sun, 01 Nov 2026 14:03:21 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:19 -0800 (PST)
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
Subject: [PATCH v3 01/15] libfdt: overlay: Fix out-of-bounds write on bad fixup offset
Date: Sun,  1 Nov 2026 14:01:08 -0800
Message-ID: <20261101220224.1436242-2-dianders@chromium.org>
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

A malformed overlay with a negative or very large fixup offset in
/__fixups__ (such as "/fragment@0:target:-4" or
"/fragment@0:target:4294967292") can cause an out-of-bounds write during
overlay application:

1. overlay_fixup_phandle() parses the offset with strtoul(), which
   accepts negative numbers and values larger than UINT32_MAX, and
   truncates the result into a 32-bit integer.
2. fdt_setprop_inplace_namelen_partial() checks bounds with
   `(unsigned)proplen < (len + idx)`, where `len + idx` wraps around to
   a small number when `idx` is near UINT32_MAX, bypassing the check and
   passing the huge offset to memcpy().

Tighten the fixup offset parsing in overlay_fixup_phandle(), fix the
bounds check in fdt_setprop_inplace_namelen_partial() to avoid unsigned
wrap-around, and add test cases covering both negative and overflowing
offsets.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split the fixup offset overflow fix and fdt_wip.c bounds check out of
  "libfdt: overlay: Prepare fixup and fragment path helpers for reuse"
  into a standalone bugfix patch with dedicated tests (Simon Glass)
- Add a comment explaining why an initial ASCII digit check is needed
  before strtoul() (David Gibson)

 libfdt/fdt_overlay.c                       | 34 +++++++++++++++++-----
 libfdt/fdt_wip.c                           |  7 ++++-
 tests/overlay_bad_fixup_negative_index.dts |  9 ++++++
 tests/overlay_bad_fixup_overflow_index.dts |  9 ++++++
 tests/run_tests.sh                         |  2 ++
 tests/setprop_inplace.c                    |  8 +++++
 6 files changed, 60 insertions(+), 9 deletions(-)
 create mode 100644 tests/overlay_bad_fixup_negative_index.dts
 create mode 100644 tests/overlay_bad_fixup_overflow_index.dts

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 51a3859620a4..c6dc4774cff3 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -330,10 +330,10 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
-				     int poffset, uint32_t phandle)
+				     uint32_t poffset, uint32_t phandle)
 {
 	fdt32_t phandle_prop;
-	int fixup_off;
+	int fixup_off, ret;
 
 	if (symbols_off < 0)
 		return symbols_off;
@@ -345,10 +345,20 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 		return fixup_off;
 
 	phandle_prop = cpu_to_fdt32(phandle);
-	return fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
-						   name, name_len, poffset,
-						   &phandle_prop,
-						   sizeof(phandle_prop));
+	ret = fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
+						  name, name_len, poffset,
+						  &phandle_prop,
+						  sizeof(phandle_prop));
+	/*
+	 * fdt_setprop_inplace_namelen_partial() only returns -FDT_ERR_NOSPACE
+	 * when poffset + sizeof(phandle_prop) exceeds the existing property's
+	 * length in the overlay, which means the overlay is malformed (not
+	 * that the base DTB buffer ran out of space).
+	 */
+	if (ret == -FDT_ERR_NOSPACE)
+		return -FDT_ERR_BADOVERLAY;
+
+	return ret;
 }
 
 /**
@@ -409,7 +419,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		uint32_t fixup_len;
 		const char *sep;
 		char *endptr;
-		int poffset, ret;
+		unsigned long poffset;
+		int ret;
 
 		fixup_end = memchr(value, '\0', len);
 		if (!fixup_end)
@@ -438,8 +449,15 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		if (!name_len)
 			return -FDT_ERR_BADOVERLAY;
 
+		/*
+		 * Require an initial ASCII digit because strtoul() accepts
+		 * leading whitespace and '+'/'-' signs (wrapping negative
+		 * values to unsigned long).
+		 */
+		if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
+			return -FDT_ERR_BADOVERLAY;
 		poffset = strtoul(sep + 1, &endptr, 10);
-		if ((*endptr != '\0') || (endptr <= (sep + 1)))
+		if ((*endptr != '\0') || (poffset > UINT32_MAX))
 			return -FDT_ERR_BADOVERLAY;
 
 		ret = overlay_fixup_one_phandle(fdto, symbols_off,
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index c2d7566a67dc..dd163d91498c 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -23,7 +23,12 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 	if (!propval)
 		return proplen;
 
-	if ((unsigned)proplen < (len + idx))
+	/*
+	 * Check that idx + len fits within proplen using subtraction rather
+	 * than addition so that a large idx (or negative len) cannot wrap
+	 * around 32-bit unsigned arithmetic.
+	 */
+	if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - idx)
 		return -FDT_ERR_NOSPACE;
 
 	memcpy((char *)propval + idx, val, len);
diff --git a/tests/overlay_bad_fixup_negative_index.dts b/tests/overlay_bad_fixup_negative_index.dts
new file mode 100644
index 000000000000..02ccee905e85
--- /dev/null
+++ b/tests/overlay_bad_fixup_negative_index.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0:target:-4";
+	};
+};
diff --git a/tests/overlay_bad_fixup_overflow_index.dts b/tests/overlay_bad_fixup_overflow_index.dts
new file mode 100644
index 000000000000..d7d05267d7b3
--- /dev/null
+++ b/tests/overlay_bad_fixup_overflow_index.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0:target:4294967292";
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5bc7817dd12a..0d815e307909 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -274,6 +274,8 @@ BAD_FIXUP_TREES="bad_index \
 		empty \
 		empty_index \
 		index_trailing \
+		negative_index \
+		overflow_index \
 		path_empty_prop \
 		path_only \
 		path_only_sep \
diff --git a/tests/setprop_inplace.c b/tests/setprop_inplace.c
index 61a0da16fce8..48182169fbf6 100644
--- a/tests/setprop_inplace.c
+++ b/tests/setprop_inplace.c
@@ -80,5 +80,13 @@ int main(int argc, char *argv[])
 	check_getprop(fdt, 0, "compatible", strlen(TEST_STRING_4_RESULT) + 1,
 		      TEST_STRING_4_RESULT);
 
+	err = fdt_setprop_inplace_namelen_partial(fdt, 0, "compatible",
+						  strlen("compatible"),
+						  0xfffffffcU,
+						  TEST_STRING_4_PARTIAL, 4);
+	if (err != -FDT_ERR_NOSPACE)
+		FAIL("fdt_setprop_inplace_namelen_partial() with wrapping idx returned %d instead of -FDT_ERR_NOSPACE\n",
+		     err);
+
 	PASS();
 }
-- 
2.56.0.317.g454f8302e1-goog

