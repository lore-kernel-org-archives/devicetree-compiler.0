From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Fri, 7 Feb 2020 16:23:38 +1100
Message-ID: <20200207052338.GA219689@umbus.fritz.box>
References: <20200127150434.GJ9259@bill-the-cat>
 <20200128085918.GO42099@umbus.fritz.box>
 <20200128134304.GQ13379@bill-the-cat>
 <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
 <c56c4206-1be1-1701-1423-1f74f6913bbf@st.com>
 <CAL_Jsq+43Opib7vUpZ_VxbJig3gT8crBoL6nw_yC=xOfcsbOvA@mail.gmail.com>
 <20200131033810.GE15210@umbus.fritz.box>
 <7bbbb5a8-8e35-e95c-8d03-6970fd6b023e@st.com>
 <20200202062031.GB30687@umbus.fritz.box>
 <1f4881a0-8d52-c280-3376-d66943d489a1@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581053360;
        bh=QfW4d+ZjkrYHCVGUF9c0BQHOGF9B7b3RulYucAjF18A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d7u/VBzZ/asG2uP3wzYUpRjqZiAfzlE6cy9+8Swz1zjqGILZ8A5y6UaVw2jNXCmyI
         8Sl0aVz46j+ThgkxHH/1/o1JnzF0jetKIm3PWOI54LqaD4O23aD+GHHvEIbE9/nuRE
         p1qrchlBFL4+uHF0tmfQyDXKL04GSR5DCxoSUpwk=
Content-Disposition: inline
In-Reply-To: <1f4881a0-8d52-c280-3376-d66943d489a1-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 01:14:15PM +0000, Patrice CHOTARD wrote:
> Hi David
>=20
> On 2/2/20 7:20 AM, David Gibson wrote:
> > On Fri, Jan 31, 2020 at 08:44:41AM +0000, Patrice CHOTARD wrote:
> >> Hi
> >>
> >> On 1/31/20 4:38 AM, David Gibson wrote:
> >>> On Thu, Jan 30, 2020 at 02:18:21PM -0600, Rob Herring wrote:
> >>>> On Thu, Jan 30, 2020 at 8:44 AM Patrice CHOTARD <patrice.chotard@st.=
com> wrote:
> >>>>> Hi Rob, Tom, David
> >>>>>
> >>>>> On 1/28/20 3:08 PM, Rob Herring wrote:
> >>>>>> On Tue, Jan 28, 2020 at 7:43 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrot=
e:
> >>>>>>> On Tue, Jan 28, 2020 at 07:59:18PM +1100, David Gibson wrote:
> >>>>>>>> On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> >>>>>>>>> On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> >>>>>>>>>> On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> >>>>>>>>>>> On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> >>>>>>>>>>>> On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> >>> [snip]
> >>>>>> Why not just fix the helpers for the aligned case and be done with=
 it:
