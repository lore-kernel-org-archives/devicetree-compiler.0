From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Mon, 27 Jan 2020 14:23:51 +1100
Message-ID: <20200127032351.GA1818@umbus.fritz.box>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580095507;
        bh=kl//xh/hBCaWkc05fa0zSGRmeeZfK75cNkWZUDzJOtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OuM9YOmbp86phtcnSQgf/Ob0eMJ0pWsrcrXeIjMhVid/J2NjBE0SNptTArn2ZktKt
         Sz3EJhtJDPTkjDwIpdPs0jo6VvP7YhAWvxo5213mIFvwvMFNMKZLbInyADiCQw0a0b
         rD/DX3vYZyVIDyzQ4AArAxL0c0M0aSctdUen4B8U=
Content-Disposition: inline
In-Reply-To: <20200123121650.GV26536@bill-the-cat>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > > 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" introduc=
ed
> > > changes to support unaligned reads for ARM platforms and 11738cf01f15
> > > "libfdt: Don't use memcpy to handle unaligned reads on ARM" improved =
the
> > > performance of these helpers.
> > >=20
> > > Ultimately however, these helpers should not exist.  Unaligned access
> > > only occurs when images are forced out of alignment by the user.  This
> > > unalignment is not supported and introduces problems later on as other
> > > parts of the system image are unaligned and they too require alignmen=
t.
> > >=20
> > > Revert both of these changes.
> > >=20
> > > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > ---
> > > By way of a little more explanation, looking at the archives it seems
> > > that the initial bug reporter said that they had a platform that was
> > > using U-Boot and had the "fdt_high=3D0xffffffff" set in the environme=
nt.
> > > What that does is to tell U-Boot to not do any of the sanity checks a=
nd
> > > relocation to ensure alignment that it would normally do because the
> > > user knows best.  This later came up on the U-Boot list as once the D=
TB
> > > was loaded, Linux is unhappy because it demands correct alignment.
> > >=20
> > > I only realized libfdt had introduced changes here when it was report=
ed
> > > that boot time had gotten much slower once we merged this change in. =
 It
> > > would be best to just drop it.
> >=20
> > Hmm.  I'm not sure about this.  The commit message makes a case for
> > why the unaligned handling isn't necessary, but not a case for why
> > it's bad.  Even if handling an unaligned tree isn't a common case,
> > isn't it better to be able to than not?
> >=20
> > I gather from the previous discussion that there's a significant
> > performance impact, but that rationale needs to go into the commit
> > message for posterity.
>=20
> I wanted to emphasize that the code simply isn't ever needed, not that
> it's a performance problem.  A performance problem implies that we would
> keep this, if it was fast enough.  That's why people noticed it (it
> slows things down to an unusable level).  But it's functionally wrong.
>=20
> > [snip]
> > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > index fc4c4962a01c..d4ebe915cf46 100644
> > > --- a/libfdt/libfdt.h
> > > +++ b/libfdt/libfdt.h
> > > @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(void *fdt, =
int offset, int checklen)
> > > =20
> > >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> > > =20
> > > -/*
> > > - * Alignment helpers:
> > > - *     These helpers access words from a device tree blob.  They're
> > > - *     built to work even with unaligned pointers on platforms (ike
> > > - *     ARM) that don't like unaligned loads and stores
> > > - */
> > > -
> > > -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > -{
> > > -	const uint8_t *bp =3D (const uint8_t *)p;
> > > -
> > > -	return ((uint32_t)bp[0] << 24)
> > > -		| ((uint32_t)bp[1] << 16)
> > > -		| ((uint32_t)bp[2] << 8)
> > > -		| bp[3];
> > > -}
> >=20
> > In particular, I definitely think removing the helpers entirely is a
> > no go.  They're now part of the published interface of the library.
>=20
> Perhaps "mistakes were made" ?  I don't think we need to worry about
> removing an interface here as projects are avoiding upgrading libfdt
> now (TF-A, formerly ATF) or reverting the change (U-Boot).
>=20
> > Even if they're not used for reading the internal tags, they can be
> > used to load integers from within particular properties.  Those are
> > frequently unaligned, since properties generally have packed
> > representations.
>=20
> I don't see the relevance.  Go back to the initial problem report.  It's
> not "I have a new unique platform I'm using libfdt on and I have
> problems".  It's "I keep jabbing myself with a rusty nail and now I have
> problems".

The initial report isn't the only relevant thing here.  Although it
prompted the change, it wasn't the only consideration in making it.

There's also two separate questions here:
  1) Do we want byteswapping integer load helpers?
  2) Should those handle unaligned accesses?

In working out how to address the (as it turns out, non existent)
problem, I realized an abstraction for loading big-endian integers
=66rom the blob would be a useful thing in its own right.  I also
realized that it's a useful thing not just inside the libfdt code, but
as an external interface.  Callers have always needed to interpret the
contents of individual dt properties, and loading integers from them
is often a part of that.

I know of people using those fdtXX_ld() helpers right now, so I'm not
going to take them away.

For the case of external users we absolutely do need to handle
unaligned accesses.  There are a number of existing bindings that mix
strings and integers in packed format, in a single encoded property.
So regardless of the alignment of the whole property, we can easily
get unaligned integers in there, and I don't want to expose multiple
different helpers for different cases.

Now, we don't *have* to use the same helpers for internal use.  We
could open code the internal loads, or use a special aligned-only
version inside.  But using the existing external helpers is the
obvious and simple choice.

So, we're back to: I need a case for changing this now, not just a
case for claiming it wasn't needed in the first place.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4uV8QACgkQbDjKyiDZ
s5L69hAAxm7Gc6hFI/7aMNoty2kQ4VDSFxlP8vrnGUvXr/S4GEC4BPacrRGGJP/8
rLwS4NPBMTTG3YeWTM8AHRSbHHbhxTIdlQ1atHDX1GgZQHsY/Dg7wjVx/GPQcm34
UeY5XiXJX1feBeUwzW/+0BYuw4YSi1zoVYZxm7W2FP8bArdwVDA2JOejqlTyoM+w
bdtySqFDVina4xZjiPh7ygGfbPP1iV51Jt1Zja0u5Bvs75tk7vdgnriyQH00L0bS
hGzkYxZbEPaPMX/vhltlxbFjnAT6bqs2ZaaiOz9NHb8Db8bcEInQXd1rIHDreu51
FI6OKeXrlAWDaAfuvQBW+SY+/xOI579e2uDcTlwYxbAk/DiOXBJOSMzeOENqQ/mV
gTVMnsFtedlpH4oxM1uYHZ+zlUDFpw+BvN/+v214lnN3QIHDAmu7yuV2zlah3Ckt
ZrAFJAzD1c/BzUMVMZRTThJDgu6ft19NJY7jMQ1vZQyWU4Os/m0ihJ8CDOuNA4fl
Em0HEI9RRlh8T8hTq5+rLvUJ+DfuBT/B5cHRQV/u3u57/gAI9VWcoE4dsY01b/Gs
2EF/clf0IpgwD5Ct4RfosJfvbJCGGD9iHfu4cWb09PeTc4xyOiThRxfpjwhvDiq/
42Qcm5foYxmN8bU+0dNc6KA9unGfbH0Nxok6KVITdcnKIP8mf98=
=gBlJ
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
