From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 5/5] build-sys: replace makefiles to wrap meson/ninja
Date: Sat, 19 Jun 2021 19:31:19 +1000
Message-ID: <YM25ZwrpjOMpef5u@yekko>
References: <20201207130055.462734-1-marcandre.lureau@redhat.com>
 <20201207130055.462734-6-marcandre.lureau@redhat.com>
 <YL7p244p81KaDrHz@yekko>
 <CAMxuvaxcwrDiuxKizMjkXZFy6K3X0TSN-Z-=+SNXe53j1pMr1A@mail.gmail.com>
 <YMhBiTc/tEzlnv6j@yekko>
 <CAMxuvaw2GoT-3CrTmBsiR==N2ZV3yJ--5MeN58DPypbJPrkfHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LICrzvFtonmP+NXh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1624095148;
        bh=sKWLlbCVOIN11f2u9tzBwtO47UJPf9rSXcSlCVgycXA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g/jRaQqKmx6QcA/+FAW7IptvBrBFXnnnFrcF7Xa5tHurOfk1NRmGpPB9XsqFJODdf
         i7Vh5PTKtbUkXQyAqoGElp3SN3G4+k1dXa/eRx/9JpsJl73014bUIkn/VWevkqLoZy
         +TpPKjIFZZsH9u77BjYonhuBYlA2pmWp5kmBQW1Y=
Content-Disposition: inline
In-Reply-To: <CAMxuvaw2GoT-3CrTmBsiR==N2ZV3yJ--5MeN58DPypbJPrkfHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--LICrzvFtonmP+NXh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 11:19:39AM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Tue, Jun 15, 2021 at 10:26 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6iEOx6SR5NKn@public.gmane.org=
u>
> wrote:
>=20
> > On Tue, Jun 08, 2021 at 01:25:03PM +0400, Marc-Andr=E9 Lureau wrote:
> > > Hi
> > >
> > > On Tue, Jun 8, 2021 at 7:54 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6ryscVyMRj84@public.gmane.org=
=2Eau
> > >
> > > wrote:
> > >
> > > > On Mon, Dec 07, 2020 at 05:00:55PM +0400, marcandre.lureau@redhat.c=
om
> > > > wrote:
> > > > > From: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > > >
> > > > > This avoids maintaining two build systems, and update the
> > documentation.
> > > > >
> > > > > Makefile now wrap meson, so that make all/check/checkm/clean/inst=
all
> > > > > continue working as they used to.
> > > > >
> > > > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > >
> > > > Sorry I've neglected this so long.  I finally got around to lookup =
up
> > > > a cheatsheet for how to use meson "natively" to understand this
> > > > better.
> > > >
> > > > Couple of issues with this path though:
> > > >
> > > > > ---
> > > > >  Makefile                   | 380
> > ++-----------------------------------
> > > > >  Makefile.convert-dtsv0     |  14 --
> > > > >  Makefile.dtc               |  23 ---
> > > > >  Makefile.utils             |  31 ---
> > > > >  README                     |  24 ++-
> > > > >  libfdt/Makefile.libfdt     |  18 --
> > > > >  pylibfdt/Makefile.pylibfdt |  30 ---
> > > > >  tests/Makefile.tests       | 100 ----------
> > > >
> > > > First, it no longer applies clean due to some added tests.  Can you
> > > > rebase please.
> > > >
> > >
> > > Sure, https://github.com/elmarco/dtc/tree/meson-next
> > >
> > >
> > > > > +checkm:
> > > > > +     WITH_VALGRIND=3D1 meson test -C $(BUILD_DIR) -v
> > > >
> > > > Second, the valgrind stuff doesn't seem to work.  I tried
> > > > "WITH_VALGRIND=3D1 meson test" and it completes much to fast to act=
ually
> > > > be using valgrind.  Also it doesn't give any error if valgrind isn't
> > > > installed.
> > > >
> > >
> > > Oh? I get this:
> > > /home/elmarco/src/dtc/tests/run_tests.sh: line 75: valgrind: command =
not
> > > found
> > >
> > > And when valgrind is installed it uses it and takes ages to complete =
the
> > > tests.
> >
> > Huh.  Yet for me it does not
> >
> > yekko:~/src/dtc/tmp (main)$ time meson test
> > ninja: Entering directory `/home/dwg/src/dtc/tmp'
> > [2/2] Generating pylibfdt with a custom command
> > 1/1 run-test OK             2.67s
> >
> >
> > Ok:                 1
> > Expected Fail:      0
> > Fail:               0
> > Unexpected Pass:    0
> > Skipped:            0
> > Timeout:            0
> >
> > Full log written to /home/dwg/src/dtc/tmp/meson-logs/testlog.txt
> >
> > real    0m3.015s
> > user    0m1.862s
> > sys     0m1.197s
> > yekko:~/src/dtc/tmp (main)$ time env WITH_VALGRIND=3D1 meson test
> > ninja: Entering directory `/home/dwg/src/dtc/tmp'
> > [2/2] Generating pylibfdt with a custom command
> > 1/1 run-test OK             2.47s
> >
> >
> > Ok:                 1
> > Expected Fail:      0
> > Fail:               0
> > Unexpected Pass:    0
> > Skipped:            0
> > Timeout:            0
> >
> > Full log written to /home/dwg/src/dtc/tmp/meson-logs/testlog.txt
> >
> > real    0m2.836s
> > user    0m1.838s
> > sys     0m1.163s
> >
> >
> > I have no idea how to debug that...
> >
> >
> What's your version of meson? There has been an environment-related
> regression in 0.58 that was quickly fixed in 0.58.1. (I tried older
> versions as well when I wrote the patch last year)

