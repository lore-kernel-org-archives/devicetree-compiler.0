From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] fdtget: Support following phandles
Date: Wed, 23 Aug 2017 15:47:37 +1000
Message-ID: <20170823054737.GQ5379@umbus.fritz.box>
References: <20170820122855.171271-1-sjg@chromium.org>
 <20170820122855.171271-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1WN/MJ7JJGqVzwIW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503467262;
        bh=4dtPNgf4WfV56ztm6+hVdauKp7Fq7uQKX69EyehZVaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cH/60hHNBI6Ky/BvxQBph+XS5yPHJNZp5NGROy0lB2Awe/QRkrsuCO1EZZ+Kw6iSC
         GnHmoQctS+QVkGEm39j+utYVDGUX7xybJYgO8qqGZVcwzz8GC5aBl4shrzDjwCMxCr
         2Jz/liQxZ3yI6onyR2z2v9C1YJa3yX67GSd0dEbA=
Content-Disposition: inline
In-Reply-To: <20170820122855.171271-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Clinton <jclinton-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--1WN/MJ7JJGqVzwIW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 20, 2017 at 06:28:55AM -0600, Simon Glass wrote:
> Currently nodes with phandles just print out as plain integer values, e.g.
>=20
>    $ fdtget firefly-rk3288/u-boot.dtb /gpio-keys/button@0 gpios
>    112 5 1
>=20
> It is useful to be able to follow these phandles and print them out in a
> properly formatted way, e.g.

So, I don't think "follow" is the right word here (and throughout).
To me "follow" implies displaying information from the target of the
phandle, rather than the phandle itself.  This is about decoding the
phandle to display in a more readable fashion, but we are still
basically displaying the phandle.

>    $ fdtget firefly-rk3288/u-boot.dtb -f -c gpio /gpio-keys/button@0 gpios
>    /pinctrl/gpio0@ff750000 5 1
>=20
> Add a -f option to follow phandles. For those which require arguments, add
> a -c option to specify the name of the '#xxx-cells' property in the target
> node.

AFAICT this is substantially less general than the commit message and
help text suggest.  It specifically decodes properties of the form
	<phandle> <n cells of stuff> <phandle> <m cells of stuff>

Where the n & m are determined by a single #*-cells property in the
phandle target.  That's a fairly common property format, but it's
certainly not the only place phandles can appear.  It will also handle
the case of a simple array of phandles, though that requires a bit of
thinking to work through.

It won't work with something like interrupt-map for example, and
obviously in general there's no way to automatically detect phandles.

Having an option to interpret a particular property format is fine of
course, but it shouldn't advertise as doing more than it can.

> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
>  fdtget.c           | 115 +++++++++++++++++++++++++++++++++++++++++++++++=
++----
>  tests/label01.dts  |  30 ++++++++++++++
>  tests/run_tests.sh |  18 +++++++++
>  3 files changed, 156 insertions(+), 7 deletions(-)
>=20
> diff --git a/fdtget.c b/fdtget.c
> index 6cc5242..6d7c6af 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -46,6 +46,10 @@ struct display_info {
>  	int size;		/* data size (1/2/4) */
>  	enum display_mode mode;	/* display mode that we are using */
>  	const char *default_val; /* default value if node/property not found */
> +
> +	int follow;		/* follow phandle links */
> +	/* property which defines the number of parameter cells for a phandle */
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
> @@ -60,12 +117,15 @@ static void report_error(const char *where, int err)
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
> +	int phandle_start =3D 0; /* expecting a phandle pointer next */
> +	int phandle_args =3D 0; /* numnber of phandle args left to process */
>  	char fmt[3];
>  	int value;
>  	int i;
> @@ -73,12 +133,33 @@ static int show_cell_list(struct display_info *disp,=
 const char *data, int len,
>  	fmt[0] =3D '%';
>  	fmt[1] =3D disp->type ? disp->type : 'd';
>  	fmt[2] =3D '\0';
> +	if (disp->follow) {
> +		if (size !=3D 4) {
> +			fprintf(stderr, "Following phandles requires an output "
> +				"size of 4 bytes\n");
> +			return -1;
> +		}
> +		phandle_start =3D 1;
> +	}
>  	for (i =3D 0; i < len; i +=3D size, p +=3D size) {
>  		if (i)
>  			printf(" ");
>  		value =3D size =3D=3D 4 ? fdt32_to_cpu(*(const fdt32_t *)p) :
>  			size =3D=3D 2 ? (*p << 8) | p[1] : *p;
> -		printf(fmt, value);
> +		if (phandle_start && phandle_args <=3D 0) {
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
> @@ -93,9 +174,11 @@ static int show_cell_list(struct display_info *disp, =
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
> @@ -128,7 +211,7 @@ static int show_data(struct display_info *disp, const=
 char *data, int len)
>  		return -1;
>  	}
> =20
> -	return show_cell_list(disp, data, len, size);
> +	return show_cell_list(disp, data, len, size, blob);
>  }
> =20
>  /**
> @@ -241,7 +324,7 @@ static int show_data_for_item(const void *blob, struc=
t display_info *disp,
>  		assert(property);
>  		value =3D fdt_getprop(blob, node, property, &len);
>  		if (value) {
> -			if (show_data(disp, value, len))
> +			if (show_data(disp, value, len, blob))
>  				err =3D -1;
>  			else
>  				printf("\n");
> @@ -310,12 +393,14 @@ static const char usage_synopsis[] =3D
>  	"\n"
>  	"Each value is printed on a new line.\n"
>  	USAGE_TYPE_MSG;
> -static const char usage_short_opts[] =3D "t:pld:" USAGE_COMMON_SHORT_OPT=
S;
> +static const char usage_short_opts[] =3D "t:pld:fc:" USAGE_COMMON_SHORT_=
OPTS;
>  static struct option const usage_long_opts[] =3D {
>  	{"type",              a_argument, NULL, 't'},
>  	{"properties",       no_argument, NULL, 'p'},
>  	{"list",             no_argument, NULL, 'l'},
>  	{"default",           a_argument, NULL, 'd'},
> +	{"follow",           no_argument, NULL, 'f'},
> +	{"cells",             a_argument, NULL, 'c'},
>  	USAGE_COMMON_LONG_OPTS,
>  };
>  static const char * const usage_opts_help[] =3D {
> @@ -323,6 +408,8 @@ static const char * const usage_opts_help[] =3D {
>  	"List properties for each node",
>  	"List subnodes for each node",
>  	"Default value to display when the property is missing",
> +	"Print phandle targets and (with -c) args",
> +	"Cells property in phandle target (e.g. 'gpio' for '#gpio-cells') ",
>  	USAGE_COMMON_OPTS_HELP
>  };
> =20
> @@ -360,6 +447,20 @@ int main(int argc, char *argv[])
>  		case 'd':
>  			disp.default_val =3D optarg;
>  			break;
> +
> +		case 'f':
> +			disp.follow =3D 1;
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
> index 3bc5b41..6272675 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -692,6 +692,24 @@ fdtget_tests () {
>      run_fdtget_test "<the dead silence>" -tx \
>  	-d "<the dead silence>" $dtb /randomnode doctor-who
>      run_fdtget_test "<blink>" -tx -d "<blink>" $dtb /memory doctor-who
> +
> +    # Test following of phandles
> +    run_fdtget_test "/target@0 10 20" -f -c "gpio" $dtb /phandle-test fi=
rst
> +    run_fdtget_test "/target@0 30 40 /target@1 50 /target@0 60 70" \
> +	-f -c "gpio" $dtb /phandle-test both
> +    run_fdtget_test "/target@2 /target@2" -f -c "gpio" $dtb /phandle-tes=
t third
> +    run_fdtget_test "/target@0 30 40 /target@1 50 /target@2 /target@0 60=
 70" \
> +	-f -c "gpio" $dtb /phandle-test all
> +
> +    # Without the -c parameter we cannot decode some phandles.
> +    run_wrap_error_test $DTGET -f $dtb /phandle-test first
> +    run_wrap_error_test $DTGET -f $dtb /phandle-test both
> +    run_wrap_error_test $DTGET -f $dtb /phandle-test all
> +    run_wrap_error_test $DTGET -f -c wrong $dtb /phandle-test all
> +
> +    run_wrap_error_test $DTGET -f -c gpio $dtb /phandle-test too-few-args
> +    run_wrap_error_test $DTGET -f -c gpio $dtb /phandle-test invalid-size
> +    run_wrap_error_test $DTGET -f -c gpio $dtb /phandle-test invalid-tar=
get
>  }
> =20
>  fdtput_tests () {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1WN/MJ7JJGqVzwIW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmdFvcACgkQbDjKyiDZ
s5K4hA/9HLIa6HMKa2jfBpQHrxhM9s21eim/DCTpubKE02wEhrwDrcJz1rfCi6JF
4rB/3w+T6k99weolmdQxr+R9SiQ2cwfyDWp9rajrmq0n4NXt3jDVKBARb4B032bl
cEU2GYjXdswVGrdd1mWcLqQpARR19NwKBa9THvEswiW4uCIe/pvv+f189NoEgr1J
4O63YOhag9CJPlrtDuqolJQkwcP1MCT7iR5o5QcXQnvoduKWFE/qRC2kXFqU7gIa
idIxWz8uLgRI0AH8me8t4JXwYT8pvKVVDratelVncJuY7I+ZJdEd8iWUdmrVFsLi
bjSgfR4sICIHOLDeDuZeoToTSHDNHP6jaKpMnvI39PFxnJFzoHnQc6t443lE/HdM
HflMXY0INaebFXSeaIxScn8/kkMkZZ6dc6uw4V3ei+SHu4PoGxAJmq7Y9sxFNEPw
vF1Ur2E8XCnpCoOKoxJ/BG6JfLmve/KEwq1YYpWFyvrVcPjaTr8OAnuLF3v1MLj7
BgJQ/R6oMxU3FhEkhEE8jMTCviXlSnXBg9FKW2MV1LiTbhg6fZxJ2S9jL3ZFF2c7
qe2KMNl8j/WEDXwhFMsNYbch4cxYvKd3tzDM1c2PhN6H+MFOzkZNRyEdVoo+ADKH
q6Sakf+04xLHuUJ8h7hkoMgEbDwgYFBsF70vbmflsVzTEB3o2sA=
=42Ji
-----END PGP SIGNATURE-----

--1WN/MJ7JJGqVzwIW--
