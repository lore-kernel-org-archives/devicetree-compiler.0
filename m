From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Wed, 29 Jan 2020 12:52:21 +1100
Message-ID: <20200129015221.GT42099@umbus.fritz.box>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat>
 <20200128085918.GO42099@umbus.fritz.box>
 <20200128134304.GQ13379@bill-the-cat>
 <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
 <20200128145143.GR13379@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R+WA+n3pAWWgNWUs"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580262761;
        bh=3WytY0iGx2njzzIHgcHGbCp2C1ZQlAxUkte3fZouKtk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AQKkKb3k6QTnQKW+aK/ewhO6oPcuPMp2Iuf2veBVz1Blmx6XJo+v9HTv6tIHa6HHb
         nUBHqLus4uPA25DIYbxfYNUA6ENioRNEo8PgPKT2v2X0qQHN8oOYQD3GWCJm0gO4HT
         wwEvhhpvTSTN8WnowaLQ9Q1G4FvepDw3cH3cxLVc=
Content-Disposition: inline
In-Reply-To: <20200128145143.GR13379@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--R+WA+n3pAWWgNWUs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 09:51:43AM -0500, Tom Rini wrote:
> On Tue, Jan 28, 2020 at 08:08:53AM -0600, Rob Herring wrote:
> > On Tue, Jan 28, 2020 at 7:43 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > > On Tue, Jan 28, 2020 at 07:59:18PM +1100, David Gibson wrote:
> > > > On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> > > > > On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> > > > > > On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> > > > > > > On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > > > > > > > On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > > > > > > > > 6dcb8ba4 "libfdt: Add helpers for accessing unaligned wor=
ds" introduced
> > > > > > > > > changes to support unaligned reads for ARM platforms and =
11738cf01f15
> > > > > > > > > "libfdt: Don't use memcpy to handle unaligned reads on AR=
M" improved the
> > > > > > > > > performance of these helpers.
> > > > > > > > >
> > > > > > > > > Ultimately however, these helpers should not exist.  Unal=
igned access
> > > > > > > > > only occurs when images are forced out of alignment by th=
e user.  This
> > > > > > > > > unalignment is not supported and introduces problems late=
r on as other
> > > > > > > > > parts of the system image are unaligned and they too requ=
ire alignment.
> > > > > > > > >
> > > > > > > > > Revert both of these changes.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > > > > > > > ---
> > > > > > > > > By way of a little more explanation, looking at the archi=
ves it seems
> > > > > > > > > that the initial bug reporter said that they had a platfo=
rm that was
> > > > > > > > > using U-Boot and had the "fdt_high=3D0xffffffff" set in t=
he environment.
> > > > > > > > > What that does is to tell U-Boot to not do any of the san=
ity checks and
> > > > > > > > > relocation to ensure alignment that it would normally do =
because the
> > > > > > > > > user knows best.  This later came up on the U-Boot list a=
s once the DTB
> > > > > > > > > was loaded, Linux is unhappy because it demands correct a=
lignment.
> > > > > > > > >
> > > > > > > > > I only realized libfdt had introduced changes here when i=
t was reported
> > > > > > > > > that boot time had gotten much slower once we merged this=
 change in.  It
> > > > > > > > > would be best to just drop it.
> > > > > > > >
> > > > > > > > Hmm.  I'm not sure about this.  The commit message makes a =
case for
> > > > > > > > why the unaligned handling isn't necessary, but not a case =
for why
> > > > > > > > it's bad.  Even if handling an unaligned tree isn't a commo=
n case,
> > > > > > > > isn't it better to be able to than not?
> > > > > > > >
> > > > > > > > I gather from the previous discussion that there's a signif=
icant
> > > > > > > > performance impact, but that rationale needs to go into the=
 commit
> > > > > > > > message for posterity.
> > > > > > >
> > > > > > > I wanted to emphasize that the code simply isn't ever needed,=
 not that
