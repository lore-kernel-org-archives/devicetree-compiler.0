Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019387;
	b=fKAGYU6IqqIpXSKygBc4ZTOgPeIarGhccHkFuTbA90GPD5bbNWBlyMXmJsOwiBNfUPe6
	 Qssq9XzUh5IOTRkPWvEo8MvQah7I28QGvNA7H5dINim/Wykct2UqoHgx3ZxGuhi74c066
	 thEX96Sn8bq1tgjLMcDves9E46lIgH38jfnCZzQ6vrf4Ja/Nevu0oldtujCkYz3UCVyFq
	 Ozaz3rbdMNYPfzsodn3zdJkt8dS8DCr+S4CaOqaddOYH3089CikTLRsYIVg/D42EXtuqr
	 CfjRhYGHqYYFyMHbougTnkaD2wLvoMYWNjiaNMrJ7MErqUqO+xwHy9f8fOlLlPeaHig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=gewfMieA7fLunZhvt5Jdbx8EJ/xqncWIkmBoRuqvLUU=;
	b=j3myqW9igUAIlSUk9jpTktXrTW5wa1NKzWmavwQbKr9MENTdY3YHByzcUNaAUxCRnsHU
	 jfaNdqKbNdDjtDhzQUyX5VN14MccAZ3U+oZRNbRQ+OisyPBKa+/KAkf+s7Q2VptPtTyVQ
	 4cpo6j6FK93ZCdkCT3aVhlyiBwpPT8bBEHiGTfqQS13jCZgUAwbRByJkDrG+lvQO560YY
	 lkgdgvQPazu0jjDScFUuKRpu+gb3wsJBINP9pqIArP9mNGDllRXKTq1YEBgXixMk8UR0j
	 saB7Iq896HmdT6bqV+H3UJtpXisSt/cp5AUx2NUJ+FWeeiDsZOIJhAhAkWQEgeFJYkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ofn8u7VT;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46619606A32E
	for <Devicetree-compiler@vger.kernel.org>; Sat,  7 Nov 2026 02:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46619606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ofn8u7VT
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso183540666b.2
        for <Devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 18:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794019385; x=1794624185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gewfMieA7fLunZhvt5Jdbx8EJ/xqncWIkmBoRuqvLUU=;
        b=Ofn8u7VTPmbHApZr5I532d4huM/8UL3MLBccGMRtRxUToJ3XjtuNH916KGqshCX6e4
         xwi7xHxV0dzUHyRhf+5tVIMu/g6PfBMJsh1PnIoIYmHceB+oGjw5eE4j8oLpgjEXXc79
         kHkHGxqTXVKGJJqIc7jPDLhBcdN4oMpLzOt/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019385; x=1794624185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gewfMieA7fLunZhvt5Jdbx8EJ/xqncWIkmBoRuqvLUU=;
        b=alczijkhKwP5VFewB7adSLtzkyW68MaSbQLsbZLSpQ3ReiK6aILI1UWax6Ce8bjcFV
         4Y98rftZqAlxJt8zXFAv9MkW6hPt/LGBvOZhOVRL3eEAy41qbOyp6U/LC07B8mGvI1l9
         /U2exKj8+raQFs8tytwfYKkBs5E13mZE48IA32SfHmENomxHeuDIvOgA8HaAGS4TaMA2
         YR+j/PwfgAMotYYkM9+K+rT16tiuo3SqMm7G27DVmp3gkywUiGQp5EjPhqh5qx8U8brb
         4wom7fY+mporxDpVOtg6upfSmciwt2uxy+WNcCYs/8Kkj8UxYJCnL5SR3ufiOEmGL0G2
         LTDA==
X-Gm-Message-State: APuU4Z+RNxZ3ZAMHHue+PvZBhkSthuvH5KlfKfKdihMoiO40CJDG7nYw
	621YXdMAxtAsaxtjewg/4uHR3x9JpBYSDW4uaLokPRyF8fCyKcDozWa3ODwZ2ag0CI99+cyxAPN
	e2VRgaxHu
