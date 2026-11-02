Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613321;
	b=eikVrk0LVMiXwW5o/xvlAzr9T8z7hvMqYzjzJFd952X67Q28mxV/nv4pgrsseGCZBiwz
	 K+YrnZ9FOyeQ0UamiHq6uWXkU431nf9oj2ksqY89zCQ5YeVTGd6erQWLN6gSgwRLj+RXt
	 lVYVTFHC/XNeJrk1YpXG9pjpxYDXkQacwu9S7fNJfp79yrw6Zzbsd0z5sGgiN1V/2DLy/
	 s4rj7rWMKKDMiGsvd0g2bYgc7bKamA9HGSe0XoNmNwxIHjq1ZiwHPOUGa9kmn0R2H9mnz
	 fYO5MF6V2+vQY5vD8WWQF6prueWx7vslx8lrjgAJIoUSq+T5wkENnayQ86FI9PbsCGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613321;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=GCkxF9jh5xo+AJ62gJbv/V5IgCR2Y5ZwEvqRG5tMDZo=;
	b=mMi+Y/9F+jPxr6q0dGJCmvlv3+cbkJh0TVYRaTz2wMw0gPTClqV4ORDyRAcfzktHPaWj
	 RMWGQITppN3+Ix9M/Ka1WW/wEjsudu6AHeHu6qf1er1AWtQ3Hv//kutRK1/abMuk1Pk1F
	 DY2sshKparQHxXdTbx7aO7GaNjW0GUL/qig/8uSfQAaKTOSKSV8jjPURqcFpA6e4tDljn
	 nI9pj0zb0DPR6e7pBfZAtisfzZA8UmYlJ9h9L5RssHOpA/esBLohOf2jWWp4+JaePvCeU
	 aVu8XEhTmzwLpSucc6/1It3EJZeINvOxOPwSzUZFpQgn/3SYOBI5gYEsZlcTAF5iFAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=lfMM4gN8;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D5A606A326
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 09:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D5A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=lfMM4gN8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793613318;
	bh=GCkxF9jh5xo+AJ62gJbv/V5IgCR2Y5ZwEvqRG5tMDZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfMM4gN8kpT4hvoRc2U+4iGrT3XaZkcpzDFvYyCkOs+wiQkyj7+JUYE5ikh843qc2
	 hivUwBUly2trHZ5XK0melgCWKY/w/GAK3tmJA5mHUKlGdPZMo1kI7toirt2m1tlMUv
	 8PGDOqkDqFhsWhRqPpqdJ9frXTxeMjoiG3XyWujjwTzj11yG9QwL13oNQBuAXhMMVT
	 mJ8zVePaEeKNxuz8CLXbBRliV+9jLXwXKzMhi3iUKMCvu2nom92Mgysui+FRfFUshd
	 s1ekZ12sRB0s56bJjVz9WjFz8qtlSrvOnK93mGqMYtpBGy593EASHFByMGdb6/BZsB
	 yYockzZ+sAAWw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ6Wp1x6Vz4wDg; Mon, 02 Nov 2026 20:55:18 +1100 (AEDT)
Date: Mon, 2 Nov 2026 20:49:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
Message-ID: <auhctwoLtdWs9p-7@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-3-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="sX1sRREMpMr+CsP8"
Content-Disposition: inline
In-Reply-To: <20261101163721.2458982-3-sjg@chromium.org>

--sX1sRREMpMr+CsP8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 09:36:56AM -0700, Simon Glass wrote:
> A dts file is made up of top-level fragments: the root node, later
> definitions of a node by label or path, and /delete-node/ or
> /omit-if-no-ref/ with a reference. We would like to deal with each
> fragment on its own before it is merged, for example to apply deletes
> consistently or to run some checks on each one, but that requires
> keeping the fragments apart. At present the parser merges each one into
> the tree as soon as it is parsed.

Btw, I'm extremely open to a better name than "fragment" if one occurs
to you.  I believe I originally thought of these as "overlays" but
that's confusing since runtime overlays were invented.

