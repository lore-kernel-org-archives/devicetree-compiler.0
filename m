Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042774BEE3C;
	Wed, 16 Sep 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549859; cv=none; b=bT7n84iBT1dM2MSwIKzaqcrnsYCeqo9xR8ClSEHkfzLPR1pebO0iGb/AE4OqeSfyK/X1bbATd9gQo7wuuyKz4M4WJxWXYoH9nb538TpfaqINyFfbyJpYJ60dpo7NNsHkJjX86h6gMyeJIj/6mWl6Dd3yX/2024e0zIzTv70pSh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549859; c=relaxed/simple;
	bh=PqViA2A2Xo0LCaIig8GBylMu0bOBONj/lMyTNod+zyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqYL1jAfapl2ZFpJ5NXeeOsztHyDrZ1ViLmytB9RqmWWwaBI2krN1pmiZIutJqWvOnPtNR3jmEQvAlJydFL9GlyyWO0numTimFnylfqPlkvkWd3B65/zYyCuYNjzt06Qog8KF1C722GMIAWmPWTN5pd0wCk0gF3nmeDgohQWRwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Wi/DvrUc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Wi/DvrUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789549822;
	bh=ysaatSxg5NoKmuov+Hi7xVS4TxDx4OjEZVXRAooBXQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wi/DvrUcbwCWpDUgeKX4AWmAQfaSHcTZbI/AT3PLOJ6cnpcwnXJtbnSKuCxdoQjK1
	 i0l8RJD8owHsvfGegFcXcLawlJSMk/OLuQN4VMlUUr1mqOs/RpwZK+wrXB4j+KDqHn
	 0L/xkzVTy8CYVPNge8yeYMwP4+BJ0hKRlgGLR3GbRjFhJgDHNCKrEyD5njnjk1m+Tm
	 5xfhg6FN4nZtbbVFHRKBI4Fpb3Yi6mhQD0yp4gk969kuh6zyz6/zKImaona9q9JQpn
	 qiLD9eMcb2p/WIyClCb7jTrsKF/2D6bBvuYf45Br6Na0pznK9s1ZmBkZdGIEz2mlJk
	 gJjSxhch8d/Wg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hlClf47qGz4wFT; Wed, 16 Sep 2026 19:10:22 +1000 (AEST)
Date: Wed, 16 Sep 2026 19:10:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 09/15] libfdt: Handle unknown tags in fdt_next_tag()
Message-ID: <aqpc9HZ2T74Q2lYs@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-10-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tKvK6YD3pdqYkH+t"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-10-herve.codina@bootlin.com>

--tKvK6YD3pdqYkH+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:40AM +0200, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error when they are read.
>=20
> libfdt uses fdt_next_tag() to get a tag.
>=20
> Filtering out tags that should be ignored in fdt_next_tag() allows to
> have the filtering done globally and allows, in future releases, to have
> a central place to add new known tags that should not be filtered out.
>=20
> An already known tag exists with the meaning of "just ignore". This tag
> is FDT_NOP. fdt_next_tag() callers already handle the FDT_NOP tag.
>=20
> Avoid unneeded modification at callers side and use a fake FDT_NOP tag
> when an unknown tag that should be ignored is encountered.
>=20
> Add also fdt_next_tag_() internal function for callers who need to know
> if the FDT_NOP tag returned is a real FDT_NOP or a fake FDT_NOP due to
> an unknown tag.

I'm a bit unsure about this one.  If we were designing the libfdt
interface from scratch, I'd definitely say that fdt_next_tag() - as a
low level function - should return every tag, and it's up to the
caller to skip unknown ones.  fdt_next_tag() already provides
nextoffset making it fairly easy to do so.

But, of course, we're not building from scratch so we do need to
consider backwards compatibility.  Supplying a skipping and
non-skipping version as you have here is the obvious approach.

But I'm not entirely convinced it's the only or best approach.  A user
which calls fdt_next_tag() is, in a sense, already opting in to
low-level handling of the dtb.  They could well already be broken by
new tags (depending on how they handle the default case).  Arguably
it's reasonable to require them to be updated (once only) for this new
family of tags.

Another potential approach would be to actually use the symbol
versioning we have, but have som far only minimally exploited.  The
LIBFDT_1.2 version of fdt_next_tag() would skip tags that postdate it,
but we'd introduce a new version tag and the new default version of
fdt_next_tag() would return all tags.  That would of course require
figuring out how to do that with the verison script.


> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  libfdt/fdt.c             | 75 ++++++++++++++++++++++++++++++++++++++--
>  libfdt/libfdt_internal.h |  3 ++
>  tests/run_tests.sh       |  9 +++--
>  3 files changed, 83 insertions(+), 4 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index eb803e8a..506e0dd3 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -167,7 +167,7 @@ const void *fdt_offset_ptr(const void *fdt, int offse=
t, unsigned int len)
>  	return fdt_offset_ptr_(fdt, offset);
>  }
> =20
> -uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> +static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *=
nextoffset)
>  {
>  	const fdt32_t *tagp, *lenp;
>  	uint32_t tag, len, sum;
> @@ -218,7 +218,37 @@ uint32_t fdt_next_tag(const void *fdt, int startoffs=
et, int *nextoffset)
>  		break;
> =20
>  	default:
> -		return FDT_END;
> +		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
> +			return FDT_END;
> +
> +		switch (tag & FDT_TAG_DATA_MASK) {
> +		case FDT_TAG_DATA_NONE:
> +			break;
> +		case FDT_TAG_DATA_1CELL:
> +			offset +=3D FDT_CELLSIZE;
> +			break;
> +		case FDT_TAG_DATA_2CELLS:
> +			offset +=3D 2 * FDT_CELLSIZE;
> +			break;
> +		case FDT_TAG_DATA_VARLEN:
> +			/* Get the length */
> +			lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> +			if (!can_assume(VALID_DTB) && !lenp)
> +				return FDT_END; /* premature end */
> +			len =3D fdt32_to_cpu(*lenp);
> +			/*
> +			 * Skip the cell encoding the length and the
> +			 * following length bytes
> +			 */
> +			len +=3D sizeof(*lenp);
> +			sum =3D len + offset;
> +			if (!can_assume(VALID_DTB) &&
> +			    (sum >=3D INT_MAX || sum < (uint32_t) offset))
> +				return FDT_END; /* premature end */
> +
> +			offset +=3D len;
> +			break;
> +		}
>  	}
> =20
>  	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> @@ -228,6 +258,47 @@ uint32_t fdt_next_tag(const void *fdt, int startoffs=
et, int *nextoffset)
>  	return tag;
>  }
> =20
> +static bool fdt_tag_is_unknown(uint32_t tag)

Regardless of what approach we decide to take, "unknown" is a
misleading term here.  As we add support for new metadata tags to
libfdt, they will no longer be unknown to libfdt.  But what matters
for the interface compatibility is whether they're unknown to the
caller, which we can't know.  So really this is checking for
structured tags specifically.

> +{
> +	switch (tag) {
> +	case FDT_BEGIN_NODE:
> +	case FDT_END_NODE:
> +	case FDT_PROP:
> +	case FDT_NOP:
> +	case FDT_END:
> +		return false;
> +	default:
> +		break;
> +	}
> +	return true;
> +}
> +
> +uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset=
, bool *is_unknown)


Nothing in this patch uses the is_unknown parameter.  Presumably
something later does, but it's not clear to me what it's useful for.

