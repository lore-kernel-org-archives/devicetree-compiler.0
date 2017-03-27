From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/7] pylibfdt: Allow pkg-config to be supplied in the
 environment
Date: Mon, 27 Mar 2017 15:28:10 +1100
Message-ID: <20170327042810.GW19078@umbus.fritz.box>
References: <20170326190623.27518-1-sjg@chromium.org>
 <20170326190623.27518-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4PR/+zdSfVlxyWed"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1490596280;
        bh=XSw4/JB+YfEM4XVSR8vhx0/kAjN7CVfg2BpprAdhKR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QFej4ULADdnMFJjTLsr3NeClKH2WhA2141sHOaHoHsf1R2hmIveHCPWRTd6SEjt/x
         odjTE6V2WNYeEgpeKZ5IUBbhZI0Ftre/9XPuVbW65AKc+XNXfRE2KVElseaYhXT36k
         ia8oOof72L6wP4cq4lCiItlWJeeWscTc09XVKlWE=
Content-Disposition: inline
In-Reply-To: <20170326190623.27518-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>


--4PR/+zdSfVlxyWed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 26, 2017 at 01:06:17PM -0600, Simon Glass wrote:
> Some build systems have their own version of the pkg-config tool.
> Use a variable for this instead of hard-coding it, to allow for this.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Suggested-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This is good Makefile practice, regardless of anything else, so I've
merged this.

> ---
>=20
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index 1d08ec1..e6d8251 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -23,6 +23,7 @@ CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS)
>  BISON =3D bison
>  LEX =3D flex
>  SWIG =3D swig
> +PKG_CONFIG ?=3D pkg-config
> =20
>  INSTALL =3D /usr/bin/install
>  DESTDIR =3D
> @@ -119,7 +120,7 @@ SCRIPTS =3D dtdiff
>  # We need both Python and swig to build pylibfdt.
>  .PHONY: maybe_pylibfdt
>  maybe_pylibfdt: FORCE
> -	if pkg-config --cflags python >/dev/null 2>&1; then \
> +	if $(PKG_CONFIG) --cflags python >/dev/null 2>&1; then \
>  		if which swig >/dev/null 2>&1; then \
>  			can_build=3Dyes; \
>  		fi; \

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4PR/+zdSfVlxyWed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY2JTaAAoJEGw4ysog2bOSQ7kP/R3I7Eb45s7aSX1eyqyaHcxR
AfADxI1PjZpb6tJWc9nuHjdOTtGuErr0yh1jPUB0iAUOO0DsTU2D1AxZqZWwXvtA
4ZIADSQF+K4RdWBSE85+hhyMAek20neC9+tKBngA8py+bsrFSylvGq3d0DaBxfPn
eZ+GsEz73W1FKTtCH0y1N0MaQkzphNJQU4+rkmzHWf8yu+PgPKeXUjyXn49T0QP1
WbV9Rl5Zh/X6UKsqfU8h4sVBjdH1gB7UsWHITCiBl2T/fIpDZ0G3I5q04W2xscEi
kW5gb/7mrgKup0QOnQ2XSpPXkNLimPIvQnJ/yaDQ6QfQ7EPRUu6Yoqq4XJ+l+JKX
8jpb5WIv+ZkwtJSbBvW6hOnBtfkbAmJZ50RH3HCsVvAw5pR5hnynK6PwWlRAE7qF
HhkmhaFcIJJZN5tkpxzfskmY1o/b1Dzv2K4Di6GzpCLJy64c+t+272aKsMQHv8iC
nalFYKQvAwaZFBveaWK0Pq5N+tZjSPeFflLWpbo1GLg/KqsUrJHd5ST5JPFL3gi2
NIRtNgBbE6d1xNWWjwLUyhrBT7zDcYAfYA8ErbIiGN/QcSsyCe4oxVXPubJ2Qn+U
jxLrYF6+5XrB2jCCmNa+wxpNtSzFOWGAIDu6ncl7Gw2x8g829utbsjjcOeFkYhaN
bXbnnhiu0awHTnpDdGbU
=vbJI
-----END PGP SIGNATURE-----

--4PR/+zdSfVlxyWed--
