From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Wed, 29 Jan 2020 12:29:02 +1100
Message-ID: <20200129012902.GR42099@umbus.fritz.box>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat>
 <20200128085918.GO42099@umbus.fritz.box>
 <20200128134304.GQ13379@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K9fy5ol1Oes4Q/ix"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580262760;
        bh=IFgtrSaCPI1m5JqZLrgY8CtXdI8s2RLLvCmW811HbYM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pTUUzmbxCHbqjyZ3Y0NwfqRN8/r8/IM+UeJ1uEhPn2R5ewHetadZoQt/brxSwgrMY
         wCKZggRyaSJyuZFJYqG9dAa7pcdT78UyyGgXDK98W6DeE94W26wDNW4IbKd6bnX+6/
         4WMVtkuFtM0W1wDm2KRmaU0tZr7jqP26OeQWti1s=
Content-Disposition: inline
In-Reply-To: <20200128134304.GQ13379@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--K9fy5ol1Oes4Q/ix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 08:43:04AM -0500, Tom Rini wrote:
> On Tue, Jan 28, 2020 at 07:59:18PM +1100, David Gibson wrote:
> > On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> > > On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> > > > On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> > > > > On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > > > > > On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > > > > > > 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" =
introduced
> > > > > > > changes to support unaligned reads for ARM platforms and 1173=
8cf01f15
> > > > > > > "libfdt: Don't use memcpy to handle unaligned reads on ARM" i=
mproved the
> > > > > > > performance of these helpers.
> > > > > > >=20
> > > > > > > Ultimately however, these helpers should not exist.  Unaligne=
d access
> > > > > > > only occurs when images are forced out of alignment by the us=
er.  This
> > > > > > > unalignment is not supported and introduces problems later on=
 as other
> > > > > > > parts of the system image are unaligned and they too require =
alignment.
> > > > > > >=20
> > > > > > > Revert both of these changes.
> > > > > > >=20
> > > > > > > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > > > > > ---
> > > > > > > By way of a little more explanation, looking at the archives =
it seems
> > > > > > > that the initial bug reporter said that they had a platform t=
hat was
> > > > > > > using U-Boot and had the "fdt_high=3D0xffffffff" set in the e=
nvironment.
> > > > > > > What that does is to tell U-Boot to not do any of the sanity =
checks and
> > > > > > > relocation to ensure alignment that it would normally do beca=
use the
> > > > > > > user knows best.  This later came up on the U-Boot list as on=
ce the DTB
> > > > > > > was loaded, Linux is unhappy because it demands correct align=
ment.
> > > > > > >=20
> > > > > > > I only realized libfdt had introduced changes here when it wa=
s reported
> > > > > > > that boot time had gotten much slower once we merged this cha=
nge in.  It
> > > > > > > would be best to just drop it.
> > > > > >=20
> > > > > > Hmm.  I'm not sure about this.  The commit message makes a case=
 for
> > > > > > why the unaligned handling isn't necessary, but not a case for =
why
> > > > > > it's bad.  Even if handling an unaligned tree isn't a common ca=
se,
> > > > > > isn't it better to be able to than not?
> > > > > >=20
> > > > > > I gather from the previous discussion that there's a significant
> > > > > > performance impact, but that rationale needs to go into the com=
mit
> > > > > > message for posterity.
> > > > >=20
> > > > > I wanted to emphasize that the code simply isn't ever needed, not=
 that
