Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542959;
	b=oSROoDjj0WK6/QEBUIkfWwZdkZWnS1oRWMAGUUJcGK4NueyfTC0sVT7+r/D9vYKurQVS
	 wJT6qKprN6CVHnSqKEDEAlzvV+92Lm28dtwUSzFZ75BBwb/twccbCe5qt/QACi7WTHKM1
	 uFCVz/SQ8F6fFeEnx7nKWELaYmZPo/5jELbQ1JzpDQzNsJqkHGbocTz0k1T1+9C++lCOh
	 GuhTIUjZhukjM0V0EZ0bjpFSB0p+ieVuk7dGFr3Dyusy//PUF2PrGZZ3LVBFKWRSJ0Ij+
	 TwdJaF1uwaNksJjixW4PLiYW3bP+UCandDEmu6NrbuNEYvOHQCgpPe/DGw77SKZIDiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542959;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=RfMOy4/qIoPpa0MwWrGx0zbw+1pPb7YXwmMYa2goK2w=;
	b=zGt5S/Ag5Ci/Ls1d47I4lqQfE2cudWekuTOxb52uPznWiPppm/0jq4RlqBdIUJEJiLKH
	 vgl4NmuoDA2OMs2M5m/XMcIlztwaU0swUluI+6wd8AgTr1+dv3pJ+qdW/S1vncSRFXnvj
	 vMU77fh19OuYNZY2LoZvhMBxrDP4LjB2fqdeC+CJxq9JCh3XCsQPaaJBdFvU4vnMM0aMB
	 xjmjKQOq9yI+nCboeWEtV84r1zqZooe516B/9tM3t9iX734ow7JOP3jbktNe/iGBMcwHs
	 wgfLXsv04KnXoO0FhONVPZjD5rhHEMnPGMaP8XrCSWst8pggdXnaCrHInxdhXkbFYYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=s06GOfan;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A86606A321
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 04:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A86606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=s06GOfan
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794542956;
	bh=RfMOy4/qIoPpa0MwWrGx0zbw+1pPb7YXwmMYa2goK2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s06GOfanZa8YkoZTmoss+Npanvhw7gZKTtXqWJTXhMJPzqLBK8u4nSTWKU3XCaHYh
	 ZsjCs9XSbt908xW0jii4NQ8R8k0M6UdkNw1Z18yikj6tSL7TV9B3xp6LRpoBQPgNCe
	 H0M9zcmXvkIWhj/mHe2jqL1M8GDz6E4Z0eF2kZg4fAMwLzvfYbBTHVGnkRj3rK6mFO
	 te51FchlcvA+7HX1QB27QxFQlodpHugNgWY0o4kteNzGmdO5embgiJBsgp49VM5fqI
	 +L8SxcqNnUbEA8ojn3NBTwZrWEdF16V3jouD+5ynv5JC17jF9Gq0iD9Ca5AoibHqvP
	 7u5n5+deDXveA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkKS0hv1z4wTp; Fri, 13 Nov 2026 15:09:16 +1100 (AEDT)
Date: Fri, 13 Nov 2026 14:58:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 07/18] dtc: Move label-reference handling out of the
 grammar
Message-ID: <avaK43WNtYVl8EZJ@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-8-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="An7+vvRZouqzL1pF"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-8-sjg@chromium.org>

