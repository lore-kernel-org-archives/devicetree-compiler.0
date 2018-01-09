From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Tue, 9 Jan 2018 22:16:14 +1100
Message-ID: <20180109111614.GL2131@umbus.fritz.box>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr>
 <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wA9WyeW1yVBM2Q32"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515500150;
        bh=t23Vh/ss/o2IuMGC7L54HWql6tSNgfYk5AtysRIOo+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PvmeT1Tkv9lXRC6zRx7DS9qAg7o3Cp7JzsHj9GJ47mMHH0ikL6WEfbVDhm83ZHQLl
         QNgDKZ1/casSqL8PwqyrzxiK7i6XB4fyJLd4J3otVY9rkFkAN+X1TOpvDzHV7Kh6wo
         X0pcrhcANHaFRMpDpT5KKFjYhHLGBRKFR/5N2Qc0=
Content-Disposition: inline
In-Reply-To: <1515418607-26764-3-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--wA9WyeW1yVBM2Q32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 02:36:44PM +0100, Julia Lawall wrote:
> Builds on a patch proposed by Frank Rowand:
>=20
> https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00372=
=2Ehtml
>=20
> Added NULL position argument in a few new places in dtc-parser.tab.c (1)
> and livetree.c (3).
>=20
> For both '/' nodedef productions, include the '/' in the position.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> ---
>  dtc-parser.y | 23 +++++++++++++----------
>  dtc.c        | 10 ++++++++++
>  dtc.h        | 14 ++++++++++----
>  flattree.c   |  2 +-
>  fstree.c     |  8 +++++---
>  livetree.c   | 43 ++++++++++++++++++++++++++++++-------------
>  srcpos.c     | 35 +++++++++++++++++++++++++++++++++++
>  srcpos.h     |  3 +++
>  treesource.c | 38 +++++++++++++++++++++++++++++++++-----
>  9 files changed, 140 insertions(+), 36 deletions(-)
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
>  		}
>  	| devicetree DT_LABEL DT_REF nodedef
>  		{
> @@ -183,7 +186,7 @@ devicetree:
> =20
>  			if (target) {
>  				add_label(&target->labels, $2);
> -				merge_nodes(target, $4);
> +				merge_nodes(target, $4, &@4);
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
> diff --git a/dtc.c b/dtc.c
> index c36994e..371d04c 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -35,6 +35,7 @@ int phandle_format =3D PHANDLE_EPAPR;	/* Use linux,phan=
dle or phandle properties *
>  int generate_symbols;	/* enable symbols & fixup support */
>  int generate_fixups;		/* suppress generation of fixups on symbol support=
 */
>  int auto_label_aliases;		/* auto generate labels -> aliases */
> +bool annotate =3D false; /* annotate .dts with input source location */
> =20
>  static int is_power_of_2(int x)
>  {
> @@ -83,6 +84,7 @@ static struct option const usage_long_opts[] =3D {
>  	{"auto-alias",       no_argument, NULL, 'A'},
>  	{"help",             no_argument, NULL, 'h'},
>  	{"version",          no_argument, NULL, 'v'},
> +	{"annotate",         no_argument, NULL, 'T'},
>  	{NULL,               no_argument, NULL, 0x0},
>  };
>  static const char * const usage_opts_help[] =3D {
> @@ -116,6 +118,7 @@ static const char * const usage_opts_help[] =3D {
>  	"\n\tEnable auto-alias of labels",
>  	"\n\tPrint this help and exit",
>  	"\n\tPrint version and exit",
> +	"\n\tAnnotate output .dts with input source file and line",
>  	NULL,
>  };
> =20
> @@ -185,6 +188,9 @@ int main(int argc, char *argv[])
> =20
>  	while ((opt =3D util_getopt_long()) !=3D EOF) {
>  		switch (opt) {
> +		case 'T':
> +			annotate =3D true;
> +			break;
>  		case 'I':
>  			inform =3D optarg;
>  			break;
> @@ -297,6 +303,10 @@ int main(int argc, char *argv[])
>  				outform =3D "dts";
>  		}
>  	}
> +
> +	if (annotate && (!streq(inform, "dts") || !streq(outform, "dts")))
> +		die("--annotate requires -I dts -O dts\n");
> +
>  	if (streq(inform, "dts"))
>  		dti =3D dt_from_source(arg);
>  	else if (streq(inform, "fs"))
> diff --git a/dtc.h b/dtc.h
> index 3b18a42..e7121ef 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -58,6 +58,7 @@ extern int phandle_format;	/* Use linux,phandle or phan=
dle properties */
>  extern int generate_symbols;	/* generate symbols for nodes with labels */
>  extern int generate_fixups;	/* generate fixups */
>  extern int auto_label_aliases;	/* auto generate labels -> aliases */
> +extern bool annotate;		/* annotate .dts with input source location */
> =20
>  #define PHANDLE_LEGACY	0x1
>  #define PHANDLE_EPAPR	0x2
> @@ -149,6 +150,7 @@ struct property {
>  	struct property *next;
> =20
>  	struct label *labels;
> +	struct srcpos *srcpos;
>  };
> =20
>  struct node {
> @@ -168,6 +170,7 @@ struct node {
> =20
>  	struct label *labels;
>  	const struct bus_type *bus;
> +	struct srcpos *srcpos;
>  };
> =20
>  #define for_each_label_withdel(l0, l) \
> @@ -194,17 +197,20 @@ struct node {
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
> index 57b7db2..eb40c36 100644
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
> +	new->srcpos =3D srcpos_copy_all(srcpos);
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
> +	node->srcpos =3D srcpos_copy_all(srcpos);
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
> @@ -209,6 +216,8 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>  			add_child(old_node, new_child);
>  	}
> =20
> +	old_node->srcpos =3D srcpos_copy_all(new_node_begin_srcpos);

This doesn't seem right.  Replacing the old position with the new
makes sense for indivudal properties where the whole value is also
replaced.  But for nodes we really need to track both locations.

I think the extra complexity here is why I didn't add this tracking
earlier.

>  	/* The new node contents are now merged into the old node.  Free
>  	 * the new node. */
>  	free(new_node);
> @@ -216,7 +225,8 @@ struct node *merge_nodes(struct node *old_node, struc=
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
> @@ -227,13 +237,13 @@ struct node * add_orphan_node(struct node *dt, stru=
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
> @@ -331,7 +341,8 @@ void append_to_property(struct node *node,
>  		p->val =3D d;
>  	} else {
>  		d =3D data_append_data(empty_data, data, len);
> -		p =3D build_property(name, d);
> +		/* used from fixup or local_fixup, so no position */
> +		p =3D build_property(name, d, NULL);
>  		add_property(node, p);
>  	}
>  }
> @@ -587,13 +598,17 @@ cell_t get_node_phandle(struct node *root, struct n=
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
> @@ -768,7 +783,7 @@ static struct node *build_and_name_child_node(struct =
node *parent, char *name)
>  	struct node *node;
> =20
>  	node =3D build_node(NULL, NULL);
> -	name_node(node, xstrdup(name));
> +	name_node(node, xstrdup(name), NULL);
>  	add_child(parent, node);
> =20
>  	return node;
> @@ -827,9 +842,11 @@ static void generate_label_tree_internal(struct dt_i=
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
> index 7f2626c..1a4db9c 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -246,6 +246,41 @@ srcpos_copy(struct srcpos *pos)
>  	return pos_new;
>  }
> =20
> +struct srcpos *
> +srcpos_copy_all(struct srcpos *pos)
> +{
> +	struct srcpos *pos_new;
> +	struct srcfile_state *srcfile_state;
> +
> +	if (!pos)
> +		return NULL;
> +
> +	pos_new =3D srcpos_copy(pos);
> +
> +	if (pos_new) {
> +		/* allocate without free */
> +		srcfile_state =3D xmalloc(sizeof(struct srcfile_state));
> +		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
> +
> +		pos_new->file =3D srcfile_state;
> +	}
> +
> +	return pos_new;
> +}

I don't really see a reason we'd need both a deep and a shallow copy.
If you need a deep copy, I'd suggest just changing srcpos_copy() to do
that.

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
> +	return pos_new;
> +}
> +
>  char *
>  srcpos_string(struct srcpos *pos)
>  {
> diff --git a/srcpos.h b/srcpos.h
> index 9ded12a..ec69d89 100644
> --- a/srcpos.h
> +++ b/srcpos.h
> @@ -105,6 +105,9 @@ extern struct srcpos srcpos_empty;
> =20
>  extern void srcpos_update(struct srcpos *pos, const char *text, int len);
>  extern struct srcpos *srcpos_copy(struct srcpos *pos);
> +extern struct srcpos *srcpos_copy_all(struct srcpos *pos);
> +extern struct srcpos *srcpos_combine(struct srcpos *left_srcpos,
> +	 struct srcpos *right_srcpos);
>  extern char *srcpos_string(struct srcpos *pos);
> =20
>  extern void PRINTF(3, 0) srcpos_verror(struct srcpos *pos, const char *p=
refix,
> diff --git a/treesource.c b/treesource.c
> index 2461a3d..a99eca4 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -200,9 +200,16 @@ static void write_propval(FILE *f, struct property *=
prop)
>  	int nnotstring =3D 0, nnul =3D 0;
>  	int nnotstringlbl =3D 0, nnotcelllbl =3D 0;
>  	int i;
> +	char *srcstr;
> =20
>  	if (len =3D=3D 0) {
> -		fprintf(f, ";\n");
> +		if (annotate) {
> +			srcstr =3D srcpos_string(prop->srcpos);
> +			fprintf(f, "; /* %s */\n", srcstr);
> +			free(srcstr);
> +		} else {
> +			fprintf(f, ";\n");
> +		}
>  		return;
>  	}
> =20
> @@ -230,7 +237,13 @@ static void write_propval(FILE *f, struct property *=
prop)
>  		write_propval_bytes(f, prop->val);
>  	}
> =20
> -	fprintf(f, ";\n");
> +	if (annotate) {
> +		srcstr =3D srcpos_string(prop->srcpos);
> +		fprintf(f, "; /* %s */\n", srcstr);
> +		free(srcstr);
> +	} else {
> +		fprintf(f, ";\n");
> +	}
>  }
> =20
>  static void write_tree_source_node(FILE *f, struct node *tree, int level)
> @@ -238,14 +251,23 @@ static void write_tree_source_node(FILE *f, struct =
node *tree, int level)
>  	struct property *prop;
>  	struct node *child;
>  	struct label *l;
> +	char *srcstr;
> =20
>  	write_prefix(f, level);
>  	for_each_label(tree->labels, l)
>  		fprintf(f, "%s: ", l->label);
>  	if (tree->name && (*tree->name))
> -		fprintf(f, "%s {\n", tree->name);
> +		fprintf(f, "%s {", tree->name);
>  	else
> -		fprintf(f, "/ {\n");
> +		fprintf(f, "/ {");
> +
> +	if (annotate) {
> +		srcstr =3D srcpos_string(tree->srcpos);
> +		fprintf(f, " /* %s */\n", srcstr);
> +		free(srcstr);
> +	} else {
> +		fprintf(f, "\n");
> +	}
> =20
>  	for_each_property(tree, prop) {
>  		write_prefix(f, level+1);
> @@ -259,7 +281,13 @@ static void write_tree_source_node(FILE *f, struct n=
ode *tree, int level)
>  		write_tree_source_node(f, child, level+1);
>  	}
>  	write_prefix(f, level);
> -	fprintf(f, "};\n");
> +	if (annotate) {
> +		srcstr =3D srcpos_string(tree->srcpos);
> +		fprintf(f, "}; /* %s */\n", srcstr);
> +		free(srcstr);
> +	} else {
> +		fprintf(f, "};\n");
> +	}
>  }
> =20
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wA9WyeW1yVBM2Q32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpUpHMACgkQbDjKyiDZ
s5LavxAAyirJBoM4yY1kAzyBjQeaN/XHIC9FHtZL61hRQw+RGn6VaijqpGozoSUH
FWWLzH1Ls6WvDtD9hroQEiXEIlt5JTPQTe00zzM+c1/w1jxaqjyAPJ8hq1BnJ3xW
dKeJ+AaIHbDs+Vvt1WbCK0VT5JQVq1t9NbejKxK9SCgII/Pj8+pdIlXPRcWP8BZ7
ww3HwUMUdMobkYElCCrOr1Pc02bTBubcvlCEiyAR8oICpS8jJRjXGtwQmPiVoFQh
wTWjId4K8TWgeqDk/Rwt9pHnAlN1RHgjx9caIV+EVnDOtfJbgLx2+J88GIE68hOs
k1hGrPY+jNd+m+0ql2w+sgVUcHAXjwAcOlDI8TC51Mxi2ueGwnafns11C3/ENMy0
c0sZMYyIOcFoDbq5PyehI/11k00hZ1Rvb1GpidjCcmN9ODZgtSJGSHPuVUHH0Q2H
qlJnU1m8SKvm4KCM4RfDzR9mhzbhg4e/y2E+cSAZVptQcIUPEReiqlPMuto+rbbb
hGsAE6GIiknJ6hGA8zMvEDhC4FO/K50ihYg9K4XOda94TETf/UE99iw/DNXhvfLX
lC9LJUtLtXqrApjbVRIXCduvcTA1P11yJzjmJYoJIX77nz052Cn/4oY2+4Ibz6cH
v/N8cgEV4d43IEHXI9vV2QnoYevtjDsHEfO4Fx4kWZic7iQFFkc=
=DhNZ
-----END PGP SIGNATURE-----

--wA9WyeW1yVBM2Q32--
