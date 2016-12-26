From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/1] fdtdump.c: provide colored output
Date: Tue, 27 Dec 2016 09:53:30 +1100
Message-ID: <20161226225330.GD25998@umbus>
References: <20161221215431.16862-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1482798003;
        bh=/lA65/EOqAYby+j+/k4+9UgD3lW760KkGrTEfvcJtSs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YDniz+yW3a5wPkms29sRy1U7wu5JdLL/SRPwDCT+I2PUeqbFqR/jcEsYuJ2Prssno
         rs1ZeS4Z1SA02KZyPlYM2lVmKid+n5hz4nk0LgWlIAU7e6SJ/8FaHJNRbyUJK+eQNe
         VnGkVDfqxDiptrfGqWnjZpY/1U5bNBAWHPoYSZ6M=
Content-Disposition: inline
In-Reply-To: <20161221215431.16862-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2016 at 10:54:31PM +0100, Heinrich Schuchardt wrote:
> A new command line option is added
>   -c, --color <arg> Colorize, argument can be auto, never or always
> which defaults to auto.
>=20
> For colored output in pipes use 'always', e.g.
>   fdtdump -c always file.dtb | less -R
>=20
> If you don't like colors use
> alias fdtdump=3D"fdtdump -c none"
>=20
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

Hmm.  So, as I said, I really see fdtdump as a minimal hack.  For real
life use I recommend dtc -I dtb -O dts instead.  So, I'm not thrilled
about adding a feature like this to fdtdump but not to dtc's dts
output.

