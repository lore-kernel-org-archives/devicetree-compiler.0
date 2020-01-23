From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Thu, 23 Jan 2020 07:16:50 -0500
Message-ID: <20200123121650.GV26536@bill-the-cat>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fxBYc4U7HLIDBZ2G"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p6/tP1G7NdyGSlfVjcTF6cT+bpreMVFSu001vpoLfeI=;
        b=tigp4CrBCyrULR+wDyQk3JZOTQd5+rk2Ep+j8tyCOVNtrcOet9TbanPrFHf1/fCcBG
         6OF9ipsVOwdz5LUp+RkjWO5h6mdc5iOb9CWacgrsDjzvTovPF+oogAZpqzDrxiXyCH9p
         2epCq3FbF1TYlsg1U5CYdUhTuAhiergxyFAdY=
Content-Disposition: inline
In-Reply-To: <20200123091440.GQ2347-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--fxBYc4U7HLIDBZ2G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" introduced
> > changes to support unaligned reads for ARM platforms and 11738cf01f15
> > "libfdt: Don't use memcpy to handle unaligned reads on ARM" improved the
> > performance of these helpers.
> >=20
> > Ultimately however, these helpers should not exist.  Unaligned access
> > only occurs when images are forced out of alignment by the user.  This
> > unalignment is not supported and introduces problems later on as other
> > parts of the system image are unaligned and they too require alignment.
> >=20
> > Revert both of these changes.
> >=20
> > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> > By way of a little more explanation, looking at the archives it seems
> > that the initial bug reporter said that they had a platform that was
> > using U-Boot and had the "fdt_high=3D0xffffffff" set in the environment.
> > What that does is to tell U-Boot to not do any of the sanity checks and
> > relocation to ensure alignment that it would normally do because the
> > user knows best.  This later came up on the U-Boot list as once the DTB
> > was loaded, Linux is unhappy because it demands correct alignment.
> >=20
> > I only realized libfdt had introduced changes here when it was reported
> > that boot time had gotten much slower once we merged this change in.  It
> > would be best to just drop it.
>=20
> Hmm.  I'm not sure about this.  The commit message makes a case for
> why the unaligned handling isn't necessary, but not a case for why
> it's bad.  Even if handling an unaligned tree isn't a common case,
> isn't it better to be able to than not?
>=20
> I gather from the previous discussion that there's a significant
> performance impact, but that rationale needs to go into the commit
> message for posterity.

I wanted to emphasize that the code simply isn't ever needed, not that
it's a performance problem.  A performance problem implies that we would
keep this, if it was fast enough.  That's why people noticed it (it
slows things down to an unusable level).  But it's functionally wrong.

> [snip]
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index fc4c4962a01c..d4ebe915cf46 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(void *fdt, in=
t offset, int checklen)
> > =20
> >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> > =20
> > -/*
> > - * Alignment helpers:
> > - *     These helpers access words from a device tree blob.  They're
> > - *     built to work even with unaligned pointers on platforms (ike
> > - *     ARM) that don't like unaligned loads and stores
> > - */
> > -
> > -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > -{
> > -	const uint8_t *bp =3D (const uint8_t *)p;
> > -
> > -	return ((uint32_t)bp[0] << 24)
> > -		| ((uint32_t)bp[1] << 16)
> > -		| ((uint32_t)bp[2] << 8)
> > -		| bp[3];
> > -}
>=20
> In particular, I definitely think removing the helpers entirely is a
> no go.  They're now part of the published interface of the library.

Perhaps "mistakes were made" ?  I don't think we need to worry about
removing an interface here as projects are avoiding upgrading libfdt
now (TF-A, formerly ATF) or reverting the change (U-Boot).

> Even if they're not used for reading the internal tags, they can be
> used to load integers from within particular properties.  Those are
> frequently unaligned, since properties generally have packed
> representations.

I don't see the relevance.  Go back to the initial problem report.  It's
not "I have a new unique platform I'm using libfdt on and I have
problems".  It's "I keep jabbing myself with a rusty nail and now I have
problems".

> How much of the performance loss would we get back if we put an actual
> conditional on an aligned address in the helpers?

I don't know but to be very clear, we don't ever need these on ARM.
Keep in mind we've been using device trees on ARM for over 10 years at
this point.

--=20
Tom

--fxBYc4U7HLIDBZ2G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4pjq8ACgkQh/n2NdMd
dlLKZBAAo1Nnbi/BD5vaBPypOIisv5amIKvSDX56qcFqVdBhx32ojBP2DEMoshyo
RnELP7Kov1GX6tt0Yz8xRF0P8Nw9GgjeUTFqA9fX4oGaaX2Op59cAViBOrt6hCV9
EzOgB+5j3jDZQ5sS2YezGLrXYpbw4MypnKazeB6JziurTK/8KroeBUrrYLNYyGi2
gS2TLjSUwt/XK8WBdpbEwVQOTC24VzvWL7BNRZZi6QaIkkypI0MfmzhMwKv/E89m
NZj/nGLVvNlqu5jkUAGnJ5HOv60AqBvgCN5fIhs/xG3DGCulsQ7Zne9Uc7+KnKmi
hRdKN4yQ7l4jZUSofQFYli/7Vuvt3lzqBGkD6wCdIYTuViSH+gnSoyJ0LrpW5gH9
mXcwwlVUg1ZfyjoAhGv3aJXQNwLjURKzpk7HuvPARow//KHnUF+4tlGpPwNtKg2X
+i8epqoPpmxIBHk9CLFMprj/qwGnQh6+27RgCGiYQbc//6v3sm/cdf3lbfEXVhRI
Lvz05IjgYkSv6ZL94zjywXq973aW/RTkyVmEA0iF0qAf3kyRK2HBs59LaZLeiYtV
jv8F7eAJicapcrFyORjxgmR+7fGcEABcs7qkKHaoiRjQElXOpVvZtM64aaY7p3qj
4UbRnCWTeuki6D65IvaTe5HpZVKDWqd/7cJOy2Wt4BQ4HFrwi1U=
=Q9EV
-----END PGP SIGNATURE-----

--fxBYc4U7HLIDBZ2G--
