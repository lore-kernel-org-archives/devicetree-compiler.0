Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793568068;
	b=lEL2y6V+wVoku4E1qjuZbBawb+W8fUEUc3WtqLMhjr/uoVGGZaqyLES2dYfa9xLLRjIN
	 /w4G4viMRxqdCSNLg+lMrZmSBvXbDCYYyAPiZtOQUvxDNxSxsGe6xpUDF1DTHUjoXdDuo
	 LqTCQt6r1XrLWQ8l9PhrjrMczOtbn8NkGjN00dXfxITtkEhOeEqJSM3Jd6uOl030aCAZm
	 Jf5aJsXPhrsHhd1cB69sxZeID/lKhpx7T6IjpH0BE4sqizZ4jYWV3+lGJwdEinLkVAcSF
	 Q6Vh1I5w6pZ6gN6qH6agVhNVOkFn1DN0dtLpHGk7+8BSiEUvqtFbz9MV3EF1yRQYwiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793568068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
	b=1eGjLoPYYWosyNQDojLNBE8jLi23cp6dqU6oJLUqXNOAGESkrsMhii1CBNg4LtOHtrmZ
	 FfDpcO5IrSDrr/TAqRyfTH5XMQX4c85pQKzNFy1pn7bnRxscMM0h5tNv8EebprW3BBF9K
	 nm+l1TW85zGYf4tETYMy1RqRGHbnSO5/MjREAiDFJmDKlzrzeb3fM7OO1NCv/yrornmAd
	 1mZqLve2Ex/9EXO0AnD56jySHzrMqELvyoSswGX37/G4bs5bYfgthVTiWahKCFsENAXOF
	 VkK7OBfoIiqigjwDuYUbacj7Da3o5WMmduRrHjtkI7li3k4zo28+VwT1XeCjHABiMkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bO99sYpk;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB448606A324
	for <Devicetree-compiler@vger.kernel.org>; Sun,  1 Nov 2026 21:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB448606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bO99sYpk
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso3475712a12.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 13:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793568066; x=1794172866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=bO99sYpkG1Oa+WiWvekAN64FhYYmSpcBLhGD7m+FHH6EubXeobwH3omOp+4/pej8lN
         maMG7dp/L7iuSJR6+Oh36yRbS0SE+Be/R5WTAlbcvfYzCvdv7PG63R6l8DKwSRzJT2Of
         Mvj4e5DDszrJtSbEYWq/TUb/flsqqf3it0BjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793568066; x=1794172866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA4nPd0I6kv/auIuMoh3730KHkV9NOXvNkpunrQQ30I=;
        b=0vNoz3zlFn2kgcMYpsN5eFA1BzGslmchx6I5ZwU+1hzMnT0SMDK6FBgQzB1BIYk6rQ
         llaxrMTAH9fFyTjaR/isTMtTL8DajrED20aoYkpkBepRIfKfh9nVBr1iZkOvce+I7NIW
         3IBnxcpwF2/JrRyYLOrGaIfqlU4rXnXQUNM9zGRsYXcDAbfTBAYrxyOjkrp0sa0xdg5s
         sS8UQR8grm22uOSP0InuQUKQfqgahvm05XQqpHKrBYP5LIYcfxE9ZGcHDY+H8+bdYfZA
         97qooHne2sagLmH+uFB0YEKv+ne7XVUueaOBAD6UJl9k6nBKRYh1sON/mtjZxPvJVmYr
         5uKA==
X-Gm-Message-State: APuU4Z+wQ+65UfpovjWjWgeWlj0Q4s8D7dcOZFN/ZD1I5yrDiYz6V173
	a5OFPgkglRMYNV4r679SxqTozVtJvWxsiW0unc6FgM1cHhrPvhr65aMm/zlWsFshTYj9ot8R2V6
	VqfY=
X-Gm-Gg: AYBFou2yqJD1yY9YFLLkZaMJemIDs0OxC+l9qLqGk0q4NL6UbNRkWr5RLsN4LiaTj1w
	dtXwGFHXnlzbHa0OFDOvNxAjtCn1fcMWoPJPyCyNCYVmL+XWm7z7Cz9BDNuorwk8hBsc1zzamS4
	Cf4KgVkGA+IAhpH9kE64np73BnpGmIbE5XoXbpWfU6uee+TnbxLfDnqX3fnFHTVt4rqjAR1duAi
	uJMnE7fBmV6JP1IevW/an022QAJ+m0gJres32KE+vrE8Ka6yuM7EJu3uSnkgSBH1FISrJo1+5vD
	D3LsqJWNwE//oRLt7sDqH6MtmEdezN680Gk0QaN/Uhq92TSq7kFaOEi8RSqByw3kYEDpZNFIwLW
	I64HIVX/swYiCFMc7dinZJa/5mAe3hSOUmICQfZRyDuuATIigEJ62V31Ak19VbSR27y/7UsTHmg
	Qn/vwcfxs4XUjuJ/4EvYiG8vvEqui3E7HauoAv/U0V+ZaKCQ0jdAZy4q0wVZNiPRWRy3vxvoUfS
	T3v3i5O+HjaJ5FK4bAjMlVTIUja3Oj+cwggkoa/B5Z42BJkNEU2ZgYVR3+ze2aXDpJUbS5O8Tqy
	pNnf3eoM00x6ltiBBhlc8tGrAmSYhI8KZIuGjqLourVAfRU2S1YktV7vk9CIvp+IyF8B
