From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4] pylibfdt: add FdtRo.get_path()
Date: Wed, 20 Apr 2022 12:56:15 +1000
Message-ID: <Yl92T9KL/dlQntRi@yekko>
References: <20220419194537.63170-1-luca@z3ntu.xyz>
 <CAPnjgZ2izMUDXJ43jSOzXW7DKbuoN5j26MyKZaLn5Wt2gd28wQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7KZveMFJ5efXakea"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1650423380;
        bh=cRmgiRQAyeM3u8xLZS6uE1KSmIMg12amKcNexAD+7xI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ATDtjZcMh1p17JFn9x64pOKrUY787P+qx9VPLcaHwQw/6Dplgx8B3SL/F37EPP2Lf
         OU8bbn8Fa4+zYNTdd0D+kOuBmnWLUmaStfKsfICQy6z3jvkD/Bnb+zMKNWUejdwjn2
         oplVRUQ5sGsA9XXVoiFCK5PxBF9K0XSauevXNZQ4=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2izMUDXJ43jSOzXW7DKbuoN5j26MyKZaLn5Wt2gd28wQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--7KZveMFJ5efXakea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 03:54:07PM -0600, Simon Glass wrote:
> Hi Luca,
>=20
> On Tue, 19 Apr 2022 at 13:49, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> >
> > Add a new Python method wrapping fdt_get_path() from the C API.
> >
> > Also add a test for the new method.
> >
> > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > ---
> > Changes since v3:
> > * add quiet parameter
> > * return integer error when error is quieted
> >
> > Changes since v2:
> > * Remove arbitrary size limit
> > * Change size calculation to increase exponentially
> > * Add test to verify we still get exceptions with bad parameters
> >
> >  pylibfdt/libfdt.i       | 28 ++++++++++++++++++++++++++++
> >  tests/pylibfdt_tests.py | 13 +++++++++++++
> >  2 files changed, 41 insertions(+)
>=20
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> You don't check for when it is output of space, but I think that is
> OK.

Right, a testcase for that would be good, but it can be a follow up.

Applied.

>=20
> >
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index ac70762..f9f7e7e 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
> > @@ -443,6 +443,29 @@ class FdtRo(object):
> >          """
> >          return fdt_get_alias(self._fdt, name)
> >
> > +    def get_path(self, nodeoffset, quiet=3D()):
> > +        """Get the full path of a node
> > +
> > +        Args:
> > +            nodeoffset: Node offset to check
> > +
> > +        Returns:
> > +            Full path to the node
> > +
> > +        Raises:
> > +            FdtException if an error occurs
> > +        """
> > +        size =3D 1024
> > +        while True:
> > +            ret, path =3D fdt_get_path(self._fdt, nodeoffset, size)
> > +            if ret =3D=3D -NOSPACE:
> > +                size =3D size * 2
> > +                continue
> > +            err =3D check_err(ret, quiet)
> > +            if err:
> > +                return err
> > +            return path
> > +
> >      def parent_offset(self, nodeoffset, quiet=3D()):
> >          """Get the offset of a node's parent
> >
> > @@ -1115,6 +1138,11 @@ typedef uint32_t fdt32_t;
> >          }
> >  }
> >
> > +%include "cstring.i"
> > +
> > +%cstring_output_maxsize(char *buf, int buflen);
> > +int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int bufle=
n);
> > +
> >  /* We have both struct fdt_property and a function fdt_property() */
> >  %warnfilter(302) fdt_property;
> >
> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > index 5479363..68d6aaa 100644
> > --- a/tests/pylibfdt_tests.py
> > +++ b/tests/pylibfdt_tests.py
> > @@ -348,6 +348,19 @@ class PyLibfdtBasicTests(unittest.TestCase):
> >          self.assertEqual("/subnode@1/subsubnode", self.fdt3.get_alias(=
'ss1'))
> >          self.assertEqual("/subnode@1/subsubnode/subsubsubnode", self.f=
dt3.get_alias('sss1'))
> >
> > +    def testGetPath(self):
> > +        """Test for the get_path() method"""
> > +        node =3D self.fdt.path_offset('/subnode@1')
> > +        node2 =3D self.fdt.path_offset('/subnode@1/subsubnode')
> > +        self.assertEqual("/subnode@1", self.fdt.get_path(node))
> > +        self.assertEqual("/subnode@1/subsubnode", self.fdt.get_path(no=
de2))
> > +
> > +        with self.assertRaises(FdtException) as e:
> > +            self.fdt.get_path(-1)
> > +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
> > +
> > +        self.assertEqual(-libfdt.BADOFFSET, self.fdt.get_path(-1, quie=
t=3D(libfdt.BADOFFSET,)))
> > +
> >      def testParentOffset(self):
> >          """Test for the parent_offset() method"""
> >          self.assertEqual(-libfdt.NOTFOUND,
> >
>=20
> Regards,
> Simon
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7KZveMFJ5efXakea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJfdkUACgkQgypY4gEw
YSIfJw/+Ji5vKrDcY5m5+WjSw25trTz0aQBcKMNkfofjxc3fg4ZtcUmXIJkYV8CW
nRhslM2YMPYdAC8EKKwo4IDl6o0Z0I+12PIRkb/JSFBZOTQubAyfD1hxVfLNOOpz
nTUGSqCN5hhW71gSL87dGZDhe1hyb3iuzVRq6WCN79QQ8uRem0HK9q4wmxdhB7Bp
KxbGfZjv3QT4vh4a/n4azqcekmTTZSL/ewapgrG8RXoKUfGmdzPRipnNXR52wUCG
QCXVlnL6NpKrL9F3nKQsmgZhy2NOS831w2Dlq66CLkbBpy8SK4WNLI+uRAzexJXU
5ZcmV9ktOrvSKRBOb0YpHxAVHv8P8uKp3M9iwfHzMq4TX9q07IYjshPIULwNvTJW
DuzY9MOg5grft4QxbTU46cGoMIKRFvF0YJpn4M7TgPP5d8qPmScCAWAumpptxMFX
c/jdacBiuxv+0+xqG5YahZj/raTq5DbOPLO3KVHwII4yqIfVT2TKRTvI+QP8H6Li
s6dg/58Pns270z7UooZYsbQtNjfdixfjUsMzzPkujb6mSpvsLJ0xqGiEMHeWx/LF
IK5a8qsIBnGpTP0gCuSRlwkppRtAmKWnQn83KTrsYjjuMwUVfEDNpjaDkxt3D9Uz
0tkjKZRbbt08GKDljjwKLxvptJZwBEQhbVJPSUfpVgwbnxfQBW8=
=JENL
-----END PGP SIGNATURE-----

--7KZveMFJ5efXakea--
