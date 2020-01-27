From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Mon, 27 Jan 2020 10:04:34 -0500
Message-ID: <20200127150434.GJ9259@bill-the-cat>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="apbmkPN6Hu/1dI3g"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/CMDXLl7B0gG3Yq1URrdSz2/4QHmWn5YVk+oUPvWPOs=;
        b=ULTy2X4vumpUcMP7oyisnvIk1vNYEkwuPf/mGn5swn4XpoSnJFzam+xQZWXW8ET10x
         Gj4AG/ZxOvXW9CsOtKc5r5vQ7YzlDczwk2YeB2Q7Pg8411CsCpGSGcz2kh5En0fw9MPq
         pVCNVuJfwtLO9Zz0J/+wuRlhjJhksoRCDBf6w=
Content-Disposition: inline
In-Reply-To: <20200127032351.GA1818-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--apbmkPN6Hu/1dI3g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> > On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > > On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > > > 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" introd=
uced
> > > > changes to support unaligned reads for ARM platforms and 11738cf01f=
15
> > > > "libfdt: Don't use memcpy to handle unaligned reads on ARM" improve=
d the
> > > > performance of these helpers.
> > > >=20
> > > > Ultimately however, these helpers should not exist.  Unaligned acce=
ss
> > > > only occurs when images are forced out of alignment by the user.  T=
his
> > > > unalignment is not supported and introduces problems later on as ot=
her
> > > > parts of the system image are unaligned and they too require alignm=
ent.
> > > >=20
> > > > Revert both of these changes.
> > > >=20
> > > > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > > ---
> > > > By way of a little more explanation, looking at the archives it see=
ms
> > > > that the initial bug reporter said that they had a platform that was
> > > > using U-Boot and had the "fdt_high=3D0xffffffff" set in the environ=
ment.
> > > > What that does is to tell U-Boot to not do any of the sanity checks=
 and
> > > > relocation to ensure alignment that it would normally do because the
> > > > user knows best.  This later came up on the U-Boot list as once the=
 DTB
> > > > was loaded, Linux is unhappy because it demands correct alignment.
> > > >=20
> > > > I only realized libfdt had introduced changes here when it was repo=
rted
> > > > that boot time had gotten much slower once we merged this change in=
=2E  It
> > > > would be best to just drop it.
> > >=20
> > > Hmm.  I'm not sure about this.  The commit message makes a case for
> > > why the unaligned handling isn't necessary, but not a case for why
> > > it's bad.  Even if handling an unaligned tree isn't a common case,
> > > isn't it better to be able to than not?
> > >=20
> > > I gather from the previous discussion that there's a significant
> > > performance impact, but that rationale needs to go into the commit
> > > message for posterity.
> >=20
> > I wanted to emphasize that the code simply isn't ever needed, not that
> > it's a performance problem.  A performance problem implies that we would
> > keep this, if it was fast enough.  That's why people noticed it (it
> > slows things down to an unusable level).  But it's functionally wrong.
> >=20
> > > [snip]
> > > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > > index fc4c4962a01c..d4ebe915cf46 100644
> > > > --- a/libfdt/libfdt.h
> > > > +++ b/libfdt/libfdt.h
> > > > @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(void *fdt=
, int offset, int checklen)
> > > > =20
> > > >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset=
);
> > > > =20
> > > > -/*
> > > > - * Alignment helpers:
> > > > - *     These helpers access words from a device tree blob.  They're
> > > > - *     built to work even with unaligned pointers on platforms (ike
> > > > - *     ARM) that don't like unaligned loads and stores
> > > > - */
> > > > -
> > > > -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > > -{
> > > > -	const uint8_t *bp =3D (const uint8_t *)p;
> > > > -
> > > > -	return ((uint32_t)bp[0] << 24)
> > > > -		| ((uint32_t)bp[1] << 16)
> > > > -		| ((uint32_t)bp[2] << 8)
> > > > -		| bp[3];
> > > > -}
> > >=20
> > > In particular, I definitely think removing the helpers entirely is a
> > > no go.  They're now part of the published interface of the library.
> >=20
> > Perhaps "mistakes were made" ?  I don't think we need to worry about
> > removing an interface here as projects are avoiding upgrading libfdt
> > now (TF-A, formerly ATF) or reverting the change (U-Boot).
> >=20
> > > Even if they're not used for reading the internal tags, they can be
> > > used to load integers from within particular properties.  Those are
> > > frequently unaligned, since properties generally have packed
> > > representations.
> >=20
> > I don't see the relevance.  Go back to the initial problem report.  It's
> > not "I have a new unique platform I'm using libfdt on and I have
> > problems".  It's "I keep jabbing myself with a rusty nail and now I have
> > problems".
>=20
> The initial report isn't the only relevant thing here.  Although it
> prompted the change, it wasn't the only consideration in making it.
>=20
> There's also two separate questions here:
>   1) Do we want byteswapping integer load helpers?
>   2) Should those handle unaligned accesses?
>=20
> In working out how to address the (as it turns out, non existent)
> problem, I realized an abstraction for loading big-endian integers
> from the blob would be a useful thing in its own right.  I also
> realized that it's a useful thing not just inside the libfdt code, but
> as an external interface.  Callers have always needed to interpret the
> contents of individual dt properties, and loading integers from them
> is often a part of that.
>=20
> I know of people using those fdtXX_ld() helpers right now, so I'm not
> going to take them away.
>=20
> For the case of external users we absolutely do need to handle
> unaligned accesses.  There are a number of existing bindings that mix
> strings and integers in packed format, in a single encoded property.
> So regardless of the alignment of the whole property, we can easily
> get unaligned integers in there, and I don't want to expose multiple
> different helpers for different cases.
>=20
> Now, we don't *have* to use the same helpers for internal use.  We
> could open code the internal loads, or use a special aligned-only
> version inside.  But using the existing external helpers is the
> obvious and simple choice.
>=20
> So, we're back to: I need a case for changing this now, not just a
> case for claiming it wasn't needed in the first place.

