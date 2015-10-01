From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v5 1/2] dtc: dts source location annotation
Date: Thu, 1 Oct 2015 15:49:48 +1000
Message-ID: <20151001054948.GM23574@voom>
References: <560CA87E.1010103@gmail.com>
 <560CA9FB.6050700@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uwB7x3tnyrZQfZJI"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <560CA9FB.6050700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--uwB7x3tnyrZQfZJI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 08:35:23PM -0700, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Proof of concept patch.
>=20
> Annotates input source file and line number of nodes and properties
> as comments in output .dts file when --annotate flag is supplied.
>=20
>=20
> A common dts source file convention is for a system .dts file
> to include default SOC and/or device .dtsi files and then add
> additional system specific properties or over-ride property values
> from the .dtsi files.  It can be a time consuming and error prone
> exercise to determine exactly what nodes, properties, and property
> values are in the final .dtb binary blob and where they originated.
>=20
> Modify the dtc compiler to read a (possibly cpp pre-processed) .dts
> file and for the output .dts annotate each node and property with
> the corresponding source location.
>=20
> As an example, one device tree node for the dragonboard in the
> Linux kernel source tree is:=20
>=20
>   sdhci@f9824900 { /* qcom-apq8074-dragonboard.dts:14 */
>         compatible =3D "qcom,sdhci-msm-v4"; /* qcom-msm8974.dtsi:240 */
>         reg =3D <0xf9824900 0x11c 0xf9824000 0x800>; /* qcom-msm8974.dtsi=
:241 */
>         reg-names =3D "hc_mem", "core_mem"; /* qcom-msm8974.dtsi:242 */
>         interrupts =3D <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* qcom-msm8974.dtsi:=
243 */
>         interrupt-names =3D "hc_irq", "pwr_irq"; /* qcom-msm8974.dtsi:244=
 */
>         clocks =3D <0xd 0xd8 0xd 0xd7>; /* qcom-msm8974.dtsi:245 */
>         clock-names =3D "core", "iface"; /* qcom-msm8974.dtsi:246 */
>         status =3D "ok"; /* qcom-apq8074-dragonboard.dts:17 */
>         bus-width =3D <0x8>; /* qcom-apq8074-dragonboard.dts:15 */
>         non-removable; /* qcom-apq8074-dragonboard.dts:16 */
>   }; /* qcom-apq8074-dragonboard.dts:18 */
>=20
>=20
> qcom-apq8074-dragonboard.dts:
>    - last referenced the sdhci node
>    - changed the value of the "status" property from "disabled" to "ok"
>    - added two properties, "bus-width" and "non-removable"
>=20
> qcom-msm8974.dtsi:
>    - initially set the value the "status" property to "disabled"
>      (not visible in the annotated .dts)
>    - provided all of the other property values
>=20
>=20
> When the dtc compiler is run within the Linux kernel build system,
> the path of the source files will be the full absolute path, just
> as seen for gcc warnings and errors.  I always trim away the path
> leading up to the Linux kernel source tree by passing the kernel
> build output through a sed pipe.  I have done the same to the
> above example to remove the excessive verbosity in the source paths.
>=20
> Implementation notes:
>=20
>   - The source location of each node and property is saved in the
>     respective node or property during the parse phase because
>     the source location information no longer available when the
>     final values are written out from dt_to_source() and the
>     functions that it calls.
>=20
>   - A check is added to dtc.c to ensure that input and output format
>     are both device tree source.  An alternate choice would be to
>     turn off the --annotate flag if either the input file or the
>     output file is not device tree source.  In the alternate case,
>     the disabling of --annotate could be silent or a warning could
>     be issued.
>=20
>=20
> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>  dtc-parser.y |   20 ++++++++++++++++----
>  dtc.c        |    9 +++++++++
>  dtc.h        |    7 +++++++
>  livetree.c   |   20 ++++++++++++++++++++
>  srcpos.c     |   42 ++++++++++++++++++++++++++++++++++++++++++
>  srcpos.h     |    2 ++
>  treesource.c |   38 +++++++++++++++++++++++++++++++++-----
>  7 files changed, 129 insertions(+), 9 deletions(-)
>=20
> Index: b/dtc.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/dtc.h
> +++ b/dtc.h
> @@ -54,6 +54,7 @@ extern int reservenum;		/* Number of mem
>  extern int minsize;		/* Minimum blob size */
>  extern int padsize;		/* Additional padding to blob */
>  extern int phandle_format;	/* Use linux,phandle or phandle properties */
> +extern bool annotate;		/* annotate .dts with input source location */
> =20
>  #define PHANDLE_LEGACY	0x1
>  #define PHANDLE_EPAPR	0x2
> @@ -140,6 +141,7 @@ struct property {
>  	struct property *next;
> =20
>  	struct label *labels;
> +	struct srcpos *srcpos;
>  };
> =20
>  struct node {
> @@ -158,6 +160,8 @@ struct node {
>  	int addr_cells, size_cells;
> =20
>  	struct label *labels;
> +	struct srcpos *begin_srcpos;
> +	struct srcpos *end_srcpos;

struct srcpos already has a last_line / last_column, so I don't think
you need separate begin and end srcpos variables - a single one should
do it.

>  };
> =20
>  #define for_each_label_withdel(l0, l) \
> @@ -185,6 +189,7 @@ void add_label(struct label **labels, ch
>  void delete_labels(struct label **labels);
> =20
>  struct property *build_property(char *name, struct data val);
> +void srcpos_property(struct property *prop, struct srcpos *srcpos);

I'd prefer to make this a parameter to build_property(), which I think
becomes possible with the other changes I suggest below.

>  struct property *build_property_delete(char *name);
>  struct property *chain_property(struct property *first, struct property =
*list);
>  struct property *reverse_properties(struct property *first);
> @@ -192,6 +197,8 @@ struct property *reverse_properties(stru
>  struct node *build_node(struct property *proplist, struct node *children=
);
>  struct node *build_node_delete(void);
>  struct node *name_node(struct node *node, char *name);
> +void begin_srcpos_node(struct node *node, struct srcpos *srcpos);
> +void end_srcpos_node(struct node *node, struct srcpos *srcpos);

Likewise a parameter to build_node().

>  struct node *chain_node(struct node *first, struct node *list);
>  struct node *merge_nodes(struct node *old_node, struct node *new_node);
> =20
> Index: b/livetree.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> @@ -74,6 +75,11 @@ struct property *build_property_delete(c
>  	return new;
>  }
> =20
> +void srcpos_property(struct property *prop, struct srcpos *srcpos)
> +{
> +	prop->srcpos =3D srcpos_copy_all(srcpos);
> +}
> +
>  struct property *chain_property(struct property *first, struct property =
*list)
>  {
>  	assert(first->next =3D=3D NULL);
> @@ -134,6 +140,16 @@ struct node *name_node(struct node *node
>  	return node;
>  }
> =20
> +void begin_srcpos_node(struct node *node, struct srcpos *srcpos)
> +{
> +	node->begin_srcpos =3D srcpos_copy_all(srcpos);
> +}
> +
> +void end_srcpos_node(struct node *node, struct srcpos *srcpos)
> +{
> +	node->end_srcpos =3D srcpos_copy_all(srcpos);
> +}
> +
>  struct node *merge_nodes(struct node *old_node, struct node *new_node)
>  {
>  	struct property *new_prop, *old_prop;
> @@ -169,6 +185,7 @@ struct node *merge_nodes(struct node *ol
> =20
>  				old_prop->val =3D new_prop->val;
>  				old_prop->deleted =3D 0;
> +				old_prop->srcpos =3D new_prop->srcpos;
>  				free(new_prop);
>  				new_prop =3D NULL;
>  				break;
> @@ -209,6 +226,9 @@ struct node *merge_nodes(struct node *ol
>  			add_child(old_node, new_child);
>  	}
> =20
> +	old_node->begin_srcpos =3D new_node->begin_srcpos;
> +	old_node->end_srcpos =3D new_node->end_srcpos;
> +
>  	/* The new node contents are now merged into the old node.  Free
>  	 * the new node. */
>  	free(new_node);
> Index: b/treesource.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/treesource.c
> +++ b/treesource.c
> @@ -200,9 +200,16 @@ static void write_propval(FILE *f, struc
>  	int nnotstring =3D 0, nnul =3D 0;
>  	int nnotstringlbl =3D 0, nnotcelllbl =3D 0;
>  	int i;
> +	char *srcstr;
> =20
>  	if (len =3D=3D 0) {
> -		fprintf(f, ";\n");
> +		if (annotate) {
> +			srcstr =3D srcpos_string_short(prop->srcpos);

I tend to think the full srcpos_string might be useful here, rather
than the short version.

> +			fprintf(f, "; /* %s */\n", srcstr);
> +			free(srcstr);
> +		} else {
> +			fprintf(f, ";\n");
> +		}
>  		return;
>  	}
> =20
> @@ -230,7 +237,13 @@ static void write_propval(FILE *f, struc
>  		write_propval_bytes(f, prop->val);
>  	}
> =20
> -	fprintf(f, ";\n");
> +	if (annotate) {
> +		srcstr =3D srcpos_string_short(prop->srcpos);
> +		fprintf(f, "; /* %s */\n", srcstr);
> +		free(srcstr);
> +	} else {
> +		fprintf(f, ";\n");
> +	}
>  }
> =20
>  static void write_tree_source_node(FILE *f, struct node *tree, int level)
> @@ -238,14 +251,23 @@ static void write_tree_source_node(FILE
>  	struct property *prop;
>  	struct node *child;
>  	struct label *l;
> +	char *srcstr;
> =20
>  	write_prefix(f, level);
>  	for_each_label(tree->labels, l)
>  		fprintf(f, "%s: ", l->label);
> +
>  	if (tree->name && (*tree->name))
> -		fprintf(f, "%s {\n", tree->name);
> +		fprintf(f, "%s {", tree->name);
>  	else
> -		fprintf(f, "/ {\n");
> +		fprintf(f, "/ {");
> +	if (annotate) {
> +		srcstr =3D srcpos_string_short(tree->begin_srcpos);

So to do this with a single srcpos field, you'd probably want
srcpos_string_begin() and srcpos_string_end() functions.

> +		fprintf(f, " /* %s */\n", srcstr);
> +		free(srcstr);
> +	} else {
> +		fprintf(f, "\n");
> +	}
> =20
>  	for_each_property(tree, prop) {
>  		write_prefix(f, level+1);
> @@ -259,7 +281,13 @@ static void write_tree_source_node(FILE
>  		write_tree_source_node(f, child, level+1);
>  	}
>  	write_prefix(f, level);
> -	fprintf(f, "};\n");
> +	if (annotate) {
> +		srcstr =3D srcpos_string_short(tree->end_srcpos);
> +		fprintf(f, "}; /* %s */\n", srcstr);
> +		free(srcstr);
> +	} else {
> +		fprintf(f, "};\n");
> +	}
>  }
> =20
> =20
> Index: b/dtc.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/dtc.c
> +++ b/dtc.c
> @@ -29,6 +29,7 @@ int reservenum;		/* Number of memory res
>  int minsize;		/* Minimum blob size */
>  int padsize;		/* Additional padding to blob */
>  int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or phandle pro=
perties */
> +bool annotate =3D false;	/* annotate .dts with input source location */
> =20
>  static void fill_fullpaths(struct node *tree, const char *prefix)
>  {
> @@ -71,6 +72,7 @@ static struct option const usage_long_op
>  	{"error",             a_argument, NULL, 'E'},
>  	{"help",             no_argument, NULL, 'h'},
>  	{"version",          no_argument, NULL, 'v'},
> +	{"annotate",         no_argument, NULL, 'A'},
>  	{NULL,               no_argument, NULL, 0x0},
>  };
>  static const char * const usage_opts_help[] =3D {
> @@ -101,6 +103,7 @@ static const char * const usage_opts_hel
>  	"\n\tEnable/disable errors (prefix with \"no-\")",
>  	"\n\tPrint this help and exit",
>  	"\n\tPrint version and exit",
> +	"\n\tAnnotate output .dts with input source file and line",
>  	NULL,
>  };
> =20
> @@ -125,6 +128,9 @@ int main(int argc, char *argv[])
> =20
>  	while ((opt =3D util_getopt_long()) !=3D EOF) {
>  		switch (opt) {
> +		case 'A':
> +			annotate =3D true;
> +			break;
>  		case 'I':
>  			inform =3D optarg;
>  			break;
> @@ -213,6 +219,9 @@ int main(int argc, char *argv[])
>  		fprintf(depfile, "%s:", outname);
>  	}
> =20
> +	if (annotate && (!streq(inform, "dts") || !streq(outform, "dts")))
> +		die("--annotate requires -I dts -O dts\n");
> +
>  	if (streq(inform, "dts"))
>  		bi =3D dt_from_source(arg);
>  	else if (streq(inform, "fs"))
> Index: b/dtc-parser.y
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -134,10 +134,12 @@ memreserve:
>  devicetree:
>  	  '/' nodedef
>  		{
> +			begin_srcpos_node($2, &@1);

With a single srcpos, you could move this to the nodedef productions
and use &@$.

>  			$$ =3D name_node($2, "");

Actually, if using a parameter to build_node() doesn't work, my second
preference would be to change name_node() to say place_node() which
adds both the name and source location.

>  		}
>  	| devicetree '/' nodedef
>  		{
> +			begin_srcpos_node($3, &@2);
>  			$$ =3D merge_nodes($1, $3);
>  		}
> =20
> @@ -146,20 +148,25 @@ devicetree:
>  			struct node *target =3D get_node_by_ref($1, $3);
> =20
>  			add_label(&target->labels, $2);
> -			if (target)
> +			if (target) {
> +				begin_srcpos_node($4, &@3);
>  				merge_nodes(target, $4);
> -			else
> +			} else {
>  				ERROR(&@3, "Label or path %s not found", $3);
> +			}
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_REF nodedef
>  		{
>  			struct node *target =3D get_node_by_ref($1, $2);
> =20
> -			if (target)
> +
> +			if (target) {
> +				begin_srcpos_node($3, &@2);
>  				merge_nodes(target, $3);
> -			else
> +			} else {
>  				ERROR(&@2, "Label or path %s not found", $2);
> +			}
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_DEL_NODE DT_REF ';'
> @@ -180,6 +187,7 @@ nodedef:
>  	  '{' proplist subnodes '}' ';'
>  		{
>  			$$ =3D build_node($2, $3);
> +			end_srcpos_node($$, &@4);
>  		}
>  	;
> =20
> @@ -198,10 +206,12 @@ propdef:
>  	  DT_PROPNODENAME '=3D' propdata ';'
>  		{
>  			$$ =3D build_property($1, $3);
> +			srcpos_property($$, &@1);

It think using &@$ giving the location of the whole definition, rather
than just the property name part in &@1 would be a better idea.

>  		}
>  	| DT_PROPNODENAME ';'
>  		{
>  			$$ =3D build_property($1, empty_data);
> +			srcpos_property($$, &@1);
>  		}
>  	| DT_DEL_PROP DT_PROPNODENAME ';'
>  		{
> @@ -456,11 +466,13 @@ subnodes:
>  subnode:
>  	  DT_PROPNODENAME nodedef
>  		{
> +			begin_srcpos_node($2, &@1);
>  			$$ =3D name_node($2, $1);
>  		}
>  	| DT_DEL_NODE DT_PROPNODENAME ';'
>  		{
>  			$$ =3D name_node(build_node_delete(), $2);
> +			begin_srcpos_node($$, &@2);
>  		}
>  	| DT_LABEL subnode
>  		{
> Index: b/srcpos.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -246,6 +246,25 @@ srcpos_copy(struct srcpos *pos)
>  	return pos_new;
>  }
> =20
> +struct srcpos *
> +srcpos_copy_all(struct srcpos *pos)
> +{
> +	struct srcpos *pos_new;
> +	struct srcfile_state *srcfile_state;
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
>
You don't need this function - srcpos_copy() already does what you
need. The srcfile_state structures already have unlimited lifetime
exactly so they can be referenced later.  In other words, we already
deliberately leak them - see srcfile_pop().

> +	return pos_new;
> +}
> +
> =20
> =20
>  void
> @@ -291,6 +310,29 @@ srcpos_string(struct srcpos *pos)
> =20
>  	return pos_str;
>  }
> +
> +char *
> +srcpos_string_short(struct srcpos *pos)
> +{
> +	const char *fname =3D "<no-file>";
> +	char *pos_str;
> +	int rc;
> +
> +	if (pos)
> +		fname =3D pos->file->name;
> +
> +
> +	if (!pos)
> +		rc =3D asprintf(&pos_str, "%s:0", fname);
> +	else
> +		rc =3D asprintf(&pos_str, "%s:%d", fname,
> +			      pos->first_line);
> +
> +	if (rc =3D=3D -1)
> +		die("Couldn't allocate in srcpos_string_short");
> +
> +	return pos_str;
> +}
> =20
>  void srcpos_verror(struct srcpos *pos, const char *prefix,
>  		   const char *fmt, va_list va)
> Index: b/srcpos.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/srcpos.h
> +++ b/srcpos.h
> @@ -104,7 +104,9 @@ extern struct srcpos srcpos_empty;
> =20
>  extern void srcpos_update(struct srcpos *pos, const char *text, int len);
>  extern struct srcpos *srcpos_copy(struct srcpos *pos);
> +extern struct srcpos *srcpos_copy_all(struct srcpos *pos);
>  extern char *srcpos_string(struct srcpos *pos);
> +extern char *srcpos_string_short(struct srcpos *pos);
>  extern void srcpos_dump(struct srcpos *pos);
> =20
>  extern void srcpos_verror(struct srcpos *pos, const char *prefix,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uwB7x3tnyrZQfZJI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDMl8AAoJEGw4ysog2bOSES8P/iak+lTYhyHRFRQ4xRSvsLBT
8075xm5vD2D+J47v02jPIKSuYG8VONi5tp8nQkNYKroG6Hln46ZhoWhgfq9LT0Yp
6J/QP6sWdFdPnIMG3GVohekpRJQF0sMnYjnZEj11I+HLCiqdUEy7hlOHDtqnyRs7
RfNxnF9yVR0RULa3xayHvveTmAUoQaw+SogCRC2CAqc6kMlJ3mPoSZmEHHlNsFKA
BOGCQE4WaEBn0tdb6lAQ5Tg2Luje5zU6C5oEARNuJAvpljwf+F/LAyqN4jQLUzkd
ln7qhN4PPv95kp9hxD4DInyOssXixea/KxpBzY/nEkMIzQUjTSOxihLs/9DjT44q
G6HdF5ThrXOYKcJCiSfhCWPEkKd+tdrRKWyVyt5r/GktdOSwMI+poyfWy4NS5tLm
dpgO/XoADQEJke/ZC0FRh/wbQ/cBItxgUCw2livkvBc6SuRyyFXIqw3AGsNx4fav
jsNT+MfSgzoTpzAPQlNOlKAVF8urnC2+7X+4i7u4PgDQllEDlD2EC6eQd12+Rp6z
eOYtNtH8Pozeo6+s9RsBsbS6QCITcSId5dv6aCV85GXFCSIbrTvYZw1a52f2EmVu
GGKv63gdIPJWGL0kxQJi0x1/8yp/ui5itgCWQA5sD+d1HLETofs/LgTfRJM8LSNM
NiUOJamh6zuZjSyzzKlT
=kRIo
-----END PGP SIGNATURE-----

--uwB7x3tnyrZQfZJI--
