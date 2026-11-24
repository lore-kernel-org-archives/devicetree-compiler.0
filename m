Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480035;
	b=DC0OsnoBrBECHwS+YiW/K8LD2QrfPQLnR+tCa8lykZfGtyqgXFAjWmZe4e8YUzCpe+o3
	 1gujesiWH+VG0Le1MgappTvwfXw5lLfP9W36cwMiZeZ9gyCSp5l2eIPV8ZYKWristlmKy
	 D2CUaJAX2PhDffT8+2+bnN/C9pjx/yw8PHUe73Gt7G5+KJlVCh2ye/sI6MO/ohSHWlHsB
	 bjxovfeY5yIGDEEQ6k7X5qcu3pQD1uO50StbLiudTbP/O2CXUCojf/CFxLzPUHSsO1eOS
	 luPcJJeMiVYnLQqjGHDbvhEkHLEQLFZr33K7E8mC7T+XuJuTO5q/YnL/Ja9ckzZj1Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480035;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=b6CKjyZPoM9qVNbB6rxVVzdmrKd0dd2PiKskAovILdk=;
	b=Vbem5xP6C54TJ5GY5NWym8efNw7OsxCN9yeRTZeQSpLavJKiRhONnoEeUMmEp98VpjfY
	 spj0/h3ZlINf9mNSP296icTE0w7/u60tWGmRD1F4ukzGyCKDNBKkULa5f4o+e9wFrt9He
	 mL+BxgqCoLb3vgOzl1UE69qst6evA9JhjqrXALDSZXwEAvT1Nmb+NDWwtFQoMbJ3oTWQZ
	 Uzjx37FG7bVPf9IrmR65b+y62T2hT3JfUAv8RDSa2L4vNckCb+rdU658qEO6jr0SdezLP
	 Xb2VvOwp/nGSLWQCGmMTRNhGbaeraqPX4PDHiO/RLjQx4YTPoL8e645V7jY4ZZqJ96g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=s5LP3o0Y;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B9606A321;
	Tue, 24 Nov 2026 00:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=s5LP3o0Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795480031;
	bh=b6CKjyZPoM9qVNbB6rxVVzdmrKd0dd2PiKskAovILdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5LP3o0Y6s2iEKZEVCeDf7YcbQREjVBflRwjUezbYUNEvT2edFZiLiZqS3xoUxQsa
	 XHCOwijA3c05tRGobRkmzA0GVhG9d5NNI/BgFJCtHpEAuKeDboZsJKj1I6j071XXo0
	 GalBmWZhQW+Cr7KaYeBzCvjKff8nx3f13jg2atR+DbfRLEkZaMwOc+z8N2mGfumJLu
	 djY5BIwhLPgUmAFTvtWWGUpl57b2CgHMVIiaYSwJSgrn+XXjyPsqOxe/gjmeCSn8BE
	 Du/aQmPLynM+gztupIi5FriU4Kh+f6MfZv8bVvJ3AQcQ1nnDn1sdOuZRNf13fueM1z
	 0HV3pNZQFP/Ow==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jYNt703Stz4w0H; Tue, 24 Nov 2026 11:27:11 +1100 (AEDT)
Date: Tue, 24 Nov 2026 11:26:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Doug Anderson <dianders@chromium.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <awTZn8m02pE-wz29@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org>
 <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
 <av6J47fOAYxejSgr@gractus.seuss>
 <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OnpJBJjO2T8ol3FP"
Content-Disposition: inline
In-Reply-To: <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>

