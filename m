From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 1/4] pylibfdt: allow build out of tree
Date: Mon, 8 Nov 2021 08:58:32 -0700
Message-ID: <CAPnjgZ3zndvzBoAdqsW+n7Ao33nEiRr2CXGcBnm_=XDzGmM1_Q@mail.gmail.com>
References: <20201104194527.986901-1-marcandre.lureau@redhat.com>
 <20201104194527.986901-2-marcandre.lureau@redhat.com> <CAL_JsqL=panX9EW+41vTwsaWLtJbsY=opPPbwH+nnEGZSVnYsQ@mail.gmail.com>
 <YYiyGZme2j3qGrbt@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fnC8VTCTqd4kEG9ZwHXUVyQyRjPX5AGNw4xXEnhc3+o=;
        b=JRvJ75sB4qhAKMALtd2SF4oF0b8bFrsEGYVGOzcyUKHYAhD35+u/fxIYkY0sE3aJMA
         Uu7tU2HdlU2bcl8xHHE9VDcfKWLLM31slQ4ezR0/ZtLLuY5Xp7y9JWc8hL9H3IEoMPYs
         eh9CHcL/pl4Cmks7JJB0wSQ1dEQtU2cCJo8kI=
In-Reply-To: <YYiyGZme2j3qGrbt@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi,

On Sun, 7 Nov 2021 at 22:14, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wro=
te:
>
> On Fri, Nov 05, 2021 at 04:01:38PM -0500, Rob Herring wrote:
> > On Wed, Nov 4, 2020 at 1:45 PM <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > >
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > With meson, we have to support out-of-tree build.
> >
> > I noticed that meson still builds pylibfdt/libfdt.py and
> > pylibfdt/libfdt_wrap.c in tree. And it makes the result unusable
> > without installing. For example the README instructions don't work:
> >
> >     $ cd pylibfdt
> >     $ python3 -c "import libfdt; help(libfdt)"
> >
> > I tried to fix the in tree part with swig option '-outdir', but that
> > didn't work.
>
> Urgh.  This has always fit poorly with the rest of the build system.
> In addition, I've discovered that with Fedora 35, I now get this scary wa=
rning:
>
>          PYMOD pylibfdt/_libfdt.so
> /usr/lib/python3.10/site-packages/setuptools/dist.py:498: UserWarning: Th=
e version specified ('1.6.1-g4eda2590-dirty') is an invalid version, this m=
ay not work as expected with newer versions of setuptools, pip, and PyPI. P=
lease see PEP 440 for more details.
>   warnings.warn(
> make[1]: Leaving directory '/home/dwg/src/dtc'
>
> Merely replacing 'distutils' with 'setuptools' in the code does not
> fix this.

I don't know much about this. Python seems to want to use .' 'instead
of '-' but I'm not sure why they decided this so recently.

>
>
> > Really what I'm after is what uses need to be supported? I'm looking
> > at getting pip and pypi packaging to work. I'm actually wondering if
> > pylibfdt needs to be so tightly coupled to the build system(s!) and
> > source tree. The dependencies are really just libfdt headers and
> > library which are easily installed either from source or a distro pkg.
> > The '..libfdt/' references are problematic with the packaging tools.
> > The easier route may be a standalone repo with a copy of libfdt.i and
> > a different setup.py.
>
> Unfortunately, I don't know enough about either Meson or Python
> packaging to fix this.  Simon?

I'm not quite sure what the problem is with pip3, etc. I am not an
expert on any of these but can probably find some help if we have a
clear problem. Rob, do you have a patch that causes the problem?

I am not keen on splitting the repos as pylibfdt has a source
dependency on libfdt.h

Regards,
Simon
