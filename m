Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795568457;
	b=W/GAZrPlEsOwOycmQe8eGpc+N5mZzZ9lHHf1nVpEBPVeRKMmohu7tD4y7tSlKw254wPq
	 8y414SFb0hcSljMBnXF0mrshb6sM4iEztd60G8C9+a5U4iZtW4fjmw5blh0VYFyL9+J44
	 716L36Utlso0Q7bMZv6j5OlZe2CLmM0UxmSpCqsrOkqV2xavFk0Ft3WQyF+DNhBlLA0Aq
	 9qeZZTrd1b0eajqxPMVSBlE+p4tLBKZ3lx5YrdCQHng0AmKHIsnLdU9/lTbk26C+fZF5c
	 u8hoj42uDtjmBzLtDTO1OKCZWTLmnkB3m13UJgNmjeEBgWnWfBy9yvI+piOzZetv7Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568457;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qnbwSPp2ywNcgk58ZsxkwH3Crn4C7uDIx+/wb0CFr7w=;
	b=D8o3ceRK5blErLofK58BTeU/Xb6Y3gJWJJXC2kz9SmPgaFOzNEzrRtKCl2p20MvOm91a
	 bC60n16P+hBuxs8goup8VEkeowfIzKnK0E9/PWaMVTuVs9Co2345I7PIStMBd/IMYFPkL
	 dIo6svgC36L5xRPKjC80K130SCWLfof/OsCW/Sv1HD49bnXRtRD3kDVsBE5D0WhuEylGJ
	 GJZ4QqiknGhNwbtdAdWuVYvW+rtC+WccUsJS7y6f10aSM3z3Xw9swPihhdzdTCz63sYRy
	 1hNxFT6ulUurc3ZY99+560+ZciLuJ9Z89H+mh5Zb6OUzc/ni/k9NT3YFO1yn+i9ivDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="X/Xcid0/";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729A6606A31E
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 01:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=X/Xcid0/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795568453;
	bh=qnbwSPp2ywNcgk58ZsxkwH3Crn4C7uDIx+/wb0CFr7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/Xcid0/5lrbCp6ROqd2QxdwHKbCsTHz7FD7GHwExHX2zg+lLu9VdubnNce/OHATf
	 FfueWd/s4puPxldviRx0toueh5eTcwhd2awDfGwsC+LMTn47fer0D/lrR2O4Ra1W2o
	 gwijAXQO+/shzwXmIEydvcN0/yNE5CXvWFAS5wyJiFWSkbfMa5gxAYFGUkipyQfCoz
	 o5kCWrr2vlSjkDNFCL5PjjeB+HCOuh7UXEf6rJlUH3sZqAzNvGJAqMfy5qVrdhi7ZW
	 bHSYcy/wmTEPNgbeAKXodQzLlCKwLSxB3y5xBdDxtfzexWqfAY/1k8boyWprWpG4Af
	 p/Y4GKilFmwXw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ1ZY30BLz4wJr; Wed, 25 Nov 2026 12:00:53 +1100 (AEDT)
Date: Wed, 25 Nov 2026 11:44:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 02/10] dtc: Add a struct for the top-level fragments
 of a dts file
Message-ID: <awYvRAeiVSO9f0ls@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-3-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="7VInEV4SXnoWOyiQ"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-3-sjg@chromium.org>

--7VInEV4SXnoWOyiQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:57:56PM -0700, Simon Glass wrote:
> A dts file is made up of top-level fragments: the root node, later
> definitions of a node by label or path, and /delete-node/ or
> /omit-if-no-ref/ with a reference. We would like to deal with each
> fragment on its own before it is merged, for example to apply deletes
> consistently or to run some checks on each one, but that requires
> keeping the fragments apart. At present the parser merges each one into
> the tree as soon as it is parsed.
>=20
> Add a struct fragment to hold one which refers to a node, with a
> function to build each kind and one to free it.
>=20
> These are not used yet.

After consideration of our previous discussions, I'm leaning towards
using the term "source layer" for these top level components (thanks
for the "layer" suggestion).  It's more verbose than I'd like, but I
think disambiguating from dtb level "fragments" is worth it.

