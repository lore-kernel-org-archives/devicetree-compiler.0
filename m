From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6] Implement the -a option to pad dtb aligned
Date: Thu, 22 Sep 2016 14:43:21 +1000
Message-ID: <20160922044321.GC2085@umbus.fritz.box>
References: <1468828613-14345-1-git-send-email-timwang@asrmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1474519406;
        bh=9+w60TlYGbM+Itg4suh6ZEdroeL3wC70Hl93gPtrjtE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ipsjpG9sWvfzg+LxxhgynucV6N/n6WaDAfOLCJCOQagzgtzJAy5RPyJTzvK2HEPRG
         eNrjJTB5sjnI003kdUAn6hn9j1HOJtd0yq3UM4y15JMRMY1SQfluzqIdBYDre4k65P
         Jx+ke/U2xlbiHM2+KpnlMz9DuuLnNgyaeHKgI71k=
Content-Disposition: inline
In-Reply-To: <1468828613-14345-1-git-send-email-timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wtt_usst-9Onoh4P/yGk@public.gmane.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2016 at 03:56:53PM +0800, Tim Wang wrote:
> There is one condition that need cat the dtb files
> into one dtb.img which can support several boards
> use same SoC platform.
>=20
> And the original dtb file size is not aligned to any base.
> This may cause "Synchronous Abort" when load from a unligned
> address on some SoC machine, such as ARM.
>=20
> So this patch implement the -a <aligned number> option to
> pad zero at the end of dtb files and make the dtb size aligned
> to <aligned number>.
>=20
> Then, the aligned dtbs can cat together and load without "Synchronous
> Abort".
>=20
> Signed-off-by: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>

Sorry I've taken so long to look at this again.

I've now merged this to the master branch.

There were still some problems with the testcases, but I've fixed
those in a follow up patch.


> ---
>  dtc.c              | 17 ++++++++++++++++-
>  dtc.h              |  1 +
>  flattree.c         | 17 +++++++++++++----
>  tests/run_tests.sh | 28 ++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+), 5 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index 5fa23c4..9dcf640 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -30,8 +30,14 @@ int quiet;		/* Level of quietness */
>  int reservenum;		/* Number of memory reservation slots */
>  int minsize;		/* Minimum blob size */
>  int padsize;		/* Additional padding to blob */
> +int alignsize;		/* Additional padding to blob accroding to the alignsize=
 */
