Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034415;
	b=4nhkkHTh5CCKJ1BgZ6FFOqQZhmPVzNKPyurYcnbyMMOg70B3V7eimQBZuqaAGjtn4ZbB
	 d0xfcSi5y5hKfuDcfhX2OKVIptpwOQHs5lkxqbAsUlCWZK0uaVKxWWEQMI9h5BpBpZd7G
	 6yp/aamPrBCw1RnYhNua39KktlK4ZdtmTg84cpVqACE4IL+r5EvCX65nc+RxC0JDAMQt6
	 Cgftrly3Ho/xf5uGc546XGogeBEnscYlSmlrqHtWP6Di6ujFzFTR83+lojP4zBDmuJPh3
	 LdupRIsnCRwGrqh6fkrHOM6ZFbfffLonQ3qPRV8VTtLgfDDtnu6f8kjalu9iztQqDkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=0GtKQDTphZAnerbZFh/WoAg6lsqqk0SI/tZyIM6vqWU=;
	b=1QNTw476anfbp3OvWF5YZVEYNSGf4X/435piMdWDtFdoKzDTMffoFiTwcj8d0PKSlOre
	 40ttr0gx2gBIam2dUGVFQpj/1KSwjdJXDvcvvNuHz7+gHF5hL4YOfnOBiPIeaUp3XgbOi
	 lyxmf7mYtFYhnkJZFzG5wJkcsJ1ruuzGDgbsOTkborIV6j+Bsu9sxdjU8XqfEcTo7DVVQ
	 YROy69T9TaIv0fV+wNR5JCteMHpeTgUFQ7SDdjy/cw1luPeNSWKvFXDihRjWfGfiYGn1p
	 r1A8g9ri+rLK380pkyahIalXNe17GUzHpOcNYE7aa4aXuJ4hq5QY3gWI9Tl5/S+trTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PEQtwhpU;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F706606A31C
	for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 20:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F706606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PEQtwhpU
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso1217545a12.3
        for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 12:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795034413; x=1795639213; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GtKQDTphZAnerbZFh/WoAg6lsqqk0SI/tZyIM6vqWU=;
        b=PEQtwhpUg4YeAhDdhcYhla6V0gjmm0JDMiI4/LAII6jtbPCYRZFwDRX3zTmqFR0aw2
         udxhRbOV7wROykv+ywHSvs/8C0e584gLos42Iv0Gq21uT0wZK8AV/0cpiXYAVS6C6EOH
         6Xu6lRpBe4PkIXkDJZ6jyVbj3tkHqkqdBng5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034413; x=1795639213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0GtKQDTphZAnerbZFh/WoAg6lsqqk0SI/tZyIM6vqWU=;
        b=AFCD4q/E+QmvZ+K6QT2lFLxW1CgwR8N5AUFfEKSWOvQSbvGxBi6lHwysUAysICS8y8
         5kbpSvzpii70divvupAEk+i/2JmU88dmD5rlhB/OWVQ7KeJiOlVZ23hwGDMdxNU3YQUd
         gYTcyHqJqmCsffDYEXdtvaBCC4RPi/WwdAp/zzrXlHSX6S6PEnIHe9gptYIQUVPX7jYt
         oNFDOrRmiAq3lNkq2yFy3hSKoggdabj0iTTyVLpp2ZPjyMoWhWBhadvPiTWDo+CcL5dK
         ixB1UC4B8C/dwlYf4S7VNO3IRPR5kLIDUGuT7njWD+beXARXJ5fTIzJeyr8o7V7HszZM
         peMA==
X-Gm-Message-State: APuU4Z+8qu+wopQ094AflkHV9qIwsxCSZV4WNpvGYYtb8QYJTuuA45VG
	c6iX2tFzsnGo8VZNJPY3r87Z+3VNh+7SuJZBRYx2V1KS2swq8N1HokcbW/mFuK+uMDDIY5MIC4c
	2I63QTqw4
X-Gm-Gg: AYBFou2NxGd7OP41NSGh54DHWI7qjeAhl33OzAu9Zk4sqiEPCpsw1yAv9o5nhn34wtf
	zEMnTUK5hEBPkcB8Wi3YR9bnz9ywO1k1x962gHeE9matk6Uz0oSxLktpg25BGGGT4CLaBnTQsic
	1kUq7vUhFp8+n3MEMuH1nzBr3dGd3Jb8MnOopaHkjX9nTBdBQmMHXSP3MuBMCuxsuqWyz2wxg7c
	1HifiZrlmfI4XpUOdIUlqqMR8wwaiqs1N2tkJPqY+82nPNpIMUyUbnfh/YHeuyFpNrCECz5vo39
	DM0E8o0EffZAWkX9id/kgEUTbaJDRlmZ+fxrrg5rLS7w7c6z4er7bXXeAcj1KMZPuq3J6NdFbTF
	W/+xj3yzM6uqVEu84aHFz18lweJQUMxk4PG7fhXKIP2vTmVWe5rfpJsfwH4S28xajrMYbL3wdTE
	a4Oznr8wpCQHemZA/8befokBl8SqRXlkqHOdSVLBm0fjg/ErieL3HOdSKOmLV85M4IUY891l0zn
	dZ2RdA9ollxL5ABgwcPVT0xLEIG3MZI/UHqbrancdoME5a4cJc9/l3mNcIahTpARnLzZaV6oUL/
	hCxM5U55q0H4fs3b8l1x1vPff+q+DEfICoUF2POpbK/nZauUjZ9jrho/1AmS6lDLg6LFjuziZ1G
	KXNtC1jWUw1RIrbs=
