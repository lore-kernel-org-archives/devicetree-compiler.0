Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932503;
	b=pJDiJPtmBJQLbsFUvu5TfmyAzxh7IcyvS798JG8kTGN5SvFYdn/w8bU0BqiHOKMjnTcL
	 ajTPKnSHlCWRxsFug4JTwgT7o3X/S0ZVd/01hYqf4n9DlWbU09rFDOIz9EVKetP2Tk6XG
	 d4qoI43REZU4kic3auosU3PmWII9aSOE/AnFE22WmdqeYSI+7WmgXyZ9ZNH0QFrlXJZ2f
	 cDawUDNUWvGfaGv1GFuZ0HfKCGxLZlS3jD7bSi3kfLxOVXGhyWxjceI5wC6YRRj+o24+R
	 ym14OmBZc2v/cEK9oIbGnW7bN6YudY1zwR4n9Rsn1JCo2cGVkUiDx4n4exzY04GRrCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=4A3WKTqsVWE8KBkmTAQMvbvz94FbXUBofC05vB1uGNA=;
	b=Rq/h+P5qdWaUYKE8PPTbFluiLq/8R7/pZ7OBIq7g62dI1Q+HVkrssNFmwX2dek2jqumZ
	 W6BFBq7dD/sDAs/pNrClPe3jLn0jQKfS+39I63Y8JY9oMc0fryUA1kzCqT0c+p9rmwZXX
	 CfNlmquYo6YgQyT42kuqXedZMh76cRs1yDc6NEPviQkJVUQETylEUZ6KAGYF7cY3uY5rM
	 CVdEB2+tWfUIbr3Y/3zyAtZX3ElZzQxM/Y7NPrTmss/2Zi3m6Dmm6Zz3gR+mYeaahu/Y9
	 rNH+cVy3Wr1RPlxrFlZtCW6Oau3klMXM2XwsPp1upcLtDewfsiKCz1+8xp3/3qPmXvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fw8mROcN;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFFC606A334
	for <Devicetree-compiler@vger.kernel.org>; Tue, 17 Nov 2026 16:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFFC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fw8mROcN
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so30647a12.0
        for <Devicetree-compiler@vger.kernel.org>; Tue, 17 Nov 2026 08:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794932502; x=1795537302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4A3WKTqsVWE8KBkmTAQMvbvz94FbXUBofC05vB1uGNA=;
        b=fw8mROcNJLENA2b7j5V768JdGDPzay7fZ6eGyvABxgNtL74NchZZtE6ln7r15qJ6wi
         7XRSHiDBb5o5uPoy7uU9NLo2LkhA9NR2CvlsR9Xsuk6tEVOkJqrDAGlRDV7zUrLmfAAM
         qzcpstPcno2dTssCz+1iTivlUN2mqL+zX/kr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932502; x=1795537302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4A3WKTqsVWE8KBkmTAQMvbvz94FbXUBofC05vB1uGNA=;
        b=ZPJ3I4Rv7CFYxC0cBbLGoidfyhqY/KDRuQSLAOVaYH2MACtdWIk0g5e2XzpnyKRbIn
         m/m9MZ0SVoJuDNLSn/c/JgpqaAIFUVZwxORQNk3PDAN6OrMWq6O816e24VmhxcCxOgLn
         MKXcZ678rm1sYBmB7nRTdAT962wpK8IXoaCHpY+N4+ns1/ACXwvBVTjni8kPnTjCoT+g
         9WnzAMPzl1GWz+bk6m0R3QVTBfsXYpNTC1izfqYiP1KuDZLUEqDutlilaJzIwM1c0b+b
         IFO9Iba9vn97uWN3OAQOlUAs4yqyD87jPDnWldwWX5a5wSHkFY75ZmcE6/1wmRf51Tsp
         zmRg==
X-Gm-Message-State: APuU4Z+iv4zCKSlkuHKf7qop4D5mAgBxRZaFbZs6A4nGOEj4JsV1XL7P
	tpRExwpoUaQwtmr7vHsvVNts2r+5OdAZM7J5runiDPV9OT1aGDySJnKPeFG+NTHNPwXI/6qaMRP
	/msFWjw==
