From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] guess input file format based on file content or
 file name
Date: Tue, 30 Jun 2015 15:07:49 +1000
Message-ID: <20150630050749.GJ26353@voom.redhat.com>
References: <1432595483-26153-1-git-send-email-osp@andrep.de>
 <1432595483-26153-2-git-send-email-osp@andrep.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OX7PPUk8qMPP4++R"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432595483-26153-2-git-send-email-osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--OX7PPUk8qMPP4++R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2015 at 12:11:21AM +0100, Andre Przywara wrote:
> Always being required to specify the input file format can be quite
> annoying, especially since a dtb is easily detected by its magic.
> Also a dts can be guessed mostly by starting with a '/' character.
> Looking at the file name extension also sounds useful as a hint.
>=20
> Add heuristic file type guessing of the input file format in case
> none has been specified on the command line.
> The heuristics are as follows (in that order):
> - Any issues with opening as a regular file lead to file name based
> guessing: if the filename ends with .dts or .DTS, device tree source
> text is assumed, .dtb or .DTB hint at a device tree blob.
> - A directory will be treated as the /proc/device-tree type.
> - If the first 4 bytes are the DTB magic, assume "dtb".
> - If the first character is a '/', assume "dts".
>=20
> For the majority of practical use cases this gets rid of the tedious
> -I specification on the command line and simplifies actual typing of
> dtc command lines.
> Any explicit specification of the input type by using -I still avoids
> any guessing, which resembles the current behaviour.
>=20
> Signed-off-by: Andre Przywara <osp-s5aTT1PPrfyzQB+pC5nmwQ@public.gmane.org>

Sorry I've taken so long to reply to this.

Making decisions based on file extension makes be a little
uncomfortable so it's taken me a while to convince myself about this.
On balance, I think it's ok (since it can always be overridden).

However, there's a few details I'd like to see changed before
applying.


> ---
>  dtc.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index 8c4add6..cda563d 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -18,6 +18,8 @@
>   *                                                                   USA
>   */
> =20
> +#include <sys/stat.h>
> +
>  #include "dtc.h"
>  #include "srcpos.h"
> =20
> @@ -104,10 +106,58 @@ static const char * const usage_opts_help[] =3D {
>  	NULL,
>  };
> =20
> +static const char *guess_type_by_name(const char *fname, const char *fal=
lback)
> +{
> +	const char *s;
> +
> +	s =3D strrchr(fname, '.');
> +	if (s =3D=3D NULL)
> +		return fallback;
> +	if (!strcmp(s, ".dts") || !strcmp(s, ".DTS"))
> +		return "dts";

Please use strcasecmp() instead of explicitly checking "dts" and
"DTS".  On a case-insensitive system, it's not implausible that you
could end up with ".Dts" or something.

> +	if (!strcmp(s, ".dtb") || !strcmp(s, ".DTB"))
> +		return "dtb";
> +	return fallback;
> +}
> +
> +static const char *guess_input_format(const char *fname, const char *fal=
lback)
> +{
> +	struct stat statbuf;
> +	uint32_t magic;
> +	FILE *f;
> +
> +	if (stat(fname, &statbuf))
> +		return guess_type_by_name(fname, fallback);

First, please use an explicit !=3D 0 here - it took me several reads
before I realised this was checking for a stat() failure.

I'd prefer not to guess if stat() fails - something is weird is going
on and I think it's better to force the user to specify explicitly in
this case.  The most likely case is that the user has specified the
wrong file name entirely here, so guessing by name isn't particularly
helpful.

> +	if (S_ISDIR(statbuf.st_mode))
> +		return "fs";
> +	if (!S_ISREG(statbuf.st_mode))
> +		return guess_type_by_name(fname, fallback);

Again, a non-regular file is a weird case, where I think we're better
off not guessing at all.

> +	f =3D fopen(fname, "r");
> +	if (f =3D=3D NULL)
> +		return guess_type_by_name(fname, fallback);
> +	if (fread(&magic, 4, 1, f) !=3D 1) {
> +		fclose(f);
> +		return guess_type_by_name(fname, fallback);
> +	}
> +	fclose(f);
> +
> +	magic =3D fdt32_to_cpu(magic);
> +	if (magic =3D=3D FDT_MAGIC)
> +		return "dtb";
> +
> +	if (magic >> 24 =3D=3D '/')
> +		return "dts";

This test is right in practice (because FDT is big-endian) but
misleading.  Since the relevant point is that the / is the very first
character - it's not a numerical value - check that directly rather
than looking at a possible byteswapped value.

Although.. this test is very weak anyway - a dts file could very
likely have whitespace or comments before the /dts-v1/ tag anyway.  I
don't think it's worth the bother.

> +
> +	return guess_type_by_name(fname, fallback);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	struct boot_info *bi;
> -	const char *inform =3D "dts";
> +	const char *inform =3D NULL;
>  	const char *outform =3D "dts";
>  	const char *outname =3D "-";
>  	const char *depname =3D NULL;
> @@ -213,6 +263,8 @@ int main(int argc, char *argv[])
>  		fprintf(depfile, "%s:", outname);
>  	}
> =20
> +	if (inform =3D=3D NULL)
> +		inform =3D guess_input_format(arg, "dts");
>  	if (streq(inform, "dts"))
>  		bi =3D dt_from_source(arg);
>  	else if (streq(inform, "fs"))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OX7PPUk8qMPP4++R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVkiQkAAoJEGw4ysog2bOSppYQANRky6Lh2aL9lJeeAnnY4oMD
ak5j4qH7EhE1Ukg+sTAm34Wr14NBaBVzvbdWRasxTWwkfaJHhG9LC/OgFp8aTutw
CNLScjxd/qBm1VlrLPTd2AkfPHayIfqTjQ0b/XSj56pXYIA57vieNFsBSzIQb6Su
D05AZ3heMCx+Dw0AY3FU3OsX8aYBQofCy91LmD3VajQzSlYt60DGInBt7RhrryrF
+tzIeOhF7nNGpmxcDmwgCXVL5OfYmXWllw5tzoRqenvjU/nn76WwQ0+78QS7F37g
niIPZeX25QAO0iDARRLS9FfidRimWZC6TJUIWytDYhW+QyWW7y8SA/ywl12oQcG8
pyBIHZhMQKUc7TA04/063QOPmkCtpGuEulQM/TmYDJmFXwaaPuK4+SOOSI0QQe+G
9y2uwqD7t62IaYqKuON3jqQBIwPDu7I9o07hm2FOix+l1uG+b9gswjjXVoyV3mA9
h6BZhCMh8SAcs17E4wVxjKVJfR6haEzkgqrUE4HWKbzBxIHbpcgZV8LqHeBcioOf
LZCeh+YNDHXd8moV2addbsI9SV/00bYQxh3bglLKb4EIdjDGwGpxsVNWYjNvZxTz
VyX/jSAV853vESS5+lqvX4JYB2cHIHLHTukecfyGmOejLk5jWcfbBXnW0r81Qcts
jS1SE02x7f9ad5ihBpXf
=9Fqn
-----END PGP SIGNATURE-----

--OX7PPUk8qMPP4++R--