--An7+vvRZouqzL1pF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:34PM -0700, Simon Glass wrote:
> The grammar action for a top-level &label { ... } holds its merge logic,
> including making an overlay fragment in a plugin when the label is not
> found.
>=20
> Move it into a new merge_ref(), passing it a struct fragment for the
> reference and node.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Rename merge_label_ref() to merge_ref()
> - Build the fragment in one step, with build_fragment_ref()
> - Return true on success from merge_ref()
> - Check the fragment type with assert()
>=20
>  dtc-parser.y | 23 +++++++++--------------
>  dtc.h        |  1 +
>  livetree.c   | 26 ++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 14 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 9b9b6db..c58a66d 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -214,21 +214,16 @@ devicetree:
>  		}
>  	| devicetree DT_LABEL_REF nodedef
>  		{
> -			struct node *target =3D get_node_by_ref($1, $2);
> +			struct fragment *f;
> =20
> -			if (target) {
> -				merge_nodes(target, $3);
> -			} else {
> -				/*
> -				 * We rely on the rule being always:
> -				 *   versioninfo plugindecl memreserves devicetree
> -				 * so $-1 is what we want (plugindecl)
> -				 */
> -				if ($<flags>-1 & DTSF_PLUGIN)
> -					add_orphan_node($1, $3, $2);
> -				else
> -					ERROR(&@2, "Label or path %s not found", $2);
> -			}
> +			f =3D build_fragment_ref(NULL, NULL, $2, &@2, $3);
> +			/*
> +			 * We rely on the rule being always:
> +			 *   versioninfo plugindecl memreserves devicetree
> +			 * so $-1 is what we want (plugindecl)
> +			 */
> +			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_DEL_NODE dt_ref ';'
> diff --git a/dtc.h b/dtc.h
> index 8c4d7bf..9b4389b 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -373,6 +373,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *=
ref,
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
>  bool is_ref_relative(const char *ref);
> +bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
>  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> =20
> diff --git a/livetree.c b/livetree.c
> index 3ff4e14..179866d 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -573,6 +573,32 @@ bool is_ref_relative(const char *ref)
>  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
>  }
> =20
> +/*
> + * Merge a fragment which refers to a label into the node with that labe=
l. In
> + * a plugin, a label which is not found becomes an overlay fragment.
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);
> +
> +	assert(f->type =3D=3D FRAGMENT_NODE);
> +	if (target) {
> +		merge_nodes(target, f->node);
> +		return true;
> +	}
> +	if (!plugin) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return false;
> +	}
> +	/* The label may be in the base tree, so add a fragment@N node for it */
> +	add_orphan_node(dt, f->node, f->ref);
> +
> +	return true;
> +}
> +
>  /*
>   * Delete the node which a /delete-node/ fragment refers to
>   *
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--An7+vvRZouqzL1pF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2iuMACgkQzQJF27ox
2GfJcA//VgIpll1gxqNihaYq6Yn/BXHCPp9DKhzwtGbNMpppj9UOQxV2xHO/6N/N
sPy0QREnouvmmQZFyMB71YV4v6hyZ54vCk/u+5W5krVKe+d3mhApgz+Lz+ErmkDy
TnoFRX5ySlG9lMz7rF0HSahZTcPUphn4YLFI8ybciPBxjsMD0kHu7Djo1uku8sdx
bt9ueE35NqysD5q/6yZWb9Ny1hmsiFWY9EyWtXNSP7UWadSokfeL0ZV00icKGbWc
WqzGztxUk0jenddsHKZX6pQoZ3/wjD8Rq+DQC5CJP/yfXJNFTsj09ZSj2Y2SqXTF
vMZmrry89cj65t0kHYZTo1fUDktAW1SuDpX22jUariFRf4DU9NIzq2r4Ex54u5ja
T1DRIljBhXykOPGpC30DRJfPDKV3uPC9ZLqZYtqq8z0GfsOswF0Y8TlMz9VXf1yQ
50dXG7WAx6UG2S24DDPVVcOM0YSDTDgkdWsGZE9fAD14t76GY2WEvA4O43cB1K2j
5B5ud/+927emrrVHX3gpT1ShfZga52JcGVBdwXZil4MtNk3WjSSgyo82goH1H9Si
l1ZOcLn+ZtqN3NafJD6KuHrGRl+elI9j1tzwzeh0ySsr6TwgwkXOkmJc0GwVO3F4
oxxqBy5wFRTNrkd8ygHhxH0ZLvKDJwQhH78yS57fmRU194X8paM=
=y93d
-----END PGP SIGNATURE-----

--An7+vvRZouqzL1pF--
