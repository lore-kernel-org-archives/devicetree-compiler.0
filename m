From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Thu, 30 Jan 2020 15:49:29 -0500
Message-ID: <20200130204929.GG13379@bill-the-cat>
References: <20200117153106.29909-1-trini@konsulko.com>
 <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat>
 <20200128085918.GO42099@umbus.fritz.box>
 <20200128134304.GQ13379@bill-the-cat>
 <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
 <c56c4206-1be1-1701-1423-1f74f6913bbf@st.com>
 <CAL_Jsq+43Opib7vUpZ_VxbJig3gT8crBoL6nw_yC=xOfcsbOvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yBTt7CTH+yMq4SuJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q/4tVK1Yt/dWi7kamufLSZg/T+k6bSGv9QwRYwFaw9A=;
        b=J4tBpfkFH7d5MU2B9hlJ0hncue/po6iXJO/QosrssKLSuHVSKhOpyFVDmJuIRZ/nlp
         KQyHs9j4lxSVbdHwfiXyvOoK3b5ecxBPSzuMnK9hr2TZZG/zpYf6zh0y/UNBf+wfrWYo
         uYSSQ4F80pEmhHUndVZDLPGnmXAMb6eaMEywY=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+43Opib7vUpZ_VxbJig3gT8crBoL6nw_yC=xOfcsbOvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--yBTt7CTH+yMq4SuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 02:18:21PM -0600, Rob Herring wrote:
> On Thu, Jan 30, 2020 at 8:44 AM Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org> =
wrote:
> >
> > Hi Rob, Tom, David
> >
> > On 1/28/20 3:08 PM, Rob Herring wrote:
> > > On Tue, Jan 28, 2020 at 7:43 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > >> On Tue, Jan 28, 2020 at 07:59:18PM +1100, David Gibson wrote:
> > >>> On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> > >>>> On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> > >>>>> On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> > >>>>>> On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > >>>>>>> On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > >>>>>>>> 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words" i=
ntroduced
> > >>>>>>>> changes to support unaligned reads for ARM platforms and 11738=
cf01f15
> > >>>>>>>> "libfdt: Don't use memcpy to handle unaligned reads on ARM" im=
proved the
> > >>>>>>>> performance of these helpers.
> > >>>>>>>>
> > >>>>>>>> Ultimately however, these helpers should not exist.  Unaligned=
 access
> > >>>>>>>> only occurs when images are forced out of alignment by the use=
r.  This
> > >>>>>>>> unalignment is not supported and introduces problems later on =
as other
> > >>>>>>>> parts of the system image are unaligned and they too require a=
lignment.
> > >>>>>>>>
> > >>>>>>>> Revert both of these changes.
> > >>>>>>>>
> > >>>>>>>> Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > >>>>>>>> ---
> > >>>>>>>> By way of a little more explanation, looking at the archives i=
t seems
> > >>>>>>>> that the initial bug reporter said that they had a platform th=
at was
> > >>>>>>>> using U-Boot and had the "fdt_high=3D0xffffffff" set in the en=
vironment.
> > >>>>>>>> What that does is to tell U-Boot to not do any of the sanity c=
hecks and
> > >>>>>>>> relocation to ensure alignment that it would normally do becau=
se the
> > >>>>>>>> user knows best.  This later came up on the U-Boot list as onc=
e the DTB
> > >>>>>>>> was loaded, Linux is unhappy because it demands correct alignm=
ent.
> > >>>>>>>>
> > >>>>>>>> I only realized libfdt had introduced changes here when it was=
 reported
> > >>>>>>>> that boot time had gotten much slower once we merged this chan=
ge in.  It
> > >>>>>>>> would be best to just drop it.
> > >>>>>>> Hmm.  I'm not sure about this.  The commit message makes a case=
 for
> > >>>>>>> why the unaligned handling isn't necessary, but not a case for =
why
> > >>>>>>> it's bad.  Even if handling an unaligned tree isn't a common ca=
se,
> > >>>>>>> isn't it better to be able to than not?
> > >>>>>>>
> > >>>>>>> I gather from the previous discussion that there's a significant
> > >>>>>>> performance impact, but that rationale needs to go into the com=
mit
> > >>>>>>> message for posterity.
> > >>>>>> I wanted to emphasize that the code simply isn't ever needed, no=
t that
> > >>>>>> it's a performance problem.  A performance problem implies that =
we would
> > >>>>>> keep this, if it was fast enough.  That's why people noticed it =
(it
> > >>>>>> slows things down to an unusable level).  But it's functionally =
wrong.
> > >>>>>>
> > >>>>>>> [snip]
> > >>>>>>>> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > >>>>>>>> index fc4c4962a01c..d4ebe915cf46 100644
> > >>>>>>>> --- a/libfdt/libfdt.h
> > >>>>>>>> +++ b/libfdt/libfdt.h
> > >>>>>>>> @@ -117,23 +117,6 @@ static inline void *fdt_offset_ptr_w(void=
 *fdt, int offset, int checklen)
