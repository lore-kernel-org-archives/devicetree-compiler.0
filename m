From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] fdtget: Support decoding phandles
Date: Fri, 15 Sep 2017 17:01:00 +1000
Message-ID: <20170915070100.GK5250@umbus.fritz.box>
References: <20170831114536.55423-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1505463318;
        bh=Ni+Hdmxq+fAbx10zjT+aWmo2Bxj2Vd0wrB0f7wPt56Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lBmQfqXNfnk5C7tsrqk1NwqsklxIU2JULSY/oP8ZEVpdJEMne3LZPPoq9BdOohBma
         ww7TrwOmUFaHK2mAczdzkhO7jbFpSKxk1Sgay72Myz1uppia0twl3ViuiexX8iLDyc
         uOa2GcoQG4nF1CVum+Fzm/4UgWBrysGj6FcUWKrg=
Content-Disposition: inline
In-Reply-To: <20170831114536.55423-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Clinton <jclinton-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--kswDJesP0akhmDn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2017 at 05:45:36AM -0600, Simon Glass wrote:
> Currently nodes with phandles just print out as plain integer values, e.g.
>=20
>    $ fdtget firefly-rk3288/u-boot.dtb /gpio-keys/button@0 gpios
>    112 5 1
>=20
> A common use of phandles is:
>=20
>    <phandle> <n cells of stuff> <phandle> <m cells of stuff>
>=20
> It is useful to be able to decode these phandles and print them out in a
> properly formatted way, e.g.
>=20
>    $ fdtget firefly-rk3288/u-boot.dtb -P -c gpio /gpio-keys/button@0 gpios
>    /pinctrl/gpio0@ff750000 5 1
>=20
> Add a -P option to decode these sorts of phandles. For those which require
> arguments, add a -c option to specify the name of the '#xxx-cells' proper=
ty
> in the target node. This allows the tool to look up the number of cells
> that follow each phandle.
>=20
> This feature covers a common use of phandles. Of course it is not possible
> to detect phandles automatically and other uses of phandles will not be
> correctly displayed by this feature.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I think the code's correct, but although the commit message spells it
out, the code comments and more importantly the help text suggest that
it magically decodes phandles anywhere, which it can't.  I think you
need to find another way of describing this particular type of
property format (which includes phandles), so you can avoid misleading.

