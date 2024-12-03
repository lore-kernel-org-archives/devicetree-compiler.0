Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8753484D02
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 04:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733201207; cv=none; b=Q81NjCRFWBvOa7FlcRkMCJ51Mb+ODg8tyI2H0wGT146Ix69PITIhnsm9kel9qTgkFQG/qPmbIkyrVTaiYPCTqzJTNCWswOjpbEgQabyZ9obrDIGtbKI58GWNKyBUSWcQqGYJQxfw259bXhB2+//sLcsqWcp+6rssydz3mlpTaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733201207; c=relaxed/simple;
	bh=YBOo14hxVESzm1lLXByrprQSc8S4o60S643J6omPE7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HprE/py5t9/BcQyz6Q27EffoJF/OG/5eE6xXUN2aQym+MN8jovVUsHTpFkXZG8SWIRpGZr4/q+Z/EOQ5TU0YLIPovL8Lc8G2NXwlEjfXYTYcKXXiHrXRA2cl7yM6mCUxDSvv7MibEK/5hb0+sh5cfwcUEixNpku1uOqeXDFpZBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=KdohzC2O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="KdohzC2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733201192;
	bh=fYw4wGBhg7z9PVDFdqM1HyNTGYJRiMqzd31nQGW7hAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdohzC2OJ/sHpoy2PmjXO6zSSfhcjvxQtveNV5qBVIFUgbFZmgcQhVoKgPB32eVOu
	 2V58M7GU1aXk+scUEupc7vn7S8HMH/sOjKNtxikzT9EY/sHb97l77NZ5ori+a5Gzd0
	 PMXMTNrz0KgJdTZGLW6ba3/htfn5ppKbJNoYDsHvuxcZo+Q41na6Tc3SqJh5yTSC4A
	 zEOiMebjZSAA45nTXjfwjWlC+7pnVR633DWBiTbpXSTG3bB1tFVmwVlLKlFw+y/1f4
	 vEGLTULOB5N8jG2b6y3jCaygqph2TkJQVsxuMv7ofeHPjLQgv6k7QJbwlskWK0uUis
	 yX2s5vf87pcIQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2Sm82Rn5z4x04; Tue,  3 Dec 2024 15:46:32 +1100 (AEDT)
Date: Tue, 3 Dec 2024 15:17:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/5] dtc: Allow path fixups in overlays
Message-ID: <Z06GPpmkDEPU1XUP@zatzit>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-1-ac3e121359e9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="14CQXwln2IrZbSwF"
Content-Disposition: inline
In-Reply-To: <20241116-overlay-path-v1-1-ac3e121359e9@beagleboard.org>


