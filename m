From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: Re: [PATCH v3] pylibfdt: add FdtRo.get_path()
Date: Wed, 26 Jan 2022 20:50:49 +0100
Message-ID: <7434692.EvYhyI6sBW@g550jk>
References: <20220126155933.865297-1-luca@z3ntu.xyz> <CAPnjgZ2joJOwVN8D46ehZAmO0EH26fiYgz2zPdq19nW4iFzgow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1643226650; bh=O7Idpg+TkvwSCT6yXEyKyoyxGOw7n5Q3dRLEXD8sbhI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=KEIhNX7UygqXrb2koL3Y5s6Eo5M9ASjXNZf99pybr5CFUcRwerJYgQoRtN2II6lbj
         RcghRMfLPy8avhjtA1D2iBD+l7KuCF/rkxnDuYEdNIz1hZaPablAborq0WJAfoMHER
         HV5tn1taL4eBBvVDVZp/l9HpoTjrb5c01VW4dD0c=
In-Reply-To: <CAPnjgZ2joJOwVN8D46ehZAmO0EH26fiYgz2zPdq19nW4iFzgow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mittwoch, 26. J=E4nner 2022 20:29:10 CET Simon Glass wrote:
> Hi Luca,
>=20
> On Wed, 26 Jan 2022 at 09:01, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > Add a new Python method wrapping fdt_get_path() from the C API.
> >=20
> > Also add a test for the new method.
> >=20
> > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > ---
> > Changes since v2:
> > * Remove arbitrary size limit
> > * Change size calculation to increase exponentially
> > * Add test to verify we still get exceptions with bad parameters
> >=20
> >  pylibfdt/libfdt.i       | 26 ++++++++++++++++++++++++++
> >  tests/pylibfdt_tests.py | 11 +++++++++++
> >  2 files changed, 37 insertions(+)
> >=20
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index ac70762..2f085c8 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
> >=20
> > @@ -443,6 +443,27 @@ class FdtRo(object):
> >          """
> >          return fdt_get_alias(self._fdt, name)
> >=20
> > +    def get_path(self, nodeoffset):
> I think this should have:
>=20
> quiet=3D()
>=20
> as another parameter, to pass to check_err() below. See other examples.

see below

>=20
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
>=20
> nit:
>=20
> size *=3D 2
>=20
> > +                continue
> > +            check_err(ret)
>=20
> Should pass 'quiet' return the error here (see other examples)

This will return an empty string then in an error case, is that ok?

>=20
> > +            return path
> > +
> >=20
> >      def parent_offset(self, nodeoffset, quiet=3D()):
> >          """Get the offset of a node's parent
> >=20
> > @@ -1115,6 +1136,11 @@ typedef uint32_t fdt32_t;
> >=20
> >          }
> > =20
> >  }
> >=20
> > +%include "cstring.i"
> > +
> > +%cstring_output_maxsize(char *buf, int buflen);
> > +int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int bufle=
n);
> > +
> >=20
> >  /* We have both struct fdt_property and a function fdt_property() */
> >  %warnfilter(302) fdt_property;
> >=20
> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > index 5479363..5435881 100644
> > --- a/tests/pylibfdt_tests.py
> > +++ b/tests/pylibfdt_tests.py
> >=20
> > @@ -348,6 +348,17 @@ class PyLibfdtBasicTests(unittest.TestCase):
> >          self.assertEqual("/subnode@1/subsubnode",
> >          self.fdt3.get_alias('ss1'))
> >          self.assertEqual("/subnode@1/subsubnode/subsubsubnode",
> >          self.fdt3.get_alias('sss1'))>=20
> > +    def testGetPath(self):
> > +        """Test for the get_path() method"""
> > +        node =3D self.fdt.path_offset('/subnode@1')
> > +        node2 =3D self.fdt.path_offset('/subnode@1/subsubnode')
> > +        self.assertEqual("/subnode@1", self.fdt.get_path(node))
> > +        self.assertEqual("/subnode@1/subsubnode",
> > self.fdt.get_path(node2)) +
> > +        with self.assertRaises(FdtException) as e:
> > +            self.fdt.get_path(-1)
> > +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
>=20
> Perhaps add a test for non-exception case too

You mean with the quiet=3D parameter? Or something else?

Below is proposed diff on top of v3 (maybe badly formatted here though):

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 2f085c8..25c7cec 100644
=2D-- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -443,7 +443,7 @@ class FdtRo(object):
         """
         return fdt_get_alias(self._fdt, name)
=20
=2D    def get_path(self, nodeoffset):
+    def get_path(self, nodeoffset, quiet=3D()):
         """Get the full path of a node
=20
         Args:
@@ -461,7 +461,7 @@ class FdtRo(object):
             if ret =3D=3D -NOSPACE:
                 size =3D size * 2
                 continue
=2D            check_err(ret)
+            check_err(ret, quiet)
             return path
=20
     def parent_offset(self, nodeoffset, quiet=3D()):
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 5435881..676f221 100644
=2D-- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -359,6 +359,8 @@ class PyLibfdtBasicTests(unittest.TestCase):
             self.fdt.get_path(-1)
         self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
=20
+        self.assertEqual("", self.fdt.get_path(-1,=20
quiet=3D(libfdt.BADOFFSET,)))
+
     def testParentOffset(self):
         """Test for the parent_offset() method"""
         self.assertEqual(-libfdt.NOTFOUND,

Looks okay?

Regards
Luca

p.s. funnily enough I don't even use this function in my own script anymore=
, I=20
only used it a bit during development for debugging :D But happy to get thi=
s=20
included into pylibfdt

>=20
> > +
> >=20
> >      def testParentOffset(self):
> >          """Test for the parent_offset() method"""
> >          self.assertEqual(-libfdt.NOTFOUND,
> >=20
> > --
> > 2.34.1
>=20
> REgards,
> Simon




