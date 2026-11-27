Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751408;
	b=r0qicEsKeupE9wYR+lE8B2c/DuTqlCcD3FAvvfcc9LeNuoaX1weQlCLVXYC/CLz4rqZ3
	 69Y75XLcndOe90p1s7v37GHOl5sOCxqQgI+EK1MT2KfSsEudTzf3c1W3jxvzpVbQRkXCc
	 1GA9B/ujtJ7CeuOkW/S7yZDKLMcIfdIA8P57Dj2OQj8EPb7yw2iBc0B3mGuLbKZPzqosk
	 wbnR8WOG54Bm1a7BeUDqJpkahtYP4ODqlsFuPxchhNTeiplNT29/jMZ2km77nchK3YNNK
	 MFHNrJvL6wL+r91or0qwI7qso2ZRF1YG4usNgBC47WZwCzjQggkTFx7/gE6jXqk3a0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751408;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=mzXoqLGtmxg8VUydm6Smy6LxwLjxf2vKS1Or8TEr1pQ=;
	b=cpIsAJ0pJdBTxpK68yFCRAwtiAIVL+6pTSat1YliUAigr1oHUleXrCsIuol20dXKYElL
	 y10OnpvZt1Yvqk3WiBBDdJKMK2Ro6kJf9IIWQWhH+2XN2tXj8xUSQPbgap8FknwZxVp1n
	 bD7KXMVSHLL62lPPRG88P1nfy/sXu6JcSxRP6anjkTHDVtNmZDkWtP3W80HawUTzopebz
	 2W5tmrKul6pHi4eT7hxj5T7mw9zQ61Nur88PuMl+x1pPWf9zpEurKOPsKVG7R7aNxkaX4
	 NtTne7L7YrLvTYIxXnuwtDUVH/kt0BJ4rLHdM1p4JfM6bCWQ5z3jKY4W7GDyQa4RIag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=RCACbXzY;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90310606A321
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 03:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90310606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=RCACbXzY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795751404;
	bh=mzXoqLGtmxg8VUydm6Smy6LxwLjxf2vKS1Or8TEr1pQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCACbXzYiZmXZlDrtuVFtCuTsIUjFWoSiTNuI/f1JWnd+dN2vcF0O1g7eMAmPr+JJ
	 Y+wLWEjrFJkgw/M9D5rp+dJ/DOtVCzR47XkJu+Gqo59l8U6mVdVl/MLAdpytvowxd4
	 FL+gtxDTVAbFIH1hZXdbMr0soZZ+2cwkJBnG73N3wHqjNxVABUUigYhBvDh29wSWSX
	 QLe4HAFKcy0kuruk0d33dnjWouf6e1eWpFARvARpHMAliWUwWEg3kY72mzJFXBmBL0
	 ers7a0T+FASevuz4NjVqMtTencit6DmLKL/BN/e5gDHn8w9Ic4JO4mNHHbAyU3FYwq
	 Oy24gnQpfnTGQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jbKDr2Tq9z4wTc; Fri, 27 Nov 2026 14:50:04 +1100 (AEDT)
Date: Fri, 27 Nov 2026 14:49:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 10/10] dtc: Move first-reference handling out of the
 grammar
Message-ID: <awj91V_VRaV9Mw6B@gractus.seuss>
References: <20261126184126.1472738-1-sjg@chromium.org>
 <20261126184126.1472738-11-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="FyHbloWq406J/+qM"
Content-Disposition: inline
In-Reply-To: <20261126184126.1472738-11-sjg@chromium.org>

--FyHbloWq406J/+qM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 11:41:09AM -0700, Simon Glass wrote:
> In a plugin, the first source layer can refer to a label or path instead
> of being the root node. The grammar action for this holds its merge
> logic, which makes an overlay fragment in a new tree.
>=20
> Move it into a new merge_first_ref(), passing it a struct source_layer
> for the reference and node. This is the last user of is_ref_relative()
> in the grammar, so make that function static.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Though as noted, I don't see this as the final step.

