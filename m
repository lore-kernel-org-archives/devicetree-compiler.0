From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 2/5] Add tests for pylibfdt
Date: Wed, 22 Feb 2017 17:19:08 +1100
Message-ID: <20170222061908.GM12577@umbus.fritz.box>
References: <20170215035200.29934-1-sjg@chromium.org>
 <20170215035200.29934-3-sjg@chromium.org>
 <20170215054423.GJ12369@umbus.fritz.box>
 <CAPnjgZ3wEUUEx6-XiKJ5kns-tA9HdKonXULdBYcXAkyEbHaztg@mail.gmail.com>
 <20170220034229.GA27524@umbus>
 <CAPnjgZ3CSwq7mG+fVdOjx2BSKZF1hK2UY4t6OCy_qYYAC-p42A@mail.gmail.com>
 <20170222021142.GF12577@umbus.fritz.box>
 <CAPnjgZ2v=oQTnYFEwucuCsUN1tQGx3zQfpHBZ1gRzpyZW8_g-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B9BE8dkJ1pIKavwa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487745234;
        bh=goMuiK2BEgaZ3wO2fpalXukDcSbMozCmywHoLHqMU48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I2SRgp493gkJNk796V1Xa4gjJ5DU9lcrvwERBt8/e3tF8CwSZfF/w3Bhw5ewwZDHn
         ST43dpn2BWpXNvFw6/oMsLQNC1m3JS1rzM3CWYhbheFxkvi10BcN3tWTSsaqmOorFA
         1+l4KkwU+lxLtzGI0rzzilFXd792JqdUoCVtzB0E=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2v=oQTnYFEwucuCsUN1tQGx3zQfpHBZ1gRzpyZW8_g-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--B9BE8dkJ1pIKavwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 09:33:01PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 21 February 2017 at 19:11, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> > On Tue, Feb 21, 2017 at 11:08:11AM -0700, Simon Glass wrote:
> >> Hi David,
> >>
> >> On 19 February 2017 at 20:42, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u> wrote:
> >> > On Thu, Feb 16, 2017 at 09:48:28PM -0700, Simon Glass wrote:
> >> >> Hi David,
> >> >>
> >> >> On 14 February 2017 at 22:44, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6vUpdFzICT1y@public.gmane.org=
d.au> wrote:
> >> >> > On Tue, Feb 14, 2017 at 08:51:57PM -0700, Simon Glass wrote:
> >> >> >> Add a set of tests to cover the functionality in pylibfdt.
> >> >> >>
> >> >> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> >> >> ---
> >> >> >>
> >> >> >> Changes in v5:
> >> >> >> - Adjust tests to match new swig bindings
> >> >> >>
> >> >> >> Changes in v4:
> >> >> >> - Drop tests that are no-longer applicable
> >> >> >> - Add a get for getprop()
> >> >> >>
> >> >> >> Changes in v3:
> >> >> >> - Add some more tests
> >> >> >>
> >> >> >> Changes in v2:
> >> >> >> - Update tests for new pylibfdt
> >> >> >> - Add a few more tests to increase coverage
> >> >> >>
> >> >> >>  tests/pylibfdt_tests.py | 267 +++++++++++++++++++++++++++++++++=
+++++++++++++++
> >> >> >>  tests/run_tests.sh      |  19 +++-
> >> >> >>  2 files changed, 285 insertions(+), 1 deletion(-)
> >> >> >>  create mode 100644 tests/pylibfdt_tests.py
> >> >> >>
> >> >>
> >> >> [..]
> >> >>
> >> >> >> +    def testPathOffset(self):
> >> >> >> +        """Check that we can find the offset of a node"""
> >> >> >> +        self.assertEquals(self.fdt.path_offset('/'), 0)
> >> >> >> +        self.assertEquals(self.fdt.path_offset('/subnode@1'), 1=
24)
> >> >> >
> >> >> > This test is potentially fragile.  Eventually it would be nice to=
 be
