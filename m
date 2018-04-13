From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 03/12] libfdt: Safer access to strings section
Date: Fri, 13 Apr 2018 13:46:26 +1000
Message-ID: <20180413034626.GU9425@umbus.fritz.box>
References: <20180325232523.13469-1-david@gibson.dropbear.id.au>
 <20180325232523.13469-4-david@gibson.dropbear.id.au>
 <CAPnjgZ299ffKgtojTGaV+2EigUAT8ediyCSWk2xoxr2sAjeyog@mail.gmail.com>
 <20180403150224.GD1984@umbus.fritz.box>
 <CAPnjgZ3vEkx6zJY9Sj5yQQphaZZbEXTVrAMjX95+WZNHZvheZQ@mail.gmail.com>
 <20180410052254.GK3361@umbus.fritz.box>
 <CAPnjgZ3CBD2YORpRqmSVYsXx2kCtRPo_8WDv4u0CECKW8uGHTQ@mail.gmail.com>
 <20180410223606.GT10996@bill-the-cat.ec.rr.com>
 <20180412040105.GG9425@umbus.fritz.box>
 <20180412190017.GA10996@bill-the-cat.ec.rr.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0158342146148432950=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1523591594;
 bh=gAgSz75oFiD1zFxlM/40tG+lZ9H470+mJ21hzNDGZV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fKPMLZTL5iTcEk9u26AaHU3RTLERmAANzMEtMeq0oLeTjSHEZR5MxUmRIiQrijz4I
 PH3MVKE6c3UQlU+sHphogQsVLfQWC36MJpvPIacmcJ02mrOHcLwZMxxS6MyjA/hrOO
 Fe04imX2XlpO/UONwwPWpvpquTIe851BnDJA+Zow=
In-Reply-To: <20180412190017.GA10996@bill-the-cat.ec.rr.com>
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


--===============0158342146148432950==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6axCafNXXMM8qu6Q"
Content-Disposition: inline


--6axCafNXXMM8qu6Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2018 at 03:00:17PM -0400, Tom Rini wrote:
> On Thu, Apr 12, 2018 at 02:01:05PM +1000, David Gibson wrote:
> > On Tue, Apr 10, 2018 at 06:36:06PM -0400, Tom Rini wrote:
> > > On Tue, Apr 10, 2018 at 10:42:45AM -0400, Simon Glass wrote:
> > > > +U-Boot, Tom, Masahiro
> > > >=20
> > > > Hi David,
> > > >=20
> > > > On 10 April 2018 at 01:22, David Gibson <david@gibson.dropbear.id.a=
u> wrote:
> > > > > On Wed, Apr 04, 2018 at 01:21:10AM +0800, Simon Glass wrote:
> > > > >> Hi David,
> > > > >>
> > > > >> On 3 April 2018 at 23:02, David Gibson <david@gibson.dropbear.id=
=2Eau> wrote:
> > > > >> >
> > > > >> > On Fri, Mar 30, 2018 at 04:42:21PM +0800, Simon Glass wrote:
> > > > >> > > Hi David,
> > > > >> > >
> > > > >> > > On 26 March 2018 at 07:25, David Gibson <david@gibson.dropbe=
ar.id.au> wrote:
> > > > >> > > > fdt_string() is used to retrieve strings from a DT blob's =
strings section.
> > > > >> > > > It's rarely used directly, but is widely used internally.
> > > > >> > > >
> > > > >> > > > However, it doesn't do any bounds checking, which means in=
 the case of a
> > > > >> > > > corrupted blob it could access bad memory, which libfdt is=
 supposed to
> > > > >> > > > avoid.
> > > > >> > > >
> > > > >> > > > This write a safe alternative to fdt_string, fdt_get_strin=
g().  It checks
> > > > >> > > > both that the given offset is within the string section an=
d that the string
> > > > >> > > > it points to is properly \0 terminated within the section.=
  It also returns
> > > > >> > > > the string's length as a convenience (since it needs to de=
termine to do the
> > > > >> > > > checks anyway).
> > > > >> > > >
> > > > >> > > > fdt_string() is rewritten in terms of fdt_get_string() for=
 compatibility.
> > > > >> > > >
> > > > >> > > > Most of the diff here is actually testing infrastructure.
> > > > >> > > >
> > > > >> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > > >> > > > ---
> > > > >> > > >  libfdt/fdt_ro.c          | 61 +++++++++++++++++++++++++++=
++++++++--
> > > > >> > > >  libfdt/libfdt.h          | 18 ++++++++++-
> > > > >> > > >  libfdt/version.lds       |  2 +-
> > > > >> > > >  tests/.gitignore         |  1 +
> > > > >> > > >  tests/Makefile.tests     |  2 +-
> > > > >> > > >  tests/run_tests.sh       |  1 +
> > > > >> > > >  tests/testdata.h         |  1 +
> > > > >> > > >  tests/testutils.c        | 11 +++++--
> > > > >> > > >  tests/trees.S            | 26 ++++++++++++++++
> > > > >> > > >  tests/truncated_string.c | 79 +++++++++++++++++++++++++++=
+++++++++++++++++++++
> > > > >> > > >  10 files changed, 193 insertions(+), 9 deletions(-)
> > > > >> > > >  create mode 100644 tests/truncated_string.c
> > > > >> > >
> > > > >> > > Similar code-size quesiton here. It looks like a lot of chec=
king code.
> > > > >> > > Can we have an option to remove it?
> > > > >> >
> > > > >> > Again, I'm disinclined without a concrete example of a problem=
=2E  Fwiw
> > > > >> > the code size change is +276 bytes on my setup.
> > > > >>
> > > > >> That might not sound like a lot, but the overhead of DT in U-Boo=
t is
> > > > >> about 3KB, so this adds nearly 10%.
> > > > >
> > > > > Hm.  And how much is it compared to the whole U-Boot blob?
> > > > >
> > > > >> The specific problem is that when U-Boot SPL gets too big boards=
 don't
