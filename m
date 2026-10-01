Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FEF23504B;
	Thu,  1 Oct 2026 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824047; cv=none; b=XxOSkW2m/3LVX6HchhOPER0vY/0u+6qik4izC+kkLWLLSpNKfK7Z5osuJ8O+k3n6fAArFdm0waRkPFMq5uXL254JBEHZvCusPIZz5cH4rbyiPzVIQ+kvYn9sd2DLD/sx5bGiDYFvwvw4YbalUv8WYX6cpq3GkrA3YhLrsxng4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824047; c=relaxed/simple;
	bh=JRi19CNJWdydvmgaCrO7Xm3Y8D+dm+m9bJQORLq/h5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPrcg/FHN8Y1h9mwqzhLWmc97Jg4lKvc9nuAidDAetJ/3wRUTisI6m66IQRtcPPQTFCNvTuvYY62+JF8SvTCkyGYcU84Q7mlWmWMCfRWbMk/l9B3ibv6MpQB3Btd3H4i70B//RsSObyJiIfWQPi5vSOqUVaMUtsBO8DIpXBxpaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=kyPVlzfQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="kyPVlzfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1790824008;
	bh=79l0PU9xsEA2c8px+aAYUOhYWnIthBLkoNxEU0uga80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyPVlzfQcU/eDARNoelEKnTremYQbUZJMl1sC6n92TrBv8gDMlhQoBUKEo09Z4e9m
	 4Y5koRMwGGGuri/NIH+kivozO8TPgopFarKETVce5HUrp7xMF5bdkpLxGlhm2AvbYU
	 /Aeu/99mbPN1Mc5S/DsJGH22oPchZ3ykaYqkxUYyHrEp7xT8Jw71AFQtcjJZLEIsKW
	 su0nfkbes273jcpags7EPJUBjFPV7S2mIQUkCUCyg/WKmZ5+0tYOLWARpxtZBwhO7Q
	 0U15GLmb9Gi5EjlDqSTqWaMozLHjfDKEYJpjZ+rnCUQQjwd2rlfOhBtoeS16IUiynI
	 nHELC0phMnImg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hwGzD6kZzz4w9b; Thu, 01 Oct 2026 13:06:48 +1000 (AEST)
Date: Thu, 1 Oct 2026 13:07:12 +1000
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
Message-ID: <ar3OSMgYqFPhLEqM@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-10-herve.codina@bootlin.com>
 <aqpc9HZ2T74Q2lYs@gractus.seuss>
 <20260917103410.1fcfe0f1@bootlin.com>
 <aqu0c3qMJOLoD0Ho@gractus.seuss>
 <20260917192814.70cbecbb@bootlin.com>
 <aq4Tg0cAD8z6IL9Q@gractus.seuss>
 <20260930183949.3f1b2fd2@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uuESIAIrR7/YWdu+"
Content-Disposition: inline
In-Reply-To: <20260930183949.3f1b2fd2@bootlin.com>

--uuESIAIrR7/YWdu+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 06:47:08PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Sat, 19 Sep 2026 14:46:05 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> >=20
> > > Upper layer using fdt_next_tag() should not handle this tag skipping =
the
> > > general case and let fdt_next_tag() do this job.
> > >=20
> > > Got the feeling that we are going to add complexity at upper layer to=
 handle
> > > a feature that should be handled at low level.
> > >  =20
> > > >  =20
> > > > > Ok, we can have a wrapper on top of
> > > > > fdt_next_tag() to skip unknown tags.
> > > > >=20
> > > > > fdt_next_tag() is a low level function but the rule related to sk=
ipping
> > > > > unknown tags is also a low level rule.
> > > > >=20
> > > > > We have to choose:
> > > > > a) fdt_next_tag() as I proposed
> > > > >    Of course ok for me
> > > > >=20
> > > > > b) fdt_next_tag() returns all tags -> Full handling at caller side
> > > > >    Ok, we can go in that direction but it will bring quite a lot =
of
> > > > >    code duplication.   =20
> > > >=20
> > > > I'm not sure it's that bad, since fdt_next_tag() loops will typical=
ly
> > > > already have a 'default' case for irrelevant tags, which will
> > > > generally be handled the same as unknown tags. =20
> > >=20
> > > Well as we did for "offset 0 vs real root node offset", I think the b=
est way
> > > to known if it's bad or not is to try. =20
> >=20
> > Agreed.
> >=20
> > > I will not have time this week to propose something and I have a trai=
ning
> > > next week.
> > >=20
> > > If you're ok for a try, I will do it but not as quickly as I did for =
the
> > > "offset 0 vs real root node offset" topic.
> > >  =20
>=20
> I did my homework and I think I was wrong. fdt_next_tag() can return all =
tags
> without adding too much complexity in current code.

