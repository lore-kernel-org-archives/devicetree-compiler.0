From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/3 v2] annotations: add positions
Date: Wed, 17 Jan 2018 11:50:19 +1100
Message-ID: <20180117005019.GU30352@umbus.fritz.box>
References: <1516040650-9848-1-git-send-email-Julia.Lawall@lip6.fr>
 <1516040650-9848-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fxBYc4U7HLIDBZ2G"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1516151380;
        bh=ZaHCtrKoGCyWEldfYG9oCenjVACbQLmx7A4rdCoFO9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gx3N9owElGZKFZgPQO2GPVRe+3xkKs2gYPTVz1QZ/ddGftCwS8kRnSRp/Mc8D8BkW
         z8eY8uDly6SBz9kcfHaqrNF33D9cVLYbxiegM7iodBzZqqSc3JelKC2vMqZzsCLTz9
         LpAxBwfVTLfxCYyi1wYaW7bdZoY41QTUzM2DjRjg=
Content-Disposition: inline
In-Reply-To: <1516040650-9848-3-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>


--fxBYc4U7HLIDBZ2G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2018 at 07:24:09PM +0100, Julia Lawall wrote:
> The parser is extended to record positions.  For productions with a
> nodedef, this is the position of the nodedef, with preceding / if any.
> For other productions it is the position of the complete set of terms
> matched by the production.
>=20
> srcpos structures are added to the property and node types, and to the
> parameter lists of various functions that construct these types.  Nodes
> and properties that are created by the compiler rather than from parsing
> source code typically have NULL as the srcpos value.
>=20
> merge_nodes, defined in livetree.c uses srcpos_extend to combine
> multiple positions, resulting in a list of positions.
>=20
> srcpos_extend is defined in srcpos.c and is somewhat complex.  It
> addresses two issues: the lists of positions to merge may share a common
> tail and the lists of positions to merge may contain duplicates.  In
> srcpos_extend, the nested loops detect a common tail (merge_point) if
> any.  The second list is then copied up to the merge point, and then the
> resulting copy is placed at the end of a copy of the first list.
> Duplicates are detected by srcpos_copy_list within the copying process.
>=20
> srcpos_combine is also newly defined in srcpos.c.  It is only used to
> merge positions of adjacent terms matched by the parser, and thus
> doesn't have to be concerned with common tails and duplicates.
>=20
> Another change to srcpos.c is to make srcpos_copy always do a full copy,
> including a copy of the file substructure.  This is required because
> when dtc is used on the output of cpp, the successive detected file
> names overwrite the file name in the file structure.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> ---
>=20
> v2: Allow lists of positions, make srcpos_copy always do a full copy, move
> annotation support into another patch.
>=20
>  dtc-parser.y | 23 +++++++++++---------
>  dtc.h        | 13 +++++++----
>  flattree.c   |  2 +-
>  fstree.c     |  8 ++++---
>  livetree.c   | 44 ++++++++++++++++++++++++++-----------
>  srcpos.c     | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  srcpos.h     |  5 +++++
>  7 files changed, 135 insertions(+), 31 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 44af170..d668349 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -160,11 +160,11 @@ memreserve:
>  devicetree:
>  	  '/' nodedef
>  		{
> -			$$ =3D name_node($2, "");
> +			$$ =3D name_node($2, "", &@$);

Attaching the location at name_node time isn't necessarily wrong, but
it seems a bit odd.  Is there a reason not to do it at build_node()
time?  It means you wouldn't include the node name in the definition,
but I think we can live with that.  Putting the location tagging in
the nodedef production also means slightly fewer places need changing.

>  		}
>  	| devicetree '/' nodedef
>  		{
> -			$$ =3D merge_nodes($1, $3);
> +			$$ =3D merge_nodes($1, $3, srcpos_combine(&@2, &@3));
>  		}
>  	| DT_REF nodedef
>  		{
> @@ -175,7 +175,10 @@ devicetree:
>  			 */
>  			if (!($<flags>-1 & DTSF_PLUGIN))
>  				ERROR(&@2, "Label or path %s not found", $1);
> -			$$ =3D add_orphan_node(name_node(build_node(NULL, NULL), ""), $2, $1);
> +			$$ =3D add_orphan_node(
> +					name_node(build_node(NULL, NULL), "",
> +						  NULL),
> +					$2, $1, &@2);

Why does the location get attached in the add_orphan_node() rather
than the name_node() (or build_node()) within?  It seems odd to pass
NULL as a location to name_node(), then attach a real location almost
immediately afterwards.

>  		}
>  	| devicetree DT_LABEL DT_REF nodedef
>  		{
> @@ -183,7 +186,7 @@ devicetree:
> =20
>  			if (target) {
>  				add_label(&target->labels, $2);
> -				merge_nodes(target, $4);
> +				merge_nodes(target, $4, &@4);

Passing a location to merge_nodes() also seems odd.  Shouldn't the
location information already be in the things you're merging?

>  			} else
>  				ERROR(&@3, "Label or path %s not found", $3);
>  			$$ =3D $1;
> @@ -193,7 +196,7 @@ devicetree:
>  			struct node *target =3D get_node_by_ref($1, $2);
> =20
>  			if (target) {
> -				merge_nodes(target, $3);
> +				merge_nodes(target, $3, &@3);
>  			} else {
>  				/*
>  				 * We rely on the rule being always:
> @@ -201,7 +204,7 @@ devicetree:
>  				 * so $-1 is what we want (plugindecl)
>  				 */
>  				if ($<flags>-1 & DTSF_PLUGIN)
> -					add_orphan_node($1, $3, $2);
> +					add_orphan_node($1, $3, $2, &@3);
>  				else
>  					ERROR(&@2, "Label or path %s not found", $2);
>  			}
> @@ -242,11 +245,11 @@ proplist:
>  propdef:
>  	  DT_PROPNODENAME '=3D' propdata ';'
>  		{
> -			$$ =3D build_property($1, $3);
> +			$$ =3D build_property($1, $3, &@$);
>  		}
>  	| DT_PROPNODENAME ';'
>  		{
> -			$$ =3D build_property($1, empty_data);
> +			$$ =3D build_property($1, empty_data, &@$);
>  		}
>  	| DT_DEL_PROP DT_PROPNODENAME ';'
>  		{
> @@ -517,11 +520,11 @@ subnodes:
>  subnode:
>  	  DT_PROPNODENAME nodedef
>  		{
> -			$$ =3D name_node($2, $1);
> +			$$ =3D name_node($2, $1, &@$);
>  		}
>  	| DT_DEL_NODE DT_PROPNODENAME ';'
>  		{
> -			$$ =3D name_node(build_node_delete(), $2);
> +			$$ =3D name_node(build_node_delete(), $2, &@$);
>  		}
>  	| DT_LABEL subnode
>  		{
> diff --git a/dtc.h b/dtc.h
> index 3b18a42..3a85058 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -149,6 +149,7 @@ struct property {
>  	struct property *next;
> =20
>  	struct label *labels;
> +	struct srcpos *srcpos;
>  };
> =20
>  struct node {
> @@ -168,6 +169,7 @@ struct node {
> =20
>  	struct label *labels;
>  	const struct bus_type *bus;
> +	struct srcpos *srcpos;
>  };
> =20
>  #define for_each_label_withdel(l0, l) \
> @@ -194,17 +196,20 @@ struct node {
>  void add_label(struct label **labels, char *label);
>  void delete_labels(struct label **labels);
> =20
> -struct property *build_property(char *name, struct data val);
> +struct property *build_property(char *name, struct data val,
> +	struct srcpos *srcpos);
>  struct property *build_property_delete(char *name);
>  struct property *chain_property(struct property *first, struct property =
*list);
>  struct property *reverse_properties(struct property *first);
> =20
>  struct node *build_node(struct property *proplist, struct node *children=
);
>  struct node *build_node_delete(void);
> -struct node *name_node(struct node *node, char *name);
> +struct node *name_node(struct node *node, char *name, struct srcpos *src=
pos);
>  struct node *chain_node(struct node *first, struct node *list);
> -struct node *merge_nodes(struct node *old_node, struct node *new_node);
> -struct node *add_orphan_node(struct node *old_node, struct node *new_nod=
e, char *ref);
> +struct node *merge_nodes(struct node *old_node, struct node *new_node,
> +	struct srcpos *srcpos);
> +struct node *add_orphan_node(struct node *old_node, struct node *new_nod=
e,
> +	char *ref, struct srcpos *srcpos);
> =20
>  void add_property(struct node *node, struct property *prop);
>  void delete_property_by_name(struct node *node, char *name);
> diff --git a/flattree.c b/flattree.c
> index 8d268fb..f35ff5e 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -692,7 +692,7 @@ static struct property *flat_read_property(struct inb=
uf *dtbuf,
> =20
>  	val =3D flat_read_data(dtbuf, proplen);
> =20
> -	return build_property(name, val);
> +	return build_property(name, val, NULL);
>  }
> =20
> =20
> diff --git a/fstree.c b/fstree.c
> index ae7d06c..da7e537 100644
> --- a/fstree.c
> +++ b/fstree.c
> @@ -60,7 +60,8 @@ static struct node *read_fstree(const char *dirname)
>  			} else {
>  				prop =3D build_property(xstrdup(de->d_name),
>  						      data_copy_file(pfile,
> -								     st.st_size));
> +								     st.st_size),
> +						      NULL);
>  				add_property(tree, prop);
>  				fclose(pfile);
>  			}
> @@ -68,7 +69,8 @@ static struct node *read_fstree(const char *dirname)
>  			struct node *newchild;
> =20
>  			newchild =3D read_fstree(tmpname);
> -			newchild =3D name_node(newchild, xstrdup(de->d_name));
> +			newchild =3D name_node(newchild, xstrdup(de->d_name),
> +					     NULL);
>  			add_child(tree, newchild);
>  		}
> =20
> @@ -84,7 +86,7 @@ struct dt_info *dt_from_fs(const char *dirname)
>  	struct node *tree;
> =20
>  	tree =3D read_fstree(dirname);
> -	tree =3D name_node(tree, "");
> +	tree =3D name_node(tree, "", NULL);
> =20
>  	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree));
>  }
> diff --git a/livetree.c b/livetree.c
> index 57b7db2..9317739 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -19,6 +19,7 @@
>   */
> =20
>  #include "dtc.h"
> +#include "srcpos.h"
> =20
>  /*
>   * Tree building functions
> @@ -50,7 +51,8 @@ void delete_labels(struct label **labels)
>  		label->deleted =3D 1;
>  }
> =20
> -struct property *build_property(char *name, struct data val)
> +struct property *build_property(char *name, struct data val,
> +				struct srcpos *srcpos)
>  {
>  	struct property *new =3D xmalloc(sizeof(*new));
> =20
> @@ -58,6 +60,7 @@ struct property *build_property(char *name, struct data=
 val)
> =20
>  	new->name =3D name;
>  	new->val =3D val;
> +	new->srcpos =3D srcpos_copy(srcpos);
> =20
>  	return new;
>  }
> @@ -125,16 +128,18 @@ struct node *build_node_delete(void)
>  	return new;
>  }
> =20
> -struct node *name_node(struct node *node, char *name)
> +struct node *name_node(struct node *node, char *name, struct srcpos *src=
pos)
>  {
>  	assert(node->name =3D=3D NULL);
> =20
>  	node->name =3D name;
> +	node->srcpos =3D srcpos_copy(srcpos);
> =20
>  	return node;
>  }
> =20
> -struct node *merge_nodes(struct node *old_node, struct node *new_node)
> +struct node *merge_nodes(struct node *old_node, struct node *new_node,
> +			 struct srcpos *new_node_begin_srcpos)
>  {
>  	struct property *new_prop, *old_prop;
>  	struct node *new_child, *old_child;
> @@ -169,6 +174,7 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
> =20
>  				old_prop->val =3D new_prop->val;
>  				old_prop->deleted =3D 0;
> +				old_prop->srcpos =3D new_prop->srcpos;
>  				free(new_prop);
>  				new_prop =3D NULL;
>  				break;
> @@ -198,7 +204,8 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>  		/* Search for a collision.  Merge if there is */
>  		for_each_child_withdel(old_node, old_child) {
>  			if (streq(old_child->name, new_child->name)) {
> -				merge_nodes(old_child, new_child);
> +				merge_nodes(old_child, new_child,
> +					    new_child->srcpos);
>  				new_child =3D NULL;
>  				break;
>  			}
> @@ -209,6 +216,9 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>  			add_child(old_node, new_child);
>  	}
> =20
> +	old_node->srcpos =3D
> +		srcpos_extend(new_node_begin_srcpos, old_node->srcpos);
> +
>  	/* The new node contents are now merged into the old node.  Free
>  	 * the new node. */
>  	free(new_node);
> @@ -216,7 +226,8 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>  	return old_node;
>  }
> =20
> -struct node * add_orphan_node(struct node *dt, struct node *new_node, ch=
ar *ref)
> +struct node *add_orphan_node(struct node *dt, struct node *new_node, cha=
r *ref,
> +			      struct srcpos *srcpos)
>  {
>  	static unsigned int next_orphan_fragment =3D 0;
>  	struct node *node;
> @@ -227,13 +238,13 @@ struct node * add_orphan_node(struct node *dt, stru=
ct node *new_node, char *ref)
>  	d =3D data_add_marker(d, REF_PHANDLE, ref);
>  	d =3D data_append_integer(d, 0xffffffff, 32);
> =20
> -	p =3D build_property("target", d);
> +	p =3D build_property("target", d, srcpos);
> =20
>  	xasprintf(&name, "fragment@%u",
>  			next_orphan_fragment++);
> -	name_node(new_node, "__overlay__");
> +	name_node(new_node, "__overlay__", srcpos);
>  	node =3D build_node(p, new_node);
> -	name_node(node, name);
> +	name_node(node, name, srcpos);
> =20
>  	add_child(dt, node);
>  	return dt;
> @@ -331,7 +342,8 @@ void append_to_property(struct node *node,
>  		p->val =3D d;
>  	} else {
>  		d =3D data_append_data(empty_data, data, len);
> -		p =3D build_property(name, d);
> +		/* used from fixup or local_fixup, so no position */
> +		p =3D build_property(name, d, NULL);
>  		add_property(node, p);
>  	}
>  }
> @@ -587,13 +599,17 @@ cell_t get_node_phandle(struct node *root, struct n=
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
> @@ -768,7 +784,7 @@ static struct node *build_and_name_child_node(struct =
node *parent, char *name)
>  	struct node *node;
> =20
>  	node =3D build_node(NULL, NULL);
> -	name_node(node, xstrdup(name));
> +	name_node(node, xstrdup(name), NULL);
>  	add_child(parent, node);
> =20
>  	return node;
> @@ -827,9 +843,11 @@ static void generate_label_tree_internal(struct dt_i=
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
> index 9067ba3..2ed794b 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -207,6 +207,7 @@ struct srcpos srcpos_empty =3D {
>  	.last_line =3D 0,
>  	.last_column =3D 0,
>  	.file =3D NULL,
> +	.next =3D NULL,
>  };
> =20
>  #define TAB_SIZE      8
> @@ -240,13 +241,83 @@ struct srcpos *
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

No need to test this, xmalloc() will abort() on failure.

> +		/* allocate without free */

Ah, yeah.  Lifetime management is a bit of a mess in dtc.  I've
seriously considered just removing every free() and treating the
process lifetime as a poor man's pool allocator.

> +		srcfile_state =3D xmalloc(sizeof(struct srcfile_state));
> +		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
> +
> +		pos_new->file =3D srcfile_state;
> +	}

Since you've now added a list to srcpos, don't you need to deep copy
that as well?

<reads ahead in the patch>Hrm.  Maybe not.  I think conflation of a
"simple" srcpos with one location and a "complex" one which could
include a list into the same structure is causing some unnecessary
confusion.

> +
> +	return pos_new;
> +}
> +
> +struct srcpos *
> +srcpos_combine(struct srcpos *left_srcpos, struct srcpos *right_srcpos)
> +{
> +	struct srcpos *pos_new;
> +
> +	pos_new =3D srcpos_copy(left_srcpos);
> +
> +	pos_new->last_line =3D right_srcpos->last_line;
> +	pos_new->last_column =3D right_srcpos->last_column;
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

Use streq() here - it exists specifically because I always get
confused by the sense of strcmp() when treated as a boolean.

> +}
> +
> +static struct srcpos *srcpos_copy_list(struct srcpos *pos, struct srcpos=
 *end,
> +				       struct srcpos *newtail)
> +{
> +	struct srcpos *next, *p;
> +
> +	if (pos =3D=3D end)
> +		return newtail;
> +
> +	next =3D srcpos_copy_list(pos->next, end, newtail);
> +
> +	for (p =3D next; p !=3D NULL; p =3D p->next)
> +		if (same_pos(pos, p))
> +			return next;
> +
> +	pos =3D srcpos_copy(pos);
> +	pos->next =3D next;
> +	return pos;
> +}
> +
> +struct srcpos *srcpos_extend(struct srcpos *new_srcpos,
> +			     struct srcpos *old_srcpos)
> +{
> +	struct srcpos *pos, *p;
> +	struct srcpos *merge_point =3D NULL;
> +
> +	for (pos =3D new_srcpos; pos->next !=3D NULL; pos =3D pos->next)
> +		for (p =3D old_srcpos; p !=3D NULL; p =3D p->next)
> +			if (pos->next =3D=3D p) {
> +				merge_point =3D p;
> +				goto after;
> +			}
> +after:
> +	old_srcpos =3D srcpos_copy_list(old_srcpos, merge_point, NULL);
> +	return srcpos_copy_list(new_srcpos, NULL, old_srcpos);
> +}
> +
>  char *
>  srcpos_string(struct srcpos *pos)
>  {
> diff --git a/srcpos.h b/srcpos.h
> index 9ded12a..c22d6ba 100644
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
> @@ -105,6 +106,10 @@ extern struct srcpos srcpos_empty;
> =20
>  extern void srcpos_update(struct srcpos *pos, const char *text, int len);
>  extern struct srcpos *srcpos_copy(struct srcpos *pos);
> +extern struct srcpos *srcpos_combine(struct srcpos *left_srcpos,
> +				     struct srcpos *right_srcpos);
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

--fxBYc4U7HLIDBZ2G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpencUACgkQbDjKyiDZ
s5JrHQ//XlCs3MFgt0Qum+pO/nL9+uVFvtKXNsks9d3IqiTTa8aUKB5MNk4ADAEp
b584llXtaWJuA14mxELf5rc2nrMzKxeku20bH9XzGI+AZ7pXIa8jmPOr2rfN4lPV
ciIZZGz1nmGXYz3oSYSu6le0i0lFTp8PM0WNS4rbi8qz8GebR2VJQHEUPrzIy28k
1unIcKCFzuPV9B/NlZw6e+5H9kU/YW+uAsQ+f5qUWOeEllicVqEws+8qb7CtSx0V
qxiPrD9pFdx5NhwdEYyeKNfT8k7ZOgETZzHHAqSvLttGT/NQ/P1rjIZR1YSaRZPI
dWFoi4MWnG2Q1dPVPrM7qeGZcVPdf7WOqbu8eRN0KDEwZ7Kc1XY7hrf7b8Ond9t4
hvxe60vUF3WK4yeDbKGhWX6vSFfSPGu0o+5LX37KHVQLE5zhsBnX40iwi9iJBMRl
/Oh8w/BWra4x2cXOuwmb6MmtLWwhXiJ4QrdFOM4FC5+PGTks8P7RJsPp5tXrEEHk
RhFLr42Z88SScMXIC7b4RHbkeNjgIIrkdBOlqAs5eKQ96jMjIxIdJP9JN1enBCNY
gqiGug82MoEH9J3MMcczluWx2dusclv5XB5ZNNTGkWZB3GjzROxekhQT78QlcnG/
zxQOKSnCElAmfeWJCVEyzdq2LwTYw70l7wVtOcyHa71G3lEJzT8=
=Bx42
-----END PGP SIGNATURE-----

--fxBYc4U7HLIDBZ2G--
