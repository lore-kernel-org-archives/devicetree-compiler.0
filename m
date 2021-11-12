From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] Improve pylibfdt python packaging
Date: Thu, 11 Nov 2021 22:01:55 -0600
Message-ID: <CAL_JsqLuUMH16mow8bmYiPB60Cbci1cN_RhV3npYSqQzPhp97A@mail.gmail.com>
References: <20211111011135.2386773-1-robh@kernel.org> <YYyQ747Z6EeGIg0s@yekko>
 <CAL_JsqJ1gSzVH1OYU6kPCYDfg32j8whCKaOmo2VU8hsUFsJZuQ@mail.gmail.com> <YY3Uw3xLCd5dHqoP@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636689729;
        bh=Jk1/vusxUfyLhTG1kOKZE/YKr6C3sAspBpKipHQhh4k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=doyWA5uB/fY3Mi9iRLQ1ImE8krNUyXYIhcFlnotg9kBJ1ZtQtrhJc75LiWFv+wZQc
         ZZnPWgKjlCM3ZCMtUTLA3ecWSczIeV9ZxwMqbwLdf7CEdvGEODTco3i8rYbRiBTy2x
         fjDUpGYcm+forq+B9XOvPKhrsOlaK9TucRNc5NluDOBen2/7SSKHuaAk0fihl+sAZM
         xFsdV8Pb36uilS9vb3NbfTN0s9Yyw3Hstj9g4MUaUnYfxQC5+yvuwVjZH0os8GMAIL
         V20xV6rSioc2qvdn+m6BuPb6JdTsIFB5+lgVbWi8IXiBIYHKwnBvBfsmga/nXcLWYc
         asoPMtzfdjGjQ==
In-Reply-To: <YY3Uw3xLCd5dHqoP@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

On Thu, Nov 11, 2021 at 8:43 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Thu, Nov 11, 2021 at 08:08:08AM -0600, Rob Herring wrote:
> > On Wed, Nov 10, 2021 at 9:41 PM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Wed, Nov 10, 2021 at 07:11:31PM -0600, Rob Herring wrote:
> > > > I'm interested in getting pylibfdt into PyPI and ran into a few iss=
ues
> > > > with pylibfdt using the python packaging tools. Primarily, pip didn=
't
> > > > work nor did setup.py sdist and bdist_wheel subcommands. This serie=
s
> > > > fixes those issues.
> > > >
> > > > I've left meson calling setup.py intact for now, but think it's the
> > > > wrong way around. In fact, there's actually some efforts to make me=
son
> > > > the backend for pip/setuptools. I made several attempts to complete=
ly
> > > > eliminate putting files in the source tree without success. Also, I
> > > > noticed a meson install builds pylibfdt twice (though make may too)=
.
> > > >
> > > > I don't think I broke anything. Tests and installs both work with m=
ake
> > > > and meson.
> > >
> > > Applied, it certainly looks better to me.
> > >
> > > However, I've just spotted another nasty problem.  I think it must
> > > have started with moving to Fedora 35 on my laptop.  A bunch of the
> > > Python tests now fail like this:
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > ERROR: testGetIntProperties (__main__.PyLibfdtBasicTests)
> > > Test that we can access properties as integers
> > > ---------------------------------------------------------------------=
-
> > > SystemError: PY_SSIZE_T_CLEAN macro must be defined for '#' formats
> > >
> > > The above exception was the direct cause of the following exception:
> > >
> > > Traceback (most recent call last):
> > >   File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 378, in te=
stGetIntProperties
> > >     self.assertEqual(0xdeadbeef, self.get_prop("prop-hex32").as_uint3=
2())
> > >   File "/home/dwg/src/dtc/tests/./pylibfdt_tests.py", line 374, in ge=
t_prop
> > >     return self.fdt2.getprop(0, name)
> > >   File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 451, in =
getprop
> > >     pdata =3D check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_=
name),
> > >   File "/home/dwg/src/dtc/tests/../pylibfdt/libfdt.py", line 1279, in=
 fdt_getprop
> > >     return _libfdt.fdt_getprop(fdt, nodeoffset, name)
> > > SystemError: <built-in function fdt_getprop> returned a result with a=
n exception set
> > >
> > > Any ideas?
> >
> > Python 3.10? Only guessing because I'm on 3.9. Otherwise, I have no clu=
e.
>
> It appears so; I've now merged Ross Burton's fix.
>
> > I was going to look at making '.setup.py test' work as testing is
> > intertwined with meson too. Most python CI testing runs against a
> > matrix of python versions which would help here.
> >
> > > Also, Rob, did you have patches to finish the conversion of the
> > > Makefiles to wrappers around meson?
> >
> > That was Marc-Andr=C3=A9...
>
> Oops, sorry, I got confused.
>
> > > If so, I'm sorry I've lost track
> > > of them.  Can you repost please?
> >
> > One of the issues you had with Travis CI. Are you still using Travis
> > CI after their move? I found it easier to just move to GH workflows
> > than move given I always seem to hit login token issues (maybe that's
> > just group projects with multiple users).
>
> It stopped working after the move, and I haven't looked into what
> would be needed to make it go again.  I was actually thinking I'd move
> over to GitLan - I'm more familiar with its CI stuff from qemu, and I
> like what I've seen.  I haven't actually had a chance to do anything
> on that front, though.

I'm assuming you mean GitLab. I'm using both. The DT spec and dtschema
test/pkging are using workflows. Schema validation runs with the
kernel tree are on GitLab (which actually run in docker on my
machines).

GH workflows have recipes (written by random folks) to do various
things like python version matrix testing or upload to pypi whereas
GitLab is more 'here's a container'. dtc could go either way I think.

Rob