Right, I suspected that would be the case.

> Here is the diff to consider that fully replaces this current patch.
>=20
> You can note that I've added the FDT_TAG_IS_SKIPPABLE() macro. This macro
> should be added in a previous commit introducing structured tag (or skipp=
able
> if renamed). According to discussion we've already had related to "struct=
ure"
> tag format, the FDT_TAG_IS_SKIPPABLE() macro content will not be that one=
 but
> you've got the idea of its usage in the diff.

Ok.  I'm having second thoughts about the "skippable" terminology
based on the complications for read-write access, but I'll discuss
that in full elsewhere.

Whatever we call it, the idea of an is_new_style(tag) macro makes
sense.

> --- 8< ---
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index eb803e8a..e426414b 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
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
> @@ -303,6 +333,7 @@ int fdt_next_node(const void *fdt, int offset, int *d=
epth)
>  		switch (tag) {
>  		case FDT_PROP:
>  		case FDT_NOP:
> +		default: /* All Skippable tags */
>  			break;
> =20
>  		case FDT_BEGIN_NODE:
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index f41a355f..55138261 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -73,6 +73,8 @@ struct fdt_property {
>  #define FDT_TAG_CAN_SKIP(tag_data, tag_id) \
>  		(FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE | tag_data | tag_id)
> =20
> +#define FDT_TAG_IS_SKIPPABLE(_tag) (((_tag) & (FDT_TAG_STRUCTURED | FDT_=
TAG_SKIP_SAFE)) =3D=3D (FDT_TAG_STRUCTURED | FDT_TAG_SKIP_SAFE))
> +
>  /* Tests reserved tags */
>  #define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, 0)
>  #define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0)
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index 2fd5b61d..8bd9b252 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -45,7 +45,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  			return nextoffset;
> =20
>  		/* If we see two root nodes, something is wrong */
> -		if (expect_end && tag !=3D FDT_END && tag !=3D FDT_NOP)
> +		if (expect_end && tag !=3D FDT_END && tag !=3D FDT_NOP &&
> +			!FDT_TAG_IS_SKIPPABLE(tag))
>  			return -FDT_ERR_BADSTRUCTURE;
> =20
>  		switch (tag) {
> @@ -92,7 +93,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  			break;
> =20
>  		default:
> -			return -FDT_ERR_INTERNAL;
> +			/* Skippable tags -> Skip them */
> +			break;
>  		}
>  	}
>  }
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 856c62f1..3cc0435c 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -219,7 +219,7 @@ static int nextprop_(const void *fdt, int offset)
>  			return offset;
>  		}
>  		offset =3D nextoffset;
> -	} while (tag =3D=3D FDT_NOP);
> +	} while (tag =3D=3D FDT_NOP || FDT_TAG_IS_SKIPPABLE(tag));
> =20
>  	return -FDT_ERR_NOTFOUND;
>  }
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
> --- 8< ---

That looks fine, except insofar as other changes we've already
discussed will require updates here too.

