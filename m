Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543577;
	b=h2ObX6/Av27+ALxt1xvsTB3mFsk5Lf+x3zWP5Sq0z7HQ/678n4WVPgvSXSOPMNt2XJbe
	 4gBATIXxuMgQW8T+XkzGAfv4NB7vGvZkkxwx3oLL8v6UlNb55UkaG/gAHMXVEL+HsYlQn
	 MORZGkjmZcBupkGVgumCN5wcLkGLBwuRZiO8r0bgQauQWsJoRwY7OBD+8FPzzcYVem+Zu
	 83Ao+knt8BsGGDyGJyxdJeQIRbLBKlaXQX6FjQ4XGcMX0W0+6SnXY1RJVmzqYvsaJwqu1
	 mDU+qsL4X+RudTTkmRWuA5sbbZw4YTTIjXuT+u13Fx0kgYZFX8URdDrgdHlccK1v6CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543577;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=1hCA+Utq9cHi8UpKcRyzyZDD3mpzxEUfPK3HXA+bUCs=;
	b=SaUu8RhWeNx+ijplqV3aes2Q5shOdswkdYEljIYEGAGF4VrIexblRf+3iJIX57GhUCle
	 j0rH/4gpGPUChcALSLrEhDgdOdN0hYnY7GwF9fqDRyrd4FWsXQ3PBVVbuE+GGdD6HF8VD
	 grBAaEcW8n+pROoMZscYP1ZzNXZEBvrJt6OLz2Ll+aT7QrxOsBrd0vh1et5oLMRaFYkj9
	 Tqe5W8Me7TLIWZUDnvMSJXGb/q5Ci4pTs27KSiqu3yUwOYS3uogRaG5c8U4+AIKWlYIBL
	 ezOzmY6sXmAdkJzXx7CT2AO8LmQ3NlK+5gnatqNWrKsUjHCNMosrI4BI0WrGOsAWdDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gddtN3iC;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B46D606A327
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 04:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B46D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gddtN3iC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794543574;
	bh=1hCA+Utq9cHi8UpKcRyzyZDD3mpzxEUfPK3HXA+bUCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gddtN3iCjP2lgiXgL2minLI+HPCwiaTJrrXcqP7UXz6csjUbE3vdubX8SuKOxIbLg
	 2yhKFjqKx2nSTOhJMGlvEwWFVR7kBhZuiBly30JmN3We2sRcSKy5Y6LS86tgxDBESJ
	 WF/OqELl04C6J04UYp3ESwxdaJHV71P3cnNOfNO9Q26qENFcu+KAmW55m9MVvKNTRy
	 fse/TvwsQH3qNJRijfmdTFz5L/vgfqRlkwA+GiFHZ6w6943G6Y+pXS59Xv23bRIXzL
	 00yfIVHGXDf8m+3flyl6MRwIR29DWB6ijAzf5datMPOEl8WHiOIO8LfeY0RcjlvcoK
	 fYB1b/CSRXEzA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkYL6WwFz4wTW; Fri, 13 Nov 2026 15:19:34 +1100 (AEDT)
Date: Fri, 13 Nov 2026 15:13:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 10/18] dtc: Move labelled-reference handling out of
 the grammar
Message-ID: <avaOT8P1B7WMeEG4@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-11-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="VTrKt3OCYJr9Eqld"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-11-sjg@chromium.org>