> >> >> > able to run the Python tests expecting test_tree1 on any of the c=
opies
> >> >> > of test_tree1 we generate.  Those are required to be semantically
> >> >> > identicaly (including node/property order) to test_tree1.dtb.
> >> >> > However, some versions won't preserve exact offsets - for example
> >> >> > there's a sequence of tests where we insert additional nops in the
> >> >> > encoding to test handling of that.  That's why tests/path_offset.=
c,
> >> >> > for example, checks the behaviour of path_offset() against
> >> >> > subnode_offset() and knowing what property and node names are sup=
posed
> >> >> > to be present, rather than against explicit known offsets.I'm
> >> >>
> >> >> Yes it is fragile, will check it's >0 which should be safe.
> >> >
> >> > Ok.
> >> >
> >> >> Re the tests, I feel we should try to avoid testing all the same
> >> >> things as the C code, when we could just test the interface. But it
> >> >> might be easier just to duplicate the tests you as say.
> >> >
> >> > I think so.  The set of tree1 tests is a good model, because it's
> >> > already a reasonably thorough test model of the basic libfdt
> >> > interfaces.
> >> >
> >> >> >
> >> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libf=
dt.NOTFOUND)):
> >> >> >> +            self.fdt.path_offset('/wibble')
> >> >> >> +        self.assertEquals(self.fdt.path_offset('/wibble', QUIET=
_NOTFOUND),
> >> >> >> +                          -libfdt.NOTFOUND)
> >> >> >> +
> >> >> >> +    def testPropertyOffset(self):
> >> >> >> +        """Walk through all the properties in the root node"""
> >> >> >> +        self.assertEquals(self.fdt.first_property_offset(0), RO=
OT_PROPS[0])
> >> >> >> +        for pos in range(len(ROOT_PROPS) - 1):
> >> >> >> +            self.assertEquals(self.fdt.next_property_offset(ROO=
T_PROPS[pos]),
> >> >> >> +                              ROOT_PROPS[pos + 1])
> >> >> >> +        self.assertEquals(self.fdt.next_property_offset(ROOT_PR=
OPS[-1],
> >> >> >> +                                                        QUIET_N=
OTFOUND),
> >> >> >> +                          -libfdt.NOTFOUND)
> >> >> >> +
> >> >> >> +    def testPropertyOffsetExceptions(self):
> >> >> >> +        """Check that exceptions are raised as expected"""
> >> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libf=
dt.NOTFOUND)):
> >> >> >> +            self.fdt.next_property_offset(108)
> >> >> >
> >> >> > Same issue here.
> >> >>
> >> >> OK, I can just drop this one.
> >> >>
> >> >> >
> >> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libf=
dt.BADOFFSET)):
> >> >> >> +            self.fdt.next_property_offset(107)
> >> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libf=
dt.BADOFFSET)):
> >> >> >> +            self.fdt.first_property_offset(107, QUIET_NOTFOUND)
> >> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libf=
dt.BADOFFSET)):
> >> >> >> +            self.fdt.next_property_offset(107, QUIET_NOTFOUND)
> >> >> >> +
> >> >> >> +        node =3D self.fdt.path_offset('/subnode@1/ss1')
> >> >> >> +        self.assertEquals(self.fdt.first_property_offset(node, =
QUIET_NOTFOUND),
> >> >> >> +                          -libfdt.NOTFOUND)
> >> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libf=
dt.NOTFOUND)):
> >> >> >> +            self.fdt.first_property_offset(node)
> >> >> >> +
> >> >> >> +    def testGetName(self):
> >> >> >> +        """Check that we can get the name of a node"""
> >> >> >> +        self.assertEquals(self.fdt.get_name(0), '')
> >> >> >> +        node =3D self.fdt.path_offset('/subnode@1/subsubnode')
> >> >> >> +        self.assertEquals(self.fdt.get_name(node), 'subsubnode')
> >> >> >> +
> >> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libf=
dt.BADOFFSET)):
> >> >> >> +            self.fdt.get_name(-2)
> >> >> >> +
> >> >> >> +    def testGetPropertyByOffset(self):
> >> >> >> +        """Check that we can read the name and contents of a pr=
operty"""
> >> >> >> +        root =3D self.fdt.path_offset('/')
> >> >> >
> >> >> > No point to this - offset of / is always 0.  If you want to test =
that
> >> >> > happens, make it a separate testcase.
> >> >>
> >> >> I already have it above so will drop this.
> >> >>
> >> >> >
> >> >> >> +        poffset =3D self.fdt.first_property_offset(root)
> >> >> >> +        prop =3D self.fdt.get_property_by_offset(poffset)
> >> >> >> +        self.assertEquals(prop.name, 'compatible')
> >> >> >> +        self.assertEquals(prop.value, 'test_tree1\0')
> >> >> >> +
> >> >> >> +        with self.assertRaisesRegexp(FdtException, get_err(libf=
dt.BADOFFSET)):
> >> >> >> +            self.fdt.get_property_by_offset(-2)
> >> >> >> +        self.assertEquals(
> >> >> >> +                -libfdt.BADOFFSET,
> >> >> >> +                self.fdt.get_property_by_offset(-2, [libfdt.BAD=
OFFSET]))
> >> >> >> +
> >> >> >> +    def testGetProp(self):
> >> >> >> +        """Check that we can read the contents of a property by=
 name"""
