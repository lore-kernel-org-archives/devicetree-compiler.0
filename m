Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593310;
	b=qauhT/v1WHhGilrUortFGV+2aMy5Y0JERztFjPr7maQ8NyB7ZVilbcLHWOH+kRtmfMMX
	 5s9cKzVHZHeSoRMSpCxf+K7Dl2jPB2gk4EtUsscd/RppV7cGHWlRP+DXwWLkLe530du7C
	 72aqAymr1Guw868YYY1chQh1gF6pT6m09d7nBPmhhQy5ZQSqFys4nORsogyldPS+9ZVUr
	 9RAjS1IiJXdznLEfq3UOkABFC8H04hyVB7o3TOoLvweRtX/6Dqn/pAFcLGFgxQNVs1BNu
	 103jqOFDuur9CNMD1ptNyQBcqJuAD/pigZ75ymipA6wHZx8LgPorUQb9SDxaQvcz3tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593310;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=h4IC4mizGScaKKMCo0gZgpZOVl0l0BVHvwpn3IGIP48=;
	b=JJZQqV1PXhz6wfpxKUXDnQdd1PrPf8VIMWGrOG7ljI4HMrLOWh3R/yiZV6y7UU9GFBYx
	 V11qIGnmv4oOnIo+O3igfQP0+OMV0kkSBqVPmCobJta9Rk9mFe5zJfCuTJGowLH8o7PO4
	 1MVjwiT0LhEN4nnN/HQK0ooETmvIhpphjcqq8iBF2F9SKfTQEIYIAxGMH+l/f4vxWQe+i
	 eou74sLUonIoKy8ZWLlOc7nXYQgQifWkcmP0yLTs9LJbus/sfs05uiZpEG98bYLDramjr
	 3yYVC/Tx63td3z09gh1WcW1n2di7X1K6SkjCRhBKbkgj3lvh3czkePIiurTFbe/fHow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=qYrQS16y;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67C4606A326
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 04:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=qYrQS16y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793593305;
	bh=h4IC4mizGScaKKMCo0gZgpZOVl0l0BVHvwpn3IGIP48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYrQS16yGi41/oxbrLYxlwi95qAnoPVbkKAAS45oWWuJe2D0S+G/HhJkTN/eqPxKE
	 UYM5abaCFAK+5jrrvPnsYb8aJ0FHGock98baXMHqwvTcyxQeyh0q6Aykw0FSKVO/DR
	 2Vn4wNOPGASwV/W0oJAjTlWSkZ90Nb/31XdLvK6O3It7bMguSCu6OtUdo1rzlzPrmo
	 9lL5CKV9TpW9tW+c3czBfZrNWlMiPTyAH8cC4Ug+mY16Gjdr8i1szOlTGFxAEL6zXg
	 xczUxeVh2ILBPazdHmpnFIPrWo2k3RntlJ5enqhHwXkjPK9tl6AoLEQlLWblmITuov
	 K3fBRDDXpJZWA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHz6x2jnJz4w9g; Mon, 02 Nov 2026 15:21:45 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:06:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Kelvin Zhang <zhangkelvin@google.com>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] libfdt: Don't search for the terminator in
 fdt_get_string()
Message-ID: <augMPBqX8W6FGNH6@gractus.seuss>
References: <CAOSmRziU2Nw2kMVN9VCseiwcuCa0SxBe=d+33=nVnCZxFXkKnw@mail.gmail.com>
 <augI1QfvUaWHR1ZC@gractus.seuss>
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
	protocol="application/pgp-signature"; boundary="EwDpAWm05WMsiO2H"
Content-Disposition: inline
In-Reply-To: <augI1QfvUaWHR1ZC@gractus.seuss>