> > >>>>>>>>
> > >>>>>>>>  uint32_t fdt_next_tag(const void *fdt, int offset, int *nexto=
ffset);
> > >>>>>>>>
> > >>>>>>>> -/*
> > >>>>>>>> - * Alignment helpers:
> > >>>>>>>> - *     These helpers access words from a device tree blob.  T=
hey're
> > >>>>>>>> - *     built to work even with unaligned pointers on platform=
s (ike
> > >>>>>>>> - *     ARM) that don't like unaligned loads and stores
> > >>>>>>>> - */
> > >>>>>>>> -
> > >>>>>>>> -static inline uint32_t fdt32_ld(const fdt32_t *p)
> > >>>>>>>> -{
> > >>>>>>>> -   const uint8_t *bp =3D (const uint8_t *)p;
> > >>>>>>>> -
> > >>>>>>>> -   return ((uint32_t)bp[0] << 24)
> > >>>>>>>> -           | ((uint32_t)bp[1] << 16)
> > >>>>>>>> -           | ((uint32_t)bp[2] << 8)
> > >>>>>>>> -           | bp[3];
> > >>>>>>>> -}
> > >>>>>>> In particular, I definitely think removing the helpers entirely=
 is a
> > >>>>>>> no go.  They're now part of the published interface of the libr=
ary.
> > >>>>>> Perhaps "mistakes were made" ?  I don't think we need to worry a=
bout
> > >>>>>> removing an interface here as projects are avoiding upgrading li=
bfdt
> > >>>>>> now (TF-A, formerly ATF) or reverting the change (U-Boot).
> > >>>>>>
> > >>>>>>> Even if they're not used for reading the internal tags, they ca=
n be
> > >>>>>>> used to load integers from within particular properties.  Those=
 are
> > >>>>>>> frequently unaligned, since properties generally have packed
> > >>>>>>> representations.
> > >>>>>> I don't see the relevance.  Go back to the initial problem repor=
t.  It's
> > >>>>>> not "I have a new unique platform I'm using libfdt on and I have
> > >>>>>> problems".  It's "I keep jabbing myself with a rusty nail and no=
w I have
> > >>>>>> problems".
> > >>>>> The initial report isn't the only relevant thing here.  Although =
it
> > >>>>> prompted the change, it wasn't the only consideration in making i=
t.
> > >>>>>
> > >>>>> There's also two separate questions here:
> > >>>>>   1) Do we want byteswapping integer load helpers?
> > >>>>>   2) Should those handle unaligned accesses?
> > >>>>>
> > >>>>> In working out how to address the (as it turns out, non existent)
> > >>>>> problem, I realized an abstraction for loading big-endian integers
> > >>>>> from the blob would be a useful thing in its own right.  I also
> > >>>>> realized that it's a useful thing not just inside the libfdt code=
, but
> > >>>>> as an external interface.  Callers have always needed to interpre=
t the
> > >>>>> contents of individual dt properties, and loading integers from t=
hem
> > >>>>> is often a part of that.
> > >>>>>
> > >>>>> I know of people using those fdtXX_ld() helpers right now, so I'm=
 not
> > >>>>> going to take them away.
> > >>>>>
> > >>>>> For the case of external users we absolutely do need to handle
> > >>>>> unaligned accesses.  There are a number of existing bindings that=
 mix
