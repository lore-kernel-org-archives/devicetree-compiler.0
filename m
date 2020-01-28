From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Tue, 28 Jan 2020 19:59:18 +1100
Message-ID: <20200128085918.GO42099@umbus.fritz.box>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JVu9XMG6uEpKCPDY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580201978;
        bh=pIIU1HYeWiDfvVkeVomu38DDGLmji6aEXcOKczddhM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZfP5TYwUrfjc0ijya9R9YS3+wieuFxYsGhQ5wNMmIoDGBhe09Hy1kW8sKFFf0ypwl
         A+RXBjS3hE6foxAVh1XfBAZ+wluD5cfjEVU35frAs0BfQb+gEXoESssITC4OWI+yPz
         ri0EMPyfd5NmhlVCdduclNXLsPq8ww0BJ6r4GODs=
Content-Disposition: inline
In-Reply-To: <20200127150434.GJ9259@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--JVu9XMG6uEpKCPDY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> > On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> > > On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > > > On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > > > > 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" intr=
oduced
> > > > > changes to support unaligned reads for ARM platforms and 11738cf0=
1f15
> > > > > "libfdt: Don't use memcpy to handle unaligned reads on ARM" impro=
ved the
> > > > > performance of these helpers.
> > > > >=20
> > > > > Ultimately however, these helpers should not exist.  Unaligned ac=
cess
> > > > > only occurs when images are forced out of alignment by the user. =
 This
> > > > > unalignment is not supported and introduces problems later on as =
other
> > > > > parts of the system image are unaligned and they too require alig=
nment.
> > > > >=20
> > > > > Revert both of these changes.
> > > > >=20
> > > > > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > > > ---
> > > > > By way of a little more explanation, looking at the archives it s=
eems
> > > > > that the initial bug reporter said that they had a platform that =
was
> > > > > using U-Boot and had the "fdt_high=3D0xffffffff" set in the envir=
onment.
> > > > > What that does is to tell U-Boot to not do any of the sanity chec=
ks and
> > > > > relocation to ensure alignment that it would normally do because =
the
> > > > > user knows best.  This later came up on the U-Boot list as once t=
he DTB
> > > > > was loaded, Linux is unhappy because it demands correct alignment.
> > > > >=20
> > > > > I only realized libfdt had introduced changes here when it was re=
ported
> > > > > that boot time had gotten much slower once we merged this change =
in.  It
> > > > > would be best to just drop it.
> > > >=20
> > > > Hmm.  I'm not sure about this.  The commit message makes a case for
> > > > why the unaligned handling isn't necessary, but not a case for why
> > > > it's bad.  Even if handling an unaligned tree isn't a common case,
> > > > isn't it better to be able to than not?
> > > >=20
> > > > I gather from the previous discussion that there's a significant
> > > > performance impact, but that rationale needs to go into the commit
> > > > message for posterity.
> > >=20
> > > I wanted to emphasize that the code simply isn't ever needed, not that
> > > it's a performance problem.  A performance problem implies that we wo=
uld
> > > keep this, if it was fast enough.  That's why people noticed it (it
> > > slows things down to an unusable level).  But it's functionally wrong.
> > >=20
> > > > [snip]
> > > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > > index fc4c4962a01c..d4ebe915cf46 100644
> > > > > --- a/libfdt/libfdt.h
> > > > > +++ b/libfdt/libfdt.h
> > > > > @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(void *f=
dt, int offset, int checklen)
> > > > > =20
> > > > >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffs=
et);
> > > > > =20
> > > > > -/*
> > > > > - * Alignment helpers:
> > > > > - *     These helpers access words from a device tree blob.  They=
're
> > > > > - *     built to work even with unaligned pointers on platforms (=
ike
> > > > > - *     ARM) that don't like unaligned loads and stores
> > > > > - */
> > > > > -
> > > > > -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > > > -{
> > > > > -	const uint8_t *bp =3D (const uint8_t *)p;
> > > > > -
> > > > > -	return ((uint32_t)bp[0] << 24)
> > > > > -		| ((uint32_t)bp[1] << 16)
> > > > > -		| ((uint32_t)bp[2] << 8)
> > > > > -		| bp[3];
> > > > > -}
> > > >=20
> > > > In particular, I definitely think removing the helpers entirely is a
> > > > no go.  They're now part of the published interface of the library.
> > >=20
> > > Perhaps "mistakes were made" ?  I don't think we need to worry about
> > > removing an interface here as projects are avoiding upgrading libfdt
> > > now (TF-A, formerly ATF) or reverting the change (U-Boot).
> > >=20
> > > > Even if they're not used for reading the internal tags, they can be
> > > > used to load integers from within particular properties.  Those are
> > > > frequently unaligned, since properties generally have packed
> > > > representations.
> > >=20
> > > I don't see the relevance.  Go back to the initial problem report.  I=
t's
> > > not "I have a new unique platform I'm using libfdt on and I have
> > > problems".  It's "I keep jabbing myself with a rusty nail and now I h=
ave
> > > problems".
> >=20
> > The initial report isn't the only relevant thing here.  Although it
> > prompted the change, it wasn't the only consideration in making it.
> >=20
> > There's also two separate questions here:
> >   1) Do we want byteswapping integer load helpers?
> >   2) Should those handle unaligned accesses?
> >=20
> > In working out how to address the (as it turns out, non existent)
> > problem, I realized an abstraction for loading big-endian integers
> > from the blob would be a useful thing in its own right.  I also
> > realized that it's a useful thing not just inside the libfdt code, but
> > as an external interface.  Callers have always needed to interpret the
> > contents of individual dt properties, and loading integers from them
> > is often a part of that.
> >=20
> > I know of people using those fdtXX_ld() helpers right now, so I'm not
> > going to take them away.
> >=20
> > For the case of external users we absolutely do need to handle
> > unaligned accesses.  There are a number of existing bindings that mix
> > strings and integers in packed format, in a single encoded property.
> > So regardless of the alignment of the whole property, we can easily
> > get unaligned integers in there, and I don't want to expose multiple
> > different helpers for different cases.
> >=20
> > Now, we don't *have* to use the same helpers for internal use.  We
> > could open code the internal loads, or use a special aligned-only
> > version inside.  But using the existing external helpers is the
> > obvious and simple choice.
> >=20
> > So, we're back to: I need a case for changing this now, not just a
> > case for claiming it wasn't needed in the first place.
>=20
> For U-Boot, I'm just going to revert this part of the changes.  I would

