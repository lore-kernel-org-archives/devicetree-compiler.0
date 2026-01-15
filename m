Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF630BB89;
	Thu, 15 Jan 2026 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460721; cv=none; b=EMmQLUt0V5KTpnlAn7VP2rCRiXN1dhkgHNtDY/RsechZcnV7StkjYdipvcZ0HQervZVXpFprau0By4s6fCnZIEeY6zz2r7meSDEJ30TPIEZ99RQFeBFFtuEuy/hJtpR4uimUylWizRtbYT96doVPkcd9oIcmU0+zqLAlPob8GhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460721; c=relaxed/simple;
	bh=vRwWkjEzRu0D7otig+iqbEyTgouL0zw1fFbfbsT0DBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqUQWNujIpHnPyO3mSI93JRNsvvrzSPHF247PIRkYtbbfPN4SrvZSeKScinHKKxIY1e0q7jzAi9OCGQpAI+/o9ECP2uryKARpLbd9iV8GdDCts2meiYPNiBx+s3xWumOtiLTTIhnvA9rhVV+k6gQiabZNlkcSlKhJXSMfQ5Z6I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=rZ9QJDKa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="rZ9QJDKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768460715;
	bh=yaxDK6uVVjm0pIcBAPLYdP58x6Cgk2a2c6TzZntHE+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZ9QJDKan3ZZSN2kLfEniUDUTDGhgB6PBpjkPUWWV9J7mLlhrlKicqDky7J04kEjN
	 bIO4oCebcZfMGjdCVlf6c3tVboqek9P1EVTGjirxYReTv7lZ+WnrxHpCkjfUDEL4/k
	 nrQULS9Y5RfxcrQhCC9d67jw9p6crzdmpju6js9pDeZVjNLgSzhJWO6AdgaqwXUlom
	 p4VrKlCL2oADBND3tSQpIlUsOiz0e82UFaKnjz2aO2SWJLly6njJXZWUS2ZgRG9hxd
	 PgEotrzQleaJy/aV/mdnTcodUN7aUq+/asef2xQcN86pRydioEeKd3kekZWKpynfo4
	 UYq1gQW2jkeCA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsDWv5lKFz4wDk; Thu, 15 Jan 2026 18:05:15 +1100 (AEDT)
Date: Thu, 15 Jan 2026 17:47:29 +1100
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
Subject: Re: [RFC PATCH 40/77] dtc: Introduce dti_get_node_by_path()
Message-ID: <aWiNgZZ02-4jRc5l@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-41-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3bNS40IYXR/fHOTO"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-41-herve.codina@bootlin.com>


--3bNS40IYXR/fHOTO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:30PM +0100, Herve Codina wrote:
> The future introduction of orphan nodes for addons device-tree will lead
> to more than one tree in the addons data. Those trees will be:
>   - the classical root tree starting at the root node
>   - trees related to orphan nodes

This doesn't make sense to me.  The new function still just takes a
single path, nothing to specify which tree that path is looked up in.

You can probably guarantee that labels and phandles are unique across
all the trees.  Not paths, though.

