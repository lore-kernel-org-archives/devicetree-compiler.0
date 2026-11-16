Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803689;
	b=dG2fZiaha849c4xRp/FcwrEDO5zWp7LhAL0477T1xk19ypipqrHodaDxqOk/CCmG8kjS
	 wCpJultJeCp8Q2c4U4OcOVQvPm9XQXWyL0hq9yiHkiglbUsK+UIPIp4jvOWK2pZpWkipc
	 HwlvEPpqhWX8xrYIhQ/PC63obfmhteiwzALU5JqbTsGg3RoHvo0epaiCFRHX35Uaxpsqw
	 NdCVNv2vU44ukUKWXqrjQlYGujmRRwtSVYx30mjcSLfFsWQ5svb2DwGtMc5PQhKNiM3Mw
	 7mcgFzeOyEc7BalSY9g5HrToLGzbzSyn7iMUCkLbdp5w2dQn3pQKCAf3PmUtPJ8febw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803689;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=j1GEnh48qsWIuN5oY4fKca09AlKgQ7qfnMVx6L434e0=;
	b=ssKeTiGB2Acwqnc0RuvWo6UHSmWxZyr2XQCPd+E87976G8RBYSZSXovoJBCXOK2eFYF3
	 DukD+rw8ApnGsN1PYqZ6S0j57f4d0QSQoAvxUy3wmkYebG2tKHxlneebIco9f50ILAkLc
	 gDFm0f6JnLcCiDqIqHgc0bz28tQl+A1aablqbYXJZyf2oKYlbMLUqRXcKZd3WZCc3jbKc
	 YEbCi5a9YRtvU/mvYl723llL5n+ZCda7z0DAC7Ti6Sr/t4lBvKYS8Tu2V73DKfrK7Y6XT
	 l+LQOSfWxu5feB6FygXIUotv07mQCRO9V5ILBVVwdH7RS2GqVgwgocUvLothBIw4oAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=EtnUtj6p;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F5F606A332
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 04:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F5F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=EtnUtj6p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794803680;
	bh=j1GEnh48qsWIuN5oY4fKca09AlKgQ7qfnMVx6L434e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtnUtj6pvVr13qWfVgWlrXDKO4QiSsIIvb1NCOOq9x7AM8PUwkjRbYu8HHK4+wgOz
	 GtPsTSREcBh7Hz3nOugXpmMN5i8D6Kuu9g89ZbYNZd0lj/RZSGinM960HiwI6rUR9c
	 zKeKxCtLlAb9wGOUA8LoWajebTJoXs/8aVhWTnB3HcIIISRTgpxSbV2SPo8l3hO35C
	 D1XAOnS3APn21VcgQgA9k42MOthgMyZs35iRkjeav6bYrXCerbR7d/yzqVp4fjm8sz
	 6nB+ovDGnUeu1djE1ZcaWfHPRTrSp9RqQN/Fga25enfWVEMoHzp+XNFc7U4hSqpQ0E
	 krYzhn9Ql31ow==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jSZlN1xRhz4wMH; Mon, 16 Nov 2026 15:34:40 +1100 (AEDT)
Date: Mon, 16 Nov 2026 15:12:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 16/18] dtc: Add the overlay fragments from
 merge_fragments()
Message-ID: <avqCubv6DB--kLeB@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-17-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="Q9eLVc/vvJeU4ljq"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-17-sjg@chromium.org>

