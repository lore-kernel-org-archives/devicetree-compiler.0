Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AB522DFA4;
	Thu, 15 Jan 2026 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460721; cv=none; b=GGVkukc7ABhnqM8YuxRrUabF2KlBjW6cTyRUd0ZAuGNIAaC+MMORvbdVod631aKFG8oEt9LZJoBiBw+x61bObbsistKZME5VxTREYeyTcuVrlR4p4mggkSORzcjUSS6JjDxdu5YEA+dfQ+4fKrKmAomZ/+dIklMAqvcnbDx7jqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460721; c=relaxed/simple;
	bh=oR65bwc/N1LXK9noAyyb9pwwO2AltIi11B+NQHo8Kmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzUW66gc2GlCkCRL9g2Icnio4ACBvxIiN5oOZTMUVP+xjci1X4O/ylN/Zq4JhS+lrMTL8YcmqrsQpzRNP4YcYFQfATeW8qC0E8YDuZQMOLhI2DIhloVsu4Bn2sPmZhjEJzoWdqTzru8OuvdTxs+RGdlTHz7AlMoP+jqzQJ5x104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=W+g20hbl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="W+g20hbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768460715;
	bh=5z3a7n2eITNYHyL73jcXA+OXs/PddEU63wV9SE/Wn8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W+g20hblm2ki78HsVa/1lROrjbPTxR5o3bZIcZXr1rpZOSSoSpO+TT+ow3NU01ILc
	 KiwRP2nhLle0Y1L7hsrDUMjLeNP1+L7fQ2/r8Pstojnl9HgrOC87wRDXySsCxRaIpD
	 gQNQZADDEPdpzfix4lwLThaMFm6NWiHxRuQeRuxz+hfPl9/naA2PDLN1xnYDu90Oy9
	 HhBISeMLV9ff5SPwh8vrxQXSeI4FzwzVkcxLKtCruwQZg5HSgdiLaDkatAcdbprGXA
	 aNaG6NuOOHqHOlX3DKhThRLNJjiY9HwH/fnW7LZdjxmO1aYQLKZkCzJKAZGfh8K7Ok
	 agUEsGpEEN8QA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsDWv6Gsvz4wM1; Thu, 15 Jan 2026 18:05:15 +1100 (AEDT)
Date: Thu, 15 Jan 2026 17:55:05 +1100
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
Subject: Re: [RFC PATCH 49/77] dtc: Handle orphan nodes in
 dti_get_xxx_by_yyy()
Message-ID: <aWiPSQOCipvvItyo@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-50-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bEl2kBzIw+DR38I3"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-50-herve.codina@bootlin.com>


--bEl2kBzIw+DR38I3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:39PM +0100, Herve Codina wrote:
> Orphan nodes have been introduced recently.
>=20
> Retrieving a node, a property and/or a marker from an orphan node tree
> is perfectly legit.
>=20
> Those retrievals are performed by the dti_get_xxx_by_yyy() functions
> family.
>=20
> Update them to handle orphan nodes.

I think at least some of the orphan node stuff can be separated from
the import/export symbol stuff, and dtb changes.  That can be reviewed
and merged first, which will simplify the review task.

