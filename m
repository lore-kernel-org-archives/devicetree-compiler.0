Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA3D1C5499
	for <devicetree-compiler@vger.kernel.org>; Fri, 15 Aug 2025 05:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755237043; cv=none; b=TN4G1lJJ7yen//4Fjfjf13vOnIE7A1IJfhh8fyqI8oxEIXWFkOtg07GOHh4yFEgo+H4QuZ7Qp5G3orVuVNhIg/SOPhFMGiDwEJyxEbkAESodBN7sSZzM6ryvPivcA8fHzZfoE5uO3k1/QK2E/ALLvwhaESZK2293ppxAdmdRS+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755237043; c=relaxed/simple;
	bh=LznDvPcYJFMfORyaeu0HiofJVRRBtXLm4VyGJMucD2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyV4f+qTdcgAhKpMYtGrsprIhehfvaXJyyqG70byRIYAg/C77bUFZQqEk9TIbT5kO9gx3HN1pVzHT1kXLCFfDu6JxRVzJrdBL8zZ5mhW5i6vIRbi4qOq1NSwGGSwu2+iQnmsEtZmSNKjYzRfXDRKaoaHjWIGRXfwOjatEZoCt9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=mTdOi2ZQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="mTdOi2ZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755237039;
	bh=jwcf2jYVTsL+vXKBCC3PAAz7GdNndaxakOOUlDZYNLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTdOi2ZQpCa912TNt2T+LgJTO2Xba1JM7vDdR0mKEMhcy4Dr5dxxxFu69sp8N4N9y
	 TEjntkH9GpKi7QKr9QwZqP9+xirINn5X8jEaOH6kplwdx7T8df7jXF7yVCHFPnmrFi
	 244+mWTcUDUcuwFC2KJ5KyXwO3WtEsedz5VQ/KloMsCIr3QyWYvYHSOgCqcnxwtUry
	 PZA3EPUT3cqndGHo6Ns7osqOn60AgHFMFmc7rDlXDqp8i87sfEtAM7juo/dUoIQHPA
	 5iJHQ4e7yGm+HDdL1fKBjPW+iln7ucB/CbcJO6FQhk6IeNw7xiveBw1oCm+VMe0dA5
	 JaluIVBVnNd8A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c3B6R1nHhz4xf1; Fri, 15 Aug 2025 15:50:39 +1000 (AEST)
Date: Fri, 15 Aug 2025 14:10:11 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] livetree: Add only new data to fixup nodes instead of
 complete regeneration
Message-ID: <aJ6zI_mOB21fKja6@zatzit>
References: <20250801160031.624886-2-u.kleine-koenig@baylibre.com>
 <aJ2R6LDucXrOFgZW@zatzit>
 <eoqc474y7alu7bbofhkilh2urifqjzj2bimtmetctqcho3usxe@ncwxjr6v2mps>
 <5dq25ou33jmacamic4k4w627r4mi574pd6gc25t4yztakawfrw@77qx576xdo7y>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AC45w+wLgxeTeIHQ"
Content-Disposition: inline
In-Reply-To: <5dq25ou33jmacamic4k4w627r4mi574pd6gc25t4yztakawfrw@77qx576xdo7y>


