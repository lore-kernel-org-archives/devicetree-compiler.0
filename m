From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v6 2/3] dtc: dts source location annotation
Date: Tue, 6 Oct 2015 15:56:07 +1100
Message-ID: <20151006045607.GK3861@voom.fritz.box>
References: <560F5D15.9060606@gmail.com>
 <560F5F20.30709@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ArrI7P/b+va1vZ8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <560F5F20.30709-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--7ArrI7P/b+va1vZ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2015 at 09:52:48PM -0700, Frank Rowand wrote:
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
>   -----  long format  -----
>=20
>   sdhci@f9824900 { /* qcom-apq8074-dragonboard.dts:14.3-18.5 */
>         compatible =3D "qcom,sdhci-msm-v4"; /* qcom-msm8974.dtsi:240.4-37=
 */
>         reg =3D <0xf9824900 0x11c 0xf9824000 0x800>; /* qcom-msm8974.dtsi=
:241.4-49 */
>         reg-names =3D "hc_mem", "core_mem"; /* qcom-msm8974.dtsi:242.4-37=
 */
>         interrupts =3D <0x0 0x7b 0x0 0x0 0x8a 0x0>; /* qcom-msm8974.dtsi:=
243.4-38 */
>         interrupt-names =3D "hc_irq", "pwr_irq"; /* qcom-msm8974.dtsi:244=
=2E4-42 */
>         clocks =3D <0xd 0xd8 0xd 0xd7>; /* qcom-msm8974.dtsi:245.4-36 */
>         clock-names =3D "core", "iface"; /* qcom-msm8974.dtsi:246.4-34 */
>         status =3D "ok"; /* qcom-apq8074-dragonboard.dts:17.4-18 */
>         bus-width =3D <0x8>; /* qcom-apq8074-dragonboard.dts:15.4-20 */
>         non-removable; /* qcom-apq8074-dragonboard.dts:16.4-18 */
>   }; /* qcom-apq8074-dragonboard.dts:14.3-18.5 */
>=20
>=20
>   -----  short format (requires patch 3)  -----
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
> TODO:
>=20
>   - More testing.
>=20
> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>  dtc-parser.y |   16 ++++++++--------
>  dtc.c        |    9 +++++++++
>  dtc.h        |    9 ++++++---
>  flattree.c   |    2 +-
>  fstree.c     |    7 ++++---
>  livetree.c   |   20 ++++++++++++++------
>  srcpos.c     |   35 +++++++++++++++++++++++++++++++++++
>  srcpos.h     |    2 ++
>  treesource.c |   38 +++++++++++++++++++++++++++++++++-----
>  9 files changed, 112 insertions(+), 26 deletions(-)
>=20
> Index: b/dtc.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[snip]
> Index: b/dtc-parser.y
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -134,11 +134,11 @@ memreserve:
>  devicetree:
>  	  '/' nodedef
>  		{
> -			$$ =3D name_node($2, "");
> +			$$ =3D name_node($2, "", &@1);
>  		}
>  	| devicetree '/' nodedef
>  		{
> -			$$ =3D merge_nodes($1, $3);
> +			$$ =3D merge_nodes($1, $3, srcpos_combine(&@2, &@3));
>  		}

The two branches here aren't quite consistent - the first doesn't
include the '/', the second does.  You could either change the second
to just &@3, or use &@$ for the first.

> =20
>  	| devicetree DT_LABEL DT_REF nodedef
> @@ -147,7 +147,7 @@ devicetree:
> =20
>  			add_label(&target->labels, $2);
>  			if (target)
> -				merge_nodes(target, $4);
> +				merge_nodes(target, $4, &@4);

This one doesn't include the name/label again

>  			else
>  				ERROR(&@3, "Label or path %s not found", $3);
>  			$$ =3D $1;
> @@ -157,7 +157,7 @@ devicetree:
>  			struct node *target =3D get_node_by_ref($1, $2);
> =20
>  			if (target)
> -				merge_nodes(target, $3);
> +				merge_nodes(target, $3, &@3);
>  			else
>  				ERROR(&@2, "Label or path %s not found", $2);
>  			$$ =3D $1;
> @@ -197,11 +197,11 @@ proplist:
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
> @@ -456,11 +456,11 @@ subnodes:
>  subnode:
>  	  DT_PROPNODENAME nodedef
>  		{
> -			$$ =3D name_node($2, $1);
> +			$$ =3D name_node($2, $1, &@$);

=2E. and this one does.

Looking at all of these it's probably going to be simplest not to
include the label/name (i.e. just use the srcpos from the nodedef).

>  		}
>  	| DT_DEL_NODE DT_PROPNODENAME ';'
>  		{
> -			$$ =3D name_node(build_node_delete(), $2);
> +			$$ =3D name_node(build_node_delete(), $2, &@$);
>  		}
>  	| DT_LABEL subnode
>  		{
> Index: b/srcpos.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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

You still don't need this function.  srcfile_states have unlimited
lifetime.

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
> +	return pos_new;
> +}
> +
> =20
> =20
>  void
> Index: b/srcpos.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/srcpos.h
> +++ b/srcpos.h
> @@ -104,6 +104,8 @@ extern struct srcpos srcpos_empty;
> =20
>  extern void srcpos_update(struct srcpos *pos, const char *text, int len);
>  extern struct srcpos *srcpos_copy(struct srcpos *pos);
> +extern struct srcpos *srcpos_copy_all(struct srcpos *pos);
> +extern struct srcpos *srcpos_combine(struct srcpos *left_srcpos, struct =
srcpos *right_srcpos);
>  extern char *srcpos_string(struct srcpos *pos);
>  extern void srcpos_dump(struct srcpos *pos);
> =20
> Index: b/flattree.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/flattree.c
> +++ b/flattree.c
> @@ -692,7 +692,7 @@ static struct property *flat_read_proper
> =20
>  	val =3D flat_read_data(dtbuf, proplen);
> =20
> -	return build_property(name, val);
> +	return build_property(name, val, NULL);
>  }
> =20
> =20
> Index: b/fstree.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/fstree.c
> +++ b/fstree.c
> @@ -60,7 +60,8 @@ static struct node *read_fstree(const ch
>  			} else {
>  				prop =3D build_property(xstrdup(de->d_name),
>  						      data_copy_file(pfile,
> -								     st.st_size));
> +								     st.st_size),
> +						      NULL);
>  				add_property(tree, prop);
>  				fclose(pfile);
>  			}
> @@ -68,7 +69,7 @@ static struct node *read_fstree(const ch
>  			struct node *newchild;
> =20
>  			newchild =3D read_fstree(tmpname);
> -			newchild =3D name_node(newchild, xstrdup(de->d_name));
> +			newchild =3D name_node(newchild, xstrdup(de->d_name), NULL);
>  			add_child(tree, newchild);
>  		}
> =20
> @@ -84,7 +85,7 @@ struct boot_info *dt_from_fs(const char
>  	struct node *tree;
> =20
>  	tree =3D read_fstree(dirname);
> -	tree =3D name_node(tree, "");
> +	tree =3D name_node(tree, "", NULL);
> =20
>  	return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7ArrI7P/b+va1vZ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWE1RmAAoJEGw4ysog2bOSgNYQAITsi4hhZTqOE8GVOsEXuPeZ
GBRnl/wvMmxTcYc9UE5k0uJw383TfmjirsmK3+Ak7AR6nlwa+lqr4nKBHn7aJ8/W
BxrW3YejLWkkuiWAzwYIue37c4KrW/GbdvrE1fZb3NY41HZq8+rAgaHja/WCnH9n
nO4Tn6ExDu43bB/VGHXRQ3OtOOtXWPQ8bfOjZ62Vhd2cuvCZl9RGtEWJdLRyydp4
cwbA+d7AhGKGSCZwSqqqykd25MQraI6t6OtgkbBn5U6iCKgx7m+etrf0VRVWanXj
nH+zRUbJTIdydOHdCw4NeXoxtxiwLSWhm1C7OMRUshh4jQrEuzuLZ5Mg8PUjOpPS
WN2tkXUJyqVe4S1kvrunP8qkVDE5TQSwI0XxOgr3WYeig/1NuJpwULTKCt5kiz9+
XmpykiIELcf9oeqfRG7j1v3AyyKlQecWefnrmj0PFC0ZOg5uqP/z7BodrORUyPcp
iutiSiXeYIFa0dFT8wJdsWfru44e6QkbJXYiWxsSQ5ZBoLz8Qt/1DIRkGC83I55u
B+tj/GSB4t707uu+Dpk5mCTO2rLyV6LagSEhQE1nA23imbHPuCb/g2NunCYDh3RW
XxD5OUdjoOlbL5tv/RvNH2hTZFn7NrQK8DcpwfgVly0F/E1DAqPlA6p8UmwtmxAu
8XKlIY35JWVkTKjSuvYI
=E2RM
-----END PGP SIGNATURE-----

--7ArrI7P/b+va1vZ8--
