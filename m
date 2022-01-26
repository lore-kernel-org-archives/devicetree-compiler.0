From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3] pylibfdt: add FdtRo.get_path()
Date: Wed, 26 Jan 2022 14:16:18 -0700
Message-ID: <CAPnjgZ11CM4jEsFJE+-CDhn4VO4xsLicpSXQOAU9vgWB1MhtDQ@mail.gmail.com>
References: <20220126155933.865297-1-luca@z3ntu.xyz> <CAPnjgZ2joJOwVN8D46ehZAmO0EH26fiYgz2zPdq19nW4iFzgow@mail.gmail.com>
 <7434692.EvYhyI6sBW@g550jk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tt+PHLOIDkqAOTVEy/H5/4po3Ig0jRR+z5alB+T2Ctk=;
        b=YQcAMdeksWtdG36pIqJ+UhZYSdPggDkYQIhON1VM9eoQ85mV6MndOAzoQIuCWSrYRy
         v63LOdcgHeaNOt01tRKM0rlQ/3S5pmPFiZZam4JJiEf3h2OgBEVAg84r9uJvnqqL271K
         j/rYPe6iqwBSU/c8FAq/2mpx6TqPs1PsGJB9o=
In-Reply-To: <7434692.EvYhyI6sBW@g550jk>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Luca,

On Wed, 26 Jan 2022 at 12:50, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
>
> On Mittwoch, 26. J=C3=A4nner 2022 20:29:10 CET Simon Glass wrote:
> > Hi Luca,
> >
> > On Wed, 26 Jan 2022 at 09:01, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > > Add a new Python method wrapping fdt_get_path() from the C API.
> > >
> > > Also add a test for the new method.
> > >
> > > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > > ---
> > > Changes since v2:
> > > * Remove arbitrary size limit
> > > * Change size calculation to increase exponentially
> > > * Add test to verify we still get exceptions with bad parameters
> > >
> > >  pylibfdt/libfdt.i       | 26 ++++++++++++++++++++++++++
> > >  tests/pylibfdt_tests.py | 11 +++++++++++
> > >  2 files changed, 37 insertions(+)
> > >
> > > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > > index ac70762..2f085c8 100644
> > > --- a/pylibfdt/libfdt.i
> > > +++ b/pylibfdt/libfdt.i
> > >
> > > @@ -443,6 +443,27 @@ class FdtRo(object):
> > >          """
> > >          return fdt_get_alias(self._fdt, name)
> > >
> > > +    def get_path(self, nodeoffset):
> > I think this should have:
> >
> > quiet=3D()
> >
> > as another parameter, to pass to check_err() below. See other examples.
>
> see below
>
> >
> > > +        """Get the full path of a node
> > > +
> > > +        Args:
> > > +            nodeoffset: Node offset to check
> > > +
> > > +        Returns:
> > > +            Full path to the node
> > > +
> > > +        Raises:
> > > +            FdtException if an error occurs
> > > +        """
> > > +        size =3D 1024
> > > +        while True:
> > > +            ret, path =3D fdt_get_path(self._fdt, nodeoffset, size)
> > > +            if ret =3D=3D -NOSPACE:
> > > +                size =3D size * 2
> >
> > nit:
> >
> > size *=3D 2
> >
> > > +                continue
> > > +            check_err(ret)
> >
> > Should pass 'quiet' return the error here (see other examples)
>
> This will return an empty string then in an error case, is that ok?

I think it should return the value of check_err(), i.e. an int.
Otherwise the real error cannot be obtained from the API.

>
> >
> > > +            return path
> > > +
> > >
> > >      def parent_offset(self, nodeoffset, quiet=3D()):
> > >          """Get the offset of a node's parent
> > >
> > > @@ -1115,6 +1136,11 @@ typedef uint32_t fdt32_t;
> > >
> > >          }
> > >
> > >  }
> > >
> > > +%include "cstring.i"
> > > +
> > > +%cstring_output_maxsize(char *buf, int buflen);
> > > +int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buf=
len);
> > > +
> > >
> > >  /* We have both struct fdt_property and a function fdt_property() */
> > >  %warnfilter(302) fdt_property;
> > >
> > > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > > index 5479363..5435881 100644
> > > --- a/tests/pylibfdt_tests.py
> > > +++ b/tests/pylibfdt_tests.py
> > >
> > > @@ -348,6 +348,17 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > >          self.assertEqual("/subnode@1/subsubnode",
> > >          self.fdt3.get_alias('ss1'))
> > >          self.assertEqual("/subnode@1/subsubnode/subsubsubnode",
> > >          self.fdt3.get_alias('sss1'))>
> > > +    def testGetPath(self):
> > > +        """Test for the get_path() method"""
> > > +        node =3D self.fdt.path_offset('/subnode@1')
> > > +        node2 =3D self.fdt.path_offset('/subnode@1/subsubnode')
> > > +        self.assertEqual("/subnode@1", self.fdt.get_path(node))
> > > +        self.assertEqual("/subnode@1/subsubnode",
> > > self.fdt.get_path(node2)) +
> > > +        with self.assertRaises(FdtException) as e:
> > > +            self.fdt.get_path(-1)
> > > +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
> >
> > Perhaps add a test for non-exception case too
>
> You mean with the quiet=3D parameter? Or something else?

Yes

>
> Below is proposed diff on top of v3 (maybe badly formatted here though):
>
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 2f085c8..25c7cec 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -443,7 +443,7 @@ class FdtRo(object):
>          """
>          return fdt_get_alias(self._fdt, name)
>
> -    def get_path(self, nodeoffset):
> +    def get_path(self, nodeoffset, quiet=3D()):
>          """Get the full path of a node
>
>          Args:
> @@ -461,7 +461,7 @@ class FdtRo(object):
>              if ret =3D=3D -NOSPACE:
>                  size =3D size * 2
>                  continue
> -            check_err(ret)
> +            check_err(ret, quiet)

        err =3D check_err(ret, quiet)
        if err:
            return err

>              return path
>
>      def parent_offset(self, nodeoffset, quiet=3D()):
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 5435881..676f221 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -359,6 +359,8 @@ class PyLibfdtBasicTests(unittest.TestCase):
>              self.fdt.get_path(-1)
>          self.assertEqual(e.exception.err, -libfdt.BADOFFSET)
>
> +        self.assertEqual("", self.fdt.get_path(-1,

Yes, but it should return -libfdt.BADOFFSET

> quiet=3D(libfdt.BADOFFSET,)))
> +
>      def testParentOffset(self):
>          """Test for the parent_offset() method"""
>          self.assertEqual(-libfdt.NOTFOUND,
>
> Looks okay?
>
> Regards
> Luca
>
> p.s. funnily enough I don't even use this function in my own script anymo=
re, I
> only used it a bit during development for debugging :D But happy to get t=
his
> included into pylibfdt

Yes I think it's a useful function!


- Simon
