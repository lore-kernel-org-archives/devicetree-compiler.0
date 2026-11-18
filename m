Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022695;
	b=ZBr9QTUzMrzoTPK6ppzFQKAQNrn9bmdvamuonS/M7uV0CTo7vGED9eJtNt5Hln+lSeap
	 beixWHMKmdFQX0eowrL/dF+z1tDy2iCm3JgV2GwXpE4TTbn5yA56kGkDB8eLQ9NkozcUH
	 iy1AilAebrdfcI/UIgjddpnX4S9PwEJEbRp3jzOyWeG/iXLiUuqiILy0oL6spwRCZg7V/
	 f9YBibfse9EWvRH3g4cbI/ScwhqkuwidfZ7Dm4V2JJ3K4ve+ywQG0euqsHu6P4QAMZazS
	 giJ2mnS+VKC43tqcJDfaYQbcr1jJ8Xl5jt34aPTf2BVNvVttkcnNPvXnjpKvpLwRgGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=JAeSxvyXiRmsMJ3f4euXUCxQsMzoP2I8Tha/sl3LGrE=;
	b=kZv6PK2BRFApPy/E/LyNYfURvl5d+3qY3sJT+tJiRKMLb7xjRUOd17SG315effPjwg48
	 U+A7skpEIhI8ahpdAL4zxUtV4WZ5Suea1Q4Y47yCCnes7E1YhLtY1Qt2SXW/lyqfN/CQr
	 mY+4lSX8rLbVW7IyP872g1U50wC104SyJR0E/er4qG3K6KYKEbKGEizDY6CF7QJhtA4Zo
	 VUw4P8irB4MwdUxTsZ1B5AzQqh6n3u4EUd3Isl//fA1pUF6hSMYkq9lC8+Aqw1ws38VA8
	 2l4MrrwWLQ3qpg4L82oBzwIFp15z3tVZ7QPLzEtRtKuKwpHcgMbdEZUzsK6WAd/yNzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jJbiSWWt;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC28606A32F
	for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 17:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC28606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jJbiSWWt
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so1791744a12.0
        for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 09:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795022693; x=1795627493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAeSxvyXiRmsMJ3f4euXUCxQsMzoP2I8Tha/sl3LGrE=;
        b=jJbiSWWt3hjRc3O3pRosjO6aPvDoWH+lfJn2T/ii66GQdei6mpk6vHr5fPyRh7DxwU
         1ubr3/w1gE2fTdfHX7ec1hoIkXgRThjFlaoHZB9IaSYv4EOX/3boMDgMtlqlEa5YU8j3
         MS02dDpeVcL+v09aJ9zFDBRchKc6x/unzzC0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022693; x=1795627493;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JAeSxvyXiRmsMJ3f4euXUCxQsMzoP2I8Tha/sl3LGrE=;
        b=vaWCiZExKCJMxJQE/znEOp/hjxFjHb4JDAb5jRuBB48tbQY0RuZCnNj4X1M9yDbY4y
         g57NrOZ6+KvwUXdGCEOUE02ztN3GwWIemRFWlxxmDgdx2mLOwFS84WuMLHe0Tit4xaTI
         nKF6P42qLvSnReKECSokyDAFalGfCBHmgmIEmaC0F7xefgIAHzADccniOAZcq6mTwMr2
         e0oDbVBMDK+xyaG67URUswnXZLcpE0Hs8IJgUDDQMU/ZlakfGl371HXxM58K5UU2S+NR
         ZaCMcOklHFSuMzV5dMLItF6K4ZlkqYoMvzS9EnDcPuIPhfkOrXNLreJxsSNBqjqBN4pf
         Siwg==
X-Gm-Message-State: APuU4Z82d+AhvVzU5HUBHTo7GNVwSSlyeUFWCljXqE7evV5d70Xi0lky
	JENSI6k7WYCdpkyOI/xhyc7Ita3AiBWrDMpW6v/KiM2M597GmW8PY80h+KiUOXeL3mZSjk6Ur5v
	qMOxpV7Th
