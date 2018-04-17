From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 03/12] libfdt: Safer access to strings section
Date: Tue, 17 Apr 2018 15:54:36 +1000
Message-ID: <20180417055436.GA2317@umbus.fritz.box>
References: <CAPnjgZ299ffKgtojTGaV+2EigUAT8ediyCSWk2xoxr2sAjeyog@mail.gmail.com>
 <20180403150224.GD1984@umbus.fritz.box>
 <CAPnjgZ3vEkx6zJY9Sj5yQQphaZZbEXTVrAMjX95+WZNHZvheZQ@mail.gmail.com>
 <20180410052254.GK3361@umbus.fritz.box>
 <CAPnjgZ3CBD2YORpRqmSVYsXx2kCtRPo_8WDv4u0CECKW8uGHTQ@mail.gmail.com>
 <20180412043919.GH9425@umbus.fritz.box>
 <20180413165319.GF10996@bill-the-cat.ec.rr.com>
 <20180414034305.GV9425@umbus.fritz.box>
 <CANCZdfogtXEkY2a0Om19Yn=O-v1E9K2ZLzeX4Mpf69Bj3CkXzA@mail.gmail.com>
 <CAK7LNARY3qFTP1C_TB5HP0Y1sqQfEkJvewMFQ5nEadNDDz+Tzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8101634963935989179=="
Return-path: <u-boot-bounces@lists.denx.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1523945824;
 bh=t4ZIQ8dZ9eTOvRjUiMnhMpyrjpF5G319N6JEekmN5QY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ylo4pocAXDeLGUIhVhMJLGfZo8U/hSuOktAbSa1VOSQXDmRm0YNEBM2QZ6iXj0N/J
 m6PbiXlxtfGIVgiquwE6Epmgt59HAi/T1w1rrA7IEFt2o+NRqhqDVsnsM5Httl9Vml
 FI4K0PPD/8GQhZjmREoKNG1q1eB7oY749S6x8PHY=
In-Reply-To: <CAK7LNARY3qFTP1C_TB5HP0Y1sqQfEkJvewMFQ5nEadNDDz+Tzg@mail.gmail.com>
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
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: aik@ozlabs.ru, Tom Rini <trini@konsulko.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Warner Losh <imp@bsdimp.com>, U-Boot Mailing List <u-boot@lists.denx.de>


--===============8101634963935989179==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2018 at 12:03:19PM +0900, Masahiro Yamada wrote:
> 2018-04-14 23:42 GMT+09:00 Warner Losh <imp@bsdimp.com>:
> > On Fri, Apr 13, 2018 at 9:43 PM, David Gibson <david@gibson.dropbear.id=
=2Eau>
> > wrote:
> >
> >> On Fri, Apr 13, 2018 at 12:53:19PM -0400, Tom Rini wrote:
> >> > On Thu, Apr 12, 2018 at 02:39:19PM +1000, David Gibson wrote:
> >> > > On Tue, Apr 10, 2018 at 10:42:45AM -0400, Simon Glass wrote:
> >> > > > +U-Boot, Tom, Masahiro
> >> > > >
> >> > > > Hi David,
> >> > > >
> >> > > > On 10 April 2018 at 01:22, David Gibson <david@gibson.dropbear.i=
d.au>
> >> wrote:
> >> > > > > On Wed, Apr 04, 2018 at 01:21:10AM +0800, Simon Glass wrote:
> >> > > > >> Hi David,
> >> > > > >>
> >> > > > >> On 3 April 2018 at 23:02, David Gibson <
> >> david@gibson.dropbear.id.au> wrote:
> >> > > > >> >
> >> > > > >> > On Fri, Mar 30, 2018 at 04:42:21PM +0800, Simon Glass wrote:
> >> > > > >> > > Hi David,
> >> > > > >> > >
> >> > > > >> > > On 26 March 2018 at 07:25, David Gibson <
> >> david@gibson.dropbear.id.au> wrote:
> >> > > > >> > > > fdt_string() is used to retrieve strings from a DT blob=
's
> >> strings section.
> >> > > > >> > > > It's rarely used directly, but is widely used internall=
y.
> >> > > > >> > > >
> >> > > > >> > > > However, it doesn't do any bounds checking, which means=
 in
> >> the case of a
> >> > > > >> > > > corrupted blob it could access bad memory, which libfdt=
 is
> >> supposed to
> >> > > > >> > > > avoid.
> >> > > > >> > > >
> >> > > > >> > > > This write a safe alternative to fdt_string,
> >> fdt_get_string().  It checks
> >> > > > >> > > > both that the given offset is within the string section=
 and
