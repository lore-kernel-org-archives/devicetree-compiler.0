From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: fuzzing dtc with AFL
Date: Tue, 12 Jan 2016 19:29:08 +1100
Message-ID: <20160112082908.GX22925@voom.redhat.com>
References: <20160103023247.2d04c28a@kryten>
 <20160103092848.GE9329@voom.BigPond>
 <20160104115858.GG9329@voom.BigPond>
 <20160105221630.1f94c6ce@kryten>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rmLdANEyqdgxlbgR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160105221630.1f94c6ce@kryten>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--rmLdANEyqdgxlbgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2016 at 10:16:30PM +1100, Anton Blanchard wrote:
>=20
> > I've now commited fixes (and test cases) for all of these to the
> > master tree.
>=20
> Thanks David! It's looking much better, but the fuzzer did trip on
> another divide by zero, this time a modulo:
>=20
> /dts-v1/;
>=20
> / {
>         x =3D <(0%0)>
> };

Oops, really should have thought of that case at the same time.  Oh
well, fixed now.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rmLdANEyqdgxlbgR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWlLlUAAoJEGw4ysog2bOSUEIP/RRU5mgOMz4LYaJhltU4/WpJ
cynU61VTTPfjiyopZyzNmRTQc6YbJmatYQXZ7yofHmRvEEZ7ktZmRvB/KTKBNJNT
4y5puCMGCzvoGRlO6RV/DV03x7+xoaKzD2Pq+eoDf3xvWbexqRYkk3JeUghGh7kw
TC1J2rTaa7SATH7vZBpECi+q7tvgF3xS6ZSQbQ71Eg6pmZIlRzc/QhPU0PYIeazX
Gn0B3VepTE02IATxWG10yQsNBXZGy5G7SYJV8l+3yZBCc5DoFTqpriz8PdomUgUj
o2w6VK5Xv+gYi4FWEnhSiX7XBalWh2Sb0rDBuAdkfJaVtwlY1psTSLXt+o3hecUZ
CwHZAlk4orWLQHljN9ZCwWzbHLwYRmiZpqjtdahojslGdCGAxvs1++Bj8WGoAeGz
fWSFKoXqcIyTXlZ5oWZm11E4v8jVDnLBvitf7fbzyhJkfA5jWWUgB2+vcPJ/H392
n37gy6k+k+TN/pFh3eWmWZeJVpav/raSjJHUGgobHzHUWHRLENWTdr2AS6W7k0tN
5hcONB7TJTIi64uz2WGAWUfl0MrZRqu2hKwI9r06vH1d0LEqzVFWK9+0hXSipCxz
/p9VfG1n+rQJ48q8h2kZXU1aP5ShfV50ufPUBQXUPSpY4wNy+d0ogXw6RTA+RI5A
DvXAN5ho4w0y5tqxKN1n
=+FYt
-----END PGP SIGNATURE-----

--rmLdANEyqdgxlbgR--