--VTrKt3OCYJr9Eqld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:37PM -0700, Simon Glass wrote:
> The grammar action for a top-level label: &ref { ... } holds its merge
> logic, which adds the label to the node referred to.
>=20
> Move it into merge_ref(), passing it a struct fragment with the label.
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
> - Combine merge_labelled_ref() into merge_ref()
> - Use dt_ref instead of fragment_ref
>=20
>  dtc-parser.y | 13 ++++---------
>  livetree.c   | 14 ++++++++++----
>  2 files changed, 14 insertions(+), 13 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 3ec9254..8d505a1 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -179,16 +179,11 @@ devicetree:
>  		}
>  	| devicetree DT_LABEL dt_ref nodedef
>  		{
> -			struct node *target =3D get_node_by_ref($1, $3);
> -
> -			if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
> -				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3=
);
> +			struct fragment *f;
> =20
> -			if (target) {
> -				add_label(&target->labels, $2);
> -				merge_nodes(target, $4);
> -			} else
> -				ERROR(&@3, "Label or path %s not found", $3);
> +			f =3D build_fragment_ref($2, &@2, $3, &@3, $4);
> +			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
>  	| devicetree dt_ref nodedef
> diff --git a/livetree.c b/livetree.c
> index 2e9a3b2..7ab9437 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -574,10 +574,12 @@ bool is_ref_relative(const char *ref)
>  }
> =20
>  /*
> - * Merge a fragment which refers to a label or path into the node it ref=
ers to.
> + * Merge a fragment which refers to a label or path into the node it ref=
ers to,
> + * adding any label in the fragment to that node.
>   *
>   * In a plugin, a path always refers to the base tree and a label may do=
 so, if
> - * it is not found. In both cases, the fragment becomes an overlay fragm=
ent.
> + * it is not found. In both cases, the fragment becomes an overlay fragm=
ent,
> + * unless it adds a label, which needs a node in the plugin itself.
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> @@ -589,12 +591,14 @@ bool merge_ref(struct node *dt, struct fragment *f,=
 bool plugin)
>  	assert(f->type =3D=3D FRAGMENT_NODE);
>  	if (plugin) {
>  		if (is_ref_relative(f->ref)) {
> -			srcpos_error(f->ref_srcpos, "Error",
> +			srcpos_error(f->label ? f->label_srcpos : f->ref_srcpos,
> +				     "Error",

This change doesn't make sense to me - the problem is with the ref,
not the label, whether or not the label exists.

>  				     "Label-relative reference %s not supported in plugin",
>  				     f->ref);
>  			ok =3D false;
>  		}
> -		if (f->ref[0] =3D=3D '/' || !get_node_by_ref(dt, f->ref)) {
> +		if (!f->label &&

Why does having a label preclude an orphan merge? IIRC, we can encode
this by putting label =3D "/fragment@XX/__overlay__" into the dtbo's
__symbols__.

> +		    (f->ref[0] =3D=3D '/' || !get_node_by_ref(dt, f->ref))) {
>  			/* Add a fragment@N node for the reference */
>  			add_orphan_node(dt, f->node, f->ref);
>  			return ok;
> @@ -607,6 +611,8 @@ bool merge_ref(struct node *dt, struct fragment *f, b=
ool plugin)
>  			     "Label or path %s not found", f->ref);
>  		return false;
>  	}
> +	if (f->label)
> +		add_label(&target->labels, f->label);
>  	merge_nodes(target, f->node);
> =20
>  	return ok;
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--VTrKt3OCYJr9Eqld
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2jk8ACgkQzQJF27ox
2Gcsbg/7Bl8GBCy6EcgF4YREe3g8+WvZSjJ9/NVre7GGekvMQKVHurkJ5vwB1YHG
kP1zlHgs1PhacY7OpO5deP0aqgZwFEE7Cn+bH48t7mzleaozp0Yvwz/fZGO92rTu
NmtIN6qmBIa1a+WD5MLydUVZ32oEms0Nr9IwcyJvSkvCpkZ6w8YcB9Kr2j4OWV7P
9nI1q8x8DAv7/lUsZix43sDkdRDGcKlVRqWpRmMFGRjMjgSbEhtcXnk6CN1a667+
XlfCLaSDgD6vri7foDIsEn0iqMD6hsPmhBQtvJ37ZxJMMHAL+ZZLLF3qhvIlB1td
O9gbaVDLlZcHhtydA8uDAP/kAeyYM4ZQ+Xtl8nOSPyz/S7vKZDXGdpluZyd7i8EC
Yf9jZDe85XrCawwU04znMUKECVoFVhJMm7AXRXm2MTojw6m7HuvQrYHshDzt9tYN
9WoLaTwxA8TkVI6PxNuZLCIK5N0z8EBgV0/tizc7qrACpZQO+S5J7PFjZTnZT/F1
YdC6EW0qVtwjgrH8WVZz9tCu68jdDPLfsj5F72dA+YfgFgVRjtfRs8+5x6ZLxR+0
l+afyOLiMLI8FUvDrK8gkWESyzfdWOHcLQ6XCatO8KkYm0xEmY3jQ+UQB6+uwBvX
FeJ/+HOEMFcYth2j8iGGkMQfRfTshTryIUHcvnm5q4RSRT3S+Jk=
=70D8
-----END PGP SIGNATURE-----

--VTrKt3OCYJr9Eqld--