> Also I've modified tests/dtbs_equal_ordered.c but I am not sure that the
> modification I did is a modification you will accept.
>=20
> We could just ignore skippable tags but I choose to test data when such an
> skippable tag is encoutered.
>=20
> This leads to the following modification:
> --- 8< ---
> --- a/tests/dtbs_equal_ordered.c
> +++ b/tests/dtbs_equal_ordered.c
> @@ -71,6 +71,7 @@ static void compare_structure(const void *fdt1, const v=
oid *fdt2)
>  	int err;
>  	const struct fdt_property *prop1, *prop2;
>  	int len1, len2;
> +	const void *raw1, *raw2;
> =20
>  	while (1) {
>  		do {
> @@ -102,6 +103,9 @@ static void compare_structure(const void *fdt1, const=
 void *fdt2)
>  				     name1, name2, offset1, offset2);
>  			break;
> =20
> +		case FDT_END_NODE:
> +			break;
> +
>  		case FDT_PROP:
>  			prop1 =3D fdt_offset_ptr(fdt1, offset1, sizeof(*prop1));
>  			if (!prop1)
> @@ -128,6 +132,36 @@ static void compare_structure(const void *fdt1, cons=
t void *fdt2)
> =20
>  		case FDT_END:
>  			return;
> +
> +		default:
> +			if (!FDT_TAG_IS_SKIPPABLE(tag1))
> +				FAIL("Cannot check tag data at (%d, %d)",
> +					offset1, offset2);
> +
> +			/*
> +			 * Even if we don't known the meaning of data,
> +			 * we can check that raw data are the same.
> +			 */
> +			len1 =3D nextoffset1 - offset1;
> +			len2 =3D nextoffset2 - offset2;
> +
> +			if (len1 !=3D len2) {
> +				MISMATCH("tag data length mismatch at (%d, %d)",
> +					offset1, offset2);
> +			}
> +
> +			raw1 =3D fdt_offset_ptr(fdt1, offset1, len1);
> +			if (!raw1)
> +				FAIL("Could get fdt1 raw buffer at %d", offset1);
> +
> +			raw2 =3D fdt_offset_ptr(fdt2, offset2, len2);
> +			if (!raw1)
> +				FAIL("Could get fdt1 raw buffer at %d", offset2);
> +
> +			if (memcmp(raw1, raw2, len1) !=3D 0)
> +				MISMATCH("Tag data value mismatch at (%d, %d)",
> +					 offset1, offset2);
> +			break;
>  		}
>  	}
>  }
> --- 8< ---

So, as I mentioned elswhere a version of dtbs_equal_ordered that also
checks tag data sounds like a very useful tool.  But, I can also see
the use of comparisons that ignore metadata tags.  So, I think we want
both variants.  That could be either separate test binaries, or an
option to dtbs_equal_ordered and/or dtbs_equal_unordered, whicever
turns out easier.

> With that done, my conclusion is: Yes we can return all tags in fdt_next_=
tag().
> I think you will agree this conclusion.

Excellent.

> For dtbs_equal_ordered.c, should we compare skippable tags and related da=
ta as
> I did (diff above) or should we just skip them? what is your
> opinion?

As above, I think we want both options.

> For the next patch ("libfdt: Handle unknown tags on dtb modifications")
> returning all tags from fdt_next_tag() has also some impacts but nothing =
more
> complex than modification provided here. I can provide the full diff if y=
ou
> want. Let me know.

Not for now, leave it until you post the next revision of the series.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--uuESIAIrR7/YWdu+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmq9zkgACgkQzQJF27ox
2GcLSA//ZwnRGgcYS4zA5QfYRwPFSY4YFG2+itM+V8B7V2Uxidr5xsBZekflfZAy
UqjC5I5NR86g+LCd1D1Z2OcI4hFQvU2mk20E0U/MvxToixR53yAwVaf+CyE8YBxB
t9M1o8YTJHq/jm7PqerghzTwfaXcZmdRV3/8MhYs8CYZVPE2c6QQ+pME0/qdtdI1
anC4VT6eqx0IzpyyX9WggtvNhMuSgS+uCppZ6jU9rMbZ/jOKSm92dvRHMBUX01U0
NWLY4IU6eviBvx3jyPi8Ssxd0QKs0WgoXO8Ffe95CqyzgRP/Q/FwLt23r/zWh6zc
Gb0ZXK/k7BQ2CfQIHcaU9k6RcbtLxG7Y1ImoSeuQya/akuivZDBVYV7j0lMoL2pc
j3xdeUDAv90qlTcjItdMTdYQzmrPwJYXGWXhulTH/0ojk2OFv6Qw4INMEUFIFM5i
5F56SR1qKCUKOb+AKSvjbt8BDKd2yAR/h3NcFyZ5+MsVAIMDj45SedCDBoV1Z+D6
pE/qwKZJinek7/GWtKpAmHiiKYdgrdQNl6m//nFoTARyBPBSPnkp2VjzOHbOhVV6
CV4QnljnHSgQCVrhWvPUDXIwEj6TocMBaHU4oFTfcA3yEsGZ3HPqgbC8mEMVH1rj
Bkjr66ehwLzVH4DdsENASWNBC99kjSRaa/wdxOixlXhv36bC6MM=
=visW
-----END PGP SIGNATURE-----

--uuESIAIrR7/YWdu+--