> ---
>=20
> Changes in v2:
> - Use 'decode' rather than 'follow'
> - Be more specific in the commit message about what is and isn't supported
> - Drop the unnecessary phandle_start variable
>=20
>  fdtget.c           | 113 +++++++++++++++++++++++++++++++++++++++++++++++=
++----
>  tests/label01.dts  |  30 ++++++++++++++
>  tests/run_tests.sh |  18 +++++++++
>  3 files changed, 154 insertions(+), 7 deletions(-)
>=20
> diff --git a/fdtget.c b/fdtget.c
> index 6cc5242..5efd3b4 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -46,6 +46,10 @@ struct display_info {
>  	int size;		/* data size (1/2/4) */
>  	enum display_mode mode;	/* display mode that we are using */
>  	const char *default_val; /* default value if node/property not found */
> +
> +	int decode_phandle;	/* decode_phandle values */
> +	/* property which defines the number of argument cells for a phandle */
> +	char *phandle_cells;
>  };
> =20
>  static void report_error(const char *where, int err)
> @@ -53,6 +57,59 @@ static void report_error(const char *where, int err)
>  	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
>  }
> =20
> +/**
> + * Shows the target node of a phandle
> + *
> + * @param disp		Display information / options
> + * @param value		Phandle value to look up
> + * @param blob		Device tree blob (for looking up phandles)
> + * @return number of arguments expected, or -1 on error
> + */
> +static int show_phandle_target(struct display_info *disp, int value,
> +			       const char *blob)
> +{
> +	const void *cells_prop;
> +	int phandle_args =3D 0;
> +	int cells_size;
> +	char buf[256];
> +	int target;
> +	int ret;
> +
> +	target =3D fdt_node_offset_by_phandle(blob, value);
> +	if (target < 0) {
> +		printf("invalid_%d", value);
> +		return -1;
> +	}
> +
> +	if (disp->phandle_cells) {
> +		cells_prop =3D fdt_getprop(blob, target, disp->phandle_cells,
> +					 &cells_size);
> +		if (!cells_prop) {
> +			fprintf(stderr, "Expected node '%s' to have property "
> +				"'%s' but it is missing\n",
> +				fdt_get_name(blob, target, NULL),
> +				disp->phandle_cells);
> +			return -1;
> +		}
> +		if (cells_size !=3D 4) {
> +			fprintf(stderr, "Expected node '%s' property '%s' size "
> +				"to be 4, but it is %d\n",
> +				fdt_get_name(blob, target, NULL),
> +				disp->phandle_cells, cells_size);
> +			return -1;
> +		}
> +		phandle_args =3D fdt32_to_cpu(*(const fdt32_t *)cells_prop);
> +	}
> +	ret =3D fdt_get_path(blob, target, buf, sizeof(buf));
> +	if (ret < 0) {
> +		report_error("Could not get full path", ret);
> +		return -1;
> +	}
> +	printf("%s", buf);
> +
> +	return phandle_args;
> +}
> +
>  /**
>   * Shows a list of cells in the requested format
>   *
> @@ -60,12 +117,14 @@ static void report_error(const char *where, int err)
>   * @param data		Data to display
>   * @param len		Maximum length of buffer
>   * @param size		Data size to use for display (e.g. 4 for 32-bit)
> + * @param blob		Device tree blob (for looking up phandles)
>   * @return 0 if ok, -1 on error
>   */
>  static int show_cell_list(struct display_info *disp, const char *data, i=
nt len,
> -			  int size)
> +			  int size, const void *blob)
>  {
>  	const uint8_t *p =3D (const uint8_t *)data;
> +	int phandle_args =3D 0; /* numnber of phandle args left to process */
>  	char fmt[3];
>  	int value;
>  	int i;
> @@ -73,12 +132,32 @@ static int show_cell_list(struct display_info *disp,=
 const char *data, int len,
>  	fmt[0] =3D '%';
>  	fmt[1] =3D disp->type ? disp->type : 'd';
>  	fmt[2] =3D '\0';
> +	if (disp->decode_phandle) {
> +		if (size !=3D 4) {
> +			fprintf(stderr, "Decoding phandles requires an output "
> +				"size of 4 bytes\n");
> +			return -1;
> +		}
> +	}
>  	for (i =3D 0; i < len; i +=3D size, p +=3D size) {
>  		if (i)
>  			printf(" ");
>  		value =3D size =3D=3D 4 ? fdt32_to_cpu(*(const fdt32_t *)p) :
>  			size =3D=3D 2 ? (*p << 8) | p[1] : *p;
> -		printf(fmt, value);
> +		if (disp->decode_phandle && phandle_args <=3D 0) {
> +			phandle_args =3D show_phandle_target(disp, value, blob);
> +			if (phandle_args < 0)
> +				return phandle_args;
> +		} else {
> +			printf(fmt, value);
> +			if (phandle_args > 0)
> +				phandle_args--;
> +		}
> +	}
> +	if (phandle_args > 0) {
> +		fprintf(stderr, "Not enough data: %d more arg(s) expected",
> +			phandle_args);
> +		return -1;
>  	}
> =20
>  	return 0;
> @@ -93,9 +172,11 @@ static int show_cell_list(struct display_info *disp, =
const char *data, int len,
>   * @param disp		Display information / options
>   * @param data		Data to display
>   * @param len		Maximum length of buffer
> - * @return 0 if ok, -1 if data does not match format
> + * @param blob		Device tree blob (for looking up phandles)
> + * @return 0 if ok, -1 on error
>   */
> -static int show_data(struct display_info *disp, const char *data, int le=
n)
> +static int show_data(struct display_info *disp, const char *data, int le=
n,
> +		     const void *blob)
>  {
>  	int size;
>  	const char *s;
> @@ -128,7 +209,7 @@ static int show_data(struct display_info *disp, const=
 char *data, int len)
>  		return -1;
>  	}
> =20
> -	return show_cell_list(disp, data, len, size);
> +	return show_cell_list(disp, data, len, size, blob);
>  }
> =20
>  /**
> @@ -241,7 +322,7 @@ static int show_data_for_item(const void *blob, struc=
t display_info *disp,
>  		assert(property);
>  		value =3D fdt_getprop(blob, node, property, &len);
>  		if (value) {
> -			if (show_data(disp, value, len))
> +			if (show_data(disp, value, len, blob))
>  				err =3D -1;
>  			else
>  				printf("\n");
> @@ -310,12 +391,14 @@ static const char usage_synopsis[] =3D
>  	"\n"
>  	"Each value is printed on a new line.\n"
>  	USAGE_TYPE_MSG;
> -static const char usage_short_opts[] =3D "t:pld:" USAGE_COMMON_SHORT_OPT=
S;
> +static const char usage_short_opts[] =3D "t:pld:Pc:" USAGE_COMMON_SHORT_=
OPTS;
>  static struct option const usage_long_opts[] =3D {
>  	{"type",              a_argument, NULL, 't'},
>  	{"properties",       no_argument, NULL, 'p'},
>  	{"list",             no_argument, NULL, 'l'},
>  	{"default",           a_argument, NULL, 'd'},
> +	{"phandle",          no_argument, NULL, 'P'},
> +	{"cells",             a_argument, NULL, 'c'},
>  	USAGE_COMMON_LONG_OPTS,
>  };
>  static const char * const usage_opts_help[] =3D {
> @@ -323,6 +406,8 @@ static const char * const usage_opts_help[] =3D {
>  	"List properties for each node",
>  	"List subnodes for each node",
>  	"Default value to display when the property is missing",
> +	"Print phandle targets and (with -c) args",
> +	"Cells property in phandle target (e.g. 'gpio' for '#gpio-cells') ",
>  	USAGE_COMMON_OPTS_HELP
>  };
> =20
> @@ -360,6 +445,20 @@ int main(int argc, char *argv[])
>  		case 'd':
>  			disp.default_val =3D optarg;
>  			break;
> +
> +		case 'P':
> +			disp.decode_phandle =3D 1;
> +			break;
> +
> +		case 'c':
> +			disp.phandle_cells =3D malloc(strlen(optarg) +
> +						    strlen("#-cells"));
> +			if (!disp.phandle_cells) {
> +				fprintf(stderr, "Out of memory\n");
> +				return 1;
> +			}
> +			sprintf(disp.phandle_cells, "#%s-cells", optarg);
> +			break;
>  		}
>  	}
> =20
> diff --git a/tests/label01.dts b/tests/label01.dts
> index a895803..020e27d 100644
> --- a/tests/label01.dts
> +++ b/tests/label01.dts
> @@ -59,5 +59,35 @@ memrsv2: /memreserve/ 0x2000000000000000 0x01000000000=
00000;
>  		linux,platform =3D <0x600>;
>  	};
> =20
> +	phandle-test {
> +		first =3D <&target_a 10 20>;
> +		both =3D <&target_a 30 40 &target_b 50 &target_a 60 70>;
> +		third =3D <&target_c &target_c>;
> +		all =3D <&target_a 30 40 &target_b 50 &target_c &target_a 60 70>;
> +		too-few-args =3D <&target_a 80>;
> +		invalid-size =3D [01];
> +		invalid-target =3D <&target_d>;
> +	};
> +
> +	target_a: target@0 {
> +		reg =3D <0 0 0 0>;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	target_b: target@1 {
> +		reg =3D <1 0 0 0>;
> +		#gpio-cells =3D <1>;
> +	};
> +
> +	target_c: target@2 {
> +		reg =3D <2 0 0 0>;
> +		#gpio-cells =3D <0>;
> +	};
> +
> +	target_d: target@3 {
> +		reg =3D <3 0 0 0>;
> +		#gpio-cells =3D [01];	/* invalid cell value */
> +	};
> +
>  };
> =20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index fa7b2f7..84a5b35 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -692,6 +692,24 @@ fdtget_tests () {
>      run_fdtget_test "<the dead silence>" -tx \
>  	-d "<the dead silence>" $dtb /randomnode doctor-who
>      run_fdtget_test "<blink>" -tx -d "<blink>" $dtb /memory doctor-who
> +
> +    # Test decoding of phandles
> +    run_fdtget_test "/target@0 10 20" -P -c "gpio" $dtb /phandle-test fi=
rst
> +    run_fdtget_test "/target@0 30 40 /target@1 50 /target@0 60 70" \
> +	-P -c "gpio" $dtb /phandle-test both
> +    run_fdtget_test "/target@2 /target@2" -P -c "gpio" $dtb /phandle-tes=
t third
> +    run_fdtget_test "/target@0 30 40 /target@1 50 /target@2 /target@0 60=
 70" \
> +	-P -c "gpio" $dtb /phandle-test all
> +
> +    # Without the -c parameter we cannot decode some phandles.
> +    run_wrap_error_test $DTGET -P $dtb /phandle-test first
> +    run_wrap_error_test $DTGET -P $dtb /phandle-test both
> +    run_wrap_error_test $DTGET -P $dtb /phandle-test all
> +    run_wrap_error_test $DTGET -P -c wrong $dtb /phandle-test all
> +
> +    run_wrap_error_test $DTGET -P -c gpio $dtb /phandle-test too-few-args
> +    run_wrap_error_test $DTGET -P -c gpio $dtb /phandle-test invalid-size
> +    run_wrap_error_test $DTGET -P -c gpio $dtb /phandle-test invalid-tar=
get
>  }
> =20
>  fdtput_tests () {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm7eqkACgkQbDjKyiDZ
s5IJXxAAzmfJIpfXDwncMY2W1FMJ3QHZTixMl2iqbxStcSPdB137G/nNU3TqwlwC
C8R9db1cXwEjfl3ol+esejG4GHS7vN43aHl0tHRuJHcQmo4mv2IshmSxWKbWefw3
6m/bT+z+oPrCfCnYoeFkbQqW4nqcLz2ActypRwCFZ0SsBFglrsauwckp2j3WXBdL
AAF/pT4up+DncuZGC12ZW4y1TMt/SmZCD41JkzDkyF5xy6uym5rTQeclLR0BtWx7
i0mYagDOEi9l/xXyhEHgDC35R02/7T3QCVzSTcI/QsB6IzZ/GUC6HPeYzDQbBzZh
VVQ2Cgyzw/OV4QwxLV/k/mvnNpY7h4ocz3ei6nzogJPFO1R13x0ttWXO6diPduQT
uOIqStmZZPtc74ZFHsa+Fewi4e95Qyax/+uuSzVrsj5yamAThxpBesYeSkHnx8m/
8NSUGYngPhgHhYd8jwBXDGF1JEKr0fY7w3z+yvdpZTy40KRsG0yLob7NKt3O6Utf
c3U7UDXUFP6Um7P9s/jlzdpc216rJQNHgQ7/eGjA9l/SwQ7ABZIMrK6hy6h7bXAt
9rwAcPhS9MK8KeTr40VMPLBW8imXiUQBFfgqZ9JQNLJkrOkhsV2EH4GrG+XWXc15
zC5XcFxnT1Z9l5l8xSfJdhKXpi4cblj54eLeuVK1LnjaKP9DgGc=
=DP3t
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--
