From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Remove duplicated -Werror in dtc Makefile
Date: Mon, 16 Nov 2015 23:46:45 +1100
Message-ID: <20151116124645.GP2747@voom.fritz.box>
References: <1446552120-18659-1-git-send-email-thuth@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJ8inJ6ig7iY3YX9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446552120-18659-1-git-send-email-thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--rJ8inJ6ig7iY3YX9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2015 at 01:02:00PM +0100, Thomas Huth wrote:
> The "-Werror" compiler flag is currently declared twice in the
> Makefile, one time in WARNINGS, and one time in CFLAGS. Let's
> remove one of them.
>=20
> Signed-off-by: Thomas Huth <thuth-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks.  However, I moved the remaining -Werror from WARNINGS
to CFLAGS - the idea is that WARNINGS controls just which warnings are
enabled, wheres -Werror controls what happens when a warning occurs.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index c1d0757..75ab67e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =3D
>  CPPFLAGS =3D -I libfdt -I .
>  WARNINGS =3D -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
>  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
> -CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS)
> +CFLAGS =3D -g -Os -fPIC $(WARNINGS)
> =20
>  BISON =3D bison
>  LEX =3D flex

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rJ8inJ6ig7iY3YX9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWSdA1AAoJEGw4ysog2bOSv1YQAK5hUBt5uCxTBOWqD2gHUZ2J
X+l1AGQg2/V1eYiY6YSRubXS8xJCxUla22VskUMWv59nzQfIwzHsNev7dxw6q3u4
D3mJ9uSTcndzQJ7S2X69DM6liKYQQapSVY1XV2lV1cwXSZVXwqtUI9i1BoEnRtbD
hQP8Z0Um1f2pSDRtqHzFiqaIa8Mn7wRAMbauTf7S9DyfH/GabQ2J/ju10ZUrrP1r
66I6zDmj4YkCWdTUTRjDraZs9xMvf/y7Njf0jFd0+s7U54RCse+hGA4ixJih5gmd
2ngeZSr4THJ7DJFee3UGMaP/2hGGFPMyToWNt10n5mP/QxbDezfBUWSZnYe0NFup
Nno7/mD32pkbPeQ9Pi4JXsGyrdjbZQDFfz3sYAZJ3rreOxfjY6YT3KX2pKgqHCQq
TBsdnR8jhk54HNUZQnXladtp7i9Htp125nj7uAGFbUifsZu2sIlPGu0qmqEJoxbk
KmlNwJtGUHv+E2tuGTXzFwe8fuVij8x4UWwatC9T6vuqrvo8gg+X3PMpKGtjxHlQ
E8YWmz92KUWwfVEjWr76HeTQbRbnKMX6bUnVCanH8UoszclsMVy730WxZObJKVHc
jHFY4hOA9dDvRg6Pw5P3Zr22rOuILdatJTCrjo5v9IhJjwjH2fKuGChnoZXtEFXE
PItbWpGVd64xoXvUXPOo
=x+2i
-----END PGP SIGNATURE-----

--rJ8inJ6ig7iY3YX9--