> >> that the string
> >> > > > >> > > > it points to is properly \0 terminated within the secti=
on.
> >> It also returns
> >> > > > >> > > > the string's length as a convenience (since it needs to
> >> determine to do the
> >> > > > >> > > > checks anyway).
> >> > > > >> > > >
> >> > > > >> > > > fdt_string() is rewritten in terms of fdt_get_string() =
for
> >> compatibility.
> >> > > > >> > > >
> >> > > > >> > > > Most of the diff here is actually testing infrastructur=
e.
> >> > > > >> > > >
> >> > > > >> > > > Signed-off-by: David Gibson <david@gibson.dropbear.id.a=
u>
> >> > > > >> > > > ---
> >> > > > >> > > >  libfdt/fdt_ro.c          | 61
> >> +++++++++++++++++++++++++++++++++++--
> >> > > > >> > > >  libfdt/libfdt.h          | 18 ++++++++++-
> >> > > > >> > > >  libfdt/version.lds       |  2 +-
> >> > > > >> > > >  tests/.gitignore         |  1 +
> >> > > > >> > > >  tests/Makefile.tests     |  2 +-
> >> > > > >> > > >  tests/run_tests.sh       |  1 +
> >> > > > >> > > >  tests/testdata.h         |  1 +
> >> > > > >> > > >  tests/testutils.c        | 11 +++++--
> >> > > > >> > > >  tests/trees.S            | 26 ++++++++++++++++
> >> > > > >> > > >  tests/truncated_string.c | 79
> >> ++++++++++++++++++++++++++++++++++++++++++++++++
> >> > > > >> > > >  10 files changed, 193 insertions(+), 9 deletions(-)
> >> > > > >> > > >  create mode 100644 tests/truncated_string.c
> >> > > > >> > >
> >> > > > >> > > Similar code-size quesiton here. It looks like a lot of
> >> checking code.
> >> > > > >> > > Can we have an option to remove it?
> >> > > > >> >
> >> > > > >> > Again, I'm disinclined without a concrete example of a
> >> problem.  Fwiw
> >> > > > >> > the code size change is +276 bytes on my setup.
> >> > > > >>
> >> > > > >> That might not sound like a lot, but the overhead of DT in U-=
Boot
> >> is
> >> > > > >> about 3KB, so this adds nearly 10%.
> >> > > > >
> >> > > > > Hm.  And how much is it compared to the whole U-Boot blob?
> >> > > > >
> >> > > > >> The specific problem is that when U-Boot SPL gets too big boa=
rds
> >> don't
> >> > > > >> boot. Because we take the upstream libfdt this will affect U-=
Boot.
> >> > > > >>
> >> > > > >> Do you have any thoughts on how we could avoid this size incr=
ease?
> >> > > > >
> >> > > > > So, again, I'm very disinclined to prioritize size over memory
> >> safety
> >> > > > > without a *concrete* example.  i.e. "We hit this specific prob=
lem
> >> with
> >> > > > > size on this specific board that we were really using" rather =
than
> >> > > > > just "it might be a problem".
> >> > > > >
> >> > > > > IMO, thinking of it in terms of the "increase" is the wrong way
> >> > > > > arond.  If size is really a problem for you, you want to consi=
der
> >> how
> >> > > > > you can reduce it in any way, not just rolling back the most r=
ecent
> >> > > > > changes.  The most obvious one to me would be to try
> >> > > > > -ffunction-sections to exclude any functions that aren't actua=
lly
> >> used
> >> > > > > by u-boot (if this is helpful and the compiler's an issue, I'd=
 be
> >> > > > > willing to consider splitting up libfdt into a bunch more C fi=
les).
> >> > > >
> >> > > > Actually U-Boot does use that option. Believe me, a lot of work =
has
> >> > > > gone into making this small. There is constant pressure to
> >> > > > reduce/retain the size in SPL so that we can stay below limits. =
E.g.
> >> > > > firefly-rk3288 has a 30KB limit for SPL. Current problems are the
> >> > > > 64-bit Allwinner parts which are right up against the limit at
> >> > > > present.
> >> > > >
> >> > > > Also, Masahiro recently did some work to make U-Boot's version of
> >> > > > libfdt the same as is used by Linux, so any changes will impact =
us
> >> > > > quite quickly.
> >> > >
> >> > > Hm, ok, point taken.
> >> > >
> >> > > I did some quick hacks and I think it wouldn't be too hard to add a
> >> > > "-DUNSAFE" or similar option that would turn off most of the check=
ing
> >> > > and save a substantial amount of code.
> >> > >
> >> > > I don't really have time to polish this up myself, but I'd be happ=
y to
> >> > > merge patches that add something like this.  I am disinclined to h=
old
> >> > > up this safety work for it, though.
> >> > >
> >> > > If someone tackles this, I'd suggest 4 levels of "unsafety":
> >> > >
> >> > > 1) Safe.  The default, as now, full checking and safety wherever
> >> possible
> >> > >
> >> > > 2) Remove "assert"s.  Remove all checks that result in
> >> > >    -FDT_ERR_INTERNAL.  These are basically supposed to be assert()=
s,
> >> > >    but I don't want to rely on assert() as an external dependency.
> >> > >    Testsuite should still pass in full with this change
> >> > >
> >> > > 3) Remove safety against a corrupted fdt.  This would remove basic=
ally
> >> > >    all the extra checking in this series, plus what was already
> >> > >    there.  fdt_offset_ptr() would become a no-op.  A handful of te=
sts
> >> > >    that explicitly check against broken trees would need to be ski=
pped
> >> > >    in this mode.
> >> > >
> >> > > 4) Remove safety against bad parameters.  All of the above and also
> >> > >    remove sanity checks of arguments.  A rather larger number of t=
ests
> >> > >    would need to be skipped here.
> >> >
> >> > I'm honestly a little bit torn on this.
> >>
> >> Torn on what aspect, exactly?
> >>
> >> > I guess the fundamental
> >> > question is, what can the bootloader do if the DTB is somehow wrong?
> >>
> >> Depends a lot on the details of the bootloader.
> >
> >
> > Usually a boot loader can only do binary things: either use it or not u=
se
> > it. If it is corrupt, there's usually not enough room for self-healing
> > code. There may be room for falling back to a second, backup copy. Howe=
ver,
> > any data corruption that would take out the first copy may also take out
> > the second, so that's a crap shoot.
> >
> >> I
> >> > kind of feel like it's most important to be able to detect problems
> >> > within the tree and have a catchable error rather than assume the in=
put
> >> > is good, be incorrect about that and go off in the weeds and possibly
> >> > hang.
> >>
> >> I absolutely agree, which is why I want safety in the face of a
> >> corrupted tree to be the default behaviour.  But people are telling me
> >> that size is vitally important, and there's not a whole lot that could
> >> be cut other than the checking/safety code.
> >
> >
> > It doesn't matter how safe it is if the code doesn't fit. Sometimes you
> > have to give up safety for functionality in constrained environments. T=
hose
> > constrained environments often have to assume the best. The code often
> > isn't signed or has no stronger protections than a simple checksum. The=
re
> > isn't room for that stuff til the later layers. If your code doesn't fi=
t, a
> > libfdtlite will happen and that will likely be even worse because it
> > doesn't have the testing coverage libfdt has. Better to have an ifdef to
> > turn off the sanity checks than a whole new codebase.
> >
> > I base this prediction on working on boot loaders that are constrained:
> > code gets forked to deal with the smaller space, and bugs introduced in=
to
> > the forked code. It's much better to use a common code base with parts
> > #ifdef'd out than to maintain two code bases....
> >
> > Warner
> >
> > [[ sorry if you see this twice, the mailing list didn't like the other
> > mailer I used to reply, hopefully this one is better ]]
> > _______________________________________________
>=20
>=20
>=20
> You can choose to not use DT on such constrained environments.
>=20
>=20
>=20
>=20
> According to David's analysis, this is just a matter of 276 byte.

276 bytes was just the increase for one specific patch.  The whole
series taken together, plus the existing checking code could be rather
larger.  It wouldn't be orders of magnitude larger though, probably
only in the vicinity of 1k.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlrVjBoACgkQbDjKyiDZ
s5JOmxAA1ytfqwKpUgK4ZpCYlZ0fjFoEnWOTfO3KvmwdWdaGXNZQ0yXInnZwFyia
p5RRvrVUDq76/QZCtTOHJsyauVF1f3X5F0iZeeJ0VRSEvL7TrnwmOLbO5/NEiGS7
jEtM7U6pROt9on5uNUvOq9J7xhlqdbk2BkE410Fzk42vRGdFe7ZXkK5ZJg5Go4Yt
HLW6kmZSzR9CDW9A4mhTcPF5WLQl127FeYzQ/dVXXKkaKLG/6jkLrpc6BF/0ON5T
nb/WOdJw/Vw7fJaXbFSM8WSX4SZrWKPgumdweNRgT4EROsBhkZjFplHkqsNmsQlt
09BBAsCxTG8FjER7GdMdGBjnqyALj1VNJNue8I75cztTnsxzTPJRbvqn+QT/TUZJ
VF43yDSEvkyumBFJzWDncXtoSC7AeW8KhysF3KOrnNOVKB3OpktJZPsCoKXHqFc4
V3D95oOq89K/2y1zWN3b+DlLRdHi5uH7pAbWpv9ecIgfoGEpD8O8ZLgTFjUsph94
N3MudDcAqfTdDdJt3LxrmER+hruHwBEr8SA+pY9vHYU8MKiHIFvHozCamYh4w2bf
2oE3gRsFkW74knnaA+REnmEEuV0P4OmABFQuOThCCGZThENR1L6OcDH8HxdfJ+ey
jHNSpvaYwQrd7dz5zIX0kIV0r8i4OtO1GNSYaBLnuOD7mdenZ4E=
=QQXQ
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--

--===============8101634963935989179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVS1Cb290IG1h
aWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpodHRwczovL2xpc3RzLmRlbnguZGUvbGlz
dGluZm8vdS1ib290Cg==

--===============8101634963935989179==--