> >> >> >> +        root =3D self.fdt.path_offset('/')
> >> >> >> +        value =3D self.fdt.getprop(root, "compatible")
> >> >> >> +        self.assertEquals(value, 'test_tree1\0')
> >> >> >> +        self.assertEquals(-libfdt.NOTFOUND, self.fdt.getprop(ro=
ot, 'missing',
> >> >> >> +                                                             QU=
IET_NOTFOUND))
> >> >> >
> >> >> > For testing, it might be useful to add a special value you can se=
t the
> >> >> > quiet parameter to to make all errors quiet.
> >> >>
> >> >> Isn't that what I did?
> >> >
> >> > Sorry, I wasn't very clear.  What I mean is that if you want to treat
> >> > *all* errors as quiet, at the moment you have to do
> >> >         self.whatever(..., quiet=3D[NOTFOUND, EXISTS, NOSPACE,...])
> >> >
> >> > I was suggesting an extension to check_err() so you can instead say
> >> > 'quiet=3DSOMETHING' where SOMETHING is a special value, and it will
> >> > interpret that as making all errors quiet.
> >>
> >> OK I see. Could SOMETHING be
> >>
> >> QUIET_ALL =3D [NOTFOUND, EXISTS, all other errors]
> >>
> >> or are you wanting to take the dynamic typing further and use an
> >> integer or something?
> >
> > I was thinking of exploiting the dynamic typing (probably using a
> > special value, not an int, maybe 'True').  But really, either would be
> > fine.
>=20
> Well I'll go with the tuple for consistency (i.e. to avoid a special
> case). It's an internal detail so we can always change if it feels
> wrong.

Yes, that makes sense.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--B9BE8dkJ1pIKavwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYrS1aAAoJEGw4ysog2bOSajgQALpwD9gX5WUCrtWlSynnMREd
Od0FNv9WAUKmTjVx9ydoVk3EkYvQWsXuFkIkgIOIMdt2cTnx1VzK16p4qAamv6UN
VLZ5R3VsttyawDIX/j/zIyJJBYSX6ZncFvG6hT4V+QO7NO9+pszmyxsFr6fxRreo
2XbHaMCZIWPytJSb34ma/o9g2CyfAG0eu5SGwguImM21Z2N0T0QgO4G4A0DMlyLH
A2qf3eugOyrrpREJIltMTNOEDGnm+FQtRz7w4ZkjMUYt9F92B1yDVKuVipJXncjE
VuBsHJv/AaQfkI9UaMLotECI5V8AfI/NoEb0qLqh6v9jrZNL1HGFlcae0swLihZ7
5u6rp+QcqC+vdj/E7BpFU69tU/ZOTAG5NMDVqot3wMODxUkyMDhCZi3KpBjYUO+2
g6+Qn59Wu9ut2ogmAbvLxAVz8wAXpoRlxefU6tWxuubsuMXYBydJrKsTyC5/Y46n
+r2nGVg7GBulbxj4Hf7rn38+hQyP0hJd14iJpGNBNBepHjh/yrFrODqfKA9LYvov
Qf1DxfUgOqUNKqJVIe9g5rrbxwvRAC/BoymT8/ObhLXYoBsOgDQ7uA092ip7gC8s
u8M0Ij+h0DFAdJVZNCH/QUepjkgQMAQ3IHPF0w2r192sQm8z8ARnjRub/vkUFyNp
qcrmvAy28PTVC8XoFLuV
=p6QU
-----END PGP SIGNATURE-----

--B9BE8dkJ1pIKavwa--
