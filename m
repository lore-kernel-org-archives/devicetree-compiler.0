From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 5/5] build-sys: replace makefiles to wrap meson/ninja
Date: Tue, 15 Jun 2021 15:58:33 +1000
Message-ID: <YMhBiTc/tEzlnv6j@yekko>
References: <20201207130055.462734-1-marcandre.lureau@redhat.com>
 <20201207130055.462734-6-marcandre.lureau@redhat.com>
 <YL7p244p81KaDrHz@yekko>
 <CAMxuvaxcwrDiuxKizMjkXZFy6K3X0TSN-Z-=+SNXe53j1pMr1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uWY+zDDBhAUeX2G+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623738358;
        bh=llyTj/l7YdgXydlSXIEgj3E8YH2PbPi5O8WjneB0uwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RxsvFfekmgYrKGcQgMR3fbYruCAUrfHe89P7ry7mRxEVDGZ0L2v1FG0hrfs3pkWI9
         WdM521fwwcv4dT6yecspKc/JbyS3BDO77J+qJqZ8Z42eF0W7i2Kb2YgJJI31t+x2Mk
         vkSAvFBms88hhvxhyUnfNke/tYUjHUl3fEg2WWBQ=
Content-Disposition: inline
In-Reply-To: <CAMxuvaxcwrDiuxKizMjkXZFy6K3X0TSN-Z-=+SNXe53j1pMr1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--uWY+zDDBhAUeX2G+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 01:25:03PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Tue, Jun 8, 2021 at 7:54 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> wrote:
>=20
> > On Mon, Dec 07, 2020 at 05:00:55PM +0400, marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
> > wrote:
> > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >
> > > This avoids maintaining two build systems, and update the documentati=
on.
> > >
> > > Makefile now wrap meson, so that make all/check/checkm/clean/install
> > > continue working as they used to.
> > >
> > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > Sorry I've neglected this so long.  I finally got around to lookup up
> > a cheatsheet for how to use meson "natively" to understand this
> > better.
> >
> > Couple of issues with this path though:
> >
> > > ---
> > >  Makefile                   | 380 ++---------------------------------=
--
> > >  Makefile.convert-dtsv0     |  14 --
> > >  Makefile.dtc               |  23 ---
> > >  Makefile.utils             |  31 ---
> > >  README                     |  24 ++-
> > >  libfdt/Makefile.libfdt     |  18 --
> > >  pylibfdt/Makefile.pylibfdt |  30 ---
> > >  tests/Makefile.tests       | 100 ----------
> >
> > First, it no longer applies clean due to some added tests.  Can you
> > rebase please.
> >
>=20
> Sure, https://github.com/elmarco/dtc/tree/meson-next
>=20
>=20
> > > +checkm:
> > > +     WITH_VALGRIND=3D1 meson test -C $(BUILD_DIR) -v
> >
> > Second, the valgrind stuff doesn't seem to work.  I tried
> > "WITH_VALGRIND=3D1 meson test" and it completes much to fast to actually
> > be using valgrind.  Also it doesn't give any error if valgrind isn't
> > installed.
> >
>=20
> Oh? I get this:
> /home/elmarco/src/dtc/tests/run_tests.sh: line 75: valgrind: command not
> found
>=20
> And when valgrind is installed it uses it and takes ages to complete the
> tests.

Huh.  Yet for me it does not

yekko:~/src/dtc/tmp (main)$ time meson test
ninja: Entering directory `/home/dwg/src/dtc/tmp'
[2/2] Generating pylibfdt with a custom command
1/1 run-test OK             2.67s


Ok:                 1  =20
Expected Fail:      0  =20
Fail:               0  =20
Unexpected Pass:    0  =20
Skipped:            0  =20
Timeout:            0  =20

Full log written to /home/dwg/src/dtc/tmp/meson-logs/testlog.txt

real	0m3.015s
user	0m1.862s
sys	0m1.197s
yekko:~/src/dtc/tmp (main)$ time env WITH_VALGRIND=3D1 meson test
ninja: Entering directory `/home/dwg/src/dtc/tmp'
[2/2] Generating pylibfdt with a custom command
1/1 run-test OK             2.47s


Ok:                 1  =20
Expected Fail:      0  =20
Fail:               0  =20
Unexpected Pass:    0  =20
Skipped:            0  =20
Timeout:            0  =20

Full log written to /home/dwg/src/dtc/tmp/meson-logs/testlog.txt

real	0m2.836s
user	0m1.838s
sys	0m1.163s


I have no idea how to debug that...

> > It's also not ideal that the output from "meson test" is trivial with
> > all the content now in the meson log file.  Assuming we can sort out
> > this first part, would you be willing to help convert the existing
> > testsuite / testrunner to be more "meson native" so we can improve
> > that?
> >
>=20
> Certainly, I can eventually take a look when I have time, or help anybody
> in this task.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uWY+zDDBhAUeX2G+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIQYkACgkQbDjKyiDZ
s5KVFRAAoohLb03jN2nHGpDFca4WFHqrgp9azO0T7Iq9WiWG67cbDoBeeA6RDD7I
+0hatpsXirDh19qLV9kSZ5Vc0brPAqUvxZy7FG231Nr60ZFDvFhFTeMgAqdqLUwn
1fvgS4Ts/JFhb5gGIVw7CJsi/BeT+OynADwjbOYxnG+S0uDjsEpClekLYePuMhgo
XK0g2y0fu7YZYMyZZiY/TCLhMl3e5WRLsAbVTHAMUFtl4/eF0tsLu+MqclDSxlY3
Et4Khf26Eu6zjTmWgBDK/EwPP0k1i5dqtf5BOgiH7DZmQDWPJXeVn+qMCfWGc/UZ
2ftRJBCZOsdMCgp2qvHnfQphWJcJSlzFuLFC/XvUZgXpNWr+x8QIlboU/HJou7hq
7MBTnE8Sm/esFtiCMct51nmnNarJHa0zP7EC/bcQIXG8srrIhzW7o8ihlzWUm1KD
oV9A0cSULnEfoi7pruDfozBYqc6y4TXQvxWs4dNuyMKGz9GnKqj21VYKj8Ngg6tt
bv2dpodhuoo4SAkpq0S+rbxHO/lT9MHTurVE/t2jDLzdp9OBVSzPAmaUbOhy1awI
3cEvmQs8HOKAJkowxqI1+Q0tNDXR128y0UVul8q7ISYM1aayCTFzjC0RzA9FUJ1I
kozsFnozMlKQJgfRSbVM+ZuBMlZVXZI9opwEbZ34k0aaMC7zHTo=
=rkLw
-----END PGP SIGNATURE-----

--uWY+zDDBhAUeX2G+--