> >>>>>>
> >>>>>> static inline uint32_t fdt32_ld(const fdt32_t *p)
> >>>>>> {
> >>>>>>        const uint8_t *bp =3D (const uint8_t *)p;
> >>>>>>
> >>>>>> +       if (!((unsigned long)p & 0x3))
> >>>>>> +               return fdt32_to_cpu(*p);
> >>>>>> +
> >>>>>>        return ((uint32_t)bp[0] << 24)
> >>>>>>                | ((uint32_t)bp[1] << 16)
> >>>>>>                | ((uint32_t)bp[2] << 8)
> >>>>>>                | bp[3];
> >>>>>> }
> >>>>> Here are the results, before and after your proposed patch:
> >>>>>
> >>>>> tested tag: V2020.04-RC1
> >>>>>
> >>>>> STM32MP> bootstage report
> >>>>> Timer summary in microseconds (12 records):
> >>>>>        Mark    Elapsed  Stage
> >>>>>           0          0  reset
> >>>>>      84,268     84,268  SPL
> >>>>>     962,921    878,653  end SPL
> >>>>>     965,800      2,879  board_init_f
> >>>>>   4,314,348  3,348,548  board_init_r
> >>>>>   4,863,763    549,415  id=3D64
> >>>>>   4,908,759     44,996  id=3D65
> >>>>>   4,909,459        700  main_loop
> >>>>>   5,322,309    412,850  id=3D175
> >>>>>
> >>>>> Accumulated time:
> >>>>>                 83,284  dm_r
> >>>>>                 95,842  dm_spl
> >>>>>              1,502,020  dm_f
> >>>>>
> >>>>>
> >>>>> -------------------------------------------------------------------=
------------
> >>>>>
> >>>>> tested tag : V2020.04-RC1 + following fdt32_ld patch :
> >>>>>
> >>>>> static inline uint32_t fdt32_ld(const fdt32_t *p)
> >>>>> {
> >>>>>        const uint8_t *bp =3D (const uint8_t *)p;
> >>>>>
> >>>>> +       if (!((unsigned long)p & 0x3))
> >>>>> +               return fdt32_to_cpu(*p);
> >>>>> +
> >>>>>        return ((uint32_t)bp[0] << 24)
> >>>>>                | ((uint32_t)bp[1] << 16)
> >>>>>                | ((uint32_t)bp[2] << 8)
> >>>>>                | bp[3];
> >>>>> }
> >>>>>
> >>>>>
> >>>>> STM32MP> bootstage report
> >>>>> Timer summary in microseconds (12 records):
> >>>>>        Mark    Elapsed  Stage
> >>>>>           0          0  reset
> >>>>>      84,264     84,264  SPL
> >>>>>     959,300    875,036  end SPL
> >>>>>     962,192      2,892  board_init_f
> >>>>>   4,310,598  3,348,406  board_init_r
> >>>>>   4,860,074    549,476  id=3D64
> >>>>>   4,905,119     45,045  id=3D65
> >>>>>   4,905,819        700  main_loop
> >>>>>   5,098,636    192,817  id=3D175
> >>>>>
> >>>>> Accumulated time:
> >>>>>                 83,202  dm_r
> >>>>>                 95,252  dm_spl
> >>>>>              1,501,950  dm_f
> >>>>>
> >>>>>
> >>>>> There is no gain in board_init_r(), the added alignment test is exp=
ensive itself.
> >>> Drat.
> >>>
> >>>> That's odd. It should be just an AND and a conditional branch added.
> >>>> Those should be a few cycles compared to tens to hundreds of cycles
> >>>> for 4 loads instead of 1.
> >>> The later loads are very likely to hit in cache though, right?  Or is
> >>> this done before the caches are activated?
> >>>
> >>>> Doesn't u-boot build with -Os typically? Maybe it's not actually
> >>>> inlining.
> >>> Apparently it is.  And yet... it seems pretty suspicious that the
> >>> numbers are so close, despite doing something quite different here.
> >>> Can we somehow verify that the fast path is really being executed?
> >>>
> >>> For comparison purposes, what are the numbers if we change these to
> >>> unconditionally do an aligned load?
> >>>
> >> I made one more test to be 100% sure and the result is weird ....=A0
> >>
> >> static inline uint32_t fdt32_ld(const fdt32_t *p)
> >> {
> >>
> >> =A0=A0=A0=A0=A0=A0 if (!((unsigned long)p & 0x3))
> >> =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0 return fdt32_to_cpu(*p);
> >>
> >> =A0=A0=A0=A0=A0=A0 while (1) {};
> >> }
> >>
> >> the results are back to 'normal', board_init_r() execution is 1.9 seco=
nd=A0 faster .....
> > Huh.  I dunno how, but it definitely seems like the conditional
> > version wasn't operating properly.
> >
> > Does putting a "likely" branch prediction on that if make any differenc=
e?
>=20
> I already did this test by adding a "likely" but it has no effect
> :-(

Interesting.  I think someone who knows ARM asm needs to look at the
compiler output for the two cases to see what's going on.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl489FgACgkQbDjKyiDZ
s5LIYQ//S1WkFzauk/nhhnLfTGVcG0FL9PXqhVFIsLwRjrXVLKvyhSHgSXQXjdPK
oJI0nSn9g4fjaEsQIbW0QcE+qrWBP//KX2T7W6lb/IYYDXxYBt4Kg8KoHX/3FtnI
+Cm5cuVIa7gXfPRT/UoKEtE78Z/iWvC+f4I/uMzijQpJL2JZGk9SPsA7UQG7cBU8
NMX4MyOUinjXYcPdqTSJq1weHzPvN1M9q1lN0mQd62gCYxPa8KsPCXA26L6khMwA
GCJ0IPyCCGNRo/EINO9rZxN4+TZvYqwosg+8X5zq/Icb9TOTu4vqIx0h7wcUbY5U
7JRWYDW3GPcVwaAivfYzRUaWmkBmidjqKFmXoZypvp0Cyfl7UFdcxr+KU2w1B//w
gHFeoKxIyzN1zmliZl6X4FCGh5RF3Bh9h1QBCi94pHbci2tO4968Y777EBWYO+WR
mOjznvcC/Rz2XmIpE8obZH/4QMVavmnny9h/FFyr3o2RJodYOFGBZm0zjOOogmkq
4GcDCBN9JKZfP6g1lfO982PzpkB2EAvoikWDpsKJDgUb/igEC17BzS8GWQ656F08
T7pql7gbIGKUUKAB3wdrbxmxQWTIrDcNjnrH0PK1XDtc21dYl1VJEzHffVHmU7gN
bu5CrIQietO965OCqcrLIJatAhTyAHUaeJGPQalbnvNaL2qL6is=
=ZANo
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