--AC45w+wLgxeTeIHQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 11:28:05AM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Aug 14, 2025 at 11:05:02AM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello David,
> >=20
> > On Thu, Aug 14, 2025 at 05:36:08PM +1000, David Gibson wrote:
> > > On Fri, Aug 01, 2025 at 06:00:31PM +0200, Uwe Kleine-K=F6nig wrote:
> > > >  livetree.c              | 75 +++++++++++++++++++++++++++++++------=
----
> > > >  tests/retain-fixups.dts | 29 ++++++++++++++++
> > > >  tests/run_tests.sh      |  5 +++
> > > >  3 files changed, 92 insertions(+), 17 deletions(-)
> > > >  create mode 100644 tests/retain-fixups.dts
> > > >=20
> > > > diff --git a/livetree.c b/livetree.c
> > > > index d51d05830b18..24f7c561d77e 100644
> > > > --- a/livetree.c
> > > > +++ b/livetree.c
> > > > @@ -356,6 +356,60 @@ void append_to_property(struct node *node,
> > > >  	}
> > > >  }
> > > > =20
> > > > +static void append_unique_str_to_property(struct node *node,
> > > > +					  char *name, const char *data, int len)
> > > > +{
> > > > +	struct data d;
> > > > +	struct property *p;
> > > > +
> > > > +	p =3D get_property(node, name);
> > > > +	if (p) {
> > > > +		const char *s;
> > > > +
> > > > +		for (s =3D p->val.val; s < p->val.val + p->val.len; s =3D strchr=
(s, '\0') + 1) {
> > >=20
> > > This isn't quite safe.  You check s is within bounds on each
> > > iteration, but if the property is malformed and doesn't end with a \0,
> > > the strchr() itself could read beyond the property's bounds.
> > >=20
> > > strnchr() could work, but is awkward: it would return NULL if there
> > > are no further \0 within the property, and on most systems NULL <
> > > p->val.val + p->val.len would return true, so you'd have to check for
> > > that case separately.  You could use strnlen() instead, but that's
> > > also a bit awkward - it doesn't include the \0, so you'd need to add
> > > +1 - but in the malformed case that would put you one beyond the end
> > > of the buffer.  That would probably work in practice, but creating
> > > pointers beyond the buffer they're within is technically UB.
> >=20
> > fair, my approach would be to check p->val.val[p->val.len - 1] =3D=3D '=
\0'
> > once before the loop.
> >=20
> > > > +			if (strcmp(data, s) =3D=3D 0)
> > >=20
> > > This also relies on the \0 being there.  Any fix for the above, will
> > > probably result in being able to get the length of each string segment
> > > fairly naturally, so it would make sense to use memcmp() instead.
> > >=20
> > > > +				/* data already contained in node.name */
> > > > +				return;
> > > > +		}
> > > > +
> > > > +		d =3D data_add_marker(p->val, TYPE_STRING, name);
> > > > +		d =3D data_append_data(d, data, len);
> > > > +		p->val =3D d;
> > > > +	} else {
> > > > +		d =3D data_add_marker(empty_data, TYPE_STRING, name);
> > > > +		d =3D data_append_data(d, data, len);
> > > > +		p =3D build_property(name, d, NULL);
> > > > +		add_property(node, p);
> > >=20
> > > You can add the property first, then share the data_append_data()
> > > logic with the previous case.
> >=20
> > This is mostly taken from append_to_property(), I will check if your
> > suggested improvement will apply to that one, too.
>=20
> I think that would be:

Looks good.

> diff --git a/livetree.c b/livetree.c
> index d51d05830b18..2ccdc9d9c2a7 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -344,16 +344,14 @@ void append_to_property(struct node *node,
>  	struct property *p;
> =20
>  	p =3D get_property(node, name);
> -	if (p) {
> -		d =3D data_add_marker(p->val, type, name);
> -		d =3D data_append_data(d, data, len);
> -		p->val =3D d;
> -	} else {
> -		d =3D data_add_marker(empty_data, type, name);
> -		d =3D data_append_data(d, data, len);
> -		p =3D build_property(name, d, NULL);
> +	if (!p) {
> +		p =3D build_property(name, empty_data, NULL);
>  		add_property(node, p);
>  	}
> +
> +	d =3D data_add_marker(p->val, type, name);
> +	d =3D data_append_data(d, data, len);
> +	p->val =3D d;

You could even do this in place in p->val, avoiding the temporary.

>  }
> =20
>  struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
>=20
> The test suite is happy with it. I will include that with the next
> revision of my fix patch.
>=20
> Best regards
> Uwe



--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--AC45w+wLgxeTeIHQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmiesyIACgkQzQJF27ox
2GdqkA//Q70UAGXmiz1MiRz0ZLnW7m/6OLQT69hifQmxHrpBiV2Npa0ucbZDMbVC
j4vSg2pOnNxGVI1wPwYnKsDTHAG3y0mZcLjhAyaX+eYIzNGc7pjv6vwlHHdZPcIv
QknB9E4Y7fEy3mUT7KY81wduGlfpaIr19jHp9cNAGkn91xcw/dgGVYFYulHsFYzM
7aURWCrStVWQX+ytcB9HcaubZji6KxujO3h1yYoqwH+fecM9gHIA90jO80wrDhaZ
jaSsf8eoeYyE2v2nHGoIEFdSkBXVV4Iw6G8PmdzMjunNtz/pX4WqEMrl0MtffUW+
jY53uvCsRoWwgALEWWkcPUDNFKZ+iZd3g5Ohh/xcwgYbE8/WVciQ3KOQnUnv57VD
uija556xymkiHSBFjmKdPBmU+Z/4SWtBBN4ukD/3gvuKPEXi5SkAwRPHhiLgo0GN
6/tFHmAWmdGQeZ6+zlyy7kW/QDBZNFpM1upumi3AXi2gZxtPH2Qy2nK6WxUUHSj+
t0WCL388Z3x2xmKYB0DcFLF9XWWbQ4GfYZQxl8amke6e48EOExahXRbZD2aViypI
gES3+G4K8V4eMlxuiHI6Eqb7+yZoiM7qUEr13Tx/2HlVjL0Vo+1Rd1bUsuo3usJO
VL4hmeHt8Q1NUzv7f7e0XVVLbd90ouSaImOn4YI+IfuM9U3Yx3w=
=4mBX
-----END PGP SIGNATURE-----

--AC45w+wLgxeTeIHQ--