That seems reasonable for the interim.

> suggest that you look in to some way to fix the "fast path" here to go
> back to the previous way of working so that other project can continue
> to use libfdt as well and when callers need to access these helpers and
> are not otherwise in the fast path can do so.
>=20
> You're adding visible boot time delay with things the way they exist
> today.  That's not OK.

That's a fair point, but you need to make that case in the commit
message and merge request, not just expect me to find and collate the
arguments from other threads.

> I wouldn't have updated U-Boot with these
> changes if we had automated timing tests like the TF-A folks do.
>=20
> Please do let us know if you have any changes to try that might
> alleviate the overall problem.  Thanks!

I finally got around to looking through Simon Glass's patches for
reducing libfdt code size with various "asusmption" flags.  I think
it's a good concept and close to being ready.

I don't think it's the only thing we want to do, but one thing we
could do is to add another ASSUME_ALIGNED flag that will simplify the
load helpers.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JVu9XMG6uEpKCPDY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4v9+MACgkQbDjKyiDZ
s5KHnRAAjqTaET3a7PACY1kPk5xspK+3snX8HQ1j7aQYpIPabON/KwXxPrx9rzCr
7+W8YPzQcAvT8gHp+ZDq4CdEseVOoB/1EwPd3VTbxneabW5WPyfXgi2CYF3miKkI
t5oHISrFGDUL9dn/oWVsaWFjD1AlBZqARIvrCyal8EDgPpojdNFOm02mkyIdcKGX
DT5JZaZ6yooBgE3U3we+EYQnsPAaKwOUeNSiTksKER7bHnkTa3HwazOwFBnY1H4h
FYCogYQawjh3oaBxuRQZfmCaLXjtznh9V+u+oJNLiySi8teezssjEXoGTR9lu3oK
XVseZujDi1oZp3TnPSZdIYHjie1pTOITIQAYaiwyjChDve7mDdCciZVKg9n0RZ0Y
emwCzzRuohDZZVrOLJdQyUTPF5qPNVYslRqKwMpNPIYArAuorkIAaTh7d1LM/iOS
M9T5fb7h7vQA8Ts/f2Azv3jtdbeS/AdgoWTafRfEHfLVf9ylgs2NN4IAAYypt0BE
pbNBIXZWXennNCUxv6C2ZJeZB2ewjEmWFS+qdrJFRQWue8se02wUI79H8G5zq7UO
YCuhQDNDY4qULlyuX3FOlfCjc4HjUnOpshHkPI0XSBqRDPj5PfjsksPxKV1wkDOh
9Z1kqAkaLRdzweHc8NNmNuo7rVXB6y+vwxJaBhVzU8dm2UzWc7k=
=XoDp
-----END PGP SIGNATURE-----

--JVu9XMG6uEpKCPDY--
