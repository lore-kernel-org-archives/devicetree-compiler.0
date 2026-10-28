Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224652;
	b=KB3DsrCfU4aFn7k1IGdEagPCItHGxCbssk+L60052+52pHPpScRWOr7vXAWby7otI4Pl
	 iE02UwC1MDRJOd50FWGHKYrJ5xWMLYxjGPDoZU35lcseH+19KfjqX/b3xZV2OCpPmu6FI
	 2BJ4srNwH4k+zlcTL0y4zqAc/eb7CVqF3TlGppgWUfSVnr5ORdHK55rfMrmud6nEDj02b
	 olOAttNQU1uXj4FyD3fwrSlfrcD8VU4iQB7cpaY0cmkpOVQrUdgOcOmc24hzu3QwZSxKW
	 XGDiLex9U1o6rklKktJuuVK/+RsbmPkKz+lEuLGotzL136eDyyj9aMDfR/tatHQheqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yvSpU1RmCwpqp69YfdVcFdLUU7Lktr8hu4x+f1G9b+A=;
	b=End7Qr6krqp1mrrjTgHXaQfjwcEw3YMfxbuif+D1WPk0M8g9i+g7VBLWJrotcn/U2EKF
	 3hZZQ3zAImu8ER0Xbu9SJ/MZNyGuE5bvuk7vAh7GgKYjQZ6GQBH7+gmfcF/tG/n+bwloQ
	 3sA57JP87tIu6HL1Nxcv2LCO9CVS3dNya3Apm8ik/3T4wX7xJ3SfGo0Gxempo3/w/JzmQ
	 TFjnhUvHjG9lf2nrPtbGwFY5m6RNUyMF67YyAg8bZwTLvH/e9MRAyntkAyHunssKm9JEJ
	 snijnqC7nf9ZeadfkL+dg4Nw8DGac0pHVicFXqzuXilE4CHW30oMP56Zk6xvpKsXA0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AMT0g+zp;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A297360A2613
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A297360A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AMT0g+zp
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c45551fa84eso156589366b.3
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224650; x=1793829450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvSpU1RmCwpqp69YfdVcFdLUU7Lktr8hu4x+f1G9b+A=;
        b=AMT0g+zpci16EKjZ4wsO1XESPRh6ZKXILrSBYaQSLh1EnSaWlXtpU4tBFBYD0IG7s4
         8sczqytm06D9/85a6C8qNg13VZQBEBGSjRKhyPT+1rA6CeMxu8HQ2i1WTkO/kHwxb8C2
         bfm+G16sz7LYcI3d20lgkXoaqEiSagqZwmmtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224650; x=1793829450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvSpU1RmCwpqp69YfdVcFdLUU7Lktr8hu4x+f1G9b+A=;
        b=QQiUTfGSKJT9/23EiB6gM4GmzA4Vec59nhMsNCQsgeV43ccxwPEMS3ADW7qUXZbOO1
         TvRCjn42rO5hwxTw2+yTXCMhSR4WjBws9pg2gTzut33cCVg9MIzHTnWxvM3mbfDt5Znx
         nSUfpYgoKj9R7fEE0uBd2popBeLq/yjl92rVx3aJVqahoB7PsftHDVVnzgQzr6vHMIYP
         iJAY3OC3Wnh7oIW+FWoFDG3D66UD/qfF4zXTOAkMyArMokiM7Zt4OmP/sGyJUt6ToDUR
         J/UVUxw9N+AW9y0uRpJ+QV8EPcQICHH/7I91kn0ZNe8YybL6oggGK/VQx7dB9Mek4Y5G
         dELg==
X-Gm-Message-State: AFq9FYJEGreG+LGAG8iTaBYRUmDTDmoL5aaPiiiWBgQvGP3KX3MsjobG
	qXgMSvY9a6xaQGiLWAcGSNtSZOXL3UtEcr9Colyuj9uTJ++9HikdGbmWr2uwvjixLW1GjWG9J5C
	Vj11Un07Y
