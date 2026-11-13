Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604171;
	b=jb64Ul2fzfUOYFQIA+HYzq9o2NTWtgX4nOdzSmZMNO8axO+kWC/D6fsEFX76Kr8E/DYy
	 UQTGb9cIVwFMtu2468cedMiQZvRrsnRqiCuB4ZRc+kzpa4JI0ADWfBfwJvv1+J6loCQYc
	 V2Bc7k5VBU3Nb6vdY5060GlYuqQrQ+8DOfdOJPp7MwzPEjEfg/MKlo5gZZDEXb5WnFrf2
	 4To39gJSfG5X3qz3+jE3cs/D2DtUm2OIm/tiS37FKt9X454zOitIezr4a5n4STjuqJ+Ne
	 RZeWuVue5Ypk6NlD6XpMsh8VIHKWrFK+nc6n/NC0k23vtKtVHMyhc4iW3BU2fyv/IIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
	b=El6XdRqxRO4RtT04RtAtqVP0qH3Pcic/knNz2q67ihPWE23IENNk/yrhPki3wKAI5IaZ
	 ieDRoF3pGrWb90l8lb//LO2NxRUvxHgEZZL0u2YB8IygwJw7g6ZWM1eVtM+Ik01gO+FPf
	 7Wfzyk1VD/ci0b1tOa4W6B/qrhbcIxyewFqNR8QLPYqKTI73mQVfzcNralP8FoFrMDq7B
	 QxoMnxLdk963NyqZ0zZWv4/30d2vCyvPqmLn4zveeSBaZJKNtbq4yKrwFhFVQoJ1QtA/3
	 jd/STkhH8KwVuLBf0fnYR7KCGBaraiJV62ys7Io28xU3fnGm4JDtOP9oGO8QieXuxwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="byh/3nmq";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC79860A2611
	for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 21:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC79860A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=byh/3nmq
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so1384716c88.1
        for <Devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 13:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604170; x=1795208970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=byh/3nmqI7QpjTJjL85XL36XrLVmQJX7b416OaueMm9iHjof1uYq2ZFN7Pfll3IAvV
         +X01S5m5HOaYZHlDiDaPuFiRmYKrPA+w+1JW7YhJqoVFFPJEGnEmqMTcrdwrPGVV8Zz4
         i1lGy4B/V1v3WY/ao6ofASJ8TCWkgzDrO6u/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604170; x=1795208970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=nHkJ+26lvbX8MQPrFTmsUAzUO4UrHKZpi+pUT0BUEueNQVCK8uiTFlyY7AkxzGd0nJ
         SAg2Wj070/fxThqTpHmw2x7UflLds6Ec4Rygr6cOT1O1Zpak/GtT9b49HEkE/4rE3FV/
         DHoCzBaAmy8C3Cf6WlX5SeE6ivR822x5MGmUTLHC7v751pRQzaJeT3r0NSj6q8iTZGxG
         Wk1iriZJd+wYNcoXkE/EsppSNORc/9oGUlmtpUQRmmdRn5g/Wa0q6KwaYHWijT2dBo8P
         bDsQgn1stSPpdaCPc/i+pIVc2VixC1tLZ6bmks6dwH94WU4UUpa0GmvNrVWFviDWgQxh
         zIbQ==
X-Gm-Message-State: APuU4Z+wSWV7px8hl7RhB8RZ+286hr7/dDL7Qf3/NMAAcU30Oymec5lC
	8IUmIRBdz4h7Ir1gFr0/vPaia1UM7zYr7ikZ8Tve9ATa7Ip8fo6MH+rI3A/Llxz3P0O6YoXKPze
	MCtj6LHNKZMU=
