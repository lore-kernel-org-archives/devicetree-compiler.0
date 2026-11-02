Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793596299;
	b=ypVNSL7GEW7CQ+d7U0/iAAd0Gok70t8NxqA4u8MDfpzKbyIU8Dhnf2VilAVAc9vlsUvV
	 LeMumqPw3U6ZlrUi4HoBWWm9XbXoZfUYUcQS4AbVx1th42e4Ydbp3qPEsxG9Q4/KuU2KU
	 LXpG2JOT9x6j3yUWxH5BsV8PeeiOFSS+FiWvmY0B07zTrTgsOrnG+mFFOCFzgO8QYO+tO
	 SM0c9AAPuc08N4gmsH9vdrOaDT1+4XdZg84B90h95iTpyZ321nNEdN8ycVy5dnK/8uJfs
	 yFkVVdesVu+XgCz5MiSC4+A79mXBxVGW5ugGHpj2qFgBIL6Ip0tVJ8fYVEOUNcYb02w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793596299;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OKDUJYOnucWTA/guD7tCZFJssUjjq1MNZK64SfhFB9A=;
	b=uF8wHM/yK+eejHP21bGWlqHGjCIk6EHBMOSP1ECzAn0D2VrLvOVKR1jEQ2MAWGrifVyf
	 RpUSr6aoTjuoeGBedyyecBtZ+vh1DRLEfyB1IWYaNh3CFBOXLgIV3899aeHqQ4MFRjEuG
	 vrXHQqpe9xKZIcjwRFWxy4bmdH9TrMpu0pjuhTERBhVIocKGxtARMnZoi/mgREnTu3Rb+
	 pM61ubR38eI8QdY3fJc5aaI4VNCZwVkX0vVUMh/c1sQ+8YJ14WCHBYSxJAswpNLHKkXgy
	 eoIjWdzc8wOrsEAeFP+oUaHNsBLQsNyGE2HmfmQluT26HsAJkFB05iGCvksAqKxCWaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=O7JwJv68;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F37606A327
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 05:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F37606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=O7JwJv68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793596296;
	bh=OKDUJYOnucWTA/guD7tCZFJssUjjq1MNZK64SfhFB9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7JwJv68Fgx28Bb3a3rb9jYJ37NDPHa1fH76pjxicxytTHvPqP5b6ya+4im4MrCqe
	 z/wTHwDMjAo5H3K13R3W8yOa/esPRPRhsFc2Zt9h8fEZFe4AugLyy9qqbpvylgi8Lj
	 J7RLa7DBq/tn4Y4Df4SdpD6AvRAR39rBn8IEp0wPYoPYLCvyn0cdJIz/vJlzLjarT4
	 teeJbbrEMQ9kSyNXoHAPfPFw6jhFTnvU0QVWhOt1tUjN01Bmb7BPirtdxMXr7wtpPW
	 qQ0Rgn5SjRmk49HG+xsP/XsYFtEBkeUNIOL+LKEA9neJJA8zFBao7g9VlYjLiUp0fW
	 jvzD33gY22ttQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ0DS2RQpz4wC6; Mon, 02 Nov 2026 16:11:36 +1100 (AEDT)
Date: Mon, 2 Nov 2026 16:07:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Kelvin Zhang <zhangkelvin@google.com>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2] libfdt: Check node names in one pass in fdt_next_tag()
Message-ID: <augabGPqjBv7VfRp@gractus.seuss>
References: <CAOSmRzgk2r7tzMFuiPt+grOXO_WwAOL7Ymb=dsn4XsthF+Ctmg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="ght+7oz+9gwYd0aq"
Content-Disposition: inline
In-Reply-To: <CAOSmRzgk2r7tzMFuiPt+grOXO_WwAOL7Ymb=dsn4XsthF+Ctmg@mail.gmail.com>