For U-Boot, I'm just going to revert this part of the changes.  I would
suggest that you look in to some way to fix the "fast path" here to go
back to the previous way of working so that other project can continue
to use libfdt as well and when callers need to access these helpers and
are not otherwise in the fast path can do so.

You're adding visible boot time delay with things the way they exist
today.  That's not OK.  I wouldn't have updated U-Boot with these
changes if we had automated timing tests like the TF-A folks do.

Please do let us know if you have any changes to try that might
alleviate the overall problem.  Thanks!

--=20
Tom

--apbmkPN6Hu/1dI3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4u/AIACgkQh/n2NdMd
dlJLYQ//dmIs3VOZ8RYBpI7yCErV8UBqDOB6h768o47wMsX1j29XI0KzDLjSjtbY
j+GCnfbB9sg9DNywRARzkvMWxflbAVrfkzg01ymisReCA4OTidPDDhNuY9/PlXck
/BPjRkP/I3KXPYKk5YYMMaLm4hboTFE/g1bwKNRLL2S5Bxo3UTg6fEWvQFVp4T7f
nv7RxRBxwabzrAhGhetV8jhVPAX9oV2W5LOKcsMqlmBeMS92JLE5diMksHPSS+k3
8x2V/qV4KbXh+dryv3OaOuKNBP7sJu5ZiFsd6kMXUQRZW+BsDONaBey9m41fTY0g
uWCDBU/vutk7NoFcViQJfWYo2Bm7hAGzzijNJt6ScaQZ4DGNHhr+nG97A9aXM+Bv
FR/4Bknxn4nod9UwlRwpt70CX1x23Fpqs1rjNO46AVaHeCwRj4UQCU19Zsv+tLgm
kRqCYbCL9sQ/gXXThPvj9egD9iEGELLoBph/yi4qg2t1u2q2zSUMM97J+SH8pmWp
310U1aeDcNIxRHcLUrIUgxDra/6TCiABRJufZ5XZY0ZG/v0ltSRBhZLxfTN5z9bE
VRXzaqy/JFRSFRzmblFxGmBmUMeJZtejyEWYnTVEwM4sEpqGNNUIMub4NHDZimKq
39bE8OQ4NvhGmTLIvJIEy/gZa+WLM2+B+dM2Th00jM3rqY66+SE=
=CE67
-----END PGP SIGNATURE-----

--apbmkPN6Hu/1dI3g--
