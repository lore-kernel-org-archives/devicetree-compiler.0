Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542962;
	b=mOFgrcgvbob0upTRTz06h+HJUQg5cauXJrvYEZqXdOBASiQBLA8sG+lR86VWuayb34Hz
	 Frzg3uaip9vp3eBSSBTI33ct0tynPCz8i0lR2R53zSiIzIMPEWzIZBjiG9KaoP7fERB/L
	 z46RAxxpX/rX4z9+XtIpG4F7Awj/F57XrXflMeK0HtZsTMPykLb5eQ/TiNYp5ZUuBi7Ns
	 7vJIQUu6Z0lMVbpLgO12KVGtpUrKF+eVpG2A8VFjjKcjFCFCMmDmtcH2tk16eAtu1aP2b
	 o+Ty+yBLziL3iKQscZlxmih8poPSics9OS99hpNMMRgyS7zUvRdJNNDdwC7w/pbEHNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542962;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nM8diW9GybyayBJXJiw+fs6lVgo/cXBwryolwW0/fDI=;
	b=4XjTnlXqP0kSNOMdAO8qPFZnHvp3BJRT0tybRQlkNwpP4dFR0gmsd2fF6fltJQYmf3ry
	 RNN/riquOLgC8KB9k5/7h8VS+57+i9OdzFl/jcVia2DeQgJPWjIGKv9cJ2yBKHBLrj2NF
	 06AsV+yxNV8YgWbkq0c2Ctnum/UWHlfSnZGqog5vwJd0CHasKnPOQOEt6Hkznt052OxdV
	 IcxpY9L9A3+r34B93aWrAhikNshaDrW0/a/ZBmK9X9iPUxUfxHPd7gSBzPqj4fhqJVUGD
	 GMCBAvS46PUe53wrtAbFEv/Q3etP79X0F713xui/lPSwpEWAXeOIJazLLT/i9paL1Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=tPCY0VIs;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F365606A323
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 04:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F365606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=tPCY0VIs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794542956;
	bh=nM8diW9GybyayBJXJiw+fs6lVgo/cXBwryolwW0/fDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tPCY0VIsK00S9UIcoD87NT/W/Rz2PFpSdzHUvDrE5Ty501Ut8ckEBSSfSjHxMc5gm
	 Tbe28zCnXeRgOQrax/iCWgHJRP6MNuCI7NEDhR5SzKaxvhuJcU6/u45vN2pzIPR6o8
	 9h0e/79i3OX6SExRQFl7afPjHHvaRH81CvU0XQbB83o14m/QHsKlZdgIhFJDSXG4bc
	 X77nKOoi915o/7v+LpOlRF9ryhAtFY6pzvAp4fpqOMgSyiusmZ/wEH+a5rq6epqj6R
	 PF29IYxNSFFVks+bjR/t965TCanOmRHxM4XJpsHOsSdGY2BvemAOvPUep7uSkPkKxB
	 Ser5hP9+ltZYw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkKS0spzz4wTs; Fri, 13 Nov 2026 15:09:16 +1100 (AEDT)
Date: Fri, 13 Nov 2026 15:09:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 09/18] dtc: Move path-reference handling out of the
 grammar
Message-ID: <avaNYs7ZU6bLDy2h@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-10-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="Yl+QfwKZMSPVJ/BH"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-10-sjg@chromium.org>

--Yl+QfwKZMSPVJ/BH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:36PM -0700, Simon Glass wrote:
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
> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Combine merge_path_ref() into merge_ref()
> - Combine the rules for label and path references, using dt_ref
>=20
>  dtc-parser.y | 27 +--------------------------
>  livetree.c   | 33 +++++++++++++++++++++++----------
>  2 files changed, 24 insertions(+), 36 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 3614d71..3ec9254 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -191,32 +191,7 @@ devicetree:
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
> index 179866d..2e9a3b2 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -574,29 +574,42 @@ bool is_ref_relative(const char *ref)
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
> -	struct node *target =3D get_node_by_ref(dt, f->ref);
> +	struct node *target;
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

AFAICT, the fact that we can't encode label-relative references in
=2Edtbo is only relevant in the case that we can't resolve it locally.
So I think this should go within the next if.

> +			ok =3D false;
> +		}
> +		if (f->ref[0] =3D=3D '/' || !get_node_by_ref(dt, f->ref)) {
> +			/* Add a fragment@N node for the reference */
> +			add_orphan_node(dt, f->node, f->ref);

Pre-existing, but what will add_orphan_node() actually *do* if given a
ref it has no way to encode in a dtbo?

> +			return ok;
> +		}
>  	}
> -	if (!plugin) {
> +
> +	target =3D get_node_by_ref(dt, f->ref);

You can leave the get_node_by_ref() at the top, since it's used in
both branches.

> +	if (!target) {
>  		srcpos_error(f->ref_srcpos, "Error",
>  			     "Label or path %s not found", f->ref);
>  		return false;
>  	}
> -	/* The label may be in the base tree, so add a fragment@N node for it */
> -	add_orphan_node(dt, f->node, f->ref);
> +	merge_nodes(target, f->node);

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

--Yl+QfwKZMSPVJ/BH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2jWIACgkQzQJF27ox
2GeSSA/9G88KsQmkVQHl16RkIMP6yhr1dGhsT76RhPAxDWmCy7YZz58CzZUJaXKD
MmQCZr7fz4OTc8AUK/AVXPPiJ9854ud2jHq1RR9l1nda+gfeeLDm6ytqziBta5Rk
RjgoNsMsB9V9nBztmQSo2UifSFQT+BiVCm/n1aWT3cYk++GJXFG9BgMdwkC4OvIx
PHZNYGh5/vDaksG0a0XMiDVS68pMsl1FaEMi5WhHLsU49rWp8zITlAkxisMw06In
NbfPVhldgmJ5Ka362LYUJxMpWetiTD702taYKYjfJLJJTTNNU5hi118lCcQ+hw5I
JdGwImXlj3iiHqZ5TkhqtOKS7pBcnvIJ1xGLUTIidTIOHKZD4vIhIkqC441rWjUj
Qoj4MwQAjKgtunzFt/ax2OYs0ubvxI/iWjH8Uz8dXA7AJYzY82HeStfP+DCcrnUV
U7ohfEczioBixbaV/nfToB8iDwGn3+h/w1mmbX0SnCtpk8gDTZCiCIfyEaD1aLKx
kuH1xEREh4sMdXMIsHdTpDd0dIHWvEYA9NIHR0kmyM3WUy4Wh6x3PJnxzu93Dltz
Fjus3i59/lVAI8FRwnTHvzrEAL6k15whLwof36endQFTiVXFtR1KpSFw2lL6Rz1U
5e61Zvkg2JW/ExvDAw9Qmr8JUvhHWGEjpsIXu3bervzqfV2Saf4=
=2kIT
-----END PGP SIGNATURE-----

--Yl+QfwKZMSPVJ/BH--
