From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] fdtdump.c: make sure size_t argument to memchr is
 always unsigned.
Date: Sun, 24 Jul 2016 00:41:46 +1000
Message-ID: <20160723144146.GB24621@voom.fritz.box>
References: <1468369873-3244-1-git-send-email-jcd@tribudubois.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1469286648;
	bh=6tfwkUcT2kCY1MQN01z74hUiDpInIFEOsNlMFNBdMDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nTcrJXFLW6VzzjhctRjDAtpb6DGV3vbshzXdNboLCLP87c62fEZ6++NTJOHKVyuoj
	 C2b2pSSKh52+YrNbETQHXW+LOQSTEfCfVSXFAdAkn7jgI5q+OeH/xDWWKTk5EY0B8w
	 cwA1B5Dv1Lwe3HCnKMKACVSNP16Y6LtiQBZKb2p8=
Content-Disposition: inline
In-Reply-To: <1468369873-3244-1-git-send-email-jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 02:31:13AM +0200, Jean-Christophe Dubois wrote:
> CID 132817 (#1 of 1): Integer overflowed argument (INTEGER_OVERFLOW)
> 15. overflow_sink: Overflowed or truncated value (or a value computed fro=
m an overflowed or truncated value) endp - p - 4L used as critical argument=
 to function.
>=20
> Signed-off-by: Jean-Christophe Dubois <jcd-WBS85hRCVJbxB9160cZjhg@public.gmane.org>

Applied.

fdtdump is a hacky tool, so I don't particularly care about bugs in
it, but I guess we might as well shut up the semantic checker.

> ---
>=20
> Changes since v1:
>  * fix the post loop test.
>=20
>  fdtdump.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 95a6a20..a9a2484 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -15,6 +15,8 @@
> =20
>  #include "util.h"
> =20
> +#define FDT_MAGIC_SIZE	4
> +
>  #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
>  #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
>  #define GET_CELL(p)	(p +=3D 4, *((const uint32_t *)(p-4)))
> @@ -188,15 +190,15 @@ int main(int argc, char *argv[])
> =20
>  	/* try and locate an embedded fdt in a bigger blob */
>  	if (scan) {
> -		unsigned char smagic[4];
> +		unsigned char smagic[FDT_MAGIC_SIZE];
>  		char *p =3D buf;
>  		char *endp =3D buf + len;
> =20
>  		fdt_set_magic(smagic, FDT_MAGIC);
> =20
>  		/* poor man's memmem */
> -		while (true) {
> -			p =3D memchr(p, smagic[0], endp - p - 4);
> +		while ((endp - p) >=3D FDT_MAGIC_SIZE) {
> +			p =3D memchr(p, smagic[0], endp - p - FDT_MAGIC_SIZE);
>  			if (!p)
>  				break;
>  			if (fdt_magic(p) =3D=3D FDT_MAGIC) {
> @@ -215,7 +217,7 @@ int main(int argc, char *argv[])
>  			}
>  			++p;
>  		}
> -		if (!p)
> +		if (!p || ((endp - p) < FDT_MAGIC_SIZE))
>  			die("%s: could not locate fdt magic\n", file);
>  		printf("%s: found fdt at offset %#zx\n", file, p - buf);
>  		buf =3D p;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXk4IqAAoJEGw4ysog2bOShEcP/0V8ouuaQdUXm83XFuRrtkJy
mzZuOCy74JsV5ymK+wOK5BXK3XXyF/9SUGhfVrr6FuAiyLPgABG8LZGKZtsXn8iD
K+DTpXIG9pJgbuiLXMY89pG/zVRKm7wnKhj/BVFl1jJl58TaE7h1ajZn4eYc0A8s
mbQRp/7nRTdhvWFCmVNacmHIizYYhQFF1ZrBU+HrpkhPAmXYIqGrFBrVGPqKMhMI
qJKraB4bLck5/2GorCA0ThVyk21cn2tZhY7yC5EabCgW+izwt9LK/I2nl31CnyAC
C0lk9+/So4vuKNGf/sa2irvzkNuRHnExLxKBe6Ga71tvAliCqP8u9v/cQLZxNbsO
/pDgrxTI0+KtAR3mcdI6UiUU3sNX3NwdVdXjpy9Il/1JqLNesrHTveYmRMa/73Z5
iauuPcM08DNAift3WrCH3W34wzAWMkBwLFMel2IXtK8NLUegHRE3p0LrBqXK3tkQ
xrUg1U2r5MiQlPU0n1ZeCVNgIKuUXWrKPmq9lSA+POEPgJyImpvScA2pd95KnIuU
iskUv3NsvGrbRnvsPanW66lyzHBzjxsIYhA4XGvsRmCB8rjVejVAsHhGiyAykw/s
KDYpOjTO7fysFOdIBUzlZwIrTq3h7MSZ87JNpLdq/tWlbFlnpvDmvnN2LgVkjQIM
PqafGbzpzX6vyGhFyIWT
=fo2S
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
