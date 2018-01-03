From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] fdtoverlay: Switch from using alloca to malloc
Date: Wed, 3 Jan 2018 14:15:33 +1100
Message-ID: <20180103031533.GN24581@umbus.fritz.box>
References: <20180103030538.46326-1-kevans@FreeBSD.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="57SHPaztv6dlLu/a"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1514949975;
        bh=xlmA6EFmLphpkhkx6iSl/7VzinS3cLFaZBw2FtAFWN8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HmNwhYB7Wgr61NCE7BBPsXZFLwYtnI/EbdovVBnrVb4Xg8bN4vTYVURfHiN1zRQrF
         awHQnP5Lzoxoe7wE+xwCyrvpCMw7lVr9su9+sOX97YYxBgl+Ot3s3niaz9u7g5OVAw
         GieDEDloRR3Hy0E4XomAjrWg42ijBXAGCrhoklt8=
Content-Disposition: inline
In-Reply-To: <20180103030538.46326-1-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--57SHPaztv6dlLu/a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2018 at 09:05:38PM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> alloca entails a complicated header situation when using other platforms,=
 where
> some split it out in alloca.h while others include it as a standard part =
of
> stdlib.h.
>=20
> The cons don't seem to outweigh the pros, so switch it to malloc.
>=20
> Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

Applied, thanks.

> ---
>  fdtoverlay.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fdtoverlay.c b/fdtoverlay.c
> index 7f124fc..62a942d 100644
> --- a/fdtoverlay.c
> +++ b/fdtoverlay.c
> @@ -26,7 +26,6 @@
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> -#include <alloca.h>
>  #include <inttypes.h>
> =20
>  #include <libfdt.h>
> @@ -79,7 +78,7 @@ static int do_fdtoverlay(const char *input_filename,
>  	ret =3D 0;
> =20
>  	/* allocate blob pointer array */
> -	ovblob =3D alloca(sizeof(*ovblob) * argc);
> +	ovblob =3D malloc(sizeof(*ovblob) * argc);
>  	memset(ovblob, 0, sizeof(*ovblob) * argc);
> =20
>  	/* read and keep track of the overlay blobs */
> @@ -121,6 +120,7 @@ out_err:
>  			if (ovblob[i])
>  				free(ovblob[i]);
>  		}
> +		free(ovblob);
>  	}
>  	free(blob);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--57SHPaztv6dlLu/a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpMStUACgkQbDjKyiDZ
s5IShBAAxSvsbZW5xwL2oh73h38GdVb1ZugaGlXb3pVyhbllYelt8ed+h7pZJ1TA
l5P0PR2T4dFiD/Q9UqQclIaACzCGAt06oz+1fo4aBC41dAgVrL68x+c8HngSdWQq
tR5OJos9Je604XMfebr8UmLXZfmjBe2Mee8cRlnC0GhKCymk31peAUw1QhQhZ4r5
f86E+Byy65QkO0JhgvMrrYLBPIMeZ8HtFI9OPtP7iplg5r3fATbwXjk2DFzjxeO0
Dl2VexMhCKRocyc4+il8HhAR9ic1C+bWlS7nRkTppGTS44qJRT7S54fY4eZFyaXI
ZiFsqoMAmL28rO0xd4KlWPayUV0d9EkcZ2tNUoSkYqgKnj6Maet4ov7IFTpzoEQY
l461yxoXVxP3KdjMYX5AGFJRc7ukllF4pDdxw++OFOGu2dHPhw9K0jYczoasuOxd
oHk0gfBJ0K94RGlGQlusZTTq3LRT88t9J+yZncSb3/XTvxBJ+kSa8q3rXjH6yYnE
M/fffg8fUs1tVUWk04yn7UxWHCafATOZ/sYA0GvCoqqS6ocZPbQCe9j6CLJerfcq
hHXrC5a9SjnLZPX15ijyRZMFxcCljkK6MZ/CTe6HU6nvH2heGIGCdf40jw+2G1vr
ziwOAgc2xVT0dj8PHD14nDGk69NBs+LFKUJtTjsiZ/m2fS3W3vU=
=XcEU
-----END PGP SIGNATURE-----

--57SHPaztv6dlLu/a--
