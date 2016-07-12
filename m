From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5] Implement the -a option to pad dtb aligned
Date: Tue, 12 Jul 2016 21:00:08 +1000
Message-ID: <20160712110008.GA16355@voom.fritz.box>
References: <1467886028-7233-1-git-send-email-timwang@asrmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVmWh8UkjoBIyGkN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468321134;
	bh=Bo0VJFaozIB2HmM9LJW4mOZm6SkyUhbBHU1lu96IbeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJI7ie75dj4l0yuvgb6QbhIZgXAaDQk1jcO4L9u0nh5tWQBn3qMoPOlhcU3IBTBh8
	 oRXjf/33Psmqpx7SMrircnp293HsH/Te+jSNyr3FXWq/U05bKvXqD49IZ/7Tvj56PO
	 T0NZP9pARWCr1SN/gDtstaEhJsfVt5YaYlmEpsMQ=
Content-Disposition: inline
In-Reply-To: <1467886028-7233-1-git-send-email-timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wtt_usst-9Onoh4P/yGk@public.gmane.org


--EVmWh8UkjoBIyGkN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2016 at 06:07:08PM +0800, Tim Wang wrote:
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

Alright.  The code looks good now.  But.. it needs some testcases.

> ---
>  dtc.c      | 17 ++++++++++++++++-
>  dtc.h      |  1 +
>  flattree.c | 17 +++++++++++++----
>  3 files changed, 30 insertions(+), 5 deletions(-)
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
> index ec14954..01052c2 100644
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EVmWh8UkjoBIyGkN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhM24AAoJEGw4ysog2bOS/Y0P+QH0KHMSGivu4leHC01G6mq2
MI8CCJOld1oVw9AmnEQ36FvyYJlDYnYxo/EzmHz1h+h0/4Gc2gslGdZDSxYxsnyZ
CVkARnITGMg5lZMHxVgR1rU4r1HDqIXXi8Ab+hE5Wh15/GM2QpAr7WguoKZNCDjq
hywdx4Xy85OGP1kz+F4KdsnBsE7n9ylXw7NhgXbFzRKZALpO2x9mnITBDtzJr0eV
9jmJGYMHNhADWWLMcHwhPYsKcIociUiBqYPITwc1Pf020/YztGFO57RrVplwYQUj
VU3Gwm3S9N6VLhANF6X5WEAXIaSQk9rzNvXxT+GCMIkY5O/cuBzdRpfx+w8FgsYv
vSUnGIHBy3wnUrsGFhNNoz2kEUJukTSZp9Z2wl6YArsfjxNGAgz36XUg58ydqWFh
O5gVS1fr3fKA1JM0o5i6zeR+3gtTz6zZ6dSq+pNBJRNJD+OmrlRhOJlSaS9q4Ydw
KYjVUq0et5C8r581Wqfd68WFmnsXIIyLMt53sansU0sCUbkaN1i1VguQjLN86CCg
hgr2gvXS9oSJqm1CSE5YM+jIz4S5f1KacNVUVJQ51iQihZbyQsbluyZPT4p1ycg3
5iRV5e71OgFWqNkBVEo5vQp8lRdewzpOQpMsVDazPxCNdOdaki9llTCKceuec6C9
F+LzelN3LcVHClfN6pml
=svJf
-----END PGP SIGNATURE-----

--EVmWh8UkjoBIyGkN--
