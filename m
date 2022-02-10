From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] pylibfdt: Compile and build libfdt directly into
 shim library
Date: Thu, 10 Feb 2022 15:31:07 +1100
Message-ID: <YgSVCyXtFym11wEq@yekko>
References: <20220203180408.611645-1-robh@kernel.org>
 <20220203180408.611645-3-robh@kernel.org>
 <YgIE2ImH9GjFEVa/@yekko>
 <CAL_JsqJ6WR=+VpcfVZn+=J_-AU6Xs7QGsKdWAjSW4u19e54Vdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ox8NOlbB8RBdRrKS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1644470374;
        bh=qSTYuJaAXHxqSADfI7zK30KH0IGXRhJZ1waTpG7PVtE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E8yLnMTN0C/I+95G1lIZPD0pfnrQ+RjFJqfJ77AR9029xCrq3gF2MO2v9WGR69FAn
         RASEAaLXj/dchLU3plopGwRpoUjDrt6gwQ6kNM7r9R5X7NxZhH3vgg/KBr3CXI/psX
         NzyQ0CaQ4TWSvN6f+69/XXPyxsBEX0jWT1opOYjc=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ6WR=+VpcfVZn+=J_-AU6Xs7QGsKdWAjSW4u19e54Vdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hector Oron <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Natanael Copa <ncopa-Tvuechaw34bCfDggNXIi3w@public.gmane.org>


--Ox8NOlbB8RBdRrKS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 10:00:36AM -0600, Rob Herring wrote:
> On Tue, Feb 8, 2022 at 12:01 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Thu, Feb 03, 2022 at 12:04:08PM -0600, Rob Herring wrote:
> > > The interactions between pylibfdt setup.py and the host and build sys=
tem
> > > is fragile. setup.py can be called directly or via pip, tox, pytest, =
etc.
> > > Building the SWIG shim library needs the libfdt headers and library .=
so
> > > file. These can be located in the source tree, the OOT build director=
y,
> > > or several locations in the host filesystem if installed.
> >
> > Right.  I do believe that if feasible we should only support building
> > from the main dtc tree, and therefore only using the files from that
> > tree, not anywhere else on the host system.
> >
> > > Furthermore, the SWIG shim library is tightly coupled to the version =
of
> > > libfdt it is built against. Specifically, all functions defined in the
> > > libfdt.h header used for the build must resolve at runtime whether th=
ey
> > > are used or not. IOW, the installed libfdt must be the same version (=
or
> > > newer?) than what pylibfdt was built against.
> >
> > I believe "or newer" should be safe, at least assuming we don't badly
> > screw up the symbol versioning.  That's a pretty significant
> > difference from "must be the same version".
>=20
> The problem is I think the more common scenario is the installed
> version being older as the distro version is likely older.

I suppose that would be the case if you're trying to install the
python stuff alone.  I guess this is the pip case?  AFAICT it wouldn't
arise if installing the python stuff from distro packages, nor if
installing everything, including the python packages, from the dtc
source tree.

> > > The typical way to solve this problem would be to allow user provided
> > > library and include directories, but this doesn't seem to work too we=
ll
> > > with setup.py. While setup.py sub-commands can take such options, it
> > > doesn't work with implicit commands (e.g. an 'install' triggers 'buil=
d')
> > > or pip.
> > >
> > > The simplest solution to all this is just build libfdt into the shim
> > > library. This avoids any possibility of version mismatches. The python
> > > setuptools already knows how to compile C files in extensions, we jus=
t need
> > > to list the files.
> >
> > Urgh.  I don't love having what's essentially a different way of
> > building the code than the existing make or meson stuff.
>=20
> There's not really any avoiding it. setuptools is doing some portion
> of the build no matter what. Currently, that's just the wrapper code.
> This patch adds building libfdt using that same infrastructure.

That's not quite the same thing.  At the moment the wrapper code is
only ever built via setuptools.  With the proposed change the same
code is being routinely built by two different build systems.
Well... three I guess, while we have both make and meson support.

> > > Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > Cc: Hector Oron <zumbi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> > > Cc: Peter Robinson <pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > Cc: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > Cc: Natanael Copa <ncopa-Tvuechaw34bCfDggNXIi3w@public.gmane.org>
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > ---
> > > RFC because this leaves the meson integration broken and I suspect the
> > > distro folks (Cc'ed here) won't really like duplicating libfdt. Note =
that
> > > the 'shim' alone is about 3x the size of libfdt.
> >
> > No, they probably won't.  Note that the primary reason that distro
> > folks like to re-use shared libraries as much as possible isn't about
> > size, it's about ease of deploying updates (including for security).
>=20
> No comments from anyone else, so I take that as agreement with this patch=
=2E :(

Um.. I don't follow.

> > Then again, they're probably having to get used to the harder case
> > these days, due to Go's static linking fetish.
> >
> > > IMO, the meson wrapper should just be removed. Python users know how =
to
> > > run setup.py or pip. Why add a layer of indirection?
> >
> > I'm not exactly sure what you're considering the "meson wrapper".
>=20
> Calling meson/make to run setup.py.
>=20
> > Note that from my point of view anything which means that doing a full
> > build and test from scratch would require more than a single make or
> > meson command is pretty much unacceptable.
>=20
> Those aren't mutually exclusive.

I'm confused.  You say these aren't mutually exclusive, then give an
example that does exactly what I said I didn't want.

> I assume you agree supporting the
> 'normal' python tools and usage is worthwhile and required?

That's certainly a goal, yes.

> With this patch plus my test changes, it would be 2 commands:
>=20
> make check
> pytest (or 'tox' if you want to do python version matrix testing)

Yeah, that's what I don't want.  I want *one* command to do
everything.  dtc, libfdt, pylibfdt, the extra tools, everything.  I
guess two (setup, then build) with meson - I already don't love that
about meson.

The fact that you already point out two options (pytest or tox) for
the extra commands underlines the problem: it now requires python
specific knowledge to know how to do a full build/test.

> or 3:
> meson build/
> meson test -C build/
> pytest
>=20
>=20
> The primary issue here is that the python tools are designed to run
> from the setup.py directory and meson wants something different. The
> current support to use the meson build directory is incomplete. After
> a 'meson compile', the tree is dirty with:
>=20
> pylibfdt/libfdt.py
> pylibfdt/libfdt_wrap.c

Yeah, that's certainly breaking the meson model.

> And then after 'meson test' we have:
>=20
>         pylibfdt/__pycache__/
>         pylibfdt/libfdt.py
>         pylibfdt/libfdt_wrap.c
>         tests/bad-chosen.dts.test.dtb
>         tests/bad-dma-ranges.dts.test.dtb
>         tests/bad-empty-ranges.dts.test.dtb
>         tests/bad-gpio.dts.test.dtb
>         tests/bad-graph.dts.test.dtb
>         tests/bad-interrupt-cells.dts.test.dtb
>         tests/bad-interrupt-controller.dts.test.dtb
>         tests/bad-interrupt-map-mask.dts.test.dtb
>         tests/bad-interrupt-map-parent.dts.test.dtb
>         tests/bad-interrupt-map.dts.test.dtb
>         tests/bad-name-property.dts.test.dtb
>         tests/bad-ncells.dts.test.dtb
>         tests/bad-phandle-cells.dts.test.dtb
>         tests/bad-reg-ranges.dts.test.dtb
>         tests/bad-string-props.dts.test.dtb
>         tests/default-addr-size.dts.test.dtb
>         tests/dup-nodename.dts.test.dtb
>         tests/dup-phandle.dts.test.dtb
>         tests/dup-propname.dts.test.dtb
>         tests/good-gpio.dts.test.dtb
>         tests/minusone-phandle.dts.test.dtb
>         tests/obsolete-chosen-interrupt-controller.dts.test.dtb
>         tests/pci-bridge-bad1.dts.test.dtb
>         tests/pci-bridge-bad2.dts.test.dtb
>         tests/pci-bridge-ok.dts.test.dtb
>         tests/reg-ranges-root.dts.test.dtb
>         tests/reg-without-unit-addr.dts.test.dtb
>         tests/unit-addr-leading-0s.dts.test.dtb
>         tests/unit-addr-leading-0x.dts.test.dtb
>         tests/unit-addr-simple-bus-compatible.dts.test.dtb
>         tests/unit-addr-simple-bus-reg-mismatch.dts.test.dtb
>         tests/unit-addr-unique.dts.test.dtb
>         tests/unit-addr-without-reg.dts.test.dtb
>         tests/zero-phandle.dts.test.dtb
>=20
> (This was a tree before all my recent pylibfdt changes just to make
> sure it wasn't something I broke)
>=20
> While you'd think it would be trivial to move these to a build dir,
> I've spent days on this and haven't come up with a clean way of doing
> that. Even if we did, then the next python tool you want to integrate
> in is still broken (pip, pytest, tox, etc. for example). I'm sure
> continuing down this path is asking for more pain. I'm not a python
> expert, but in my limited experience in python projects it's easier to
> conform to the python way than burning cycles trying to do something
> different.

Could we fake it the other way around: have the meson stuff copy all
the sources into meson's build dir, then run the Python stuff locally
within the build dir.  Still ugly, but less bad than simply breaking
meson's base assumptions.

> I'm fine keeping a meson wrapper if that's really a requirement, but
> it's got to give up the notion of the python portions working OOT.
>=20
> Rob
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ox8NOlbB8RBdRrKS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIElQQACgkQgypY4gEw
YSKWmQ//RAMCkiHINrFwBU8LzQwbZUH93rjDJNkXq8Hq+0fbSrc8TSa4mYSW+dz5
S4Fcq/sOen1WjTX7BTZTOI2gclmp8UCbZAPXUsxobK38TVrmv/SX2XkETWllBVbj
K9uKSf6R/9GMwDdIWd50soMM3dFFHZeyUkUeubmP/bgnnB0p+dN9KCfMzIJmRiC9
/eSJVk8IUe3V/HlleisHtdzMgspKvjWh7/1vB9jtmswL3fc0JtQOyr2N/EepMNvH
9pfVJKu/8uaHqFU4dysAPZwkG3THivGhHSGeJyIESlCoFJ5/WmQDP0IRW4O1e+n2
48YMOl/LDIm9JZV8S9XMnWU1PN4qSFuLELVQyPs+4ImZR5hZut7ThSlCDxyHp/Sj
Y6R0VidckAznwAWDqg2MAFvTdiWsUQp600Ktk6wjnVCe9++qb1MraAm01UtZkoZV
0gMTw6O+2Y4pfA9fdkYFdlzeYgF4cRTCAu5iAd+aedztj69IqAJoUmDllJkitPTT
URFACl+RrabtPb+9E8GJhsEF9XSD6BQCx4UROnKWimiHJtKRSIzdSE1CkwmsESkY
IMp+ou8RUnGQUk6cguo2RIVtyp9uxyleErjwVwwOwXKrBlXXDmJ7O2rnrURazCoP
tOIpeECdPpx9VTGayCC91uVGOGUTCErUVRFEgpwrgcVKfjQkssU=
=itjm
-----END PGP SIGNATURE-----

--Ox8NOlbB8RBdRrKS--
