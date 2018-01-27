From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/3 v3] annotations: add positions
Date: Sat, 27 Jan 2018 21:09:28 +1100
Message-ID: <20180127100928.GD12900@umbus>
References: <1516746091-28522-1-git-send-email-Julia.Lawall@lip6.fr>
 <1516746091-28522-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1517047789;
        bh=agPHrMLcc7Xl4X7iev4Mb0LrPoc+9HvJxuyQ90+nBy0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Aw3uFkjvekyD+VUXUgrOgohWj15uYVNNN1PBOE5cjqHT/eM1cAMTLXvOQhNBp1DNN
         +qjYbEZLClKdaAxUPamsqdwbefUMisVyqkN4QZ0dIhxseIPwTH6ynO3/U5DE73tuOq
         UX2JhbCtEm+/pkTmyktLOMIVBH1pM9JRAx3vaBx0=
Content-Disposition: inline
In-Reply-To: <1516746091-28522-3-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>


--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2018 at 11:21:30PM +0100, Julia Lawall wrote:
> The parser is extended to record positions, in build_node,
> build_node_delete, and build_property.
>=20
> srcpos structures are added to the property and node types, and to the
> parameter lists of the above functions that construct these types.
> Nodes and properties that are created by the compiler rather than from
> parsing source code have NULL as the srcpos value.
>=20
> merge_nodes, defined in livetree.c uses srcpos_extend to combine
> multiple positions, resulting in a list of positions. srcpos_extend is
> defined in srcpos.c and removes duplicates.
>=20
> Another change to srcpos.c is to make srcpos_copy always do a full copy,
> including a copy of the file substructure.  This is required because
> when dtc is used on the output of cpp, the successive detected file
> names overwrite the file name in the file structure.  The next field
> does not need to be deep copied, because it is only updated in newly
> copied positions and the positions to which it points have also been
> copied.  File names are only updated in uncopied position structures.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

This is looking pretty good, but a few remaining nits.

[snip]
> @@ -169,6 +175,7 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
> =20
>  				old_prop->val =3D new_prop->val;
>  				old_prop->deleted =3D 0;

You need to free old_prop->srcpos here first, no?

> +				old_prop->srcpos =3D new_prop->srcpos;
>  				free(new_prop);
>  				new_prop =3D NULL;
>  				break;
> @@ -209,6 +216,8 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>  			add_child(old_node, new_child);
>  	}
> =20
> +	old_node->srcpos =3D srcpos_extend(new_node->srcpos, old_node->srcpos);
> +
>  	/* The new node contents are now merged into the old node.  Free
>  	 * the new node. */
>  	free(new_node);
> @@ -216,7 +225,7 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>  	return old_node;
>  }
> =20
> -struct node * add_orphan_node(struct node *dt, struct node *new_node, ch=
ar *ref)
> +struct node *add_orphan_node(struct node *dt, struct node *new_node, cha=
r *ref)

Extraneous whitespace change.

