Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D66284883;
	Tue, 13 Jan 2026 04:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768279358; cv=none; b=to8Ghc8qM85iSz7lLi2Qb8wZ5kpy0ys7tWiRnGYygTw3dRhVE8LsDAFscUhcod96PVTHnqDCaBS2MGUzSAWXr3v/3o1griM/sv6AN13FrPZQ4saT3Tse1ZUP8L9BzM5z1FFA4db9pgOu7Y76e7I9srura8vXrUcz4EQLkgPmkR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768279358; c=relaxed/simple;
	bh=qZ/QXwmlDf0NOn2hvRH4cNm9ljmV6HFHu7E2KJlf1tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJg+S2v1D7AIWimRRymvA6GnrN7a2x9+OXT3CHBJfNHR4B4R0hfkbduRNSBOfaXVQ+OngwHJZtKG2kyPJg3lF7TlJOGFdNk2ZFJMetA4jV0D01weBiO9bwmKagn0uAkLIWnGw5xorgPz+LTbaz/nnpC/fn8XVdVfwi9LDxoMfAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ndgCuU4I; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ndgCuU4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768279354;
	bh=sRH8xieb1EUnHQo86vAkMHuUKPF0QCGxVZM52+pVzjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndgCuU4I77JVYpi9CXZ5pFYjMUkBJyG2yo2XTwUWErmwYV6LbwRLjyyi2I1o2w2ZX
	 5kRZEikY2nLKFvJKdZ4bil9QIPWUnyddFKJgI6UOW/kOFe0tSc90hDbMSHX4dQFWj0
	 oyUZsIL7ul0huAdVs97JBYLPQ+Lz1DFu0Gl3dnBzq7kdYSw5gXKYYBn8ZIy1ULi6LK
	 vgHWzG5w2BFxwdWS7Xd1E7Paia9VFLZb+mfPHqh5jfA/Spz3QHEvgagfAp1tpnxCbz
	 BO8exKG52f9Uj++mbYuMC8wHZnd/s69+FmR5L9/Ap6xzbx4hBD5XOEfNEj6qQcvLAt
	 KGCzJ5+i743HQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dqxSB29bqz4wGs; Tue, 13 Jan 2026 15:42:34 +1100 (AEDT)
Date: Tue, 13 Jan 2026 15:42:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 01/77] checks: Use consistent type for strspn()
 returned value
Message-ID: <aWXNN0bW_xx-YMy1@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-2-herve.codina@bootlin.com>
 <aWW3Rs_uoJdksA_n@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4XSruWxvwWrUL5aL"
Content-Disposition: inline
In-Reply-To: <aWW3Rs_uoJdksA_n@zatzit>


--4XSruWxvwWrUL5aL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 02:08:54PM +1100, David Gibson wrote:
> On Mon, Jan 12, 2026 at 03:18:51PM +0100, Herve Codina wrote:
> > strspn() returns a size_t value.
> >=20
> > The function is called in several places and in all places this value is
> > stored in a size_t variable except in check_node_name_chars_strict().
> >=20
> > Fix the variable type used in check_node_name_chars_strict().
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>=20
> This one makes sense regardless of the rest, so, merged.

I spoke too soon.  This causes a compile error:

https://github.com/dgibson/dtc/actions/runs/20944813954/job/60185662154#ste=
p:5:130

For some reason it's only showing on the make build, not meson.  I
guess there must be a mismatch in which warnings are enabled.

>=20
> > ---
> >  checks.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/checks.c b/checks.c
> > index 5d09216..041e565 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -324,7 +324,7 @@ ERROR(node_name_chars, check_node_name_chars, NODEC=
HARS);
> >  static void check_node_name_chars_strict(struct check *c, struct dt_in=
fo *dti,
> >  					 struct node *node)
> >  {
> > -	int n =3D strspn(node->name, c->data);
> > +	size_t n =3D strspn(node->name, c->data);
> > =20
> >  	if (n < node->basenamelen)
> >  		FAIL(c, dti, node, "Character '%c' not recommended in node name",
> > --=20
> > 2.52.0
> >=20
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

--4XSruWxvwWrUL5aL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmllzTYACgkQzQJF27ox
2GffIg//Wjx4xPMVPcXBXtTFp61rkYSVHIbaZhn1in1qchWAlJtSJOPrjIHQzzSN
L0WpMVWpOp3qP/nnj9hkEGOK4pBGrLB2lf5wniyu2h0wJfOGLNj9AGVQ4S3HKAWE
4fJEd5+THKeB/ajqG/jF4bTXbmEiIl7vnoANgEZ0jQh33/0GcM/eUd7x618MsuWE
Dnx8x1SWIQAJls6VGzIgcvAUfVZilGOGiMNknNhKmQISuJ3xFVBWxLz/KeSR+2B9
uqm+nCvqJpEPEk7+Lwhc0dZqreHXu8gtx++xUadberiPsTsk07rWyhiwq5fDUjB5
24AltwDoYMmBcO9qWW3sSJqgfuHh6jbydm1gh8a4JNYLbPCC/rsfsIEziXMw4Trh
6TIP7wxoua2biolujuNcdqmxN/E7/0ljUnZC1P2RjjPK3O5aiVlwNlHMnSt51tlY
+6epTsGcfIL00iGipm8jCaljyMao+XcSA91/Q++Oh3YrP8vqD4hoS91MZTzdTZ8R
8XtKYcSOAgx7dv7iSi47UHzHpEc8dhCaj9rxnfRrOYeOHWsLtUKLIvkrnhw7Jn5v
+s4P6HP7w5aPnQIfSBGgPm9KzzQrZiwr8CsMPmOG1gcKhWvxwdqO8O3SutveCOWC
f+eiPvt+MU0FdNr9thLfKZ7ukiTEDPH9QQmlTt7d/D2dR1ISYhc=
=boE4
-----END PGP SIGNATURE-----

--4XSruWxvwWrUL5aL--