> Add a struct fragment to hold one of these, functions to build one, to
> append it to a list and to free it, and a list of them in struct dt_info
>=20
> These are not used yet.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
>  dtc.h      | 47 ++++++++++++++++++++++++++++++++++++++++++
>  livetree.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 107 insertions(+)
>=20
> diff --git a/dtc.h b/dtc.h
> index 473552e..c0d8e8f 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -322,12 +322,59 @@ struct reserve_info *chain_reserve_entry(struct res=
erve_info *first,
>  struct reserve_info *add_reserve_entry(struct reserve_info *list,
>  				       struct reserve_info *new);
> =20
> +/*
> + * A fragment is one top-level part of a dts file, after the header and =
any
> + * memory reservations: the root node, a later definition of a node which
> + * refers to it by label or path, or a /delete-node/ or /omit-if-no-ref/=
 with
> + * a reference. Fragments are kept apart until they are merged into a si=
ngle
> + * tree.
> + *
> + * This is not the same as an overlay fragment (a fragment@N node), alth=
ough
> + * in a plugin a fragment may become one when it is merged.
> + */
> +
> +enum fragment_type {
> +	FRAGMENT_ROOT,		/* / { ... }; */

Why do we need a special type for ROOT, rather than setting ref =3D=3D "/"?

> +	FRAGMENT_REF,		/* [label:] &ref { ... }; */
> +	FRAGMENT_DELETE_NODE,	/* /delete-node/ &ref; */
> +	FRAGMENT_OMIT_IF_NO_REF, /* /omit-if-no-ref/ &ref; */
> +};
> +
> +/*
> + * Which fields are used depends on the type:
> + *
> + *   FRAGMENT_ROOT            node
> + *   FRAGMENT_REF             ref, path_ref, ref_srcpos and node, plus l=
abel
> + *                            and label_srcpos if there is a label
> + *   FRAGMENT_DELETE_NODE     ref, path_ref and ref_srcpos
> + *   FRAGMENT_OMIT_IF_NO_REF  ref, path_ref and ref_srcpos
> + *
> + * Unused fields are NULL or false.
> + */
> +struct fragment {
> +	enum fragment_type type;
> +	char *ref;			/* label or path referred to */
> +	bool path_ref;			/* ref is a path, i.e. &{...} */

This can be derived from ref, so I don't think we need to store it.

> +	struct srcpos *ref_srcpos;	/* position of ref */
> +	char *label;			/* label to add to the target */
> +	struct srcpos *label_srcpos;	/* position of label */
> +	struct node *node;		/* the node definition */
> +
> +	struct fragment *next;		/* NULL at the end of the list */
> +};
> +
> +struct fragment *build_fragment(enum fragment_type type, struct node *no=
de);
> +struct fragment *build_fragment_ref(char *ref, bool path_ref,
> +				    struct srcpos *srcpos);
> +struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
> +void free_fragment(struct fragment *f);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
>  	struct reserve_info *reservelist;
>  	uint32_t boot_cpuid_phys;
>  	struct node *dt;		/* the device tree */
> +	struct fragment *fragments;	/* not yet merged into dt */
>  	const char *outname;		/* filename being written to, "-" for stdout */
>  };
> =20
> diff --git a/livetree.c b/livetree.c
> index abe73de..982f0a6 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -448,6 +448,65 @@ struct reserve_info *add_reserve_entry(struct reserv=
e_info *list,
>  	return list;
>  }
> =20
> +/* Create a fragment of the given type, holding an optional node */
> +struct fragment *build_fragment(enum fragment_type type, struct node *no=
de)

Since there's no ref provided, presumably this must of be
FRAGMENT_ROOT, so why a type parameter?

