From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/4] pylibfdt: fix build-lib location
Date: Fri, 9 Oct 2020 11:18:36 +0400
Message-ID: <CAMxuvazSLvvO-OwwjDxuw8PY88nP0y5rpf7+O71jGXUPhGDsrg@mail.gmail.com>
References: <20201006082712.241224-1-marcandre.lureau@redhat.com>
 <20201006082712.241224-2-marcandre.lureau@redhat.com> <20201009010052.GF1025389@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602227934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zq3ETZgKPFzVg003zG07nO7gX8/Xyxr4XFEpljeenPI=;
        b=O7bHwjfdotu4LCRkHxVR7ON5MUfgDles8rYiy+IEQMdhu/Hd71q0XKealRcmZqjK7JB21+
        iF7Gj8dJSN+oXXJPbh+EbRhfk4ZMK8CfrJZZ0S8D1jLlYtP6JUbwgIGa+HGYn48IDrmtu3
        APHhwJmKlF7rPUa2v+qyGATkgS/WvK8=
In-Reply-To: <20201009010052.GF1025389-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi

On Fri, Oct 9, 2020 at 5:01 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
>
> On Tue, Oct 06, 2020 at 12:27:09PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > setup.py build_ext is run from top_srcdir with the Makefile
> > build-system, due to Makefile.pylibfdt inclusion in top_srcdir/Makefile=
.
> >
> > --build-lib=3D../pylibfdt will produce output files in the parent
> > directory of the current directory. Ex:
> >
> > ~/src/dtc$ make && ls ../pylibfdt
> > _libfdt.cpython-38-x86_64-linux-gnu.so
>
> So... this doesn't happen for me
>
> $ git rev-parse HEAD
> cbca977ea121d7483b0c2351b17dca08a21cb1ca
> $ make
> [...]
> $ ls ../pylibfdt
> ls: cannot access '../pylibfdt': No such file or directory
> $ ls pylibfdt/
> build/  _libfdt.cpython-38-x86_64-linux-gnu.so*  libfdt.i  libfdt.py  lib=
fdt_wrap.c  Makefile.pylibfdt  pylibfdt/  setup.py*
>
> If I apply your patch, then the module ends up in
> $topdir/pylibfdt/pylibfdt instead, and make check no longer runs the
> python tests.
>
> So.. why it's behaving incorrectly for you but not me, I don't know :/

This is interesting, I upgraded to f33 and I no longer have the issue. No i=
dea.

>
> > Fix it by changing the build-lib directory to $(cwd)/pylibfdt instead.
> >
> > (note that setup.py install will rebuild it with the default 'build'
> > directory, there doesn't seem to be a way to override that)
> >
> > Fixes: 1e4a0928f3b3b827824222572e551a60935607e3 ("pylibfdt: Don't have
> > setup.py depend on where it's invoked from")
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  pylibfdt/Makefile.pylibfdt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> > index 6866a0b..0c07224 100644
> > --- a/pylibfdt/Makefile.pylibfdt
> > +++ b/pylibfdt/Makefile.pylibfdt
> > @@ -18,7 +18,7 @@ endif
> >
> >  $(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP) $(VERSION_FIL=
E)
> >       @$(VECHO) PYMOD $@
> > -     $(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D../$(PYL=
IBFDT_dir)
> > +     $(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D$(PYLIBF=
DT_dir)
> >
> >  install_pylibfdt: $(PYMODULE)
> >       @$(VECHO) INSTALL-PYLIB
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _othe=
r_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson

