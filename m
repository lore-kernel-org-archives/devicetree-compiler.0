Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028663;
	b=s2dt6IiDkvCmGR6MzeI5alFMi9VUKOQA4JALdwVyaApn5P6KqrCblbK+qP1PTX5KovX4
	 lCmjYIQSF64quZ7pQrXyNIdEvRJyYkqDOtLVYwYvz3XZ3dToLSRA4rvPoW6kJYFN/LD3m
	 SYke/B+9+L9QFI99PCwZ39q6WamH0yPqz7Svn0vuaJeON7stx6eZnFYVF1zJwe3H8IcoV
	 HWf/O07CrERXiWlmYlX17eRbUtmRYieVAISzxgS7ybXM6u3eiChd/cLVApp/WIOYeMor5
	 FNtkyQVFZNiAUHmpRa8SDVIAkQEUFlk1rX03ljlO3bihBb12kUszDN7qjzj7+oHWVZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
	b=YfIlNaFjfxTHr1O0jNw71smt92p6Fo7v9G7/AqWM0yfAqXKQsCaLrJncSsr+7Bn/1YaX
	 Zkt6ss5TVdnZly57HI1vMnb6iEVxuZPyTAlaSaL4Og6ObNa6QcBgQaUic9/etAfDKpS7J
	 EXk5DQk00g93PyYUub8zJl8gshSQZd5ZC/0WEZoMBOc8wpBAvLpIGhqAUstGJgJPcZhJE
	 C9WxG6Qv4gXzchxhmGkE5FI2cUrYbE+oqb/K67ImDX3be1S7SRHec7Yl02uYnpiJ8u6CY
	 YhEfr5g0XAsY7iAC0RoUYzQYY4VYiZunkULI/r5C9kbY2L7knXuYIzf92xwiedVcxbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E943C606A31D
	for <Devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 15:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E943C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso40791a12.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 08:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028659; cv=none;
        d=google.com; s=arc-20260327;
        b=hBWv3Heq9GJlCE0FAremSIhrXvLL6op9I2tXQULXCG5h1lRM0QVl9XBxb7ii7OhTaR
         L2FFO3HDGCoiXSqr0+egme8fiNgx3YTbhPGWijTEbNsi4YlYTAoShX3Q3xUH98CPFUGK
         sgsgJMBSyX/DArg8gMXRXnngk1Crcss23az/hRH796pfksBPPfL08xqmG0uirMfZjdYm
         t834U5NTnnHS+U7NJgsoovc47nUO8qIJxd1HACDvU9p15Vu1CmdeVUlQVlNc3bTMFdMt
         01SMNjRrn//UhoLBz3KCJ3w4IVGSw4MCwa9aixwJ6SA1o6HH2e6xy05Zb5opFlzMS/la
         Q5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
        fh=Nq2BAfzd3ZF5/5+yPYbxtIEuy5nctXJRFjgZ0JuXri0=;
        b=GFVu86/w3BJbwt7VvtxZ/r7mytSQoGAjN1Y5U5jlL7Up8yeHAXrBIA96a9mFEfG9xI
         3+LnyWoUsg1mNQu7ECts33hwal6pSKA3oGgQdD2VlJmWlMtRLE+YrXtVRmdXZCvcu2Dr
         O4v6iSuqaihi3EDAglVmKnY/Z0JfZbY87wZg9b2ayvBtyRcecCv6nkV+OJUubJNTuq5D
         UDP0WBRWidbV+Udv0MtRIhOrLxP8ijQkUJUpAwp0JtWLtVGwWGS3O8Ly8wVyI6RvzHOH
         OX6K++VPHarLkjlNhh0QiUV+WJ4+343slZ9nA+yK0ROW2U7DZBtLqhkExft3HYjG4X2a
         H49A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793028659; x=1793633459; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
        b=HdF7GBSrfKecNkLQ3VZyh2wB08QbA6YzaL0rI9DhFQXUEdA59fAoZClie/v/gWKm5M
         xoRLUKnXTkGEoGAJYARmg2ltCKZsKeImSsj9EnNXc3uVH/63uaJV+zOfVVjhvA6cc9rg
         zm6mGTRCjUyrHA6c/EF93c+Tqj2ygjQdpVBVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028659; x=1793633459;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WlpJk4wOlecJG2BdnZcrsDYtn2tbGnBek7P0JWeRAJY=;
        b=hCptBQuIdDbIWnhqihPIimBMDqOazvq09nrATNeJ430M3koEpHdCXgEUwRJSoXaB2w
         ykgw6ZhBAxaexn/lzFpmdzneVjFxkimUwzaxstgDRRAZN97ZwAAf1XjYi1a1IRUpAjtk
         fzzP2mFLxzl1WJNlX19Er1hp065JNwOUWmWQCKnr7Td2KQ3GHOH9I03jH+/yuWxmF2Sf
         gWGasNqhj7uA6DksbbXZz8DCLKVxpiWxtyDewsI1rVW2j0oD76c4t0T5tvVoB6HKP3X8
         3CQzcdpR0yJ7IxwQkF08E58QIgHAHK9b7oFl4pysrfuYVNkJ0wv7pGkbEKVjCmd2knE3
         m8YQ==
