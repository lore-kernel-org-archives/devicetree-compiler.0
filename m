Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593309;
	b=Fry86dcNKYJjoDFWQz33669v/Wk87vInRxLhJCHEtSR9Cpfb/D/Hhy2vBi6uHBR8coAT
	 qnm2I9Qnge/Oyo6gEoyBngzC57K+JbVkyDKqXd65NfNpQDNOgETjxPxPc8BD1eaoG0YTn
	 lrAZHD8okLzFr6B5wOSw96wUFa/eVh+7wNAwhMDrVO5YfzYcFaGrk1pS+mzzKArVfVr25
	 YHY4N2jDOuPt5zMvSJGM5gUzhy2w5KOjtyaKgPGaD92w5xMFXmLAHY+CFB5f5Mm3k1wJ6
	 tbdHmvNJTEeB7/ecM8xzaSTBL4HW8iyzwZXRX8D/PZDU4NjA3kEeTvwASxewVSIHQmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593309;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9fPBi8kpE9FtmUCDf6lJOiN2bmO0tt8Bx6NMa+JGlIc=;
	b=QF4g2n6aSxHG6oTAcXk4kVM/R6XRCPbrSrbdhgXdK8kGSeT2dWGv2+FEidXLFIv5BqIA
	 3Kp8S57l9ACCEus71op1kFL+7craS3jHrg9qvHwEhsZbP6YmP4j1HK/iy6ENvJaCECiZI
	 cUI7SUbpWkoeLixszFZbrlx3PTP1dmk8Yk1Ac8BTQekkJB7ja+jigrdmEvsYkD3l/Z7e3
	 Ip+Gy9XRR3DOYEJkQNbVrmYyv/LcID/p9S7hKphpw7TX8ILeKuTipgA1h8MDvDERPW4BX
	 Rfn4iJbXOQ9ILtWAgi5ROsuPmw7THGGKzwtqQy9OUCvqayZI7EMcYOUYxKQ4kvnTRJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=kccogkn9;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6725606A324
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 04:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6725606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=kccogkn9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793593305;
	bh=9fPBi8kpE9FtmUCDf6lJOiN2bmO0tt8Bx6NMa+JGlIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kccogkn9HvaTlezyjtoxmKtofFIqjhg1q20odDc7qcWNVmgdUIj9sBzJQzuIpdxJh
	 TpsmgNKApa4r6PJaAIwGreFrrL3lBcRY9UWCRlQcbVzzXe+yBekkMssR6n33//OEEa
	 32i5BKNQygxxCgT3WMJbda6h69OeBiUPwdYofMKaJbzXIxmuX3SgH+Y/lH3ZewNjdk
	 lNbR7bGsfK6XmgELT7Mnu+8euhpuGtb8RHsTcKjy9Cw+k8q06MW5eCa4+bytmEylLp
	 slgF8KmPPT6FOcdt1x2NJ/OIw5ySflsIKwO6+0ClHsRJP8ZjM9ML8hy5E8Xn2oyJHV
	 Dt8246xIcMJ2w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jHz6x2qqzz4w1l; Mon, 02 Nov 2026 15:21:45 +1100 (AEDT)
Date: Mon, 2 Nov 2026 15:21:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Kelvin Zhang <zhangkelvin@google.com>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] libfdt: Check node names in one pass in fdt_next_tag()
Message-ID: <augPyPn7VSk8G3HG@gractus.seuss>
References: <CAOSmRzjuJmPc=59ebUaGfbWuDsd07RpoPM+Zu7qZomPB_zTx_g@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="8xyfbX5Rn1jYFGBN"
Content-Disposition: inline
In-Reply-To: <CAOSmRzjuJmPc=59ebUaGfbWuDsd07RpoPM+Zu7qZomPB_zTx_g@mail.gmail.com>

