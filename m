From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 03/12] libfdt: Safer access to strings section
Date: Thu, 12 Apr 2018 14:01:05 +1000
Message-ID: <20180412040105.GG9425@umbus.fritz.box>
References: <20180325232523.13469-1-david@gibson.dropbear.id.au>
 <20180325232523.13469-4-david@gibson.dropbear.id.au>
 <CAPnjgZ299ffKgtojTGaV+2EigUAT8ediyCSWk2xoxr2sAjeyog@mail.gmail.com>
 <20180403150224.GD1984@umbus.fritz.box>
 <CAPnjgZ3vEkx6zJY9Sj5yQQphaZZbEXTVrAMjX95+WZNHZvheZQ@mail.gmail.com>
 <20180410052254.GK3361@umbus.fritz.box>
 <CAPnjgZ3CBD2YORpRqmSVYsXx2kCtRPo_8WDv4u0CECKW8uGHTQ@mail.gmail.com>
 <20180410223606.GT10996@bill-the-cat.ec.rr.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4726539927563419975=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1523505801;
 bh=YRNCDGwMQSp0RatXxSVbio2ne7mMc8BTvZ6+L4N0QuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M1QQ7BaOY8lqnuhkNQwPVljekimO0Udg24imJowe+E2za+ytnZFnpjUj7yDiHHZOJ
 jHfAFASc5HSCvVMe0eDqOGnhnXggMb4rLjIA96fRmZuHfgPUDKsN4gWldtych7uFr6
 HV+2nvMe7ScejrcfYCL47Mwl0D95q8ZIY17UmGf4=
In-Reply-To: <20180410223606.GT10996@bill-the-cat.ec.rr.com>
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Tom Rini <trini@konsulko.com>
Cc: aik@ozlabs.ru, U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>


--===============4726539927563419975==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline


--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2018 at 06:36:06PM -0400, Tom Rini wrote:
> On Tue, Apr 10, 2018 at 10:42:45AM -0400, Simon Glass wrote:
> > +U-Boot, Tom, Masahiro
> >=20
> > Hi David,
> >=20
> > On 10 April 2018 at 01:22, David Gibson <david@gibson.dropbear.id.au> w=
rote:
> > > On Wed, Apr 04, 2018 at 01:21:10AM +0800, Simon Glass wrote:
> > >> Hi David,
> > >>
> > >> On 3 April 2018 at 23:02, David Gibson <david@gibson.dropbear.id.au>=
 wrote:
> > >> >
> > >> > On Fri, Mar 30, 2018 at 04:42:21PM +0800, Simon Glass wrote:
> > >> > > Hi David,
> > >> > >
> > >> > > On 26 March 2018 at 07:25, David Gibson <david@gibson.dropbear.i=
d.au> wrote:
> > >> > > > fdt_string() is used to retrieve strings from a DT blob's stri=
ngs section.
> > >> > > > It's rarely used directly, but is widely used internally.
> > >> > > >
> > >> > > > However, it doesn't do any bounds checking, which means in the=
 case of a
> > >> > > > corrupted blob it could access bad memory, which libfdt is sup=
posed to
> > >> > > > avoid.
> > >> > > >
> > >> > > > This write a safe alternative to fdt_string, fdt_get_string().=
  It checks
> > >> > > > both that the given offset is within the string section and th=
at the string
> > >> > > > it points to is properly \0 terminated within the section.  It=
 also returns
> > >> > > > the string's length as a convenience (since it needs to determ=
ine to do the
> > >> > > > checks anyway).
> > >> > > >
> > >> > > > fdt_string() is rewritten in terms of fdt_get_string() for com=
patibility.
> > >> > > >
> > >> > > > Most of the diff here is actually testing infrastructure.
> > >> > > >
> > >> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > >> > > > ---
> > >> > > >  libfdt/fdt_ro.c          | 61 +++++++++++++++++++++++++++++++=
++++--
> > >> > > >  libfdt/libfdt.h          | 18 ++++++++++-
> > >> > > >  libfdt/version.lds       |  2 +-
> > >> > > >  tests/.gitignore         |  1 +
> > >> > > >  tests/Makefile.tests     |  2 +-
> > >> > > >  tests/run_tests.sh       |  1 +
> > >> > > >  tests/testdata.h         |  1 +
> > >> > > >  tests/testutils.c        | 11 +++++--
> > >> > > >  tests/trees.S            | 26 ++++++++++++++++
> > >> > > >  tests/truncated_string.c | 79 +++++++++++++++++++++++++++++++=
+++++++++++++++++
> > >> > > >  10 files changed, 193 insertions(+), 9 deletions(-)
> > >> > > >  create mode 100644 tests/truncated_string.c
> > >> > >
> > >> > > Similar code-size quesiton here. It looks like a lot of checking=
 code.
