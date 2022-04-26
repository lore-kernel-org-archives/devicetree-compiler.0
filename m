From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4] pylibfdt: add FdtRo.get_path()
Date: Tue, 26 Apr 2022 16:28:35 +1000
Message-ID: <YmeRE/zrFA2YRgjA@yekko>
References: <20220419194537.63170-1-luca@z3ntu.xyz>
 <CAPnjgZ2izMUDXJ43jSOzXW7DKbuoN5j26MyKZaLn5Wt2gd28wQ@mail.gmail.com>
 <Yl92T9KL/dlQntRi@yekko>
 <11961807.O9o76ZdvQC@g550jk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="U7J9hRGKw6/fv0Bv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1650955250;
        bh=fGdV8QOdEULZ8Fyv8tcs3E7OSlyxcrcfXpuZqMK+8os=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lw6P/LNPYYGwK5E7trFQ3e9AdVnKedq9pQHNWZLAQPxAv7/GIVGQ10pSSD5saeeyN
         XpfuORrHTWE3vR+Yep6xAMEptkSL/bjIOnEA8QXHosOlwImz8sQErQ8Wd5RYp4GvCv
         RPrKSEW9SY9JogF+RUB7rBq+ZW1DumM460/lQLPw=
Content-Disposition: inline
In-Reply-To: <11961807.O9o76ZdvQC@g550jk>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--U7J9hRGKw6/fv0Bv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 08:19:43PM +0200, Luca Weiss wrote:
> Hi Simon and David,
>=20
> On Mittwoch, 20. April 2022 04:56:15 CEST David Gibson wrote:
> > On Tue, Apr 19, 2022 at 03:54:07PM -0600, Simon Glass wrote:
> > > Hi Luca,
> > >=20
> > > On Tue, 19 Apr 2022 at 13:49, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > > Add a new Python method wrapping fdt_get_path() from the C API.
> > > >=20
> > > > Also add a test for the new method.
> > > >=20
> > > > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > > > ---
> > > > Changes since v3:
> > > > * add quiet parameter
> > > > * return integer error when error is quieted
> > > >=20
> > > > Changes since v2:
> > > > * Remove arbitrary size limit
> > > > * Change size calculation to increase exponentially
> > > > * Add test to verify we still get exceptions with bad parameters
> > > >=20
> > > >  pylibfdt/libfdt.i       | 28 ++++++++++++++++++++++++++++
> > > >  tests/pylibfdt_tests.py | 13 +++++++++++++
> > > >  2 files changed, 41 insertions(+)
> > >=20
> > > Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > >=20
> > > You don't check for when it is output of space, but I think that is
> > > OK.
> >=20
> > Right, a testcase for that would be good, but it can be a follow up.
>=20
> I don't quite understand what you mean "is output of space".
>=20
> Maybe you mean a test for when the string is longer than 1024 characters=
=20
> ("size =3D 1024") so the size increase gets triggered?

That's what I was thinking, yes.

> If yes, then I did test that manually before by setting the value absurdl=
y=20
> low. Not sure how to properly check that in the tests though. Add a node =
with=20
> a super long name into the test dtb?

Not to the main "test_tree1" dtb, but you could use a different dtb
with a large property.  You could make one, or use an existing one
with a long property - look for references to 'lorem.txt` in
run_tests.sh for one example already creating and using a long
property.

Alternatively you could add an extra parameter to the Python wrapper
giving a "hint" size for the initial buffer.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U7J9hRGKw6/fv0Bv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJnkPoACgkQgypY4gEw
YSIPWw/9FEqLH/8mQdZYtfNFP6pX8Xp98kq662KC1muCY/oKPoRM/2txaJS3TPni
B/cAr38fC5q9H8KxlHyBPZStNsqcchGmUmM5TUpug5Hjx2xHBns6483TfFYs5yo0
EY4pIE50RMaeOSjNXoDvlYMdiclznPb6K9YCyhJFlBbN/P3k2ztwH5WOA7nfWtwm
Ud1RrGlNFbPHrOjgvVa87YMxfAQt0aJa2rUL5jdKB5Wt1HbL596z+Rq2GgrPKZw7
9OyRqWJgLEPOpSHHjK1wYGDOi0o208KEwdYja/NEkLwYSKQgbN3UGXArnlk5JFzD
+zxwWpHZTPkKTkZvXR2elTcKYZHQBG8X7fWufeoG8fd4L4sedVpHbgTZKzblSqxo
zTBCfKx1HcJnuDrrAfMgn+Sfwtue1Rn26KN7v1atK9GqluZkQHo498meaGVY94k5
r6rdqVanGBYapEk8oCSYZgzqbhx37irLNoeqR4jKkdLkU7HSiMF+vid4hURxxsjt
UqKKhI9uBdbsfA4q9h+EijCIwm7UFcjZ1nDKUxE8JHAbVFSJoRrw21VFI/YeLkul
YKPuMHd6AgAw4d+Y8BpVzilfhqn/3mwqQBzfGYpdXUxjJeeuPQsWQW8+RSMxDbnd
InqtulnghCntdi0BV8CtLNPHxJyvWrvdB5+7ed8ylncJLR/20h8=
=Ahy0
-----END PGP SIGNATURE-----

--U7J9hRGKw6/fv0Bv--
