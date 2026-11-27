Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751408;
	b=VXbqr0aJQsk1jWGNS7R3uG/l7B8aNrFEaMl4PnShe7cjdWgK9Q6+mwbRVSD/Vzba+RoM
	 WbVHpWAris312yGEO+Qr/BDgYcychu1r972ZzKOXYpNYBiKkASByNjy+UgeCUO4hss/e8
	 XZd9dhFCQawsxQakSeZm2OuYm6eKDL8y/x/TAVZWHy9cfiRzQd3vKGGC33ogOiaElOqw9
	 aNk2D/0L1Z8ePD34GaeiTmhL+pqSP12L3kGGo0BZ0zU1Wgsnu2G3Y+rYSfw3V2LSBTsQ3
	 2ACBuskKLpNFw0IsxKdpzZ3QqYhAu2uaslGSMMsRvJBR+tQnaOWZtnXXSxVIvSBfKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751408;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=emE1/TvcVAehfwSzcOhjOheKu08Ir5Dqvz5RQzvjtt0=;
	b=mc0Uya1ylsm3h2n1TypX6ei+IkBHWnAmaWKYnZGBcIHnXbPIm3wjUNiOwjfpoQ2T4hnf
	 0q7BBS+G70abMhTjqhQB5UnTWO4pqkurrRexyGuihyd+n72j5rFKppDV1jXtlz6owHU+4
	 Ki3BswbjAmnwFdZohJUAiWZTU/vNob+jeV07oaE2xBciamJkUd624QpXVR32kwwwE9ILg
	 ll8dc6x0yfYvQVWSzUvBSBWpLY17ylPkP79qCClnVx2HjXBMqq4aJ7gvtP4tOpHRJ+FW8
	 rbHzsOxj5070pUI3l0USvbfdve45ZVytPqr+b3j/ToCmGoaHg0+AmJ2Hv9gJcV+uLOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=vP20mEXv;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90303606A31E
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 03:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90303606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=vP20mEXv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795751404;
	bh=emE1/TvcVAehfwSzcOhjOheKu08Ir5Dqvz5RQzvjtt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vP20mEXvioV1xUfmCl+hl3M9oaAAclmvyzII2Li/m980j9Oo0+Qq8mmuNLc6ZyEdy
	 SEmQWBvjW36FZomKMKlNdPdISsziFjeXjnCAD63UJE1Z4BGvwL+oituZlSJG/QRxGN
	 gul5ql5yJRDpbL26TvRNy8Q3t4Gf+HI7BwxWCFWbFsXOxhxIlxx5V6OAnGKGPeXIeS
	 GEoDhIKmnUmpL3GmnmT7Q2L2YB19TeFI8XpPlUKWB4EniAw3B7x8X5wQzacgUKZXEN
	 enl1NnCLYXPnO+AyP5mIZZxL43axIqYHqLOSgEk48+stzTuZx9Lk6nCXBgsFIRExte
	 DUqbu7pYTiAiw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jbKDr2Gg6z4wJL; Fri, 27 Nov 2026 14:50:04 +1100 (AEDT)
Date: Fri, 27 Nov 2026 14:34:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 08/10] dtc: Move path-reference handling out of the
 grammar
Message-ID: <awj6SSdzpGKqFKCU@gractus.seuss>
References: <20261126184126.1472738-1-sjg@chromium.org>
 <20261126184126.1472738-9-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="o9b2CHPSV1R4ZjLZ"
Content-Disposition: inline
In-Reply-To: <20261126184126.1472738-9-sjg@chromium.org>

--o9b2CHPSV1R4ZjLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 11:41:07AM -0700, Simon Glass wrote:
> The grammar action for a top-level &{/path} { ... } holds its merge
> logic, including making an overlay fragment in a plugin.
>=20
> Move it into merge_ref(), which can tell a path from a label by looking
> at the reference, and use a single rule for both kinds of reference.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Patches 3..8 merged.


