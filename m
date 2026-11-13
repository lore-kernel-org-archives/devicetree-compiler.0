Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541593;
	b=nH+hyYuHFir53WRnd7ykRahL/rsFnlm4gtOsmCkGa6P6aCrTcuip3RWckT3p5/yatLnn
	 xNy2tdkXP7LqzjiT3WE2hxhrQkLqPkEBN1jehYI5G9Ylp9Gfnu/XR2+mzlUj0Cew/dLTZ
	 gfQfF9gt2YGkUxni9aneVCK8ODnToJK+D588H41NIkZegy1IJ5cMyhEIvNIizATziGdgV
	 TOAVcEdxDav+3CprOzMlgLNVsVArldjYNqeSbKpzeQCdVZMffve8G9gXEy1bm6p6BttDx
	 0f4XpKrbbCiTg2JR4+gqWPz4LvzWsu9pecfh9zx7bC0jkwzPi09ywB79LNyBsjKV0HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541593;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=1Bo+ru8zuh5oW9uut0537VYdhks2Lwat4o+A2I1whoQ=;
	b=urhA6SwMysBhZadqXzaIv6zTg/bICqO4IafMkNFiWMa5/yoyZdtYbIvqNMZHiVqjU2lT
	 vOb+1DkXfBb6WOmdEA8RChWdpRRidflUAY5BXpP81Y1X61eQN7e9qUEKMMXUEhcZQ6MkJ
	 DmX5lx2M6uhOIvVPP7as1clQxOHOd0wss/pPzwdqyo7ceMKzBV5MjgFC2ZAdf6MggHens
	 YE8sIWb+fVW5mI0ldhBbfUdFj7FFRpwVX4mrbHhKqiyKbtAjjJRdCBBfjMu4j2OnBZNry
	 fyt0SvrZMcdjtnBrvMeP5RjR18iTYUwB3vLW4Io8FTfGmtpDLKN4fdnqfXe4SU1INeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="LLn/xktf";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF29606A323
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 03:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF29606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=LLn/xktf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794541590;
	bh=1Bo+ru8zuh5oW9uut0537VYdhks2Lwat4o+A2I1whoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLn/xktflYkHC46BbmVFoqU/VP+g0iiyY00RPPdMakH0F14Wu7dSJmm00AqgMP2pn
	 ducu2tGtSrH9HYium7aVrg1PkhO7E/NO0Z0/xdoikepg/kyZuypxu8H/aFwaIGqLN/
	 4IhWS/p7XaoWMq0grknRExTo/RYQBhSfRMa/4T2wFH5QeL5FOcd90kG5zHF6RwlSL4
	 B/mq0mu3luCuh2+0UwYEcrC7aXMNjox0P6dcFgucdaF7zaI7HChpT4+xuNcj3OzX4r
	 MdA8Ffyqnei+IMl2dxt/6cuMs/BzN95ah0gcETzR9HrA5QNZ2PIjtRqUobljUOHq6/
	 s6jBueeiGkbSg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQjqB1Jr0z4wTj; Fri, 13 Nov 2026 14:46:30 +1100 (AEDT)
Date: Fri, 13 Nov 2026 14:46:18 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 03/18] dtc: Add a struct for the top-level fragments
 of a dts file
Message-ID: <avaICebAFUAc4cyb@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-4-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="G4i/83COCT4zZQPN"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-4-sjg@chromium.org>

