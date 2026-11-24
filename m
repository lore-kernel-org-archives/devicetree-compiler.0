Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489361;
	b=ykRV9vYUf0AnNx2bBy0AwA9aM4K1q6b1E/6cqRSXaBK1yzhmEt8ChNe6wEnQ72wvMd1m
	 wHz6+50drhuoVP+yjv0hsffNRjaB6dUqV8Xe7nLD60u4MpPaiw3OywaAJ4AQsaIBSsEro
	 1SphiggDzHbP7zgOka2JxM4qD6wFoxTvzxfArmp87GC/PvsY6RY7W6bzuKx7Xjf3aQ/RQ
	 6iI7D+Zb1g0FLMDcm5UYmVs44Trcoab8uYoj5oBK1EZgGuSCW3a1/iEvYKaeyK2p9/YJK
	 q6Z9o0N1J7BDgI4UUS9tCZpLfm3ZJ4KB5xMAnbmFevkHKcUIOLKTofTzsmSQ+2BRicw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489361;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=xic5QSvBHd1z8WU7XMLh/hv9DdjmmJDOtiaKgnYHT/o=;
	b=u1LwHsu1J2Lnyp6XlP85S3qvVqGtRYSRvZ+fHhORADNGw3VRruwzl5rOlWJr6CS2/X4a
	 /of5OGicSIrSQa4eUuhAj7zbcoACkOtGf7F0NZXQzlcAwwvBvGhzNGRSVEZQxzlJcsiJb
	 +PTTDP3eoN1rKMBalAc1TV7OUJ2i4tWhVLgkUG9FF7ReQS1Vl4WNAnwDX3t69OpaTgNqu
	 Rqylc1u2o6o37kSMR/ouFm4/4opclGUYnxhgcWvzRWHVz/zyDatMakMQLAsgqV54NRZqz
	 u7DfkbC9IFXC5nhTSCkqHJac5WGv7c75HpsUYRIDCUpU/XiDKXvRc/FcdUeennJjEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Up2bVyJq;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4137606A31E;
	Tue, 24 Nov 2026 03:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4137606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Up2bVyJq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795489351;
	bh=xic5QSvBHd1z8WU7XMLh/hv9DdjmmJDOtiaKgnYHT/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Up2bVyJqN/q5gbNwyOsquzhsNNYz6/N8rp1PiMxMbfo8i5+ykOsatx7IeUs+yQEk2
	 +Au0BGgAbwehvQvFXBe856J3cLr5g6943Zbf/Y6TGqlFzGZmojtr9XO1yF75nuIrpy
	 0zESCk6O6rYUNZbQwrJWnCVCWri2vfhtI60MeDsZru2MqUXqEhxqdPXJCOvE24mv6w
	 NzByq/VepvYHGe1Bnb+RCbFP74pl2U417W3NPDoFNp3bH4tdchp3YuvjEV4JXBnwxJ
	 GXXBnNLcpT32LPm1WnWDoU4vNDRasXNhXp1n0HMrOKGaUim9nvpaZH8F+NwhDe+sqN
	 ewq0pG5HZgjUQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jYSKM29sXz4wMM; Tue, 24 Nov 2026 14:02:31 +1100 (AEDT)
Date: Tue, 24 Nov 2026 14:02:15 +1100
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
Message-ID: <awT-Nr_08nDGh2hA@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org>
 <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
 <av6J47fOAYxejSgr@gractus.seuss>
 <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
 <awTZn8m02pE-wz29@gractus.seuss>
 <CAD=FV=URVKrCKFte_2ratzViiEshYMO-9ZxiuMFbyqW9=apYLQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="3+U/p0mWvHQPbKmJ"
Content-Disposition: inline
In-Reply-To: <CAD=FV=URVKrCKFte_2ratzViiEshYMO-9ZxiuMFbyqW9=apYLQ@mail.gmail.com>

--3+U/p0mWvHQPbKmJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 04:37:51PM -0800, Doug Anderson wrote:
> David,
>=20
> On Mon, Nov 23, 2026 at 4:27=E2=80=AFPM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > > > Fwiw, since this further optimization is essentially free in terms =
of
> > > > code complexity, I'm certainly happy to apply it.  I am absolutely =
not
> > > > keen on further micro-optimization of this.
> > >
> > > OK, fair. Do you want me to drop the 1-line patch from my v5 draft
> > > then? It's basically this:
> > >
> > > -               if (memcmp(p, s, slen) =3D=3D 0 && p[slen] =3D=3D '\0=
')
> > > +               if (p[slen] =3D=3D '\0' && memcmp(p, s, slen) =3D=3D =
0)
> > >
> > > While it is a micro-optimization, the code is no harder to read so it
> > > feels like a nice free speedup. ...but fine to drop it, too. ;-)
> >
> > Sorry, I was a bit unclear.  Keep that change (though fold rather than
> > a separate patch, I'd suggest). As you say it doesn't hurt readability
> > at all.
>=20
> I don't think I can "fold" because you (the correct "you" this time!)
> already applied the patch I'd fold it into. I think it has to be a
> separate patch at this point, doesn't it?

Oh, yes, of course.  Sorry.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--3+U/p0mWvHQPbKmJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsE/jcACgkQzQJF27ox
2GdAGg/+Nm9Ukdlz0X6V2HD7dOmAcUcLSaF5PBxQ6oJAn9OT9ae+WCHQ4usbxkl2
UbsSDyOlwTjwT9vq3deOAfFY2BUEZiPvgGO9mlOfWGOo0DoMHKxqivF0lAl4cgxV
DWHUoS5efLF872yTsJpQo6x5glye/ukETO8LRhOktN0i1A8BUMEoYDIEbeFuazwd
4zfejIl0yF2WJuNzGt0yx7vq7YUzVtNTeKPiJUmcYXMmyoXHqRQ9lgIm78WQtxRJ
du3p29U7jobE0Q3B0j/AxZk1V2Wo7HN1VD261XFhslbwVs5gtmeB5yvZ/cfbKIqW
EPH8gA/TSWPsC0Ov4RxNkdkutlpMexFDOecTLnl/KQ0uZYf9WMt9QwTegSOhCPMV
tZH2/0dTv9OmuO7Mldz9PwruiOfaAVE/YlFawpFH/XOoXA3weyt/11hMIQ5IFllZ
cdiR0DKQ12SGG76eQY/DCdRvnQ9FW5HqQaWGOyF7bcv60Hk00DtfvTebWvRcEThC
eqaRSBHE33BslxbW+vtnrHtP0AnmzvOgHEnYx3J0ZrbMR7iGuEArvPvBZ/2rQ8wA
qTqPLB1vlnkpup2nx+54ZIftCvimf7hkLLOxSDCGa1jfXXKulZiPEbKaZyd+lTvl
qCIPBl14FLxf//Wok9a2WAnPellNueXCS6K1gECGansV1MVapi0=
=FAFV
-----END PGP SIGNATURE-----

--3+U/p0mWvHQPbKmJ--
