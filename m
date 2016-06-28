From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Implement the -a option to pad dtb aligned
Date: Tue, 28 Jun 2016 15:28:56 +1000
Message-ID: <20160628052855.GB4242@voom.fritz.box>
References: <1466800337-1729-1-git-send-email-timwang@asrmicro.com>
 <20160627054507.GO4242@voom.fritz.box>
 <7bbb538e64e740cdbb97e21c1ff0522b@mail2012.asrmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kf9dPzkPP9+q7vtQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467092648;
	bh=seN41L/dP7v+OvXpZwAgBRi+8XgvjvyAla0v0PHc/to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpPbvv4ZatmLzqvMH3tkM6iGCYI02rO+1jsir5S+E2dYvriIQbn36l1Wl7qzUQJYV
	 ho2ITR2buKzTT8etSjQf/oWkOzoYoxucQyPKtuK0mCdZHNQCNBmiFMZmN2Id4Plo8Y
	 F31GAvQjo/SmhEH3kC+tY1Ri3h2PbvVJPKFWrIwE=
Content-Disposition: inline
In-Reply-To: <7bbb538e64e740cdbb97e21c1ff0522b-w/Y+SVW4SlHx9BLjpE4ezaBKnGwkPULj@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Wang =?utf-8?B?VGlt77yI546L6ImH6ImH77yJ?= <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "wtt_usst-9Onoh4P/yGk@public.gmane.org" <wtt_usst-9Onoh4P/yGk@public.gmane.org>


--Kf9dPzkPP9+q7vtQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 08:49:37AM +0000, Wang Tim=EF=BC=88=E7=8E=8B=E8=89=
=87=E8=89=87=EF=BC=89 wrote:
> Hi David,
> (Seems my pervious mail rejected by vger.kernel.org).
>=20
> Thanks for your kindly review!
> About the usage of this patch, as I know,
> some android phone and google TV soc vendors or production vendors
> need such option to cat all dtb files to support several products.
> Such as one soc vendor support two customers products. And each of
> them use different screen panel and camera sensor. But most other periphe=
rals
> are same as the common board.
> We can use one kernel Image and several dtb files to support both of them.

Right, I see why you need the alignment in the output.  But it's
pretty easy to introduce this as you produce the archive, without
folding it into dtc.

For example:
	$ dd if=3D1.dtb bs=3D8 conv=3Dsync of=3Ddtbset
	$ dd if=3D2.dtb bs=3D8 conv=3Dsync,notrunc oflag=3Dappend of=3Ddtbset
	$ dd if=3D3.dtb bs=3D8 conv=3Dsync,notrunc oflag=3Dappend of=3Ddtbset
		.
		.
		.

Will create dtbset with all the dtbs aligned to 8 byte boundaries.

