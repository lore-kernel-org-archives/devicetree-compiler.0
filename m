Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224688;
	b=tUct+uOedeevsws09swO958+qC3TqNJZVqbhX32Pxh4UAi8Y1aiFmvo3tHVM2sqk6cGJ
	 9Wtgw3bTSlNcu6UQoeMMq7LUXxVQSgHuupfo/xDDXAykYbGhQkxPjqbgKe3x+3EmWn0J6
	 2y3X/Q5Okh7imhrCfRmGvTxF+BVHYdTHFu0znwBOA/tOfxvJPq5lFvZk0SCX283mo5cqY
	 HXByX7uiVJccxGxpxvY9rP6m0/RMxSwNpWKL07KE9JL+MfgQCH31Sk0Ik40OBz2/GSHjC
	 ID8a7nyIAACB7KPyGa6cqSLKeJh7qDyaAGdkQKHJ+td5+YKApgKGAz5s5mrsn+opc/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5KUup1S6jfXthQOLcmrn062DCX5s5HStbBOjiPo2qx8=;
	b=BKNPzIZca5fow7HI8F46NXIKcBoicPIFOUC2T6j7i5IHAW5T4y71Rgh9qjoQnUAcqQdZ
	 REw6J/LRIuorTkl5Suya4Tt3s8jKANkeE9nLbXumqdkZe4s+d/NIU+h1y3+StOi1lhrIw
	 CiwkfgFLMA3mDtUzsAR7Rf9yCXgtE8BIwzQnHWatjd3YEDVoNgnol9xdBpy031Iv/seux
	 WyiSjkSsQYyWXgBCmGEeT5Mu0DDZ7P40ZncGXnovNwN+xKgZc+o2ltFGz0vXq7lJc7Ubl
	 EdstVgAfGdQt6Z1UR19h6FyxHmnj2C6m3X4ZnMQAHAQOziajaNhoblwap24MONYJDKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eCNLRTbZ;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7C606A324
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA7C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eCNLRTbZ
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso226814966b.3
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224686; x=1793829486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KUup1S6jfXthQOLcmrn062DCX5s5HStbBOjiPo2qx8=;
        b=eCNLRTbZil5w3Uhe5puWr5VAcexNSEXs4jXOlgU3qyf62YNlXFtKuiK3wWQkdZDkzZ
         TqpuprVDdKDcRa/1PSG0toXVXRjIMOJMGUg04R9plJ/m667thibbIFlOlcsm9UDw9QOw
         7BpGS/K/QuQ2d9ga+c2Wn2dO1T27en2u0S5nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224686; x=1793829486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KUup1S6jfXthQOLcmrn062DCX5s5HStbBOjiPo2qx8=;
        b=p1eT3fqj+aJc+oOLreROBJShAzFjF/PYpl/1vtji14T+T8Zx1vMTViJ+MqUu4UnGJf
         A8UCBquerFJzTgEjB1cfvqIXCMXarZf2SnRLx2cyx6x2B0gC8Dqjq1/h7hJrey/SWf2p
         V3sfVdmNFBvx8sLOCbMaFOUOEWZTQHDJvFwbIwl37Z46a7YxXE43mtW0HvuALiGl8X0M
         TCMCUBngdT6Ol7UOjnz/r99jNdWZgmeaCxK2VSuAOBS6Jx0H2ZHiO2vvLcjHQgPngbiL
         wOtfSllCR3SLU4Tgie6Xrwkra2n1fyCYcw/wAMUXPMe1L4hfkoqNm5AnYsT+1miWTro/
         C/QA==
X-Gm-Message-State: AFq9FYKVrKrAG+DNH78WH1ATisJb4S+puzvq5wRcc4SGWyxRqlim5oc8
	ChJVssTCIHF07z+DszjLDHD37ZqzjhAeE+ah4sw6TNo7SkymArX6iLeSyzAjURcUl37TsYw/HGi
	wA08BjcdA
