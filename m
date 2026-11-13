Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544050;
	b=foBUmPrAioi9afVSXFLUdxtM3FlZZMfL4JM+6Dbs2N1YHdq30AWstkJBcX26Khs2HLrY
	 tiIGkIrtDf6qx8I95BNbKsk2CljvvJTiNI6TsTpb8JwO0ImJ62OE2yk5FfWP89pg0qmIZ
	 6+div4vZpCWFFAsOEVm7jWYlLLhvj/3sXFArYqrnCDtP/32ND5wZM1M+ojXgxwOLDdkVr
	 5TC3nSNRtAEC4F9bMedOKwAg1baTAZy1FlOMDE8klVPzIZhtinDim3hPpYPf2tmjS2MCy
	 396r2DCnANU7lVvTY30Tuz++ObCIPvinlIlZt4lChRpg6klaeI+LHj1JHU18/aQt0BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544050;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ayP8TKnpY6NL5u4j/sgE3U3JISt9+eJ7/AgrLiI74Gg=;
	b=4fXJRr7ycQ2UzjrnuYxt5KtGk4G/rgzKVC7wheilrrBnQu3KLOKnENmSs4t6lH4IFCtl
	 w69VLlbljT1vdWdEN19g55H1lKdpyXUhcneBf6kCPqSar/BFoXjvB2TyQEIIOwBHq8bY1
	 i2+Wi81x80Gx8ujUEjchH4pGgtwGYN8K+knnI6dXcnqz27F+T8uDvH1lkgizpcXTRLHnT
	 gtT4Aopfv9ItyGAT5y9pXCK3TWhIawPW1wOvZPHa2LuH9efHRrZUAxkDgk78j5QYyrD83
	 6fn4nD8XgVaH+bkLqL/1wLhOC+lScn+yLUxyQaTa9871A4nse0JuyTFCkucq0jcwbbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=OXaZT2nr;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D7C606A321
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 04:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D7C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=OXaZT2nr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794544046;
	bh=ayP8TKnpY6NL5u4j/sgE3U3JISt9+eJ7/AgrLiI74Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXaZT2nrYGiC1/3wDxcCIGJVFfgGAhGvpzEwI/RqboxnDCN4JAuk+lpjAjaBxfk+e
	 W1tdBBPy4RFikFi1g1hCE/zBV3XW9077fqNTZSeKGuEvU1bnqqS88xv7ZG4NY/YAk9
	 3HNy1/mZqeFNykNeEdUVhEuST+obrqUCXLKXbyQGBwIZrckG23cKNgBSPPRbwCcxoM
	 oBvg26DMwn3yr6Dg3ttE0HoeOOeFTksKklwHB1yNvdFgxkFtBdtxqPOqfbfXEF/Yer
	 6BQqSN/7eGjLYc+IO/lVWT0qeqLK2cXRitSVepmxsDkNn06N7GqVY4NZeZDtXgnS+S
	 NHQJ4GOh2Qvzw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkkQ4sxbz4wTN; Fri, 13 Nov 2026 15:27:26 +1100 (AEDT)
Date: Fri, 13 Nov 2026 15:24:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 12/18] dtc: Add merge_fragment() to merge any fragment
Message-ID: <avaRA7LnlMyqqEPs@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-13-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="x0LzKGp7Iyi0OJW8"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-13-sjg@chromium.org>

--x0LzKGp7Iyi0OJW8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:39PM -0700, Simon Glass wrote:
> Each grammar action which merges a fragment calls the function for its
> own kind of fragment, sets treesource_error if that fails, and finds out
> whether the file is a plugin using $<flags>-1
>=20
> Add merge_fragment() to merge any fragment, choosing the function by the
> type of fragment and whether it is the first. Have each action build a
> struct fragment and pass it to a new merge_parsed_fragment() helper,
> which calls merge_fragment(), sets treesource_error and frees the
> fragment. The functions used by merge_fragment() become static.
>=20
> The output does not change.

LGTM.  Again, the logic is a bit more redundant than I'd like, but
it's a reasonable interim step.

