From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: When compiling to dts interpret /__symbols__ and
 /__local_fixups__
Date: Fri, 28 Apr 2023 16:11:45 +1000
Message-ID: <ZEtjoSXF/X1osv2B@yekko>
References: <20230426182558.573161-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fjiK0r9GDgARwbxN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682664657;
        bh=G3b98/fwIfO61jm4cP0MHxirOTbVCrECen2jSV83dRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h+VwmrI8EHoYXWpvAs1hbcZHsnGAENMctYKSk+DtfCTJiP0PG437GY9kZSQQguhhI
         nkZfkjqJlBeNkjw0oqny/FvN1XMLufu9Nvs7YXV96dl5jbsRE28rH8tLOPA2eoYWde
         ZUYHnUfICwmbHnBApxq3YLvn52+aAh2/tcH6rCqU=
Content-Disposition: inline
In-Reply-To: <20230426182558.573161-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--fjiK0r9GDgARwbxN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023 at 08:25:58PM +0200, Uwe Kleine-K=F6nig wrote:
> The data contained in these nodes can be used to restore labels for nodes
> (from __symbols__ if -@ is given) and to identify which data values are
> references (from __local_fixups__ if -L is given).

Oh, that's a neat idea.

> The resulting dts doesn't necessarily compiles back into the bitwise same
> dtb,

Hmm.. in exactly what ways can it differ?  Is that different from what
could happen before?  Generally a dtb -> dts -> dtb round trip should
be a no-op to a pretty high degree of fidelity.  That's not true of a
dts -> dtb -> dts round trip, since there are many more ways to
express things in source form.

> but the result is equivalent and easier to modify without breaking
> references.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  dtc.c        | 16 +++++++---
>  dtc.h        |  2 ++
>  livetree.c   | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  treesource.c | 37 +++++++++++++++------
>  4 files changed, 132 insertions(+), 13 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index d2e4e2b55b5c..e36f0dfad313 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -335,12 +335,20 @@ int main(int argc, char *argv[])
>  	if (auto_label_aliases)
>  		generate_label_tree(dti, "aliases", false);
> =20
> -	if (generate_symbols)
> -		generate_label_tree(dti, "__symbols__", true);
> +	if (generate_symbols) {
> +		if (streq(inform, "fs") || streq(inform, "dtb"))
> +			generate_labels_from_tree(dti, "__symbols__");
> +		else
> +			generate_label_tree(dti, "__symbols__", true);

Changing behaviour of what we do to the tree based on the input format
smells a bit wrong to me.  Should we maybe be importing any existing
label information from __symbols__, then re-generating it all cases
(effectively merging any symbols from source parsing with ones given
in __symbols__).

> +	}
> =20
>  	if (generate_fixups) {
> -		generate_fixups_tree(dti, "__fixups__");
> -		generate_local_fixups_tree(dti, "__local_fixups__");
> +		if (streq(inform, "fs") || streq(inform, "dtb")) {

Similar question here.

> +			fixup_local_phandles(dti, "__local_fixups__");
> +		} else {
> +			generate_fixups_tree(dti, "__fixups__");
> +			generate_local_fixups_tree(dti, "__local_fixups__");
> +		}
>  	}
> =20
>  	if (sort)
> diff --git a/dtc.h b/dtc.h
> index 4c4aaca1fc41..4c278ed30b26 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -337,8 +337,10 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  			      struct node *tree, uint32_t boot_cpuid_phys);
>  void sort_tree(struct dt_info *dti);
>  void generate_label_tree(struct dt_info *dti, const char *name, bool all=
ocph);
> +void generate_labels_from_tree(struct dt_info *dti, const char *name);
>  void generate_fixups_tree(struct dt_info *dti, const char *name);
>  void generate_local_fixups_tree(struct dt_info *dti, const char *name);
> +void fixup_local_phandles(struct dt_info *dti, const char *name);
> =20
>  /* Checks */
> =20
> diff --git a/livetree.c b/livetree.c
> index 0ec47ed41e2b..a4fa5278718e 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -1056,6 +1056,25 @@ void generate_label_tree(struct dt_info *dti, cons=
t char *name, bool allocph)
>  				     dti->dt, allocph);
>  }
> =20
> +void generate_labels_from_tree(struct dt_info *dti, const char *name)
> +{
> +	struct node *an;
> +	struct property *p;
> +
> +	an =3D get_subnode(dti->dt, name);
> +	if (!an)
> +		return;
> +
> +	for_each_property(an, p) {
> +		struct node *labeled_node;
> +
> +		labeled_node =3D get_node_by_path(dti->dt, p->val.val);

Need to handle failures here, if the given path doesn't exist.

> +		add_label(&labeled_node->labels, p->name);
> +	}
> +
> +	delete_node(an);
> +}
> +
>  void generate_fixups_tree(struct dt_info *dti, const char *name)
>  {
>  	if (!any_fixup_tree(dti, dti->dt))
> @@ -1071,3 +1090,74 @@ void generate_local_fixups_tree(struct dt_info *dt=
i, const char *name)
>  	generate_local_fixups_tree_internal(dti, build_root_node(dti->dt, name),
>  					    dti->dt);
>  }
> +
> +static void fixup_local_phandles_node(struct node *lf, struct node *n)
> +{
> +	struct property *lfp;
> +	struct node *lfsubnode;
> +
> +	for_each_property(lf, lfp) {
> +		struct property *p =3D get_property(n, lfp->name);

You shouldn't need this, lfp should already be the property you want.

> +		size_t i;
> +
> +		if (!p || p->val.len % sizeof(fdt32_t))
> +			die("invalid length of property %s in node %s\n", lfp->name, lf->full=
path);

It would be really nice for this not to be a fatal error.

> +		for (i =3D 0; i < lfp->val.len; i +=3D sizeof(fdt32_t)) {
> +			struct marker *m, **mi;
> +
> +			m =3D xmalloc(sizeof(*m));
> +			m->offset =3D fdt32_to_cpu(*(fdt32_t *)(lfp->val.val + i));

I think this would be cleaner if you case the whole property to an
array of integers.  See for example how 'cells' is handled in
check_pci_bridge().

> +			m->type =3D REF_PHANDLE;
> +			m->ref =3D NULL;

Hmm.. so this introduces a whole new state for a marker to be in (ref
=3D=3D NULL), with new internal semantics.  Have you checked that every
single place that looks at the markers handles this case?


> +
> +			/* keep the list sorted in ascending ->offset order */
> +			for (mi =3D &p->val.markers; *mi && (*mi)->offset < m->offset;)
> +				mi =3D &(*mi)->next;
> +
> +			m->next =3D *mi;
> +			*mi =3D m;

Probably cleaner if you add a helper for this operation, say
'data_insert_marker()'.

> +		}
> +	}
> +
> +	for_each_child(lf, lfsubnode) {
> +		struct node *subnode =3D get_subnode(n, lfsubnode->name);
> +
> +		if (!subnode)
> +			die("fixup for non-existent node in %s\n", lfsubnode->fullpath);

Again, because this is, arguably, just adding cosmetic information it
would be much nicer if it wasn't a fatal error.

> +		fixup_local_phandles_node(lfsubnode, subnode);
> +	}
> +}
> +
> +static void drop_phandles(struct node *n)