X-Received: by 2002:a05:6402:23d1:b0:6b5:7312:4f48 with SMTP id 4fb4d7f45d1cf-6b887ebfe91mr2673147a12.28.1795034412880;
        Wed, 18 Nov 2026 12:40:12 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b888ef828dsm1497250a12.2.2026.11.18.12.40.12
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:40:12 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso22106505e9.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 12:40:12 -0800 (PST)
X-Received: by 2002:a05:600c:3485:b0:4a2:5267:3cd4 with SMTP id
 5b1f17b1804b1-4bb7d5d4ec7mr74358925e9.3.1795034411072; Wed, 18 Nov 2026
 12:40:11 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org> <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com> <20261118191559.7a39c37f@pumpkin>
In-Reply-To: <20261118191559.7a39c37f@pumpkin>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Nov 2026 12:39:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+KX9-XMK0xAzeciAapjFecfTS_DjyVDMGwypVmEE7vg@mail.gmail.com>
X-Gm-Features: Aa3M54qPWjb0LuTmUz02ixp8KHKLIDWhYST35zoNbnN5SMvzy4vFcTOqvK5_r1Y
Message-ID: <CAD=FV=U+KX9-XMK0xAzeciAapjFecfTS_DjyVDMGwypVmEE7vg@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Laight <david.laight.linux@gmail.com>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, Nov 18, 2026 at 11:15 AM David Laight
<david.laight.linux@gmail.com> wrote:
>
> > 2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
> >    a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
> >    `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
> >    per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
> >    3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
> >    scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
> >    `s[0]`.
>
> You need to count the number of times that a letter that is the first
> character of a string you are going to lookup appears in the entire buffer.
> There might only be one 'j' in the entire buffer - but you never look for it.
> (But I might still be wrong)

That 3.9% (`187,315` `memchr()` calls across ~4.77M scanned bytes) was
actually measured directly by replaying those 855 real lookups (`s[0]`
of each string being inserted), not an unweighted 1/26 average across
the alphabet. Even though common prefixes like `'p'`, `'u'`, `'q'`, and
`'s'` get looked up a lot, 26.6% of the `dt_strings` block (`2,139`
bytes of `'_'`, `'-'`, `'0'-'9'`, and `'#'`, plus `855` NUL bytes) are
characters that almost never appear as `s[0]`, which pulls the
lookup-weighted hit rate back down to 3.9%.

Intuitively, `'\0'` hits once per string (`1 / L`), so `s[0]` wins as
long as average string length `L` stays below the ~22-26 byte crossover
-- and even on plain non-`-@` DTBs without `/__symbols__`, property
names average ~12-14 bytes (`'\0'` still made 1.6x-2.2x more `memchr()`
calls than `s[0]` across plain DTB `fdt_sw` builds, `/chosen` fixups,
and `.dtbo` overlay application).

> Have you tried an open coded scans instead of calling memchr() and memcmp()?
> With an average of 13 bytes per string (26 for your memchr()) the code loop
> might be faster.
> But beware, gcc is likely to convert the code back to a call to memcmp()
> - it certainly does for strlen and memcpy.
>
> Oh - and if this code runs in kernel the timings will be significantly
> different to glibc - it uses some magic avx instructions for strlen()
> and memchr() is effectively the same.
> The kernel functions are likely to be out of line byte loops.

Out of curiosity I timed all of those across 200 replays of the same
855-string (11,259-byte) Qualcomm `dt_strings` block with `gcc 15.2` on
x86_64 (`gcc -O2` kept the open-coded loops inline and didn't turn them
back into `memcmp()`):

* glibc `memchr` + `!p[slen]` + glibc `memcmp`:
  0.25 s (`-O0`), 0.23 s (`-Os`), 0.22 s (`-O2`)
* glibc `memchr` + `!p[slen]` + open-coded inner compare:
  0.23 s (`-O0`), 0.21 s (`-Os`), 0.21 s (`-O2`)
* Fully open-coded (`p[0] == s[0] && !p[slen]` + inner byte loop):
  0.91 s (`-O0`), 0.62 s (`-Os`), 0.40 s (`-O2`)
* Out-of-line byte-loop `memchr` + `!p[slen]` + byte-loop `memcmp`:
  0.86 s (`-O0`), 0.90 s (`-Os`), 0.50 s (`-O2`)
* Original per-byte out-of-line byte-loop `memcmp`:
  3.31 s (`-O0`), 1.87 s (`-Os`), 1.86 s (`-O2`)

Even with a ~25-byte average stride, glibc's AVX2 `memchr()` handles
almost an entire stride in a single 32-byte vector load + compare, so it
beats the open-coded scalar loop by ~1.9x at `-O2` (and ~2.7x at `-Os`).
Open-coding just the inner compare barely moves the needle since
`!p[slen]` already cut `memcmp()` down to 14.3k calls across the 855
insertions.

On the kernel / bootloader side, `fdt_find_string_len_()` is only called
by `fdt_sw` and `fdt_rw` when adding new property names to `dt_strings`
-- normal read-only DTB parsing (`fdt_ro.c`) never calls it. And even
with a naive out-of-line byte-loop `memchr()`, `memchr()` + `!p[slen]` +
`memcmp()` is still 3.7x faster at `-O2` (`1.86 s -> 0.50 s`) and 2.1x
faster at `-Os` (`1.87 s -> 0.90 s`) than the old code, so keeping the
simpler `memchr()` + `!p[slen]` + `memcmp()` seems like the right
tradeoff.

-Doug