> ---
>=20
> Changes in v5:
> - Use the term 'source layer' rather than 'fragment'
>=20
> Changes in v4:
> - Free the fragment after merging it
>=20
> Changes in v2:
> - Return true on success from merge_first_ref()
> - Use dt_ref instead of fragment_ref
>=20
>  dtc-parser.y | 15 +++++++--------
>  dtc.h        |  3 ++-
>  livetree.c   | 31 ++++++++++++++++++++++++++++++-
>  3 files changed, 39 insertions(+), 10 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 98b68b1..4a6da6d 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -164,19 +164,18 @@ devicetree:
>  		}
>  	| dt_ref nodedef
>  		{
> +			struct source_layer *layer;
> +
> +			layer =3D build_layer_ref(NULL, $1, &@1, $2);
>  			/*
>  			 * We rely on the rule being always:
>  			 *   versioninfo plugindecl memreserves devicetree
>  			 * so $-1 is what we want (plugindecl)
>  			 */
> -			if (!($<flags>-1 & DTSF_PLUGIN))
> -				ERROR(&@2, "Label or path %s not found", $1);
> -			else if (is_ref_relative($1))
> -				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1=
);
> -			$$ =3D add_orphan_node(
> -					name_node(build_node(NULL, NULL, NULL),
> -						  ""),
> -					$2, $1);
> +			if (!merge_first_ref(&$$, layer,
> +					     $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error =3D true;
> +			free_layer(layer);
>  		}
>  	| devicetree DT_LABEL dt_ref nodedef
>  		{
> diff --git a/dtc.h b/dtc.h
> index eaf247f..97db4dc 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -351,6 +351,8 @@ struct source_layer *build_layer_delete_node(char *re=
f,
>  struct source_layer *build_layer_omit_if_no_ref(char *ref,
>  						struct srcpos *ref_srcpos);
>  void free_layer(struct source_layer *layer);
> +bool merge_first_ref(struct node **dtp, struct source_layer *layer,
> +		     bool plugin);
>  bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin);
>  bool merge_delete_node(struct node *dt, struct source_layer *layer);
>  bool merge_omit_if_no_ref(struct node *dt, struct source_layer *layer);
> @@ -370,7 +372,6 @@ struct dt_info {
>  struct dt_info *build_dt_info(unsigned int dtsflags,
>  			      struct reserve_info *reservelist,
>  			      struct node *tree, uint32_t boot_cpuid_phys);
> -bool is_ref_relative(const char *ref);
>  void sort_tree(struct dt_info *dti);
>  void generate_labels_from_tree(struct dt_info *dti, const char *name);
>  void generate_label_tree(struct dt_info *dti, const char *name, bool all=
ocph);
> diff --git a/livetree.c b/livetree.c
> index a33f021..72552be 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -538,11 +538,40 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  }
> =20
>  /* Check whether a reference is relative to a label, e.g. &{label/node} =
*/
> -bool is_ref_relative(const char *ref)
> +static bool is_ref_relative(const char *ref)
>  {
>  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
>  }
> =20
> +/*
> + * Make the tree at *dtp from a first source layer which refers to a lab=
el or
> + * path, rather than being the root node. This is only valid in a plugin=
, where
> + * the source layer becomes an overlay fragment.
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_first_ref(struct node **dtp, struct source_layer *layer,
> +		     bool plugin)
> +{
> +	bool ok =3D true;
> +
> +	if (!plugin) {
> +		srcpos_error(layer->node->srcpos, "Error",
> +			     "Label or path %s not found", layer->ref);
> +		ok =3D false;
> +	} else if (is_ref_relative(layer->ref)) {
> +		srcpos_error(layer->node->srcpos, "Error",
> +			     "Label-relative reference %s not supported in plugin",
> +			     layer->ref);
> +		ok =3D false;
> +	}
> +	/* Make a new, empty tree with a fragment@N node for the reference */
> +	*dtp =3D add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
> +			       layer->node, layer->ref);
> +
> +	return ok;
> +}
> +
>  /*
>   * Merge a source layer which refers to a label or path into the node it=
 refers
>   * to, adding any label in the source layer to that node.
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--FyHbloWq406J/+qM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsI/dUACgkQzQJF27ox
2GdoYQ//UREMdk/gRWbSi7xusSm5mxK24kzCAxXDuim9vrxVMhRzAoeC3DWnWetX
rkeDydp1qCm+V/7UgBGzHhVqNCm0C0V959mylu+CuvX3cSxy1oOdY+FvVzCz7vCr
ld3598hmzjoquS3Q0ZtHHudiLaAIzOF+2ZwT8FB1nmyyFh3xqLouFxoU3mgzrNlq
rab0jkIjmFh9NclxW5OEbgWj/T+ovGOEengKPoQm0e/bGwKbElOK8RI+7tqkBBmg
KTw3GgetfQGnjgist86ZBeeGaJi7TYIadLnghEyZxWXXCH3A0D9kozvMdYLPNMuM
cEg9ZT0t1V079GCVIP4o1CSsq0JpS2CLiNvvvM0Ax9XN/+HvyPvR/BhXNdbLA/PX
tD6LkQu4FuatTw05wm+Z60I7rk28P2ziZdSprSiPhXRJ+BFzfrbxo1PbnaM1NDCr
1isPGWx0l1brpuKA3SgBzHEMJXxugFeNUCk9QQyRzNtvfXiiEjC/iZMH4NvYEH9+
38EeevwTQfQnJwhiOOXjD+qD4sthIkGSi9hhrAZyIV/6e9AU2qBKqe3CV6r1G4wL
hp2+b3WM0y1eeeAjpqTkCrNbuN6EFAK2r0tq0wXnMBKSfMBYaPvxDF31KKAIHsnn
DYTu5StFFip8iQsUSfB514MlPZrwhr+X2mv7qOk+vnhFKJtVLUI=
=54o6
-----END PGP SIGNATURE-----

--FyHbloWq406J/+qM--