X-Gm-Gg: AYBFou3+rh37iqheKtF1R9SAlhzJsXdUzHAfRnmJaVugxXNzUSHpd8fBpTnSxBVqKdy
	lKS2vr4gEhEugUgtVBeLL2oAZwmmfPBRXh/twT6mvVX0+ZLRMbaTkr7hDab9d8NCRrLx/Z9zJL0
	UupNX2o0WI9JKJYMMcwyEljJBiFd9yVY5+qvvcigUPhFmXHdCWcIlzTKeGo7enBFXH+VU3IyZ5F
	k1z/LcgMZ1gYbKvoPSXRYXWnj5HjlF/nBww+6rKK3hUVLV33vNsWBMuzsoRDNnDtraSjQtaD03v
	EkEIxVvyfoJJjdj5tdG1MH/iaEslYDMy8fWAuvH8xKPBODi6XtEk9nmdQzsZwMZFbIRcUZS/S4h
	t6Nc42t+sxY+Zid3fwNLVDpcHgcRMUrwzKbA7rOIySiWVX68zGCU2F4ly3LjYZwuPB4ZI6gBfw6
	SnTB8omFvPItcMejnHkqm7oy0JsH6VOxLSfP2Zp4IGcN7DHzKn19sLagH5oJEM3c1i4biATn+M2
	wAt48r836I/6X9RwqNDNLcwZKF+Op8YJpfJnXGm65D5Ph9Kf33vIo9m07yg/xXYZN8Iab4Z6oKN
	HNt9d2A+hrDGajgS1nGFZCYM4McWAwwNzc17M81uSUF48Dk3kICDhR6J8tqm/+xT6rjt
X-Received: by 2002:a05:6402:11cd:b0:6b7:164a:7228 with SMTP id 4fb4d7f45d1cf-6b7c0d0f86amr11265159a12.41.1794932501579;
        Tue, 17 Nov 2026 08:21:41 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886a7db1fsm7381a12.13.2026.11.17.08.21.39
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:21:41 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4919a880834so2604582f8f.0
        for <Devicetree-compiler@vger.kernel.org>; Tue, 17 Nov 2026 08:21:39 -0800 (PST)
X-Received: by 2002:a05:6000:2584:b0:49d:a36c:2d66 with SMTP id
 ffacd0b85a97d-49da38ab522mr26157470f8f.27.1794932498429; Tue, 17 Nov 2026
 08:21:38 -0800 (PST)
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
 <20261116205320.1621386-9-dianders@chromium.org> <avvRY-nTstFbvTpF@gractus.seuss>
 <avvTEIZQZwra3Zra@gractus.seuss>
In-Reply-To: <avvTEIZQZwra3Zra@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 08:21:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+2wMhc6OALzbHgn8x9AnWUFCay6sGB7sqKqffGLb7ZQ@mail.gmail.com>
X-Gm-Features: Aa3M54pz7DW5yM-a4JW5wjVNliWZLdPpMra5U8vPsgIIoqjo8RSA7Zhl1aOgCMU
Message-ID: <CAD=FV=V+2wMhc6OALzbHgn8x9AnWUFCay6sGB7sqKqffGLb7ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, Nov 16, 2026 at 8:07 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > > On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
> > > DTBs) this reduced `fdt_property()` time by ~5.6x.
> >
> > What we really want is memmem(), which would presumably have a similar
> > optimization (and likely more) built in.  However, we avoid that to
> > make this easier to environments which lack it.
> >
> > Complexity isn't too great, so this looks reasonable to me
>
> Hmm... actually, thinking about this again, I'm kind of baffled that
> the speedup is so large.  In the old version, if p is at a character
> that doesn't match the start of the string we're looking for, memcmp()
> should return almost immediately (after a single byte comparison), so
> I'd expect both versions to be - roughly speaking - a single scan
> through each byte of the strings block.  At least with gcc builtin and
> inlined mem*() implementations, I'd expect the performance difference
> to be pretty modest between that and the new version.
>
> What was the environment (host CPU, libc, compiler options) you used
> for the benchmark?

Environment details:
* CPU: AMD Ryzen Threadripper PRO 5995WX (x86_64, AVX2)
* libc: Debian glibc 2.43
* Compiler: gcc (Debian 15.2.0-14) 15.2.0
* Flags: default `meson setup build` (`buildtype=debug`, so `-O0 -g
  -fPIC`), though testing at `-Os`, `-O2`, and `-O3` gives the same
  ~16-17x speedup on the string-table scan itself.

There are two things going on even at `-O2` / `-O3`:

