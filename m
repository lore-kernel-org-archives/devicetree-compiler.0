From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 03/12] libfdt: Safer access to strings section
Date: Mon, 16 Apr 2018 10:37:59 +1000
Message-ID: <20180416003759.GW9425@umbus.fritz.box>
References: <20180325232523.13469-4-david@gibson.dropbear.id.au>
 <CAPnjgZ299ffKgtojTGaV+2EigUAT8ediyCSWk2xoxr2sAjeyog@mail.gmail.com>
 <20180403150224.GD1984@umbus.fritz.box>
 <CAPnjgZ3vEkx6zJY9Sj5yQQphaZZbEXTVrAMjX95+WZNHZvheZQ@mail.gmail.com>
 <20180410052254.GK3361@umbus.fritz.box>
 <CAPnjgZ3CBD2YORpRqmSVYsXx2kCtRPo_8WDv4u0CECKW8uGHTQ@mail.gmail.com>
 <20180412043919.GH9425@umbus.fritz.box>
 <20180413165319.GF10996@bill-the-cat.ec.rr.com>
 <20180414034305.GV9425@umbus.fritz.box>
 <CANCZdfogtXEkY2a0Om19Yn=O-v1E9K2ZLzeX4Mpf69Bj3CkXzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4300890100278563500=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1523839084;
 bh=LhhJDzKmvrZ/uGAcSNu5mPLvnYg84wnGShlY7HKxdSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V/lGWVDVkfY47HSkFRXQ7aNId6BCxwNlvE/lqzo4U01ngkhdP8QLVSL7VUqF44eST
 Ljo5Y7H4Gwxsgb4EDaG4uohE1apwS2UQ4uoNidPb+OeL8rJ21n/C4bQ3xcrx23Y29X
 QCQGN2oCFA7A4IqT8RVOWh1x2zbpSyVwYcWKUXFQ=
In-Reply-To: <CANCZdfogtXEkY2a0Om19Yn=O-v1E9K2ZLzeX4Mpf69Bj3CkXzA@mail.gmail.com>
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
To: Warner Losh <imp@bsdimp.com>
Cc: aik@ozlabs.ru, Tom Rini <trini@konsulko.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>


--===============4300890100278563500==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WN2ELtqJJ9aZ3yHj"
Content-Disposition: inline