> > >>>>> strings and integers in packed format, in a single encoded proper=
ty.
> > >>>>> So regardless of the alignment of the whole property, we can easi=
ly
> > >>>>> get unaligned integers in there, and I don't want to expose multi=
ple
> > >>>>> different helpers for different cases.
> > >>>>>
> > >>>>> Now, we don't *have* to use the same helpers for internal use.  We
> > >>>>> could open code the internal loads, or use a special aligned-only
> > >>>>> version inside.  But using the existing external helpers is the
> > >>>>> obvious and simple choice.
> > >>>>>
> > >>>>> So, we're back to: I need a case for changing this now, not just a
> > >>>>> case for claiming it wasn't needed in the first place.
> > >>>> For U-Boot, I'm just going to revert this part of the changes.  I =
would
> > >>> That seems reasonable for the interim.
> > >>>
> > >>>> suggest that you look in to some way to fix the "fast path" here t=
o go
> > >>>> back to the previous way of working so that other project can cont=
inue
> > >>>> to use libfdt as well and when callers need to access these helper=
s and
> > >>>> are not otherwise in the fast path can do so.
> > >>>>
> > >>>> You're adding visible boot time delay with things the way they exi=
st
> > >>>> today.  That's not OK.
> > >>> That's a fair point, but you need to make that case in the commit
> > >>> message and merge request, not just expect me to find and collate t=
he
> > >>> arguments from other threads.
> > >> If you want me to leave the helpers alone but otherwise revert thing=
s, I
> > >> can do a v2 and expand the commit message.  And perhaps I'm too nice
> > >> sometimes then but I do pickup and tweak things that are close enoug=
h to
> > >> what I want and reword as needed for clarity.
> > > Why not just fix the helpers for the aligned case and be done with it:
> > >
> > > static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > {
> > >        const uint8_t *bp =3D (const uint8_t *)p;
> > >
> > > +       if (!((unsigned long)p & 0x3))
> > > +               return fdt32_to_cpu(*p);
> > > +
> > >        return ((uint32_t)bp[0] << 24)
> > >                | ((uint32_t)bp[1] << 16)
> > >                | ((uint32_t)bp[2] << 8)
> > >                | bp[3];
> > > }
> >
> >
> > Here are the results, before and after your proposed patch:
> >
> > tested tag: V2020.04-RC1
> >
> > STM32MP> bootstage report
> > Timer summary in microseconds (12 records):
> >        Mark    Elapsed  Stage
> >           0          0  reset
> >      84,268     84,268  SPL
> >     962,921    878,653  end SPL
> >     965,800      2,879  board_init_f
> >   4,314,348  3,348,548  board_init_r
> >   4,863,763    549,415  id=3D64
> >   4,908,759     44,996  id=3D65
> >   4,909,459        700  main_loop
> >   5,322,309    412,850  id=3D175
> >
> > Accumulated time:
> >                 83,284  dm_r
> >                 95,842  dm_spl
> >              1,502,020  dm_f
> >
> >
> > -----------------------------------------------------------------------=
--------
> >
> > tested tag : V2020.04-RC1 + following fdt32_ld patch :
> >
> > static inline uint32_t fdt32_ld(const fdt32_t *p)
> > {
> >        const uint8_t *bp =3D (const uint8_t *)p;
> >
> > +       if (!((unsigned long)p & 0x3))
> > +               return fdt32_to_cpu(*p);
> > +
> >        return ((uint32_t)bp[0] << 24)
> >                | ((uint32_t)bp[1] << 16)
> >                | ((uint32_t)bp[2] << 8)
> >                | bp[3];
> > }
> >
> >
> > STM32MP> bootstage report
> > Timer summary in microseconds (12 records):
> >        Mark    Elapsed  Stage
> >           0          0  reset
> >      84,264     84,264  SPL
> >     959,300    875,036  end SPL
> >     962,192      2,892  board_init_f
> >   4,310,598  3,348,406  board_init_r
> >   4,860,074    549,476  id=3D64
> >   4,905,119     45,045  id=3D65
> >   4,905,819        700  main_loop
> >   5,098,636    192,817  id=3D175
> >
> > Accumulated time:
> >                 83,202  dm_r
> >                 95,252  dm_spl
> >              1,501,950  dm_f
> >
> >
> > There is no gain in board_init_r(), the added alignment test is expensi=
ve itself.
>=20
> That's odd. It should be just an AND and a conditional branch added.
> Those should be a few cycles compared to tens to hundreds of cycles
> for 4 loads instead of 1.
>=20
> Doesn't u-boot build with -Os typically? Maybe it's not actually inlining.

Checking everything over, yes, it's been inlined.

--=20
Tom

--yBTt7CTH+yMq4SuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4zQVYACgkQh/n2NdMd
dlIdcg/+MtBeODESD+Jou9xfBPus7RYtQ9s1IwTN3e4TPzQHo/QleIbzIqtniHgY
bLvX63a5uG9zeH0tjxJ3Y7/BZJ5p8UgfRNfuGgao13dH1ElUVqMu8+Y58x+h6F9F
HrERHsfY8lKvl79svGEZ1eVflNbOjfJDPLzTLyxS5dl7grlBBlOnELA0sVScHwC9
f6xyDGx4SL1+5XakNIP8r7IxmIwBNYLU9HaYZqAdVzGqbBnATfOO86O+DChOg4EV
8R8Fuq3dF5pRZwQTQDDLywEYsYMpfd8dg/y6nArGe3C4nUfNdH+ZdlffkwP++OSQ
BeTzosGLE1bIxYQC1gzpilwBF7QCsgoUoFdHiqRf7xjGvyXu/ZUgAx8O5rJYe/wO
q6l/9tisqsFKDAZWr/Ko37kVf76uaEoVUGTFlBQhlkrXp0LkyHxY//vLTpnbsVQY
7M9vR8vmCEmQvGqqOD4YT/7mSbiAbyQ51ORjSHMWCezbzo49NyY7iV/bjtn6Xxk0
HTkRoOUNmOS/HCc3356lF/aLWk26b4LIi89DDokONt9d8Eofci9R/tyZI64jLA1+
k4b5OC36oNHcZtQ6h7wC5GQHhzu98Em6eznib+j5n8YC4ZjbPCO8TeIqEEelV3m/
0FzOrVLkzdSuUA/vF2oBXBweCa8+Lh/W3kdQiMAyriqSWeYC9fg=
=Czr+
-----END PGP SIGNATURE-----

--yBTt7CTH+yMq4SuJ--
