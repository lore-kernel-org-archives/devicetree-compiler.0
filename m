From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 0/4] Switch to meson build system
Date: Fri, 4 Dec 2020 11:37:22 +1100
Message-ID: <20201204003722.GB268585@yekko.fritz.box>
References: <20201104194527.986901-1-marcandre.lureau@redhat.com>
 <CAMxuvazBvmGo+SXREbzq3Yp3=CYbW8B9M67P5oS1ttdJBwRQfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1607042256;
        bh=0/VGR3biw7ENp8RRlTInXwjmuIQwOaKUMCquD/2tRBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LAGGAd90ATnsAp5Dkt+xCsHRJU+m4UcHgsixod8aF2B44ljJ25y2P3zKtWO2Y1o3/
         bwVYr7gAu8rGIdhIPiLmXuAQTpKZymvWLDelaneJwm/hEyFUItU5GfX7k8yPD9TwvF
         fzotytQpes//ld40rnkejRGIYWK/cplHeeyXhMgk=
Content-Disposition: inline
In-Reply-To: <CAMxuvazBvmGo+SXREbzq3Yp3=CYbW8B9M67P5oS1ttdJBwRQfA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2020 at 04:39:00PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi David,
>=20
> On Wed, Nov 4, 2020 at 11:45 PM <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > Hi
> >
> > This series switches the build system to meson. The main reason for thi=
s, bes=3D
> > ide
> > using a more modern and simpler build system, is to enable subproject()=
 suppo=3D
> > rt
> > in QEMU (atm, QEMU embedds a minimal meson build itself).
> >
> > v6:
> >  - add "build-sys: replace makefiles to wrap meson/ninja", addressing
> >    concerns about meson usage, and replacing the old build system.
> >  - a few minor fixes to meson.build files (warnings and such)
> >
> > v5:
> >  - squashed --build-lib change with "pylibfdt: allow build out of tree"
> >    as the two are actually related
>=20
> >
> > v4:
> >  - made setup.py --top-builddir option default to CWD
> >  - extend commit messages
> >  - rebased
>=20
> Apparently you committed some patches from v4. Was this intentional?

Uh, no, not really - I probably missed the newer versions at the time.

They're in the non-rebasing tree now, so you'll need to rebase
whatever updates where in v6 on top of those, sorry.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/JhMIACgkQbDjKyiDZ
s5JPwg/44dXuFrnjj5vu30OFztJ/lqoohi3o/kqt1aD1hlkBT7uu/p+DvFvpg1G9
7DwWYZ8+HxcMqXgYy8NM6IG7ts9pcXzrfvezla9qqvwfu8dY9B5/CSRPJrZnorYG
BvYIDoiXIcuyvBjG3Quy/C+6f4Zy0inaufuD/Nua3RLR4Ktiywg57xguoTdMSglo
ADjVRXJtN7iNudsYQeXyKUefU/CXmNi4kpovjBdlgybgb36LXhvcrl+ZD/mhSNKk
nzhRp9OdPyzQ+KRa0nhZkCkf1HxbP+aCCJlJo+++OdAPaIvhkAaWGsSHV9QDG4cV
ymT16PYnnhJ0I5UfNwADvrPJZBfTkvoV5izn4ZXMsffiSGMGypakVbt5D+wvlrbx
VDswvSsjeHLbdZX1SWBdhALmbx4lUZJXE5AlXIpZDJ5PVgECYz38gp9UwdQrS+Cz
+gnIdDy0ccEPKKcSJ+0Vpygiu123u0qkRUWUh1MqEvO1esJegTX4GPkvorH/tyih
5TbvVuvEt4BCYpAiT+7kHX9UdDgNzIJXcL0V/K01osYOEGY9skR/xS0/v6OG3/Ee
Wp9owHhfOBFoS5vloW292d/cmS5K1gPe8PJNamTrFfjEN/gSTzIMZVbs74UmzN0X
k8ImWl9QQ35BE0od/zU+qqTDg9dTB9mOVtgBXQXqbht3bJs1Zw==
=ydHp
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
