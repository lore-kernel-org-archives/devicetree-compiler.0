Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E7635972;
	Thu, 15 Jan 2026 00:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436853; cv=none; b=bs+47wsdXXucuSvA8/Hfo3W0FjXmS6Yc5LH3J8qQV7+J1ga88iVCiBCUdiMNOCiaF8OYTarHAkeayD/dINtqeIzuz6r4bdwa8lCy+vGXyNthzSvtX6UT2oTbmJTv0yTpCONrKmwLZY75RqbuwKOYOFG7kHawwVcUguxsPXB8o1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436853; c=relaxed/simple;
	bh=g/Xefwk0O0+RBTOA/OYn857LsyJhuiI+sXDRg17qBSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICrAUSOSW21POVLVRkufGCiDGtEAMwSJRcF4mUWQHvPLwSuIpZAAUkG0c9ZTEsQvo6ofYv67fYglszbqw880NTHX0qDuyV1nCcNJfcc4lZakZKKRgCyF2rj5au1Zse9DExQmSG466tNeOLlhM4eCqyA7ApNJuSLVM5IrqBzjilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=SHyQc7gI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="SHyQc7gI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768436849;
	bh=HO95HJZ7wsk45BmUE3zsb9QetkQR/SjM94LzEI4Hb4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHyQc7gIDlM63WlfB+/asZWCJbfE2WO2uWcJKAPuVwU3hWqASeZTu9PjKEzh7cLmN
	 d14dSEKJe2BENZWKYS5r77Whf2Cx5D1Cng1Xw5gsbM2SWrk+XzgXwesfYYY4GS2kWW
	 N5LD7q8HUejgD17QDA9gbKF8Udnk56UoIqvHSvYJFBfW6LEHVMAViJsR+0uxjHCWLn
	 hfP/EqgNCUchCKfQObZORQCevEpVaUJlXP7mtaSPjMEfUho0deZB9M9hyvJI3EVcSn
	 xFEMH3q9UwFctHzZVdzr19I/qGuheH12Rj6ADtMGos4Jj55ZZl+YJE8yVxqskotQ/y
	 r5ekV5BrtBiYg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds3hx1pgWz4wGT; Thu, 15 Jan 2026 11:27:29 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:17:45 +1100
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
Subject: Re: [RFC PATCH 03/77] libfdt: Introduce fdt_next_tag_full() and use
 it in fdt_next_tag()
Message-ID: <aWgyKSIn4QQgSNA4@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NPpP+Dznl1TrFoYA"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-4-herve.codina@bootlin.com>


--NPpP+Dznl1TrFoYA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:18:53PM +0100, Herve Codina wrote:
> In v18 dtb new tags are added. Prepare libfdt to handle those new tags.
>=20
> Keep fdt_next_tag() handling only existing tags and introduce
> fdt_next_tag_full() to handle new tags.

Ugh, that's super ugly.

My first inclination is to say that if you're using the low-level
fdt_next_tag() interface, it's your responsibility to check the
version first - fdt_next_tag() should return... the next tag... and
it's the caller's problem if it doesn't know about it.

Maybe that breaks some real user too badly, though.  The other
approach would be to use the symbol versioning we already have: we
bump the libfdt version, and have different versions of fdt_next_tag()
depending on the version you're using.

Btw, once you generate a dtb with new tags, its last_compat_version
must become v18 as well as it's version - tools need to be aware of
the new tags.