--14CQXwln2IrZbSwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 08:30:19PM +0530, Ayush Singh wrote:
> Enable generating fixups entries for path references. These are the same
> as the entries for phandles.
>=20
> Path properties have empty value in generated overlay. This allows easy
> differentiation between path references (size > 0) and path references
> (size =3D=3D 0).
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  checks.c   |  6 ++++--
>  livetree.c | 19 +++++++++++++++++--
>  2 files changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 6e06aeab5503f78c8a969f8d1d0e96be7b91749e..1ec59c6a1be375e1695b68203=
a0782cf23ee33fa 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -651,8 +651,10 @@ static void fixup_path_references(struct check *c, s=
truct dt_info *dti,
> =20
>  			refnode =3D get_node_by_ref(dt, m->ref);
>  			if (!refnode) {
> -				FAIL(c, dti, node, "Reference to non-existent node or label \"%s\"\n=
",
> -				     m->ref);
> +				if (!(dti->dtsflags & DTSF_PLUGIN))
> +					FAIL(c, dti, node,
> +					     "Reference to non-existent node or label \"%s\"\n",
> +					     m->ref);
>  				continue;
>  			}
> =20
> diff --git a/livetree.c b/livetree.c
> index 49f723002f855764452b30b5a979b6096730a33b..4e26d378e09407d6a395c2f1b=
bd73c1874de4ae0 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -908,6 +908,13 @@ static bool any_fixup_tree(struct dt_info *dti, stru=
ct node *node)
>  			if (!get_node_by_ref(dti->dt, m->ref))
>  				return true;
>  		}
> +		m =3D prop->val.markers;
> +		for_each_marker_of_type(m, REF_PATH)
> +		{

Opening brace goes on the same line as the for_each()

> +			if (m->ref) {


As for phandle references, you don't need to emit a fixup if the
reference can be resolved within the current tree, so you want a
get_node_by_ref() before returning true.

> +				return true;
> +			}

No braces around single statements in dtc style.

> +		}
>  	}
> =20
>  	for_each_child(node, c) {
> @@ -924,8 +931,8 @@ static void add_fixup_entry(struct dt_info *dti, stru=
ct node *fn,
>  {
>  	char *entry;
> =20
> -	/* m->ref can only be a REF_PHANDLE, but check anyway */
> -	assert(m->type =3D=3D REF_PHANDLE);
> +	/* m->ref can only be a REF_PHANDLE or REF_PATH, but check anyway */
> +	assert(m->type =3D=3D REF_PHANDLE || m->type =3D=3D REF_PATH);
> =20
>  	/* The format only permits fixups for references to label, not
>  	 * references to path */
> @@ -961,6 +968,14 @@ static void generate_fixups_tree_internal(struct dt_=
info *dti,
>  			if (!refnode)
>  				add_fixup_entry(dti, fn, node, prop, m);
>  		}
> +
> +		m =3D prop->val.markers;
> +		for_each_marker_of_type(m, REF_PATH)
> +		{
> +			refnode =3D get_node_by_ref(dt, m->ref);
> +			if (!refnode)
> +				add_fixup_entry(dti, fn, node, prop, m);
> +		}

I don't see how phandle fixups are distinguished from path fixups.

>  	}
> =20
>  	for_each_child(node, c)
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--14CQXwln2IrZbSwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdOhjQACgkQzQJF27ox
2Gcyfg/+O6LsW/zkt0WrrSf9SQUCSD6AagBGLcX9OvLJjLouuppg+trIeEeIp+GM
MSZyifHP5nymJ54CaPFlcZeHYBvVxyeZIdOQVH4TLATGdfDMLuxOlGU6FTRRWdbF
/SPntDXcQE5wT0JuqYeXr9wxrC/q6x7emSGt719/dDU8KjMx4MGsjcu4G1Yvd0mL
Rzqe8zqesG8jzvCw2UxHPf7pj6S2Jv4AX86oOseY7E/T7vIQgCFVkvBRKpv4Rtri
B1aJpMU2TYOX0vCexghRQrshZwWbsM47ij5uP1EALoqvn1ukymL+IeKCVICayKyx
H6aSeFE7kUPnx6Kca1BijVkCeCYvGkH3u1rpQpNZSpyDKgq7nou1bpcFparxgM0e
6AMzqYlzwSNeGRFiXwLnc3tjV6w4NRi+DaQ1BD40nNhShZLnGI2wUg0Dig4S1GS0
EClGxqJc2o/F21ZL4npNic3S3nnwcxLXuczcZjMNWQBUPcY4jRc2y9i/OnBbIw5x
STIeRhfEvdxp9ZRjyQWLPKkkV8OVSqs1M9nyJ8fsAeDcqC5S5TqdVja5TYUZ4dAS
oePXIxRpp498VVIKiLCywXUFbfmKKEqPUQZNwIIyBikIX7txkDeqhIlnAaMKGC4P
9RHDI7D+IPjDkvqzAijRe1UvUtCqL64Fc19/tz89h3iIkDRryNg=
=uFsu
-----END PGP SIGNATURE-----

--14CQXwln2IrZbSwF--
