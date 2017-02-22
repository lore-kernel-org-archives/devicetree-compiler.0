From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 2/5] Add tests for pylibfdt
Date: Wed, 22 Feb 2017 13:11:42 +1100
Message-ID: <20170222021142.GF12577@umbus.fritz.box>
References: <20170215035200.29934-1-sjg@chromium.org>
 <20170215035200.29934-3-sjg@chromium.org>
 <20170215054423.GJ12369@umbus.fritz.box>
 <CAPnjgZ3wEUUEx6-XiKJ5kns-tA9HdKonXULdBYcXAkyEbHaztg@mail.gmail.com>
 <20170220034229.GA27524@umbus>
 <CAPnjgZ3CSwq7mG+fVdOjx2BSKZF1hK2UY4t6OCy_qYYAC-p42A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487733052;
        bh=kNQmhUUGsuzuwXrhDtnFCcs5nuIdgjoSHc1GFYud3Ng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TOkBk3rJLJvQD71+6v6frC1f6kwwn7uOj20uoX51lN/MoJHJN8viM5Ykqy2retNDu
         L197m9l8epinpLQQGyC86Ul2uonUZ1yh686UU90nAt8aAcnW4YhOxoaBC5CGD5MW+Y
         0HdpWvsygk6ayzp/Q6QW/rXxiW8XnVdjrxUFZ9Yk=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3CSwq7mG+fVdOjx2BSKZF1hK2UY4t6OCy_qYYAC-p42A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 11:08:11AM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 19 February 2017 at 20:42, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> > On Thu, Feb 16, 2017 at 09:48:28PM -0700, Simon Glass wrote:
> >> Hi David,
> >>
> >> On 14 February 2017 at 22:44, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u> wrote:
> >> > On Tue, Feb 14, 2017 at 08:51:57PM -0700, Simon Glass wrote:
> >> >> Add a set of tests to cover the functionality in pylibfdt.
> >> >>
> >> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> >> ---
> >> >>
> >> >> Changes in v5:
> >> >> - Adjust tests to match new swig bindings
> >> >>
> >> >> Changes in v4:
> >> >> - Drop tests that are no-longer applicable
> >> >> - Add a get for getprop()
> >> >>
> >> >> Changes in v3:
> >> >> - Add some more tests
> >> >>
> >> >> Changes in v2:
> >> >> - Update tests for new pylibfdt
> >> >> - Add a few more tests to increase coverage
> >> >>
> >> >>  tests/pylibfdt_tests.py | 267 ++++++++++++++++++++++++++++++++++++=
++++++++++++
> >> >>  tests/run_tests.sh      |  19 +++-
> >> >>  2 files changed, 285 insertions(+), 1 deletion(-)
> >> >>  create mode 100644 tests/pylibfdt_tests.py
> >> >>
> >>
> >> [..]
> >>
> >> >> +    def testPathOffset(self):
> >> >> +        """Check that we can find the offset of a node"""
> >> >> +        self.assertEquals(self.fdt.path_offset('/'), 0)
> >> >> +        self.assertEquals(self.fdt.path_offset('/subnode@1'), 124)
> >> >
> >> > This test is potentially fragile.  Eventually it would be nice to be
> >> > able to run the Python tests expecting test_tree1 on any of the copi=
es
> >> > of test_tree1 we generate.  Those are required to be semantically
> >> > identicaly (including node/property order) to test_tree1.dtb.
> >> > However, some versions won't preserve exact offsets - for example
> >> > there's a sequence of tests where we insert additional nops in the
> >> > encoding to test handling of that.  That's why tests/path_offset.c,
> >> > for example, checks the behaviour of path_offset() against
> >> > subnode_offset() and knowing what property and node names are suppos=
ed
> >> > to be present, rather than against explicit known offsets.I'm
> >>
> >> Yes it is fragile, will check it's >0 which should be safe.
> >
> > Ok.
> >
> >> Re the tests, I feel we should try to avoid testing all the same
> >> things as the C code, when we could just test the interface. But it
> >> might be easier just to duplicate the tests you as say.
> >
> > I think so.  The set of tree1 tests is a good model, because it's
> > already a reasonably thorough test model of the basic libfdt
> > interfaces.
> >
> >> >
> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.=
NOTFOUND)):
> >> >> +            self.fdt.path_offset('/wibble')
> >> >> +        self.assertEquals(self.fdt.path_offset('/wibble', QUIET_NO=
TFOUND),
> >> >> +                          -libfdt.NOTFOUND)
> >> >> +
> >> >> +    def testPropertyOffset(self):
> >> >> +        """Walk through all the properties in the root node"""
> >> >> +        self.assertEquals(self.fdt.first_property_offset(0), ROOT_=
PROPS[0])
> >> >> +        for pos in range(len(ROOT_PROPS) - 1):
> >> >> +            self.assertEquals(self.fdt.next_property_offset(ROOT_P=
ROPS[pos]),
> >> >> +                              ROOT_PROPS[pos + 1])
> >> >> +        self.assertEquals(self.fdt.next_property_offset(ROOT_PROPS=
[-1],
> >> >> +                                                        QUIET_NOTF=
OUND),
> >> >> +                          -libfdt.NOTFOUND)
> >> >> +
> >> >> +    def testPropertyOffsetExceptions(self):
> >> >> +        """Check that exceptions are raised as expected"""
> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.=
NOTFOUND)):
> >> >> +            self.fdt.next_property_offset(108)
> >> >
> >> > Same issue here.
> >>
> >> OK, I can just drop this one.
> >>
> >> >
> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.=
BADOFFSET)):
> >> >> +            self.fdt.next_property_offset(107)
> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.=
BADOFFSET)):
> >> >> +            self.fdt.first_property_offset(107, QUIET_NOTFOUND)
> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.=
BADOFFSET)):
> >> >> +            self.fdt.next_property_offset(107, QUIET_NOTFOUND)
> >> >> +
> >> >> +        node =3D self.fdt.path_offset('/subnode@1/ss1')
> >> >> +        self.assertEquals(self.fdt.first_property_offset(node, QUI=
ET_NOTFOUND),
> >> >> +                          -libfdt.NOTFOUND)
> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.=
NOTFOUND)):
> >> >> +            self.fdt.first_property_offset(node)
> >> >> +
> >> >> +    def testGetName(self):
> >> >> +        """Check that we can get the name of a node"""
> >> >> +        self.assertEquals(self.fdt.get_name(0), '')
> >> >> +        node =3D self.fdt.path_offset('/subnode@1/subsubnode')
> >> >> +        self.assertEquals(self.fdt.get_name(node), 'subsubnode')
> >> >> +
> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.=
BADOFFSET)):
> >> >> +            self.fdt.get_name(-2)
> >> >> +
> >> >> +    def testGetPropertyByOffset(self):
> >> >> +        """Check that we can read the name and contents of a prope=
rty"""
> >> >> +        root =3D self.fdt.path_offset('/')
> >> >
> >> > No point to this - offset of / is always 0.  If you want to test that
> >> > happens, make it a separate testcase.
> >>
> >> I already have it above so will drop this.
> >>
> >> >
> >> >> +        poffset =3D self.fdt.first_property_offset(root)
> >> >> +        prop =3D self.fdt.get_property_by_offset(poffset)
> >> >> +        self.assertEquals(prop.name, 'compatible')
> >> >> +        self.assertEquals(prop.value, 'test_tree1\0')
> >> >> +
> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.=
BADOFFSET)):
> >> >> +            self.fdt.get_property_by_offset(-2)
> >> >> +        self.assertEquals(
> >> >> +                -libfdt.BADOFFSET,
> >> >> +                self.fdt.get_property_by_offset(-2, [libfdt.BADOFF=
SET]))
> >> >> +
> >> >> +    def testGetProp(self):
> >> >> +        """Check that we can read the contents of a property by na=
me"""
> >> >> +        root =3D self.fdt.path_offset('/')
> >> >> +        value =3D self.fdt.getprop(root, "compatible")
> >> >> +        self.assertEquals(value, 'test_tree1\0')
> >> >> +        self.assertEquals(-libfdt.NOTFOUND, self.fdt.getprop(root,=
 'missing',
> >> >> +                                                             QUIET=
_NOTFOUND))
> >> >
> >> > For testing, it might be useful to add a special value you can set t=
he
> >> > quiet parameter to to make all errors quiet.
> >>
> >> Isn't that what I did?
> >
> > Sorry, I wasn't very clear.  What I mean is that if you want to treat
> > *all* errors as quiet, at the moment you have to do
> >         self.whatever(..., quiet=3D[NOTFOUND, EXISTS, NOSPACE,...])
> >
> > I was suggesting an extension to check_err() so you can instead say
> > 'quiet=3DSOMETHING' where SOMETHING is a special value, and it will
> > interpret that as making all errors quiet.
>=20
> OK I see. Could SOMETHING be
>=20
> QUIET_ALL =3D [NOTFOUND, EXISTS, all other errors]
>=20
> or are you wanting to take the dynamic typing further and use an
> integer or something?