X-Received: by 2002:a05:6402:546:b0:6b3:b0b2:6e7 with SMTP id 4fb4d7f45d1cf-6b4b0c1f69fmr5833963a12.18.1793568066071;
        Sun, 01 Nov 2026 13:21:06 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca29382sm2448673a12.37.2026.11.01.13.21.05
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 13:21:05 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1748316f8f.1
        for <Devicetree-compiler@vger.kernel.org>; Sun, 01 Nov 2026 13:21:05 -0800 (PST)
X-Received: by 2002:a5d:64c9:0:b0:48c:585b:8825 with SMTP id
 ffacd0b85a97d-48e6e2db4a1mr23331343f8f.18.1793568064814; Sun, 01 Nov 2026
 13:21:04 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com> <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
In-Reply-To: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 13:20:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
X-Gm-Features: AclHuK8iDQf3Hi4FgB3rVtlO2TSTt5l2todvm4T0h7_4dZ5xTXqg7HY4PS9Cbco
Message-ID: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 1, 2026 at 12:55=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> Doug Anderson <dianders@chromium.org> wrote:
> > I think that was in the the "after the cut" part, where I said:
> >
> > You can see the fdtfactor post at:
> >  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.or=
g
>
> OK, that covers where the tool comes from, and the question goes away
> once fdtfactor is imported. Text below the cut doesn't reach the git
> log, though, so a sentence or two in the commit message on why this is
> wanted would still help.

Sounds good. I'll plan this for v2.



> > The goal was to make sure that we could fully reconstruct
> > __local_fixups__ after applying the overlay to the base. v2 of the
> > fdtfactor series handled this more properly, and I'm planning to see
> > this through and land it unless there are major objections.
> >
> > By default here, I'm running fdtfactor with "-S" to strip the
> > __local_fixups__ out with the assumption that today people don't
> > really need them. However, someone could easily override that locally.
> >
> > I'm a little unclear how things would silently produce a bad overlay, t=
hough.
>
> Sorry, I should have been clearer. This is about overlays which kbuild
> applies at build time, not runtime ones like Beaglebone capes. An
> entry such as:
>
>     lemans-evk-camera-dtbs :=3D lemans-evk.dtb lemans-evk-camera.dtbo
>
> is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
> make_fit.py path then puts in the FIT like any other DTB. There are
> several hundred of these on arm64.
>
> My concern is the input to fdtfactor, not its output. In the in-tree
> libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
> __fixups__ to resolve its phandles, then overlay_merge() copies only
> the __overlay__ contents into the base. Only __symbols__ is merged, so
> the __local_fixups__ in lemans-evk-camera.dtb cover just the
> lemans-evk.dtb part. Cells from the .dtso such as:
>
>     avdd-supply =3D <&vreg_cam1_1p8>;
>     remote-endpoint =3D <&imx577_ep1>;
>
> end up as plain numbers, with nothing marking them as phandles. If
> fdtfactor needs to renumber them, or puts those nodes in a per-board
> overlay, it cannot tell they are phandles, so the overlay applies
> cleanly but the links are wrong. Stripping the fixups from the output
> with -S doesn't change that, since the information is already gone
> from the input.
>
> Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
> If so, composite DTBs would be fine once that is synced into
> scripts/dtc, and my concern goes away. If not, one option is for
> FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
> the original .dtb and .dtbo files in the FIT separately and the .dtbo
> keeps its own fixups. Leaving composite DTBs out would be a simpler
> fallback. What do you think?

I think your concern just goes away. ;-) The fdtfactor v2 series (and
soon to be sent v3 series) includes a bunch of patches to the overlay
code, and this code produces a fully valid __local_fixups__ in the
final dtb after an overlay is merged in (assuming the original dtb
already had a valid __local_fixups__).

The idea is that fdtfactor and the overlay fixes will all land in the
upstream dtc project. Then as part of this series we will bring both
in, so we should be all good.

-Doug
