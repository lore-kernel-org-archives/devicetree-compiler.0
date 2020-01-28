From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Tue, 28 Jan 2020 08:43:04 -0500
Message-ID: <20200128134304.GQ13379@bill-the-cat>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat>
 <20200128085918.GO42099@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VmyrZ50r30oK77nV"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CaHR1feKGpGoGq0bGwiWqA6t/zjN2706EjKZ3ow5bGU=;
        b=NoXGAqTyZYQGWvm+WYZSCM+hX06O+ESmCx3NV3OXUGO+t0zpLVk7W9udYyBWceWGaV
         SmMzJ1F35JOV+gUmY+OsJ/h4ZFR2MXhUNrco9UlhUJD2gQQChAX5ZitICdFxMtDxyufS
         ZmElUva6xVsnubpAtkPHhLduMcwrNt/gZNGps=
Content-Disposition: inline
In-Reply-To: <20200128085918.GO42099-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--VmyrZ50r30oK77nV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 07:59:18PM +1100, David Gibson wrote:
> On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> > On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> > > On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> > > > On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > > > > On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > > > > > 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" in=
troduced
> > > > > > changes to support unaligned reads for ARM platforms and 11738c=
f01f15
> > > > > > "libfdt: Don't use memcpy to handle unaligned reads on ARM" imp=
roved the
> > > > > > performance of these helpers.
> > > > > >=20
> > > > > > Ultimately however, these helpers should not exist.  Unaligned =
access
> > > > > > only occurs when images are forced out of alignment by the user=
=2E  This
> > > > > > unalignment is not supported and introduces problems later on a=
s other
> > > > > > parts of the system image are unaligned and they too require al=
ignment.
> > > > > >=20
> > > > > > Revert both of these changes.
> > > > > >=20
> > > > > > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > > > > ---
> > > > > > By way of a little more explanation, looking at the archives it=
 seems
> > > > > > that the initial bug reporter said that they had a platform tha=
t was
> > > > > > using U-Boot and had the "fdt_high=3D0xffffffff" set in the env=
ironment.
> > > > > > What that does is to tell U-Boot to not do any of the sanity ch=
ecks and
> > > > > > relocation to ensure alignment that it would normally do becaus=
e the
> > > > > > user knows best.  This later came up on the U-Boot list as once=
 the DTB
> > > > > > was loaded, Linux is unhappy because it demands correct alignme=
nt.
> > > > > >=20
> > > > > > I only realized libfdt had introduced changes here when it was =
reported
> > > > > > that boot time had gotten much slower once we merged this chang=
e in.  It
> > > > > > would be best to just drop it.
> > > > >=20
> > > > > Hmm.  I'm not sure about this.  The commit message makes a case f=
or
> > > > > why the unaligned handling isn't necessary, but not a case for why
> > > > > it's bad.  Even if handling an unaligned tree isn't a common case,
> > > > > isn't it better to be able to than not?
> > > > >=20
> > > > > I gather from the previous discussion that there's a significant
> > > > > performance impact, but that rationale needs to go into the commit
> > > > > message for posterity.
> > > >=20
> > > > I wanted to emphasize that the code simply isn't ever needed, not t=
hat
> > > > it's a performance problem.  A performance problem implies that we =
would
> > > > keep this, if it was fast enough.  That's why people noticed it (it
> > > > slows things down to an unusable level).  But it's functionally wro=
ng.
> > > >=20
> > > > > [snip]
> > > > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > > > index fc4c4962a01c..d4ebe915cf46 100644
> > > > > > --- a/libfdt/libfdt.h
> > > > > > +++ b/libfdt/libfdt.h
> > > > > > @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(void =
*fdt, int offset, int checklen)
> > > > > > =20
> > > > > >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextof=
fset);
> > > > > > =20
> > > > > > -/*
> > > > > > - * Alignment helpers:
> > > > > > - *     These helpers access words from a device tree blob.  Th=
ey're
> > > > > > - *     built to work even with unaligned pointers on platforms=
 (ike
> > > > > > - *     ARM) that don't like unaligned loads and stores
> > > > > > - */
> > > > > > -
> > > > > > -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > > > > -{
> > > > > > -	const uint8_t *bp =3D (const uint8_t *)p;
> > > > > > -
> > > > > > -	return ((uint32_t)bp[0] << 24)
> > > > > > -		| ((uint32_t)bp[1] << 16)
> > > > > > -		| ((uint32_t)bp[2] << 8)
> > > > > > -		| bp[3];
> > > > > > -}
> > > > >=20
> > > > > In particular, I definitely think removing the helpers entirely i=
s a
> > > > > no go.  They're now part of the published interface of the librar=
y.
> > > >=20
> > > > Perhaps "mistakes were made" ?  I don't think we need to worry about
> > > > removing an interface here as projects are avoiding upgrading libfdt
> > > > now (TF-A, formerly ATF) or reverting the change (U-Boot).
> > > >=20
> > > > > Even if they're not used for reading the internal tags, they can =
be
> > > > > used to load integers from within particular properties.  Those a=
re
> > > > > frequently unaligned, since properties generally have packed
> > > > > representations.
> > > >=20
> > > > I don't see the relevance.  Go back to the initial problem report. =
 It's