meson-0.56.2-2.fc34.noarch
ninja-build-1.10.2-2.fc34.x86_64

> You could check your environment by adding an "env" call at the top of
> run_tests.sh and checking it in build/meson-logs/testlog.txt

Tried that, and it showed the WITH_VALGRIND value.  I'm not actually
sure what's supposed to be acting on the WITH_VALGRIND variable.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LICrzvFtonmP+NXh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDNuWcACgkQbDjKyiDZ
s5LdKQ//Q0oetSEJR5Yew5cBuqTheRRABDJ5FMI4r/NhM62EWDrajyn/bL5Ssa0O
ErNujnJr491mY6sW9S4Ll7bwta0mJwtUT09gtwcar8OFNVTPMP0NxzuXwblRV+0P
Z8UfoTRpdHY6tbML6tyn1TNs1XBccBrkjAT2ppVVP303O9erx9MPA6vc0Bxj8/k3
m4eidQsE4pMiJhVZthWABCyh7rAND6vm0l3nbyedPWODNklLVgs3zjzHVgqWHd2m
bRwnWqC7ZgSbIIDUh1F5n6H+QL7vMpPXOirG2XPDjcgkf9xQ0MgVdD99sWlVztF2
lAVWUA7sVV+70wAKeSrz+aUiEKPLCnLqGYEWRpmgsqfcQiBc4kP3UBGePAk8dFgM
HuLbWS57b+iB4IojjffqcxmgzdxPiWLUGJ6N9lU9Mm7PW1qJcVpafHZRXgqgk4Y2
4VPKZQ+d/BsYt3pFVOTkbZjLBY4sz8iT+FU5tvuhjQ4klQymUm8gW1YhdovJYW/Y
7gmPCu676t5ZHpAeYDuncAm1zIg/TCfyDO3+uYbCgNSbLD+aAhGKB2TolgiDz+Gk
5PNdgTV90jDsbaTbsf9EVRuDmT9Im9KNShRv1r4OtatgoFtKcbo0MItdM66QXNSl
OAWiUFKOHGOabzgj6bh/9u42r3fumlNcTymbXdPDBFWYMmVyUR8=
=h+4s
-----END PGP SIGNATURE-----

--LICrzvFtonmP+NXh--