> ---
>  Makefile  |  2 +-
>  fdtdump.c | 37 +++++++++++++++++++++++++++++++++----
>  util.c    | 12 +++++++-----
>  util.h    |  8 ++++++++
>  4 files changed, 49 insertions(+), 10 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 32dcfcf..ee543b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =3D
>  CPPFLAGS =3D -I libfdt -I .
>  WARNINGS =3D -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
>  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
> -CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS)
> +CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS) -lncurses
> =20
>  BISON =3D bison
>  LEX =3D flex
> diff --git a/fdtdump.c b/fdtdump.c
> index 717fef5..59194cd 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -2,6 +2,9 @@
>   * fdtdump.c - Contributed by Pantelis Antoniou <pantelis.antoniou AT gm=
ail.com>
>   */
> =20
> +#include <unistd.h>
> +#include <curses.h>
> +#include <term.h>
>  #include <stdbool.h>
>  #include <stdint.h>
>  #include <stdio.h>
> @@ -63,7 +66,7 @@ static void dump_blob(void *blob, bool debug)
>  	depth =3D 0;
>  	shift =3D 4;
> =20
> -	printf("/dts-v1/;\n");
> +	printf("%s/dts-v1/;\n", COLNONE);
>  	printf("// magic:\t\t0x%x\n", fdt32_to_cpu(bph->magic));
>  	printf("// totalsize:\t\t0x%x (%d)\n", totalsize, totalsize);
>  	printf("// off_dt_struct:\t0x%x\n", off_dt);
> @@ -104,10 +107,11 @@ static void dump_blob(void *blob, bool debug)
>  			s =3D p;
>  			p =3D PALIGN(p + strlen(s) + 1, 4);
> =20
> +			printf("%s", COLNODE);
>  			if (*s =3D=3D '\0')
>  				s =3D "/";
> =20
> -			printf("%*s%s {\n", depth * shift, "", s);
> +			printf("%*s%s%s {\n", depth * shift, "", s, COLNONE);
> =20
>  			depth++;
>  			continue;
> @@ -139,7 +143,7 @@ static void dump_blob(void *blob, bool debug)
> =20
>  		dumpf("%04zx: string: %s\n", (uintptr_t)s - blob_off, s);
>  		dumpf("%04zx: value\n", (uintptr_t)t - blob_off);
> -		printf("%*s%s", depth * shift, "", s);
> +		printf("%*s%s%s%s", depth * shift, "", COLPROP, s, COLNONE);
>  		utilfdt_print_data(t, sz);
>  		printf(";\n");
>  	}
> @@ -147,18 +151,33 @@ static void dump_blob(void *blob, bool debug)
> =20
>  /* Usage related data. */
>  static const char usage_synopsis[] =3D "fdtdump [options] <file>";
> -static const char usage_short_opts[] =3D "ds" USAGE_COMMON_SHORT_OPTS;
> +static const char usage_short_opts[] =3D "c:ds" USAGE_COMMON_SHORT_OPTS;
>  static struct option const usage_long_opts[] =3D {
> +	{"color",            a_argument, NULL, 'c'},
>  	{"debug",            no_argument, NULL, 'd'},
>  	{"scan",             no_argument, NULL, 's'},
>  	USAGE_COMMON_LONG_OPTS
>  };
>  static const char * const usage_opts_help[] =3D {
> +	"Colorize, argument can be auto, never or always",
>  	"Dump debug information while decoding the file",
>  	"Scan for an embedded fdt in file",
>  	USAGE_COMMON_OPTS_HELP
>  };
> =20
> +static void check_colored(void) {
> +	int ret;
> +
> +	colored =3D 0;
> +	if (isatty(STDOUT_FILENO) !=3D 1)
> +		return;
> +	if (setupterm(NULL, STDOUT_FILENO, &ret) !=3D OK || ret !=3D 1)
> +		return;
> +	if (2 > tigetnum("colors"))
> +		return;
> +	colored =3D 1;
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	int opt;
> @@ -168,10 +187,20 @@ int main(int argc, char *argv[])
>  	bool scan =3D false;
>  	off_t len;
> =20
> +	check_colored();
> +
>  	while ((opt =3D util_getopt_long()) !=3D EOF) {
>  		switch (opt) {
>  		case_USAGE_COMMON_FLAGS
> =20
> +		case 'c':
> +			if (!strcmp("none", optarg))
> +				colored =3D 0;
> +			else if (!strcmp("always", optarg))
> +				colored =3D 1;
> +			else if (strcmp("auto", optarg))
> +				usage("invalid argument for colored");
> +			break;
>  		case 'd':
>  			debug =3D true;
>  			break;
> diff --git a/util.c b/util.c
> index 3550f86..29fd6ad 100644
> --- a/util.c
> +++ b/util.c
> @@ -36,6 +36,8 @@
>  #include "util.h"
>  #include "version_gen.h"
> =20
> +int colored =3D 0;
> +
>  char *xstrdup(const char *s)
>  {
>  	int len =3D strlen(s) + 1;
> @@ -389,7 +391,7 @@ void utilfdt_print_data(const char *data, int len)
> =20
>  		s =3D data;
>  		do {
> -			printf("\"%s\"", s);
> +			printf("\"%s%s%s\"", COLSTRG, s, COLNONE);
>  			s +=3D strlen(s) + 1;
>  			if (s < data + len)
>  				printf(", ");
> @@ -398,17 +400,17 @@ void utilfdt_print_data(const char *data, int len)
>  	} else if ((len % 4) =3D=3D 0) {
>  		const uint32_t *cell =3D (const uint32_t *)data;
> =20
> -		printf(" =3D <");
> +		printf(" =3D <%s", COLNUMB);
>  		for (i =3D 0, len /=3D 4; i < len; i++)
>  			printf("0x%08x%s", fdt32_to_cpu(cell[i]),
>  			       i < (len - 1) ? " " : "");
> -		printf(">");
> +		printf("%s>", COLNONE);
>  	} else {
>  		const unsigned char *p =3D (const unsigned char *)data;
> -		printf(" =3D [");
> +		printf(" =3D [%s", COLBYTE);
>  		for (i =3D 0; i < len; i++)
>  			printf("%02x%s", *p++, i < len - 1 ? " " : "");
> -		printf("]");
> +		printf("%s]", COLNONE);
>  	}
>  }
> =20
> diff --git a/util.h b/util.h
> index f5c4f1b..b814872 100644
> --- a/util.h
> +++ b/util.h
> @@ -25,6 +25,14 @@
>   *                                                                   USA
>   */
> =20
> +extern int colored;
> +#define COLNODE (colored ? "\x1b[35m" : "") /* magenta */
> +#define COLPROP (colored ? "\x1b[32m" : "") /* green */
> +#define COLSTRG (colored ? "\x1b[33m" : "") /* yellow */
> +#define COLNUMB (colored ? "\x1b[34m" : "") /* blue */
> +#define COLBYTE (colored ? "\x1b[36m" : "") /* cyan */
> +#define COLNONE (colored ? "\x1b[0m" : "")  /* default */

Um.. this looks absolutely wrong.  You've gone to the trouble of
including the ncurses library, but you're basically not using it
except for the inital on/off check.  Here you've used fixed explicit
escape codes, which will only be correct for one terminal type -
terminfo and ncurses basically exist for abstracting this sort of thing.

>  #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> =20
>  static inline void __attribute__((noreturn)) die(const char *str, ...)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYYZ9pAAoJEGw4ysog2bOSR10P/2wvL5s1HYj++dRFBu22G9A1
gRzHNkm7Byh8KlYKJSH6+VyCc1E4KDwQ1vYtdEsQyZD5DR4BmlTqH9zuRExv7I48
jfslEmQt9cFm7bqXjXDadwc/ZWvqYMvbEt+6NpYy29c5dXb/pWEo7yjOvlYRNv6r
FFTGLoGsxxIxONJOra8kqE+x3CNRMCgTdb2P6rj2mFhsRIa2SYxr0COSjMPeAEDI
Xn5+zq5+bjfp8vhUdZzNkUuGaOKmsoazeipRZ8Hb5TMuDhVNsI/EvoYcAFvI2ROk
4+BgQXEukI+aZDiXbuQ4XMV1MYpb4eITyR+ARr1XPLwHle0LjyL84wy6FPLQTElK
cXoosqQRiIt0J7Gu0Drr+3HK+eS3l/iGCHYX7bXOUcQUt1Tztg0qX66ZgajLOVks
jZZUTaKI3W2nVt0HE+eQdUYUlLDOzbfyxFNq9Mn54swWT+gClPBtwtVWQNMoEgLP
IbqfHOPewJK+x8DGqx2Dc+bw1R0UH78lPzUU36SzPskCptrJjk8fMrUB/xOE0HGb
sFSguRVXPOrUXTz9ypnK3uEP+rHbSENeYvByrkqp0Y3kf1vcafy6pSXug8NFEkgV
3Es5S5SlsOjrpiz6bxzT28sYm0L1eSRznOiiMQ9zXjZYxELD8nRToh8cRpq+gy91
MtDA/piBhoVWaQu9cEgy
=qSOG
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
