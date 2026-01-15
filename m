Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B1E235045;
	Thu, 15 Jan 2026 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460720; cv=none; b=Cu7Xm0QgJARD2d34soQfNT8XYU9BvmTkli/zGl4SB/2I8ZtBRVDaUXGJrSKWxExVvPWqaB1ORf0h8mvBb7Ei2k1EjWcRhLJ5R2bPhzTIoCimKI0eyhLWNcnp7pahV4glYLpcjpFTMGQUWr86ODGhJyvGh85Fh5GhFjgts/ktt2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460720; c=relaxed/simple;
	bh=AjKxxCfQ2TLGKkG0LDN0zaUxPCyjtT4dxhzfosQcbgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7k5Sd5v7pnjojBeiQf9O5LiAEVoxHUOhZbsLGxz6yPkUpKTl/bIF6nzJWc8lS7hK/0q9qsB5DwQdbbQaDh7nyrB+Exf+YD/QUmLERBjtACmAq/IlCJ3Ma7ebnOES6frOVWOEWuOB7J+C4oTC2GHCx6Ra2rOq5II3BEY5wNrP+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=hqU730V6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="hqU730V6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768460715;
	bh=//0bBJ4V+clOBFTXS5/SKtKHQYt6Er7MpfnQym3XZ1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hqU730V6YXw5zkx0lRTloPivNO9mc4NNAkEAyeqamFxaaqEfBceIxWjT1NVnRzOmX
	 zhrcfK1kLilXpIJ73W+W1X/Zr9Z/BoLZLVKGmocwSJiOtIDH7Qa7xFtX4o7kRHY+sR
	 I2wQ3jZYsx2fN6J7BXu2WMUoOFsvdRoN95+/PAJd5qnfgFfV/bnMXSkfJOEgtZCIqF
	 iZN5mHS6Qw50vWo/BivgrtAPkyJCNRXdPxFL9vrUgEhulM3Ox+46AEkNrXeWdWdguU
	 UfcuwtpjAzD50Vfqk8+BLffLwZcKg2QxF/2/8okETsB9n+n9hSYePL6oZFTeDBqpnt
	 AoI7k31bIjWhQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsDWv5xQBz4w0L; Thu, 15 Jan 2026 18:05:15 +1100 (AEDT)
Date: Thu, 15 Jan 2026 17:51:30 +1100
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
Subject: Re: [RFC PATCH 46/77] dtc: Introduce dti_get_marker_label()
Message-ID: <aWiOcrj-1EB4cfO-@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-47-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tulP9S0b7FYUSioz"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-47-herve.codina@bootlin.com>


--tulP9S0b7FYUSioz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:36PM +0100, Herve Codina wrote:
> The future introduction of orphan nodes for addons device-tree will lead
> to more than one tree in the addons data. Those trees will be:
>   - the classical root tree starting at the root node
>   - trees related to orphan nodes
>=20
> Also, an addon device-tree can have only trees based on orphan nodes. In
> other words an addon device-tree is valid without having the classical
> 'root' tree.
>=20
> To prepare this change, introduce and use dti_get_marker_label().
>=20
> dti_get_marker_label() retrieves a marker and its related node and
> property based on the label value. It behaves in the same way as
> get_marker_label() but it works at the struct dt_info level.
>=20
> It handles the case where a 'root' device-tree is not present and will
> handle orphan nodes trees as soon as they will be introduced.
>=20
> This introduction doesn't lead to any functional changes.