The idea is this:  at the moment, when we have multiple tree sections
in the dts, we merge them all together into a single tree as we parse.
The idea would be that we first make a list of all those sections,
then perform the merge as a separate step from parsing.

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  livetree.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/livetree.c b/livetree.c
> index 057997a..fa9daff 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -789,6 +789,7 @@ static struct node *get_node_by_ref(struct node *tree=
, const char *ref)
> =20
>  struct node *dti_get_node_by_path(struct dt_info *dti, const char *path)
>  {
> +	struct node *orphan;
>  	struct node *node;
> =20
>  	if (dti->dt) {
> @@ -797,11 +798,18 @@ struct node *dti_get_node_by_path(struct dt_info *d=
ti, const char *path)
>  			return node;
>  	}
> =20
> +	for_each_orphan(dti->orphanlist, orphan) {
> +		node =3D get_node_by_path(orphan, path);
> +		if (node)
> +			return node;
> +	}
> +
>  	return NULL;
>  }
> =20
>  struct node *dti_get_node_by_label(struct dt_info *dti, const char *labe=
l)
>  {
> +	struct node *orphan;
>  	struct node *node;
> =20
>  	if (dti->dt) {
> @@ -810,11 +818,18 @@ struct node *dti_get_node_by_label(struct dt_info *=
dti, const char *label)
>  			return node;
>  	}
> =20
> +	for_each_orphan(dti->orphanlist, orphan) {
> +		node =3D get_node_by_label(orphan, label);
> +		if (node)
> +			return node;
> +	}
> +
>  	return NULL;
>  }
> =20
>  struct node *dti_get_node_by_phandle(struct dt_info *dti, cell_t phandle)
>  {
> +	struct node *orphan;
>  	struct node *node;
> =20
>  	if (dti->dt) {
> @@ -823,11 +838,18 @@ struct node *dti_get_node_by_phandle(struct dt_info=
 *dti, cell_t phandle)
>  			return node;
>  	}
> =20
> +	for_each_orphan(dti->orphanlist, orphan) {
> +		node =3D get_node_by_phandle(orphan, phandle);
> +		if (node)
> +			return node;
> +	}
> +
>  	return NULL;
>  }
> =20
>  struct node *dti_get_node_by_ref(struct dt_info *dti, const char *ref)
>  {
> +	struct node *orphan;
>  	struct node *node;
> =20
>  	if (dti->dt) {
> @@ -836,6 +858,12 @@ struct node *dti_get_node_by_ref(struct dt_info *dti=
, const char *ref)
>  			return node;
>  	}
> =20
> +	for_each_orphan(dti->orphanlist, orphan) {
> +		node =3D get_node_by_ref(orphan, ref);
> +		if (node)
> +			return node;
> +	}
> +
>  	return NULL;
>  }
> =20
> @@ -844,6 +872,7 @@ struct property *dti_get_property_by_label(struct dt_=
info *dti,
>  					   struct node **node)
>  {
>  	struct property *property;
> +	struct node *orphan;
> =20
>  	if (dti->dt) {
>  		property =3D get_property_by_label(dti->dt, label, node);
> @@ -851,6 +880,12 @@ struct property *dti_get_property_by_label(struct dt=
_info *dti,
>  			return property;
>  	}
> =20
> +	for_each_orphan(dti->orphanlist, orphan) {
> +		property =3D get_property_by_label(orphan, label, node);
> +		if (property)
> +			return property;
> +	}
> +
>  	*node =3D NULL;
>  	return NULL;
>  }
> @@ -859,6 +894,7 @@ struct marker *dti_get_marker_label(struct dt_info *d=
ti, const char *label,
>  				    struct node **node, struct property **prop)
>  {
>  	struct marker *marker;
> +	struct node *orphan;
> =20
>  	if (dti->dt) {
>  		marker =3D get_marker_label(dti->dt, label, node, prop);
> @@ -866,6 +902,12 @@ struct marker *dti_get_marker_label(struct dt_info *=
dti, const char *label,
>  			return marker;
>  	}
> =20
> +	for_each_orphan(dti->orphanlist, orphan) {
> +		marker =3D get_marker_label(orphan, label, node, prop);
> +		if (marker)
> +			return marker;
> +	}
> +
>  	*prop =3D NULL;
>  	*node =3D NULL;
>  	return NULL;
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--bEl2kBzIw+DR38I3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloj0gACgkQzQJF27ox
2Gc7eRAAqjX4r6lNs0/gKO6AEGXtNZxrU4qaYqpu6f46Q+y2hq1Smi6RAQ6uXsz5
huKjL2mbwGICIx6JiwXJPjGIYDbsYsvuMvawkVXvKjmFyMtVOfmS5hJmduG5m3Ov
AuUy2nhul6NUhJRnoh1BtOA4CQfiR1ag4dEmh4SJEsobfDriC8Wff/pmnIr5s1oV
LIPECrbf7N4zoU0QKn5fRqEVnFipHxfJtovG8s3BoA/rZmZRS8KOn/zGptrgxzoL
T9zVtDhvG4MLSfJOJyaTgxJVXYoEwXgy6y0GIg743oMupLmWTnCafSukQ/o6msJA
KE5itFLLiIN0bE50Sfk0QFqdW+haMe8Cteh1ozX71n7RGF4q1SEyWnGqN9Mxgmbu
26qg7BUfRH7Y4svfnODsym9o9jygoUBh9GdeDUSVN+jrD2RhiGKKrRFi8le2iFzL
a9Tag81TtQXGfXYi6X8g+OPX0yU8qXFgedop/+7ULZiY4i8FmSf0qOwCwMWXkoVy
0WlMa5zev9czou/H6Loic/VbeceRiS0ZmAoGFFJgJIBleyMpk6stNNS0vF1laUBX
6nC5yaHgC8se7roZEgYKh81ApPjgRB2BqHC44ZfTKtehTNPCye/DILzENxPOhsHS
TeMp7zzfommBMmrTfQgcUCJsbNt7nAd7gwz8yIba5h2YyDkNjAA=
=XHOw
-----END PGP SIGNATURE-----

--bEl2kBzIw+DR38I3--