--8xyfbX5Rn1jYFGBN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 08:30:51PM -0600, Kelvin Zhang wrote:
> fdt_next_tag() skips the name of a node by calling fdt_offset_ptr()
> for each byte. Unless FDT_ASSUME_MASK includes ASSUME_VALID_INPUT,
> each call reads totalsize, off_dt_struct, version and size_dt_struct
> from the header again and checks the access against them. Every walk
> over the structure block skips the name of every node it passes, so
> this dominates lookups such as fdt_path_offset() in large trees.
>=20
> The structure block offset maps linearly to a pointer, so work out
> once per call where the range that fdt_offset_ptr() accepts ends.
> Check each access against that with plain comparisons, and find the
> end of the name with one memchr() over the rest of the range. The
> checks themselves don't change: a name that isn't terminated before
> the end of the structure block still makes fdt_next_tag() return
> FDT_END. The range is also capped at INT_MAX, since offsets are ints,
> so a header that claims more than 2 GiB now ends the walk instead of
> producing a negative next offset.
>=20
> With a 612 KiB tree (3,012 nodes) on x86-64, built with gcc -O2 and
> the default FDT_ASSUME_MASK, a full walk with fdt_next_tag() takes
> 122 us instead of 297 us, and fdt_path_offset() of /chosen, which is
> near the end, 148 us instead of 434 us. In Android's Generic
> Bootloader on an AArch64 device at 600 MHz, also with the default
> FDT_ASSUME_MASK, the fixups made to that tree after applying overlays
> take 23.3 ms instead of 33.1 ms.

Mostly seems a reasonable idea, and good job making sure to handle
overflows and other edge cases.  Some comments and queries below,
however.

>=20
> Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>
> ---
>  libfdt/fdt.c | 63 ++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 54 insertions(+), 9 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 56d4dcb..7325aa2 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -167,15 +167,59 @@ const void *fdt_offset_ptr(const void *fdt, int
> offset, unsigned int len)
>  	return fdt_offset_ptr_(fdt, offset);
>  }
>=20
> +/*
> + * End offset (exclusive, relative to the structure block) of the range =
that
> + * fdt_offset_ptr() accepts, capped at INT_MAX, so that callers making s=
everal
> + * accesses can check each of them with plain comparisons instead of rea=
ding
> + * the header again.
> + */
> +static unsigned int fdt_struct_limit_(const void *fdt)

I'd suggest this return an int, rather than unsigned, since int is how
offsets are generally represented in the API.