--Q9eLVc/vvJeU4ljq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:43PM -0700, Simon Glass wrote:
> In a plugin, merge_first_ref() and merge_ref() call add_orphan_node() to
> turn a fragment which refers to the base tree into an overlay fragment
> (a fragment@N node). The grammar actions have always done this, but it
> mixes converting the plugin to the overlay format into the functions
> which merge each fragment.
>=20
> Have merge_fragment() tell its caller when a fragment is for the base
> tree, and call add_orphan_node() from merge_fragments() instead, so that
> none of the merge_*() functions does the conversion. Add a comment for
> add_orphan_node() too.
>=20
> This does not change the output.
>=20
> Suggested-by: Herve Codina <herve.codina@bootlin.com>
> Link: https://lore.kernel.org/devicetree-compiler/20261105100714.47bf0434=
@bootlin.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> dtc gives the same output and messages as before for every .dts and
> .dtso file in Linux v7.3-12284-g3799eeb906c9
>=20
> Changes in v3:
> - Add new patch to add the overlay fragments from merge_fragments()
>=20
>  livetree.c | 47 +++++++++++++++++++++++++++++++----------------
>  1 file changed, 31 insertions(+), 16 deletions(-)
>=20
> diff --git a/livetree.c b/livetree.c
> index f2c7703..c5fec49 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -225,6 +225,15 @@ struct node *merge_nodes(struct node *old_node, stru=
ct node *new_node)
>  	return old_node;
>  }
> =20
> +/*
> + * Add an overlay fragment (a fragment@N node) to the root of a plugin, =
for a
> + * node which refers to the base tree. The node becomes the fragment's
> + * __overlay__ subnode and ref gives its target, either a path (target-p=
ath)
> + * or a label (target, as a phandle reference). Fragments are numbered i=
n the
> + * order they are added.
> + *
> + * Returns the root node, dt
> + */
>  struct node * add_orphan_node(struct node *dt, struct node *new_node, ch=
ar *ref)
>  {
>  	static unsigned int next_orphan_fragment =3D 0;
> @@ -611,9 +620,9 @@ static struct node *lookup_ref(struct node *dt, struc=
t fragment *f)
>  }
> =20
>  /*
> - * Make the tree at *dtp from a first fragment which refers to a label o=
r path,
> - * rather than being the root node. This is only valid in a plugin, wher=
e the
> - * fragment becomes an overlay fragment.
> + * Make an empty tree at *dtp for a first fragment which refers to a lab=
el or
> + * path, rather than being the root node. This is only valid in a plugin=
, where
> + * the fragment becomes an overlay fragment.
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> @@ -628,9 +637,7 @@ static bool merge_first_ref(struct node **dtp, struct=
 fragment *f, bool plugin)
>  			     "Label or path %s not found", f->ref);
>  		ok =3D false;
>  	}
> -	/* Make a new, empty tree with a fragment@N node for the reference */
> -	*dtp =3D add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
> -			       f->node, f->ref);
> +	*dtp =3D name_node(build_node(NULL, NULL, NULL), "");

This seems a bit awkward, since this operation no longer resembles any
kind of merge.  Seems like it would be nicer to unconditionally create
an empty tree in merge_fragments(), then "merge" everything into it,
including root fragments.

>  	return ok;
>  }
> @@ -640,12 +647,14 @@ static bool merge_first_ref(struct node **dtp, stru=
ct fragment *f, bool plugin)
>   * adding any label in the fragment to that node.
>   *
>   * In a plugin, a path always refers to the base tree and a label may do=
 so, if
> - * it is not found. In both cases, the fragment becomes an overlay fragm=
ent,
> - * unless it adds a label, which needs a node in the plugin itself.
> + * it is not found. In both cases, *for_basep is set to true so that the
> + * fragment becomes an overlay fragment, unless it adds a label, which n=
eeds a
> + * node in the plugin itself.
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -static bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> +static bool merge_ref(struct node *dt, struct fragment *f, bool plugin,
> +		      bool *for_basep)

Might be nicer to return an enum, rather than one bool directly and
another via a parameter.