> > > > > > > it's a performance problem.  A performance problem implies th=
at we would
> > > > > > > keep this, if it was fast enough.  That's why people noticed =
it (it
> > > > > > > slows things down to an unusable level).  But it's functional=
ly wrong.
> > > > > > >
> > > > > > > > [snip]
> > > > > > > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > > > > > > index fc4c4962a01c..d4ebe915cf46 100644
> > > > > > > > > --- a/libfdt/libfdt.h
> > > > > > > > > +++ b/libfdt/libfdt.h
> > > > > > > > > @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w=
(void *fdt, int offset, int checklen)
> > > > > > > > >
> > > > > > > > >  uint32_t fdt_next_tag(const void *fdt, int offset, int *=
nextoffset);
> > > > > > > > >
> > > > > > > > > -/*
> > > > > > > > > - * Alignment helpers:
> > > > > > > > > - *     These helpers access words from a device tree blo=
b.  They're
> > > > > > > > > - *     built to work even with unaligned pointers on pla=
tforms (ike
> > > > > > > > > - *     ARM) that don't like unaligned loads and stores
> > > > > > > > > - */
> > > > > > > > > -
> > > > > > > > > -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > > > > > > > -{
> > > > > > > > > -   const uint8_t *bp =3D (const uint8_t *)p;
> > > > > > > > > -
> > > > > > > > > -   return ((uint32_t)bp[0] << 24)
> > > > > > > > > -           | ((uint32_t)bp[1] << 16)
> > > > > > > > > -           | ((uint32_t)bp[2] << 8)
> > > > > > > > > -           | bp[3];
> > > > > > > > > -}
> > > > > > > >
> > > > > > > > In particular, I definitely think removing the helpers enti=
rely is a
> > > > > > > > no go.  They're now part of the published interface of the =
library.
> > > > > > >
> > > > > > > Perhaps "mistakes were made" ?  I don't think we need to worr=
y about
> > > > > > > removing an interface here as projects are avoiding upgrading=
 libfdt
> > > > > > > now (TF-A, formerly ATF) or reverting the change (U-Boot).
> > > > > > >
> > > > > > > > Even if they're not used for reading the internal tags, the=
y can be
> > > > > > > > used to load integers from within particular properties.  T=
hose are
> > > > > > > > frequently unaligned, since properties generally have packed
> > > > > > > > representations.
> > > > > > >
> > > > > > > I don't see the relevance.  Go back to the initial problem re=
port.  It's
> > > > > > > not "I have a new unique platform I'm using libfdt on and I h=
ave
> > > > > > > problems".  It's "I keep jabbing myself with a rusty nail and=
 now I have
> > > > > > > problems".
> > > > > >
> > > > > > The initial report isn't the only relevant thing here.  Althoug=
h it
> > > > > > prompted the change, it wasn't the only consideration in making=
 it.
> > > > > >
> > > > > > There's also two separate questions here:
> > > > > >   1) Do we want byteswapping integer load helpers?
> > > > > >   2) Should those handle unaligned accesses?
> > > > > >
> > > > > > In working out how to address the (as it turns out, non existen=
t)
> > > > > > problem, I realized an abstraction for loading big-endian integ=
ers
> > > > > > from the blob would be a useful thing in its own right.  I also
> > > > > > realized that it's a useful thing not just inside the libfdt co=
de, but
> > > > > > as an external interface.  Callers have always needed to interp=
ret the
> > > > > > contents of individual dt properties, and loading integers from=
 them
> > > > > > is often a part of that.
> > > > > >
> > > > > > I know of people using those fdtXX_ld() helpers right now, so I=
'm not
> > > > > > going to take them away.
> > > > > >
> > > > > > For the case of external users we absolutely do need to handle
> > > > > > unaligned accesses.  There are a number of existing bindings th=
at mix
> > > > > > strings and integers in packed format, in a single encoded prop=
erty.
> > > > > > So regardless of the alignment of the whole property, we can ea=
sily
> > > > > > get unaligned integers in there, and I don't want to expose mul=
tiple
> > > > > > different helpers for different cases.
> > > > > >
> > > > > > Now, we don't *have* to use the same helpers for internal use. =
 We
> > > > > > could open code the internal loads, or use a special aligned-on=
ly
> > > > > > version inside.  But using the existing external helpers is the
> > > > > > obvious and simple choice.
> > > > > >
> > > > > > So, we're back to: I need a case for changing this now, not jus=
t a
> > > > > > case for claiming it wasn't needed in the first place.
> > > > >
> > > > > For U-Boot, I'm just going to revert this part of the changes.  I=
 would
> > > >
> > > > That seems reasonable for the interim.
> > > >
> > > > > suggest that you look in to some way to fix the "fast path" here =
to go
> > > > > back to the previous way of working so that other project can con=
tinue
> > > > > to use libfdt as well and when callers need to access these helpe=
rs and
> > > > > are not otherwise in the fast path can do so.
> > > > >
> > > > > You're adding visible boot time delay with things the way they ex=
ist
> > > > > today.  That's not OK.
> > > >
> > > > That's a fair point, but you need to make that case in the commit
> > > > message and merge request, not just expect me to find and collate t=
he
> > > > arguments from other threads.
> > >
> > > If you want me to leave the helpers alone but otherwise revert things=
, I
> > > can do a v2 and expand the commit message.  And perhaps I'm too nice
> > > sometimes then but I do pickup and tweak things that are close enough=
 to
> > > what I want and reword as needed for clarity.
> >=20
> > Why not just fix the helpers for the aligned case and be done with it:
> >=20
> > static inline uint32_t fdt32_ld(const fdt32_t *p)
> > {
> >        const uint8_t *bp =3D (const uint8_t *)p;
> >=20
> > +       if (!((unsigned long)p & 0x3))
> > +               return fdt32_to_cpu(*p);
> > +
> >        return ((uint32_t)bp[0] << 24)
> >                | ((uint32_t)bp[1] << 16)
> >                | ((uint32_t)bp[2] << 8)
> >                | bp[3];
> > }
>=20
> I don't know if that was one of the ideas David tried when the problem
> was reported initially.  It would be good to know what the
> size/performance impact of that is.  But still, fast path needs to be
> fast.

I haven't tried this - I don't have easy access to systems to measure
the performance impact.  Or, rather, I can get access to systems, but
I don't really have the bandwidth to prepare a performance testing
setup.

I think this is worth a shot.  I don't know much the conditional
branch will impact the fast path.

If it's significantly better than what we have now, it might be a good
interim step, even if it's not the final word.

> > > I still believe you have things wrong.  There's not an unaligned acce=
ss
> > > problem that libfdt needs to care about.  ARM doesn't need help handl=
ing
> > > unaligned accesses.  The only problem that's been reported is from wh=
en
> > > a user got themselves so far off in the weeds that nothing else matte=
rs.
> >=20
> > I think while the vast majority of DTBs don't have anything that would
> > cause unaligned accesses, that's not guaranteed by the FDT format.
> > libfdt needs to handle the worst case.
>=20
> It also needs to be useful.  Please note that two of the projects using
> libfdt are holding back upgrading (TF-A,
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/log/lib/libfd=
t/fdt.c)
> or reverting this change (U-Boot) because this is increasing boot time
> in visible ways.  It's not "you added 100ms".  It's "you added 1 second
> or more".
>=20
> > What about ARMv5 and v4 which don't universally support unaligned
> > accesses or any other architecture. Do all mips, openrisc, riscv, arc,
> > microblaze, xtenza, etc. support unaligned accesses?
>=20
> It's been long enough since the last time I was in a what-about
> discussion over alignment issues that no, I don't recall just how much
> special casing you need to put in the common paths to handle the
> uncommon case.  My general recollection is that no, we don't need to go
> all out on this as the cases where unaligned access is fatal (rather
> than just bad performance in that rare case) is small.  It's so small
> that the problem wasn't found here because someone did that, it's
> because someone (inadvertently) turned off all the safety and sanity
> checks and then saw not safe and not sane results.
>=20
> Thanks!
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--R+WA+n3pAWWgNWUs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4w5VUACgkQbDjKyiDZ
s5JMFQ//RmgBPeMKT7gUABPxxCGmpMbkLf7wzqGbEBmh/T8SNwAr3FK4ldKTbusk
hUR8/yc0AkyAsXwHLaS8Xj9XVVid3GSSBLVBKuQhiECOYcp0pMsPJNY/ZDWVFkrZ
9UcwMA58GN3lFEy55k1dgvmMpEKivgLbiJd85I1E/8pImlmniQ44meSFf1xLLvZN
pfRW0fQvXRthIzq6aFPt1VdnaTwBh22OZ2fB6PphjeUxwH+3yIUH+QkhjpNdsBYW
Ql4h/XVH9efvci3vdQO4o9qVf3a+VIIdAQHZ2/aKvtzC3W0vpsdsWk9iK+/1bnwH
1BasIYv59UEcNqAkjy2zpeqHug90HQ6crsC3dxJ0DnnA2fz+OQIkKWMyytu3PUmp
4Cr+niBrceEkVx1myPy98u4fAr4PAlj0BMLqlon7yLY9hpDxnRq5NlNWxWnWZyPv
6Lo2NYNENzohC9B0Dyh18g1JZVzM0sWJicXSgMmFu0WLOKEL++cckyaTkERDkMHr
8KUkUyMS54H8wwX6FDOx6e9G0LB0hC2U1t3Xi/SW9bYeUTEfSZSsbX8Vdimdr4YG
wO9qSoEG+MPh8dUckeE112QKvg9Psz0Lgk6XQ1R1lsvIAJeH2nn7u538MUjwqTgL
fa+Emxvp8MEruFE+mrQ87Hehn2gGbenpeq++KwBg7/nyD1fJmLU=
=14SV
-----END PGP SIGNATURE-----

--R+WA+n3pAWWgNWUs--
