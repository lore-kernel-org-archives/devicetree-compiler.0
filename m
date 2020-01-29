From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Wed, 29 Jan 2020 12:49:55 +1100
Message-ID: <20200129014955.GS42099@umbus.fritz.box>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat>
 <20200128085918.GO42099@umbus.fritz.box>
 <20200128134304.GQ13379@bill-the-cat>
 <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pqmPt9oPL4cuP/b5"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580262761;
        bh=0Qvsp6H/55KEWKAk64FyNTqgHCs8hhzugU4FNRuWi8g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hMp9FfgIFxPG4VrlqZAWZ79cbMXrRDpA8lTLrLVdMAgzaWqmMY99lTpkoare0S7R2
         e8QUa+0JhPFLIrxoBqfI4+wRbFMpSWEvo0h3gJOm23QEXOG9O3z6MnlHKAIGClPwlS
         0+BrWJhblgNcRo1o8ghHXS6CaHbKP+oaZwywZN0s=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--pqmPt9oPL4cuP/b5
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
>=20
>=20
> > I still believe you have things wrong.  There's not an unaligned access
> > problem that libfdt needs to care about.  ARM doesn't need help handling
> > unaligned accesses.  The only problem that's been reported is from when
> > a user got themselves so far off in the weeds that nothing else matters.
>=20
> I think while the vast majority of DTBs don't have anything that would
> cause unaligned accesses, that's not guaranteed by the FDT format.
> libfdt needs to handle the worst case.

That's true at a few different levels:

How the dtb is loaded isn't within scope for the fdt spec, and if the
whole thing is loaded unaligned, obviously stuff within it will be
unaligned.  We could make it a requirement for libfdt that the dtb be
loaded at an aligned addresss, though.

The fdt spec does require that the structure block be at an aligned
offset from header, which ensures alignment of the tags (assuming the
load address is aligned).  However, the content of the properties is
again out of scope for the fdt format itself, so bindings can define
unaligned things in there.

In addition the structure block only requires 4-byte alignment (and
only maintains 4-byte alignment even given a more-aligned start
address), which means that 8 byte integers within properties may not
be naturally aligned, even if we don't have weird bindings mixing
strings and numbers.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pqmPt9oPL4cuP/b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4w5MAACgkQbDjKyiDZ
s5JkSRAAxLC6b/5sl0ehid/8lvJXczOCpzwLucqQPdS84an57PxowKMzpVOyw22w
mUMU8xl8MEPtua2Xtd784a0nn34EtgzYRC8LncjpPXQs7RO0PM4kaAmcvMQkIFdT
k/q1avY4/6Iwx84LCNZyz+41iPtUyYPByFEuVFQqv74lCryCBYoiB4X6tMFFk/3S
/KUKzdacqwcA281HnEMvfAphHeQhIHydj+Por/KD0HFnH/RHImGut8FaQ5Wi9inc
KlTO2yQrUR4oFn90Hrn8hTsC0WnA/Vi7z0iwkY+OCo1+pMsGD4me0mhvocb2d9rm
BvN9ePZsU51YAwSEcKstFry5mpSgBjErg4N7nvjJYpI5odw50Ilx8myydJy407BV
RIHwU3eXQvFjFWoN6j3lF85KfoydoKITwZ9TvSQYWva/4ih+jA4eqXyklVLu0579
dlmGnPArCdRq07EuQsSQa5slac4tHcYr/xXOZHzcI8WZatDbv6vIlnpoVT0LfDj+
ezov4B9LFCHvXQXxh5nQWnWqvnBnw/Kpw418K6iCEp38DgI81b/4/5tRn53Ii1kX
d5Scang2vhyAonnpc5byi/p4IaGudqoWMpEXAdQKh8tZhki8/ISrz+UDzxkH7XRZ
uU2o6MDm8ZcpaS2B1U+JipRWVI+XjoYIvpwFWc3RUGY6HjLVgak=
=RMGQ
-----END PGP SIGNATURE-----

--pqmPt9oPL4cuP/b5--
