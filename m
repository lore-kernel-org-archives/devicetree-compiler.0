Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197203;
	b=F48Tbks1x3OJAW5R+0ZvDEIE2PYWp7P0b7azbycSlopasw1NG47V8Wwqs6uj27ZYltx0
	 iSCtoAuLAX9CjBlT0ctT1M1BiByI+BBNfN49X5uBKWkITZWY1q5D6mEhLOO36Xgzsw5z2
	 WJXrxdaqXJIUCarO6Dz2gIcscsOEo/IYalInGJGPed3++HfKkVBAbN+msCjlEjrrEs42M
	 ahPF5l527LCJcXBTua5mU9rBXqetBuExmP3CJO/IpzasWBIl/MuQGsYpUKD8vqNMvwASP
	 zVSKvfV+zTPS3yZCeqbzELpVspqP4Fl5SPf80uKHQeOzFgZXwUY8/NUF2qnTlX+5oRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=iriUQT3AzRrdfB9ami6Z9V3Qer8kviuIexFHj/Nsehc=;
	b=GSEceMqi8/fzdrF0XMfl3rAlkJzn2fl4DTZJ/KyOZpm5ylRpfNKfUOITTbESQHZXZ/UW
	 TG2c6VlviiHe8ID16BxBqlkRFDRpFXVoTLhNUfdcxw51H1LoCuxs8cBfL4pXAmZ/JxFbI
	 4KiAnL/QJOAfd+NT7lu3kSENhBdux5NIdRTTGGOcagipkd+lfmC5XA9yBtt+EevO2+R03
	 bGTN+Q8G/Yx4QCeyrwDfhelSJ29Who6OgwoM7XeY/phDIyuC8mHw3M1DRJMlQuxN+bMpI
	 VIePTX6t6MS7baw+2va1jqJHIIU9dn2NbUnQLuS7ciUcFOOG6KWVWPiaFsfeD07QeYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Syy02Aq4;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF87606A331
	for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 17:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF87606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Syy02Aq4
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5123794038so208639966b.2
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 09:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795197202; x=1795802002; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iriUQT3AzRrdfB9ami6Z9V3Qer8kviuIexFHj/Nsehc=;
        b=Syy02Aq416ALN5d/s5fpLU/foiFhpxSE+PrabV2+9DTOsP884Vaaed9cBh2YwOTcfk
         OmKLOH26LUdKagHDUYulNHszwk+pDB3g95eDHtW569oA/x3IwG6XXdnwQDhj54rqR3Hc
         AC+zfD8XqJF7ZlBG351pKWJKEB6ZusIIOFz0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197202; x=1795802002;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iriUQT3AzRrdfB9ami6Z9V3Qer8kviuIexFHj/Nsehc=;
        b=CwvaUKybzQfQuUXapcVN7cwb6damsbv7YQn3/YFUJDd4jiy0I18M6t5HyMRKHAbDgd
         MCn4cHdvY/jKoEeqEumll0h1o/xKKDWFf7E7zvlskFbn1bLNKoqROnXfbL5QfMymETM3
         Jqhdeu88Mv5oh0xqJC35laqmMHyBFTBGXsoFKub8UNQ5i2353QeMq7vqXWU6XQXrneb+
         dvYASqEZS1pG2pVy/x0qs8vmxwjmjvkntlWeTwZiid7gWnW+8PD6nDEj1Bsp5uVE/NyV
         4YGzWaNTzwdEKMmvOGAQZE3JKAqct4WysG1HRzpdkmAI+5NUPcoiaVCSesmzm1P37G7C
         K3pg==
X-Gm-Message-State: APuU4Z+zIX5kpPmqtZWeTALDEG8zLafQwZnVwxMuaUsSaDYqxQ51JKGP
	px7YazOaNEdYtolUe/kDzDrC7Z8f83XENswIVGiA4oNnEvHC8LkPXdjI/0Z1MXzJmBq8/1bjY2v
	n9YWcXM2J
