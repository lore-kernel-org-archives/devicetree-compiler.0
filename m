From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: DTC 1.6.0
Date: Wed, 4 Mar 2020 17:42:20 +1100
Message-ID: <20200304064220.GD593957@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1583304149;
        bh=5Tn+MXqcA8IMQp7yDG4OfRBIOmBQXGXZ2xvSoQSavU0=;
        h=Date:From:To:Subject:From;
        b=nFbn1CViPj1Pm/BbLOShPY3TPKSSpr4it4rhWfrMHlRRW1zhbD/qkB/pIGbilDFtU
         eagNpKZeNESH4WpL+ZjwkBsS6Y0GZIzHXUDjtlkbTVOJQyF+AGGon1BzQwBeGoQ3aS
         CwtIOSb2vntFJDo6Z8SMaDuJsrCxhxTIJySOdaMk=
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've just tagged and packaged v1.6.0 of the device tree compiler.

Git tree available at the usual place:
   git://git.kernel.org/pub/scm/utils/dtc/dtc.git
And tarballs available at:
   https://kernel.org/pub/software/utils/dtc/

DTC 1.6.0

Changes since v1.5.1. include:
 * Some provision for out of tree builds (useful with meson)
 * Some fixes for win32 builds
 * Some improvements for FreeBSD builds:
   * Work with byacc as well as bison
   * Fix some compilation failures with clang
   * Default to cc instead of gcc
   * Add FreeBSD testing via Cirrus CI
 * Add non-x86 testing on Travis
 * Add options to allow builds of libfdt which sacrifice safety on bad
   inputs for reduced size and improved speed.  This is important for
   some embedded cases.
 * Allow testsuite to be executed on an already-installed dtc/libfdt,
   rather than just the one built in the source tree
-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5fSlEACgkQbDjKyiDZ
s5LXoQ//bKkaXf/OpF7nMfCb1/vRKtR5FiL6D90bBnP3k1ROZNDfiCyNT3JMLaa4
QVVhY1tXOe4z15x+aJmE4ft8ak0y88JQEk+NWc+9MIUN4bBYTdxoQBBGdxW+atNz
ycldlwMxAD5im9jRvHnXKFnxKZDr7i/w5qn1YJ2iVFjdeJtx4FFUDKUkE56Jjged
MmPdkXvQ0MMAtEri2QT8O6R5eiAyko6jE0QYSrCLSIaFyt6V48GvevQnW1B3nQ+u
fy59TTSGduNVjXwZfoobGmRegZrN/4F6zHhyfbQYITkeVdBVn6SS5zYk1fAVvc4a
SV/IgzFsBCNG0tiNLlxnZn13OiFUf7toJ6Nd0C+ivo1UhzyUQ2g1EQrMXySwYaTD
lWA5hK7xNWob9q6EDbRpXg8Xbw4YppC/mtJ2YakDFezgAKprVfuNgTuk18szTuqH
XgDpyQHEaMfCtY8kwgOF7kB5dDfEn8kjy8xbV6+mHa7y2pK40ZDML45FYTjt94hT
S768b2oZQZ3H/NFQc7k3SMmUJCGfAsTPqr3fJOp/Eoa7i2CLRROoiJKwUqfGqKmo
HEv36PDyVPeoooUyKqTeyqxo6vkzhwV2sjxXuflG96pgF6pFQzD73eplc5agNszF
Sh2rWToVPO7AAooQv+uROUwD2oQOenMPZa7Fxs1gjYHOjTHk6RI=3D
=3DgOZC
-----END PGP SIGNATURE-----

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5fTcsACgkQbDjKyiDZ
s5IfDxAA0PpDqXH51AAmT85MFyC+olGEIWyzm6B/+0AfEyvazCeeIHlxxSQlgLKd
Zbe+XieaSKyRcMZMHfVTqBS2AAcM+dhC0ih1NiGV5KCrnN8uIPZyNAEHsuToTvYe
zthvHjI7v+1vK3YTRI2YIlBPTo4Y8mRigQ+e9ePkG1lvo7JGzD+0Fpres1usTMkj
BChwwbUiiVZoPiI9Joej5LrQZUCFhEoLHpdTT4c/f0FC11rcgc+2f3bPEJtMjkbQ
nr6VTlWhh9wdjSG40JQlV7iMVFIZ+heUJA2B7BhXAzy8/GL33f+u9oaEkg2Df3OA
TI/tldfy7eGVgPkA1/DCH97Eq/xFeIcieUqrDT2zWgQR6CFMiUIOuxzBqX3OApcS
pWgKBcLTdezE3ONvlIf7pFjNMVRlVJkPXpfn67FCe8oNgzBcxfqhlVkMjzAPI6EU
Aj6ohWLln2rgOWM5+GoZAL587roElMjPlnjsRj7OG1zm7MUVHYU9VkF5e+AftAFT
vM1wqJi9Imaf7cnA6AZDES9hYeEtXMNp9+PsdHNz1dCD2fB+E6TTzQpR6vMplM1Z
2NNihIUdcw6UQQmHvh6+/L9i8+oxwhQhfLoOP1V9N5VW5vj9EuWOem2HFyTKTDHH
iJJ2qvNT8gUVRWmR/7og8PbOLkUGjvrsj6SE33YSIsn9UcNyG5s=
=r10Q
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
