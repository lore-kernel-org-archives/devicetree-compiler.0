Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460837;
	b=ZJECIyoaKvZwFC/x7sBoFZMZGP8vkFOfjckfTAksxjVtN+Z8tk5FO79ap+R2BiBFDmrv
	 X5pL2IUDMvL8Rmyoo/5rB/ESaMbXQp7PGGDfJycoKHfaUHkkqhK+V5tO8QCq+ONnBf5lO
	 snGW5Hx+fSedO6hoz0jg7yVzn/AnC4h6qOcAcGxgo6hT7HiK3/uCP6BkId6b4DHLE/7fQ
	 JPh5v1FCs6RgKLbZoOXd4GbCmOz+tpqV4PS+guBvyqvcVeyGURkGi4Voug1yyrpcJoi2N
	 zIypqj9K/vKazk16v0ajpwIirYOLKulukf28wNC5R/ofVP9rzo3xmUCQnV+f77NDYYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xIfLP4TvL3JwjjTh8/f5cPWGdzjswtvoPPK4nfCYMWc=;
	b=QcHLH8ZohyYvPwSbDo8j7KTVaUWPsRjzBdSSaEVkXgiqax/SynPICyIRQzj2U3sd85GJ
	 gUFO6E/MeTO1KV4db+lDoFitJvctsytR1uwDWJj6/UHZ/zHDqCXrsq43L8v2Y2fy0ixa5
	 4GFry9lhrJYQOyIQRMrgktsSmVn1C2Dsq3gAVpKjIYj9Zcm1iasDe7+JNu78f8RjV9qTA
	 cYFRxV5Y6Ia59v6x7NBOLZEN3ox7n7VON7CtKxEFx3etlYk1ayA+lJyRoFTeDVna9i3GN
	 tifsSr60ughvAuV7CPtEEtTGRhDNFj0H3UlT8EGUtLRwFbc2kcwM70ynCuV4ZWhXWhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=blgKdCgT;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E6606A31E
	for <Devicetree-compiler@vger.kernel.org>; Mon, 23 Nov 2026 19:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D86E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=blgKdCgT
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so4855001a12.3
        for <Devicetree-compiler@vger.kernel.org>; Mon, 23 Nov 2026 11:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795460835; x=1796065635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xIfLP4TvL3JwjjTh8/f5cPWGdzjswtvoPPK4nfCYMWc=;
        b=blgKdCgTqZX1UsbCbzujePf5pMpi2P0VatQxPDqPl7/0CDXG7uMt+llYTz2+y83Nl5
         5aXcmS4Ra8T0tS3GMgRDqqjDBrZt+rCrSwZl+3QUEqXBOcdMlUkj6BoStO12sGyqx4TX
         nK/XPfkinY3N9+/RBVTPWrVk50WdKSCDyHlXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460835; x=1796065635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIfLP4TvL3JwjjTh8/f5cPWGdzjswtvoPPK4nfCYMWc=;
        b=LHYbHlq7bj1LPKUNfNthoNav6OD1EVsBevpyHAIbC5xEmuFADAt62zjJJZxmq4ynby
         vkP8rG7hFg+q8RpymfCN231npHfyyahfbSyzizx7wt7g0QQf/KqKg+oYKrasxZxBiapj
         l31Kpk0eu66s0X0Hp+aBXgHjVePxMpuEexsswsBAhipODQ6druMEg/JEk91VXO2Af4Xt
         o6WI0GzfjMzUrrJCNszMmzGFTpI9IJCyu3OCAuEPl/u9mTI+2KJqbxzlHtNjXIfSiuUO
         4RV1eXwUAASdzcZziXSOwuQynN3ou+jsf4bNrA+QgpTCIhmgdMCbrknj5s/GvyZkXOoC
         Evcw==
X-Forwarded-Encrypted: i=1; AL+hErH+lMHh/VfrusQn6xUCCSzBdMSbI3daEN3vXJHW4ktQ5vqw9D6mX1HNYslX+npde/TbpFSeu0shi1bHTnZgcpLG5HUX@vger.kernel.org
X-Gm-Message-State: APuU4Z/gelRv5hKjhTfACRpjGHnNmIIPX/Ne8zE1CN9rWDAw+atWM7vg
	Yb349dDmakp18WwFmoGKc1sc3unE8D7Xc2MCOctu3fbOuZhzK6ut41tw2W0ScjRC9vBy2yAkkgQ
	vAY1rAdGn
X-Gm-Gg: AZFdTZeHKbnUYxAAyPCzDjbxEm8IPZ+UAAmOi5ZWeZsBDgJqhMZHne/kw3XlyQAiLWi
	D8XZOGSx7auiUnrR4E7QD1pW2Bg7XZmU9h6IpeQVT4Z6L3Dk9xjheGYVknrUDjj9XTgWmwBF/bi
	rDJIFlD3yUDrO767P0i1CwcNLS68DDNV1xhrLFR6pqOHLvPlyW63BeqHNL4hueExHKrgg+lkp8U
	nmZ4+MfvYhMO+H119pUPCNU9qRu8LtZFF8OaOzayp9K+yQ6h4z3lGxh2a8XL02NMANYtbyS9Vtz
	pl24p5cRL4ov+v4eJp2RPEdHYchADbB7TXFuwX72vFkN63KCk9edTaMUKzFNnDU6kCtPSm47I2x
	HnS+MDWVUausEDN8giAmCATlyHDl0+l1hG9Of9MnuT4DNwaLINfcN8M8ciWMmE5CXPNYfuKpS0p
	3Nhejkiptw2hYsxyFhBB8UpjSA2HvZlQFQ8lrBJrvbGvxv8oFaHsVwU6I//pUw8JYn9wF7cRC1k
	PH3VY3heb4EOZ7rzy8YCyu8L4un2n7gO++R/c3EjqtZPC/a/4KpaTmr0Z+Tork1vyFEE9esikDq
	OXV/iOaZTBb+NQVhLcAZo/rXEdVsfBL855wDxs+024OIPu3chSN65vIkBihxsJFP4wk1Ww==
X-Received: by 2002:aa7:d94b:0:b0:6b7:df0c:18bc with SMTP id 4fb4d7f45d1cf-6ba37d3b56bmr6596630a12.17.1795460835237;
        Mon, 23 Nov 2026 11:07:15 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm5847169a12.5.2026.11.23.11.07.14
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:07:14 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso2427125f8f.2
        for <Devicetree-compiler@vger.kernel.org>; Mon, 23 Nov 2026 11:07:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzwcd3PNOhYYUGhZmvY79mz1wPnVMaGNVuVkWp3dyX3zmYwgjRJ//tzIzoT8J1+lZ+SLgOwIl1GWvETQMkglFR1YY3@vger.kernel.org
X-Received: by 2002:a5d:5847:0:b0:49d:1ce3:1849 with SMTP id
 ffacd0b85a97d-4abb47b2449mr22428102f8f.21.1795460833131; Mon, 23 Nov 2026
 11:07:13 -0800 (PST)
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
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com> <av6J47fOAYxejSgr@gractus.seuss>
In-Reply-To: <av6J47fOAYxejSgr@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 11:07:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
X-Gm-Features: Aa3M54rVuIOpXpREPYHEaLP2UUxHM1aMZ8x1gcb9luvKIP99K21qY4Li68E5VW0
Message-ID: <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
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

Hi,

On Wed, Nov 18, 2026 at 9:38=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > Agreed. Since `p <=3D last` (`strtab + tabsize - (slen + 1)`), `p[slen]=
`
> > is always in bounds, and checking `!p[slen]` (i.e. `p[slen] =3D=3D '\0'=
`)
> > before `memcmp(p, s, slen) =3D=3D 0` cuts the `memcmp()` call count acr=
oss
> > that 855-string replay from 187k down to 14.3k (the exact same 14.3k
> > `memcmp()` calls you'd get from scanning for `'\0'` with a `*p =3D=3D *=
s`
> > pre-check, just with half as many `memchr()` stops).
> >
> > Timing 200 replays of that 855-string (11,259-byte) Qualcomm
> > `dt_strings` block with `gcc 15.2 -O2` on x86_64:
> > * Original (per-byte `memcmp`): 3.45 s
> > * Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
> > * Scan for `'\0'`, `*p =3D=3D *s` then `memcmp`: 0.36 s
> > * Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
> >   0.27 s
> > * Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)
> >
> > Since you already applied this patch to `main` (`c954f9dd8357`), so
> > I'll include a 1-line follow-up patch swapping the check order (with
> > `Suggested-by:` you) in v5.
>
> Uh.. "you" seems to be referring to two different people here.  I
> applied the patch, David Laight suggested the optimization.

Whoops, that's embarassing. I definitely glazed over the last names.
Who could have expected two people named David?!? I will read more
carefully.


> Fwiw, since this further optimization is essentially free in terms of
> code complexity, I'm certainly happy to apply it.  I am absolutely not
> keen on further micro-optimization of this.

OK, fair. Do you want me to drop the 1-line patch from my v5 draft
then? It's basically this:

-               if (memcmp(p, s, slen) =3D=3D 0 && p[slen] =3D=3D '\0')
+               if (p[slen] =3D=3D '\0' && memcmp(p, s, slen) =3D=3D 0)

While it is a micro-optimization, the code is no harder to read so it
feels like a nice free speedup. ...but fine to drop it, too. ;-)

-Doug
