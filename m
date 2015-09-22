From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/3] dtc: dts source location annotation
Date: Tue, 22 Sep 2015 20:32:51 +1000
Message-ID: <20150922103251.GO20331@voom.fritz.box>
References: <5600E191.9020903@gmail.com>
 <5600E8EF.6020107@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rZHzn+A9B7nBTGyj"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5600E8EF.6020107-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--rZHzn+A9B7nBTGyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 10:36:47PM -0700, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Proof of concept patch.

Still like the idea, still some some problems with the implementation.

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
>  sdhci@f9824900 { /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:14 */
>                         compatible =3D "qcom,sdhci-msm-v4"; /* arch/arm/b=
oot/dts/qcom-msm8974.dtsi:240 */
>                         reg =3D <0xf9824900 0x11c 0xf9824000 0x800>; /* a=
rch/arm/boot/dts/qcom-msm8974.dtsi:241 */
>                         reg-names =3D "hc_mem", "core_mem"; /* arch/arm/b=
oot/dts/qcom-msm8974.dtsi:242 */
>                         interrupts =3D <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* ar=
ch/arm/boot/dts/qcom-msm8974.dtsi:243 */
>                         interrupt-names =3D "hc_irq", "pwr_irq"; /* arch/=
arm/boot/dts/qcom-msm8974.dtsi:244 */
>                         clocks =3D <0xd 0xd8 0xd 0xd7>; /* arch/arm/boot/=
dts/qcom-msm8974.dtsi:245 */
>                         clock-names =3D "core", "iface"; /* arch/arm/boot=
/dts/qcom-msm8974.dtsi:246 */
>                         status =3D "ok"; /* arch/arm/boot/dts/qcom-apq807=
4-dragonboard.dts:17 */
>                         bus-width =3D <0x8>; /* arch/arm/boot/dts/qcom-ap=
q8074-dragonboard.dts:15 */
>                         non-removable; /* arch/arm/boot/dts/qcom-apq8074-=
dragonboard.dts:16 */
>                 }; /* arch/arm/boot/dts/qcom-apq8074-dragonboard.dts:18 */
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
>     the source location information from current_srcfile is no longer
>     available when the final values are written out from dt_to_source()
>     and the functions that it calls.
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
>  dtc-parser.y |   14 ++++++++++++--
>  dtc.c        |    9 +++++++++
>  dtc.h        |   12 +++++++++++-
>  flattree.c   |    2 +-
>  fstree.c     |    2 +-
>  livetree.c   |   40 +++++++++++++++++++++++++++++++++++++++-
>  treesource.c |   27 ++++++++++++++++++++++-----
>  7 files changed, 95 insertions(+), 11 deletions(-)
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
> @@ -126,6 +127,11 @@ bool data_is_one_string(struct data d);
>  #define MAX_NODENAME_LEN	31
> =20
>  /* Live trees */
> +struct src {
> +	char *name;
> +	int lineno;
> +};

Still not seeing an explanation for why you need this, instead of
using the existing struct srcpos.

