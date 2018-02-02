From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dtdiff: change to POSIX shell
Date: Thu, 1 Feb 2018 23:14:18 -0500
Message-ID: <20180202041418.GD27582@vapier>
References: <20180110054756.23464-1-vapier@gentoo.org>
 <20180110055718.GG19773@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180110055718.GG19773-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10 Jan 2018 16:57, David Gibson wrote:
> On Wed, Jan 10, 2018 at 12:47:56AM -0500, Mike Frysinger wrote:
> > This changes from the bash-specific process substitution feature to
> > reading with pipes.  It relies on /dev/fd or /proc/self/fd existing.
> >=20
> > URL: https://crbug.com/756559
> > Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> Yeah, sorry, replacing a dependency on a complex but widely available
> shell with a much more cryptic dependency on a Linux specific feature
> does not seem like a win to me.

bash's <(...) only works when the host supports either /dev/fd or /proc/sel=
f/fd,
so i don't think this is less portable.  /dev/fd also isn't Linux-specific.
-mike

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAlpz5ZkACgkQQWM7n+g3
9YETkw/+L0vk75LBxw5TFMHFrjCPas4Ov73ObAy2RUTo/YsE6HVTW1l5v7uaj/Kn
fk6uEaOzRIeb5L1OzaILg18Ur+n8eWDL0shUVmLaPAA2/cFVtPqgVYcjZWZOND5u
O8dUbc0/Sql7XzR9PnnVeSJ9W0Qe0x5TgBomFKm2D2QXpDaSt9vT5UkN/IBZkeJM
3DrnqbcgOHKOszHBrE9T4elpEZoP0AIdyX2loGZ04krfudyqHxrysOOvqXiXvpQ+
2gbYuzaYxS4W8x6Ic9pyfRFWgZUV6j6jy4iYnIMX1XAolkp9YokOawHXwquYpz3W
S3empnwQfcZgleHMCLcnkFKZyg8QZaAVIQKyjm0/jySFawFGZJz7fiCAjl/NoJfN
yAiI2KQOv9Y30BWL0+D8r9ljP0+B3qLoFB9gcLdLUrn3oF9RY1YWAWVPogvZEMu+
+uSrll5LaeVUc67wRDbWd56I1uq4BQA+Xhxg+K3FmqZmDKuAw6FHWfGKEzS5/BjF
kyFmpFTTXjOVaaHpfrCQmlf4ryLFJ+DYul24EK7Jl3ctAqSWeycrv44J2XRIp/YL
ox05oyHSX0kq9GqJdGAwY3wzRNXUDr5yMBwbsUKUtEe5BN6C4u9bo+GV6RqdQQni
VvG6rd0OU0K+wcnyuSL5irlQa1K7hyAt1cdnldBKxVLGpOKTmMg=
=daJa
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
