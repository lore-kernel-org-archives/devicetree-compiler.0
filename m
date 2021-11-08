From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/4] pylibfdt: allow build out of tree
Date: Mon, 8 Nov 2021 10:59:39 -0600
Message-ID: <CAL_Jsq+LDmauXEookk4DFiVcEWaGfC_7pxH=B-=N=ear6MzhvA@mail.gmail.com>
References: <20201104194527.986901-1-marcandre.lureau@redhat.com>
 <20201104194527.986901-2-marcandre.lureau@redhat.com> <CAL_JsqL=panX9EW+41vTwsaWLtJbsY=opPPbwH+nnEGZSVnYsQ@mail.gmail.com>
 <YYiyGZme2j3qGrbt@yekko> <CAPnjgZ3zndvzBoAdqsW+n7Ao33nEiRr2CXGcBnm_=XDzGmM1_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636390793;
        bh=HwhHKUBO01RuOxsU3w9yWYMqMV++/KilEipPJhwdiJw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vGYjCEmV/fdilpZBjCA8NkxXWNQ9MRWfBcb2rFqN0Z0dzS18495QTVJDl0mP8ltPH
         1NwOmxtgFxWRjmnymYa+dEg8+N+CAcrivOvXW7IFSbpQMpLb/yKhO+vzHlm1labx0U
         NT9kq/BHFUOy3RgDR6G01IzaUpEPZwhHDrkM0g4MaiKQhM7ERNMLMTP/kLsL49+ENW
         ScBIAEXJot6dEZnQ72qapYy6Yk1Y5e5KvDCegX/TyrOQ+0n9BQAQfKpUOVepmZITdV
         5Xm1dbylfgeuj6w5En7m2pi+5RXiuYM8BRThw7odP/c21dnh8/05j9pofna30DhqHL
         NHD35+YYbahag==
In-Reply-To: <CAPnjgZ3zndvzBoAdqsW+n7Ao33nEiRr2CXGcBnm_=XDzGmM1_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Nov 8, 2021 at 9:58 AM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi,
>
> On Sun, 7 Nov 2021 at 22:14, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> >
> > On Fri, Nov 05, 2021 at 04:01:38PM -0500, Rob Herring wrote:
> > > On Wed, Nov 4, 2020 at 1:45 PM <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > > >
> > > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > >
> > > > With meson, we have to support out-of-tree build.
> > >
> > > I noticed that meson still builds pylibfdt/libfdt.py and
> > > pylibfdt/libfdt_wrap.c in tree. And it makes the result unusable
> > > without installing. For example the README instructions don't work:
> > >
> > >     $ cd pylibfdt
> > >     $ python3 -c "import libfdt; help(libfdt)"
> > >
> > > I tried to fix the in tree part with swig option '-outdir', but that
> > > didn't work.
> >
> > Urgh.  This has always fit poorly with the rest of the build system.
> > In addition, I've discovered that with Fedora 35, I now get this scary =
warning:
> >
> >          PYMOD pylibfdt/_libfdt.so
> > /usr/lib/python3.10/site-packages/setuptools/dist.py:498: UserWarning: =
The version specified ('1.6.1-g4eda2590-dirty') is an invalid version, this=
 may not work as expected with newer versions of setuptools, pip, and PyPI.=
 Please see PEP 440 for more details.
> >   warnings.warn(
> > make[1]: Leaving directory '/home/dwg/src/dtc'
> >
> > Merely replacing 'distutils' with 'setuptools' in the code does not
> > fix this.
>
> I don't know much about this. Python seems to want to use .' 'instead
> of '-' but I'm not sure why they decided this so recently.

I'm working on patches for both of these issues.

> > > Really what I'm after is what uses need to be supported? I'm looking
> > > at getting pip and pypi packaging to work. I'm actually wondering if
> > > pylibfdt needs to be so tightly coupled to the build system(s!) and
> > > source tree. The dependencies are really just libfdt headers and
> > > library which are easily installed either from source or a distro pkg=
.
> > > The '..libfdt/' references are problematic with the packaging tools.
> > > The easier route may be a standalone repo with a copy of libfdt.i and
> > > a different setup.py.
> >
> > Unfortunately, I don't know enough about either Meson or Python
> > packaging to fix this.  Simon?
>
> I'm not quite sure what the problem is with pip3, etc. I am not an
> expert on any of these but can probably find some help if we have a
> clear problem. Rob, do you have a patch that causes the problem?

Python has certain thoughts on what the directory structure looks like
and building an sdist can't include something outside of pylibfdt/
(the headers specifically). Basically, this is what needs to work
locally for an install from PyPI to work:

./setup.py sdist
pip install -f ./dist/ libfdt

We also need to statically link if we want to create a wheel (python
binary) for PyPI. (setuptools has to be used for a wheel)

> I am not keen on splitting the repos as pylibfdt has a source
> dependency on libfdt.h

Yes, but libfdt.h is part of the ABI and should only change in an ABI
compatible way, right? If you really want the version of libfdt you
built, you do have to install it AFAICT. I don't think the wrapper
will load ../libfdt/libfdt.so.

I think the easiest way to solve these problems is moving setup.py up
to the project root and perhaps dropping the pylibfdt parts from
make/meson. Then working with the python bits all works 'the Python
way'.

Rob