> > >> > > Can we have an option to remove it?
> > >> >
> > >> > Again, I'm disinclined without a concrete example of a problem.  F=
wiw
> > >> > the code size change is +276 bytes on my setup.
> > >>
> > >> That might not sound like a lot, but the overhead of DT in U-Boot is
> > >> about 3KB, so this adds nearly 10%.
> > >
> > > Hm.  And how much is it compared to the whole U-Boot blob?
> > >
> > >> The specific problem is that when U-Boot SPL gets too big boards don=
't
> > >> boot. Because we take the upstream libfdt this will affect U-Boot.
> > >>
> > >> Do you have any thoughts on how we could avoid this size increase?
> > >
> > > So, again, I'm very disinclined to prioritize size over memory safety
> > > without a *concrete* example.  i.e. "We hit this specific problem with
> > > size on this specific board that we were really using" rather than
> > > just "it might be a problem".
>=20
> I'm either failing in my Google-fu or is there not an easy way to grab
> the patches from patchwork/similar?  But, if you shoot me the series
> off-list, I can tell you how much U-Boot targets grow here (we can use
> the same script as the kernel to re-sync sources back in, so I can give
> you a before/after).  But as Simon notes, we have a number of platforms
> that need to use (parts of) libfdt and stick to ~30KiB or less in total,
> sometimes including some memory for stack/etc and we've long been using
> -ffunction-sections/etc (the latest round of trying to use LTO has me
> thinking maybe we can see if that's a valid option finally, but that's
> an aside). Thanks!

We don't have a patchwork for these lists AFAIK, but you can get my
draft branch from:

https://github.com/dgibson/dtc/tree/safety

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlrO2f4ACgkQbDjKyiDZ
s5INthAA2YDTbC4w7cUvABk095lFTSCcy78d80fqwBI4A9ReafBwi749w6C+hSJ5
KrA52vdx/j0UcjiTmgp/wsEgJgLHBLsVq6oh5cLzq8dHpunKBWV7rRc1XZvG5Ls4
NPv3zSEX42tDdUuT71ObwH5DoR/FY09fy32q9Zzas2M0FmeWSDrh7H4SNJabHV5A
fqaixGRV4yZ0LnfnCLaGk3tjzSS5DRdiptzJskcG6rRN9vgS0sjMKjJGODUeiWlc
kGxAK799/CpoyVeARVo4tJBIUoVc76wvwX0NSYrY8R2ocEx52SPkl7cRRHLI6uMa
r1IxGSt+5+TeRKNKhyfU19wJtEjgtjE4MlNMA/fJhtYywKBiRUdR6pWvA0Q/aaa0
Ww4xbLGH7bqsl4nbl+mDnzyXpab51Zxbz8FFCiroCboj6ktojw4k6Z7whnUeWQZl
fPuCtEkfdHm4WJrFGXNhseLERVT7pEz9/ayUvWAzi1c8padMOQ13ZF6Dge1cFR8R
XyWAt0QdK2S45CgIJ60YaNsDDpST/MgYjNp2uxVVav4jvWGYg+4MpKW5t8rYOqi+
dPZ/xFXax47AcmPMN//GryY+i3646i7ZyQiGXPniSx9Zn3b2JXfiHaftdAg2ilsR
NQgNrrOuB0dcfP2lGUpJTWOlKNiY6SKxcahg0HaYunKedc5ntnY=
=xMD6
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--

--===============4726539927563419975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--===============4726539927563419975==--