X-Gm-Gg: AYBFou08SuyWbj2uvm6BfU8Ck15UvwtWcrhsNAxwDDxJr3qkdZW1hlv6Rhgxk9yixMZ
	chiLTSUUCzAL66AAb+3G6uW7DZ7TsJr6zt+pIuZ9TAQlP12BhEF0Wk8cHpDEnq1r8A5VFIlkwVR
	+kanrONMtIWr+O6mzTuPQjYEUXAtfipoIAI9QhLu3GS9vXo6cXuCJdRjxFiOXyEfgYdc54CglHc
	Eo+WzZOGHBXvl7DyzEZdefvgH903m7gZr5R8EH5dNTjW6jnXSjyzfZ/Hkkt8Wrig66a03mGWl1L
	sgQi+oUNcPG0mB8DNT5sl+vu0LXi2rPwfGcxFs4UXMj+RP2hscHK/RmLGCjhvc3g2Xr97fq3sKg
	nJVmgTxZi/P3utWILouk7bIckAprAlaEq7RjWU0Ofze1AaV1gdF4PB9TA5E5tI+Ai63+/7CcCdS
	I8Glyxc+KLSjqSVz9zlUczQdFREI2cK7pnWD3+daPvQWvEX4BO96c1HvkT0wO0GCB8epPhTbRBP
	PhDwFxx0M9e+tJb8djUPu2637QfDZPiQc7PkiBofgK52gv29BUMUOoxHbsNtkv3RyiajFM0HVp1
	kogvZJRN1/Q4os7ipOz2Qs48BvHdlWxMxhYODrAMdpQKUsGVDwhwZVo1eB+HC36X77vy
X-Received: by 2002:a17:907:9805:b0:c2e:8eb7:53dd with SMTP id a640c23a62f3a-c49bdf76cf0mr317541166b.42.1793224650086;
        Wed, 28 Oct 2026 14:57:30 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd64f8b6sm652118566b.48.2026.10.28.14.57.25
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:57:29 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0759so784060f8f.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:57:25 -0700 (PDT)
X-Received: by 2002:a05:6000:1862:b0:48b:d9:cb52 with SMTP id
 ffacd0b85a97d-48e5d2f0870mr9207532f8f.27.1793224645061; Wed, 28 Oct 2026
 14:57:25 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org> <CAFLszTjB-wcxTEKVNo-z0PctkhqavGEh+eiRyiPsMZBPkQbHtw@mail.gmail.com>
In-Reply-To: <CAFLszTjB-wcxTEKVNo-z0PctkhqavGEh+eiRyiPsMZBPkQbHtw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKNgv4s6sjwhmFGsdwWT0hoH7aeT10yFukfGgKJG7Otw@mail.gmail.com>
X-Gm-Features: AclHuK9JLI1NV3Vu1fFwtBgddt7vzex8tSoFo5s_xXqgH3jZvlT38aEpTZKBlME
Message-ID: <CAD=FV=WKNgv4s6sjwhmFGsdwWT0hoH7aeT10yFukfGgKJG7Otw@mail.gmail.com>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:
>
> > The fdtfactor tool can either work directly on a set of compiled device=
tree
> > files or it can work on FIT (flattened image tree) file. The idea is th=
at
> > you'd create the FIT file containing all of the duplicated devicetree
> > files and then fdtfactor would "optimize" them.
>
> This is an excellent idea. I have been thinking about something like
> this for some years but then when Chen-Yu Tsai wrote something which
> used the kernel build (Linux 17c31aded9a1 scripts/make_fit: Support
> decomposing DTBs) I forgot about it all. So thanks for taking it on!
>
> Ths script's post-processing of a finished FIT only works for a narrow
> set of images. Apart from signatures nodes (where I think it should
> error), it also rejects FITs with external data[1], which mkimage -E
> produces and binman[2] uses a lot. Of course, mkimage does support
> making the data internal, so it's easy enough to work around, but also
> likely easy enough to support in this tool once the initial version is
> in.

Sure, if you want to make additional improvements that'd be cool.
Keeping it out of here since this patch series is already giant
enough. ;-)


> As an aside, this would be a great feature to add to binman - trivial
> once your script is applied.
>
> > Add 3-board test cases covering default mode and `--strip-local-fixups`
> > to the `fdtoverlay` test suite.
>
> Please can you move the tests from all three patches out of
> fdtoverlay_tests() into a separate fdtfactor test set? Then they can
> be run on their own with run_tests.sh -t and skipped cleanly when
> Python or lz4 is not available.

Done.


> > 3. Better savings than just a simple partitioning, like between SoC and
> >    boards.
>
> It would be worth including numbers for a plain SoC/board split on
> trogdor compared with fdtfactor. The whole set compressed with a
> large-window compressor would also help (as David suggests). That
> would show how much of the 87.5% comes from the factoring itself.

I decided not to do this on trogdor. Trying to make the trogdor base
SoC compile as its own base dtb seems like it would be a lot of
trouble. Maybe I'm wrong and it wouldn't be too bad, but instead I did
something even better (at least, in my opinion).

Instead, I ran fdtfactor on the downstream Pixel 10 devicetree files.
Those _are_ already using a play SoC/board split. I'll include details
and numbers in the cover letter of v2.

As I responded to David, I'm not sure I can test the large window
compressor since device tree files are compressed separately.

-Doug