--G4i/83COCT4zZQPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:30PM -0700, Simon Glass wrote:
> A dts file is made up of top-level fragments: the root node, later
> definitions of a node by label or path, and /delete-node/ or
> /omit-if-no-ref/ with a reference. We would like to deal with each
> fragment on its own before it is merged, for example to apply deletes
> consistently or to run some checks on each one, but that requires
> keeping the fragments apart. At present the parser merges each one into
> the tree as soon as it is parsed.
>=20
> Add a struct fragment to hold one of these, with a function to build
> each kind, and functions to append one to a list and to free it.
>=20
> These are not used yet.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> David, you asked why the root needs a special type, rather than setting
> ref to "/". This drops the type, but uses a NULL ref rather than "/",
> since the two differ in a plugin: / { ... } adds to the plugin's own
> root, whereas &{/} { ... } becomes a fragment@N node for the root of the
> base tree. Using "/" for both would change the output.
> merge-root-plugin.dts checks this.
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Replace FRAGMENT_ROOT and FRAGMENT_REF with FRAGMENT_NODE
> - Use a NULL ref for the root node
> - Drop path_ref in favour of checking the ref for a leading '/'
> - Add a constructor for each kind of fragment, taking all its fields
> - Add the list to struct dt_info later, when it is first used
> - Change the subject from 'Add a list' to 'Add a struct'
>=20
>  dtc.h      | 50 ++++++++++++++++++++++++++++++++
>  livetree.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
>=20
> diff --git a/dtc.h b/dtc.h
> index 473552e..f15a162 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -322,6 +322,56 @@ struct reserve_info *chain_reserve_entry(struct rese=
rve_info *first,
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
> +	FRAGMENT_NODE,		/* / { ... }; or [label:] &ref { ... }; */
> +	FRAGMENT_DELETE_NODE,	/* /delete-node/ &ref; */
> +	FRAGMENT_OMIT_IF_NO_REF, /* /omit-if-no-ref/ &ref; */
> +};
> +
> +/*
> + * Which fields are used depends on the type:
> + *
> + *   FRAGMENT_NODE            node, plus ref and ref_srcpos unless it is=
 the
> + *                            root node, plus label and label_srcpos if =
there
> + *                            is a label
> + *   FRAGMENT_DELETE_NODE     ref and ref_srcpos
> + *   FRAGMENT_OMIT_IF_NO_REF  ref and ref_srcpos
> + *
> + * Unused fields are NULL. For / { ... }; the ref is NULL rather than "/=
", since
> + * in a plugin &{/} { ... }; refers to the root of the base tree instead.

With this version, I think these fields are clearer, and there's less
need for describing this.  All fields are always "valid" in the sense
that they're initialized to something sensible, though they might be
NULL in some cases (and must be for certain types).

> + */
> +struct fragment {
> +	enum fragment_type type;
> +	char *ref;			/* label or path referred to */
> +	struct srcpos *ref_srcpos;	/* position of ref */
> +	char *label;			/* label to add to the target */
> +	struct srcpos *label_srcpos;	/* position of label */

What's label_srcpos used for, distinct from ref_srcpos?  The'll almost
always be in adjacent places on the same line.

> +	struct node *node;		/* the node definition */
> +
> +	struct fragment *next;		/* NULL at the end of the list */
> +};
> +
> +struct fragment *build_fragment_root(struct node *node);
> +struct fragment *build_fragment_ref(char *label, struct srcpos *label_sr=
cpos,
> +				    char *ref, struct srcpos *ref_srcpos,
> +				    struct node *node);
> +struct fragment *build_fragment_delete_node(char *ref,
> +					    struct srcpos *ref_srcpos);
> +struct fragment *build_fragment_omit_if_no_ref(char *ref,
> +					       struct srcpos *ref_srcpos);
> +struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
> +void free_fragment(struct fragment *f);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
> diff --git a/livetree.c b/livetree.c
> index abe73de..85725d3 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -448,6 +448,91 @@ struct reserve_info *add_reserve_entry(struct reserv=
e_info *list,
>  	return list;
>  }
> =20
> +/* Create a fragment of the given type, with its other fields NULL */
> +static struct fragment *new_fragment(enum fragment_type type, char *ref,
> +				     struct srcpos *ref_srcpos)
> +{
> +	struct fragment *new =3D xmalloc(sizeof(*new));
> +
> +	memset(new, '\0', sizeof(*new));

I'd use 0 rather than '\0' here - I'd only use the latter when the
thing we're zeroing is a string buffer.

> +
> +	new->type =3D type;
> +	new->ref =3D ref;
> +	new->ref_srcpos =3D srcpos_copy(ref_srcpos);
> +
> +	return new;
> +}
> +
> +/* Create a fragment for / { ... }; */
> +struct fragment *build_fragment_root(struct node *node)
> +{
> +	struct fragment *new =3D new_fragment(FRAGMENT_NODE, NULL, NULL);

I think this should also take a srcpos: after all the fragment itself
(and the literal "/") does have a position in the source, even if it
isn't a ref token.  I'm ok if the caller passes NULL for now, if it's
awkward to extract the srcpos at present.

In fact, I think the root fragment could be treated as a special case
of a ref fragment (with ref =3D=3D NULL, for now), so having this call
build_fragment_ref would make sense.

> +
> +	new->node =3D node;
> +
> +	return new;
> +}
> +
> +/*
> + * Create a fragment for [label:] &ref { ... }; where label and label_sr=
cpos are
> + * NULL if there is no label
> + */
> +struct fragment *build_fragment_ref(char *label, struct srcpos *label_sr=
cpos,
> +				    char *ref, struct srcpos *ref_srcpos,
> +				    struct node *node)
> +{
> +	struct fragment *new =3D new_fragment(FRAGMENT_NODE, ref, ref_srcpos);
> +
> +	new->label =3D label;
> +	new->label_srcpos =3D srcpos_copy(label_srcpos);
> +	new->node =3D node;
> +
> +	return new;
> +}
> +
> +/* Create a fragment for /delete-node/ &ref; */
> +struct fragment *build_fragment_delete_node(char *ref,
> +					    struct srcpos *ref_srcpos)
> +{
> +	return new_fragment(FRAGMENT_DELETE_NODE, ref, ref_srcpos);
> +}
> +
> +/* Create a fragment for /omit-if-no-ref/ &ref; */
> +struct fragment *build_fragment_omit_if_no_ref(char *ref,
> +					       struct srcpos *ref_srcpos)
> +{
> +	return new_fragment(FRAGMENT_OMIT_IF_NO_REF, ref, ref_srcpos);
> +}
> +
> +/* Add a fragment to the end of a list, returning the new head */
> +struct fragment *append_fragment(struct fragment *list, struct fragment =
*new)