1. **GCC can't inline `memcmp(p, s, slen)` when `slen` isn't a
   compile-time constant**: Because `slen` is a runtime variable (and
   GCC also can't synthesize a `*p == *s` pre-check on its own since
   `slen` could be `0`), GCC at `-O2` / `-O3` emits a full PLT call to
   `memcmp()` on every single byte `p` of `strtab`:

       .L10:
           movq    %rbx, %rdx
           movq    %rbp, %rsi
           movq    %r15, %rdi
           call    memcmp@PLT
           ...
           addq    $1, %r15
           cmpq    %r15, %r12
           jnb     .L10

   Even though glibc's `__memcmp_avx2_movbe` returns quickly on a
   first-byte mismatch, paying a PLT call/return and function prologue
   on every byte of a ~14 KB `/__symbols__` string table (~5.8M
   `memcmp()` calls per 800-symbol DTB) dominates runtime. Just adding a
   scalar `*p == *s` guard ahead of `memcmp()` already speeds up the
   test below by ~8x at `-O2`.

2. **SIMD scanning inside `memchr()` (~2x faster than a scalar byte loop
   at `-O2`)**: Instead of stepping one byte per scalar loop iteration,
   glibc's `memchr()` (`__memchr_avx2` on x86_64) broadcasts `s[0]`
   across a 32-byte YMM register (`vpbroadcastb` + `vpcmpeqb`) and scans
   32 bytes per iteration inside a single call, only returning on the
   ~4-6% of offsets where `p[0] == s[0]`.

(In the commit message, overall `fdt_property()` time dropped by ~5.6x
rather than ~16x because ordinary repeated property names like
`compatible`, `reg`, and `phandle` hit near the beginning of `strtab`
right away, and `fdt_property()` also includes copying the property
value and header bookkeeping.)

Here is a small standalone C program (`bench_find_string.c`) that models
building an 800-symbol string table 200 times (~4.2s -> ~0.25s at `-O2`
on my machine):

---8<---
// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
/*
 * Build & run:
 *   cc -O2 bench_find_string.c -o bench_find_string
 *   ./bench_find_string
 */
#include <stdio.h>
#include <string.h>
#include <time.h>

typedef const char *(*find_fn)(const char *, int, const char *, int);

__attribute__((noinline))
static const char *old_find_string_len(const char *strtab, int tabsize,
                                       const char *s, int slen)
{
        const char *last = strtab + tabsize - (slen + 1);
        const char *p;

        for (p = strtab; p <= last; p++)
                if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
                        return p;
        return NULL;
}

__attribute__((noinline))
static const char *new_find_string_len(const char *strtab, int tabsize,
                                       const char *s, int slen)
{
        const char *last;
        const char *p = strtab;

        if (tabsize < slen + 1)
                return NULL;
        if (slen == 0)
                return memchr(strtab, '\0', tabsize);

        last = strtab + tabsize - (slen + 1);
        while (p <= last && (p = memchr(p, s[0], last - p + 1)) != NULL) {
                if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
                        return p;
                p++;
        }
        return NULL;
}

static double bench(find_fn fn, char names[][32], int nsyms, int iters,
                    int *out_tabsize)
{
        struct timespec t0, t1;
        char strtab[32768];

        clock_gettime(CLOCK_MONOTONIC, &t0);
        for (int it = 0; it < iters; it++) {
                int tabsize = 0;

                for (int i = 0; i < nsyms; i++) {
                        int slen = strlen(names[i]);

                        if (fn(strtab, tabsize, names[i], slen))
                                continue;
                        memcpy(strtab + tabsize, names[i], slen + 1);
                        tabsize += slen + 1;
                }
                *out_tabsize = tabsize;
        }
        clock_gettime(CLOCK_MONOTONIC, &t1);
        return (t1.tv_sec - t0.tv_sec) + (t1.tv_nsec - t0.tv_nsec) * 1e-9;
}

int main(void)
{
        static const char * const prefixes[] = {
                "clk_gcc", "reg_vdd", "pinctrl", "i2c_bus",
                "usb_phy", "pcie_ep", "mmc_sdhc", "gpu_opp",
        };
        enum { NUM_SYMS = 800, ITERS = 200 };
        char names[NUM_SYMS][32];
        int tabsize = 0;
        double dt_old, dt_new;

        for (int i = 0; i < NUM_SYMS; i++)
                snprintf(names[i], sizeof(names[i]), "%s_node_%04d",
                         prefixes[i % 8], i);

        dt_old = bench(old_find_string_len, names, NUM_SYMS, ITERS,
                       &tabsize);
        dt_new = bench(new_find_string_len, names, NUM_SYMS, ITERS,
                       &tabsize);

        printf("%d trees x %d symbols (final strtab = %d B):\n",
               ITERS, NUM_SYMS, tabsize);
        printf("  old (per-byte memcmp): %.4f s\n", dt_old);
        printf("  new (memchr + memcmp): %.4f s  (%.1fx faster)\n",
               dt_new, dt_old / dt_new);
        return 0;
}
--->8---

-Doug