--EwDpAWm05WMsiO2H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 02:52:01PM +1100, David Gibson wrote:
> On Sun, Nov 01, 2026 at 06:30:52PM -0800, Kelvin Zhang wrote:
> > Unless FDT_ASSUME_MASK includes ASSUME_VALID_INPUT, fdt_get_string()
> > finds the end of the string with memchr(), bounded by the end of the
> > string block, which also checks that the string is terminated. A
> > string block normally ends with a NUL, and then every string in it is
> > terminated. Check that byte instead, so that fdt_string() doesn't
> > scan the string at all, and only compute the length when the caller
> > asks for it.
> >=20
> > This helps callers that look up many property names. With a 612 KiB
> > tree on x86-64, built with gcc -O2 and the default FDT_ASSUME_MASK,
> > calling fdt_string() for the name of each of its 17,899 properties
> > takes 108 us instead of 160 us, not counting the walk that finds
> > them. libufdt, which Android bootloaders use to apply overlays, calls
> > fdt_string() at least once for every property it reads: tens of
> > thousands of times to apply one overlay to a 445 KiB tree.
> >=20
> > Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Oh, one comment I forgot the first time.  As you saym in practice, the
strings block should always end with a \0, however it's not
technically illegal for a strings block to contain garbage after the
last valid string.

Your patch doesn't break that, though, since it will fall back to the
old method rather than failing outright if there isn't a \0 at the end
of the strings block.

> >  libfdt/fdt_ro.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index ddfb8b9..44f3c7f 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -80,6 +80,18 @@ const char *fdt_get_string(const void *fdt, int
> > stroffset, int *lenp)
> >  	}
> >=20
> >  	s =3D (const char *)fdt + absoffset;
> > +
> > +	/*
> > +	 * If the range ends with a NUL (always the case for a string block m=
ade
> > +	 * of NUL-terminated strings), the string is terminated within it, so
> > +	 * there is no need to search for the terminator.
> > +	 */
> > +	if (len && s[len - 1] =3D=3D '\0') {
> > +		if (lenp)
> > +			*lenp =3D strlen(s);
> > +		return s;
> > +	}

Oh... one thought as I look at this again.  AFAICT this will only
really save time the !lenp case, since the strlen() would have close
to equal cost to the memchr().  So, it might make sense to marginally
simplify this as:

	if (!lenp && len && s[len - 1] =3D=3D '\0')
		return s;

> > +
> >  	n =3D memchr(s, '\0', len);
> >  	if (!n) {
> >  		/* missing terminating NULL */
> > --=20
> > 2.56.0.385.gac671c819a-goog
> >=20
>=20
> --=20
> David Gibson (he or they)	| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
> 				| around.
> http://www.ozlabs.org/~dgibson



--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--EwDpAWm05WMsiO2H
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroDDwACgkQzQJF27ox
2GcAdQ/8CGjkhxiV2NOU5+KsVfXdrZJsM5G0KitAoVH/ZjwUOF0koq+aJr+X5wYq
52dpqurJ/FczqY8W3KsOAcJsDJKwXT0fx4KMdkWNfHX4CgD/MkBUa2JLnYpegsQw
4TBeUlOBKkCGKMvhHX1n3EuVG9X8lyDJ5C8Sl8pJNspApJRyVxxP8Ny+4wAV3tJd
9dQMOisbz33e49CT1zRkiHuTV13cH1DEvKFcSi/SzIU2tZm04Gkcbxpc2TPWxSBE
FNOaKn3gBgnfsMY8HglsUbT4pbmRUVM5/GEJubHQMhmJfwbul4qLOups7SOUAU6H
SCLLeZQQyHLyAwawvEs4IHAPyq+6uuqaFalMggZ2DZaDfLOBjwUtIH9mb7jylJjd
Mzj6kkx3H9UmbPKwTMhqDyMPpg0gAE9EiYFrjh850u9WUz/0qOIVkaFN625Poef/
SEcjh1lojcPlwBtSbFMixZ9lM6ZMpsjaI5oKz1f2I1js1mftyJqexMEPlYQyJcI2
b582WDCf8autH24XNg7Ap2/dfQ81va4aJ3ZI1/6ijx56ZWiYsW0ll+4PYPMkpnUh
h540tUg+vHybIyAyxiLy1asbwM4kYkwZW6gWpnz8kvMGI62k6aDBQaFpAoNcqu34
L6o1OMNXBMnEfv43fmSd2CFZi8WXfa2LXocMI0y6tBHZAogIySQ=
=Cx/o
-----END PGP SIGNATURE-----

--EwDpAWm05WMsiO2H--
