From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/4] pylibfdt: fix build lib location
Date: Mon, 21 Sep 2020 12:09:16 +0400
Message-ID: <CAMxuvaxfb0gj285VfrozQp9KJT2XcN7yqyJWFE42tRZM9e1hig@mail.gmail.com>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-3-marcandre.lureau@redhat.com> <20200921063325.GC17169@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600675775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J97ZUY+OjenwESBSW8TlTmSt0tlXw4p5vRDRxEH2TZY=;
        b=C9nW5+s7e8HwxQj86HBqr+mAwgOelS+/OQzHOcBPABERCLjqtwxwoMKCth2CVylCnrzRdf
        aFrQSNRcvpl4STlcJHVs7D13vMRENgzVa08Rmvcsr8UapWwekUpIz/5yb9co2gtE7r/Eg7
        wbej7YdkbYd/Od8k+nWkA+6Du/MpNyU=
In-Reply-To: <20200921063325.GC17169-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi

On Mon, Sep 21, 2020 at 10:46 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Sep 15, 2020 at 11:27:03PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > setup.py build_ext is run from top_srcdir with Makefile.
> >
> > ../pylibfdt will produce output files in parent directory.
>
> Uh.. can you elaborate a bit on what exactly ends up where, and why
> the new behaviour you're setting up is better.


 ~/src/dtc $  make
...
~/src/dtc $  ls ../pylibfdt
_libfdt.cpython-38-x86_64-linux-gnu.so


It "escapes" the source directory

>
> > Note that setup.py install will rebuild it with the default 'build'
> > directory. There doesn't seem to be a way to override that.
> That rings a bell.  ISTR it being a real PITA.
>

It's a minor inconvenience imho. You just end up with an extra build/
directory during install.

> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> > ---
> >  pylibfdt/Makefile.pylibfdt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pylibfdt
> > index 32ae1c5..1b5f236 100644
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

