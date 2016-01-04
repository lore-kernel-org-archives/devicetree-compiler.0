From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: fuzzing dtc with AFL
Date: Mon, 4 Jan 2016 22:58:58 +1100
Message-ID: <20160104115858.GG9329@voom.BigPond>
References: <20160103023247.2d04c28a@kryten>
 <20160103092848.GE9329@voom.BigPond>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160103092848.GE9329-JFWYtBTiNpwvqAi9XkHEEA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Anton Blanchard <anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2016 at 08:28:48PM +1100, David Gibson wrote:
> On Sun, Jan 03, 2016 at 02:32:47AM +1100, Anton Blanchard wrote:
> > Hi David,
> >=20
> > I wanted something to test AFL with, and since dtc is simple, self
>=20
> What's AFL?
>=20
> > contained and checked out on my laptop, I attacked it. It found a
> > number of interesting testcases:
> >=20
> > A divide by zero issue:
> >=20
> > # ./dtc test1.dts=20
> > Floating point exception
> >=20
> > An issue parsing octals:
> >=20
> > # ./dtc test2.dts=20
> > dtc: dtc-lexer.l:156: yylex: Assertion `!(*e) || !e[strspn(e, "UL")]'
> > failed.
> > Aborted
> >=20
> > An issue with null escape characters:
> >=20
> > # ./dtc test3.dts=20
> > dtc: util.c:155: get_escape_char: Assertion `c' failed.
> > Aborted
> >=20
> > and a SEGV:
> >=20
> > # ./dtc test4.dts=20
> > Segmentation fault
>=20
> Nice catches all.  I'll try to debug these in detail soon.

I've now commited fixes (and test cases) for all of these to the
master tree.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWil6CAAoJEGw4ysog2bOSWq4QAJIpenJC8Xmj2KR86mHzvs9W
UyDr1kxyK1RYhs6IlWMgXrApZgThmqWJ0xMoDYAZ8SgitFH5lZ8oknVcp/ypMamj
giHIugLrR8w6UmA+yUebY9Z7AlRWzI+UWdD7EES/BBz8so406nOA2B0MWYlWzt2G
99W9gMqDyeKMNm2ncekNFkhLvv/Zc1UzT2t7oUabMh18KF6v+iTBx4ajhD6YC1N0
paPRWD8unVXYhXwdDQGnArIceqHs16/9w1qZc7BsL0LK7gUQnhYc/LOrkCc7egoz
3PieptDI5v1s5t9sqAa8QD1ftl1fCS2tL0Z8dJy9tJruSjoH2Rq+sHWitH3E4lzb
VRVmVdOyn8QOxn1cZ0e2FUODhP6epHhY8FIrfh1WKReY1dnNXokta6YjVG5J9C9N
wiaw60eLgYe7iyeKpB1bodvZPhJZEno9TbOJJEM96CP0otoxgU/TUxEh9VIyGuXm
h3csobAkglQRuAUmeP9sfMIQo3LnKqRBFdYM7BQ9eaCEq6fctyqv2cHtBzrdHGB1
i+eXTCV0cKY0p5vqLKGGl4MeNot1thif68uO9I6sFORnSSuAvuJIMgXljcYhnIyi
lW+GgMikYHlY7WTV4/rcq1BOXH1xjQgnJZEDnUnbtNb3gS9we8uQiRMRQS7gTSQ4
txiefHY2KpVS2hZ2VY30
=s1gs
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--