> The calculate method of -a option after -p/-S is totally wrong.
> I've fix it in attached patch file, please help to review again.
>=20
> But I'm not sure whether my dt_to_asm part change is right.
> Please show me more details if my patch is wrong again.
>=20
> Here is the updated patch=EF=BC=9A
> [PATCH] Implement the -a option to pad dtb aligned
>=20
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
> ---
>  dtc.c      |  9 ++++++++-
>  dtc.h      |  1 +
>  flattree.c | 13 ++++++++++++-
>  3 files changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index 5fa23c4..1749d26 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -30,6 +30,7 @@ int quiet;		/* Level of quietness */
>  int reservenum;		/* Number of memory reservation slots */
>  int minsize;		/* Minimum blob size */
>  int padsize;		/* Additional padding to blob */
> +int align_size;		/* Additional padding to blob accroding to the align si=
ze */
>  int phandle_format =3D PHANDLE_BOTH;	/* Use linux,phandle or phandle pro=
perties */
> =20
>  static void fill_fullpaths(struct node *tree, const char *prefix)
> @@ -53,7 +54,7 @@ static void fill_fullpaths(struct node *tree, const cha=
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
> @@ -64,6 +65,7 @@ static struct option const usage_long_opts[] =3D {
>  	{"reserve",           a_argument, NULL, 'R'},
>  	{"space",             a_argument, NULL, 'S'},
>  	{"pad",               a_argument, NULL, 'p'},
> +	{"align",             a_argument, NULL, 'a'},
>  	{"boot-cpu",          a_argument, NULL, 'b'},
>  	{"force",            no_argument, NULL, 'f'},
>  	{"include",           a_argument, NULL, 'i'},
> @@ -91,6 +93,7 @@ static const char * const usage_opts_help[] =3D {
>  	"\n\tMake space for <number> reserve map entries (for dtb and asm outpu=
t)",
>  	"\n\tMake the blob at least <bytes> long (extra space)",
>  	"\n\tAdd padding to the blob of <bytes> long (extra space)",
> +	"\n\tMake the blob align to the <bytes> (extra space)",
>  	"\n\tSet the physical boot cpu",
>  	"\n\tTry to produce output even if the input tree has errors",
>  	"\n\tAdd a path to search for include files",
> @@ -169,6 +172,7 @@ int main(int argc, char *argv[])
>  	reservenum =3D 0;
>  	minsize    =3D 0;
>  	padsize    =3D 0;
> +	align_size =3D 0;
> =20
>  	while ((opt =3D util_getopt_long()) !=3D EOF) {
>  		switch (opt) {
> @@ -196,6 +200,9 @@ int main(int argc, char *argv[])
>  		case 'p':
>  			padsize =3D strtol(optarg, NULL, 0);
>  			break;
> +		case 'a':
> +			align_size =3D strtol(optarg, NULL, 0);
> +			break;
>  		case 'f':
>  			force =3D true;
>  			break;
> diff --git a/dtc.h b/dtc.h
> index 56212c8..b406d21 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -53,6 +53,7 @@ extern int quiet;		/* Level of quietness */
>  extern int reservenum;		/* Number of memory reservation slots */
>  extern int minsize;		/* Minimum blob size */
>  extern int padsize;		/* Additional padding to blob */
> +extern int align_size;		/* Additional padding to blob accroding to the a=
lign size */
>  extern int phandle_format;	/* Use linux,phandle or phandle properties */
> =20
>  #define PHANDLE_LEGACY	0x1
> diff --git a/flattree.c b/flattree.c
> index ec14954..29f0a54 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -398,10 +398,12 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int =
version)
>  	 */
>  	if (minsize > 0) {
>  		padlen =3D minsize - fdt32_to_cpu(fdt.totalsize);
> -		if ((padlen < 0) && (quiet < 1))
> +		if ((padlen < 0) && (quiet < 1)) {
>  			fprintf(stderr,
>  				"Warning: blob size %d >=3D minimum size %d\n",
>  				fdt32_to_cpu(fdt.totalsize), minsize);
> +			padlen =3D 0;
> +		}
>  	}
> =20
>  	if (padsize > 0)
> @@ -413,6 +415,13 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int v=
ersion)
>  		fdt.totalsize =3D cpu_to_fdt32(tsize);
>  	}
> =20
> +	if (align_size > 0) {
> +		int tsize =3D fdt32_to_cpu(fdt.totalsize);
> +		padlen +=3D ALIGN(tsize, align_size) - tsize;
> +		tsize =3D ALIGN(tsize, align_size);
> +		fdt.totalsize =3D cpu_to_fdt32(tsize);
> +	}
> +

This is still wrong.  The previous if already increased totalsize by
padlen.  Now you've adjusted padlen and added it to totalsize again.

Please, actually test this with both -p and -a options.

>  	/*
>  	 * Assemble the blob: start with the header, add with alignment
>  	 * the reserve buffer, add the reserve map terminating zeroes,
> @@ -478,6 +487,8 @@ void dt_to_asm(FILE *f, struct boot_info *bi, int ver=
sion)
>  	fprintf(f, "/* autogenerated by dtc, do not edit */\n\n");
> =20
>  	emit_label(f, symprefix, "blob_start");
> +	if (align_size > 0)
> +		asm_emit_align(f, align_size);

This is correct, as long as align_size is a power of two - otherwise
it will probably cause an assembler error.

>  	emit_label(f, symprefix, "header");
>  	fprintf(f, "\t/* magic */\n");
>  	asm_emit_cell(f, FDT_MAGIC);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Kf9dPzkPP9+q7vtQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcgsXAAoJEGw4ysog2bOS8sQQAMid0eyXfR5/hLtJsQOD7fEq
yywrW51NSfoixgpbdnXOuB+qbGREsTtsn8GHOov4unLBOAvFIh36SzeE++XccTYt
MZ17euX2BPyI/BPJw+mGGDvO1NZ/iW8bYiyiZfiOPKi5BpH8VqHIuZE2fjMNvHnz
UO9lcURzTmvd8V8i3mZPi1RzBZ3DX1CAFXGizpZmCyTromvcIJ1AGkrisTOnHRPV
obSk/Pqd+bj2Yqm/iTAN5AQrwZsMyH1nvros52+VvfKtAhM+aY6lZOuk+rx90aZ7
ACWcGwZrnzSKeKqwIE1FyL6P+V7U6aNCaDLr2DS/eBsSw16rMIO6gYRWent17zn9
rmTAbeqFgX+m/x9xNW9181T05Lww4yRFhVw4PZY7obvhBX9eiQdD6acesjwtEFH6
T/va0PmMFJ++a0K+WVoz1mzVaXq0yE8IDNDl68YQif4Jhfkm3BXhhbBhKzX3FP2G
WoECyEg96N3nKMoidFXREp2OIS7KuYQkaB39EF8HmZuxfEpwok/pEveVw28dt7dO
icxp/l8vVAkc1ITDpxDLWPxp/Xl8yyhmbPs9TaBkyquFx3n2nveKuIyqvHpwXRwU
47xjxVhIBHcCQOI9nmjlF3074utOzKIstK5D+RLkDOHPglr2KH8aeY0lkRpNlYI5
suli1hevhziVYdCW7UJc
=Ci3C
-----END PGP SIGNATURE-----

--Kf9dPzkPP9+q7vtQ--