X-Gm-Gg: AYBFou3BbwP4du6dt7BA+6l9Mnk3V4lNnKOs78srDJPEH/604vR6wB2tku8XYhLgvm7
	tZYH1LCG2iP3fUysJCWBNwiyPoxafx0jF2KB5UXQHu8GWE2q16PYtJ8b5Ah2YC1/5KrkW9sx7RG
	GJGFpxVAv8ci/tq1kctiyuFFw9I5KZNimLyr1iFkfVocA3KOe7KintSQ0OxvtWAuBduH6QuUat4
	T4HHG4bzRWPHxbcxnozYvgSd6U2uI7GdmMRfxPoRjiCFFVhrOADfdco9AA7/eSXIxghuo1yXzlk
	LJUTyru5QXYkjt+ZD9a5QKwXDWPvXLKPfnJd16nNUQQ8gA5r1I+dfTUfwFfuVM2oRUkULR8o4ub
	om9EROSNEiwIgkPZbgLnXYSFr+LxF00rqmwJD+cMFIpD7XjAm/rRCJdpoOB5/KLAwlUfaUEuEMt
	KGKwQBcmve+RQ5boLXC9JkstMqMfS+JxxafwwBAHXkOJg9G8pDfK6MsVbZUG10v0+Q5Qce1UkcL
	4kvCihcEQoojPhS2/Q3bpC2IvZEwvyMPrtevz+fS6MAA9F7G9MQI8weSmLTEcAt+REZwa+fAAjA
	f5GNaqh6oZFmXyrNcsohC1Y9iDYE/Z2vMm8pGccsdJAHhWUJ6BfGU33pV+M1eTAT6PxL
X-Received: by 2002:a17:906:eeca:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c49bdb640fdmr278073066b.2.1793224686281;
        Wed, 28 Oct 2026 14:58:06 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm652884366b.87.2026.10.28.14.58.04
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:58:05 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d870d54so980598f8f.2
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:58:04 -0700 (PDT)
X-Received: by 2002:a05:6000:4912:b0:48e:c0:9441 with SMTP id
 ffacd0b85a97d-48e5d5988bemr9046706f8f.29.1793224683163; Wed, 28 Oct 2026
 14:58:03 -0700 (PDT)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-4-dianders@chromium.org> <CAFLszTi-j8HmVy8u3gtH-6YCigakX5CNeqZ9sVc5ksn7q3NxaQ@mail.gmail.com>
In-Reply-To: <CAFLszTi-j8HmVy8u3gtH-6YCigakX5CNeqZ9sVc5ksn7q3NxaQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vroh_fcqxaOi2s8mBS7Ki2fQ79iagnLkTK_FxUFk1bWQ@mail.gmail.com>
X-Gm-Features: AclHuK9avb8muZ-xZs_aIYuQFeaeI3fXfNjJMJPbBXHmJks29iEzgyPnCpdYzXk
Message-ID: <CAD=FV=Vroh_fcqxaOi2s8mBS7Ki2fQ79iagnLkTK_FxUFk1bWQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] fdtfactor: Support compressed DTB inputs and outputs
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
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -11,31 +11,195 @@ original device tree.
> > +LZ4_MAGIC =3D b'\x04\x22\x4d\x18'
> > +LZ4_LEGACY_MAGIC =3D b'\x02\x21\x4c\x18'
>
> Legacy lz4 input is detected here, but compress_blob() always runs
> 'lz4 -12 -z', which writes the frame format. So a legacy-format
> board.dtb.lz4 comes out as a frame-format board.dtbo.lz4. I checked:
> 'lz4 -l -9' output starts with 02 21 4c 18, while the compress_blob()
> command gives 04 22 4d 18. The kernel's cmd_lz4 uses 'lz4 -l', and
> lib/decompress_unlz4.c only accepts the legacy format. So a consumer
> that handles only one of the two formats cannot read the result. This
> doesn't match 'Preserve the input compression format' in the commit
> message. Please can you track legacy as its own compression type (and
> pass -l when compressing), or else reject legacy input?

Done.


> > +def decompress_blob(raw_bytes, filename=3D'', comp=3DNone):
> ...
> > +    if comp =3D=3D 'lz4':
> > +        try:
> > +            res =3D subprocess.run(
> > +                ['lz4', '-d', '-q', '-c'],
> > +                input=3Draw_bytes,
> > +                capture_output=3DTrue,
> > +                check=3DFalse,
> > +            )
> > +        except FileNotFoundError as exc:
> > +            raise RuntimeError(
> > +                'lz4 command not found; install lz4 to process .lz4 fi=
les'
> > +            ) from exc
>
> compress_blob() repeats this block almost exactly, so it should be in
> a helper. If the helper takes the filename, compression errors can
> also say which file failed.

Done.
