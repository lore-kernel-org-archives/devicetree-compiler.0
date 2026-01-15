Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5645918FDBD;
	Thu, 15 Jan 2026 00:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438270; cv=none; b=g9VQGGigkFWcDIXc6bxxRDwRtAmMLv711osmigxTJvio0g5bGEvBq9WdnoPZooAhvSOS6iyVUnAFAUM7UZiVkFR+XX1AQkn+vLeducC+oPERQtJRtnh6rkFvQ1c/JviQdkNaufYn7loG1BDpm1FHWUV8L6PxIo0uD0LhMybxUJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438270; c=relaxed/simple;
	bh=Z+xX9T6/nsRQxX5aZ7j37Igm+lYKZ360hQEtgznnjyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXSB6x9RJuRgJEbVd0DMoy/E6z1Y6Yi0FVY+IpAXUcHmfzzdZ72e5Vjk3mGN6ByY4XBRBDt9HltBV3iQwz849eafmyTKH2wm5CgbDf98grhgwIyMckOSHtahS8nX/DKW4cWamU6d0YZZ0VIJHEZJffNGc7ggn4QvQFIf0ZGfQ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=BgAQQbnx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="BgAQQbnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768438265;
	bh=tT7zXdj1Rhj05vPP9k96QCyAQJe+1nNTZX/ZoUUUvHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgAQQbnxfJ/8prHAUEYuic3XeHWwx0Y4rHWGYG+4BSNYiyekkYlcvzmVfJD+rdeIA
	 n3ejI0n6NcOE+x49Kuy3/NZCbxK5A4cvs598I6UpoJucCp8bby43Q1SHRmk3wsMpqA
	 g/PpQm3/z4ff07tI7vdFOA+lDQMJFdafEQ5aA4e7YNpMm+m6VZN4FLIhSQaHlAo4xp
	 TGykEQVkL25QgE5xSw/Q+X/+/JTZ9cebyjVHK6SHyP5ZbaMj+I8YaF+KmvkhOMAjwN
	 +S3rRhrRBjMGwn8LQpJlnhoERfzYpUmLDvjrXz/P2xpFyELXvxAuhhy0sjxYz3Fi0T
	 XkUApnzBUnVDw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds4D96NSpz4wM0; Thu, 15 Jan 2026 11:51:05 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:48:44 +1100
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
Subject: Re: [RFC PATCH 09/77] dtc: Introduce mark_local_phandles()
Message-ID: <aWg5bD4zWYAQOYai@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-10-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5uIVwKk1wawCmcqf"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-10-herve.codina@bootlin.com>


--5uIVwKk1wawCmcqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:18:59PM +0100, Herve Codina wrote:
> In order to have the new FDT_REF_LOCAL tag present in a dtb, the phandle
> reference needs to be identify as a local reference.
>=20
> This is the purpose of mark_local_phandles().
>=20
> It identifies a phandle reference as a local reference when this
> reference points to a local node.
>=20
> With that node, the related FDT_REF_LOCAL tag is set in the dtb.

I dislike caching redundant information (whether the ref is local) -
it's an opportunity for them to get out of sync and cause bugs.  Is
there a strong case that you can't just determine whether it's local
only when you actually go to use it?

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc.c      |  1 +
>  dtc.h      |  1 +
>  livetree.c | 26 ++++++++++++++++++++++++++
>  3 files changed, 28 insertions(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index 88f03ff..d0b4de3 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -334,6 +334,7 @@ int main(int argc, char *argv[])
>  	}
> =20
>  	update_phandles_ref(dti);
> +	mark_local_phandles(dti);
> =20
>  	process_checks(force, dti);
> =20
> diff --git a/dtc.h b/dtc.h
> index 351fe41..08c9f07 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -346,6 +346,7 @@ void generate_fixups_tree(struct dt_info *dti, const =
char *name);
>  void generate_local_fixups_tree(struct dt_info *dti, const char *name);
> =20
>  void update_phandles_ref(struct dt_info *dti);
> +void mark_local_phandles(struct dt_info *dti);
> =20
>  /* Checks */
> =20
> diff --git a/livetree.c b/livetree.c
> index 9e30a63..2a0a7ed 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -1196,3 +1196,29 @@ void update_phandles_ref(struct dt_info *dti)
>  {
>  	update_phandles_ref_internal(dti, dti->dt);
>  }
> +
> +static void mark_local_phandles_internal(struct dt_info *dti,
> +					 struct node *node)
> +{
> +	struct node *c;
> +	struct property *prop;
> +	struct marker *m;
> +	struct node *refnode;
> +
> +	for_each_property(node, prop) {
> +		m =3D prop->val.markers;
> +		for_each_marker_of_type(m, REF_PHANDLE) {
> +			refnode =3D get_node_by_ref(dti->dt, m->ref);
> +			if (refnode)
> +				m->is_local =3D true;
> +		}
> +	}
> +
> +	for_each_child(node, c)
> +		mark_local_phandles_internal(dti, c);
> +}
> +
> +void mark_local_phandles(struct dt_info *dti)
> +{
> +	mark_local_phandles_internal(dti, dti->dt);
> +}
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--5uIVwKk1wawCmcqf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloOWsACgkQzQJF27ox
2GcFfw/+Nsn3pI1ST2XQbBW2xgzUYTiG/z9E2JHPz0AF+6DZyXT1UobX5vFZmwL+
s+ZBDqGJJFTdMC9H7ezKUYDPHDZX9b17YBfvuVZRKSB4M3Yb8bU9ql0W/fRh58Uw
V1t5aoXsAaYP4Mximc2a6k/cmApHVRFlUR1HXZl4aYYtUCHiSQQaRWfoR5rg0RvM
RnN3ab9cCtQz+lpG1Gny/vJblajJGquOursa08k/RcYyrhb3wwzU4RZPsFKO9Mep
SGD3CtYY5VBIGxOSYSYKxf0I31iE6Oj3BGjkEnxYIkBDWaGLTUA0JSdIkqFg6Clo
ORM5YuKmxVDkm5Tn1ZEeL0e58QKafV+ojwBYSI/aif3PnlfNopyaiPukqfROQUB3
TyH2bJrhTe8uzqT7G6gnNA+24GJLNGd5gY8d2K14HuE4Sua+7PneR0ZcZHYC4N91
pDrF82RpdfnGotL25PpLRW9hc6Nc0vjnyraiZ/XYUq3fuo7kQNwUS800WXZyKC2V
yGptRoW3hg/89qM6XT2QPHM67XRw4QfED6albURo9uNyP4vq8DUjjWa4f/AJv7as
U0aZE3zJ2mLgLB9haj23gP4YuzCnsSES2WvwUK2yG71M50n889CYL5FIA80JzHko
DNjodMVHVwItNg63wxKgo3Na33vTVyEMJIAup+QOZ2D1sVsXBlI=
=G1sL
-----END PGP SIGNATURE-----

--5uIVwKk1wawCmcqf--