--WN2ELtqJJ9aZ3yHj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 14, 2018 at 08:42:23AM -0600, Warner Losh wrote:
> On Fri, Apr 13, 2018 at 9:43 PM, David Gibson <david@gibson.dropbear.id.a=
u>
> wrote:
>=20
> > On Fri, Apr 13, 2018 at 12:53:19PM -0400, Tom Rini wrote:
> > > On Thu, Apr 12, 2018 at 02:39:19PM +1000, David Gibson wrote:
> > > > On Tue, Apr 10, 2018 at 10:42:45AM -0400, Simon Glass wrote:
> > > > > +U-Boot, Tom, Masahiro
> > > > >
> > > > > Hi David,
> > > > >
> > > > > On 10 April 2018 at 01:22, David Gibson <david@gibson.dropbear.id=
=2Eau>
> > wrote:
> > > > > > On Wed, Apr 04, 2018 at 01:21:10AM +0800, Simon Glass wrote:
> > > > > >> Hi David,
> > > > > >>
> > > > > >> On 3 April 2018 at 23:02, David Gibson <
> > david@gibson.dropbear.id.au> wrote:
> > > > > >> >
> > > > > >> > On Fri, Mar 30, 2018 at 04:42:21PM +0800, Simon Glass wrote:
> > > > > >> > > Hi David,
> > > > > >> > >
> > > > > >> > > On 26 March 2018 at 07:25, David Gibson <
> > david@gibson.dropbear.id.au> wrote:
> > > > > >> > > > fdt_string() is used to retrieve strings from a DT blob's
> > strings section.
> > > > > >> > > > It's rarely used directly, but is widely used internally.
> > > > > >> > > >
> > > > > >> > > > However, it doesn't do any bounds checking, which means =
in
> > the case of a
> > > > > >> > > > corrupted blob it could access bad memory, which libfdt =
is
> > supposed to
> > > > > >> > > > avoid.
> > > > > >> > > >
> > > > > >> > > > This write a safe alternative to fdt_string,
> > fdt_get_string().  It checks
> > > > > >> > > > both that the given offset is within the string section =
and
> > that the string
> > > > > >> > > > it points to is properly \0 terminated within the sectio=
n.
> > It also returns
> > > > > >> > > > the string's length as a convenience (since it needs to
> > determine to do the
> > > > > >> > > > checks anyway).
> > > > > >> > > >
> > > > > >> > > > fdt_string() is rewritten in terms of fdt_get_string() f=
or
> > compatibility.
> > > > > >> > > >
> > > > > >> > > > Most of the diff here is actually testing infrastructure.
> > > > > >> > > >
> > > > > >> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > > > >> > > > ---
> > > > > >> > > >  libfdt/fdt_ro.c          | 61
> > +++++++++++++++++++++++++++++++++++--
> > > > > >> > > >  libfdt/libfdt.h          | 18 ++++++++++-
> > > > > >> > > >  libfdt/version.lds       |  2 +-
> > > > > >> > > >  tests/.gitignore         |  1 +
> > > > > >> > > >  tests/Makefile.tests     |  2 +-
> > > > > >> > > >  tests/run_tests.sh       |  1 +
> > > > > >> > > >  tests/testdata.h         |  1 +
> > > > > >> > > >  tests/testutils.c        | 11 +++++--
> > > > > >> > > >  tests/trees.S            | 26 ++++++++++++++++
> > > > > >> > > >  tests/truncated_string.c | 79
> > ++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > >> > > >  10 files changed, 193 insertions(+), 9 deletions(-)
> > > > > >> > > >  create mode 100644 tests/truncated_string.c
> > > > > >> > >
> > > > > >> > > Similar code-size quesiton here. It looks like a lot of
> > checking code.
> > > > > >> > > Can we have an option to remove it?
> > > > > >> >
> > > > > >> > Again, I'm disinclined without a concrete example of a
> > problem.  Fwiw
> > > > > >> > the code size change is +276 bytes on my setup.
> > > > > >>
> > > > > >> That might not sound like a lot, but the overhead of DT in U-B=
oot
> > is
> > > > > >> about 3KB, so this adds nearly 10%.
> > > > > >
> > > > > > Hm.  And how much is it compared to the whole U-Boot blob?
> > > > > >
> > > > > >> The specific problem is that when U-Boot SPL gets too big boar=
ds
> > don't
> > > > > >> boot. Because we take the upstream libfdt this will affect U-B=
oot.
> > > > > >>
> > > > > >> Do you have any thoughts on how we could avoid this size incre=
ase?
> > > > > >
> > > > > > So, again, I'm very disinclined to prioritize size over memory
> > safety
> > > > > > without a *concrete* example.  i.e. "We hit this specific probl=
em
> > with
> > > > > > size on this specific board that we were really using" rather t=
han
> > > > > > just "it might be a problem".
> > > > > >
> > > > > > IMO, thinking of it in terms of the "increase" is the wrong way
> > > > > > arond.  If size is really a problem for you, you want to consid=
er
> > how
> > > > > > you can reduce it in any way, not just rolling back the most re=
cent
> > > > > > changes.  The most obvious one to me would be to try
> > > > > > -ffunction-sections to exclude any functions that aren't actual=
ly
> > used
> > > > > > by u-boot (if this is helpful and the compiler's an issue, I'd =
be
> > > > > > willing to consider splitting up libfdt into a bunch more C fil=
es).
> > > > >
> > > > > Actually U-Boot does use that option. Believe me, a lot of work h=
as
> > > > > gone into making this small. There is constant pressure to
> > > > > reduce/retain the size in SPL so that we can stay below limits. E=
=2Eg.
> > > > > firefly-rk3288 has a 30KB limit for SPL. Current problems are the
> > > > > 64-bit Allwinner parts which are right up against the limit at
> > > > > present.
> > > > >
> > > > > Also, Masahiro recently did some work to make U-Boot's version of
> > > > > libfdt the same as is used by Linux, so any changes will impact us
> > > > > quite quickly.
> > > >
> > > > Hm, ok, point taken.
> > > >
> > > > I did some quick hacks and I think it wouldn't be too hard to add a
> > > > "-DUNSAFE" or similar option that would turn off most of the checki=
ng
> > > > and save a substantial amount of code.
> > > >
> > > > I don't really have time to polish this up myself, but I'd be happy=
 to