>  {
>  	static unsigned int next_orphan_fragment =3D 0;
>  	struct node *node;
> @@ -227,12 +236,12 @@ struct node * add_orphan_node(struct node *dt, stru=
ct node *new_node, char *ref)
>  	d =3D data_add_marker(d, REF_PHANDLE, ref);
>  	d =3D data_append_integer(d, 0xffffffff, 32);
> =20
> -	p =3D build_property("target", d);
> +	p =3D build_property("target", d, NULL);
>  	xasprintf(&name, "fragment@%u",
>  			next_orphan_fragment++);
>  	name_node(new_node, "__overlay__");
> -	node =3D build_node(p, new_node);
> +	node =3D build_node(p, new_node, NULL);
>  	name_node(node, name);
> =20
>  	add_child(dt, node);
> @@ -331,7 +340,8 @@ void append_to_property(struct node *node,
>  		p->val =3D d;
>  	} else {
>  		d =3D data_append_data(empty_data, data, len);
> -		p =3D build_property(name, d);
> +		/* used from fixup or local_fixup, so no position */
> +		p =3D build_property(name, d, NULL);
>  		add_property(node, p);
>  	}
>  }
> @@ -587,13 +597,17 @@ cell_t get_node_phandle(struct node *root, struct n=
ode *node)
>  	    && (phandle_format & PHANDLE_LEGACY))
>  		add_property(node,
>  			     build_property("linux,phandle",
> -					    data_append_cell(empty_data, phandle)));
> +					    data_append_cell(empty_data,
> +							     phandle),
> +					    NULL));
> =20
>  	if (!get_property(node, "phandle")
>  	    && (phandle_format & PHANDLE_EPAPR))
>  		add_property(node,
>  			     build_property("phandle",
> -					    data_append_cell(empty_data, phandle)));
> +					    data_append_cell(empty_data,
> +							     phandle),
> +					    NULL));
> =20
>  	/* If the node *does* have a phandle property, we must
>  	 * be dealing with a self-referencing phandle, which will be
> @@ -767,7 +781,7 @@ static struct node *build_and_name_child_node(struct =
node *parent, char *name)
>  {
>  	struct node *node;
> =20
> -	node =3D build_node(NULL, NULL);
> +	node =3D build_node(NULL, NULL, NULL);
>  	name_node(node, xstrdup(name));
>  	add_child(parent, node);
> =20
> @@ -827,9 +841,11 @@ static void generate_label_tree_internal(struct dt_i=
nfo *dti,
>  			}
> =20
>  			/* insert it */
> +			/* no position information for symbols and aliases */
>  			p =3D build_property(l->label,
>  				data_copy_mem(node->fullpath,
> -						strlen(node->fullpath) + 1));
> +					      strlen(node->fullpath) + 1),
> +				NULL);
>  			add_property(an, p);
>  		}
> =20
> diff --git a/srcpos.c b/srcpos.c
> index 9dd3297..a2d621f 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -207,6 +207,7 @@ struct srcpos srcpos_empty =3D {
>  	.last_line =3D 0,
>  	.last_column =3D 0,
>  	.file =3D NULL,
> +	.next =3D NULL,
>  };
> =20
>  void srcpos_update(struct srcpos *pos, const char *text, int len)
> @@ -234,13 +235,52 @@ struct srcpos *
>  srcpos_copy(struct srcpos *pos)
>  {
>  	struct srcpos *pos_new;
> +	struct srcfile_state *srcfile_state;
> +
> +	if (!pos)
> +		return NULL;
> =20
>  	pos_new =3D xmalloc(sizeof(struct srcpos));
>  	memcpy(pos_new, pos, sizeof(struct srcpos));
> =20
> +	if (pos_new) {

No need for this test, xmalloc() will abort on failure.

> +		/* allocate without free */
> +		srcfile_state =3D xmalloc(sizeof(struct srcfile_state));
> +		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
> +
> +		pos_new->file =3D srcfile_state;
> +	}
> +
>  	return pos_new;
>  }
> =20
> +static bool same_pos(struct srcpos *p1, struct srcpos *p2)
> +{
> +	return (p1->first_line =3D=3D p2->first_line &&
> +		p1->first_column =3D=3D p2->first_column &&
> +		p1->last_line =3D=3D p2->last_line &&
> +		p1->last_column =3D=3D p2->last_column &&
> +		!strcmp(p1->file->name, p2->file->name));
> +}
> +
> +struct srcpos *srcpos_extend(struct srcpos *pos, struct srcpos *newtail)
> +{
> +	struct srcpos *next, *p;
> +
> +	if (!pos)
> +		return newtail;

I'm having a lot of trouble following this.  You've got both a
recursion and a loop through the list, so you seem to have an O(n^2)
with multiple redundant checks.

> +
> +	next =3D srcpos_extend(pos->next, newtail);
> +
> +	for (p =3D next; p !=3D NULL; p =3D p->next)
> +		if (same_pos(pos, p))
> +			return next;
> +
> +	pos =3D srcpos_copy(pos);

And while I'm not *that* fussed by memory leaks, I have a nasty
feeling this will leak stuff at every level of the recursion, which is
a bit much.

> +	pos->next =3D next;
> +	return pos;
> +}
> +
>  char *
>  srcpos_string(struct srcpos *pos)
>  {
> diff --git a/srcpos.h b/srcpos.h
> index 9ded12a..d88e7cb 100644
> --- a/srcpos.h
> +++ b/srcpos.h
> @@ -74,6 +74,7 @@ struct srcpos {
>      int last_line;
>      int last_column;
>      struct srcfile_state *file;
> +    struct srcpos *next;
>  };
> =20
>  #define YYLTYPE struct srcpos
> @@ -105,6 +106,8 @@ extern struct srcpos srcpos_empty;
> =20
>  extern void srcpos_update(struct srcpos *pos, const char *text, int len);
>  extern struct srcpos *srcpos_copy(struct srcpos *pos);
> +extern struct srcpos *srcpos_extend(struct srcpos *new_srcpos,
> +				    struct srcpos *old_srcpos);
>  extern char *srcpos_string(struct srcpos *pos);
> =20
>  extern void PRINTF(3, 0) srcpos_verror(struct srcpos *pos, const char *p=
refix,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpsT9UACgkQbDjKyiDZ
s5L+FxAAuGkiB2soRJ3xI0ZOGpTDW4CcEqgFeVtIpNIKBTPTMao6jWo5Ew+FKph2
B6Mveh5umnT8pjKqBSDReIiuWIdnYlwbYHzCLvNK2/ix2HasCG7HXF3Mgrr6YRGe
xrj4y4Zf+xIi+/Ta1mI6yZVLwLH8k1MSaIjy4QFj3hN6BNwRnLcBavR0Mw+Xv395
IceCRa22s3+B2dmbLmCZcWzE60ZjNqpyd5cZU4Wiz4yhJRQ1Gg4f8avlkhju23eC
NaAmZHiuPln/LAOboylYmoHTIu6YhBn6ilv+HobX5zP9OaTOhAEyV+vfdHCZM+hW
xhv2Kt8RDeoSGyox9rHSQKxMLCaWBdkYdDuWsFas6aTmA/zyqUcb/7z7+6QRhZje
kkybW5wxEThVHr5UA21tpXUJGD9hID2uVf/slEotH2wS5lrWPD2gJifOLRTkzJkb
2W56D3wQKfDPJn/7Mesw+irEWKCXGskRQa3EaWJlc3C8Q9ccuhW5MqNXYJ9z9iwQ
shTZbvMkbs3fa96IrRtCdVVMLb4ioje9MMuReEjMGJY0w6GnA7iPFkheL/YfqH5v
Q8F/omgO/c4pFLjwe+Cw0TA1HXA6mCvbvTqOWPrI5sVOO2jB3V+gmZLSX0w/FyQ6
hbJPlHP7INsLwUxA1ZXVBC1FEehav8xR3SMcXuOwle58fa1ZCHM=
=WYJ6
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