> ---
>=20
> Changes in v5:
> - Use the term 'source layer' rather than 'fragment'
>=20
> Changes in v4:
> - Look up the reference once, at the top of merge_ref()
>=20
> Changes in v2:
> - Combine merge_path_ref() into merge_ref()
> - Combine the rules for label and path references, using dt_ref
>=20
>  dtc-parser.y | 27 +--------------------------
>  livetree.c   | 31 ++++++++++++++++++++++---------
>  2 files changed, 23 insertions(+), 35 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 8e67182..993eb7b 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -192,32 +192,7 @@ devicetree:
>  				ERROR(&@3, "Label or path %s not found", $3);
>  			$$ =3D $1;
>  		}
> -	| devicetree DT_PATH_REF nodedef
> -		{
> -			struct node *target =3D get_node_by_ref($1, $2);
> -
> -			/*
> -			 * We rely on the rule being always:
> -			 *   versioninfo plugindecl memreserves devicetree
> -			 * so $-1 is what we want (plugindecl)
> -			 */
> -			if ($<flags>-1 & DTSF_PLUGIN) {
> -				if (is_ref_relative($2))
> -					ERROR(&@2, "Label-relative reference %s not supported in plugin", $=
2);
> -				/* A path is in the base tree and a label may be */
> -				if ($2[0] =3D=3D '/' || !target)
> -					add_orphan_node($1, $3, $2);
> -				else
> -					merge_nodes(target, $3);
> -			} else {
> -				if (target)
> -					merge_nodes(target, $3);
> -				else
> -					ERROR(&@2, "Label or path %s not found", $2);
> -			}
> -			$$ =3D $1;
> -		}
> -	| devicetree DT_LABEL_REF nodedef
> +	| devicetree dt_ref nodedef
>  		{
>  			struct source_layer *layer;
> =20
> diff --git a/livetree.c b/livetree.c
> index 18ac4ab..0be2da2 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -544,29 +544,42 @@ bool is_ref_relative(const char *ref)
>  }
> =20
>  /*
> - * Merge a source layer which refers to a label into the node with that =
label.
> - * In a plugin, a label which is not found becomes an overlay fragment.
> + * Merge a source layer which refers to a label or path into the node it=
 refers
> + * to.
> + *
> + * In a plugin, a path always refers to the base tree and a label may do=
 so, if
> + * it is not found. In both cases, the source layer becomes an overlay f=
ragment.
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
>  bool merge_ref(struct node *dt, struct source_layer *layer, bool plugin)
>  {
>  	struct node *target =3D get_node_by_ref(dt, layer->ref);
> +	bool ok =3D true;
> =20
>  	assert(layer->type =3D=3D LAYER_NODE);
> -	if (target) {
> -		merge_nodes(target, layer->node);
> -		return true;
> +	if (plugin) {
> +		if (is_ref_relative(layer->ref)) {
> +			srcpos_error(layer->ref_srcpos, "Error",
> +				     "Label-relative reference %s not supported in plugin",
> +				     layer->ref);
> +			ok =3D false;
> +		}
> +		if (layer->ref[0] =3D=3D '/' || !target) {
> +			/* Add a fragment@N node for the reference */
> +			add_orphan_node(dt, layer->node, layer->ref);
> +			return ok;
> +		}
>  	}
> -	if (!plugin) {
> +
> +	if (!target) {
>  		srcpos_error(layer->ref_srcpos, "Error",
>  			     "Label or path %s not found", layer->ref);
>  		return false;
>  	}
> -	/* The label may be in the base tree, so add a fragment@N node for it */
> -	add_orphan_node(dt, layer->node, layer->ref);
> +	merge_nodes(target, layer->node);
> =20
> -	return true;
> +	return ok;
>  }
> =20
>  /*
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--o9b2CHPSV1R4ZjLZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsI+kkACgkQzQJF27ox
2GeWxQ//bgZWanwxW1tDlMky90rq/6QlNeqj49TEQSAvcjg4hGGx+bPJZXokpIY4
FEFvbQL/acMP1+djNFPvbTpzUuiSYOQl7ZfgJWPuZrG9WO/6SSRX1OjyzqNHF2R8
YlhaV13/3h31s53U5as/TCRzk4ktYC6PTViyXyBde37ktux4FXIN6vFtfZl1kB6d
QrSlZzJKsYx9NeZYlMZtV/BT5uIFackg7RZkS9kQj4SGG32MRBIml/4czR1y85mY
zVf8B34uzukv+HZ5SXTTMHZyA04DnC9FqlGOq/nn/DiaU8ouUCdtLVWld0IX08T/
2JODyVXjqGoqNSvox+mzVi/gCypHAra7OS+VEHQvGVBNGOKkQqANW9LJqQh+e4YH
IEAJq8aCcozYeZ6KzVpE4TJCK0od3seZSSOIWPLG+P0ABUVLFYfQqaFY78YsaSTu
4ypZCpky9zBaJYWqjqpoH+Zkjxyb0y5OnJqkMJiNW8W1uW7Ft+l/n4g/waCBSIwW
zxGByI12QyCeNussTVcGvC7cuJ66fkSZA40UeOTm/mXbJuHexkko+Ng21NLM8nQf
y5XzP8YsGctVayL7bTxt3BDYnfEPxzxiOkjPhmadmjNP6O7sgVqHvg9rgzhqg5bb
Y0JlNGV/YHhYEcGmdnxx2/9FC7eciw7D8uCwZTmYu9J+SZhsY3I=
=rP8d
-----END PGP SIGNATURE-----

--o9b2CHPSV1R4ZjLZ--
