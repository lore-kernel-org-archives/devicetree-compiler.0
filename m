From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/4] dtc: Include stdlib.h in util.h
Date: Wed, 22 Jul 2020 16:41:46 +1000
Message-ID: <20200722064146.GA5513@umbus.fritz.box>
References: <20200721155900.9147-1-andrei.ziureaev@arm.com>
 <20200721155900.9147-2-andrei.ziureaev@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1595404187;
        bh=KFx0bp2qaZyhmGNT/8d6qVlapRiib3D/EcUiibq4fGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FR8hJ4MMW3FGu9I8TutO9MjMLNbsFgMqUb5Ln/z4aLYlhSeu8EsGS4A9DNOxjKIC8
         dAr04kzgrd2RF/2FBwccr09CtBaMuo2ZhpzOUH7bjER4K9YMdOEvoqmIW/GQy0mRoA
         S6/T/DQJs2OIPJ396c6qyDvNHJnmNTxdkxw+Ogq8=
Content-Disposition: inline
In-Reply-To: <20200721155900.9147-2-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2020 at 04:58:57PM +0100, Andrei Ziureaev wrote:
> If used on its own, util.h needs stdlib.h for exit(), malloc() and
> realloc().
>=20
> Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>

This one makes sense regardless of the rest, so applied.

> ---
>  util.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/util.h b/util.h
> index 5a4172d..a771b46 100644
> --- a/util.h
> +++ b/util.h
> @@ -2,6 +2,7 @@
>  #ifndef UTIL_H
>  #define UTIL_H
> =20
> +#include <stdlib.h>
>  #include <stdarg.h>
>  #include <stdbool.h>
>  #include <getopt.h>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8X36UACgkQbDjKyiDZ
s5LrmxAAgKvO7JTBSNGJVuYNnnEXvTdIOovim08UdKaUcUgSREGENcEqu/p9Hcpx
rxcnPsuZfLeaOEVAXOOxpobpvgyH8/nwtZIFY4/+9rnI2VSKM8e2abGU+wywo0LV
9RmZSHAX737zRX6sldftNEESbIhiqhXt319mZLC8wlRK/XDkWUAc9kXTmXvyRj4T
Fyz6X39DDTT/++foUtD/F7ocUeptwurrhYH4ZL25HZQz/O1BQ322p6XKlIqWFTMC
nsXiy1mgP5/zDbf6j/95JOwVPxJTZXdsqM9/OahAIBoJvyhw9yZ/QfV/6ggiRGay
VrKz8KhHLWlnB1CO04U1hg8v5PXAIdDbPnBat+NttKROkMamP+M/J23/yoVU392Z
x76zj63ph/QHtoBEBFSXHSrYJHJQBa1rXuo3tnbls+HZ62RNM7WCt0dx0Dbp8Rqq
qJNfwW+y1rRLXix/+3jmjRt2fFKbr0UwAIXDWK7NVQmZjrql1hM9bUbyw1cqfcvP
s4cFaLKM23y714BPuEbZuYTviU0esDY6B4grlVxlK52AaTRkwgGS3wkhD9b8RgcL
pm0PjxenrHw/2U04IS+UWtC13CpMPThR/88Imr69CjEBGSnEfB7mHKHkcB0qO+QC
uswDuLMn1B3i05ZFEeF+I7ltbYoIWhZYEhfy12VEMKBSq/sqk80=
=9wpK
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
