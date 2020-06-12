From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: libfdt: extern "C" for c++?
Date: Fri, 12 Jun 2020 19:41:49 +1000
Message-ID: <20200612094149.GA5861@umbus.fritz.box>
References: <CAEg67Gnr08YGvX7BdOcOK0V5u0nV=pNcpE4ofKoDOyAiqRaAfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1591955289;
        bh=XgUBVbui4RYrL7h/6TR7JIYI+UGbAOMebCiTRQbMxpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pZL4mLXv+ibGyjcQGBvuSOmbj2p7ESyWfcV4yby81n0Ihm40QrvT14EXP12L6UJm7
         pEmG0eRvJfa3wF/aK9MG3YzW1TYHYgRPUzVbarxicQlGPm2dEWv7we0ybqrSvV4PlZ
         9/1/JxaqeZQKCjvLD6tTjy8qKjyB2/T92SZDQlcg=
Content-Disposition: inline
In-Reply-To: <CAEg67Gnr08YGvX7BdOcOK0V5u0nV=pNcpE4ofKoDOyAiqRaAfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 04:43:00PM +1000, Patrick Oppenlander wrote:
> Hi,
>=20
> I'm using libfdt from C++ and have to:
>=20
> extern "C" {
> #include <libfdt.h>
> }
>=20
> to get it to link.
>=20
> Would you accept a patch which adds extern "C" to libfdt headers where
> appropriate?

Uh, yeah, that should be ok.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7jTdoACgkQbDjKyiDZ
s5IxuA//aRGmbxswBjBI242b+3F2QrJq0yLpfcHnzu2qLlk9/vd9MjZ9nDYcTI5g
b+OzhR1Hkx2Vdr388ILJkLEtFnJwc4E2HlndhoGej+A9DMqDFMz1LZdzyjl8+f48
l7PmjLCjJ/XYSWswhLs+w+UMeUk6kmtM1VmMPQu9SlB8mCA8lbqt3wBpS6QFwTpq
zvUhSa6qPvyv3m0uiLvoKpcVz0Kn4MLpXXPuCw+GD0ulBryWhYXrdF67ZhZBrgCP
HSorRulwCPA2CU2P2fwckuXKFBVzCe/24sKhnDY4cTAiwN/T8zA7kHM2l09m7xfk
21V+uWt1KD5pn/DzwwUkSNTuWewkyZT2FtGGbfR0WBrC7TZ8RiKpJDOefmVjMwpi
KJ+K7WeSZnDN3gILa1WDRodanMuwh9iXlKg9p0XLzRSuLn88F7LEAfucaUNgefKn
IwHz/YZvpCoEea3n4f0woXNEmHLZAqzoEatai/wcT9JOVPi6y+6mDa8bmQ+yvzEL
ioUmhVNt1eReIiBKYSvEnLwWEUzSBsGUSCdVI/DgJhUzAHpXzQJ/Q1e5S21KVb+r
7pvqvZwqaWlxalVPBT3hVMrepmFfoDrXXmfJKdz3X49OFiot8zJTZVZcBWdHsMBH
QGsY2pngtjUbRXLTctiv23hA7gDdAtHDHaKTt0ng5CAQNCyEwUM=
=ZtUm
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
