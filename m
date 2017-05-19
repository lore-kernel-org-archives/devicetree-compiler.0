From: "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] Makefile: Fix build on MSYS2 and Cygwin
Date: Fri, 19 May 2017 16:17:22 +1000
Message-ID: <20170519061722.GH12284@umbus.fritz.box>
References: <cd57ad6bd43f413eafdef078cc895432@nordicsemi.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3ecMC0kzqsE2ddMN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1495174846;
        bh=J1u7VN+5fVhpOT0tRTSLWM6ZCCpCFMWGr30b+b6B8zs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A6EU4pqTHrYpQjacCICxfdvUYco1RWXBEsl2KSFs/TbimnisoiJ3O00l898MTjUwR
         +TUilNn1/GeIsBRAnlWwzN9GflJ13oIX/AC6oiX9XnXkk45+CTyuVywcfw03Is0vVE
         oYlqZrt4S1Q7XMtnNZNWCn+gckj6+fYT7WInveOo=
Content-Disposition: inline
In-Reply-To: <cd57ad6bd43f413eafdef078cc895432-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: "Cufi, Carles" <Carles.Cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
Cc: "devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


--3ecMC0kzqsE2ddMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2017 at 08:30:45AM +0000, Cufi, Carles wrote:
> The host compiler on MSYS2 and Cygwin does not allow the -fPIC option,
> issuing a warning that is treated as an error and stops the build.
> Detect whether we're running under MSYS2 or Cygwin and avoid adding
> -fPIC to prevent the error from happening.
>=20
> Signed-off-by: Carles Cufi <carles.cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>

Thanks for reworking, but this is still really more convoluted than I
had in mind.  I've just applied a preliminary cleanup patch to my git
tree, re-organizing the variables with both the compile time and link
time shared library options.

I'm hoping on top of that what I want will be more obvious - you
should be able to just add a single ifeq stanza alongside the existing
one for darwin.

> ---
>  Makefile | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index beca4a0..7ac343d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =3D
>  CPPFLAGS =3D -I libfdt -I .
>  WARNINGS =3D -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
>  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
> -CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS)
> +CFLAGS =3D -g -Os -Werror $(WARNINGS)
> =20
>  BISON =3D bison
>  LEX =3D flex
> @@ -33,14 +33,19 @@ LIBDIR =3D $(PREFIX)/lib
>  INCLUDEDIR =3D $(PREFIX)/include
> =20
>  HOSTOS :=3D $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
> -	    sed -e 's/\(cygwin\).*/cygwin/')
> +		sed -e 's/\(cygwin\|msys\).*/\1/')
> +
> +ifneq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin))
> +COMPILE_OPTIONS +=3D -fPIC
> +SHAREDLIB_LINK_OPTIONS +=3D -fPIC
> +endif
> =20
>  ifeq ($(HOSTOS),darwin)
>  SHAREDLIB_EXT=3Ddylib
> -SHAREDLIB_LINK_OPTIONS=3D-dynamiclib -Wl,-install_name -Wl,
> +SHAREDLIB_LINK_OPTIONS +=3D-dynamiclib -Wl,-install_name -Wl,
>  else
>  SHAREDLIB_EXT=3Dso
> -SHAREDLIB_LINK_OPTIONS=3D-shared -Wl,--version-script=3D$(LIBFDT_version=
) -Wl,-soname,
> +SHAREDLIB_LINK_OPTIONS +=3D-shared -Wl,--version-script=3D$(LIBFDT_versi=
on) -Wl,-soname,
>  endif
> =20
>  #
> @@ -302,7 +307,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
> =20
>  %.o: %.c
>  	@$(VECHO) CC $@
> -	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<
> +	$(CC) $(CPPFLAGS) $(CFLAGS) $(COMPILE_OPTIONS) -o $@ -c $<
> =20
>  %.o: %.S
>  	@$(VECHO) AS $@
> @@ -322,7 +327,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
> =20
>  %.s:	%.c
>  	@$(VECHO) CC -S $@
> -	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -S $<
> +	$(CC) $(CPPFLAGS) $(CFLAGS) $(COMPILE_OPTIONS) -o $@ -S $<
> =20
>  %.a:
>  	@$(VECHO) AR $@
> @@ -330,7 +335,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
> =20
>  $(LIBFDT_lib):
>  	@$(VECHO) LD $@
> -	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_soname) -o $(L=
IBFDT_lib) $^
> +	$(CC) $(LDFLAGS) $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_soname) -o $(LIBFDT_=
lib) $^
> =20
>  %.lex.c: %.l
>  	@$(VECHO) LEX $@

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3ecMC0kzqsE2ddMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZHo3vAAoJEGw4ysog2bOSIMgP/iL+PiYlEsRXNEkQOhTnS8j5
FDoWA2voafGoO0AwEScNlFYpVRY4sOFoHsgjDizjI69zbEmJUDFgt/SJjHZGxIrc
Jl4V7LzVIxdLM57DtP+Eyf22OwZMincuIqrl0GWiA9waUUnGD6jug4Jzmg9Ac+Pn
pAHCNfvxGjE5Yj5LhJQfy2uPbK7W+H8aBRAMjkrZS+9Ux9zfQWGKSzfZkcvgpHvg
gnS0agDMLpZKpOBoNklz6ohoYNRb9KPq9hUBXlLwSgTwvKWvNxNI0aP8GPrm1XwR
uctMjRNImv12fKe4tPKLrLLkvO/NTdBlv7nIpp6EhpGlKxTGTlqR5nd1OXZh/fqU
nRgXJROSxT/CLA3MR410iMvEOU5qk3dP6FCGsAKgeP5c85Zwy144PpPTa93W4dpf
eoFB0ISvw50p49u9XXglHe1AZXPekCl3nRBoBsEdDz1L8eqfZtnqGlnsbCiI4MoG
Miy7SZzgWFlLpyIiBv8FIxIf7TPqLCfxmEU4CcBMus0rWpfCiJWFS+tjGXj9GV8c
uhhIEQX+ysUUzbSuQOHk7iLFtqc4ilfINY3UPpcNKWzcLeJFA/3DbPPxoHKGNw84
xT2o+rYSfVy8oEhq3cGqE/5q0YB7yCaLkvtSec+gnJYSFABkMBFNqyZx4Ye4FUPr
qTxsD9jlmZgpKoaHA5AF
=5rXx
-----END PGP SIGNATURE-----

--3ecMC0kzqsE2ddMN--