> +{
> +	uint32_t tag;
> +	bool unknown =3D false;
> +
> +	/* Retrieve next tag */
> +	tag =3D fdt_next_tag_all(fdt, startoffset, nextoffset);
> +	if (tag =3D=3D FDT_END)
> +		goto end;
> +
> +	if (fdt_tag_is_unknown(tag)) {
> +		unknown =3D true;
> +		/* Use a known tag that should be skipped by the caller */
> +		tag =3D FDT_NOP;
> +	}
> +end:
> +	if (is_unknown)
> +		*is_unknown =3D unknown;
> +	return tag;
> +}
> +
> +uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> +{
> +	return fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> +}
> +
>  int fdt_check_node_offset_(const void *fdt, int offset)
>  {
>  	if (!can_assume(VALID_INPUT)
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 0e103caf..f2e30ce8 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -20,6 +20,9 @@ int32_t fdt_ro_probe_(const void *fdt);
>  		}							\
>  	}
> =20
> +uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
> +		       bool *is_unknown);



> +
>  int fdt_check_node_offset_(const void *fdt, int offset);
>  int fdt_check_prop_offset_(const void *fdt, int offset);
> =20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 8fc23cb7..225c22f8 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -577,11 +577,12 @@ libfdt_tests () {
>      run_test dtbs_equal_ordered cell-overflow.test.dtb cell-overflow-res=
ults.test.dtb
> =20
>      # check full tests
> -    for good in test_tree1.dtb; do
> +    for good in test_tree1.dtb unknown_tags_can_skip.dtb; do
>  	run_test check_full $good
>      done
>      for bad in truncated_property.dtb truncated_string.dtb \
> -		truncated_memrsv.dtb two_roots.dtb named_root.dtb; do
> +		truncated_memrsv.dtb two_roots.dtb named_root.dtb \
> +		unknown_tags_no_skip.dtb; do
>  	run_test check_full -n $bad
>      done
>  }
> @@ -962,6 +963,10 @@ fdtget_tests () {
>      run_fdtget_test "<the dead silence>" -tx \
>  	-d "<the dead silence>" $dtb /randomnode doctor-who
>      run_fdtget_test "<blink>" -tx -d "<blink>" $dtb /memory doctor-who
> +
> +    # test with unknown tags involved
> +    run_fdtget_test "25601 25602" unknown_tags_can_skip.dtb /subnode1 pr=
op-int
> +    run_wrap_error_test $DTGET unknown_tags_no_skip.dtb /subnode1 prop-i=
nt
>  }
> =20
>  fdtput_tests () {
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--tKvK6YD3pdqYkH+t
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqqXPQACgkQzQJF27ox
2GfA4RAAjxNv430sRAl7YjCK4Q5Wymh/A9/ce2oJlBuQzSdc9w43W6Gz4Vn9HlkN
VTMlKFvDtkyCFtVb2KkDjPSc9MCQ/qFgJunwuznO0YL1f9+2NGiQQfdXGRV/pHYk
9tA2DgTeKAfKICVURMQWUNA8PzHKKwzebXLDWofjWB9Cv9+ESgebsWOIeX5q4UK1
j9W5KTs5P19bOBzFikVwsPzWYnRxbLw2abREngshCsPkG1n5+1h+K5iWKGM1ZjMH
nM4vmwQ32LdUKOA0tNH1dM6aaYVu2AOAXA9qu5ynL9NxxKyEZGJyPsgCYHuTpONx
nL+gwweS0R3/hJ2ppEMQM8xG4mq8rKU1xfCXOAda/oRb1bn2etELgNkivXrorqOJ
5cJ8WtRjcSprU7NM0hnFhlbceIDnv1f2nJpOj01ZiEt4EU/DAVYZ9m/UER4jwl0g
KwVJr3adOKe/f2OXp4qU6Wd4EXHlUVyHY7lcM0Go3w3MoUtKgn5uITmhbXyVPRm/
63GWZMWKNIjo7z7xa2Hh+w6e4ISHFdts6m6JHY3jliArlxJIhl0HBPZEDJKiRyPS
NqceQmJlZYpQbq+cB54JuF/Qsw44s0/bz2XFmEKeNo/IO5Gwlu/HHk08xHcfHD8z
i7zKt+63yMX69zI6pCY2VT4p6lSxvPYB+buUCrYIucqBTU+Riko=
=zo3m
-----END PGP SIGNATURE-----

--tKvK6YD3pdqYkH+t--
