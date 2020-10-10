From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/4] pylibfdt: fix build-lib location
Date: Sat, 10 Oct 2020 12:19:22 +0400
Message-ID: <CAMxuvayVO_VZtSp+_-tr=W-XiedV8tGbf6mNZqCywxxTknQJ1g@mail.gmail.com>
References: <20201006082712.241224-1-marcandre.lureau@redhat.com>
 <20201006082712.241224-2-marcandre.lureau@redhat.com> <20201009010052.GF1025389@yekko.fritz.box>
 <CAMxuvazSLvvO-OwwjDxuw8PY88nP0y5rpf7+O71jGXUPhGDsrg@mail.gmail.com> <20201010061041.GL1025389@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602317981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DFKmsezyOIBELYfX4D88Xk8PCmDHDoxUSv14dmg6Ljw=;
        b=dHkiUVXafB/S8xiYDBXp0yvyVeICozOJdvvX2DAMRr9L3F+/xKBrgyYSi3ycQJTRCwvSeM
        tgzAk0WQjCHIY16J89IEdiY4zOkxXqyHs0VzYIWNQ3EV9uTDhx1QaObdJm0434woLJcAup
        cNMg75UJpGS6nHQLMwK9xoArkH4cz48=
In-Reply-To: <20201010061041.GL1025389-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi

On Sat, Oct 10, 2020 at 10:33 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Fri, Oct 09, 2020 at 11:18:36AM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Fri, Oct 9, 2020 at 5:01 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u> wrote:
> > >
> > > On Tue, Oct 06, 2020 at 12:27:09PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org=
 wrote:
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > >
> > > > setup.py build_ext is run from top_srcdir with the Makefile
> > > > build-system, due to Makefile.pylibfdt inclusion in top_srcdir/Make=
file.
> > > >
> > > > --build-lib=3D../pylibfdt will produce output files in the parent
> > > > directory of the current directory. Ex:
> > > >
> > > > ~/src/dtc$ make && ls ../pylibfdt
> > > > _libfdt.cpython-38-x86_64-linux-gnu.so
> > >
> > > So... this doesn't happen for me
> > >
> > > $ git rev-parse HEAD
> > > cbca977ea121d7483b0c2351b17dca08a21cb1ca
> > > $ make
> > > [...]
> > > $ ls ../pylibfdt
> > > ls: cannot access '../pylibfdt': No such file or directory
> > > $ ls pylibfdt/
> > > build/  _libfdt.cpython-38-x86_64-linux-gnu.so*  libfdt.i  libfdt.py =
 libfdt_wrap.c  Makefile.pylibfdt  pylibfdt/  setup.py*
> > >
> > > If I apply your patch, then the module ends up in
> > > $topdir/pylibfdt/pylibfdt instead, and make check no longer runs the
> > > python tests.
> > >
> > > So.. why it's behaving incorrectly for you but not me, I don't know :=
/
> >
> > This is interesting, I upgraded to f33 and I no longer have the
> > issue. No idea.
>
> Oh dear, that's worrying.  It suggests it depends on the version of
> setuptools installed, and I have no idea what we'd need to do to
> ensure consistent behaviour given that.

fwiw, the rest of the patches are independent of this issue, please have a =
look.
thanks

>
> >
> > >
> > > > Fix it by changing the build-lib directory to $(cwd)/pylibfdt inste=
ad.
> > > >
> > > > (note that setup.py install will rebuild it with the default 'build=
'
> > > > directory, there doesn't seem to be a way to override that)
> > > >
> > > > Fixes: 1e4a0928f3b3b827824222572e551a60935607e3 ("pylibfdt: Don't h=
ave
> > > > setup.py depend on where it's invoked from")
> > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  pylibfdt/Makefile.pylibfdt | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfd=
t
> > > > index 6866a0b..0c07224 100644
> > > > --- a/pylibfdt/Makefile.pylibfdt
> > > > +++ b/pylibfdt/Makefile.pylibfdt
> > > > @@ -18,7 +18,7 @@ endif
> > > >
> > > >  $(PYMODULE): $(PYLIBFDT_srcs) $(LIBFDT_archive) $(SETUP) $(VERSION=
_FILE)
> > > >       @$(VECHO) PYMOD $@
> > > > -     $(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D../$=
(PYLIBFDT_dir)
> > > > +     $(PYTHON) $(SETUP) $(SETUPFLAGS) build_ext --build-lib=3D$(PY=
LIBFDT_dir)
> > > >
> > > >  install_pylibfdt: $(PYMODULE)
> > > >       @$(VECHO) INSTALL-PYLIB
> > >
> >
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _othe=
r_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson

