From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] dtc: dts source location annotation
Date: Mon, 21 Sep 2015 16:31:19 +1000
Message-ID: <20150921063119.GL20331@voom.fritz.box>
References: <55F8EB35.5010601@gmail.com>
 <55F8EE7A.7080301@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c8JyeaiReRNoiMDS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F8EE7A.7080301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--c8JyeaiReRNoiMDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 09:22:18PM -0700, Frank Rowand wrote:
>=20
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Proof of concept patch.
>=20
> Annotates input source file and line number of nodes and properties
> as comments in output .dts file when --annotate flag is supplied.
>=20
> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

A like the concept, but I have some queries about the implementation.

> ---
>  dtc-lexer.l  |    2 +
>  dtc.c        |    9 ++++++++
>  dtc.h        |   14 +++++++++++++
>  livetree.c   |   62 ++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>  srcpos.h     |    6 +++++
>  treesource.c |   27 ++++++++++++++++++++-----
>  6 files changed, 115 insertions(+), 5 deletions(-)
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
> @@ -126,6 +127,16 @@ bool data_is_one_string(struct data d);
>  #define MAX_NODENAME_LEN	31
> =20
>  /* Live trees */
> +struct src {
> +	char *name;
> +	int lineno;
> +};

I'd prefer to see the existing struct srcpos used, rather than
creating a new structure.

> +struct prop_src {
> +	struct prop_src *prev;
> +	struct src src;
> +};
> +
>  struct label {
>  	bool deleted;
>  	char *label;
> @@ -140,6 +151,7 @@ struct property {
>  	struct property *next;
> =20
>  	struct label *labels;
> +	struct src src;
>  };
> =20
>  struct node {
> @@ -158,6 +170,8 @@ struct node {
>  	int addr_cells, size_cells;
> =20
>  	struct label *labels;
> +	struct src begin_src;
> +	struct src end_src;
>  };
> =20
>  #define for_each_label_withdel(l0, l) \
> Index: b/livetree.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/livetree.c
> +++ b/livetree.c
> @@ -19,6 +19,9 @@
>   */
> =20
>  #include "dtc.h"
> +#include "srcpos.h"
> +
> +struct prop_src *prev_prop_src =3D NULL;

So you've built a new global stack here, and I don't really understand
what it's for.  The parser already tracks source positions for each
construct, so you should be able to just use that.  You'd need to pass
the srcpos from dtc-parser.y into the tree building calls in more
places, but that should be it.

Or have I missed something?

>  /*
>   * Tree building functions
> @@ -58,6 +61,13 @@ struct property *build_property(char *na
> =20
>  	new->name =3D name;
>  	new->val =3D val;
> +	if (current_srcfile) {
> +		new->src.name =3D current_srcfile->name;
> +		new->src.lineno =3D current_srcfile->lineno;
> +	} else {
> +		new->src.name =3D "__builtin__";
> +		new->src.lineno =3D 0;

A comment explaining when this will happen in practice would be nice.

Incidentally.. what happens if you use dtb input and try to annotate?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--c8JyeaiReRNoiMDS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV/6Q3AAoJEGw4ysog2bOSJqQQAJ2SLfR7HKe5D/ufbAbYwC1H
rQgKaDmaq0xEF0PEkAP1/gosO2cVJ5S7XUZEIX5u5M1xpMiXnlX5cb1Pjz932bOC
+CwxPslYpspQtFKeD3f1xL1yIKE0gzGkVmyD2R9t9kMj/Sqmon6wF6caI9IYSFDo
UhGrpZg63p0Ramqg5LRV1V12+DjY62mYYsq7PTIQeHyg5FhmLmcYJWu6Bykmz78u
cVjmKdYRsZXCGMI4/yXo1yRV0wHOs+rooNiZ80k34C8z+0IbudBJwJ3OXCbhds3i
egYZjJOlPmn3jWfQZoFkk2G8uuBt9OFTRIaX0dlQW/ZVwypPVPguqpsaDIq5tGK9
5I74piAlObQn9NEuj4qUfr+9PhnNs6asVtyHVmM7fG8AdrQGrhKxGfED+I20tzOO
lfhZdLwBNUTggLZshKU8JeWiq4xU08d12PKGMfpVhfVjHl8lwZD1vADTbVpcRJ+y
tO00siCQIVAkq6T7iZM2C/5gjZTNwpCeQmigIGP3zjinX6E4YaMQo1ckWN61Gr7F
iu3qRHa625fsFyDqvOSzGy0GCn7r8wSmj5I3fXxKmPQlI9+xeWDZTf+XF/G8JBR9
4I3DSlYtZsuW4zUNmwfxpCxl9cqomazPkoGa5fBBrlbOq7iW3gDh173jBT1kEONO
y6Oa/7HpRN5UBlgwmSIM
=Ktin
-----END PGP SIGNATURE-----

--c8JyeaiReRNoiMDS--
