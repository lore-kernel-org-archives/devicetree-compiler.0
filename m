Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587540;
	b=DC6tnUQh2I1/kE3Lk5poVOfVhN6iFYj/SWORkVtqv9Z3NmKZq64159E3ha+fDuBQNI2j
	 idRVif+nx/TZ3gexb9bDpulvN4/fHcmtGVQKGSo8E37WP518EjUiJZCrFbdf7CN/8iNGL
	 U+HrOWYReDJxkiVocy0xlgTrburxdoQE1FQ3P0vRQgocTkabDqBOrlPVzSjjf4VCkXZjI
	 cuqvRF1yBuyGTcUGAvYLLd2rhYo3Qf0Vipc3iNV/Lf9/RjdQ5qFEExcI/DnRkPZC9B9QH
	 ebkStRSeZP64K9sBNy+24+BOMWzV0SErsVgIT7NHbuNbppMvtNHVCpVdOkQsWLzQAjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587540;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Y8G1INxk8Nx2WpEiNEzUaPwbSr2UbbIQ91liPuVTshA=;
	b=mfDyx5hM7YxQ7dfNbe0WQCzP9uKLpoKk5rXvdwttTRg8N/K0pAfuAQBbpAanIMSGjJ0u
	 AeDEo0n4cmZxZ2mz3gYaCSFte9Vb7iTOKspBreNlzaR4It+PKG1/3ZNANbar3V+/GJUga
	 DRsuxqYY1QDm9zKa7cFbbdjvFNfXGI5rt1fx/MkueW0osE0L2Y/0+dJrcMI2Z751gckip
	 +VKdZUWjBGXg+0/sCnDKR8Ed14Z2A7N0Xa5/DJtsI2bT6pVKPH3FHbLmz8H9qmmEDBb3i
	 TEWkhgymzLTpNQp5vbX5mk5c7/ZYE/s2dsONAd+sJ/V/UrEx+1iUleTWhUNrHZ+vEhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gErPElQy;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD0D606A68E
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 06:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD0D606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gErPElQy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795587536;
	bh=Y8G1INxk8Nx2WpEiNEzUaPwbSr2UbbIQ91liPuVTshA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gErPElQyGa7NTlfqjH4QofJLZUvTw2CHa5nwCZGIV3+61qrw94AgXEYwQ88jLP0KQ
	 ndYyRvMxZaJiLLaZleMRGtvuoCcrxpwW2IQTIWT8bc51NXqhsngZCdJm1e5Q98IpIn
	 YCQ4nJs/PcOfn36yS6fkLhVmZgcOHS8p45r5z0/8LLbmfmkI4KIPpVA+7WCh1fTpjX
	 dqM0fzqmWbyl0Ny0qfjR/ff0GL3MLwDkGbus98aSxWFJiuU1K/TfiyTiXvO4M4lMJT
	 EFT/C//GxTE84teRTfaSuFTwLVLK9w6g3+OXLEjFMb2FlY/sqxqENEE7MQz2xp86MU
	 PBeP2rKv9Q9AQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ8dX4lSXz4wTk; Wed, 25 Nov 2026 17:18:56 +1100 (AEDT)
Date: Wed, 25 Nov 2026 17:18:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 08/10] dtc: Move path-reference handling out of the
 grammar
Message-ID: <awZ9zLGb0hj-38US@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-9-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="LhVCKVTytCjo9meo"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-9-sjg@chromium.org>

--LhVCKVTytCjo9meo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:58:02PM -0700, Simon Glass wrote:
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Excepting the name change.

> ---
>=20
> Changes in v4:
> - Look up the reference once, at the top of merge_ref()
>=20
> Changes in v2:
> - Combine merge_path_ref() into merge_ref()
> - Combine the rules for label and path references, using dt_ref
>=20
>  dtc-parser.y | 27 +--------------------------
>  livetree.c   | 30 +++++++++++++++++++++---------
>  2 files changed, 22 insertions(+), 35 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 7e1e6c7..c85b77d 100644
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
>  			struct fragment *f;
> =20
> diff --git a/livetree.c b/livetree.c
> index 2ed57ae..290467f 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -541,29 +541,41 @@ bool is_ref_relative(const char *ref)
>  }
> =20
>  /*
> - * Merge a fragment which refers to a label into the node with that labe=
l. In
> - * a plugin, a label which is not found becomes an overlay fragment.
> + * Merge a fragment which refers to a label or path into the node it ref=
ers to.
> + *
> + * In a plugin, a path always refers to the base tree and a label may do=
 so, if
> + * it is not found. In both cases, the fragment becomes an overlay fragm=
ent.
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
>  bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
>  {
>  	struct node *target =3D get_node_by_ref(dt, f->ref);
> +	bool ok =3D true;
> =20
>  	assert(f->type =3D=3D FRAGMENT_NODE);
> -	if (target) {
> -		merge_nodes(target, f->node);
> -		return true;
> +	if (plugin) {
> +		if (is_ref_relative(f->ref)) {
> +			srcpos_error(f->ref_srcpos, "Error",
> +				     "Label-relative reference %s not supported in plugin",
> +				     f->ref);
> +			ok =3D false;
> +		}
> +		if (f->ref[0] =3D=3D '/' || !target) {
> +			/* Add a fragment@N node for the reference */
> +			add_orphan_node(dt, f->node, f->ref);
> +			return ok;
> +		}
>  	}
> -	if (!plugin) {
> +
> +	if (!target) {
>  		srcpos_error(f->ref_srcpos, "Error",
>  			     "Label or path %s not found", f->ref);
>  		return false;
>  	}
> -	/* The label may be in the base tree, so add a fragment@N node for it */
> -	add_orphan_node(dt, f->node, f->ref);
> +	merge_nodes(target, f->node);
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

--LhVCKVTytCjo9meo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGfcwACgkQzQJF27ox
2GfqvhAAgfx3V9InjTRLbwBVwobG5VAZEK4MMY4k2uoeRb4bk506UY9Ol9l+Qvs7
CWnhSL1h317mp1bP3dmrrsHU8RzBtzPneJPCuFD8n0tOOUsbRFB6KGVu8LmsxPRI
O5DVJSX026qvQYGi9kWA7eDGyggPIf7o5a/YUp5P6vVH4kKBF8UN+MdT0QyN7Wuw
GkzNqnnwAHdcaU2oYaPXj44CtCa3vj4O35jStiBeU1DwV8aAVvvtlMzYvF6cZ3ic
OVK32nki4mWu3L9No2kS9WjWvHQlrJozfHFegN3L5oJ2r5p5ptPLPdJigAi4LUsS
KhrZ8tUj8bpnwpcm1y6vf2b9cy3owOxrjwJxJ9E6V1NQp9MQlqTqC9IjU+PvmxgA
AKB0cITpGWuJhNvRVWXgkoPA1W2TSx76rpcEjnhKOvbzk91vpcwgIehxqahUA2P/
3KquJBHGmFdrRDULmgEbFDQs3H933JTKjdF9XKkxmUznyXnwflJqE9ubzIc+5x2T
pXKqNc8r2kHdrU5H623sdHBNy0cdDnDLnNhuRTzCkTsQFjhVZ8nv9tF7/qAqLZq5
6Qj7iCoz+rwOtXvIIKIDseVSg7wfblDLMI3CMNSJk3bev9yjU6Izucnx2cpDvOI7
T1T6iq4gUNmIiJMvv3ELnftb68PH/flPkSSU4HERWNKyiz3Ltcw=
=Vec3
-----END PGP SIGNATURE-----

--LhVCKVTytCjo9meo--