> > > > merge patches that add something like this.  I am disinclined to ho=
ld
> > > > up this safety work for it, though.
> > > >
> > > > If someone tackles this, I'd suggest 4 levels of "unsafety":
> > > >
> > > > 1) Safe.  The default, as now, full checking and safety wherever
> > possible
> > > >
> > > > 2) Remove "assert"s.  Remove all checks that result in
> > > >    -FDT_ERR_INTERNAL.  These are basically supposed to be assert()s,
> > > >    but I don't want to rely on assert() as an external dependency.
> > > >    Testsuite should still pass in full with this change
> > > >
> > > > 3) Remove safety against a corrupted fdt.  This would remove basica=
lly
> > > >    all the extra checking in this series, plus what was already
> > > >    there.  fdt_offset_ptr() would become a no-op.  A handful of tes=
ts
> > > >    that explicitly check against broken trees would need to be skip=
ped
> > > >    in this mode.
> > > >
> > > > 4) Remove safety against bad parameters.  All of the above and also
> > > >    remove sanity checks of arguments.  A rather larger number of te=
sts
> > > >    would need to be skipped here.
> > >
> > > I'm honestly a little bit torn on this.
> >
> > Torn on what aspect, exactly?
> >
> > > I guess the fundamental
> > > question is, what can the bootloader do if the DTB is somehow wrong?
> >
> > Depends a lot on the details of the bootloader.
>=20
> Usually a boot loader can only do binary things: either use it or not use
> it. If it is corrupt, there's usually not enough room for self-healing
> code. There may be room for falling back to a second, backup copy. Howeve=
r,
> any data corruption that would take out the first copy may also take out
> the second, so that's a crap shoot.

Yeah, I wouldn't anticipate being able to do any sort of correction in
a bootloader - or anywhere, hardly.  But a bootloader could print a
message indicating the dtb is faulty.  That could mean the difference
between immediately seeing the problem or spending hours figuring out
why the bootloader corrupted its memory and jumped off into hyperspace
somewhere.

> > I
> > > kind of feel like it's most important to be able to detect problems
> > > within the tree and have a catchable error rather than assume the inp=
ut
> > > is good, be incorrect about that and go off in the weeds and possibly
> > > hang.
> >
> > I absolutely agree, which is why I want safety in the face of a
> > corrupted tree to be the default behaviour.  But people are telling me
> > that size is vitally important, and there's not a whole lot that could
> > be cut other than the checking/safety code.
>=20
>=20
> It doesn't matter how safe it is if the code doesn't fit. Sometimes you
> have to give up safety for functionality in constrained environments. Tho=
se
> constrained environments often have to assume the best. The code often
> isn't signed or has no stronger protections than a simple checksum. There
> isn't room for that stuff til the later layers. If your code doesn't fit,=
 a
> libfdtlite will happen and that will likely be even worse because it
> doesn't have the testing coverage libfdt has. Better to have an ifdef to
> turn off the sanity checks than a whole new codebase.
>=20
> I base this prediction on working on boot loaders that are constrained:
> code gets forked to deal with the smaller space, and bugs introduced into
> the forked code. It's much better to use a common code base with parts
> #ifdef'd out than to maintain two code bases....

That's basically the same conclusion I came to.  I welcome patches to
add the necessary ifdefs to cut the size down.  I just don't have time
to make and test them myself.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WN2ELtqJJ9aZ3yHj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlrT8GUACgkQbDjKyiDZ
s5Lzzg//bmA8T7QkHHeHrn5k+XM0yO2GLU4Q9CS/XEGcGZKSalLVsZS/yrR0pnl8
gxpAvzvcy/px6r2UUD5PRdrlXNuYUi+5KRH3fT/rlFDdjsGUV+UMrVQQ08Bsrvg3
QOV5Oxx5WITQKYx5Ab/PvKMBvSE82FLiOGo/BLrqxTckU2IZqxHpHa1q0t92h50U
eqtknsDl5WoOLzow+heRTdQ4R0BbveB9FVlrHJeoGMDAf5nwCM1QGMF5BXozjNzD
miBJiElk/QXvMHGk4Jvn1Iu3SNPgtLmN1Cwb4jN778vB8xdS8RjCqiZ+UmrzilNN
T+4VSkknXAsZHGvf8ldx0S/oFaedqAwTf6K2z8RWqKZbSgb84v5UfI+nNgxcfxm9
6zlh87v6oeuHGJBx/KyU/nRM5QQ8cA0hgBeM4w1a6WaMuFLYDgZnZ7fofgHTzo1U
nFpLcbH8J3Pg/MiGHVpTNvKvGC5OhYicwOTToKUb5frcXONxuFVe1U6slDV+YE8G
k5FqyiuL+ImcSakoxmWn5I28htUfdDKdPDcKOXpahkuhRWFT/wM7unHkANWC748K
Q6tGW6xdyuhkYdeUE60DjrpqPNH5e2i2IbkjlvqeDt0itTd7Ms0XQ0bc/50Bfsny
+jGGaVrYzQPTSpnCvhHKmCrVxLZ/G2l6oxS7Qvg4WR4K6GV7XTE=
=RMhV
-----END PGP SIGNATURE-----

--WN2ELtqJJ9aZ3yHj--

--===============4300890100278563500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--===============4300890100278563500==--
