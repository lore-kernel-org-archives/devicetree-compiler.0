From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Makefile: Fix build on MSYS2 and Cygwin
Date: Wed, 10 May 2017 13:32:47 +1000
Message-ID: <20170510033247.GS25748@umbus.fritz.box>
References: <20170428091255.9543-1-carles.cufi@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Vy6UCbb9EK60RK4A"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1494390223;
        bh=rYTGlo/WQwF0T1X30T2bBl/ecLeaQxDOIA3U8DGnHiE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kvW6tLIOorZVLoFvRUnXj5dcLjdWCYJZ8Iu6AEQl3BuZECsWPUX6iWSFNXkI+ptgd
         cWJJaU6vxT65CP7jGZmmH57GLxfwqTnkHI+BssYDcL3twc9v+pQNOzdw4+4FI95RT3
         JqffYcOpHRta/KvhRviQCcOzTWa9YbjssPREls7k=
Content-Disposition: inline
In-Reply-To: <20170428091255.9543-1-carles.cufi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Carles Cufi <carles.cufi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Vy6UCbb9EK60RK4A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2017 at 11:12:55AM +0200, Carles Cufi wrote:
> From: Carles Cufi <carles.cufi-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>
>=20
> The host compiler on MSYS2 and Cygwin does not allow the -fPIC option,
> issuing a warning that is treated as an error and stops the build.
> Detect whether we're running under MSYS2 or Cygwin and avoid adding
> -fPIC to prevent the error from happening.
>=20
> Signed-off-by: Carles Cufi <carles.cufi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Sorry I didn't reply to this sooner.

I approve the goal of fixing compile, but I'm not entirely happy with
the way it's done here.  Rather than altering CFLAGS and LDFLAGS on
the fly for everything else, I'd prefer to add a new intermediate
variable SHAREDLIB_CFLAGS or similar which is set according to HOSTOS<
then included into the standard CFLAGS.  We already have a
SHAREDLIB_LINK_OPTIONS flag that can do this for the link time flags.

> ---
>  Makefile | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index beca4a0..62fb9b8 100644
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
> @@ -33,7 +33,12 @@ LIBDIR =3D $(PREFIX)/lib
>  INCLUDEDIR =3D $(PREFIX)/include
> =20
>  HOSTOS :=3D $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
> -	    sed -e 's/\(cygwin\).*/cygwin/')
> +		sed -e 's/\(cygwin\|msys\).*/\1/')
> +
> +ifneq ($(HOSTOS),$(filter $(HOSTOS),msys cygwin))
> +CFLAGS +=3D -fPIC
> +LDFLAGS +=3D -fPIC
> +endif
> =20
>  ifeq ($(HOSTOS),darwin)
>  SHAREDLIB_EXT=3Ddylib
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

--Vy6UCbb9EK60RK4A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZEoncAAoJEGw4ysog2bOSHUEQAJg7GcrfzCeynIS6LureP3ab
Li/iQUGvDPIXAC/Taw5H1EPgdkmYQMgceDwxurWMG5wugrD92KBoOLgYeWl6lCdv
r6Qq6BhCgWNLaJ7Zm+dWNZit11/UvvOt6DJLgN0xaSD30LKUnI0EaZ0fKCtxnz+C
GzPVaYsyrvM8mdxgF4Sf28oIzVn/paY4fh3TLOoT8cuteBgsHaC2GFNCADRJvdYx
0YLqYH3Kcrbw1ZPHs/4PfCDiURqvmesp8/Z0ETJjnnfL1y5LFbrtNc9qRhXx3u4m
g1QIiih08ksVjGBtAlId/m/Ji+YESh0yW2nnbmX5e9fzVvc2RP03dPo9c97wOk4y
uYapbOat4EN6Z0r3e/BwxTB9Yrv48J2sgO8CDqOQuEUFBeKhOVM8IjbnfytFZf9J
Zs17mGG97Pbikcn3LVUNcxgk06sMZtxCBAtyidOIFAPBE90wpSoYyZb5yexAnsAa
YmzUmi96InDMcDlBjRlF2HDa5Wceqk21ojxK1Cerjen3TvKyCKZTUPdm8V6MWpCR
pGBoCigvaXxBGUvCh6FlX+kJ8P4brttfmVmyhMTJZY7EiXvVj4/J5zCGoVYILeIp
FMHaH8TglpRZPWtb22+goFeyuyV1bpa5Urveewu6hbnyPw0saB0JR1rHJLsYQ37M
xETVDO7y03gOeP/l3YCl
=VfDq
-----END PGP SIGNATURE-----

--Vy6UCbb9EK60RK4A--