>  int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or phandle pro=
perties */
> =20
> +static int is_power_of_2(int x)
> +{
> +	return (x > 0) && ((x & (x - 1)) =3D=3D 0);
> +}
> +
>  static void fill_fullpaths(struct node *tree, const char *prefix)
>  {
>  	struct node *child;
> @@ -53,7 +59,7 @@ static void fill_fullpaths(struct node *tree, const cha=
r *prefix)
>  #define FDT_VERSION(version)	_FDT_VERSION(version)
>  #define _FDT_VERSION(version)	#version
>  static const char usage_synopsis[] =3D "dtc [options] <input file>";
> -static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:h=
v";
> +static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E=
:hv";
>  static struct option const usage_long_opts[] =3D {
>  	{"quiet",            no_argument, NULL, 'q'},
>  	{"in-format",         a_argument, NULL, 'I'},
> @@ -64,6 +70,7 @@ static struct option const usage_long_opts[] =3D {
>  	{"reserve",           a_argument, NULL, 'R'},
>  	{"space",             a_argument, NULL, 'S'},
>  	{"pad",               a_argument, NULL, 'p'},
> +	{"align",             a_argument, NULL, 'a'},
>  	{"boot-cpu",          a_argument, NULL, 'b'},
>  	{"force",            no_argument, NULL, 'f'},
>  	{"include",           a_argument, NULL, 'i'},
> @@ -91,6 +98,7 @@ static const char * const usage_opts_help[] =3D {
>  	"\n\tMake space for <number> reserve map entries (for dtb and asm outpu=
t)",
>  	"\n\tMake the blob at least <bytes> long (extra space)",
>  	"\n\tAdd padding to the blob of <bytes> long (extra space)",
> +	"\n\tMake the blob align to the <bytes> (extra space)",
>  	"\n\tSet the physical boot cpu",
>  	"\n\tTry to produce output even if the input tree has errors",
>  	"\n\tAdd a path to search for include files",
> @@ -169,6 +177,7 @@ int main(int argc, char *argv[])
>  	reservenum =3D 0;
>  	minsize    =3D 0;
>  	padsize    =3D 0;
> +	alignsize  =3D 0;
> =20
>  	while ((opt =3D util_getopt_long()) !=3D EOF) {
>  		switch (opt) {
> @@ -196,6 +205,12 @@ int main(int argc, char *argv[])
>  		case 'p':
>  			padsize =3D strtol(optarg, NULL, 0);
>  			break;
> +		case 'a':
> +			alignsize =3D strtol(optarg, NULL, 0);
> +			if (!is_power_of_2(alignsize))
> +				die("Invalid argument \"%d\" to -a option\n",
> +				    optarg);
> +			break;
>  		case 'f':
>  			force =3D true;
>  			break;
> diff --git a/dtc.h b/dtc.h
> index 56212c8..32009bc 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -53,6 +53,7 @@ extern int quiet;		/* Level of quietness */
>  extern int reservenum;		/* Number of memory reservation slots */
>  extern int minsize;		/* Minimum blob size */
>  extern int padsize;		/* Additional padding to blob */
> +extern int alignsize;		/* Additional padding to blob accroding to the al=
ignsize */
>  extern int phandle_format;	/* Use linux,phandle or phandle properties */
> =20
>  #define PHANDLE_LEGACY	0x1
> diff --git a/flattree.c b/flattree.c
> index 089b976..a9d9520 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -398,15 +398,22 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int =
version)
>  	 */
>  	if (minsize > 0) {
>  		padlen =3D minsize - fdt32_to_cpu(fdt.totalsize);
> -		if ((padlen < 0) && (quiet < 1))
> -			fprintf(stderr,
> -				"Warning: blob size %d >=3D minimum size %d\n",
> -				fdt32_to_cpu(fdt.totalsize), minsize);
> +		if (padlen < 0) {
> +			padlen =3D 0;
> +			if (quiet < 1)
> +				fprintf(stderr,
> +					"Warning: blob size %d >=3D minimum size %d\n",
> +					fdt32_to_cpu(fdt.totalsize), minsize);
> +		}
>  	}
> =20
>  	if (padsize > 0)
>  		padlen =3D padsize;
> =20
> +	if (alignsize > 0)
> +		padlen =3D ALIGN(fdt32_to_cpu(fdt.totalsize) + padlen, alignsize)
> +			- fdt32_to_cpu(fdt.totalsize);
> +
>  	if (padlen > 0) {
>  		int tsize =3D fdt32_to_cpu(fdt.totalsize);
>  		tsize +=3D padlen;
> @@ -572,6 +579,8 @@ void dt_to_asm(FILE *f, struct boot_info *bi, int ver=
sion)
>  	if (padsize > 0) {
>  		fprintf(f, "\t.space\t%d, 0\n", padsize);
>  	}
> +	if (alignsize > 0)
> +		asm_emit_align(f, alignsize);
>  	emit_label(f, symprefix, "blob_abs_end");
> =20
>  	data_free(strbuf);
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 7eb9b3d..cb1fdad 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -62,6 +62,11 @@ run_test () {
>      base_run_test $VALGRIND $VGSUPP "./$@"
>  }
> =20
> +run_local_test () {
> +    printf "$*:	"
> +    base_run_test "$@"
> +}
> +
>  run_sh_test () {
>      printf "$*:	"
>      base_run_test sh "$@"
> @@ -110,6 +115,20 @@ run_wrap_error_test () {
>      base_run_test wrap_error "$@"
>  }
> =20
> +# $1: dtb file
> +# $2: align base
> +align_test () {
> +    local size=3D`stat -c %s $1`
> +    local mod=3D$(($size%$2))
> +    (
> +	if [ $mod -eq 0 ] ;then
> +	    PASS
> +	else
> +	    FAIL
> +	fi
> +    )
> +}
> +
>  run_dtc_test () {
>      printf "dtc $*:	"
>      base_run_test wrap_test $VALGRIND $DTC "$@"
> @@ -500,6 +519,15 @@ dtc_tests () {
>  	-o search_paths_b.dtb search_paths_b.dts
>      run_dtc_test -I dts -O dtb -o search_paths_subdir.dtb \
>  	search_dir_b/search_paths_subdir.dts
> +
> +    # Check -a option
> +    local alignbase=3D64
> +    # -p -a
> +    run_dtc_test -O dtb -p 1000 -a $alignbase -o align0.dtb subnode_iter=
ate.dts
> +    run_local_test align_test align0.dtb alignbase
> +    # -S -a
> +    run_dtc_test -O dtb -S 1999 -a $alignbase -o align1.dtb subnode_iter=
ate.dts
> +    run_local_test align_test align1.dtb alignbase
>  }
> =20
>  cmp_tests () {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX42FnAAoJEGw4ysog2bOSBloQAKmxVw4U+t4iVwC9isYgB4CO
EvqLBgavd1GzyENFVWa5hN6KFR4KEtevW2LjP3wZxEVpTYGgXLFoNWpTQaV+R7RA
8o6fdo7KCfPkbpCYoJcYHjgigsCve6Eav5tTq0EW2i1KUOoWbTWnEzQJsobSSAcV
FMLeTO4ILPcwWbMbzd1CfhjrnqDHWlQf4Dp2Dsn892nxPAGI61b4DVSLF0rTpfu/
0E/BUv8ulYZnWs7TPxEzQWERdsaxCkeq1NUTiWYxsKoCR38Rh/Kh6KetD9Degd/V
ARhZr5oNfvUi+5h1N57DH8tEbmP+5aYKI/S+Y2oe8CFSGn981V3JDxtRX6/0fdpy
wZOAFcn1+j7rJ+qyOdrP/Qm/hxn/VDTp5jSkR2ait+PWHgUyT/qFucATi7kZBPTG
6glsgX/K9WvtzjVVJ0PFM2GZb+IRgANqt18rmwQhvKZJQmXSm8HfYTxUSmmLaUfU
fWxJ/g/tYlAjJdUZ+wLUzex6a2ydKH0JjEDRHUlKOEGlQhv33av+PIYNE+Dk464A
GR7hGQwvRVojNamhwEDDWtMsTUtTBhttlLuJ2DJ8CrVF8aNTjh+WwiqzFXMMJcJX
WvZE7YOQkmd2jU2DpaSDxzk5oxgiG+gbOC7CuYgDO4zhr278z9/+AHWmlFn8BHOf
+sR4vtQp/do6YNSvykKj
=qgYa
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
