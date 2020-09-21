From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/4] pylibfdt: allow build out of tree
Date: Mon, 21 Sep 2020 12:22:06 +0400
Message-ID: <CAMxuvaxTsdcpnrED54ydCKTKbVGRnYOW3fiL5tfyNTsiUM+cyQ@mail.gmail.com>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-2-marcandre.lureau@redhat.com> <20200921062751.GB17169@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600676542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0yJDtpqyNeGTDrPuaBd8rwG/vOSDOJozUe9JkyMfmV8=;
        b=KTZI8nnP/WeJ/u6LAtffdGL0UIU8EErTU1cmSd3W4SWBpnC20Dtt98IybD0mXajYEqY/zY
        P+VJUWCoVj2KIXBz/97tu45o06jq6eNDBGFiHzg2qQnyH3nt634jx+EJS2w3PRWrYT+9Rb
        cNa65VMzVoEIXBjPFOwsnV5oUXLZMMI=
In-Reply-To: <20200921062751.GB17169-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi

On Mon, Sep 21, 2020 at 10:29 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Sep 15, 2020 at 11:27:02PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > With meson, we have to support out-of-tree build. Fix path lookup.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  pylibfdt/Makefile.pylibfdt |  2 +-
> >  pylibfdt/setup.py          | 25 +++++++++++++++++--------
> >  2 files changed, 18 insertions(+), 9 deletions(-)
> >
> > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> > index 6866a0b..32ae1c5 100644
> > --- a/pylibfdt/Makefile.pylibfdt
> > +++ b/pylibfdt/Makefile.pylibfdt
> > @@ -10,7 +10,7 @@ PYLIBFDT_CLEANDIRS_L =3D build __pycache__
> >  PYLIBFDT_CLEANDIRS =3D $(PYLIBFDT_CLEANDIRS_L:%=3D$(PYLIBFDT_dir)/%)
> >
> >  SETUP =3D $(PYLIBFDT_dir)/setup.py
> > -SETUPFLAGS =3D
> > +SETUPFLAGS =3D --top-builddir .
> >
> >  ifndef V
> >  SETUPFLAGS +=3D --quiet
> > diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> > index 53f2bef..f8ec924 100755
> > --- a/pylibfdt/setup.py
> > +++ b/pylibfdt/setup.py
> > @@ -19,23 +19,31 @@ import sys
> >  VERSION_PATTERN =3D '^#define DTC_VERSION "DTC ([^"]*)"$'
> >
> >
> > +def get_top_builddir():
> > +    assert '--top-builddir' in sys.argv
>
> I see you've added the option to the Makefile, but if this were
> invoked manually, I'm not sure that you want to just die if the
> --top-builddir option isn't included.
>
> Even if you do, I think you want a more meaningful error than an
> assertion failure.

The assertion is quite explicit:

Traceback (most recent call last):
  File "pylibfdt/setup.py", line 30, in <module>
    top_builddir =3D get_top_builddir()
  File "pylibfdt/setup.py", line 23, in get_top_builddir
    assert '--top-builddir' in sys.argv
AssertionError

Having extra arguments to setuptools is tricky:
https://stackoverflow.com/questions/677577/distutils-how-to-pass-a-user-def=
ined-parameter-to-setup-py

Since it's a programmer error, that you are not suppose to run into
because you'd use make or ninja, it seems enough to me. But if you
insist, I can update to print a more friendly message somehow.
>
> > +    index =3D sys.argv.index('--top-builddir')
> > +    sys.argv.pop(index)
> > +    return sys.argv.pop(index)
> > +
> > +
> > +srcdir =3D os.path.dirname(os.path.abspath(sys.argv[0]))
> > +top_builddir =3D get_top_builddir()
> > +
> > +
> >  def get_version():
> > -    version_file =3D "../version_gen.h"
> > +    version_file =3D os.path.join(top_builddir, 'version_gen.h')
> >      f =3D open(version_file, 'rt')
> >      m =3D re.match(VERSION_PATTERN, f.readline())
> >      return m.group(1)
> >
> >
> > -setupdir =3D os.path.dirname(os.path.abspath(sys.argv[0]))
> > -os.chdir(setupdir)
> > -
> >  libfdt_module =3D Extension(
> >      '_libfdt',
> > -    sources=3D['libfdt.i'],
> > -    include_dirs=3D['../libfdt'],
> > +    sources=3D[os.path.join(srcdir, 'libfdt.i')],
> > +    include_dirs=3D[os.path.join(srcdir, '../libfdt')],
> >      libraries=3D['fdt'],
> > -    library_dirs=3D['../libfdt'],
> > -    swig_opts=3D['-I../libfdt'],
> > +    library_dirs=3D[os.path.join(top_builddir, 'libfdt')],
> > +    swig_opts=3D['-I' + os.path.join(srcdir, '../libfdt')],
> >  )
> >
> >  setup(
> > @@ -44,5 +52,6 @@ setup(
> >      author=3D'Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>',
> >      description=3D'Python binding for libfdt',
> >      ext_modules=3D[libfdt_module],
> > +    package_dir=3D{'': srcdir},
> >      py_modules=3D['libfdt'],
> >  )
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _othe=
r_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson

