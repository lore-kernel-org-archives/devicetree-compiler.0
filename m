From: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
Subject: Re: [PATCH v2] pylibfdt: add FdtRo.get_path()
Date: Mon, 24 Jan 2022 21:43:44 +0100
Message-ID: <1902434.tdWV9SEqCh@g550jk>
References: <20220122105653.31219-1-luca@z3ntu.xyz> <CAPnjgZ2Zj7gaT8G6WrVCKunVZgRMgef-rQLRhSRk9siR-f69DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1643057025; bh=/gnZqm0DejaPA0bEGu0JOQszLlMYP8A2yfXs/lYKRxQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=dmVAAZujlt7LTSiODHpvTGQ65zI3btlb3MwBpAof8BSZ3ze0YJ0/L+HkYRHpPPTb9
         b+pYBJaosS79evj/Bu4kMHYImwZihnJAfEiJWgGLUDqo3c7JnOpL781WMh/RDqLi3D
         J28jf9M5E/y2tdIuSuzZ5zxyuXeP+WpuIIHtLk/o=
In-Reply-To: <CAPnjgZ2Zj7gaT8G6WrVCKunVZgRMgef-rQLRhSRk9siR-f69DQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Simon,

On Montag, 24. J=E4nner 2022 18:57:47 CET Simon Glass wrote:
> Hi Luca,
>=20
> On Sat, 22 Jan 2022 at 03:59, Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org> wrote:
> > Add a new Python method wrapping fdt_get_path() from the C API.
> >=20
> > Also add a test for the new method.
> >=20
> > Signed-off-by: Luca Weiss <luca-IfPCFPJWly+lVyrhU4qvOw@public.gmane.org>
> > ---
> > Changes in v2:
> > - dynamically increase size of string buffer until it fits.
> >=20
> >   The values are chosen relatively arbitrary, and terminates at lengths
> >   over than 4096 as I don't expect paths to be longer and there should
> >   be an exit condition to not eat up RAM in case of some bug.
> > =20
> >  pylibfdt/libfdt.i       | 27 +++++++++++++++++++++++++++
> >  tests/pylibfdt_tests.py |  7 +++++++
> >  2 files changed, 34 insertions(+)
> >=20
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index ac70762..d103bb6 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
> >=20
> > @@ -443,6 +443,28 @@ class FdtRo(object):
> >          """
> >          return fdt_get_alias(self._fdt, name)
> >=20
> > +    def get_path(self, nodeoffset):
> > +        """Get the full path of a node
> > +
> > +        Args:
> > +            nodeoffset: Node offset to check
> > +
> > +        Returns:
> > +            Full path to the node
> > +
> > +        Raises:
> > +            FdtException if the path is longer than 'size' or other er=
ror
> > occurs +        """
> > +        size =3D 64
> > +        while size < 4096:
> > +            ret, path =3D fdt_get_path(self._fdt, nodeoffset, size)
> > +            if ret =3D=3D -NOSPACE:
> > +                size +=3D 64
> > +                continue
> > +            check_err(ret)
> > +            return path
> > +        raise ValueError('Node path is unexpectedly long')
>=20
> Do you think it would hurt to go with 4096 immediately? Python is not
> the most efficient language so it should not matter. You can also copy
> it to another object of the correct size, perhaps, to avoid memory
> wastage.

The returned string won't be of $size but of the actual string size, swig d=
oc=20
mentions of the buffer size being used to dynamically allocate memory on he=
ap=20
but the result will be returned as string.
Probably it's not a problem to start with a bigger size, but maybe 4096 is =
a=20
bit overkill for a normal use case? Paths (at least in Linux dts files) are=
=20
normally relatively short so 512 or 1024 feels better for this.

Which values do you think are appropriate here? I made this loop because of=
=20
David's reply to v1:=20
https://www.spinics.net/lists/devicetree-compiler/msg03857.html

> Also can you please explain how swig works here? I'm a bit lost as to
> the magic for calling fdt_get_path().

It's quite well described in the doc (ctrl-f for "cstring_output_maxsize")
http://www.swig.org/Doc4.0/SWIGDocumentation.html
I don't think I've worked with swig before so I found this on stackoverflow=
 or=20
somewhere, but this function definitely seems to be made for this use case.

As far as I understand it, it just allocates a buffer of x bytes, does the =
C=20
call with the temporary buffer and then converts the result into a proper=20
Python object and discards the buffer.

Regards
Luca


