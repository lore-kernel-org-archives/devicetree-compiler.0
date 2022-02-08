From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] pylibfdt: Compile and build libfdt directly into shim library
Date: Tue, 8 Feb 2022 10:00:36 -0600
Message-ID: <CAL_JsqJ6WR=+VpcfVZn+=J_-AU6Xs7QGsKdWAjSW4u19e54Vdw@mail.gmail.com>
References: <20220203180408.611645-1-robh@kernel.org> <20220203180408.611645-3-robh@kernel.org>
 <YgIE2ImH9GjFEVa/@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644336050;
        bh=15pAh/NHPv8ykFb2AANzGNpH2E4eRClxQ98Y38GtYAg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K558I33aTDpb6u+Seipg1bu3mZXxVJ0hNOfOj/GHprGO6oFlkiJOGnYDpybFaoYcE
         L+P+PGrmOqpEKpLEHwogChaGZpTo+GgaMiz2MmdEo6ZJfqRKDR5Jj755ZKDVs4upyC
         HpBGPUWPiMmhf3coYXhfOsdLWSJWe2vKMlEyzbGH3LF4L+nrVd1oAMI6h5s4dxoD3e
         jzwtLQZ1Z1TkKOn/uN7XhENMC8asALPjheXCODJOTdcU4o3arbDZY71vx4ofvT0F9j
         Vznk6j9wIk6PytyqHX1rhw4EJc7ROl4j8Np5iU0XBwaPcqP7/FXloFvXCwQpXo8TTf
         VZB13FBnZozzw==
In-Reply-To: <YgIE2ImH9GjFEVa/@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hector Oron <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Natanael Copa <ncopa-Tvuechaw34bCfDggNXIi3w@public.gmane.org>

On Tue, Feb 8, 2022 at 12:01 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Thu, Feb 03, 2022 at 12:04:08PM -0600, Rob Herring wrote:
> > The interactions between pylibfdt setup.py and the host and build syste=
m
> > is fragile. setup.py can be called directly or via pip, tox, pytest, et=
c.
> > Building the SWIG shim library needs the libfdt headers and library .so
> > file. These can be located in the source tree, the OOT build directory,
> > or several locations in the host filesystem if installed.
>
> Right.  I do believe that if feasible we should only support building
> from the main dtc tree, and therefore only using the files from that
> tree, not anywhere else on the host system.
>
> > Furthermore, the SWIG shim library is tightly coupled to the version of
> > libfdt it is built against. Specifically, all functions defined in the
> > libfdt.h header used for the build must resolve at runtime whether they
> > are used or not. IOW, the installed libfdt must be the same version (or
> > newer?) than what pylibfdt was built against.
>
> I believe "or newer" should be safe, at least assuming we don't badly
> screw up the symbol versioning.  That's a pretty significant
> difference from "must be the same version".

The problem is I think the more common scenario is the installed
version being older as the distro version is likely older.

> > The typical way to solve this problem would be to allow user provided
> > library and include directories, but this doesn't seem to work too well
> > with setup.py. While setup.py sub-commands can take such options, it
> > doesn't work with implicit commands (e.g. an 'install' triggers 'build'=
)
> > or pip.
> >
> > The simplest solution to all this is just build libfdt into the shim
> > library. This avoids any possibility of version mismatches. The python
> > setuptools already knows how to compile C files in extensions, we just =
need
> > to list the files.
>
> Urgh.  I don't love having what's essentially a different way of
> building the code than the existing make or meson stuff.

There's not really any avoiding it. setuptools is doing some portion
of the build no matter what. Currently, that's just the wrapper code.
This patch adds building libfdt using that same infrastructure.

> > Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Cc: Hector Oron <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> > Cc: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > Cc: Natanael Copa <ncopa-Tvuechaw34bCfDggNXIi3w@public.gmane.org>
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> > RFC because this leaves the meson integration broken and I suspect the
> > distro folks (Cc'ed here) won't really like duplicating libfdt. Note th=
at
> > the 'shim' alone is about 3x the size of libfdt.
>
> No, they probably won't.  Note that the primary reason that distro
> folks like to re-use shared libraries as much as possible isn't about
> size, it's about ease of deploying updates (including for security).

No comments from anyone else, so I take that as agreement with this patch. =
:(

> Then again, they're probably having to get used to the harder case
> these days, due to Go's static linking fetish.
>
> > IMO, the meson wrapper should just be removed. Python users know how to
> > run setup.py or pip. Why add a layer of indirection?
>
> I'm not exactly sure what you're considering the "meson wrapper".

Calling meson/make to run setup.py.

> Note that from my point of view anything which means that doing a full
> build and test from scratch would require more than a single make or
> meson command is pretty much unacceptable.

Those aren't mutually exclusive. I assume you agree supporting the
'normal' python tools and usage is worthwhile and required?

With this patch plus my test changes, it would be 2 commands:

make check
pytest (or 'tox' if you want to do python version matrix testing)

or 3:
meson build/
meson test -C build/
pytest


The primary issue here is that the python tools are designed to run
from the setup.py directory and meson wants something different. The
current support to use the meson build directory is incomplete. After
a 'meson compile', the tree is dirty with:

pylibfdt/libfdt.py
pylibfdt/libfdt_wrap.c

And then after 'meson test' we have:

        pylibfdt/__pycache__/
        pylibfdt/libfdt.py
        pylibfdt/libfdt_wrap.c
        tests/bad-chosen.dts.test.dtb
        tests/bad-dma-ranges.dts.test.dtb
        tests/bad-empty-ranges.dts.test.dtb
        tests/bad-gpio.dts.test.dtb
        tests/bad-graph.dts.test.dtb
        tests/bad-interrupt-cells.dts.test.dtb
        tests/bad-interrupt-controller.dts.test.dtb
        tests/bad-interrupt-map-mask.dts.test.dtb
        tests/bad-interrupt-map-parent.dts.test.dtb
        tests/bad-interrupt-map.dts.test.dtb
        tests/bad-name-property.dts.test.dtb
        tests/bad-ncells.dts.test.dtb
        tests/bad-phandle-cells.dts.test.dtb
        tests/bad-reg-ranges.dts.test.dtb
        tests/bad-string-props.dts.test.dtb
        tests/default-addr-size.dts.test.dtb
        tests/dup-nodename.dts.test.dtb
        tests/dup-phandle.dts.test.dtb
        tests/dup-propname.dts.test.dtb
        tests/good-gpio.dts.test.dtb
        tests/minusone-phandle.dts.test.dtb
        tests/obsolete-chosen-interrupt-controller.dts.test.dtb
        tests/pci-bridge-bad1.dts.test.dtb
        tests/pci-bridge-bad2.dts.test.dtb
        tests/pci-bridge-ok.dts.test.dtb
        tests/reg-ranges-root.dts.test.dtb
        tests/reg-without-unit-addr.dts.test.dtb
        tests/unit-addr-leading-0s.dts.test.dtb
        tests/unit-addr-leading-0x.dts.test.dtb
        tests/unit-addr-simple-bus-compatible.dts.test.dtb
        tests/unit-addr-simple-bus-reg-mismatch.dts.test.dtb
        tests/unit-addr-unique.dts.test.dtb
        tests/unit-addr-without-reg.dts.test.dtb
        tests/zero-phandle.dts.test.dtb

(This was a tree before all my recent pylibfdt changes just to make
sure it wasn't something I broke)

While you'd think it would be trivial to move these to a build dir,
I've spent days on this and haven't come up with a clean way of doing
that. Even if we did, then the next python tool you want to integrate
in is still broken (pip, pytest, tox, etc. for example). I'm sure
continuing down this path is asking for more pain. I'm not a python
expert, but in my limited experience in python projects it's easier to
conform to the python way than burning cycles trying to do something
different.

I'm fine keeping a meson wrapper if that's really a requirement, but
it's got to give up the notion of the python portions working OOT.

Rob