>  struct label {
>  	bool deleted;
>  	char *label;
> @@ -140,6 +146,7 @@ struct property {
>  	struct property *next;
> =20
>  	struct label *labels;
> +	struct src src;
>  };
> =20
>  struct node {
> @@ -158,6 +165,8 @@ struct node {
>  	int addr_cells, size_cells;
> =20
>  	struct label *labels;
> +	struct src begin_src;
> +	struct src end_src;
>  };
> =20
>  #define for_each_label_withdel(l0, l) \
> @@ -189,7 +198,8 @@ struct property *build_property_delete(c
>  struct property *chain_property(struct property *first, struct property =
*list);
>  struct property *reverse_properties(struct property *first);
> =20
> -struct node *build_node(struct property *proplist, struct node *children=
);
> +struct src *start_node(void);
> +struct node *build_node(struct src *begin_src, struct property *proplist=
, struct node *children);
>  struct node *build_node_delete(void);
>  struct node *name_node(struct node *node, char *name);
>  struct node *chain_node(struct node *first, struct node *list);
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
> @@ -58,6 +59,14 @@ struct property *build_property(char *na
> =20
>  	new->name =3D name;
>  	new->val =3D val;
> +	if (current_srcfile) {

So referencing current_srcfile outside of the lexer isn't strictly
speaking safe.  You'll get away with it at the moment, but in theory
the lexer/parser internal state (and hence the source location) could
be ahead of where it's actually executed parser actions for - and
those are what will cause build_property().

At the moment you'll get away with it, but if we ever add syntax that
needs the %glr-parser Bison option, then this will actually break.

> +		new->src.name =3D current_srcfile->name;
> +		new->src.lineno =3D current_srcfile->lineno;
> +	} else {
> +		/* adding implicit property, such as phandle */
> +		new->src.name =3D "__builtin__";
> +		new->src.lineno =3D 0;

Minor nit, I think it would be cleaner to just leave node->src NULL,
and format that how we like on the output side.

> +	}
> =20
>  	return new;
>  }
> @@ -97,7 +106,22 @@ struct property *reverse_properties(stru
>  	return head;
>  }
> =20
> -struct node *build_node(struct property *proplist, struct node *children)
> +struct src *start_node(void)
> +{
> +	struct src *new =3D xmalloc(sizeof(*new));
> +
> +	if (current_srcfile) {
> +		new->name =3D current_srcfile->name;
> +		new->lineno =3D current_srcfile->lineno;
> +	} else {
> +		new->name =3D "__builtin__";
> +		new->lineno =3D 0;
> +	}
> +
> +	return new;
> +}
> +
> +struct node *build_node(struct src *begin_src, struct property *proplist=
, struct node *children)
>  {
>  	struct node *new =3D xmalloc(sizeof(*new));
>  	struct node *child;
> @@ -111,6 +135,16 @@ struct node *build_node(struct property
>  		child->parent =3D new;
>  	}
> =20
> +	if (begin_src) {
> +		new->begin_src =3D *begin_src;
> +		free(begin_src);
> +	}
> +
> +	if (current_srcfile) {
> +		new->end_src.name =3D current_srcfile->name;
> +		new->end_src.lineno =3D current_srcfile->lineno;
> +	}
> +
>  	return new;
>  }
> =20
> @@ -169,6 +203,7 @@ struct node *merge_nodes(struct node *ol
> =20
>  				old_prop->val =3D new_prop->val;
>  				old_prop->deleted =3D 0;
> +				old_prop->src =3D new_prop->src;
>  				free(new_prop);
>  				new_prop =3D NULL;
>  				break;
> @@ -209,6 +244,9 @@ struct node *merge_nodes(struct node *ol
>  			add_child(old_node, new_child);
>  	}
> =20
> +	old_node->begin_src =3D new_node->begin_src;
> +	old_node->end_src =3D new_node->end_src;
> +
>  	/* The new node contents are now merged into the old node.  Free
>  	 * the new node. */
>  	free(new_node);

So, it's actually much easier than this to get the location
information.  The lexer and parser are already tracking the location
of *every* grammar symbol.  In the rules in dtc-parser.y @$ will give
you a struct srcpos with the location of the LHS of the production,
@1..@N will give you a srcpos for each symbol on the RHS.

See the "Tracking Locations" section in the Bison info for more
information.

So all you need to do is add struct srcpos * parameter to
build_property and build_node, and pass in &@$ from the parser.  Other
callers can pass NULL to record that source location isn't available.

I'm not sure of the lifetime of the struct srcpos handled by the
parser, so you might need to dupe the structures.

> Index: b/treesource.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/treesource.c
> +++ b/treesource.c
> @@ -202,7 +202,11 @@ static void write_propval(FILE *f, struc
>  	int i;
> =20
>  	if (len =3D=3D 0) {
> -		fprintf(f, ";\n");
> +		if (annotate)
> +			fprintf(f, "; /* %s:%d */\n",
> +				prop->src.name, prop->src.lineno);

So, as a bonus, if you use struct srcpos, you can use the
srcpos_string() function here, which will format it nicely, and even
handle cases where the property spans several line in the source.  And
it will include column numbers, so it will even give you useful
information if someone is silly enough to put multiple properties on
the same line.

> +		else
> +			fprintf(f, ";\n");
>  		return;
>  	}
> =20
> @@ -230,7 +234,10 @@ static void write_propval(FILE *f, struc
>  		write_propval_bytes(f, prop->val);
>  	}
> =20
> -	fprintf(f, ";\n");
> +	if (annotate)
> +		fprintf(f, "; /* %s:%d */\n", prop->src.name, prop->src.lineno);
> +	else
> +		fprintf(f, ";\n");
>  }
> =20
>  static void write_tree_source_node(FILE *f, struct node *tree, int level)
> @@ -242,10 +249,16 @@ static void write_tree_source_node(FILE
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
> +		fprintf(f, " /* %s:%d */\n",
> +			tree->begin_src.name, tree->begin_src.lineno);
> +	} else
> +		fprintf(f, "\n");
> =20
>  	for_each_property(tree, prop) {
>  		write_prefix(f, level+1);
> @@ -259,7 +272,11 @@ static void write_tree_source_node(FILE
>  		write_tree_source_node(f, child, level+1);
>  	}
>  	write_prefix(f, level);
> -	fprintf(f, "};\n");
> +	if (annotate)
> +		fprintf(f, "}; /* %s:%d */\n",
> +			tree->end_src.name, tree->end_src.lineno);
> +	else
> +		fprintf(f, "};\n");
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
> +	{"annotate",         no_argument, NULL, 'a'},

I'm slightly dubious about the short form name here, since -a means
"--all" in so many programs.

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
> +		case 'a':
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
> @@ -48,6 +48,7 @@ extern bool treesource_error;
> =20
>  	struct property *prop;
>  	struct property *proplist;
> +	struct src *src;
>  	struct node *node;
>  	struct node *nodelist;
>  	struct reserve_info *re;
> @@ -78,6 +79,7 @@ extern bool treesource_error;
>  %type <prop> propdef
>  %type <proplist> proplist
> =20
> +%type <src> openbrace
>  %type <node> devicetree
>  %type <node> nodedef
>  %type <node> subnode
> @@ -177,12 +179,20 @@ devicetree:
>  	;
> =20
>  nodedef:
> -	  '{' proplist subnodes '}' ';'
> +	  openbrace proplist subnodes '}' ';'
>  		{
> -			$$ =3D build_node($2, $3);
> +			$$ =3D build_node($1, $2, $3);
>  		}
>  	;
> =20
> +openbrace:
> +	  '{'
> +		{
> +			$$ =3D start_node();
> +		}
> +	;
> +
> +
>  proplist:
>  	  /* empty */
>  		{
> Index: b/flattree.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/flattree.c
> +++ b/flattree.c
> @@ -748,7 +748,7 @@ static struct node *unflatten_tree(struc
>  	char *flatname;
>  	uint32_t val;
> =20
> -	node =3D build_node(NULL, NULL);
> +	node =3D build_node(NULL, NULL, NULL);
> =20
>  	flatname =3D flat_read_string(dtbuf);
> =20
> Index: b/fstree.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/fstree.c
> +++ b/fstree.c
> @@ -34,7 +34,7 @@ static struct node *read_fstree(const ch
>  	if (!d)
>  		die("Couldn't opendir() \"%s\": %s\n", dirname, strerror(errno));
> =20
> -	tree =3D build_node(NULL, NULL);
> +	tree =3D build_node(NULL, NULL, NULL);
> =20
>  	while ((de =3D readdir(d)) !=3D NULL) {
>  		char *tmpname;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rZHzn+A9B7nBTGyj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWAS5TAAoJEGw4ysog2bOSxKYQALo2EM47i0OfYLKCYSYCYes0
NcPB2yRcFjlH9aAZfk6i7BtDOoAbSe35WNL2+c8Vj/e5w+aAQaIUnIBh+wcXTyyn
4aPd2OztS2hArfwbscqq2/PWZ//DUkXKHntG93dKZogHOlAh6dcMNXeGO2cuzC+C
whyiyVyR2gY9r+3ATSoVXsQUuhYnye/kTbqmppMrwonFo6eMg2ISZJcJX306VOkw
NGgoXpSZpii1fjO9At0VDd1hy95U2amKNHaNpbi7viU9TVdy/WdHtc4fQ3mSpyV8
liXagyDRw/cJW1xuVd9TFhg6e+fFak1JBVkt/4lky8+lc8d39cVv+PXyYwIpTelV
HWrglRihipH6seMvMtDGrzRtbG1mcBculUBsr7F8M9yb4EhKqFFRD4nDfbcxXxOg
WFlY5oSJUH1ALCA56ogn+vPXV/fYsnB1X23PujTykEXie5Z55qIAxk5UMWvGZ3qL
8/YeMBdzYgqYEMuxeXiG+4lRJF+B8m9E0AjWK50E8ZNr+u+VChrRN9NOx1/hHKv4
bXB2Q1S+o4gnwu/mN2nNtbZekA6OEc0RW3mpvxQfT0hhNk5nNZSmRpw+sC900fjA
af7mWQgFNAqO6H2rg1SIQRJ9tuJqjC4NKbtRDB7OxK+1xPpc3QgYF5D1A0lYyzWT
UcWthoPoU9hADfad9A+a
=7Tq6
-----END PGP SIGNATURE-----

--rZHzn+A9B7nBTGyj--
