Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480688;
	b=bcT2gEiVey/erlCs3nb5DexCJTHk4HmHjnUVx7YVJvW1jpRLMnGzmTa543kQnnjrN9pl
	 qKYFdt0mXQKuhDoc3/zv4nggCZrMqlCWKpX+9Z/iQlubo2M5Ak4VJYFayw3o+4YeLdHO/
	 TYmYzok2Bb2gQwVfcz9Z+p3B1/kEDwqZe/8a0HMMOdVjLte8llSr9iVHslhbf5yICCdLC
	 HUTqgyxSBhY8eoUR+ARzFSHlWppDeLBgXo1+VQNDrNKs5IpfZpc8kw2EsF9vRcwndTCJZ
	 FlE2hv5e2+QcRyRvufxkUhBRRgIJ1IjlpIC3gVZ2ensnrXk50JXcUuS1OanTeAN24Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rr1csZ7oaM/i1Y8jv4N4Uoe336yHoqWQoxkbuSqpTlk=;
	b=GVW7ftn6uPXVxDG0DVVuZRmraeZI9MHGDaoXUObbXuO7e42v0AsMAv87UvdX0/CCwuC5
	 o413lWMwD3QfHPeoTGWq8pDdEptEMkbwmqEb3HcKlEwyOh4jrtQgUSUz/2C7vRkTIL5JY
	 7hlNLNfIMTtqKtTQSKhLcSHJhV9Qh5IfjlDy/WwGdMCxjQBNF3jP9BswuOQ5kIZmmATGW
	 H4g3lyHbWx4vc8ZA0lyxdQj9D/W0pXGQQ1uFGuW4Wk6WN5nrqSdocuPeN5V+Yw+jXRVSZ
	 I4XTBAx5JcbLl1YduBsWlR+H/dRgyeLOvNS4OAsaYA2XLLW/PfZTsylZ05InqpWKtQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y9dkko4s;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDAB606A321
	for <Devicetree-compiler@vger.kernel.org>; Tue, 24 Nov 2026 00:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEDAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y9dkko4s
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so30990055e9.3
        for <Devicetree-compiler@vger.kernel.org>; Mon, 23 Nov 2026 16:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795480686; x=1796085486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rr1csZ7oaM/i1Y8jv4N4Uoe336yHoqWQoxkbuSqpTlk=;
        b=Y9dkko4s9o4UwhwIlkojWLa10glXl2Zu9oT61abwt6s/fEKwiMoUCMILJurwqgOek5
         73jyCWA6bI2eMmSGnVVAnaemqD5Uj3n5Sz+YobddsPXTam2b6ZGswPblVFaJDNzUmzc+
         UoRithvF5NJILNEYRCEfKxzNFDkfVv/w4jRXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480686; x=1796085486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr1csZ7oaM/i1Y8jv4N4Uoe336yHoqWQoxkbuSqpTlk=;
        b=Gb2wgZxkW3LejA55CVfyRSS529zBuJnpOYBS7TQw0DLHMM5Y0XkHIbDx73WwuNkWKf
         zzAI6JDgjAP8+iK4fyUw+3v//nOaEW3Ew4aNNXYAA5Ew7i1Ol64rjk6WC75AONk28ty1
         tAsi3XRCs/lIazL7LnWXoP44bRIzIcp1JVv488DsJxUTMbcW10UjtJz0uhq4/ZlqhrxL
         qmdiNG59SnNghZa73fcQPhj+fDAsdEOrgCTyclDXmkw8POhOM4wDQyH8nKiGN5+XKXA9
         izxxAgbtOVf7+TXhL/15aTk3Uiurzsn+EaAeRVkIN2HVEIEpqNxHGEFZX6LFzIJ5QO5E
         49+g==
X-Forwarded-Encrypted: i=1; AL+hErGLBwkDwYBmrJYVawBJRfjUK2s0nWqxYUZ5LIlsPpUBucwn/x8JmnFhfgQZ/10yDotVjJvb5c7iGazmK7yVpotvk9dG@vger.kernel.org
X-Gm-Message-State: APuU4Z8DbqrXd9idRTBVBegxPRSLXuafIcry5M4OTP47dnFKwUToxMtc
	rmcbhXHdoWgVPgS2xNzEXuIfxfYQ5L5QrPD//SOxmGPkNjd4ii0MjIllZLDPlREhC58eHLE/N+p
	p6U+mTv+9