> +{
> +	unsigned int limit =3D INT_MAX;
> +
> +	if (!can_assume(VALID_INPUT)) {
> +		unsigned int base =3D fdt_off_dt_struct(fdt);
> +		unsigned int totalsize =3D fdt_totalsize(fdt);
> +		unsigned int avail =3D (base <=3D totalsize) ? totalsize - base : 0;

Since fdt_off_dt_struct() and fdt_totalsize() return uint32_t, it's
probably better to do the arithmetic in uint32_t, rather than plain
unsigned int (though they'll almost always be the same thing).

> +		if (avail < limit)
> +			limit =3D avail;
> +	}
> +
> +	if (can_assume(LATEST) || fdt_version(fdt) >=3D 0x11) {
> +		unsigned int size =3D fdt_size_dt_struct(fdt);
> +
> +		if (size < limit)
> +			limit =3D size;
> +	}
> +
> +	return limit;
> +}

Having created this function, it would be good to rewrite
fdt_offset_ptr() in terms of it, to avoid logic duplication.

> +
> +/*
> + * Checks @offset and @len > 0 like fdt_offset_ptr() does, against
> + * @limit =3D fdt_struct_limit_(@fdt).
> + */
> +static const void *fdt_offset_ptr_limit_(const void *fdt, unsigned int l=
imit,
> +					 int offset, unsigned int len)
> +{
> +	if ((offset < 0) || (len > limit)
> +	    || ((unsigned int)offset > limit - len))
> +		return NULL;
> +
> +	return fdt_offset_ptr_(fdt, offset);
> +}
> +
>  uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>  {
>  	const fdt32_t *tagp, *lenp;
>  	uint32_t tag, len, sum;
> +	unsigned int limit =3D fdt_struct_limit_(fdt);
>  	int offset =3D startoffset;
> -	const char *p;
> +	const char *p, *nul;
>=20
>  	*nextoffset =3D -FDT_ERR_TRUNCATED;
> -	tagp =3D fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
> +	tagp =3D fdt_offset_ptr_limit_(fdt, limit, offset, FDT_TAGSIZE);

I'm assuming the vast majority of the speedup comes from the
FDT_BEGIN_NODE case, and these other uses of the precomputed limit are
trivial.  Given that, I'm not really sure it's worth the more awkward
interface for those other cases.

>  	if (!can_assume(VALID_DTB) && !tagp)
>  		return FDT_END; /* premature end */
>  	tag =3D fdt32_to_cpu(*tagp);
> @@ -184,16 +228,16 @@ uint32_t fdt_next_tag(const void *fdt, int
> startoffset, int *nextoffset)
>  	*nextoffset =3D -FDT_ERR_BADSTRUCTURE;
>  	switch (tag) {
>  	case FDT_BEGIN_NODE:
> -		/* skip name */
> -		do {
> -			p =3D fdt_offset_ptr(fdt, offset++, 1);
> -		} while (p && (*p !=3D '\0'));
> -		if (!can_assume(VALID_DTB) && !p)
> +		/* skip name: check the rest of the block once, then scan it */
> +		p =3D fdt_offset_ptr_limit_(fdt, limit, offset, 1);

The 1-byte offset_ptr() is a little awkward here.  I wonder if it
would be nice to create an fdt_offset_ptr_string() which internally
computes the limit to safely pull a \0 terminated string from a given
offset.

> +		nul =3D p ? memchr(p, '\0', limit - offset) : NULL;
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
> @@ -221,7 +265,8 @@ uint32_t fdt_next_tag(const void *fdt, int
> startoffset, int *nextoffset)
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

--8xyfbX5Rn1jYFGBN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroD8gACgkQzQJF27ox
2GeEjA//ayq4UN9xXFbawt26ywHC+BEws4YDEfuTp96BUoTkUZMvP55wTGwOjQD0
HiswZqvNSlt8pY4KYJ1i0xisoAv25K603fcQXCjQgbiYSdcWZQPQKUDPs5IquYcQ
/IO3wZ7UteWxuumCivYKF7gmKsKYyCiVyj3T1Zl4cSUcOzhKxvpL71RIcT36OEdX
Nhjn2IzpesYKxn/LyqR0dAQpAeANjqv6xTkxEhkDo4fmesL2bJATAsqP+xt4ii8P
sIE7t0FoFs1DpahMTYYPiXODFLVDLYBUMY8cnV0IXmw6uInVOa73Bj3Ub8G09WWT
7Hgxg5Y48TY88vuQcOVDPGWbh2WCdLZQZ41Xh4Bw0Xqe+Tu2tQrJrRMn+OLNqL9G
k2/37m2eJXnUlT0qa07lHzojrTIA/vTApx+P2NNjg2/2gjH7Txtks/mvn9uvhsi6
ZcCbV0K7DV0D/+tI8r41bCrV8GUWzSxR/2uaZ2HMcVCCJI+xZTLNfQY4zD129qQQ
b8zsCrK7O4oB8ccsE+GIZLXL9UmqMeyo+BiswHAffFgQmkKmNZPXrzwrN3sh+WBn
pxVncO23cJW0yw9vCezKJRlBPv0veo2lG2SKA3BBJCwdHlvEZUbBUQRJ3cq6/BqO
o/M1aWVs4BC3Cm3IrPoBzHyYbRUZJGJeCUcayPO6qWITTA/bXdw=
=Lw4N
-----END PGP SIGNATURE-----

--8xyfbX5Rn1jYFGBN--