> > > > not "I have a new unique platform I'm using libfdt on and I have
> > > > problems".  It's "I keep jabbing myself with a rusty nail and now I=
 have
> > > > problems".
> > >=20
> > > The initial report isn't the only relevant thing here.  Although it
> > > prompted the change, it wasn't the only consideration in making it.
> > >=20
> > > There's also two separate questions here:
> > >   1) Do we want byteswapping integer load helpers?
> > >   2) Should those handle unaligned accesses?
> > >=20
> > > In working out how to address the (as it turns out, non existent)
> > > problem, I realized an abstraction for loading big-endian integers
> > > from the blob would be a useful thing in its own right.  I also
> > > realized that it's a useful thing not just inside the libfdt code, but
> > > as an external interface.  Callers have always needed to interpret the
> > > contents of individual dt properties, and loading integers from them
> > > is often a part of that.
> > >=20
> > > I know of people using those fdtXX_ld() helpers right now, so I'm not
> > > going to take them away.
> > >=20
> > > For the case of external users we absolutely do need to handle
> > > unaligned accesses.  There are a number of existing bindings that mix
> > > strings and integers in packed format, in a single encoded property.
> > > So regardless of the alignment of the whole property, we can easily
> > > get unaligned integers in there, and I don't want to expose multiple
> > > different helpers for different cases.
> > >=20
> > > Now, we don't *have* to use the same helpers for internal use.  We
> > > could open code the internal loads, or use a special aligned-only
> > > version inside.  But using the existing external helpers is the
> > > obvious and simple choice.
> > >=20
> > > So, we're back to: I need a case for changing this now, not just a
> > > case for claiming it wasn't needed in the first place.
> >=20
> > For U-Boot, I'm just going to revert this part of the changes.  I would
>=20
> That seems reasonable for the interim.
>=20
> > suggest that you look in to some way to fix the "fast path" here to go
> > back to the previous way of working so that other project can continue
> > to use libfdt as well and when callers need to access these helpers and
> > are not otherwise in the fast path can do so.
> >=20
> > You're adding visible boot time delay with things the way they exist
> > today.  That's not OK.
>=20
> That's a fair point, but you need to make that case in the commit
> message and merge request, not just expect me to find and collate the
> arguments from other threads.

If you want me to leave the helpers alone but otherwise revert things, I
can do a v2 and expand the commit message.  And perhaps I'm too nice
sometimes then but I do pickup and tweak things that are close enough to
what I want and reword as needed for clarity.

I still believe you have things wrong.  There's not an unaligned access
problem that libfdt needs to care about.  ARM doesn't need help handling
unaligned accesses.  The only problem that's been reported is from when
a user got themselves so far off in the weeds that nothing else matters.

> > I wouldn't have updated U-Boot with these
> > changes if we had automated timing tests like the TF-A folks do.
> >=20
> > Please do let us know if you have any changes to try that might
> > alleviate the overall problem.  Thanks!
>=20
> I finally got around to looking through Simon Glass's patches for
> reducing libfdt code size with various "asusmption" flags.  I think
> it's a good concept and close to being ready.
>=20
> I don't think it's the only thing we want to do, but one thing we
> could do is to add another ASSUME_ALIGNED flag that will simplify the
> load helpers.

You had mentioned other cases you now see as being possible problems.
Can you make these cases fail without these helpers?  If so then the
assumption flag stuff could be used with the default being the way
things were before.

Thanks!

--=20
Tom

--VmyrZ50r30oK77nV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4wOl4ACgkQh/n2NdMd
dlJOfBAArVjOMu+iHrM3WrsypVW7M0/g6vJz0ua1iHSBe7V0jEog89C4lmLZpEuT
fhqPfXQbELKtAtBVdI5y59q4rJcp8+8dR83CyjjcGb/lIom98AOFmEsvImspEjtu
2V/istaI83ZzVaNnzR+iwja4Gz8WwQJBf/Dmp8Ee9Xlcpn1JS/fR9ePi0hwVVTsX
ZbN77GjxMocjSzN4vwAw/ucvfnPBc+FInOisuGKGcCwWQUH5y1S2vBsW2o23zB0e
8ecloR4qt7ew6wFAlbifUK8w31SLXYn1vcQvs/acH82d811u0X95vf3X2Dx6yHtw
Bkr9S07hcUn5hUbCF4C5wJtyuAPmWTTlbbAf9g/lIei7ueu0xWvtvehxyU7Eli8s
zqRF7ArOrvG31GTHRhxGBbFl+A/TlslL6dicp6Zo4mXo0HPXknbhVCU7Q3YrPpAZ
LUPBOA+8mXWIvPEIPX0rAwNKpupzESiXprARMVz4X1goeDcSr4gyK1AP8PeYHuWn
XCYAQlqpQk+QmgQg87lMSMPyMJxuPVXNR4jmi4aPddUOm+yzZnTTrE5g27FivSI6
feZQjpUaMtqFQwX2h+7JoOIrlBUKVMKdbYO+IoUYsXcVoK/RhfhBcOf7f53lTwjc
wdtyTuSLW1iJNNKqIlNOKND0tvedID8izdpqwLlU4rhga8o3FZI=
=RQv3
-----END PGP SIGNATURE-----

--VmyrZ50r30oK77nV--
