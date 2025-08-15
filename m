Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA9A1DE3BB
	for <devicetree-compiler@vger.kernel.org>; Fri, 15 Aug 2025 05:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755237045; cv=none; b=dWAXux2CpxkADeSH3iDnho1GQDMUha89aZ90ciULiRqM8q42eSvuKpFIpeRJZhPoHthqzmcZmHLM7tBx7sBY6E0YSk9AQKUZHDS17cd0FEqy5fjrAQWJEbr72aI2su8PduDcCf27aHiNcGan6xeb9Kja0U6KhR4xsVDB77C9uCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755237045; c=relaxed/simple;
	bh=TOm0cnkcXF92cK/SWOZBcPBium0Vz1dvWz9JbZNhv9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=de8rPZ+IKy9oH4QWbLGapnpjV3DxDhzSnNhlbTGInAAzM8MdFZXnFLgNS/uhPzQiJhKXK6LfMuX4ckWaCDGDrg6UGXP2pZPG9LjmrpbM9wTVChxN4UID5+u5VypNnsNKW7nqqP9ihDyYblW/cDpaj6twtjAKqjT9N+KMSA73+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=p/aDnoEn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="p/aDnoEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755237039;
	bh=nkLNUgJTN9AYgAaW63HVrQJ4WcKTacbiDVNBzvABmVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/aDnoEnpQHlZ6kQJKxD2zs09T5tNDVbOiEP+ZAQwptjUOeNKxDr689gfXH34o+4J
	 xfIDVtB4heGgp5bT5WkVb9PizGSPTXOgHf/c0cckxZ/xInT0bcy7DorzAaLMt2ea8t
	 UIV5nRORvWWqMr2uiID84x0smArh7F84FVdspdh9hjFQMD7LVrygy0zZWRH8Pi3rEX
	 C+XKmOHrsTGxu4ovpuvJuxzh/p3xsZboHBgiCqoYeZgl/JLX7EZ+Y+/YPJ9ZCmOy18
	 QU0EKSAxfZr+qwEC/cl9YS1OSqr2CT9UsvL1BajMSwiix1UTJJvlwpbB5Z3jcrvtg4
	 XNCKtTuodzpcQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c3B6R1bJXz4xdW; Fri, 15 Aug 2025 15:50:39 +1000 (AEST)
Date: Fri, 15 Aug 2025 14:08:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] livetree: Add only new data to fixup nodes instead of
 complete regeneration
Message-ID: <aJ6y2EMdqwsPByWY@zatzit>
References: <20250801160031.624886-2-u.kleine-koenig@baylibre.com>
 <aJ2R6LDucXrOFgZW@zatzit>
 <eoqc474y7alu7bbofhkilh2urifqjzj2bimtmetctqcho3usxe@ncwxjr6v2mps>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jNjSZzZKsWNoVmp0"
Content-Disposition: inline
In-Reply-To: <eoqc474y7alu7bbofhkilh2urifqjzj2bimtmetctqcho3usxe@ncwxjr6v2mps>


--jNjSZzZKsWNoVmp0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 11:05:00AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello David,
>=20
> On Thu, Aug 14, 2025 at 05:36:08PM +1000, David Gibson wrote:
> > On Fri, Aug 01, 2025 at 06:00:31PM +0200, Uwe Kleine-K=F6nig wrote:
> > >  livetree.c              | 75 +++++++++++++++++++++++++++++++--------=
--
> > >  tests/retain-fixups.dts | 29 ++++++++++++++++
> > >  tests/run_tests.sh      |  5 +++
> > >  3 files changed, 92 insertions(+), 17 deletions(-)
> > >  create mode 100644 tests/retain-fixups.dts
> > >=20
> > > diff --git a/livetree.c b/livetree.c
> > > index d51d05830b18..24f7c561d77e 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -356,6 +356,60 @@ void append_to_property(struct node *node,
> > >  	}
> > >  }
> > > =20
> > > +static void append_unique_str_to_property(struct node *node,
> > > +					  char *name, const char *data, int len)
> > > +{
> > > +	struct data d;
> > > +	struct property *p;
> > > +
> > > +	p =3D get_property(node, name);
> > > +	if (p) {
> > > +		const char *s;
> > > +
> > > +		for (s =3D p->val.val; s < p->val.val + p->val.len; s =3D strchr(s=
, '\0') + 1) {
> >=20
> > This isn't quite safe.  You check s is within bounds on each
> > iteration, but if the property is malformed and doesn't end with a \0,
> > the strchr() itself could read beyond the property's bounds.
> >=20
> > strnchr() could work, but is awkward: it would return NULL if there
> > are no further \0 within the property, and on most systems NULL <
> > p->val.val + p->val.len would return true, so you'd have to check for
> > that case separately.  You could use strnlen() instead, but that's
> > also a bit awkward - it doesn't include the \0, so you'd need to add
> > +1 - but in the malformed case that would put you one beyond the end
> > of the buffer.  That would probably work in practice, but creating
> > pointers beyond the buffer they're within is technically UB.
>=20
> fair, my approach would be to check p->val.val[p->val.len - 1] =3D=3D '\0'
> once before the loop.

Ah, yes, that's an easier way to do it.

> > > +			if (strcmp(data, s) =3D=3D 0)
> >=20
> > This also relies on the \0 being there.  Any fix for the above, will
> > probably result in being able to get the length of each string segment
> > fairly naturally, so it would make sense to use memcmp() instead.
> >=20
> > > +				/* data already contained in node.name */
> > > +				return;
> > > +		}
> > > +
> > > +		d =3D data_add_marker(p->val, TYPE_STRING, name);
> > > +		d =3D data_append_data(d, data, len);
> > > +		p->val =3D d;
> > > +	} else {
> > > +		d =3D data_add_marker(empty_data, TYPE_STRING, name);
> > > +		d =3D data_append_data(d, data, len);
> > > +		p =3D build_property(name, d, NULL);
> > > +		add_property(node, p);
> >=20
> > You can add the property first, then share the data_append_data()
> > logic with the previous case.
>=20
> This is mostly taken from append_to_property(), I will check if your
> suggested improvement will apply to that one, too.

Ok, thanks.

> > > @@ -1056,29 +1110,16 @@ void generate_label_tree(struct dt_info *dti,=
 const char *name, bool allocph)
> > > =20
> > >  void generate_fixups_tree(struct dt_info *dti, const char *name)
> > >  {
> > > -	struct node *n =3D get_subnode(dti->dt, name);
> > > -
> > > -	/* Start with an empty __fixups__ node to not get duplicates */
> > > -	if (n)
> > > -		n->deleted =3D true;
> > > -
> > >  	if (!any_fixup_tree(dti, dti->dt))
> > >  		return;
> > > -	generate_fixups_tree_internal(dti,
> > > -				      build_and_name_child_node(dti->dt, name),
> > > +	generate_fixups_tree_internal(dti, build_root_node(dti->dt, name),
> > >  				      dti->dt);
> >=20
> > It's not obvious to me why this change follows from the rest.
>=20
> The relevant difference here is that now it's unknown if the __fixups__
> node already exists. build_and_name_child_node() only works if it
> doesn't exist which isn't ensured now any more with the lines deleted
> above.
>=20
> This is a revert of 915daadbb62d.

Ah, yes I see.  Thanks.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--jNjSZzZKsWNoVmp0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmiessUACgkQzQJF27ox
2GcuOQ//aFNPB5YH9UW9VtZYu9EkpUElxnksjIUGIopXuhFob0XlT7pUtrIrzQRc
uWNprDG2ZRjfThmS5mSoMGQabs2yQN+2ytAY9BncOj3a5pTBK3CEpaL8uhZp6JGB
T3ach4mbn2/fboG4RynbE4Ws1zB0AptJctjpE7OfY04mOrfhFBztQYVzT/i9Qs/4
f9lciBmrSJO1J2iAAVY/hlu+hs0+FBb7fFIa0hPC0ZLL183Q7GjVTtzZXQ9iVH9S
4EYVfsH3MbxtBKaKVf7Hh/JlLWt0bnpovKgxP2lSldOGBbu396RIDYjOiPiD5p8T
sRYpV9yNgOP3zXqcFC5ekG6qGUbfW4nMveDLDKG+Pjgt+ypzHteQHr9T60w+cAq3
DZpKe0XcvYFEcavy6b1K9+WqBrvh6py6poQlD6mG3yns8P/bN5IkPVsRWXVSmBM3
DCFggbh3AGTT8p40lJviIt7Uv2GUm3QaLHKq+HJYBueW86IBnP44Isd4YfYwzubL
UzNydj9nk9qeLY+9PhCZfK2CZiSAmuk2E3o2Gpnk60/yf/CTcf3+o8HY64vPC9bI
cIXZEPLq1/+804XRfIoKgdko78eljXmxq+fkOrLzx5kmG4w5W9fM7E/RDcDzspNH
K0aoH1mYN4LlEmEAq9KOdgHX7636ubRKLwmIFnTs/a9FiB+KUJo=
=DLJz
-----END PGP SIGNATURE-----

--jNjSZzZKsWNoVmp0--