X-Gm-Gg: AZFdTZd4oIatyem4YnmicQr6HBqDsz9YxT8/xbmxGNzyrUvVoJOcq9yvONwtmKYCfO5
	dynz79cu9Jh3QFHHDPYHj9J5253Ymat8UnsprZXgiTNUOF3TwBoOfG4Rm4PnLjXt+IFkNpH8RRO
	vxqwUMd9aXxlaIU8msxmRMA7dTCc2VJ0TnGgu9EKeqbE247IbsClDVBwGUgRZLAaYPyxalTbrLZ
	i1cW35wmgE0zC+n/okx/K9eOOpcwAkop9yBe/V8I1xaZzgSPL8Bs2CandF8cl5ggAxI+ykw9sJK
	p3XaebpIEm04g/sCYlY2Zr4ZxfKIe8UixOIvUgdvHqmmPac3lrfdUtf/MkNQyu9al8rlooDpvK5
	7TwX82aFddGn0Y4k+vmxttfQIePcZc7bEBYR3ikVg6qtqmZYziUCOc+0J7X6Czy3YGy1nm6V9F9
	0eHyp5q/ShUWhf471OF6oyhCpOPfAOXuFSOWB+IZHO8IgOIk9eMLp3pq5PU1BGlP8ujAuLrE7i/
	wYZuRZVb8Wy7VfYfszBcdhmZkJHLynVO4pP6DSaBVAYhyCtb8v9xGq1bvtpvxGyN7oe4zdTOC/T
	zOc+QfL+G+xkWwtP6kXvmet8hgWIhnfASfwRXzSf8wkYL4zUbSuZEeJTqCL8IDz0aBVC
X-Received: by 2002:a17:906:bcfb:b0:c40:b59:1b with SMTP id a640c23a62f3a-c513aca41b9mr297374466b.44.1795197201721;
        Fri, 20 Nov 2026 09:53:21 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm123155766b.51.2026.11.20.09.53.20
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:53:20 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so11848275e9.0
        for <Devicetree-compiler@vger.kernel.org>; Fri, 20 Nov 2026 09:53:20 -0800 (PST)
X-Received: by 2002:a05:600c:530f:b0:4bb:680f:9a3 with SMTP id
 5b1f17b1804b1-4bb887e220emr85956855e9.2.1795197199813; Fri, 20 Nov 2026
 09:53:19 -0800 (PST)
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
 <20261116205320.1621386-15-dianders@chromium.org> <CAFLszTjEczj5OYCV4sXuAHieg4rWZk7F24V-uME9Jvv--=9x0A@mail.gmail.com>
In-Reply-To: <CAFLszTjEczj5OYCV4sXuAHieg4rWZk7F24V-uME9Jvv--=9x0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 09:53:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WC+2qPD2vgsDfm5fVjEH+=YT6pSDqMyQ8Z++XWb9n0ug@mail.gmail.com>
X-Gm-Features: Aa3M54p6je0a5w9XNpmTKTy7gXFNUMhYRhpYs55-PBkGHvfL4DfTkPTkx_OnFMM
Message-ID: <CAD=FV=WC+2qPD2vgsDfm5fVjEH+=YT6pSDqMyQ8Z++XWb9n0ug@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] fdtfactor: Parallelize blob compression and decompression
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Fri, Nov 20, 2026 at 7:29 AM Simon Glass <sjg@chromium.org> wrote:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -140,6 +141,32 @@ def compress_blob(raw_bytes, comp, filename=''):
> > +    if pool is not None:
> > +        return list(pool.map(lambda t: func(*t), tasks))
> > +    with concurrent.futures.ThreadPoolExecutor() as new_pool:
> > +        return list(new_pool.map(lambda t: func(*t), tasks))
>
> Is the shared pool worth it? Creating a ThreadPoolExecutor is cheap
> next to compressing even one blob, and factor_dtb_files() already
> relies on the pool being created here. If _map_blobs() always creates
> its own, the 'pool' argument can be dropped from
> _extract_fit_fdt_entries(), _strip_fit_unfactored_local_fixups() and
> _factor_fit_group(), and factor_fit() doesn't need to be re-indented.
> What do you think?

Makes sense. Creating a `ThreadPoolExecutor` inside `_map_blobs()` is
in the noise next to blob compression, and dropping `pool` keeps
`factor_fit()` and its helpers much cleaner. Done for v5.

> BTW the default is up to 32 workers, so with lz4 this can start up to
> 32 processes at once, regardless of any -j limit in the build that
> calls the tool. It would be worth a -j/--jobs option, perhaps as a
> follow-up.

Agreed, adding `-j`/`--jobs` (or jobserver integration) as a follow-up
sounds worthwhile.

> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1668,7 +1731,24 @@ def factor_dtb_files(args):
> > +    dtbs = [
> > +        ParsedDtb(
> > +            p,
> > +            comp=comp,
> > +            fdt=_open_fdt(raw, p),
> > +            uncompressed_size=len(raw),
> > +            compressed_size=len(fblob),
> > +        )
> > +        for p, fblob, raw in zip(input_dtb_paths, file_blobs, raw_blobs)
> > +    ]
>
> This was the last caller which relied on ParsedDtb reading and
> decompressing the file itself, so the 'if fdt is None' path in
> ParsedDtb.__init__() is now dead code. Please can you drop it, make
> 'fdt' a required argument and update the docstring?

Done for v5.

-Doug