Since this is used from the parser, I think we can make this a bit
more similar to existing code as a quasi-functional chain_fragment(),
similar to the existing chain_node().  Technically that also removes
an O(n^2) behaviour, although not with an n that's likely to matter.

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
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--G4i/83COCT4zZQPN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2iAkACgkQzQJF27ox
2GetDw/9HyyttneWQZrWUhJKsjnjIwt4lkAnVOQ6uNKyokfOyy9t44VGtn9aD4b0
k4g00/cR0v+TnBByoeE3g3Iir1huxude6xnjHEu7wqTqeE/DlTZXidx7GHCGQI2f
XpQ6uATa2Km4GpXZgVDqFgZ+lKCD73isxu2MKZKgKDVqS8edvp2FQMAb5kq2+cDr
LYG9zw+ke8QZE+b/jbs5CgarSuYXp8f4Uax4ATmTGHRN2scZF2A/o7rZd891bUOp
au0pbVccj7TDoXNUjuzNOxGDPbRO/DLgWDyMISeejqjYTpA8UlyXk+3u+aZH0fHF
VVTn79qAr7Jbguk3iUnzc/chjTDSOIeuSs2yeFUuoBrS4m7IIiR8DPQNfeFXnu+s
XK8+hnauJr5sphlKL1ylFzvE0X8NGAZBOWR/jPbAYGk+FDIjOJxRv5fzo9B4z3Wq
e+PiM7iyGI/WWCklrWUgqxJ7aQwJGGw9gh0mYWCSGsQpdNiA488wnwdAqLHihARN
oBD62y0CbVNmYdFWvSP/r5jpatOsQVBjFsYDFRE7OcjyEEyNUNcnDctKMB4Hz7qZ
LmqJwu5aMM3VPLJkbNj/U/5ICi2qKTu0Uz/HLWVTp2jIc/AB/98uu5860h2/Sg0q
i6EHvr2dZ5vumQ+w69eYlzTC4vKtiZxYuB63ZD14n4mWK2Jwp2M=
=XHUr
-----END PGP SIGNATURE-----

--G4i/83COCT4zZQPN--