X-Gm-Gg: AYBFou3pfipIaGho2hkzIbi7DEbZHqMQgudk9yvZf12yLYnTPpzsxuXJYYBZ6rTMAhk
	5kvi9jJIZUtEWbSnkKvVJEcU9zkd7QDfWU+AZSAJco4CrfOEOzMNbAla23kopmyjC3t/LBXlARP
	6pcQ79mgh6cLUV8Cxx8SB+2UXjylahBUyKmHaqs8PiIKQ3D2mLJ3y96hsafvtJTfwDaLR4Whe25
	o3bsgeTDJaViu1+xl1mKTxR5qvQI4McXAxJpf5GQfPTjc6X6aec4kWXsc1a+bcCFTduOrua5Rti
	16FI83+UG1tk60flIAaI2eGpPoKTYtVi9lIOb8Bmyf5sc6u1hsq8RCpYwpSbFo2gnCYzTozfCO+
	i11ZrevUmL07bAsgPw8bbGKy6+Y2+t9qQs59dEueXlrDx4XetC0amUO3i352BsRwIizs5f3bVOP
	YyMC3hFGODKt22yhdeTgAUgvxR1rn7TcYw7m0egddpTCZyiPj47N/decUuvBddkmEqlt/7I+1WB
	L16d51DDV3F+6jznuwM0nNs+67Npp60xbyc3WJOYaJCvIXI26+RCCFBxCplQ7BBj76TLAJW039T
	U/ajzy5S4MxSjhTkyLWxgj19DECpZB8S5ertOYjCQFSqtW4vmmgyiLQSbFZZpHKLD1Ff
X-Received: by 2002:a05:6402:1ed4:b0:6b5:5530:c9af with SMTP id 4fb4d7f45d1cf-6b887e83a81mr2853535a12.15.1795022693197;
        Wed, 18 Nov 2026 09:24:53 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a22eacesm1353822a12.32.2026.11.18.09.24.51
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:24:52 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1122193f8f.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 09:24:51 -0800 (PST)
X-Received: by 2002:a05:6000:299c:20b0:49c:9e8a:31ad with SMTP id
 ffacd0b85a97d-4a63ab743f8mr5132205f8f.42.1795022690305; Wed, 18 Nov 2026
 09:24:50 -0800 (PST)
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
In-Reply-To: <20261118095418.51d30ee8@pumpkin>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Nov 2026 09:24:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
X-Gm-Features: Aa3M54qmwNkSUziy75AZiIFWCnPWMk25YyIyR4JL-u3z6SIV6TTagFPK9tSRagE
Message-ID: <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
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

On Wed, Nov 18, 2026 at 1:54 AM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Mon, 16 Nov 2026 12:53:05 -0800
> Douglas Anderson <dianders@chromium.org> wrote:
>
> > `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> > across the string table (`for (p = strtab; p <= last; p++)`). When
> > building or modifying trees with large string tables (such as DTBs and
> > overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> > `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> > byte dominates serialization time.
>
> Are those symbols just in a linear list with embedded '\0' ?
> That doesn't scale well at all :-)

I'm assuming from your :-) that your "That doesn't scale well at all"
was intended to be wrapped in <sarcasm> tags? :-P


> > Advance `p` between candidate first-byte matches using `memchr()` (with
> > an explicit `slen == 0` check for empty property names and a `tabsize <
> > slen + 1` bounds check before computing `last`), preserving identical
> > suffix-sharing behavior.
>
> Might it be better to scan for the '\0' that terminated/separates the strings?
> Then you do one memcmp() for each string/symbol rather than for each time
> the first character appears in any string.

Two things work against scanning for `'\0'` here:

1. `fdt_find_string_len_()` intentionally supports suffix sharing (e.g.
   `"controller"` matching the tail of `"interrupt-controller\0"`), so
   scanning for `'\0'` can't check `nul + 1` (the start of the next
   string) -- it has to start at `strtab + slen` and test `p = nul -
   slen` before each `'\0'`.

2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
   a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
   `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
   per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
   3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
   scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
   `s[0]`.

> Even with the code below you want to do the !p[slen] check before the memcmp().

Agreed. Since `p <= last` (`strtab + tabsize - (slen + 1)`), `p[slen]`
is always in bounds, and checking `!p[slen]` (i.e. `p[slen] == '\0'`)
before `memcmp(p, s, slen) == 0` cuts the `memcmp()` call count across
that 855-string replay from 187k down to 14.3k (the exact same 14.3k
`memcmp()` calls you'd get from scanning for `'\0'` with a `*p == *s`
pre-check, just with half as many `memchr()` stops).

Timing 200 replays of that 855-string (11,259-byte) Qualcomm
`dt_strings` block with `gcc 15.2 -O2` on x86_64:
* Original (per-byte `memcmp`): 3.45 s
* Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
* Scan for `'\0'`, `*p == *s` then `memcmp`: 0.36 s
* Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
  0.27 s
* Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)

Since you already applied this patch to `main` (`c954f9dd8357`), so
I'll include a 1-line follow-up patch swapping the check order (with
`Suggested-by:` you) in v5.

-Doug