>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Apart from the suggested name change,

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> Changes in v4:
> - Drop build_fragment_root(), append_fragment() and the next pointer
> - Drop label_srcpos, since the position of the reference is enough
> - Shorten the comment on struct fragment
> - Use 0 rather than '\0' in memset()
>=20
> Changes in v2:
> - Add a constructor for each kind of fragment, taking all its fields
> - Add the list to struct dt_info later, when it is first used
> - Change the subject from 'Add a list' to 'Add a struct'
> - Drop path_ref in favour of checking the ref for a leading '/'
> - Replace FRAGMENT_ROOT and FRAGMENT_REF with FRAGMENT_NODE
> - Use a NULL ref for the root node
>=20
>  dtc.h      | 33 +++++++++++++++++++++++++++++++++
>  livetree.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+)
>=20
> diff --git a/dtc.h b/dtc.h
> index 791f815..ac18616 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -318,6 +318,39 @@ struct reserve_info *chain_reserve_entry(struct rese=
rve_info *first,
>  struct reserve_info *add_reserve_entry(struct reserve_info *list,
>  				       struct reserve_info *new);
> =20
> +/*
> + * A fragment is one top-level part of a dts file, after the header and =
any
> + * memory reservations, which refers to a node by label or path: a later
> + * definition of the node, or a /delete-node/ or /omit-if-no-ref/. The r=
oot
> + * node, / { ... };, is not held as a fragment.
> + *
> + * This is not the same as an overlay fragment (a fragment@N node), alth=
ough
> + * in a plugin a fragment may become one when it is merged.
> + */
> +
> +enum fragment_type {
> +	FRAGMENT_NODE,		/* [label:] &ref { ... }; */
> +	FRAGMENT_DELETE_NODE,	/* /delete-node/ &ref; */
> +	FRAGMENT_OMIT_IF_NO_REF, /* /omit-if-no-ref/ &ref; */
> +};
> +
> +/* The label and node are NULL if the fragment does not have them */
> +struct fragment {
> +	enum fragment_type type;
> +	char *ref;			/* label or path referred to */
> +	struct srcpos *ref_srcpos;	/* position of ref */
> +	char *label;			/* label to add to the target */
> +	struct node *node;		/* the node definition */
> +};
> +
> +struct fragment *build_fragment_ref(char *label, char *ref,
> +				    struct srcpos *ref_srcpos,
> +				    struct node *node);
> +struct fragment *build_fragment_delete_node(char *ref,
> +					    struct srcpos *ref_srcpos);
> +struct fragment *build_fragment_omit_if_no_ref(char *ref,
> +					       struct srcpos *ref_srcpos);
> +void free_fragment(struct fragment *f);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
> diff --git a/livetree.c b/livetree.c
> index abe73de..4231c64 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -448,6 +448,58 @@ struct reserve_info *add_reserve_entry(struct reserv=
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
> +	memset(new, 0, sizeof(*new));
> +
> +	new->type =3D type;
> +	new->ref =3D ref;
> +	new->ref_srcpos =3D srcpos_copy(ref_srcpos);
> +
> +	return new;
> +}
> +
> +/* Create a fragment for [label:] &ref { ... }; where label is NULL if a=
bsent */
> +struct fragment *build_fragment_ref(char *label, char *ref,
> +				    struct srcpos *ref_srcpos,
> +				    struct node *node)
> +{
> +	struct fragment *new =3D new_fragment(FRAGMENT_NODE, ref, ref_srcpos);
> +
> +	new->label =3D label;
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
> +/*
> + * Free a fragment, but not its node, reference or label, since the tree=
 may
> + * still use these
> + */
> +void free_fragment(struct fragment *f)
> +{
> +	srcpos_free(f->ref_srcpos);
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

--7VInEV4SXnoWOyiQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGL0QACgkQzQJF27ox
2GcsMw/9G2cIvJyg1bO5g8egjU2mNO9kjKN5h4MCMilyTWTjGZRBKVShpyIjB/It
15CfGFxlpUCV/duqmbt1MWvH51DCnQjm95fsvlp2mqtLG5BzBmqRAEILEmx6CBeA
hD9uBQOsIHGEXsjbgWY02zvKb0RKkLf9j0lLGDJYOk6XclciQRw+sgdIkyYhOsoU
LMnJP6SrOykkhOHnC9qcq24ERHyBebRxeghc3+CqX9QAXdm4uPM84Sr6Ygdkg5/s
UTHhH8Rh57t5wOQmxMTW7djrB16yQMPB9GElTD6oA9a4q6vAseY/4bscJya4uTFX
Vo2iYecbzwPu9gx9xakPTgBnzyhtWx+Vgx8O73p/UgL5DtNbzxuRH1jiC+VKlFtJ
aZHNYQiaI991Xh5MjlvUjNRAjql/YI95nwCh8eZT4IqEGOoN+PNXfKtoj7424XFW
6MOXbTPXkXDfT2M5GZzX55b+tDt8njnUd4+QLdgil77Ww9PN6CWdhKvV9EBO8HsK
OwNXoPREL6Ao2YdLaPuQdYc1qh0Ji8cYADsFEsVTDzGDtYe5267znYHeHUwdfwP3
Mu82l2qgXhnNppJe6wAHWKh+w0YGRVPQl/Oh1ou+yN7vLIqwqomuf2+dXrzAyspq
Tg74sQxJ3iHXsruW6I4cet1N6TtGkW+MvZnyyvBniUMpciZ+mu8=
=EtcJ
-----END PGP SIGNATURE-----

--7VInEV4SXnoWOyiQ--
