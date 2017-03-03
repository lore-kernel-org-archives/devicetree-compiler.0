From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 2/5] Add tests for pylibfdt
Date: Fri, 3 Mar 2017 15:22:57 +1100
Message-ID: <20170303042257.GE667@umbus.fritz.box>
References: <20170222043340.17008-1-sjg@chromium.org>
 <20170222043340.17008-3-sjg@chromium.org>
 <20170224025254.GJ17615@umbus.fritz.box>
 <CAPnjgZ0SB4j1QyD7TrnJf=WTt3To0SvUBT5p81vzfnDMxz1aGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1488514983;
        bh=MVR2EIgCet0f2jFtTBpmRFrhjmFEep2k6f0ZBXGUAfA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EVK19f6Jr05dwKWk7X5n9EFClAWNS2BgVswXDgRg+TdK/vr+3YP8Bc4SoB8k2a950
         EfADDYKX9IakGvvmKXrN9m5Q8xNGbN60w6XZgUv1RELwMinJsVKqNwVW7KbaaJiU5T
         sr+7b4AMCn/bPqk4tznxDUAKzLSVilU9pHCP1i0A=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0SB4j1QyD7TrnJf=WTt3To0SvUBT5p81vzfnDMxz1aGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 10:40:32PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On 23 February 2017 at 19:52, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> > On Tue, Feb 21, 2017 at 09:33:37PM -0700, Simon Glass wrote:
> >> Add a set of tests to cover the functionality in pylibfdt.
> >>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> ---
> >>
> >> Changes in v7:
> >> - Add a test for QUIET_ALL
> >>
> >> Changes in v6:
> >> - Adjust tests to avoid checking a hard-coded offset
> >> - Use 0 instead of self.fdt.path_offset('/')
> >> - Adjust the totalsize() test to compare against the file size
> >> - Adjust test result processing to avoid using awk
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
> >>  tests/pylibfdt_tests.py | 275 +++++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  tests/run_tests.sh      |  16 ++-
> >>  2 files changed, 290 insertions(+), 1 deletion(-)
> >>  create mode 100644 tests/pylibfdt_tests.py
> >>
>=20
> >> +    def testPathOffset(self):
> >> +        """Check that we can find the offset of a node"""
> >> +        self.assertEquals(self.fdt.path_offset('/'), 0)
> >> +        self.assertTrue(self.fdt.path_offset('/subnode@1') > 0)
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.NOT=
FOUND)):
> >> +            self.fdt.path_offset('/wibble')
> >
> > Checking the error string by regexp seems a bit indirect.  Wouldn't it
> > be better to add new helper that checks explicitly for an FdtException
> > with the right fdt error code embedded in it?
>=20
> I'm not sure how to do a helper simply since there is a context
> manager involved. I'll use the normal method of checking the exception
> afterwards.

Ah.. yeah.. Python with statements always confuse me.

>=20
> >
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
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BAD=
OFFSET)):
> >> +            self.fdt.next_property_offset(107)
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BAD=
OFFSET)):
> >> +            self.fdt.first_property_offset(107, QUIET_NOTFOUND)
> >> +        with self.assertRaisesRegexp(FdtException, get_err(libfdt.BAD=
OFFSET)):
> >> +            self.fdt.next_property_offset(107, QUIET_NOTFOUND)
> >
> > Isn't this a dupe of the previous statement?  This also looks like a
> > case where using QUIET_ALL could make it neater.
>=20
> All three statements are slightly different.
>=20
> The intent here is to make sure that quietening one error doesn't mask an=
other.

Ah.. ok.  Maybe a comment to that effect - from the test name, I
thought it was just about the underlying function returning the right
error codes.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuO+hAAoJEGw4ysog2bOSER0P/RmTOLAoduxQmuT1PvrFkhbO
3xsyCqgDkwpJqr/ECXQQyNYNHR6mYLb7ER2hhDIzBEOiaaDJZV7Lbnbrg6bp5i/V
v+CuxmEalcMof6FKsT30H0KfHx0Y9LFvcvuPzRxmzFLW/sGsWInqQwL0yq/gMHAs
wXD8x8PC9CXwS97N1MuHGb6oVGa7Y6XOSxNjO0jMaQ4FVXKe/Wj4Y8CVK9BQVAnO
EjGGHTH4ItJT/KvPNFsZqEKVYUFhjgwmxxg/s7sWvzxtYWoF/cM4tq/NrSfOumLZ
T3DvR66/jPyAPo8+Anb/Fvo/+xl83fCbjgzHMA+3CjIn8SGKS7DspxTJupVhNj3q
Yvsa6rcKWaSMYmsFlZuvvN7DNrjGsAxoQOP5BSOi9QHUI+V891IhjRN5Hz8/wVBp
ji+6a2NzdEL0/bIyVtOEWkleINehuxpQB7rIWdJQOuatbHtsbtSYTJRSe+8NlZvk
57ooOJgLqW79WSbArQSXh7woSYUqP/ssjR8hSt1oLdKdGB8oi5Nx4uqR9FqzN6FG
tgT3dB7UqgVBokKThkPWWhKXTWe9GPPF0EB8m2AKs/9Umtd9b6SZn4B7DAE/3wwH
INeo/Uyg2ompb5X6y9Vuczg5TtyY+9nzEQkKrvrDVt1PN4RKDq2jCoRXjZB2yvKG
cEsiXQ1WXSSAy9ljHIKN
=CGzX
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
