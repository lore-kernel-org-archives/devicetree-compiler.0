From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 03/12] libfdt: Safer access to strings section
Date: Thu, 12 Apr 2018 14:39:19 +1000
Message-ID: <20180412043919.GH9425@umbus.fritz.box>
References: <20180325232523.13469-1-david@gibson.dropbear.id.au>
 <20180325232523.13469-4-david@gibson.dropbear.id.au>
 <CAPnjgZ299ffKgtojTGaV+2EigUAT8ediyCSWk2xoxr2sAjeyog@mail.gmail.com>
 <20180403150224.GD1984@umbus.fritz.box>
 <CAPnjgZ3vEkx6zJY9Sj5yQQphaZZbEXTVrAMjX95+WZNHZvheZQ@mail.gmail.com>
 <20180410052254.GK3361@umbus.fritz.box>
 <CAPnjgZ3CBD2YORpRqmSVYsXx2kCtRPo_8WDv4u0CECKW8uGHTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1890711504955603478=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1523508270;
 bh=vR/xy+W6zwselIpwKSLaDt1gwzz4FjVwlKtpfcaE2og=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QTXL/1uMWLlrEep++bDTeCSNANbG4tIZPRk8H8oKdsP76Dgid8FPNUp410ppMAL+4
 pU24Zt1TbQPbFFTMogKyDYRjtj44eJ09BSAkwDtMROWMvHC+6k3sEiPAi0LQF+TnzO
 lZkdz27BcLVyZbnDXIakQMQfDyShrdYte4hrSZSE=
In-Reply-To: <CAPnjgZ3CBD2YORpRqmSVYsXx2kCtRPo_8WDv4u0CECKW8uGHTQ@mail.gmail.com>
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
To: Simon Glass <sjg@chromium.org>
Cc: aik@ozlabs.ru, U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Tom Rini <trini@konsulko.com>


--===============1890711504955603478==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SdvjNjn6lL3tIsv0"
Content-Disposition: inline


--SdvjNjn6lL3tIsv0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2018 at 10:42:45AM -0400, Simon Glass wrote:
> +U-Boot, Tom, Masahiro
>=20
> Hi David,
>=20
> On 10 April 2018 at 01:22, David Gibson <david@gibson.dropbear.id.au> wro=
te:
> > On Wed, Apr 04, 2018 at 01:21:10AM +0800, Simon Glass wrote:
> >> Hi David,
> >>
> >> On 3 April 2018 at 23:02, David Gibson <david@gibson.dropbear.id.au> w=
rote:
> >> >
> >> > On Fri, Mar 30, 2018 at 04:42:21PM +0800, Simon Glass wrote:
> >> > > Hi David,
> >> > >
> >> > > On 26 March 2018 at 07:25, David Gibson <david@gibson.dropbear.id.=
au> wrote:
> >> > > > fdt_string() is used to retrieve strings from a DT blob's string=
s section.
> >> > > > It's rarely used directly, but is widely used internally.
> >> > > >
> >> > > > However, it doesn't do any bounds checking, which means in the c=
ase of a
> >> > > > corrupted blob it could access bad memory, which libfdt is suppo=
sed to
> >> > > > avoid.
> >> > > >
> >> > > > This write a safe alternative to fdt_string, fdt_get_string().  =
It checks
> >> > > > both that the given offset is within the string section and that=
 the string
> >> > > > it points to is properly \0 terminated within the section.  It a=
lso returns
> >> > > > the string's length as a convenience (since it needs to determin=
e to do the
> >> > > > checks anyway).
> >> > > >
> >> > > > fdt_string() is rewritten in terms of fdt_get_string() for compa=
tibility.
> >> > > >
> >> > > > Most of the diff here is actually testing infrastructure.
> >> > > >
> >> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> >> > > > ---
> >> > > >  libfdt/fdt_ro.c          | 61 +++++++++++++++++++++++++++++++++=
++--
> >> > > >  libfdt/libfdt.h          | 18 ++++++++++-
> >> > > >  libfdt/version.lds       |  2 +-
> >> > > >  tests/.gitignore         |  1 +
> >> > > >  tests/Makefile.tests     |  2 +-
> >> > > >  tests/run_tests.sh       |  1 +
> >> > > >  tests/testdata.h         |  1 +
> >> > > >  tests/testutils.c        | 11 +++++--
> >> > > >  tests/trees.S            | 26 ++++++++++++++++
> >> > > >  tests/truncated_string.c | 79 +++++++++++++++++++++++++++++++++=
+++++++++++++++
> >> > > >  10 files changed, 193 insertions(+), 9 deletions(-)
> >> > > >  create mode 100644 tests/truncated_string.c
> >> > >
> >> > > Similar code-size quesiton here. It looks like a lot of checking c=
ode.
> >> > > Can we have an option to remove it?
> >> >
> >> > Again, I'm disinclined without a concrete example of a problem.  Fwiw
> >> > the code size change is +276 bytes on my setup.
> >>
> >> That might not sound like a lot, but the overhead of DT in U-Boot is
> >> about 3KB, so this adds nearly 10%.
> >
> > Hm.  And how much is it compared to the whole U-Boot blob?
> >
> >> The specific problem is that when U-Boot SPL gets too big boards don't
> >> boot. Because we take the upstream libfdt this will affect U-Boot.
> >>
> >> Do you have any thoughts on how we could avoid this size increase?
> >
> > So, again, I'm very disinclined to prioritize size over memory safety
> > without a *concrete* example.  i.e. "We hit this specific problem with
> > size on this specific board that we were really using" rather than
> > just "it might be a problem".
> >
> > IMO, thinking of it in terms of the "increase" is the wrong way
> > arond.  If size is really a problem for you, you want to consider how
> > you can reduce it in any way, not just rolling back the most recent
> > changes.  The most obvious one to me would be to try
> > -ffunction-sections to exclude any functions that aren't actually used
> > by u-boot (if this is helpful and the compiler's an issue, I'd be
> > willing to consider splitting up libfdt into a bunch more C files).
>=20
> Actually U-Boot does use that option. Believe me, a lot of work has
> gone into making this small. There is constant pressure to
> reduce/retain the size in SPL so that we can stay below limits. E.g.
> firefly-rk3288 has a 30KB limit for SPL. Current problems are the
> 64-bit Allwinner parts which are right up against the limit at
> present.
>=20
> Also, Masahiro recently did some work to make U-Boot's version of
> libfdt the same as is used by Linux, so any changes will impact us
> quite quickly.

Hm, ok, point taken.

I did some quick hacks and I think it wouldn't be too hard to add a
"-DUNSAFE" or similar option that would turn off most of the checking
and save a substantial amount of code.

I don't really have time to polish this up myself, but I'd be happy to
merge patches that add something like this.  I am disinclined to hold
up this safety work for it, though.

If someone tackles this, I'd suggest 4 levels of "unsafety":

1) Safe.  The default, as now, full checking and safety wherever possible

2) Remove "assert"s.  Remove all checks that result in
   -FDT_ERR_INTERNAL.  These are basically supposed to be assert()s,
   but I don't want to rely on assert() as an external dependency.
   Testsuite should still pass in full with this change

3) Remove safety against a corrupted fdt.  This would remove basically
   all the extra checking in this series, plus what was already
   there.  fdt_offset_ptr() would become a no-op.  A handful of tests
   that explicitly check against broken trees would need to be skipped
   in this mode.

4) Remove safety against bad parameters.  All of the above and also
   remove sanity checks of arguments.  A rather larger number of tests
   would need to be skipped here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SdvjNjn6lL3tIsv0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlrO4vIACgkQbDjKyiDZ
s5JQmQ//YX6DeIjWYStAr692LUQPyTbZg8WMkjMBYfZax/1auubg+PlsIkLBqnkN
rOd4E3Ro1G/+ujWLlSaR7TiIFDEPVrZJgMbEZLtW9AMkjZDo7KwpYd6/hi42jkaw
bXCjV+Z2C/2lvemFKjChurrLhoYTJvdro3nDySWNfHBTBsLr+mnQyhKyv33EUyP/
BXSGOyBrdtF21xV59Bpd1D4uNRb8dFviCuVVO+e1Xxdpj7zFRcaaSz79veJJDius
fBuDIPG/CenvWJPd+1lDs30i94Tw6lP+gZnfRH0j3WqtUJWFCcjl8Nj9hU2g11bt
ly71uSLAHD1wCg3zSY6uMtD4VujrSk12QC3OgVfN1GKAjqLAPNAXrLvKiQ7AcBZ4
iWQebuHvfpC43GCO8UMe5p6WU5vOfsbnh3Fh6LoLFKbRTSu7gCl/QvBSDUUHj8JC
7yTdpP9lRt597jY/cNvh0ta0c9G2UCFJRJVjfV8PzktkaewHXvrLNOuvVhe6Mzhc
fskm/hezu7xgV/rbpuSy814Wlt8I9QH69392KINpxdThX2X5TwnuaqRnA84L2L9g
mYECig07SFD/W4V8oxGOr7MjdDW67AuymKVsWK/OISpOmMsQ5FgHbnZKywlIsP9b
lXJgQIoBep3EPVgsQxQ1kCQcuaoXiiSdEL18D1zKIPWdP1qFiqI=
=9lyY
-----END PGP SIGNATURE-----

--SdvjNjn6lL3tIsv0--

--===============1890711504955603478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--===============1890711504955603478==--