X-Gm-Gg: AZFdTZcUiHqnYcXHTorux4xtDxzTOzowFZzSzkeuScgJnY2ac6yL5Uvsur/yS+Jkghj
	K9+BoSw4FBt29LLangX8+rbm1hx6sbeIa+oImE4dmtqard5CXyr6KJCWKRBX24lpqxLJfFNaIHg
	O44jeTrDAx9wYoPQlSHyHRj25iCZTspTytn1iF/SmHRe9S/9NA3BVYwq8zEPf1l/S+61WGI/Zkl
	ekd/Ge/uyv/Y8t8Y6vHD8I+ZlL1zGffnGueEEyF2+6Bk6AerBx1/F0btetZjWOFk/88SXoeL86O
	X0m3r/U3Wr4+YeTrRiJV1cm6Oa8v8XJ3zAzYGD+1heRY44SVEySBd9G+1Kw/QalHwzpdFkoWyLK
	U+2wy9CmfC+YvoR2b2qe11p87sia/NPRhnDM0sXgfb3WcqhN3epQHL1hyHrPFqUn5lFy9WTYlle
	9LJF6CtWkp3hjbEg1xQcs8ayhxxFonvMkbxEntf2ISYFFEi3v5wwiziYenHnY9QTcEs3tzcLsDY
	NQl68OTbmRk5cHp+120QfMVmnhQ5SzW5c2PsRuSorioYtQAxcSz3+cRHne/CGQMTxiS0dTDLQDr
	vdJ5XkycAm9eZG1ssKQCjY4a24wo2QgAGSupVNaHms+WkZeTxkaieD5U948eV3iizW4z
X-Received: by 2002:a05:600c:1d04:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb88817e4emr275728055e9.18.1795480686405;
        Mon, 23 Nov 2026 16:38:06 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm394449715e9.1.2026.11.23.16.38.04
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:38:05 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2041023f8f.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 23 Nov 2026 16:38:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHIu7feWoBp5y88FgGBSHf71mxyl26FOCv/296m4SjWd+INM6Mtv2AH9ItqBCbSvUU3Mf675B9f3zoyfzl3WlLnzf0f@vger.kernel.org
X-Received: by 2002:a5d:5887:0:b0:4ac:84c:70df with SMTP id
 ffacd0b85a97d-4ac085bb48dmr24443427f8f.45.1795480683352; Mon, 23 Nov 2026
 16:38:03 -0800 (PST)
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
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
 <av6J47fOAYxejSgr@gractus.seuss> <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
 <awTZn8m02pE-wz29@gractus.seuss>
In-Reply-To: <awTZn8m02pE-wz29@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 16:37:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=URVKrCKFte_2ratzViiEshYMO-9ZxiuMFbyqW9=apYLQ@mail.gmail.com>
X-Gm-Features: Aa3M54o-Sw7CoGQi9w7uLhHvV-4sdG4fKsa0NEwuzeGRk65fdVb-36i953nWGi0
Message-ID: <CAD=FV=URVKrCKFte_2ratzViiEshYMO-9ZxiuMFbyqW9=apYLQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: David Laight <david.laight.linux@gmail.com>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

David,

On Mon, Nov 23, 2026 at 4:27=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > > Fwiw, since this further optimization is essentially free in terms of
> > > code complexity, I'm certainly happy to apply it.  I am absolutely no=
t
> > > keen on further micro-optimization of this.
> >
> > OK, fair. Do you want me to drop the 1-line patch from my v5 draft
> > then? It's basically this:
> >
> > -               if (memcmp(p, s, slen) =3D=3D 0 && p[slen] =3D=3D '\0')
> > +               if (p[slen] =3D=3D '\0' && memcmp(p, s, slen) =3D=3D 0)
> >
> > While it is a micro-optimization, the code is no harder to read so it
> > feels like a nice free speedup. ...but fine to drop it, too. ;-)
>
> Sorry, I was a bit unclear.  Keep that change (though fold rather than
> a separate patch, I'd suggest). As you say it doesn't hurt readability
> at all.

I don't think I can "fold" because you (the correct "you" this time!)
already applied the patch I'd fold it into. I think it has to be a
separate patch at this point, doesn't it?

-Doug