For all of these functions, if the new one is basically replacing the
old one, don't change the name, just change the signature.

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  checks.c   |  5 ++---
>  dtc.h      |  4 ++--
>  livetree.c | 18 +++++++++++++++++-
>  3 files changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 75040c0..0a855f9 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -439,7 +439,6 @@ static void check_duplicate_label(struct check *c, st=
ruct dt_info *dti,
>  				  const char *label, struct node *node,
>  				  struct property *prop, struct marker *mark)
>  {
> -	struct node *dt =3D dti->dt;
>  	struct node *othernode =3D NULL;
>  	struct property *otherprop =3D NULL;
>  	struct marker *othermark =3D NULL;
> @@ -449,8 +448,8 @@ static void check_duplicate_label(struct check *c, st=
ruct dt_info *dti,
>  	if (!othernode)
>  		otherprop =3D dti_get_property_by_label(dti, label, &othernode);
>  	if (!othernode)
> -		othermark =3D get_marker_label(dt, label, &othernode,
> -					       &otherprop);
> +		othermark =3D dti_get_marker_label(dti, label, &othernode,
> +						 &otherprop);
> =20
>  	if (!othernode)
>  		return;
> diff --git a/dtc.h b/dtc.h
> index 399e7fa..d45a84c 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -318,8 +318,6 @@ const char *get_unitname(struct node *node);
>  struct property *get_property(struct node *node, const char *propname);
>  cell_t propval_cell(struct property *prop);
>  cell_t propval_cell_n(struct property *prop, unsigned int n);
> -struct marker *get_marker_label(struct node *tree, const char *label,
> -				struct node **node, struct property **prop);
>  struct node *get_subnode(struct node *node, const char *nodename);
> =20
>  uint32_t guess_boot_cpuid(struct node *tree);
> @@ -358,6 +356,8 @@ cell_t dti_get_node_phandle(struct dt_info *dti, stru=
ct node *node);
>  struct property *dti_get_property_by_label(struct dt_info *dti,
>  					   const char *label,
>  					   struct node **node);
> +struct marker *dti_get_marker_label(struct dt_info *dti, const char *lab=
el,
> +				    struct node **node, struct property **prop);
> =20
>  /* DTS version flags definitions */
>  #define DTSF_V1		0x0001	/* /dts-v1/ */
> diff --git a/livetree.c b/livetree.c
> index d023075..79f7b55 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -620,7 +620,7 @@ static struct property *get_property_by_label(struct =
node *tree, const char *lab
>  	return NULL;
>  }
> =20
> -struct marker *get_marker_label(struct node *tree, const char *label,
> +static struct marker *get_marker_label(struct node *tree, const char *la=
bel,
>  				struct node **node, struct property **prop)
>  {
>  	struct marker *m;
> @@ -853,6 +853,22 @@ struct property *dti_get_property_by_label(struct dt=
_info *dti,
>  	return NULL;
>  }
> =20
> +struct marker *dti_get_marker_label(struct dt_info *dti, const char *lab=
el,
> +				    struct node **node, struct property **prop)
> +{
> +	struct marker *marker;
> +
> +	if (dti->dt) {
> +		marker =3D get_marker_label(dti->dt, label, node, prop);
> +		if (marker)
> +			return marker;
> +	}
> +
> +	*prop =3D NULL;
> +	*node =3D NULL;
> +	return NULL;
> +}
> +
>  static void add_phandle_property(struct node *node,
>  				 const char *name, int format)
>  {
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--tulP9S0b7FYUSioz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlojnEACgkQzQJF27ox
2GfufA/7BXKqS2I2f1YeCZAelj2RY340mHR/KQ/blcqlwf9ip/CajXewC9bjoWh1
eBq7BOHECNREkjPUdkBvchI37FuEuuz3lmwMw8aEoog/GWevLjtlzyppFJaZmQXE
F9g6UbsMfjTwwluHfJbezU7sj+m9Nr4QgP/ZjrTbrvhc5tj03/XuiZcJT4wwqG0i
mhuwi2gORlCrylWYP0J4RfhJtTDvJuc7+DBOqKMJA4FlcxWx0NDENSPAfdhmbDKc
T7t+oSiloqJUqKT71BJdb+yWd7gdKOUR/y2IiZkjWvAwf5NrtZUd5IWoawim1+aJ
jW64o15K/JuBkTqSEqUsk0nBFAIZjJYCbA2NTG3qtlIf1lAoAj1lBYe8rgiLM5+M
RU+hQMLvCwlvIZm4b9fKX6rhEq4LCAuZniDFoz7qIAMmshSWiBnv0umeOjwPyswy
QWKjhgAWGoEHTL7OtOz376qLXm+vbuzyJKxQVRfkI3JBOMgo4GGwENciZAsoFv7s
vh1DJbMvRTew97iQP+9MoqtVZCxPACnZGQqZQscmXopzoxMXL2HeC4Bl6J91ZNe9
3EaJBnJeQIWtKFOhDnyDRW1DPuF7iQFPAZ8gKWPvfIISJ59EU3G2LJe1/VzvuU9T
i6viZlGtgRenAtteoo3bou4S4JIOiVOGxNKpKNZfrmkfrQk2vqY=
=R7ul
-----END PGP SIGNATURE-----

--tulP9S0b7FYUSioz--