I don't really understand why you want to remove the phandle properties.

> +{
> +	struct property *p;
> +	struct node *sn;
> +
> +	p =3D get_property(n, "phandle");
> +	if (p)
> +		delete_property(p);
> +
> +	p =3D get_property(n, "linux,phandle");
> +	if (p)
> +		delete_property(p);
> +
> +	for_each_child(n, sn)
> +		drop_phandles(sn);
> +}
> +
> +void fixup_local_phandles(struct dt_info *dti, const char *name)
> +{
> +	struct node *an;
> +
> +	an =3D get_subnode(dti->dt, name);
> +	if (!an)
> +		return;
> +
> +	fixup_local_phandles_node(an, dti->dt);
> +
> +	drop_phandles(dti->dt);
> +
> +	delete_node(an);
> +}
> diff --git a/treesource.c b/treesource.c
> index de30188189fb..32f3171c14c3 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -172,7 +172,7 @@ static enum markertype guess_value_type(struct proper=
ty *prop)
>  	return TYPE_UINT8;
>  }
> =20
> -static void write_propval(FILE *f, struct property *prop)
> +static void write_propval(FILE *f, struct node *root, struct property *p=
rop)
>  {
>  	size_t len =3D prop->val.len;
>  	struct marker *m =3D prop->val.markers;
> @@ -219,6 +219,9 @@ static void write_propval(FILE *f, struct property *p=
rop)
>  		if (emit_type =3D=3D TYPE_NONE || chunk_len =3D=3D 0)
>  			continue;
> =20
> +		if (m->offset !=3D 0)
> +			fputc(' ', f);

I'm not sure how this change is related to anything else.

>  		switch(emit_type) {
>  		case TYPE_UINT16:
>  			write_propval_int(f, p, chunk_len, 2);
> @@ -230,10 +233,26 @@ static void write_propval(FILE *f, struct property =
*prop)
>  					break;
> =20
>  			if (m_phandle) {
> -				if (m_phandle->ref[0] =3D=3D '/')
> -					fprintf(f, "&{%s}", m_phandle->ref);
> -				else
> -					fprintf(f, "&%s", m_phandle->ref);
> +				if (m_phandle->ref) {
> +					if (m_phandle->ref[0] =3D=3D '/')
> +						fprintf(f, "&{%s}", m_phandle->ref);
> +					else
> +						fprintf(f, "&%s", m_phandle->ref);
> +				} else {
> +					cell_t phandle =3D fdt32_to_cpu(*(const fdt32_t *)p);
> +					struct node *n =3D get_node_by_phandle(root, phandle);
> +
> +					if (!n) {
> +						fprintf(f, "&??");

In this case you will present strictly less information than before
"&??" instead of whatever integer value was there.  That doesn't seem
ideal.

> +					} else {
> +						if (n->labels) {
> +							fprintf(f, "&%s", n->labels->label);
> +						} else {
> +							fprintf(f, "&{%s}", n->fullpath);

DT paths can have some slightly odd characters in them, have you
verified that you don't need any escaping here?

> +						}
> +					}
> +
> +				}
>  				if (chunk_len > 4) {
>  					fputc(' ', f);
>  					write_propval_int(f, p + 4, chunk_len - 4, 4);
> @@ -270,7 +289,7 @@ static void write_propval(FILE *f, struct property *p=
rop)
>  	fprintf(f, "\n");
>  }
> =20
> -static void write_tree_source_node(FILE *f, struct node *tree, int level)
> +static void write_tree_source_node(FILE *f, struct node *root, struct no=
de *tree, int level)
>  {
>  	struct property *prop;
>  	struct node *child;
> @@ -299,11 +318,11 @@ static void write_tree_source_node(FILE *f, struct =
node *tree, int level)
>  		for_each_label(prop->labels, l)
>  			fprintf(f, "%s: ", l->label);
>  		fprintf(f, "%s", prop->name);
> -		write_propval(f, prop);
> +		write_propval(f, root, prop);
>  	}
>  	for_each_child(tree, child) {
>  		fprintf(f, "\n");
> -		write_tree_source_node(f, child, level+1);
> +		write_tree_source_node(f, root, child, level+1);
>  	}
>  	write_prefix(f, level);
>  	fprintf(f, "};");
> @@ -333,5 +352,5 @@ void dt_to_source(FILE *f, struct dt_info *dti)
>  			(unsigned long long)re->size);
>  	}
> =20
> -	write_tree_source_node(f, dti->dt, 0);
> +	write_tree_source_node(f, dti->dt, dti->dt, 0);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fjiK0r9GDgARwbxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRLY5oACgkQzQJF27ox
2Gc1/A//QjZeedxBNyWMdAu6cw71KwC5zagsfOR9ATBSYSbgCdq8fgw1hRMsTVv0
EKe8nU6sPd1LupU6AgmD+0JYxNEjNgtO6yznU1a6kuGT6l3v2/udSy9y5YfdGbJw
y9LcyfZ3yXcGkIdDHHczD9eXidDFq56VsnvaalRnMm1kWZl3keXV4IbMndWJ0Rkm
CEff4JvUhNB1RsahwHQTJi2BrWNU0y7iDcJOSZkd7SoWgQ76QKGfnzvpW0g5vtUt
t7GVHMJxpq4l2oyUN8F1gNGSLXlqN8Zk3O8DKazlF4wagpnShY1RPPDyOIVjut+0
IN/Q6PvqfL3M1JB47HmwvqMrNgzAmwp4r8+M+c/WagjKLhgQjq57GaZOSleHCeWr
jdhyOuey3m9QVLBY0LflB67j/Doe1PztSXcO7VlD6FMOj9tx5+45Yt3rRfRNwHlD
z/s33XdTDA6wmuQDj12kTalXsKMKuzMcE0PKQZXVQIfzBg/QAUOmOafk1XC39cik
l1d6uNKUut6dpOpkNg4HeT3FZ6T9OI0uYRurBXEbX/H6aAS75nITzlduvH1Dxb/L
oe5rCgZA14+EDWCBVLF3qkzyL4Si6V/kXnCPnqmf948PmEVTnzE2jb7VxmHBpi5b
aDh/Cz2yOKhVXlQmIoYUZYnn3MxFT+MU4y+CdedEtCfz8AQg0vw=
=WeGw
-----END PGP SIGNATURE-----

--fjiK0r9GDgARwbxN--