>=20
> Also, an addon device-tree can have only trees based on orphan nodes. In
> other words an addon device-tree is valid without having the classical
> 'root' tree.
>=20
> To prepare this change, introduce and use dti_get_node_by_path().
>=20
> dti_get_node_by_path() retrieves a node by its path like
> get_node_by_path() but it works at the struct dt_info level.
>=20
> It handles the case where a 'root' device-tree is not present and will
> handle orphan nodes trees as soon as they will be introduced.
>=20
> This introduction doesn't lead to any functional changes.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  checks.c   |  2 +-
>  dtc.h      |  3 ++-
>  livetree.c | 15 ++++++++++++++-
>  3 files changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 9744431..b2b1bf7 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -740,7 +740,7 @@ static void check_alias_paths(struct check *c, struct=
 dt_info *dti,
> =20
>  		/* This check does not work for overlays nor addons with external path=
s */
>  		if (!(dti->dtsflags & (DTSF_PLUGIN | DTSF_ADDON)) &&
> -		    (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val))) {
> +		    (!prop->val.val || !dti_get_node_by_path(dti, prop->val.val))) {
>  			FAIL_PROP(c, dti, node, prop, "aliases property is not a valid node (=
%s)",
>  				  prop->val.val);
>  			continue;
> diff --git a/dtc.h b/dtc.h
> index 4ebe576..8ba093f 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -323,7 +323,6 @@ struct property *get_property_by_label(struct node *t=
ree, const char *label,
>  struct marker *get_marker_label(struct node *tree, const char *label,
>  				struct node **node, struct property **prop);
>  struct node *get_subnode(struct node *node, const char *nodename);
> -struct node *get_node_by_path(struct node *tree, const char *path);
>  struct node *get_node_by_label(struct node *tree, const char *label);
>  struct node *get_node_by_phandle(struct node *tree, cell_t phandle);
>  struct node *get_node_by_ref(struct node *tree, const char *ref);
> @@ -357,6 +356,8 @@ struct dt_info {
>  	const char *outname;		/* filename being written to, "-" for stdout */
>  };
> =20
> +struct node *dti_get_node_by_path(struct dt_info *dti, const char *path);
> +
>  /* DTS version flags definitions */
>  #define DTSF_V1		0x0001	/* /dts-v1/ */
>  #define DTSF_PLUGIN	0x0002	/* /plugin/ */
> diff --git a/livetree.c b/livetree.c
> index 285f6e1..23ba957 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -659,7 +659,7 @@ struct node *get_subnode(struct node *node, const cha=
r *nodename)
>  	return NULL;
>  }
> =20
> -struct node *get_node_by_path(struct node *tree, const char *path)
> +static struct node *get_node_by_path(struct node *tree, const char *path)
>  {
>  	const char *p;
>  	struct node *child;
> @@ -785,6 +785,19 @@ struct node *get_node_by_ref(struct node *tree, cons=
t char *ref)
>  	return target;
>  }
> =20
> +struct node *dti_get_node_by_path(struct dt_info *dti, const char *path)
> +{
> +	struct node *node;
> +
> +	if (dti->dt) {
> +		node =3D get_node_by_path(dti->dt, path);
> +		if (node)
> +			return node;
> +	}
> +
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

--3bNS40IYXR/fHOTO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlojYAACgkQzQJF27ox
2GeK2Q/+OiGCHpAc79fjmJEW/PFi9z5/B4HKa3iXVV430YHC1F/6z1oAXdKy1pLf
G9L+dH2/a7LFhJku5G/bslavarf0jNzRLUaZiIHRqBm1GNcJqCRXQmsTVpP20N0M
ZIQ5kiMwbZFKzO6vc/7tG+7XI53fJVQh9uY80JLtmq2MPoCQfv6WXveCdUpYCBfM
RxHYEtIdsemDYSA2QN+Umt13VHlDxLjukor7alFtkEX3EF0Oy+T2K2LzlLeoODjJ
bUIZYWOGLWY45QXC/6Hu3A+aoP9YCecN0bOv3oBH/XE8mt9/rSscMm3bHSzQxN3L
xSE/kZdrqXpPuRm/IrowOnTirC80Rqbs/1WwKvzF8HQ6WEqDlLf3ydiKZDkKzWbD
jUJPJPJRrm4h7XyEXxSKmxSsCzABSV5tVXXaTW/kRnneto8jB4Sx4iBRwWjL32bQ
Ppm8x4Vf+LLX2cO0y5GraMYD1eWAzr/EF/sRZ9EK5FpSVVNCnOIxE+FGiLHm13at
hsmXLJ47RLpje4X+Lgt+esUl/yP74+1M/hcEX7Tej3SAIH/ng4CzaYg/ak4K/YdD
g0zfn8JrWgfXD/yhwcucBfQmiVaZ0Yf0PEgl4r3pJgLy0kJ0Lg9T6FxD7cebpBkA
6ezHjS0NPYnWB6m9JMse7jBi75MYCGLR2rCt3cwOcrUN/g5AcnM=
=C0WH
-----END PGP SIGNATURE-----

--3bNS40IYXR/fHOTO--