X-Gm-Gg: AYBFou0r5OsekF65pCtclRlehcaNAp2vvvTrJ9ahCBMZoDZJ3MaUM2sCcRqeX2uHyML
	5R+T/gUrDnn2y4FhNKBALmQRAVGJawHYnDsJjqGd0PhhfVTJTUYBMxD3BPqPf2NYCkKTUkpb1Td
	MvFa+5ulJenZ+dXkj/SlmCYWWZukzpzEHWQ5Uo57UXYP1H0zMTSQ7xZfufdV6Yma44hKEVJLJ+O
	4T0uB3nVDwr7y+5oHiCAS7/jt4wGfXx4YxidxKvUtlIJv47IFyAkWMRQGXsw4YPgx1XIv8OjH3B
	r1YgCr9hVzj8VlFVMbtxQ0Ab5j8BUJtBcxeNbUuTZJssHgtssXWdKdfz50v/+NxZOD3dBmQeXVM
	lcHR2JtxS2+bmkYXUEoJpBYr9C+WIsVZWyxc0DnrlrGQ63L8OJ0GZ87WHcup7RJVdBk5sKme1uR
	GxSV5Q9F0hNKaFN+Q24q6GP11I2kwxsNBANiGQakYTYBlw5tjSiegEk6ZUblPnjH30T3L4XI0Tu
	zqmc5k3ZdQ9NwaxJS0Imj4PrbQ/gfkT+wVrvqGC5Wdn4f9zHaQ4+IbWEl1v+TROALjqv/Lz2S7M
	AsV1LxkkI91p225SDIIoHLkndzRL8MNwqE64HjxrzGmTZ6QmxPDzapy7kOGIxDEmzH4=
X-Received: by 2002:a17:907:990c:b0:c49:df95:fd0 with SMTP id a640c23a62f3a-c4d356494a4mr225863366b.48.1794019385516;
        Fri, 06 Nov 2026 18:43:05 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e58c7sm120488066b.78.2026.11.06.18.43.02
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 18:43:03 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8677845e9.2
        for <Devicetree-compiler@vger.kernel.org>; Fri, 06 Nov 2026 18:43:02 -0800 (PST)
X-Received: by 2002:a05:600c:8b28:b0:4a1:a2c0:7b73 with SMTP id
 5b1f17b1804b1-4b6dfba8628mr66208895e9.30.1794019381760; Fri, 06 Nov 2026
 18:43:01 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org> <CAFLszThgCnOx=M0655rjro0wShSm9oix+PKP=pM4fhmrLYUObg@mail.gmail.com>
In-Reply-To: <CAFLszThgCnOx=M0655rjro0wShSm9oix+PKP=pM4fhmrLYUObg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 18:42:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vw4HA9e4222Lz9zqqTAj=qtM6hxm9V92kYSKLrORQekw@mail.gmail.com>
X-Gm-Features: AclHuK-C8ZGba_taYSlSltFRRFmvJecYKz0U6LcbuvJ6muIhoF5x8g5ctxikpQA
Message-ID: <CAD=FV=Vw4HA9e4222Lz9zqqTAj=qtM6hxm9V92kYSKLrORQekw@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Wed, Nov 4, 2026 at 7:14=E2=80=AFAM Simon Glass <sjg@chromium.org> wrote=
:
>
> Hi Doug,
>
> On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
>
> > Before introducing `fdtfactor` itself, the series starts with a few
> > preparatory patches: adding a `DeviceTree` live-tree abstraction in
> > `devicetree.py`, and teaching `libfdt`'s `fdt_overlay_apply()` to updat=
e
> > `/__local_fixups__` on the base tree so overlays can be applied in
> > multiple stages.
>
> Just to check, is this still the motivation? Stacked overlays work
> without it, since fdt_overlay_apply() does not read the base tree's
> /__local_fixups__ when resolving an overlay, and the stacked_overlay
> tests pass in a -Doverlay-local-fixups=3D0 build. The commit message
> gives a different reason (keeping phandle metadata in merged trees).

That phrasing in the cover letter was a leftover from earlier versions.
I've updated the cover letter in my draft v4 so it matches the commit
message motivation:

    Before introducing `fdtfactor` itself, the series starts with a few
    preparatory patches: adding a `DeviceTree` live-tree abstraction in
    `pylibfdt/devicetree.py` (with supporting `Property` and `FdtSw`
    enhancements), and teaching `libfdt`'s `fdt_overlay_apply()` to update
    `/__local_fixups__` on the base tree so merged trees retain complete an=
d
    accurate phandle location metadata (for runtime consumers, composite
    `.dtb`s built by `fdtoverlay` that are later fed into `fdtfactor`, and
    round-trip verification against `dtc -L`).


-Doug
