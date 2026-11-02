Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600483;
	b=TFtFf+V5poOq8wzR7reUWrBw9yui6VmVjklaxVNZx2inXgJbC/09J6GhZ+owZY0nBNgR
	 CFhzqcFjkpyw74Mx3s6PsY1YkmRLymmYDDtc8dFlVPHmhVvv3PFyhzrlkHtOR6AT6fHmj
	 DzvhH87YyE5nO28P92y0wbThVweR4ESXSF8sqgmgWgU+2MHJcr59qX4Vo3aE3M1/hsfzf
	 LGwb9MXMxsxyXuZ4Lle2vymB9yC8wG84bFtxEr/FE6HSyVI2C53HznQd7fmkXoHk95a6k
	 mnNy3B09bnvuxv61sSKZNJ/hQDCvUvRPzXS8egDs2eHX0435cztBylT+7rhPzcm2sbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600483;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=l0dOVgIafaSxAL3NBYuFry+sBNugjaFrlqhLSK3LZ9I=;
	b=szbHp9jhB365Gy1BEfYf5N1nwdzCJ6WQDh07jzH+YzjMABZxUyBd3Az30nGWQRakR6Tv
	 ea0lBtK/qcwVMg+PPevbU4OGVs4zrC3L4ehdxhZTCPYsERTmSSmMwaObCOgBcRyAEzerb
	 Aj9f+Nze+8KCs6l+CD8mvBfFHjeccx1A/6nTTGaARP5fK1ocUqVu29sDKQUX0tx1ljTaO
	 b9UciR9w9zJWcN85HWIadIjPsGWmN8U0UiTaWdr/BjmWp/7OS4pk10HrQily8mru1m2IE
	 QTswr/OLUNlawbfU4XlUH33/TjCVlofs5xBkTfugsCbBUKMJwnwXwmqvy+LahZxXjbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="A/nFqbqd";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA54606A327
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 06:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA54606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=A/nFqbqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793600480;
	bh=l0dOVgIafaSxAL3NBYuFry+sBNugjaFrlqhLSK3LZ9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/nFqbqdESv/GRnist1c59icjoq87GgEY3x3k+3Y/Y/QL7IQRfBgKz/3BsVlS7Uba
	 gEVfMOYbDyHxfbY57c8Z//LgbDnHlzXTwXg5EeGoY8avSPXDj2ImPJWle4/duBOjsP
	 loXm7stFtkj40g6YBA3uYZPHZhk4HSMpoCwEmGLkrvjMLwcyNV6fB9uA/R61sBawLL
	 hL6IDHerA0I81Eqgsmo0Me+CVjSXUk8mjXbFseClWZdtIjsWMRjL6gAStx+JeCAxHG
	 JB3U4o7oBjnxOrdm9LeJO6VKbQnVcdMACnOo9g+GxIq16vr1JvOycuLib0SAaZEs3V
	 9drBBH9iElbHQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ1mw6TpHz4wC6; Mon, 02 Nov 2026 17:21:20 +1100 (AEDT)
Date: Mon, 2 Nov 2026 17:21:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Kelvin Zhang <zhangkelvin@google.com>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3] libfdt: Check node names in one pass in fdt_next_tag()
Message-ID: <augrz5mYrZNEGkH-@gractus.seuss>
References: <CAOSmRziU5g9WO2R86d3w0mBgNmtwpdHfKu9EXTSD9d5cw-pNcw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="5REsod4+IG62ycpJ"
Content-Disposition: inline
In-Reply-To: <CAOSmRziU5g9WO2R86d3w0mBgNmtwpdHfKu9EXTSD9d5cw-pNcw@mail.gmail.com>

--5REsod4+IG62ycpJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 12:10:21AM -0600, Kelvin Zhang wrote:
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

Merged, thanks.

>=20
> Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>
> ---
> Changes in v3:
> - Return 0 instead of -1 from fdt_struct_limit_() when off_dt_struct >
>   totalsize, so limit is never negative.
>=20
> Changes in v2:
> - Return int from fdt_struct_limit_() and use uint32_t for the header
>   arithmetic.
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
>  libfdt/fdt.c | 71 +++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 48 insertions(+), 23 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 56d4dcb..d9ccb70 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -145,37 +145,59 @@
>  	return 0;
>  }
>=20
> -const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
> +/*
> + * End offset (exclusive, relative to the structure block) of the range =
that
> + * fdt_offset_ptr() accepts, capped at INT_MAX.
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
> +			return 0;
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
> @@ -184,16 +206,18 @@
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
> @@ -221,7 +245,8 @@
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
> base-commit: 4e9e220985ec9541cc3fd598c57f0834d4836cc1
> --=20
> 2.56.0.385.gac671c819a-goog
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--5REsod4+IG62ycpJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroK9AACgkQzQJF27ox
2GdPew//QCi/3sRnp+6NupHeu0q9zNUqQFba0BnLqiSWgbFjkngygBKVwAiE2PM7
cTEH1dVrX5B819sqXj+0qYKuj2HzFwVxBwhQB7POpWfhZLqOPRRxKg6aRlvdvsoL
Fmm+EPfx4Qboo76Obg3Iu/REq7Blf5R4cObpgEw9oLzJvGoD/TFzrtlQLfkqTScE
W0ZeLtRLrV/uVo8dcDECeBVzI5Wgk8soz1mrEIB/wCUsoMWTtkmEnMRfIZF5P6qc
q7AEwGKTSrCgh8EX5CZAemwLc+2MfOdpKBnBC74HJBmpk/zU6HwlHzcSi85rdm60
bPyocL4/2DFjz1GNgI4efRsK/y1sM7CL9yMKtxffe53Af/O2t8ONYN+VNxX9n40y
U0k8zn9N4bCmdVJcCrdHRSutkgoO0YBsg2daFiCCnCKWfCnLbZSgebj03ZO9UOCu
nerZoRaasxxVM9Cn5qvA22SyVIglklLUPLPOQJQTus6/LkD6a4/QinUT2HMBfs99
WKLypJr4132dxwoor9pE0t9+WEVX3/1Ag1CvlEPXLrjGQmI+UZJetZ/GKkJ2HJ3t
pOimkCrGItyThvLpWYn+qRqKWm5pcJqcnPnkvrhHQKUbm+djyEMHkAuwSMlKFouj
BIF+Fpe7xPx9EXxJLdagbxbLnpsBJgAn2vJFX2j1loAR6kChQOk=
=T7px
-----END PGP SIGNATURE-----

--5REsod4+IG62ycpJ--