--ght+7oz+9gwYd0aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 08:50:04PM -0800, Kelvin Zhang wrote:
> fdt_next_tag() skips the name of a node by calling fdt_offset_ptr()
> for each byte. Unless FDT_ASSUME_MASK includes ASSUME_VALID_INPUT,
> each call reads totalsize, off_dt_struct, version and size_dt_struct
> from the header again and checks the access against them. Every walk
> over the structure block skips the name of every node it passes, and
> also calls fdt_offset_ptr() two or three more times per tag, so this
> dominates lookups such as fdt_path_offset() in large trees.
>=20
> The structure block offset maps linearly to a pointer, so work out
> where the range that fdt_offset_ptr() accepts ends in
> fdt_struct_limit_(), rewrite fdt_offset_ptr() in terms of it, and
> compute that limit once per fdt_next_tag() call. Check each access
> against it with plain comparisons, and find the end of the name with
> one memchr() over the rest of the range. The checks themselves don't
> change: a name that isn't terminated before the end of the structure
> block still makes fdt_next_tag() return FDT_END. The range is also
> capped at INT_MAX, since offsets are ints, so a header that claims
> more than 2 GiB now ends the walk instead of producing a negative
> next offset.
>=20
> With a 612 KiB tree (3,012 nodes, 17,899 properties) on x86-64, built
> with gcc -O2 and the default FDT_ASSUME_MASK, a full walk with
> fdt_next_tag() takes 131 us instead of 291 us (227 us if only
> FDT_BEGIN_NODE uses the precomputed limit, as the other three checks
> run 65,745 times during the walk), and fdt_path_offset() of /chosen,
> which is near the end, takes 142 us instead of 382 us. In Android's
> Generic Bootloader on an AArch64 device at 600 MHz, also with the
> default FDT_ASSUME_MASK, the fixups made to that tree after applying
> overlays take 23.3 ms instead of 33.1 ms.
>=20
> Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>
> ---
> Changes in v2:
> - Return int from fdt_struct_limit_() (-1 if off_dt_struct > totalsize)
>   and use uint32_t for the header arithmetic.
> - Rewrite fdt_offset_ptr() in terms of fdt_struct_limit_() and
>   fdt_offset_ptr_limit_().
> - Check offset against limit directly in FDT_BEGIN_NODE instead of
>   calling fdt_offset_ptr_limit_() with len =3D 1.
> - Keep fdt_offset_ptr_limit_() for the other three checks in
>   fdt_next_tag(): in a 612 KiB tree (3,012 nodes, 17,899 properties),
>   those three checks run 65,745 times per walk and account for ~60% of
>   the full-walk speedup (291 us -> 227 us with FDT_BEGIN_NODE only ->
>   131 us with all four checks), especially when built with stack
>   protector flags on a low-clocked boot CPU.
> - Strip function context from @@ hunk headers to avoid MTA line wraps.

Thanks for all the fixes - looks like one different bug has been
introduced, but the rest now LGTM.

