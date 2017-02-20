From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 2/5] Add tests for pylibfdt
Date: Mon, 20 Feb 2017 14:42:29 +1100
Message-ID: <20170220034229.GA27524@umbus>
References: <20170215035200.29934-1-sjg@chromium.org>
 <20170215035200.29934-3-sjg@chromium.org>
 <20170215054423.GJ12369@umbus.fritz.box>
 <CAPnjgZ3wEUUEx6-XiKJ5kns-tA9HdKonXULdBYcXAkyEbHaztg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487562156;
        bh=6XJOdlczKuWAKFtIOtYH/UAv69ZCZj2zvt7/iYZDwvk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gGeFWUpZo/ybqEFH1znznp5iNjsmIdlCtuYuTCThVJly+q3N53Dpr5uicT/1eweRX
         dQ58FBeUkzDtwUCmUi1AXXMOl1B83valw/oqQ3VbkTUa2sLTEn5Vfp3WpEL4iMzXlM
         rKZDPuQzmnHhlXgpzpNV/ZVWhfpkHurd51h6vI2Y=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3wEUUEx6-XiKJ5kns-tA9HdKonXULdBYcXAkyEbHaztg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 09:48:28PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 14 February 2017 at 22:44, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> > On Tue, Feb 14, 2017 at 08:51:57PM -0700, Simon Glass wrote:
> >> Add a set of tests to cover the functionality in pylibfdt.
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> ---
> >>
> >> Changes in v5:
> >> - Adjust tests to match new swig bindings
> >>
> >> Changes in v4:
> >> - Drop tests that are no-longer applicable
> >> - Add a get for getprop()
> >>
> >> Changes in v3:
> >> - Add some more tests
> >>
> >> Changes in v2:
> >> - Update tests for new pylibfdt
> >> - Add a few more tests to increase coverage
> >>
> >>  tests/pylibfdt_tests.py | 267 +++++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  tests/run_tests.sh      |  19 +++-
> >>  2 files changed, 285 insertions(+), 1 deletion(-)
> >>  create mode 100644 tests/pylibfdt_tests.py
> >>
>=20
> [..]
>=20
> >> +    def testPathOffset(self):
> >> +        """Check that we can find the offset of a node"""
> >> +        self.assertEquals(self.fdt.path_offset('/'), 0)
> >> +        self.assertEquals(self.fdt.path_offset('/subnode@1'), 124)
> >
> > This test is potentially fragile.  Eventually it would be nice to be
> > able to run the Python tests expecting test_tree1 on any of the copies
> > of test_tree1 we generate.  Those are required to be semantically
> > identicaly (including node/property order) to test_tree1.dtb.
> > However, some versions won't preserve exact offsets - for example
> > there's a sequence of tests where we insert additional nops in the
> > encoding to test handling of that.  That's why tests/path_offset.c,
> > for example, checks the behaviour of path_offset() against
> > subnode_offset() and knowing what property and node names are supposed
> > to be present, rather than against explicit known offsets.I'm
>=20
> Yes it is fragile, will check it's >0 which should be safe.

Ok.

> Re the tests, I feel we should try to avoid testing all the same
> things as the C code, when we could just test the interface. But it
> might be easier just to duplicate the tests you as say.

I think so.  The set of tree1 tests is a good model, because it's
already a reasonably thorough test model of the basic libfdt
interfaces.

> >
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOT=
FOUND)):
> >> +            self.fdt.path_offset('/wibble')
> >> +        self.assertEquals(self.fdt.path_offset('/wibble', QUIET_NOTFO=
UND),
> >> +                          -libfdt.NOTFOUND)
> >> +
> >> +    def testPropertyOffset(self):
> >> +        """Walk through all the properties in the root node"""
> >> +        self.assertEquals(self.fdt.first_property_offset(0), ROOT_PRO=
PS[0])
> >> +        for pos in range(len(ROOT_PROPS) - 1):
> >> +            self.assertEquals(self.fdt.next_property_offset(ROOT_PROP=
S[pos]),
> >> +                              ROOT_PROPS[pos + 1])
> >> +        self.assertEquals(self.fdt.next_property_offset(ROOT_PROPS[-1=
],
> >> +                                                        QUIET_NOTFOUN=
D),
> >> +                          -libfdt.NOTFOUND)
> >> +
> >> +    def testPropertyOffsetExceptions(self):
> >> +        """Check that exceptions are raised as expected"""
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOT=
FOUND)):
> >> +            self.fdt.next_property_offset(108)
> >
> > Same issue here.
>=20
> OK, I can just drop this one.
>=20
> >
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BAD=
OFFSET)):
> >> +            self.fdt.next_property_offset(107)
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BAD=
OFFSET)):
> >> +            self.fdt.first_property_offset(107, QUIET_NOTFOUND)
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BAD=
OFFSET)):
> >> +            self.fdt.next_property_offset(107, QUIET_NOTFOUND)
> >> +
> >> +        node =3D self.fdt.path_offset('/subnode@1/ss1')
> >> +        self.assertEquals(self.fdt.first_property_offset(node, QUIET_=
NOTFOUND),
> >> +                          -libfdt.NOTFOUND)
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOT=
FOUND)):
> >> +            self.fdt.first_property_offset(node)
> >> +
> >> +    def testGetName(self):
> >> +        """Check that we can get the name of a node"""
> >> +        self.assertEquals(self.fdt.get_name(0), '')
> >> +        node =3D self.fdt.path_offset('/subnode@1/subsubnode')
> >> +        self.assertEquals(self.fdt.get_name(node), 'subsubnode')
> >> +
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BAD=
OFFSET)):
> >> +            self.fdt.get_name(-2)
> >> +
> >> +    def testGetPropertyByOffset(self):
> >> +        """Check that we can read the name and contents of a property=
"""
> >> +        root =3D self.fdt.path_offset('/')
> >
> > No point to this - offset of / is always 0.  If you want to test that
> > happens, make it a separate testcase.
>=20
> I already have it above so will drop this.
>=20
> >
> >> +        poffset =3D self.fdt.first_property_offset(root)
> >> +        prop =3D self.fdt.get_property_by_offset(poffset)
> >> +        self.assertEquals(prop.name, 'compatible')
> >> +        self.assertEquals(prop.value, 'test_tree1\0')
> >> +
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BAD=
OFFSET)):
> >> +            self.fdt.get_property_by_offset(-2)
> >> +        self.assertEquals(
> >> +                -libfdt.BADOFFSET,
> >> +                self.fdt.get_property_by_offset(-2, [libfdt.BADOFFSET=
]))
> >> +
> >> +    def testGetProp(self):
> >> +        """Check that we can read the contents of a property by name"=
""
> >> +        root =3D self.fdt.path_offset('/')
> >> +        value =3D self.fdt.getprop(root, "compatible")
> >> +        self.assertEquals(value, 'test_tree1\0')
> >> +        self.assertEquals(-libfdt.NOTFOUND, self.fdt.getprop(root, 'm=
issing',
> >> +                                                             QUIET_NO=
TFOUND))
> >
> > For testing, it might be useful to add a special value you can set the
> > quiet parameter to to make all errors quiet.
>=20
> Isn't that what I did?

Sorry, I wasn't very clear.  What I mean is that if you want to treat
*all* errors as quiet, at the moment you have to do
	self.whatever(..., quiet=3D[NOTFOUND, EXISTS, NOSPACE,...])

I was suggesting an extension to check_err() so you can instead say
'quiet=3DSOMETHING' where SOMETHING is a special value, and it will
interpret that as making all errors quiet.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYqmWlAAoJEGw4ysog2bOSuaoP/3NkL61YWXJITlpARhV1heoK
sPiF2bgTtJb2mzUBY/m4Df0pEsVEnSY14pUvGbU38n3aSMFFJDA0PvEEKpH2NTtm
2rVT9Ur5gWaBk1JoectwzCU+VaLFEzwBnMdgF5lRHdUA6yxIvsqnUayZGEomQyfL
RV236K5pQ+EiwhIdvyLtotZn3giXJMEUeFY82VyUSyKQAYGddd+4TVtypfU30tnC
YklwBh51p/PenBVXYfU1hdzN0xG1GO19BKpmmm8qsl0HAkyVnWxEnfUq40o+tGHv
vSa2egs1q7OXnq0sS5H6JqtFkZ+ogE30tEVCwkjTsdBLwq2cAu5vTMC1SN+hLujN
wXJJ3ztkzRoPQT7vCkGzvkiXo62QcmJO3xS3/wKbT6Gbb/6ZEWJLO+z1xQrkPV/8
0vnaYkRIUtAOZDynp9BIo472fKWsFur5QtZ7PNOyGH8PDPvdVaXYnxW0nczBD+72
L53B3ZiRKPu+Os1sw3m510aYzJ43HXv49FkMoAWR3RBJB6XVSe8GH+DEy5+bVwsA
ltgx1tZ0gTKjxvLcE8kPDB9EAPKqVBs6RfR2KJh4lAbZpvYjCP4hL/cIHQvohV6P
Nci7s4mcuhOqxWmXRI3IIJHjfoZzA5SFR9JowN1mFUTIqHTgIHEU39wAmjpHw2cN
xQUaUqppPi67DpSsqQCp
=tYqw
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