>  {
>  	struct node *target;
>  	bool ok =3D true;
> @@ -656,8 +665,7 @@ static bool merge_ref(struct node *dt, struct fragmen=
t *f, bool plugin)
>  					f->ref_srcpos);
>  		if (!f->label &&
>  		    (f->ref[0] =3D=3D '/' || !get_node_by_ref(dt, f->ref))) {
> -			/* Add a fragment@N node for the reference */
> -			add_orphan_node(dt, f->node, f->ref);
> +			*for_basep =3D true;
>  			return ok;
>  		}
>  	}
> @@ -709,12 +717,13 @@ static bool merge_omit_if_no_ref(struct node *dt, s=
truct fragment *f)
> =20
>  /*
>   * Merge a fragment of a dts file into the tree at *dtp, which is NULL f=
or the
> - * first fragment. A reference is looked up in the tree as merged so far.
> + * first fragment. A reference is looked up in the tree as merged so far=
=2E If
> + * the fragment is for the base tree, *for_basep is set to true.
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
>  static bool merge_fragment(struct node **dtp, struct fragment *f,
> -			   bool plugin)
> +			   bool plugin, bool *for_basep)
>  {
>  	struct node *dt =3D *dtp;
> =20
> @@ -724,13 +733,14 @@ static bool merge_fragment(struct node **dtp, struc=
t fragment *f,
>  			*dtp =3D name_node(f->node, "");
>  			return true;
>  		}
> +		*for_basep =3D true;
>  		return merge_first_ref(dtp, f, plugin);
>  	}
> =20
>  	switch (f->type) {
>  	case FRAGMENT_NODE:
>  		if (f->ref)
> -			return merge_ref(dt, f, plugin);
> +			return merge_ref(dt, f, plugin, for_basep);
>  		*dtp =3D merge_nodes(dt, f->node);
>  		break;
>  	case FRAGMENT_DELETE_NODE:
> @@ -743,7 +753,8 @@ static bool merge_fragment(struct node **dtp, struct =
fragment *f,
>  }
> =20
>  /*
> - * Merge the fragments of a dts file into a single tree, in source order.
> + * Merge the fragments of a dts file into a single tree, in source order=
=2E In a
> + * plugin, each fragment for the base tree becomes an overlay fragment.
>   *
>   * Returns true on success, false on errors, which have been reported.
>   */
> @@ -758,9 +769,13 @@ bool merge_fragments(struct dt_info *dti)
>  		return true;
> =20
>  	for (f =3D dti->fragments; f; f =3D next) {
> +		bool for_base =3D false;
> +
>  		next =3D f->next;
> -		if (!merge_fragment(&dt, f, plugin))
> +		if (!merge_fragment(&dt, f, plugin, &for_base))
>  			ok =3D false;
> +		if (for_base)
> +			add_orphan_node(dt, f->node, f->ref);
>  		free_fragment(f);
>  	}
> =20
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Q9eLVc/vvJeU4ljq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr6grkACgkQzQJF27ox
2GeU5xAAqhXSfBaljEmTFYSJ/tuV6S/kEemQ4KkoswmhbAsBKiiQekNQbnpaj0jZ
zGkTosPH6akZ8FkARUqN8p8Sicvy+UdvWCNuqSZ41LbWlsUDajWE2xl3640YTCs9
1J+H89Fwp48AHc5c+KNxEsRLVNHSRMS5vCv2z71IgnAAZKzdWYLnm9N3YTR8hSAV
G3d7VxryTZhq4qQ/dg4H+qh4yvc+qR8L2GrJZ+FHzjmJEuojzd1I2sYdjhFO3TAA
IpTY/Qu1jfFBkjMPPg85XRcryELSLx0NPHoC7L5sQSAQM+c5/4g772jR+uwTgHyW
tTYufOfU4Tk8xeEBHrGayc1TCKp7FnptWg91ifNUA8vd/UKk08NO2TZsnW+zU+uJ
yVQmdzjvpsjGf9qZkIQQacatI8MEGWUnypuoDmpr4wqLvTemVkRiLhb/yZAzMIBz
GgnBYsWnQyP94qNj3yr2HdJSFidg1f0v3Xq4bC3kuX1oo0itNoIw0H0HaShNDG1a
/2xMJQbW5xztVaC1y65ajdsBEfkiKonzsYBvRo0UeMRrO5GJ6ur0JesiTNqcClrf
RKS/rpo0ZCTOyqHjVwWqIRxrUfYD+y5uYipCqRvGTc1nXyhzFZJbTQf5b2pIisc7
hjlfx5emgnGG1SAshs9kqn2bKERsvEXNlaVkNGwiueEQc8sRtxU=
=Vnpj
-----END PGP SIGNATURE-----

--Q9eLVc/vvJeU4ljq--
