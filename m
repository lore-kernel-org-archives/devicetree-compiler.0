From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Tue, 28 Jan 2020 09:51:43 -0500
Message-ID: <20200128145143.GR13379@bill-the-cat>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat>
 <20200128085918.GO42099@umbus.fritz.box>
 <20200128134304.GQ13379@bill-the-cat>
 <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="96icqjDFsSi85SgI"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0hYCR3mVMzZMrQh9U9lzIPU6teF88XVM3bFEdoqeqpo=;
        b=Hf4ZO5mdjWOhXATZ38ggRejT5K4GZk19N3gavk81fXzJbTCO9isf+B//u7fpwF8Knc
         El6JVepVKALfxlAQIszPu9DKYs9X6yIxIFAimxzAVKvhv9M7DvHodej9C1LlfWDt58ah
         x4+OI7uOnB5/NTooJlfnqBTZTeb466Q4Z1RpQ=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--96icqjDFsSi85SgI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 08:08:53AM -0600, Rob Herring wrote:
> On Tue, Jan 28, 2020 at 7:43 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >
> > On Tue, Jan 28, 2020 at 07:59:18PM +1100, David Gibson wrote:
> > > On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> > > > On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> > > > > On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> > > > > > On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > > > > > > On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > > > > > > > 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words=
" introduced
> > > > > > > > changes to support unaligned reads for ARM platforms and 11=
738cf01f15
> > > > > > > > "libfdt: Don't use memcpy to handle unaligned reads on ARM"=
 improved the
> > > > > > > > performance of these helpers.
> > > > > > > >
> > > > > > > > Ultimately however, these helpers should not exist.  Unalig=
ned access
> > > > > > > > only occurs when images are forced out of alignment by the =
user.  This
> > > > > > > > unalignment is not supported and introduces problems later =
on as other
> > > > > > > > parts of the system image are unaligned and they too requir=
e alignment.
> > > > > > > >
> > > > > > > > Revert both of these changes.
> > > > > > > >
> > > > > > > > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > > > > > > ---
> > > > > > > > By way of a little more explanation, looking at the archive=
s it seems
> > > > > > > > that the initial bug reporter said that they had a platform=
 that was
> > > > > > > > using U-Boot and had the "fdt_high=3D0xffffffff" set in the=
 environment.
> > > > > > > > What that does is to tell U-Boot to not do any of the sanit=
y checks and
> > > > > > > > relocation to ensure alignment that it would normally do be=
cause the
> > > > > > > > user knows best.  This later came up on the U-Boot list as =
once the DTB
> > > > > > > > was loaded, Linux is unhappy because it demands correct ali=
gnment.
> > > > > > > >
> > > > > > > > I only realized libfdt had introduced changes here when it =
was reported
> > > > > > > > that boot time had gotten much slower once we merged this c=
hange in.  It
> > > > > > > > would be best to just drop it.
> > > > > > >
> > > > > > > Hmm.  I'm not sure about this.  The commit message makes a ca=
se for
> > > > > > > why the unaligned handling isn't necessary, but not a case fo=
r why
> > > > > > > it's bad.  Even if handling an unaligned tree isn't a common =
case,
> > > > > > > isn't it better to be able to than not?
> > > > > > >
> > > > > > > I gather from the previous discussion that there's a signific=
ant
> > > > > > > performance impact, but that rationale needs to go into the c=
ommit
> > > > > > > message for posterity.
> > > > > >
> > > > > > I wanted to emphasize that the code simply isn't ever needed, n=
ot that
> > > > > > it's a performance problem.  A performance problem implies that=
 we would
> > > > > > keep this, if it was fast enough.  That's why people noticed it=
 (it
> > > > > > slows things down to an unusable level).  But it's functionally=
 wrong.
> > > > > >
> > > > > > > [snip]
> > > > > > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > > > > > index fc4c4962a01c..d4ebe915cf46 100644
> > > > > > > > --- a/libfdt/libfdt.h
> > > > > > > > +++ b/libfdt/libfdt.h
> > > > > > > > @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(v=
oid *fdt, int offset, int checklen)
> > > > > > > >
> > > > > > > >  uint32_t fdt_next_tag(const void *fdt, int offset, int *ne=
xtoffset);
> > > > > > > >
> > > > > > > > -/*
> > > > > > > > - * Alignment helpers:
> > > > > > > > - *     These helpers access words from a device tree blob.=
  They're
> > > > > > > > - *     built to work even with unaligned pointers on platf=
orms (ike
> > > > > > > > - *     ARM) that don't like unaligned loads and stores
> > > > > > > > - */
> > > > > > > > -
> > > > > > > > -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > > > > > > -{
> > > > > > > > -   const uint8_t *bp =3D (const uint8_t *)p;
> > > > > > > > -
> > > > > > > > -   return ((uint32_t)bp[0] << 24)
> > > > > > > > -           | ((uint32_t)bp[1] << 16)
> > > > > > > > -           | ((uint32_t)bp[2] << 8)
> > > > > > > > -           | bp[3];
> > > > > > > > -}
> > > > > > >
> > > > > > > In particular, I definitely think removing the helpers entire=
ly is a
> > > > > > > no go.  They're now part of the published interface of the li=
brary.
> > > > > >
> > > > > > Perhaps "mistakes were made" ?  I don't think we need to worry =
about
> > > > > > removing an interface here as projects are avoiding upgrading l=
ibfdt
> > > > > > now (TF-A, formerly ATF) or reverting the change (U-Boot).
> > > > > >
> > > > > > > Even if they're not used for reading the internal tags, they =
can be
> > > > > > > used to load integers from within particular properties.  Tho=
se are
> > > > > > > frequently unaligned, since properties generally have packed
> > > > > > > representations.
> > > > > >
> > > > > > I don't see the relevance.  Go back to the initial problem repo=
rt.  It's
> > > > > > not "I have a new unique platform I'm using libfdt on and I have
> > > > > > problems".  It's "I keep jabbing myself with a rusty nail and n=
ow I have
> > > > > > problems".
> > > > >
> > > > > The initial report isn't the only relevant thing here.  Although =
it
> > > > > prompted the change, it wasn't the only consideration in making i=
t.
> > > > >
> > > > > There's also two separate questions here:
> > > > >   1) Do we want byteswapping integer load helpers?
> > > > >   2) Should those handle unaligned accesses?
> > > > >
> > > > > In working out how to address the (as it turns out, non existent)
> > > > > problem, I realized an abstraction for loading big-endian integers
> > > > > from the blob would be a useful thing in its own right.  I also
> > > > > realized that it's a useful thing not just inside the libfdt code=
, but
> > > > > as an external interface.  Callers have always needed to interpre=
t the
> > > > > contents of individual dt properties, and loading integers from t=
hem
> > > > > is often a part of that.
> > > > >
> > > > > I know of people using those fdtXX_ld() helpers right now, so I'm=
 not
> > > > > going to take them away.
> > > > >
> > > > > For the case of external users we absolutely do need to handle
> > > > > unaligned accesses.  There are a number of existing bindings that=
 mix
> > > > > strings and integers in packed format, in a single encoded proper=
ty.
> > > > > So regardless of the alignment of the whole property, we can easi=
ly
> > > > > get unaligned integers in there, and I don't want to expose multi=
ple
> > > > > different helpers for different cases.
> > > > >
> > > > > Now, we don't *have* to use the same helpers for internal use.  We
> > > > > could open code the internal loads, or use a special aligned-only
> > > > > version inside.  But using the existing external helpers is the
> > > > > obvious and simple choice.
> > > > >
> > > > > So, we're back to: I need a case for changing this now, not just a
> > > > > case for claiming it wasn't needed in the first place.
> > > >
> > > > For U-Boot, I'm just going to revert this part of the changes.  I w=
ould
> > >
> > > That seems reasonable for the interim.
> > >
> > > > suggest that you look in to some way to fix the "fast path" here to=
 go
> > > > back to the previous way of working so that other project can conti=
nue
> > > > to use libfdt as well and when callers need to access these helpers=
 and
> > > > are not otherwise in the fast path can do so.
> > > >
> > > > You're adding visible boot time delay with things the way they exist
> > > > today.  That's not OK.
> > >
> > > That's a fair point, but you need to make that case in the commit
> > > message and merge request, not just expect me to find and collate the
> > > arguments from other threads.
> >
> > If you want me to leave the helpers alone but otherwise revert things, I
> > can do a v2 and expand the commit message.  And perhaps I'm too nice
> > sometimes then but I do pickup and tweak things that are close enough to
> > what I want and reword as needed for clarity.
>=20
> Why not just fix the helpers for the aligned case and be done with it:
>=20
> static inline uint32_t fdt32_ld(const fdt32_t *p)
> {
>        const uint8_t *bp =3D (const uint8_t *)p;
>=20
> +       if (!((unsigned long)p & 0x3))
> +               return fdt32_to_cpu(*p);
> +
>        return ((uint32_t)bp[0] << 24)
>                | ((uint32_t)bp[1] << 16)
>                | ((uint32_t)bp[2] << 8)
>                | bp[3];
> }

I don't know if that was one of the ideas David tried when the problem
was reported initially.  It would be good to know what the
size/performance impact of that is.  But still, fast path needs to be
fast.

> > I still believe you have things wrong.  There's not an unaligned access
> > problem that libfdt needs to care about.  ARM doesn't need help handling
> > unaligned accesses.  The only problem that's been reported is from when
> > a user got themselves so far off in the weeds that nothing else matters.
>=20
> I think while the vast majority of DTBs don't have anything that would
> cause unaligned accesses, that's not guaranteed by the FDT format.
> libfdt needs to handle the worst case.

It also needs to be useful.  Please note that two of the projects using
libfdt are holding back upgrading (TF-A,
https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/log/lib/libfdt/=
fdt.c)
or reverting this change (U-Boot) because this is increasing boot time
in visible ways.  It's not "you added 100ms".  It's "you added 1 second
or more".

> What about ARMv5 and v4 which don't universally support unaligned
> accesses or any other architecture. Do all mips, openrisc, riscv, arc,
> microblaze, xtenza, etc. support unaligned accesses?

It's been long enough since the last time I was in a what-about
discussion over alignment issues that no, I don't recall just how much
special casing you need to put in the common paths to handle the
uncommon case.  My general recollection is that no, we don't need to go
all out on this as the cases where unaligned access is fatal (rather
than just bad performance in that rare case) is small.  It's so small
that the problem wasn't found here because someone did that, it's
because someone (inadvertently) turned off all the safety and sanity
checks and then saw not safe and not sane results.

Thanks!

--=20
Tom

--96icqjDFsSi85SgI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4wSnYACgkQh/n2NdMd
dlKDfBAAqkMvqKRG/0iQKkYpA3/geHQwq14jkM4He6D2G/+ZT2AYw8C2OihQIUg2
wKUS3vWprXhtT/1bn7hmnNRG8k0LvpiJCGz7vnc+xBSThH4fk7knajgMg++ehaU6
FHRZG6Ac1MMwHu5Yu5Pp1/r6yvaJ5c7IQi6A7izfv9VEqaywIADdvQ8vegRlj7D8
Vf6YdaX0Ph3aNKfefB8JBU+hSSi2gliuRceujpSw02D98hR3f7li7RXeSs3khC1s
W0ZjjvmEAPHHnj4ANN++nj+TC3hn65VqkowELOscQhKYQCTcYKX74Hqn104mdRyq
v+ZIKeJlFTdNetJ+iOXfWVSI+MupWaQoB/l41DCBmEYR3Zb0TsDvtAddxb23P1Jh
dc/ctoFI9okAxpi8wAIYm9LAJeoUJrL/snsUv7VtJZPVK3d4ZJcu++mUqrf1rEJg
fFt9besHf/xbNhm+LXsQOK9GKl67bqzaHTgfVB05l0RNySWmiZoPJUmvSZ+Y1qq9
IyoBwvFL1Vn1UFXiRC9Y03FWvI3eItcjmnIIOBAWlFRdRYbZ8yCcFfr5HT2pTLFB
dcMkgV55mqiu6F5HLMI16jPG37ZRnHMIf0tVFaO91PmipVTPaV22MlLxNpX8ACDa
TeIeP53aFg4XPF7ndqVOzpFMK0jEN3WCrEkZdxFRre1s7v6k6H4=
=cYGL
-----END PGP SIGNATURE-----

--96icqjDFsSi85SgI--
