From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH] checks: Use source position information for check
 failures
Date: Wed, 10 Jan 2018 16:30:20 +1100
Message-ID: <20180110053020.GD19773@umbus.fritz.box>
References: <20180108224927.1016-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GpGaEY17fSl8rd50"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1515563069;
        bh=sVHdJOtfKnlLkPT4b8lOT2DNpv12cuVKoXd6jeEqgwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AwEHiypsnlKV2pp5f/PTxUOSR7LlQ2+iYU/N++b3GKfpWIbNoBISIe5jcZWC0BZS4
         6s7GeEZSbcRbaTuD4SOcdI6jyRThgJ/lu/f4PlKEZ24RYJQyViajIKT6vGl4qOhWWv
         p1JFntA2cUASMxMmAkp8NG//DrZiEsbM7LYsJbE8=
Content-Disposition: inline
In-Reply-To: <20180108224927.1016-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


--GpGaEY17fSl8rd50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 04:49:27PM -0600, Rob Herring wrote:
> Now that we retain source position information of nodes and properties,
> make that the preferred file name (and position) to print out in check
> failures. This will greatly simplify finding and fixing check errors
> because most errors are in included source .dtsi files and they get
> duplicated every time the source file is included.
>=20
> For now, only converting a few locations and using a new macro name. I
> will convert all FAIL occurences once we agree on the new syntax. Also,
> after this, some checks may need some rework to have more specific
> line numbers of properties rather than nodes.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

So, I like the basic idea here - something I've kind of wanted for a while.

> ---
> This is based on Julia's annotation series.

But that series will need a new spin, which will require a new spin of
this at the last.

>=20
>  checks.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 7845472742e0..2078c0fe75eb 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -19,6 +19,7 @@
>   */
> =20
>  #include "dtc.h"
> +#include "srcpos.h"
> =20
>  #ifdef TRACE_CHECKS
>  #define TRACE(c, ...) \
> @@ -72,7 +73,8 @@ struct check {
>  #define CHECK(nm_, fn_, d_, ...) \
>  	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> =20
> -static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_in=
fo *dti,
> +static inline void  PRINTF(4, 5) check_msg(struct check *c, struct dt_in=
fo *dti,
> +					   struct srcpos *pos,
>  					   const char *fmt, ...)
>  {
>  	va_list ap;
> @@ -80,8 +82,15 @@ static inline void  PRINTF(3, 4) check_msg(struct chec=
k *c, struct dt_info *dti,
> =20
>  	if ((c->warn && (quiet < 1))
>  	    || (c->error && (quiet < 2))) {
> +		const char *file_str;
> +		if (pos)
> +			file_str =3D srcpos_string(pos);
> +		else if (streq(dti->outname, "-"))
> +			file_str =3D "<stdout>";
> +		else
> +			file_str =3D dti->outname;
>  		fprintf(stderr, "%s: %s (%s): ",
> -			strcmp(dti->outname, "-") ? dti->outname : "<stdout>",
> +			file_str,
>  			(c->error) ? "ERROR" : "Warning", c->name);

Incidentally, the reason it currently shows the output name, which
seems weird at first glance, is so that if you have a whole batch of
dtc commands running from a script or Makefile, you can at least tell
which command caused the check failure.

>  		vfprintf(stderr, fmt, ap);
>  		fprintf(stderr, "\n");
> @@ -93,7 +102,14 @@ static inline void  PRINTF(3, 4) check_msg(struct che=
ck *c, struct dt_info *dti,
>  	do {								\
>  		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
>  		(c)->status =3D FAILED;					\
> -		check_msg((c), dti, __VA_ARGS__);			\
> +		check_msg((c), dti, NULL, __VA_ARGS__);			\
> +	} while (0)
> +
> +#define FAIL_POS(c, dti, p, ...)						\
> +	do {								\
> +		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
> +		(c)->status =3D FAILED;					\
> +		check_msg((c), dti, p, __VA_ARGS__);			\
>  	} while (0)
> =20
>  static void check_nodes_props(struct check *c, struct dt_info *dti, stru=
ct node *node)
> @@ -126,7 +142,7 @@ static bool run_check(struct check *c, struct dt_info=
 *dti)
>  		error =3D error || run_check(prq, dti);
>  		if (prq->status !=3D PASSED) {
>  			c->status =3D PREREQ;
> -			check_msg(c, dti, "Failed prerequisite '%s'",
> +			check_msg(c, dti, NULL, "Failed prerequisite '%s'",
>  				  c->prereq[i]->name);
>  		}
>  	}
> @@ -1049,7 +1065,7 @@ static void check_avoid_unnecessary_addr_size(struc=
t check *c, struct dt_info *d
>  	}
> =20
>  	if (!has_reg)
> -		FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\=
" or child \"reg\" property in %s",
> +		FAIL_POS(c, dti, node->srcpos, "unnecessary #address-cells/#size-cells=
 without \"ranges\" or child \"reg\" property in %s",
>  		     node->fullpath);

Checks are already associated with a node, would it make more sense to
print the position information from the general code?

>  }
>  WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, =
NULL, &avoid_default_addr_size);
> @@ -1437,7 +1453,7 @@ static void check_graph_child_address(struct check =
*c, struct dt_info *dti,
>  		cnt++;
> =20
>  	if (cnt =3D=3D 1 && node->addr_cells !=3D -1)
> -		FAIL(c, dti, "graph node '%s' has single child node, unit address is n=
ot necessary",
> +		FAIL_POS(c, dti, node->srcpos, "graph node '%s' has single child node,=
 unit address is not necessary",
>  		     node->fullpath);
>  }
>  WARNING(graph_child_address, check_graph_child_address, NULL, &graph_nod=
es);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GpGaEY17fSl8rd50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpVpOoACgkQbDjKyiDZ
s5Jz7w/9HG0Ja9gjeo/G2ve/GZGPkjli622LX0lNQu/Iy4Et+PgNnADAAa/ptkBU
32SmCTSQy/j4Pue7fDP7+YDEKSAJC8H15wIyP6Ss96mzUZwb7MCqGk76qhHiFCqv
tdsrnFuT7tkEFnwd8ZLsW5cCtF1SPBLcjO2ccxGy0mAjgtmvVxKBRIgsDytdwsmX
5USblyAm9D4ymf2CMb68ZeL77SE+iQ4gbaksDeoDev5xPcb+qucW+b8cwdp9mqon
42jV7PECfBNl7dN7HOE+/Z7t008HMVOGKclCcPqzU3iE8/CX4x8zuWZhSvnUsR0R
tBTmDiZUB8Dkmpa7OvX61sn+Yh2NLuNjlYtQeMrG41ZXkCbvZc49oE+eVspWHeLJ
t3o4ZEIySPjb09nB07KI4hVyNz0FPInDW+S6q5wktbtWeEwQDtzHYlM8nzKD/4Ko
mKq0c5tqAI9i8O5hBQyNHmRDpsrKv9/y1+V2kuqDCjddgTi+VWGLnbaa0fjLPjBO
tEkaHF/Ty9k3PGcLdnvJg38XdHJucRCFM4vtN3c/7lnInLFiNF07J8aLpUHV4xzZ
zc/mKNuO129DK7kIMi+pnyUoGU/I03vgYf9eY15UAC5gy9h3ulF7cQB37F9tMsae
wM/MGAXGk75WzE7Znwx+3KHfRvGdJDyC1wzSLXeWT8HaGvCZVCc=
=H+wG
-----END PGP SIGNATURE-----

--GpGaEY17fSl8rd50--
