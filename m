Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029363;
	b=yu8cmNOkOosYlUIxfklobIaVGyFoGnFH6XhZzEMUqikf5OGd6QJtPmWBJz0p4jTDZEEy
	 pVjwG5C7uQXSFtMs1vgc4XI/VPRVQlYw9z+4jzgmVbfllJT8RGopWxhbundlaH8DlSoBu
	 Ckr28oVACapzohxBu36RTGwbPDMtlVAucxabxeUNwRXag5iX623SHemYxhBPIc4AqJREx
	 rfeb8nV+l6xNWiE2GwJet6ylVN8z6yWb6XxOPC14OCVVHtPliwQvbI5HNeaPaHp46qZqz
	 kBq7puJ071/0C7T1GRdPVvZlZ6ZpFMLTti+sAm24IBcHsjtwJv4KL5OEcQhphCmKKZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=bStvPDV/J1vGilix5sAk+qt1tT2j9aOVdxdc6N/4kWM=;
	b=ANPCGW8bV8TOqUue+sQCrF3Gw8djq05YOlvetiTQ7ARWRTAulD0ffJBtIMLceD9dE6Gr
	 ApOzI+gXuO8i9WQ0Ebvy6SybAR3GwAbpF+Hl23n+AJYoYCtv2XIHRzpyyXcvD12vSxcWX
	 yx5qP3+jD6SGGMOQkT01CZHYk0JO/cAeOckFsf8hG02wuXCo74aNORmp9U/qyTg8QQQ8z
	 r+ZqgsKDXhWgFr/qA4oBtjoGLsSHeUeKKtN53WXfefpBe6/or4M56xULunigoFXGBQxRh
	 N1q/3b1VkpV5F8c1V2VtufDWHeVb0XfXKLXO1RMSK950xSB3vUJ56V+l6/jb+Th6Nqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tcbH8uTP;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678A606A331
	for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 19:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E678A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tcbH8uTP
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a357b1c649so884339f8f.3
        for <Devicetree-compiler@vger.kernel.org>; Wed, 18 Nov 2026 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029361; x=1795634161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bStvPDV/J1vGilix5sAk+qt1tT2j9aOVdxdc6N/4kWM=;
        b=tcbH8uTPPIacl2pUnV5ukIA+K9TumGFleoI7xLZ2Xn+ePxR1rMivlDRBkpDn8EW3rB
         htVG+3pm4FG/lFIwYA/E8nk4rTAShbMZTrh/TQBkL4BHT/toPKtTOj2FwSz9FBz7pnK7
         d+/ndS7FNaKLnb893geujjVcHVWtMy7aGdx2QHl/xTppWMSKxOWh9muHq74LzS4GIm1l
         IeTjsNbK++tvogH5AzMHzQfzeQVVSjSQoq/bUm9/g92aL17xyZpfrPzh/XjlXE72UWm9
         /7mVawSfF1Qs8POlwzGq+j63yK6ZP3DfguKnl2ocE0Ozfi+xM+3HRR5ja89G9Urs8RPO
         t8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029361; x=1795634161;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bStvPDV/J1vGilix5sAk+qt1tT2j9aOVdxdc6N/4kWM=;
        b=Hk2VGSCcZXljOJkFEu0XMPSGoXoUcG6vFNnP8ohUeONm1ug1DFAUVzCvbiWEaPuGwl
         fdE4YT01WMXoy8GFoHeWhePRM8I3kGMEeP76MpzaNwqXGPR79BgkDYaIAACugGErd/Kf
         tvIQH6sc1Eh8CYcLaFQ/UF0hKGbEahBBhaEaaghmVLKnt9EeBFLJsQTd0z+WfyOqeuXD
         wESpHYbvvhNWlJxh6YQoLhyzSQRRYRM0nwv9dJiIJw9kQfHl4+5PQOE57Kq4n7jOv1dV
         eD6sOm1wz3afKINOrkXcK4GeNQMMi9rSy4mT5hgFYSLCMr2PuBatXGUeja+IqBU5kNgK
         e68w==
X-Gm-Message-State: APuU4Z8UlL8gVlxBTpodD7KBWhlulf6oUFcr3vGg7dzW/03vgg5GaYeq
	4O4Y4CfjAjnv7WhJ6vH2E2/FE3a9npHltxWZo0XKdgBnY99yAGgp+TdP
X-Gm-Gg: AZFdTZfQ6glCnnhiZIeY8HLaan4gB+ECHzs0S+IYMbNHBWR4mbp3h2AD3QXzdX7F4Gx
	khfXZ3+NXd22O4CztPxuLpViIph/SVUxhqTUM3h8ncdUJawlA/vr/Uu5w9f/P2EtcyjZ7COkhsN
	F8UAgyFqcFYpLasVe1Z/j4we0BsHJov4hsfZFMXVuTytc4v4IKTvYcEyE/c5i0EVCn36P5Kuri+
	HkCCd32yJ2guJw6HGENvm2sfd3bcKi/kLkAEN1g4bIHY+Fc8kSg09NMIlu7OjKp2xTWvLa0+By6
	Gax67D0gh8D1QR6CIrA9cz8kKzkXRjB0wSrOzcxWcVYLKQB8SYy2aDeXzvSDYstT/+lN68GWoX9
	7+5Wby74Jf78YrRli6nX9kj5KT3aCuiTgsrZ384jiZw32POnMryzMm7EgE0WPg6g74fcF3gTQyJ
	PPLuCyUFm1IiuycfG1R6bLqkbp2U7jQ/lwkie3I7qxvIKfeY+KGI/binzyns4mOdfl1y5S8+x0q
	RWht+e98zuXcqVGTLmwrdiw6tphYpZkAGOMdiMfW/MhJjYmKp8hjw8EzdGu0vUFvtJxoZ2qZXbx
	tztYmg/okk4KxbFidYrRfXqhq4OYc9Xw3oxYEEn9OKhnB0qx95ZTg6ESZ7h64GwWvpv/q5/6hhG
	8PCrTPmjo5ok=