> > > > > it's a performance problem.  A performance problem implies that w=
e would
> > > > > keep this, if it was fast enough.  That's why people noticed it (=
it
> > > > > slows things down to an unusable level).  But it's functionally w=
rong.
> > > > >=20
> > > > > > [snip]
> > > > > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > > > > index fc4c4962a01c..d4ebe915cf46 100644
> > > > > > > --- a/libfdt/libfdt.h
> > > > > > > +++ b/libfdt/libfdt.h
> > > > > > > @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(voi=
d *fdt, int offset, int checklen)
> > > > > > > =20
> > > > > > >  uint32_t fdt_next_tag(const void *fdt, int offset, int *next=
offset);
> > > > > > > =20
> > > > > > > -/*
> > > > > > > - * Alignment helpers:
> > > > > > > - *     These helpers access words from a device tree blob.  =
They're
> > > > > > > - *     built to work even with unaligned pointers on platfor=
ms (ike
> > > > > > > - *     ARM) that don't like unaligned loads and stores
> > > > > > > - */
> > > > > > > -
> > > > > > > -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > > > > > -{
> > > > > > > -	const uint8_t *bp =3D (const uint8_t *)p;
> > > > > > > -
> > > > > > > -	return ((uint32_t)bp[0] << 24)
> > > > > > > -		| ((uint32_t)bp[1] << 16)
> > > > > > > -		| ((uint32_t)bp[2] << 8)
> > > > > > > -		| bp[3];
> > > > > > > -}
> > > > > >=20
> > > > > > In particular, I definitely think removing the helpers entirely=
 is a
> > > > > > no go.  They're now part of the published interface of the libr=
ary.
> > > > >=20
> > > > > Perhaps "mistakes were made" ?  I don't think we need to worry ab=
out
> > > > > removing an interface here as projects are avoiding upgrading lib=
fdt
> > > > > now (TF-A, formerly ATF) or reverting the change (U-Boot).
> > > > >=20
> > > > > > Even if they're not used for reading the internal tags, they ca=
n be
> > > > > > used to load integers from within particular properties.  Those=
 are
> > > > > > frequently unaligned, since properties generally have packed
> > > > > > representations.
> > > > >=20
> > > > > I don't see the relevance.  Go back to the initial problem report=
=2E  It's
> > > > > not "I have a new unique platform I'm using libfdt on and I have
> > > > > problems".  It's "I keep jabbing myself with a rusty nail and now=
 I have
> > > > > problems".
> > > >=20
> > > > The initial report isn't the only relevant thing here.  Although it
> > > > prompted the change, it wasn't the only consideration in making it.
> > > >=20
> > > > There's also two separate questions here:
> > > >   1) Do we want byteswapping integer load helpers?
> > > >   2) Should those handle unaligned accesses?
> > > >=20
> > > > In working out how to address the (as it turns out, non existent)
> > > > problem, I realized an abstraction for loading big-endian integers
> > > > from the blob would be a useful thing in its own right.  I also
> > > > realized that it's a useful thing not just inside the libfdt code, =
but
> > > > as an external interface.  Callers have always needed to interpret =
the
> > > > contents of individual dt properties, and loading integers from them
> > > > is often a part of that.
> > > >=20
> > > > I know of people using those fdtXX_ld() helpers right now, so I'm n=
ot
> > > > going to take them away.
> > > >=20
> > > > For the case of external users we absolutely do need to handle
> > > > unaligned accesses.  There are a number of existing bindings that m=
ix
> > > > strings and integers in packed format, in a single encoded property.
> > > > So regardless of the alignment of the whole property, we can easily
> > > > get unaligned integers in there, and I don't want to expose multiple
> > > > different helpers for different cases.
> > > >=20
> > > > Now, we don't *have* to use the same helpers for internal use.  We
> > > > could open code the internal loads, or use a special aligned-only
> > > > version inside.  But using the existing external helpers is the
> > > > obvious and simple choice.
> > > >=20
> > > > So, we're back to: I need a case for changing this now, not just a
> > > > case for claiming it wasn't needed in the first place.
> > >=20
> > > For U-Boot, I'm just going to revert this part of the changes.  I wou=
ld
> >=20
> > That seems reasonable for the interim.
> >=20
> > > suggest that you look in to some way to fix the "fast path" here to go
> > > back to the previous way of working so that other project can continue
> > > to use libfdt as well and when callers need to access these helpers a=
nd
> > > are not otherwise in the fast path can do so.
> > >=20
> > > You're adding visible boot time delay with things the way they exist
> > > today.  That's not OK.
> >=20
> > That's a fair point, but you need to make that case in the commit
> > message and merge request, not just expect me to find and collate the
> > arguments from other threads.
>=20
> If you want me to leave the helpers alone but otherwise revert things, I
> can do a v2 and expand the commit message.  And perhaps I'm too nice
> sometimes then but I do pickup and tweak things that are close enough to
> what I want and reword as needed for clarity.
>=20
> I still believe you have things wrong.  There's not an unaligned access
> problem that libfdt needs to care about.  ARM doesn't need help handling
> unaligned accesses.  The only problem that's been reported is from when
> a user got themselves so far off in the weeds that nothing else matters.