>  libfdt/fdt.c | 72 +++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 49 insertions(+), 23 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 56d4dcb..c0e9f4f 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -145,37 +145,60 @@
>  	return 0;
>  }
>=20
> -const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
> +/*
> + * End offset (exclusive, relative to the structure block) of the range =
that
> + * fdt_offset_ptr() accepts, capped at INT_MAX, or -1 if the structure b=
lock
> + * starts past totalsize.
> + */
> +static int fdt_struct_limit_(const void *fdt)
>  {
> -	unsigned int uoffset =3D offset;
> -	unsigned int absoffset =3D offset + fdt_off_dt_struct(fdt);
> +	uint32_t limit =3D INT_MAX;
>=20
> -	if (offset < 0)
> -		return NULL;
> +	if (!can_assume(VALID_INPUT)) {
> +		uint32_t base =3D fdt_off_dt_struct(fdt);
> +		uint32_t totalsize =3D fdt_totalsize(fdt);
> +
> +		if (base > totalsize)
> +			return -1;

Returning -1 here seems risky - if the caller doesn't explicitly check
for a <0 result, it might case to unisgned and think it can read
plenty.  0 seems safer - in the case of an invalid header, reading 0
bytes is the safest we can be.

> +		if (totalsize - base < limit)
> +			limit =3D totalsize - base;
> +	}
> +
> +	if (can_assume(LATEST) || fdt_version(fdt) >=3D 0x11) {
> +		uint32_t size =3D fdt_size_dt_struct(fdt);
> +
> +		if (size < limit)
> +			limit =3D size;
> +	}
>=20
> -	if (!can_assume(VALID_INPUT))
> -		if ((absoffset < uoffset)
> -		    || ((absoffset + len) < absoffset)
> -		    || (absoffset + len) > fdt_totalsize(fdt))
> -			return NULL;
> +	return limit;
> +}
>=20
> -	if (can_assume(LATEST) || fdt_version(fdt) >=3D 0x11)
> -		if (((uoffset + len) < uoffset)
> -		    || ((offset + len) > fdt_size_dt_struct(fdt)))
> -			return NULL;
> +static const void *fdt_offset_ptr_limit_(const void *fdt, int limit,
> +					 int offset, unsigned int len)
> +{
> +	if ((offset < 0) || (offset > limit)
> +	    || (len > (unsigned int)(limit - offset)))

Indeed this cast+test here is dangerous for a negative limit.

> +		return NULL;
>=20
>  	return fdt_offset_ptr_(fdt, offset);
>  }
>=20
> +const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
> +{
> +	return fdt_offset_ptr_limit_(fdt, fdt_struct_limit_(fdt), offset, len);
> +}
> +
>  uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>  {
>  	const fdt32_t *tagp, *lenp;
>  	uint32_t tag, len, sum;
> +	int limit =3D fdt_struct_limit_(fdt);
>  	int offset =3D startoffset;
> -	const char *p;
> +	const char *p, *nul;
>=20
>  	*nextoffset =3D -FDT_ERR_TRUNCATED;
> -	tagp =3D fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
> +	tagp =3D fdt_offset_ptr_limit_(fdt, limit, offset, FDT_TAGSIZE);
>  	if (!can_assume(VALID_DTB) && !tagp)
>  		return FDT_END; /* premature end */
>  	tag =3D fdt32_to_cpu(*tagp);
> @@ -184,16 +207,18 @@
>  	*nextoffset =3D -FDT_ERR_BADSTRUCTURE;
>  	switch (tag) {
>  	case FDT_BEGIN_NODE:
> -		/* skip name */
> -		do {
> -			p =3D fdt_offset_ptr(fdt, offset++, 1);
> -		} while (p && (*p !=3D '\0'));
> -		if (!can_assume(VALID_DTB) && !p)
> +		/* skip name: check the rest of the block once, then scan it */
> +		if (offset < 0 || offset >=3D limit)
> +			return FDT_END; /* premature end */
> +		p =3D fdt_offset_ptr_(fdt, offset);
> +		nul =3D memchr(p, '\0', limit - offset);
> +		if (!nul)
>  			return FDT_END; /* premature end */
> +		offset +=3D nul - p + 1;
>  		break;
>=20
>  	case FDT_PROP:
> -		lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> +		lenp =3D fdt_offset_ptr_limit_(fdt, limit, offset, sizeof(*lenp));
>  		if (!can_assume(VALID_DTB) && !lenp)
>  			return FDT_END; /* premature end */
>=20
> @@ -221,7 +246,8 @@
>  		return FDT_END;
>  	}
>=20
> -	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> +	if (!fdt_offset_ptr_limit_(fdt, limit, startoffset,
> +				   offset - startoffset))
>  		return FDT_END; /* premature end */
>=20
>  	*nextoffset =3D FDT_TAGALIGN(offset);
>=20
> base-commit: c22868416b8db8354ce5db29d3494dda688a2ae3
> --=20
> 2.56.0.385.gac671c819a-goog
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ght+7oz+9gwYd0aq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroGmwACgkQzQJF27ox
2Ge6hw/+Ou5pOCeXjwHXQppAMzTCgmj0LGjgZ4owGbJBg5tUgx1RRbeHgLe/oIHC
nHdDVqAe4ODJE6ylNyYkdpNolrLV1qddQ83tmsw0Q84qciUD59a2whqKf5U+Y5h6
i4CMMjwnDU8ERJDZK6fGTEKt63Q8qvAwRHtHGaTiKF79I/6+vSRYxq4RoOzfZIVW
FjRbEryx1ZzSrdzRkEoW0/r6neMAZ5nM6J9w0I3U94fp5ah16oVr/PRMpAU6zOnG
J8fDcgjROzYSSB2woRoiUtkv5TBfumtCaPiq6nSqRygEPqpBuZdeO2lvxltWYEz6
lNSJsOkaAg7xphNbwHXdlMbVptX1U9UgwBCEsuoX2ueqKa1+5QF10SZOgTDkI/To
qKDjqMBYkp33akiei2OBdTbE3z2jdhStqpuJTB+DXwbJ8zq7alyvSg6Pif/DpsqJ
pBiPBN0UJS8TF+QOMHzD73l5D1PyYN5n//iiXPrtW+dK/Nryjw902pgYpBu8eE1Z
SR36STWvPWAVrYYd3p18XSS+0wFa/YdnWMJfZKVOKI0vhmmqol1Bjol4JSKO1cuX
75kNNY1bBDUydKVTgAs7Wc+Kw4UYsu3LwTB7XQsHF2AiENgBSxzKLk1BIVKrx6Ya
4gsIl9Nk8je4BORhmuf3DRkze6nZGTZUrT+5N4gr5kTmVXxODUs=
=B7Z/
-----END PGP SIGNATURE-----

--ght+7oz+9gwYd0aq--