> +{
> +	struct fragment *new =3D xmalloc(sizeof(*new));
> +
> +	memset(new, '\0', sizeof(*new));
> +
> +	new->type =3D type;
> +	new->node =3D node;
> +
> +	return new;
> +}
> +
> +/*
> + * Create a fragment which refers to a label, or to a path if path_ref. =
Its
> + * node is NULL, so the caller must either set the node or change the ty=
pe to
> + * FRAGMENT_DELETE_NODE or FRAGMENT_OMIT_IF_NO_REF

That seems a clumsy interface.  Maybe different constructor functions
for the different types, that take all the necessary pieces?

> + */
> +struct fragment *build_fragment_ref(char *ref, bool path_ref,
> +				    struct srcpos *srcpos)

Here too, path_ref should be derivable from ref.

> +{
> +	struct fragment *new =3D build_fragment(FRAGMENT_REF, NULL);
> +
> +	new->ref =3D ref;
> +	new->path_ref =3D path_ref;
> +	new->ref_srcpos =3D srcpos_copy(srcpos);
> +
> +	return new;
> +}
> +
> +/* Add a fragment to the end of a list, returning the new head */
> +struct fragment *append_fragment(struct fragment *list, struct fragment =
*new)
> +{
> +	struct fragment *last;
> +
> +	new->next =3D NULL;
> +
> +	if (!list)
> +		return new;
> +
> +	for (last =3D list; last->next; last =3D last->next)
> +		;
> +
> +	last->next =3D new;
> +
> +	return list;
> +}
> +
> +/*
> + * Free a fragment, but not its node, reference or label, since the tree=
 may
> + * still use these
> + */
> +void free_fragment(struct fragment *f)
> +{
> +	srcpos_free(f->ref_srcpos);
> +	srcpos_free(f->label_srcpos);
> +	free(f);
> +}
> +
>  static void fill_fullpaths(struct node *tree, const char *prefix)
>  {
>  	struct node *child;
> @@ -475,6 +534,7 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  	dti->dtsflags =3D dtsflags;
>  	dti->reservelist =3D reservelist;
>  	dti->dt =3D tree;
> +	dti->fragments =3D NULL;
>  	dti->boot_cpuid_phys =3D boot_cpuid_phys;
> =20
>  	fill_fullpaths(dti->dt, "");
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--sX1sRREMpMr+CsP8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroXLcACgkQzQJF27ox
2GdICw/+O76c/+LeLcEP7pOgtnoc2deS3ucW37qK5edmQcT6JNN9JetyS4+s6KvW
pfz5UtfbTPRm3Fwd3jgWSY0DDLpTVr1zOsDty2/jKkvQ5uyoKAfyCRBqNGPCWaMx
Z+Icz4Iy8bY6u2ljcHxtk86+PsNRAIFNFeXeACi7xnYJWfdYcQD8PLQE/o/zWYhM
UrP8yoixLYtERn+rhLlK1icYX0+TrnwYm9PtZyuHmXmVi6vVNAZsoDnct0GByYLY
Lgk28Gx+N4JOJXyzz12qWUHxJRufLqZOiRaEZnL4fMzJPvH20ZbbyjeAwnrDElj0
07Lqk6Yn/S+xkR4sJtQ7fFdej1pvluqhlK8PAw1qKo3XgWdD37x6czuizv0GMGgC
ScrbN0XUy90TpQ3oeUjm3xfGhe0EO8JohAjtaDDPOKc7hkJj1llE2DcxrMi0OOOy
Cm9G3arkD/qqGLFTgfBJgSZcNh++eKWsu4sD3loCyrKAmYwtM2Wyxvpgg4b0g+Fb
OlRZgGohSECBvl8fIekbfPz24YEz9Mcdi/xHcZ6aKJI372cQvi7hycXxe3JnqPJs
/vvDCQ3FXV/UuPAAFjSeyffkJ4zLWa45pK9pGvn6kgnXtUEMdtuiognOMJNf+fYE
qKBcj6+dh9DLFJozveKb3xPImnonq1STsJvKnfZ8PJMVeEHOEtE=
=dKKl
-----END PGP SIGNATURE-----

--sX1sRREMpMr+CsP8--