> > > > >> boot. Because we take the upstream libfdt this will affect U-Boo=
t.
> > > > >>
> > > > >> Do you have any thoughts on how we could avoid this size increas=
e?
> > > > >
> > > > > So, again, I'm very disinclined to prioritize size over memory sa=
fety
> > > > > without a *concrete* example.  i.e. "We hit this specific problem=
 with
> > > > > size on this specific board that we were really using" rather than
> > > > > just "it might be a problem".
> > >=20
> > > I'm either failing in my Google-fu or is there not an easy way to grab
> > > the patches from patchwork/similar?  But, if you shoot me the series
> > > off-list, I can tell you how much U-Boot targets grow here (we can use
> > > the same script as the kernel to re-sync sources back in, so I can gi=
ve
> > > you a before/after).  But as Simon notes, we have a number of platfor=
ms
> > > that need to use (parts of) libfdt and stick to ~30KiB or less in tot=
al,
> > > sometimes including some memory for stack/etc and we've long been usi=
ng
> > > -ffunction-sections/etc (the latest round of trying to use LTO has me
> > > thinking maybe we can see if that's a valid option finally, but that's
> > > an aside). Thanks!
> >=20
> > We don't have a patchwork for these lists AFAIK, but you can get my
> > draft branch from:
> >=20
> > https://github.com/dgibson/dtc/tree/safety
>=20
> OK, thanks.  So, I used scripts/dtc/update-dtc-source.sh to re-sync us
> first with current master, and then with the safety branch, and
> boy-howdy, are there a lot of warning changes and additions :)  For the
> record, in U-Boot you can use the buildman tool
> (./tools/buildman/buildman) to build a series for a set of targets and
> get size change for each commit.  I did:
> ./tools/buildman/buildman -o /tmp/libfdt-test -b master -SCdvel \
> 'arc|arm|sandbox|x86|aarch64|powerpc|avr32|m68k|nios2|sh4|mips|xtensa|ris=
cv'
> ./tools/buildman/buildman -o /tmp/libfdt-test -b master  -Ssdel \
> 'arc|arm|sandbox|x86|aarch64|powerpc|avr32|m68k|nios2|sh4|mips|xtensa|ris=
cv'
>=20
> And the full results are at:
> https://gist.githubusercontent.com/trini/0f5f4c368de6c3f58d88cd55359e1468=
/raw/5f3a96de5c9ec3c7724ec182f9c513f255084a89/libfdt-size-change.txt
>=20
> Commit #1 that it built is the baseline results, commit #2 is current
> dtc master and commit #3 is with the safety branch.  The good news is
> that nothing here is fatal (for targets that avail themselves of the
> CONFIG knobs to fail if binary size exceeds a certain target).  Picking
> the BSC9132QDS_NOR_DDRCLK100_SECURE target and going for more detail on
> the growth we have:
> https://gist.github.com/trini/2c2ef7e839889279ac22fabf05360e4c#file-bsc91=
32qds_nor_ddrclk100_secure-txt-L7
>=20
> That particular paste also shows that gcc-6.3 does a better job than
> gcc-5.4 (growth is 400 with 5.4 and 384 with gcc-6.3).
>=20
> Building for km_kirkwood_pci shows similar (but larger growth) results
> and are at https://gist.github.com/182af8446274dbda76553cbf924e2358
>=20
> In sum, this isn't a deal-breaker yet, but is a real concern moving
> forward (and I will follow up to your other reply too).

Ok.  So with that I'm definitely inclined to go ahead and merge these
changes, but sounds like adding some "unsafety" options to reduce size
sooner rather than later would be a good idea.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6axCafNXXMM8qu6Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlrQKBIACgkQbDjKyiDZ
s5JHAhAAguTuur5/LxDzH5Vpil9zYAnHFpsSSGyjNopeancAnRxgwCG+QOkfoEL7
hsdYIpGpOzX6y+bd2DfdG3j/PZ2D++Od+ZVhdrYze5yacvRqFEKPqbGo1FaH0lc8
wBoDywsqw9Ln8K4d/IYBNQufrq07R/JDNEjvzZW89BYxrhAhCws5U7uBOtnzfN4G
IarhnjiMPtEoiS4ID1P9PeXZOSCs/SAr1iJ050aIvhqYT19MQCXuZJN+zJJ+4PkL
4ysfFSKIzGEte9BwdWAM1bsJfIOZuoI9s11vPWMhtPUSQNuvJe9AJy+TLNuzJUyZ
RXHc9LgwX0cjVk1KzxmriZNiP3ZZ3/DGDe2Pr1KKv98r3j5GvYXb64nV9AbrLIA+
USj58q2s5sIh6AZC6uypRUNql+yC9B8Hv4S14Vh1Bmu4x6CEaifRcDsnM0jw7GqE
+g42geHiU/SDQkd1VigBSm/FCLd1PIFOaZxCn1BMGsxiXVgfxBGlO142FXJaOwt0
t5eranBAnRTIdzwn4LdRUgNQKYVN2bx+8JDtLEI78XMLbmxQL18TPEDvwBnZd/Xx
IiMf1chGoaAiPPbXRS4gQYV1MsYNYphQbW001AxXPZDknHiEm1LobK2E6fK6B4Ce
oseoAaLu/qZz0lmbSMK7IvMb8M1piTxdrOlyNiWY+OYulas5QPw=
=KpFL
-----END PGP SIGNATURE-----

--6axCafNXXMM8qu6Q--

--===============0158342146148432950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--===============0158342146148432950==--
