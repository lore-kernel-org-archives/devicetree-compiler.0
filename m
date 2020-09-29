From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/4] pylibfdt: allow build out of tree
Date: Tue, 29 Sep 2020 19:37:22 +0400
Message-ID: <CAMxuvawbCOsFupbSq09HyOsknGx2Sq9gM8vjbedZFUpkJGF24A@mail.gmail.com>
References: <20200915192705.1716282-1-marcandre.lureau@redhat.com>
 <20200915192705.1716282-2-marcandre.lureau@redhat.com> <20200921062751.GB17169@yekko.fritz.box>
 <CAMxuvaxTsdcpnrED54ydCKTKbVGRnYOW3fiL5tfyNTsiUM+cyQ@mail.gmail.com>
 <20200928080038.GD501872@yekko.fritz.box> <CAMxuvaxx0+5n4YAj1OM_F0B-7wZkZnWZ7vQC6wfvAuCCvvti1w@mail.gmail.com>
 <20200929140036.GA8432@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601393863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FxhOcAMZWQupdRvSTztXDDaK4xKgUELd5KWn9JP+tyc=;
        b=IimW+7DvYTuUP6tm2m3i9+vRAFY3sjq9pKj+LEg4lmxc6Ymk0wCox31ra1zY/EjqufmFl8
        41Lu3HR07030ZG90faFeY66vE9i+JuO3nlNlyyeI3LTB/ciUequW9SSAv//SSxDHTHb1r9
        leAhNnz4Pm4XAuos7PrpMc4CHy02ZSw=
In-Reply-To: <20200929140036.GA8432-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi

On Tue, Sep 29, 2020 at 6:42 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Sep 29, 2020 at 03:46:16PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Mon, Sep 28, 2020 at 12:03 PM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Mon, Sep 21, 2020 at 12:22:06PM +0400, Marc-Andr=C3=A9 Lureau wrot=
e:
> > > > Hi
> > > >
> > > > On Mon, Sep 21, 2020 at 10:29 AM David Gibson
> > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > >
> > > > > On Tue, Sep 15, 2020 at 11:27:02PM +0400, marcandre.lureau@redhat=
.com wrote:
> > > > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > > >
> > > > > > With meson, we have to support out-of-tree build. Fix path look=
up.
> > > > > >
> > > > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.=
com>
> > > > > > ---
> > > > > >  pylibfdt/Makefile.pylibfdt |  2 +-
> > > > > >  pylibfdt/setup.py          | 25 +++++++++++++++++--------
> > > > > >  2 files changed, 18 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/pylibfdt/Makefile.pylibfdt b/pylibfdt/Makefile.pyl=
ibfdt
> > > > > > index 6866a0b..32ae1c5 100644
> > > > > > --- a/pylibfdt/Makefile.pylibfdt
> > > > > > +++ b/pylibfdt/Makefile.pylibfdt
> > > > > > @@ -10,7 +10,7 @@ PYLIBFDT_CLEANDIRS_L =3D build __pycache__
> > > > > >  PYLIBFDT_CLEANDIRS =3D $(PYLIBFDT_CLEANDIRS_L:%=3D$(PYLIBFDT_d=
ir)/%)
> > > > > >
> > > > > >  SETUP =3D $(PYLIBFDT_dir)/setup.py
> > > > > > -SETUPFLAGS =3D
> > > > > > +SETUPFLAGS =3D --top-builddir .
> > > > > >
> > > > > >  ifndef V
> > > > > >  SETUPFLAGS +=3D --quiet
> > > > > > diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> > > > > > index 53f2bef..f8ec924 100755
> > > > > > --- a/pylibfdt/setup.py
> > > > > > +++ b/pylibfdt/setup.py
> > > > > > @@ -19,23 +19,31 @@ import sys
> > > > > >  VERSION_PATTERN =3D '^#define DTC_VERSION "DTC ([^"]*)"$'
> > > > > >
> > > > > >
> > > > > > +def get_top_builddir():
> > > > > > +    assert '--top-builddir' in sys.argv
> > > > >
> > > > > I see you've added the option to the Makefile, but if this were
> > > > > invoked manually, I'm not sure that you want to just die if the
> > > > > --top-builddir option isn't included.
> > > > >
> > > > > Even if you do, I think you want a more meaningful error than an
> > > > > assertion failure.
> > > >
> > > > The assertion is quite explicit:
> > > >
> > > > Traceback (most recent call last):
> > > >   File "pylibfdt/setup.py", line 30, in <module>
> > > >     top_builddir =3D get_top_builddir()
> > > >   File "pylibfdt/setup.py", line 23, in get_top_builddir
> > > >     assert '--top-builddir' in sys.argv
> > > > AssertionError
> > > >
> > > > Having extra arguments to setuptools is tricky:
> > > > https://stackoverflow.com/questions/677577/distutils-how-to-pass-a-=
user-defined-parameter-to-setup-py
> > > >
> > > > Since it's a programmer error, that you are not suppose to run into
> > > > because you'd use make or ninja, it seems enough to me.
> > >
> > > Hm.  Invoking this only via make or ninja would be normal for someone
> > > building dtc as a unit.  But, I'm not so familiar with the Python
> > > ecosystem, so I wonder if someone specifically looking at the Python
> > > bindings would expect to be able to invoke setup.py directly.
> >
> > Maybe, so if the error message about missing '--top-builddir' is not
> > explicit enough, I can try to make the error a bit more human
> > friendly.
> >
> > But as you can see from the stackoverflow question, it's not uncommon
> > to want to have extra arguments to setup.py, and there are various
> > solutions offered for that.
>
> It's not the fact it's an extra argument that concerns me, only the
> fact that it is a *required* extra argument.

I can try to make it default to the current directory, but it will
probably have to handle errors elsewhere then in more archaic ways.