Ah!  I think I jut figured out the cause of our misunderstanding.
Looks like property encodings with mixed integers and strings are not
as common as I thought.  At least, not ones that have integer data
*after* string data, which is the case that matters for alignment.
The only examples I could find are IBM specific ones in PAPR, not in
1275 or a common binding (e.g. 'ibm,drc-info' and 'ibm,vpd').

So, chances are you've never encountered them in the ARM world.
Nonetheless they do exist, and we do use libfdt on IBM PAPR systems as
well.

Hrmm... so... chances are reverting this won't hit a problem in
practice... for now.  On ARM, properties with unaligned integers seem
to essentially never exist, and POWER cpus can generally handle
unaligned loads fine.

I remain uneasy about removing the unaligned handling, though.  Even
if you haven't hit it yet, it's entirely possible at some point
someone will attach a device to an ARM system that has a binding with
out-of-alignment integers.  Likewise we have Microwatt (POWER based
open ISA systems) chips on the way, which probably won't handle
unaligned loads, and may or may not have devices with funny bindings.

I really don't want to have a load helper that works most of the time,
but occasionally breaks horribly.

*ponders*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--K9fy5ol1Oes4Q/ix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4w39sACgkQbDjKyiDZ
s5KSjhAApmSQ8ksZ8o1tRFKLWULUaqZh94yY9PqvVCfEuXlyTX5hEpVyJNB/x+4O
uN+jws1Vf3l10yqAQnTeS5z+2OCkoZjyoxpOnYnwFuGiG3W409DNKw/l0F5fdTa6
OFB2MkfRsxOFehk6Hl3alYdjVIltg0x3OBFscySE/bdhLO3wDFGBueKgUNsAGz5z
Itat4eIWhp2UmH79LdEccC/wne77doIclXRnSV+UrYB9odVL3Buxsn9eFfMbOjVl
zZ5RW9lJ75bhEstDcNTN9clYdG8b7WcjER2DzUAGUiPGzt+o3MbD03FMZ10zsNLt
My5roFb6MKuGmk0jlwjFwEBBtvwqUzZlxmcaASgFseNSwgrZ0lSu7wyCBUuuUWj0
GLwvRsHz5BM/aV8KhbPxmpHx+1A5ZNt5arEJgP0F5xHFZy+f7ChY/BKjCxWnj44H
LkiUcwx7a/hD+NRJamfjGgl89jKcNpnJlnK0fMYCS8M54RPOJovxz1PmKc2FZlqv
eOPIXc6oHcWRSyuf8WqmBgfQ2cvZftUnt9NJlZNvhx8n/u9oim6J1Fyh5w5hDM9q
8Kz1j0sPuacz9lx/ii5T5Of7yO3oWy3LPA2g+ZDAn0HmiGGVp3uJQ/qDukid8i5T
7qTGeqWf/xV9Jv2ksDn4l9YejFvvJwt5seYlLPW7I7DILimIfaw=
=s3kf
-----END PGP SIGNATURE-----

--K9fy5ol1Oes4Q/ix--