X-Gm-Gg: AYBFou37Jgx1dI1v8RgSCX6dWMzeEm0knbnVAnRLsClDRF2CwQNlf+lsSZmlVKGmED7
	A0XhISeuoB2+ZlcNBSlQXm+UjoMZzVod8AQWXDITui6UJLZquieRzSLD6UE5fpvz1h1c2WF8Ct5
	cJO5i9kUTZ4BAp2oNNiILG158GaHHaE5H8Eq36MNaxpTmsvtFnSoCF9UTPXiee3yIMf9w+fAXcO
	yrT8EfMFliPym+pJjDVTCny67tKNvEBh1J6PuPjvalRoN15/vBdY8otbYh6wnKXHQ6Gwh+wEW/1
	ba8fTDsi9W0RX+PRlFCyBViu4rDs0pgrD0IDTjjzfjKMhBDUNzWpTmV0kaEg2SUMAu6qlXNHECh
	LLUz2iPJe/WFw71+Q7DiXyhHnOnX0Da2IF7bIAQB+Jgf4WE5fk09jufC/neljAvmDkB0c6xw9cZ
	XwJ936M3BULtDPN943Y7O+X5RIdiNL2sFPd+mEeeLZdhF/fX5mM4V3QBLXYm/5mzHiN27PMQ24V
	oKic/pPsgKFmSQZ1bZiouD5319clWdL9c5B49C0X5oaJ3eMlROfaUF2BAhxADhJYMW7MhUi6tqq
	cGeKMfybDsxHys/JwQG/eTlsRLtF22YhWqXdb4N27cuYe/LGPB6xR+wiYUI48ZnClCYYNM/hXwK
	GipQY5KziYMVs
X-Received: by 2002:a05:701b:2402:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b503193011mr3160476c88.46.1794604169766;
        Fri, 13 Nov 2026 13:09:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:27 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	David Sterba <dsterba@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 1/5] kbuild: fit: Document FIT_COMPRESSION and FIT_DECOMPOSE_DTBS
Date: Fri, 13 Nov 2026 13:09:10 -0800
Message-ID: <20261113130858.RFC.v2.1.Ic9a4337a7740a76d78fb68d3763d36a35a3231a0@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
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

`FIT_COMPRESSION` and `FIT_DECOMPOSE_DTBS` can be passed on the `make`
command line when building `image.fit` (see `cmd_fit` in
`scripts/Makefile.lib`), but neither variable was documented in
`Documentation/kbuild/kbuild.rst` or mentioned in
`arch/arm64/Makefile`'s `make help` output.

Document both variables before adding new FIT Kbuild variables.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New preparatory patch documenting preexisting FIT_COMPRESSION and
  FIT_DECOMPOSE_DTBS variables (Simon Glass)

 Documentation/kbuild/kbuild.rst | 12 ++++++++++++
 arch/arm64/Makefile             |  1 +
 2 files changed, 13 insertions(+)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index e71a692a559a..744a32ccbd1c 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -364,3 +364,15 @@ LLVM
 ----
 If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
 of GCC and GNU binutils to build the kernel.
+
+FIT_COMPRESSION
+---------------
+Compression algorithm used when packaging the kernel and device tree blobs
+into ``image.fit`` (for example, ``gzip``, ``lz4``, ``xz``, ``zstd``, or
+``none``). Defaults to ``gzip``.
+
+FIT_DECOMPOSE_DTBS
+------------------
+If set to a non-empty value when building ``image.fit``, decompose composite
+DTBs (built from a base ``.dtb`` plus ``.dtbo`` overlays) into their component
+blobs and deduplicate them in the FIT.
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index ed28f94be428..8818d6a2015b 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -223,6 +223,7 @@ define archhelp
   echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
   echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)'
+  echo  '                  Configured by FIT_COMPRESSION and FIT_DECOMPOSE_DTBS'
   echo  '  install       - Install kernel (compressed if COMPRESSED_INSTALL set)'
   echo  '  zinstall      - Install compressed kernel'
   echo  '                  Install using (your) ~/bin/installkernel or'
-- 
2.56.0.611.g1030f0b940-goog