--OnpJBJjO2T8ol3FP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 11:07:01AM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Wed, Nov 18, 2026 at 9:38=E2=80=AFPM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > > Agreed. Since `p <=3D last` (`strtab + tabsize - (slen + 1)`), `p[sle=
n]`
> > > is always in bounds, and checking `!p[slen]` (i.e. `p[slen] =3D=3D '\=
0'`)
> > > before `memcmp(p, s, slen) =3D=3D 0` cuts the `memcmp()` call count a=
cross
> > > that 855-string replay from 187k down to 14.3k (the exact same 14.3k
> > > `memcmp()` calls you'd get from scanning for `'\0'` with a `*p =3D=3D=
 *s`
> > > pre-check, just with half as many `memchr()` stops).
> > >
> > > Timing 200 replays of that 855-string (11,259-byte) Qualcomm
> > > `dt_strings` block with `gcc 15.2 -O2` on x86_64:
> > > * Original (per-byte `memcmp`): 3.45 s
> > > * Scan for `'\0'`, `memcmp(nul - slen, s, slen)`: 0.45 s
> > > * Scan for `'\0'`, `*p =3D=3D *s` then `memcmp`: 0.36 s
> > > * Scan for `s[0]`, `memcmp` then `!p[slen]` (merged `c954f9dd8357`):
> > >   0.27 s
> > > * Scan for `s[0]`, `!p[slen]` then `memcmp`: 0.21 s (~20% faster)
> > >
> > > Since you already applied this patch to `main` (`c954f9dd8357`), so
> > > I'll include a 1-line follow-up patch swapping the check order (with
> > > `Suggested-by:` you) in v5.
> >
> > Uh.. "you" seems to be referring to two different people here.  I
> > applied the patch, David Laight suggested the optimization.
>=20
> Whoops, that's embarassing. I definitely glazed over the last names.
> Who could have expected two people named David?!? I will read more
> carefully.

Heh.  In the past I've had a dtc query from another David Gibson.  And
I've received phone calls from the boss of a different David Gibson in
the same large company I was working for.  And I've received a reprint
request intended for David Gibson the (former) parasitic worms
researcher at Imperial College.  It rather comes with having two
fairly common names.

> > Fwiw, since this further optimization is essentially free in terms of
> > code complexity, I'm certainly happy to apply it.  I am absolutely not
> > keen on further micro-optimization of this.
>=20
> OK, fair. Do you want me to drop the 1-line patch from my v5 draft
> then? It's basically this:
>=20
> -               if (memcmp(p, s, slen) =3D=3D 0 && p[slen] =3D=3D '\0')
> +               if (p[slen] =3D=3D '\0' && memcmp(p, s, slen) =3D=3D 0)
>=20
> While it is a micro-optimization, the code is no harder to read so it
> feels like a nice free speedup. ...but fine to drop it, too. ;-)

Sorry, I was a bit unclear.  Keep that change (though fold rather than
a separate patch, I'd suggest). As you say it doesn't hurt readability
at all.  It was some of David Laight's more complex suggestions that I
think are overkill.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--OnpJBJjO2T8ol3FP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsE2Z8ACgkQzQJF27ox
2GfAJRAAgs5M9DnB5t/cwIYunaYd7Ci4UnxiyuUgsiaR7GQGTR1O3a48q4VJSRAq
JIMdhnfYhzJybi873hZs2RH4xMo9kTi0Nkxg3U8O4QW2RRus0EFTwdXzR2n1Y2c2
+UXBbdhVYYv6F8q9+gdRVAhVC3AeNMlUGh/wn+791Kmv+DKRSQG28yFUIWeUv4j2
xvBTuy7FabUgOY61597MS+AWr16rbE0o+zz/ylFsGjVkbk5SQyL+3wSNJtR0ePWb
eWh/ycJPW4H+4wXw/6ABCKlBQ3gkAMb24unPZEJhntQc6mpXej0/j36AhUp7HFLz
aFEAzqqfsQQrAIu9XStvBj2q2C4HxedMHP3hPKoVzAiLlUfSmCo2z8ivaGt1fKqC
+9wvdcAxF7lrw5VaPmMuj1dt9zrcVb1y9BWTN6ueDNvXXrQ0JqWQ80+CHc6+fc0a
CWL+kGxG0RV1FvCGeJxCgxNWWpRyCnltAF33d13gs3vq+dtM3dZn4NP7KGnElm1t
yDTPV3L8nPJX9m1UPlzckCwGp4yxs6eD0Zj3ilSMpk6w6Di2uUTq69CtwO+xCYm+
WTfs99uBRNbLRiEG3RXGk7HvqGzI7jer6Jsrfp2LleZ1CF4ZMR/ztBBS5j0tfiPB
4d77/Ya6IKORUj1eMvcNnj7JKPlewfORMyvJsdrsNNc6+UzLrN4=
=Vmdw
-----END PGP SIGNATURE-----

--OnpJBJjO2T8ol3FP--