I was thinking of exploiting the dynamic typing (probably using a
special value, not an int, maybe 'True').  But really, either would be
fine.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYrPNYAAoJEGw4ysog2bOSPOUP/RY1tGpu9zHa5NjdIwXGIwIW
mqgZPzEGP2RQt10zaK2jv08tWWqrOHQGjsfYuSDCB8VHY+6YoXTiJMwDvIEvA4dO
CIUf+WkDoYGGkWQwDs1p4mAGYSaRqXucqFlxXU9kGhRQYlf4sfdK34BYzOGx4FS/
s1I5KiYv1LudHYE8sr6avsbbcbJBEMPUt78SymCkrYvkLSofueKNkhmZlgiYsSY4
mUfL9CKyQ91Z0gKdk0QguBhHZf1t0ELHfOpnBY81Ao3Zo31h8k7i4gHcr478Okgz
2dkNMPz1y1/NLalOzwRVhgKG8zwm+ecp5AEk3XrWBMiQnFP9mSUV1yypD3dwv3tl
2RfoWs8xDZk7oP0yaLxElY1f/K3jPJmYcjhQSGKAtsbZMIYpdq2Zd20wNoar8bKs
Yqkw4oX3kc/+k2ePhAesk6E9kRQwq/f7w5sTgpXU2OvBC1Q1PNKkvKRaAM1kvU1+
a1oLS6w6rG2QiszDoolwbyjp50KJMQab1fSKGtc1FA/MmWcijTFIZihqItktKBZu
6Vbjqj5aMztMhFpaiIQPkwlKMg0bLyi3dI+FqmM/N9xsLp3dOTELVWV2cO7M+owU
w2YzTNM+DcqzmEv/qOU8BO7+833ceLeVlznSjGbjBD5rGbiPQwS9OQMsluwvlfa6
uGnLpcgkb6qA9AhhzOAy
=jEPK
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--