>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Use the new constructors and return true on success
> - Use dt_ref instead of fragment_ref
> - Combine the label and path rules earlier, in the path-reference patch
>=20
>  dtc-parser.y | 53 ++++++++++++++++++++++++++--------------------------
>  dtc.h        |  5 +----
>  livetree.c   | 42 +++++++++++++++++++++++++++++++++++++----
>  3 files changed, 66 insertions(+), 34 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index abeee0d..9cda518 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -24,6 +24,22 @@ extern void yyerror(char const *s);
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
> =20
> +/*
> + * Merge a fragment into the tree as soon as it is parsed. The flags come
> + * from the actions using $<flags>-1, which relies on the rule being alw=
ays:
> + *   headers memreserves devicetree
> + * so $-1 is the value of headers
> + */
> +static struct node *merge_parsed_fragment(struct node *dt, struct fragme=
nt *f,
> +					  unsigned int flags)
> +{
> +	if (!merge_fragment(&dt, f, flags & DTSF_PLUGIN))
> +		treesource_error =3D true;
> +	free_fragment(f);
> +
> +	return dt;
> +}
> +
>  %}
> =20
>  %union {
> @@ -155,65 +171,50 @@ dt_ref: DT_LABEL_REF | DT_PATH_REF;
>  devicetree:
>  	  '/' nodedef
>  		{
> -			$$ =3D name_node($2, "");
> +			struct fragment *f =3D build_fragment_root($2);
> +
> +			$$ =3D merge_parsed_fragment(NULL, f, $<flags>-1);
>  		}
>  	| devicetree '/' nodedef
>  		{
> -			$$ =3D merge_nodes($1, $3);
> +			struct fragment *f =3D build_fragment_root($3);
> +
> +			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
>  		}
>  	| dt_ref nodedef
>  		{
>  			struct fragment *f;
> =20
>  			f =3D build_fragment_ref(NULL, NULL, $1, &@1, $2);
> -			/*
> -			 * We rely on the rule being always:
> -			 *   versioninfo plugindecl memreserves devicetree
> -			 * so $-1 is what we want (plugindecl)
> -			 */
> -			if (!merge_first_ref(&$$, f, $<flags>-1 & DTSF_PLUGIN))
> -				treesource_error =3D true;
> +			$$ =3D merge_parsed_fragment(NULL, f, $<flags>-1);
>  		}
>  	| devicetree DT_LABEL dt_ref nodedef
>  		{
>  			struct fragment *f;
> =20
>  			f =3D build_fragment_ref($2, &@2, $3, &@3, $4);
> -			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> -				treesource_error =3D true;
> -			$$ =3D $1;
> +			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
>  		}
>  	| devicetree dt_ref nodedef
>  		{
>  			struct fragment *f;
> =20
>  			f =3D build_fragment_ref(NULL, NULL, $2, &@2, $3);
> -			/*
> -			 * We rely on the rule being always:
> -			 *   versioninfo plugindecl memreserves devicetree
> -			 * so $-1 is what we want (plugindecl)
> -			 */
> -			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> -				treesource_error =3D true;
> -			$$ =3D $1;
> +			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
>  		}
>  	| devicetree DT_DEL_NODE dt_ref ';'
>  		{
>  			struct fragment *f;
> =20
>  			f =3D build_fragment_delete_node($3, &@3);
> -			if (!merge_delete_node($1, f))
> -				treesource_error =3D true;
> -			$$ =3D $1;
> +			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
>  		}
>  	| devicetree DT_OMIT_NO_REF dt_ref ';'
>  		{
>  			struct fragment *f;
> =20
>  			f =3D build_fragment_omit_if_no_ref($3, &@3);
> -			if (!merge_omit_if_no_ref($1, f))
> -				treesource_error =3D true;
> -			$$ =3D $1;
> +			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
>  		}
>  	;
> =20
> diff --git a/dtc.h b/dtc.h
> index 1befd5c..e223bc2 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -372,10 +372,7 @@ struct fragment *build_fragment_omit_if_no_ref(char =
*ref,
>  					       struct srcpos *ref_srcpos);
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
> -bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin);
> -bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
> -bool merge_delete_node(struct node *dt, struct fragment *f);
> -bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> +bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
> diff --git a/livetree.c b/livetree.c
> index 26d39df..a1d5d71 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -580,7 +580,7 @@ static bool is_ref_relative(const char *ref)
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
> +static bool merge_first_ref(struct node **dtp, struct fragment *f, bool =
plugin)
>  {
>  	bool ok =3D true;
> =20
> @@ -611,7 +611,7 @@ bool merge_first_ref(struct node **dtp, struct fragme=
nt *f, bool plugin)
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> +static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
>  {
>  	struct node *target;
>  	bool ok =3D true;
> @@ -651,7 +651,7 @@ bool merge_ref(struct node *dt, struct fragment *f, b=
ool plugin)
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -bool merge_delete_node(struct node *dt, struct fragment *f)
> +static bool merge_delete_node(struct node *dt, struct fragment *f)
>  {
>  	struct node *target =3D get_node_by_ref(dt, f->ref);
> =20
> @@ -672,7 +672,7 @@ bool merge_delete_node(struct node *dt, struct fragme=
nt *f)
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
> +static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
>  {
>  	struct node *target =3D get_node_by_ref(dt, f->ref);
> =20
> @@ -687,6 +687,40 @@ bool merge_omit_if_no_ref(struct node *dt, struct fr=
agment *f)
>  	return true;
>  }
> =20
> +/*
> + * Merge a fragment of a dts file into the tree at *dtp, which is NULL f=
or the
> + * first fragment. A reference is looked up in the tree as merged so far.
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
> +{
> +	struct node *dt =3D *dtp;
> +
> +	if (!dt) {
> +		/* The first fragment is the root or, in a plugin, a ref */
> +		if (!f->ref) {
> +			*dtp =3D name_node(f->node, "");
> +			return true;
> +		}
> +		return merge_first_ref(dtp, f, plugin);
> +	}
> +
> +	switch (f->type) {
> +	case FRAGMENT_NODE:
> +		if (f->ref)
> +			return merge_ref(dt, f, plugin);
> +		*dtp =3D merge_nodes(dt, f->node);
> +		break;
> +	case FRAGMENT_DELETE_NODE:
> +		return merge_delete_node(dt, f);
> +	case FRAGMENT_OMIT_IF_NO_REF:
> +		return merge_omit_if_no_ref(dt, f);
> +	}
> +
> +	return true;
> +}
> +
>  /*
>   * Tree accessor functions
>   */
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--x0LzKGp7Iyi0OJW8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2kQMACgkQzQJF27ox
2Gf81RAAnDSGIWBNIAoU3AQpKE8He3srJLOXf/P3qjxwwNtSxT2c2xjLedSdN71F
Dv3KIkhR4Ys7fSYgy5S2pDLFVnSiqZY1/WGDduIEotIKwZ/iBcPRkPs6AQ0f7BUo
NW/kCk/xXGIuIky54kZVtJfaKUNy7edrpfHXKhRTyCEmFErc88s6NwHbzpZKbv6Y
bLf6Ul+/hFbArp56SLXdujAlceNhXV4yP63+LlIH3ur+CTWY7GuZjlgM0YICSev/
IXrETMi9sUGOlgYkOwheTkEcNNK4MwXTYqQgG4c2rHNnIuHBVlad91+v1doAoa3b
Oh4ZRg2Pw0A8rkLExxMS0YDzM/atfArOlsfY1jR2DRC/Oo9GVNEcljyHpoJTI7V2
eUVDF8FHDlyR6t0TeV+WQFS6iAFXCgHrwUKwgnyD4cGO2/dzxWweAsnisdEMzHOP
8Y+c/A1IV6/kzlFfkdqlaoKqV+D2Nh6X8lXDKy7QjzdXvjsR+eI9v7JiaK6By2/U
vdoqec7v+dXjpNabGt+NX610duWbf5sdRbn8LKVdodiAiKfReHf7HCKDT3wYj1BK
wXHD3I3DP13Hk+gI3OAelfDPRx79ClXql1aG6YwaAUlAgctRy+/VA7anBt1Wn5MF
eFvWZCIwF45vHCKvdm6kNuGG74Swn9l6ZLIHa09Bw6QQN9nsA90=
=JnnF
-----END PGP SIGNATURE-----

--x0LzKGp7Iyi0OJW8--
