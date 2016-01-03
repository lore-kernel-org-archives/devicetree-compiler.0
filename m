From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: fuzzing dtc with AFL
Date: Sun, 3 Jan 2016 20:28:48 +1100
Message-ID: <20160103092848.GE9329@voom.BigPond>
References: <20160103023247.2d04c28a@kryten>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160103023247.2d04c28a@kryten>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2016 at 02:32:47AM +1100, Anton Blanchard wrote:
> Hi David,
>=20
> I wanted something to test AFL with, and since dtc is simple, self

What's AFL?

> contained and checked out on my laptop, I attacked it. It found a
> number of interesting testcases:
>=20
> A divide by zero issue:
>=20
> # ./dtc test1.dts=20
> Floating point exception
>=20
> An issue parsing octals:
>=20
> # ./dtc test2.dts=20
> dtc: dtc-lexer.l:156: yylex: Assertion `!(*e) || !e[strspn(e, "UL")]'
> failed.
> Aborted
>=20
> An issue with null escape characters:
>=20
> # ./dtc test3.dts=20
> dtc: util.c:155: get_escape_char: Assertion `c' failed.
> Aborted
>=20
> and a SEGV:
>=20
> # ./dtc test4.dts=20
> Segmentation fault

Nice catches all.  I'll try to debug these in detail soon.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWiOnQAAoJEGw4ysog2bOSRq4QAJHEnRaLR0X5jLkyuB1ZGBbY
FooVLHc3G6BHgJnw+7jeTLagoeV0HNkvfDVD4xsl+qumgVpoocLXKO586r+mWpRR
T/b8gAR3WZAYC47SSwDzsf+FXXwrRfNZyvYrqqI46rIhrzgW8S+j4KoOZNePFDIf
C8moHPpl3biJ6kxCCN16iSj6dZ/Tr6rdpSM5CgMBN8XreQfeVRGPHXMjMQ7bNmRj
Kl5shrbTqZqOBKVeU4VQJMcEfwbK3bDYcW5Gi8i4xKf6s1YHZDEgh36tVxLwczLE
+jHYDsZse5Lz847yB771emkXXtdupHO2nm2WQ3ZP2vKjy3h6aWyQEExYf1YYngos
vbuJEg4nAE55Nicsp+gOzg8FhCHbrseqLgI086z1eB0XqijBDKtZsGzunFd3oNph
SzN2OqeKDiQk1Xa9YwNt1Mv5n1uAmk9FgoF8Gh+Lf3oJZzNXKqeDTYTC4RA817ba
U2Ge1Ui0cxxoQc7sHKGq7Qh+NNaHyV2uEJ/lPLG89RDgUWFDKrWiZ5Q0h3ygWkFe
L9ydH29s/mUIPA1AoTP+GV9VS+qaqSjGzW1iyU0VQIxuWn6OaLsJJVoQIi6YT63s
YhYjkmaqLTi9vn6yNNNCkfI/nvQbQJMu72Rm6k+Peiei23NkCRa6ZgJaYQYrvRDl
Qetzp7Ax4L+D+Uwn5Jyi
=+XHN
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