X-Gm-Message-State: AFq9FYJ89eAyD4KycL5z+URpSFlRz0oFLid3x3sC2A277TnMYdYk1tSB
	GgWyyuQ4AA/8LVa7hrpdEMAlHFOGzoldeWUYx3E8s0YevVvqdFuLyBgerScvhhwY+28cC188qti
	1ZqCunuV8v4rMNVwlyUaET40E61KcAzvtkFObai4A
X-Gm-Gg: AYBFou2pSPT67lxtQu4FC89vZXFsbJFlSyPvsjpLf2L4M+ktn2GGaWN37VlZdHez12H
	tEVJO290YUe9uh/QFBANayrjOldQTjhXSyu5HAxQ870wd1wqLIANxsIRl6D8Y7cOcvvEvVI2lSH
	lzoeUbZtkRmLDjLBREqh8POXWOpDjZCmD1H4QFKbrBmhSUXqG0/u4M8Nfl9Gs/pkTY6wTDAQdQg
	cC1YXI8DOjW2V8J2d7ndMJAWApdzyld3GPyN59opsEYECk0kSrCu3rvuxMeAldsxPGAVUvdWYu1
	G600E5x3R88lca1gVcwL+fEwMSqVDG9FQ2wmj9kmG2djOD2uGvmuIT5Bi3N9oVD9Fz/Q3Hmy46Q
	i/FPkD9tGwz0QjcXDEURT
X-Received: by 2002:a05:6402:c116:b0:6b1:d8d5:4500 with SMTP id
 4fb4d7f45d1cf-6b442ff1cc2mr5244408a12.19.1793028658987; Mon, 26 Oct 2026
 08:30:58 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 15:30:57 +0000
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Oct 2026 07:24:43 -0700
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261015182221.2931742-1-dianders@chromium.org>
References: <20261015182221.2931742-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 26 Oct 2026 15:30:57 +0000
X-Gm-Features: AclHuK8aG0D96i-cNQ-5K5VTR-Mm132KiROnF5-iDQubeTf8Ba_jJIWVxAlDylI
Message-ID: <CAFLszTjB-wcxTEKVNo-z0PctkhqavGEh+eiRyiPsMZBPkQbHtw@mail.gmail.com>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:

> The fdtfactor tool can either work directly on a set of compiled devicetree
> files or it can work on FIT (flattened image tree) file. The idea is that
> you'd create the FIT file containing all of the duplicated devicetree
> files and then fdtfactor would "optimize" them.

This is an excellent idea. I have been thinking about something like
this for some years but then when Chen-Yu Tsai wrote something which
used the kernel build (Linux 17c31aded9a1 scripts/make_fit: Support
decomposing DTBs) I forgot about it all. So thanks for taking it on!

Ths script's post-processing of a finished FIT only works for a narrow
set of images. Apart from signatures nodes (where I think it should
error), it also rejects FITs with external data[1], which mkimage -E
produces and binman[2] uses a lot. Of course, mkimage does support
making the data internal, so it's easy enough to work around, but also
likely easy enough to support in this tool once the initial version is
in.

As an aside, this would be a great feature to add to binman - trivial
once your script is applied.

> Add 3-board test cases covering default mode and `--strip-local-fixups`
> to the `fdtoverlay` test suite.

Please can you move the tests from all three patches out of
fdtoverlay_tests() into a separate fdtfactor test set? Then they can
be run on their own with run_tests.sh -t and skipped cleanly when
Python or lz4 is not available.

> 3. Better savings than just a simple partitioning, like between SoC and
>    boards.

It would be worth including numbers for a plain SoC/board split on
trogdor compared with fdtfactor. The whole set compressed with a
large-window compressor would also help (as David suggests). That
would show how much of the 87.5% comes from the factoring itself.

[1] https://fitspec.osfw.foundation/#external-data
[2] https://binman.readthedocs.io/en/latest/entries.html#entry-fit-flat-image-tree-fit

Regards,
Simon
