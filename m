From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Implement the -a option to pad dtb aligned
Date: Mon, 27 Jun 2016 15:45:07 +1000
Message-ID: <20160627054507.GO4242@voom.fritz.box>
References: <1466800337-1729-1-git-send-email-timwang@asrmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XVTPT6MZt3zd/C+/"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467006205;
	bh=+wtfRtEUcbsqF/psqH0s/ctlPh2d72HOjKkM/S/+T9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=klIzL3Tjrz2gb69TxvPYh9v9O21lYFhrSn31+C3Z8OusZ8CK5mOVSbbgjXlwRHT7R
	 uQ9OedGD9FgPqUy4CFiDDYpKD4DdXt6E65AYpohB78Yh+D1/uyKT7vKUlRmAo/vxsl
	 E9uXcM+3lGLseaTLEuXcgFQsvqj4rWxG2sfEmvrk=
Content-Disposition: inline
In-Reply-To: <1466800337-1729-1-git-send-email-timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wtt_usst-9Onoh4P/yGk@public.gmane.org


--XVTPT6MZt3zd/C+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 25, 2016 at 04:32:17AM +0800, Tim Wang wrote:
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

I'm a little dubious about how widely useful this is, but I'd consider
applying something to this effect.

However, this implementation is incorrect on multiple counts.

> ---
>  dtc.c      |  9 ++++++++-
>  dtc.h      |  1 +
>  flattree.c | 10 ++++++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
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
> index ec14954..733e32e 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -413,6 +413,13 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int v=
ersion)
>  		fdt.totalsize =3D cpu_to_fdt32(tsize);
>  	}
> =20
> +	if (align_size > 0) {
> +		int tsize =3D fdt32_to_cpu(fdt.totalsize);
> +		padlen +=3D (align_size - tsize % align_size);
> +		tsize +=3D padlen;
> +		fdt.totalsize =3D cpu_to_fdt32(tsize);
> +	}

This occurs after totalsize has already been adjusted for the -p
option.  So, if -p and -a are both specified, this will apply the -p
padding twice.  Further if the -p value itself isn't aligned, neither
will the final blob be.

Instead you want to adjust padlen for the alignment size *before*
altering fdt.totalsize.

> +
>  	/*
>  	 * Assemble the blob: start with the header, add with alignment
>  	 * the reserve buffer, add the reserve map terminating zeroes,
> @@ -572,6 +579,9 @@ void dt_to_asm(FILE *f, struct boot_info *bi, int ver=
sion)
>  	if (padsize > 0) {
>  		fprintf(f, "\t.space\t%d, 0\n", padsize);
>  	}
> +	if (align_size > 0) {
> +		fprintf(f, "\t.space\t%d, 0\n", align_size);
> +	}

This is also just plain wrong.  This will simply add align_size bytes
of extra padding, rather than aligning the final result.

You either want to adjust padsize to be aligned before emiting the
=2Espace padsize directive, or you want to use a .align directive
instead.

This patch should also add one or more testcases, which might have
caught the errors above.

>  	emit_label(f, symprefix, "blob_abs_end");
> =20
>  	data_free(strbuf);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XVTPT6MZt3zd/C+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcL1iAAoJEGw4ysog2bOSTekP/jG0bzrnGGJtbgxZabNL+uP9
JNqPc2v+8nTE1Wfq3vVQNSoCCwpxmZjGk1s7kB1N/g+azw6vb8hdgcb6ndOkBam2
4pmXh/bbnl73UyUBDNInroFcctzMRLWqwtltM+PfwnMH+AnBzm8vO4O1AVak89aO
4TlZkRQJU4xr1lWaHyKBkrc7vbaGl74tggQ2Lm51Z12FzBsFyzRq2IyG+qsAFkoe
KBNmQP8vIUtA5ZKBM/em3fvKcEpNWXCJbXCSpYQfi3tTjkNNY6xoZ37QAtlhoJsM
Cj/dmmCpQ0BKMSaprFleR11Og+1jVW0uBTBTubZg72ULDZkTRYJUfYfmWtLcO0TE
8ji1QhvTja2SYpE7wYZbMoRvdOMzI3CoSZ/gjeA60ia2gNXC0C+f7NenGycwmQJ9
ikzGlO6xX6Tqw/3P7rHUbgQfokgqpGQpLm+DEifEgfIKzrGaYvqo/WVImoZCE/WV
W2lG/0v6N0NBXi0yz/M9PN30Rz5S17cU84PmJR9Y9utnahCRPNcGFs2hn7V4hM6g
QrkQEkfJU+VYAuFXcW1Pg04hS5/u6AcU3ftNdv8RpNzLG5qtflY4JpmYMVMVb3tA
z2SMDUAQzdUshE+ixmY/Kcf13YgIkz0b0hn9Q3HVT1UqdKhIfQfUhDSSBNktv2nt
XELFZKa8b7ql1mRrQiuc
=ke1U
-----END PGP SIGNATURE-----

--XVTPT6MZt3zd/C+/--