>=20
> fdt_next_tag() uses fdt_next_tag_full() but it will filter out new tags
> when they are introduced to have those new tags transparent for existing
> fdt_next_tag() callers.
>=20
> Code that will need to handle those new tags will use explicitly
> fdt_next_tag_full() to have access to them when they need to.
>=20
> No new tags have been introduced yet and modifications done here prepare
> their introduction.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  libfdt/fdt.c       | 35 ++++++++++++++++++++++++++++++++++-
>  libfdt/libfdt.h    | 18 ++++++++++++++++++
>  libfdt/version.lds |  1 +
>  3 files changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 95f644c..ce051a0 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -159,7 +159,7 @@ const void *fdt_offset_ptr(const void *fdt, int offse=
t, unsigned int len)
>  	return fdt_offset_ptr_(fdt, offset);
>  }
> =20
> -uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> +uint32_t fdt_next_tag_full(const void *fdt, int startoffset, int *nextof=
fset)
>  {
>  	const fdt32_t *tagp, *lenp;
>  	uint32_t tag, len, sum;
> @@ -220,6 +220,39 @@ uint32_t fdt_next_tag(const void *fdt, int startoffs=
et, int *nextoffset)
>  	return tag;
>  }
> =20
> +uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> +{
> +	uint32_t tag, tmp_tag;
> +	int tmp_offset, tmp_next;
> +
> +	/* Retrieve next tag */
> +	tag =3D fdt_next_tag_full(fdt, startoffset, nextoffset);
> +
> +	/* Look at next one to see what we need to do */
> +	tmp_next =3D *nextoffset;
> +	do {
> +		tmp_offset =3D tmp_next;
> +		tmp_tag =3D fdt_next_tag_full(fdt, tmp_offset, &tmp_next);
> +		switch (tmp_tag) {
> +		case FDT_BEGIN_NODE:
> +		case FDT_END_NODE:
> +		case FDT_PROP:
> +		case FDT_NOP:
> +		case FDT_END:
> +			/* Next tag is not new tag introduced in v18 -> Ok */
> +			*nextoffset =3D tmp_offset;
> +			return tag;
> +
> +		default:
> +			break;
> +		}
> +	} while (1);
> +
> +	/* We shouldn't reach this code */
> +	*nextoffset =3D -FDT_ERR_BADSTRUCTURE;
> +	return FDT_END;
> +}
> +
>  int fdt_check_node_offset_(const void *fdt, int offset)
>  {
>  	if (!can_assume(VALID_INPUT)
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c5cd35d..d1a9cd5 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -154,6 +154,24 @@ static inline void *fdt_offset_ptr_w(void *fdt, int =
offset, int checklen)
>   */
>  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> =20
> +/**
> + * fdt_next_tag_full - get next tag in the device tree without any filte=
ring
> + * @fdt:	Pointer to the device tree blob
> + * @offset:	Offset within the blob to start searching
> + * @nextoffset:	Pointer to variable to store the offset of the next tag
> + *
> + * fdt_next_tag_full() returns the tag type of the next tag in the devic=
e tree
> + * blob starting from the given @offset. If @nextoffset is non-NULL, it =
will
> + * be set to the offset immediately following the tag.
> + * fdt_next_tag() can return only a subset of all possible tags performi=
ng some
> + * internal filtering. fdt_next_tag_full() doesn't perform this filterin=
g.
> + *
> + * returns:
> + *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_EN=
D),
> + *	FDT_END, if offset is out of bounds
> + */
> +uint32_t fdt_next_tag_full(const void *fdt, int offset, int *nextoffset);
> +
>  /*
>   * External helpers to access words from a device tree blob. They're bui=
lt
>   * to work even with unaligned pointers on platforms (such as ARMv5) tha=
t don't
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index cbfef54..7e2dde2 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -52,6 +52,7 @@ LIBFDT_1.2 {
>  		fdt_strerror;
>  		fdt_offset_ptr;
>  		fdt_next_tag;
> +		fdt_next_tag_full;
>  		fdt_appendprop;
>  		fdt_create_empty_tree;
>  		fdt_first_property_offset;
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--NPpP+Dznl1TrFoYA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloMigACgkQzQJF27ox
2GdKhhAAqQeJL1wPe2Tl1gIm9rGGom5x2UVbcFSMsI7/bmMvdIQg3q/b+oNfQJCh
QRBcCeEZHdA7tMbMUIIaf5gJskZqKKD21+jHk7XOxpjYOafbL93xDwznPldTI7og
jDC8C/7G+hDxmBe0j1JDWcbkpl+EGawNJhH4/OtII7n8HJkFPiksdUoWyqHrpLjM
FcIt59UOV0z34eJbybBG6fb0KJsSj5granXnRs4Pv0TiyLayABJWnBzsMoW44g+e
n1Ydl2fI+JHtksn9NhqYqaUJyi9CkcOkkx/tvoYNZaO3JTjlw97azcniBPY5m+R0
Xoot3Hh4QePY0c93IT6kZ76o1MPhLepzsGXtH9eHqZzhRsQkfVRI/L4LRGWl1z5t
rUUja96CMrqP9Q6VXI/GpmPDjoaPkRu0aq2OJhTMrFVEwbK6fTzM31FhSQNJYvGP
NITbkK6wxOSaS4MV4kPOXJuuQfXqIgkKe2qvx2L2aEoEfhOHq6pKVa76LIhX0vyR
W2KbeDwW0vkCmK/6aFm48nUkWEfG2+cPW1w/1zcxH7HqTnfn+0Knp/OwlZsNzuam
MEZReO6qoqQuQC0dS5v/J1AIXwRESGK4mUa4jkYVruakWT4+DQFYEp/tDpZNzVP+
503d0+MwHfz4DwlGgQpuQupODUFq5N5b9w2q/sQ8OLWK4kLRuT4=
=rxIN
-----END PGP SIGNATURE-----

--NPpP+Dznl1TrFoYA--