X-Received: by 2002:a5d:5d12:0:b0:4a7:14d0:9c4c with SMTP id ffacd0b85a97d-4a714d0b8b5mr6051587f8f.6.1795029361023;
        Wed, 18 Nov 2026 11:16:01 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm6131023f8f.6.2026.11.18.11.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:16:00 -0800 (PST)
Date: Wed, 18 Nov 2026 19:15:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Saravana Kannan <saravanak@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QW5kcsOp?= Draszik
 <andre.draszik@linaro.org>, Simon Glass <sjg@chromium.org>,
 linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Peter Griffin <peter.griffin@linaro.org>, Julius Werner
 <jwerner@chromium.org>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <20261118191559.7a39c37f@pumpkin>
In-Reply-To: <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
References: <20261116205320.1621386-1-dianders@chromium.org>
	<20261116205320.1621386-9-dianders@chromium.org>
	<20261118095418.51d30ee8@pumpkin>
	<CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 09:24:38 -0800
Doug Anderson <dianders@chromium.org> wrote:

> Hi David,
> 
> On Wed, Nov 18, 2026 at 1:54 AM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Mon, 16 Nov 2026 12:53:05 -0800
> > Douglas Anderson <dianders@chromium.org> wrote:
> >  
> > > `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> > > across the string table (`for (p = strtab; p <= last; p++)`). When
> > > building or modifying trees with large string tables (such as DTBs and
> > > overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> > > `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> > > byte dominates serialization time.  
> >
> > Are those symbols just in a linear list with embedded '\0' ?
> > That doesn't scale well at all :-)  
> 
> I'm assuming from your :-) that your "That doesn't scale well at all"
> was intended to be wrapped in <sarcasm> tags? :-P

Something like that...

> > > Advance `p` between candidate first-byte matches using `memchr()` (with
> > > an explicit `slen == 0` check for empty property names and a `tabsize <
> > > slen + 1` bounds check before computing `last`), preserving identical
> > > suffix-sharing behavior.  
> >
> > Might it be better to scan for the '\0' that terminated/separates the strings?
> > Then you do one memcmp() for each string/symbol rather than for each time
> > the first character appears in any string.  
> 
> Two things work against scanning for `'\0'` here:
> 
> 1. `fdt_find_string_len_()` intentionally supports suffix sharing (e.g.
>    `"controller"` matching the tail of `"interrupt-controller\0"`), so
>    scanning for `'\0'` can't check `nul + 1` (the start of the next
>    string) -- it has to start at `strtab + slen` and test `p = nul -
>    slen` before each `'\0'`.

That isn't a real problem and doesn't make much difference.

> 2. Every stored string ends with `'\0'`, whereas `s[0]` only appears in
>    a smaller fraction of bytes. On a real upstream Qualcomm base DTB's
>    `dt_strings` block (855 strings in 11,259 bytes, average 13.2 bytes
>    per string), `'\0'` occurs on 7.6% of bytes while `s[0]` averages
>    3.9%. Replaying those 855 insertions makes 362k `memchr()` calls when
>    scanning for `'\0'` vs. 187k `memchr()` calls when scanning for
>    `s[0]`.

You need to count the number of times that a letter that is the first
character of a string you are going to lookup appears in the entire buffer.
There might only be one 'j' in the entire buffer - but you never look for it.
(But I might still be wrong)

> 
> > Even with the code below you want to do the !p[slen] check before the memcmp().  
> 
> Agreed. Since `p <= last` (`strtab + tabsize - (slen + 1)`), `p[slen]`
> is always in bounds, and checking `!p[slen]` (i.e. `p[slen] == '\0'`)
> before `memcmp(p, s, slen) == 0` cuts the `memcmp()` call count across
> that 855-string replay from 187k down to 14.3k (the exact same 14.3k
> `memcmp()` calls you'd get from scanning for `'\0'` with a `*p == *s`
> pre-check, just with half as many `memchr()` stops).
> 
> Timing 200 replays of that 855-string (11,259-byte) Qualcomm
> `dt_strings` block with `gcc 15.2 -O2` on x86_64:
> * Original (per-byte `memcmp`): 3.45 s
> * Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
> * Scan for `'\0'`, `*p == *s` then `memcmp`: 0.36 s
> * Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
>   0.27 s
> * Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)
> 
> Since you already applied this patch to `main` (`c954f9dd8357`), so
> I'll include a 1-line follow-up patch swapping the check order (with
> `Suggested-by:` you) in v5.

Have you tried an open coded scans instead of calling memchr() and memcmp()?
With an average of 13 bytes per string (26 for your memchr()) the code loop
might be faster.
But beware, gcc is likely to convert the code back to a call to memcmp()
- it certainly does for strlen and memcpy.

Oh - and if this code runs in kernel the timings will be significantly
different to glibc - it uses some magic avx instructions for strlen()
and memchr() is effectively the same.
The kernel functions are likely to be out of line byte loops.

David


> 
> -Doug

