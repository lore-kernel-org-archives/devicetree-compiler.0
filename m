From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Sun, 2 Feb 2020 17:20:31 +1100
Message-ID: <20200202062031.GB30687@umbus.fritz.box>
References: <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat>
 <20200128085918.GO42099@umbus.fritz.box>
 <20200128134304.GQ13379@bill-the-cat>
 <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
 <c56c4206-1be1-1701-1423-1f74f6913bbf@st.com>
 <CAL_Jsq+43Opib7vUpZ_VxbJig3gT8crBoL6nw_yC=xOfcsbOvA@mail.gmail.com>
 <20200131033810.GE15210@umbus.fritz.box>
 <7bbbb5a8-8e35-e95c-8d03-6970fd6b023e@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580624451;
        bh=7P3BpjHMpvFnTLdF1HgMqk/GQMgsYGOVy/JzFOGASPo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fW0ugP7+PQVDvCBCpkJmvOTON79po9mmPnNL9QKUJyZKxXuWfZcM2ERvT5KaX/Zf6
         Dq48XcByjU4JhdZnereCuo493aQvel95tG36bPrrwrU4nab3afAOYZ+PDi6VRUPAYs
         gNCa6JbHWEk+CH8191gHoxYc7AxtVL+vwZcxU+Nw=
Content-Disposition: inline
In-Reply-To: <7bbbb5a8-8e35-e95c-8d03-6970fd6b023e-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 08:44:41AM +0000, Patrice CHOTARD wrote:
> Hi
>=20
> On 1/31/20 4:38 AM, David Gibson wrote:
> > On Thu, Jan 30, 2020 at 02:18:21PM -0600, Rob Herring wrote:
> >> On Thu, Jan 30, 2020 at 8:44 AM Patrice CHOTARD <patrice.chotard-lpHj6iFQ3dU@public.gmane.org=
m> wrote:
> >>> Hi Rob, Tom, David
> >>>
> >>> On 1/28/20 3:08 PM, Rob Herring wrote:
> >>>> On Tue, Jan 28, 2020 at 7:43 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >>>>> On Tue, Jan 28, 2020 at 07:59:18PM +1100, David Gibson wrote:
> >>>>>> On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> >>>>>>> On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> >>>>>>>> On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> >>>>>>>>> On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> >>>>>>>>>> On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> > [snip]
> >>>> Why not just fix the helpers for the aligned case and be done with i=
t:
> >>>>
> >>>> static inline uint32_t fdt32_ld(const fdt32_t *p)
> >>>> {
> >>>>        const uint8_t *bp =3D (const uint8_t *)p;
> >>>>
> >>>> +       if (!((unsigned long)p & 0x3))
> >>>> +               return fdt32_to_cpu(*p);
> >>>> +
> >>>>        return ((uint32_t)bp[0] << 24)
> >>>>                | ((uint32_t)bp[1] << 16)
> >>>>                | ((uint32_t)bp[2] << 8)
> >>>>                | bp[3];
> >>>> }
> >>>
> >>> Here are the results, before and after your proposed patch:
> >>>
> >>> tested tag: V2020.04-RC1
> >>>
> >>> STM32MP> bootstage report
> >>> Timer summary in microseconds (12 records):
> >>>        Mark    Elapsed  Stage
> >>>           0          0  reset
> >>>      84,268     84,268  SPL
> >>>     962,921    878,653  end SPL
> >>>     965,800      2,879  board_init_f
> >>>   4,314,348  3,348,548  board_init_r
> >>>   4,863,763    549,415  id=3D64
> >>>   4,908,759     44,996  id=3D65
> >>>   4,909,459        700  main_loop
> >>>   5,322,309    412,850  id=3D175
> >>>
> >>> Accumulated time:
> >>>                 83,284  dm_r
> >>>                 95,842  dm_spl
> >>>              1,502,020  dm_f
> >>>
> >>>
> >>> ---------------------------------------------------------------------=
----------
> >>>
> >>> tested tag : V2020.04-RC1 + following fdt32_ld patch :
> >>>
> >>> static inline uint32_t fdt32_ld(const fdt32_t *p)
> >>> {
> >>>        const uint8_t *bp =3D (const uint8_t *)p;
> >>>
> >>> +       if (!((unsigned long)p & 0x3))
> >>> +               return fdt32_to_cpu(*p);
> >>> +
> >>>        return ((uint32_t)bp[0] << 24)
> >>>                | ((uint32_t)bp[1] << 16)
> >>>                | ((uint32_t)bp[2] << 8)
> >>>                | bp[3];
> >>> }
> >>>
> >>>
> >>> STM32MP> bootstage report
> >>> Timer summary in microseconds (12 records):
> >>>        Mark    Elapsed  Stage
> >>>           0          0  reset
> >>>      84,264     84,264  SPL
> >>>     959,300    875,036  end SPL
> >>>     962,192      2,892  board_init_f
> >>>   4,310,598  3,348,406  board_init_r
> >>>   4,860,074    549,476  id=3D64
> >>>   4,905,119     45,045  id=3D65
> >>>   4,905,819        700  main_loop
> >>>   5,098,636    192,817  id=3D175
> >>>
> >>> Accumulated time:
> >>>                 83,202  dm_r
> >>>                 95,252  dm_spl
> >>>              1,501,950  dm_f
> >>>
> >>>
> >>> There is no gain in board_init_r(), the added alignment test is expen=
sive itself.
> > Drat.
> >
> >> That's odd. It should be just an AND and a conditional branch added.
> >> Those should be a few cycles compared to tens to hundreds of cycles
> >> for 4 loads instead of 1.
> > The later loads are very likely to hit in cache though, right?  Or is
> > this done before the caches are activated?
> >
> >> Doesn't u-boot build with -Os typically? Maybe it's not actually
> >> inlining.
> > Apparently it is.  And yet... it seems pretty suspicious that the
> > numbers are so close, despite doing something quite different here.
> > Can we somehow verify that the fast path is really being executed?
> >
> > For comparison purposes, what are the numbers if we change these to
> > unconditionally do an aligned load?
> >
> I made one more test to be 100% sure and the result is weird ....=A0
>=20
> static inline uint32_t fdt32_ld(const fdt32_t *p)
> {
>=20
> =A0=A0=A0=A0=A0=A0 if (!((unsigned long)p & 0x3))
> =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0 return fdt32_to_cpu(*p);
>=20
> =A0=A0=A0=A0=A0=A0 while (1) {};
> }
>=20
> the results are back to 'normal', board_init_r() execution is 1.9 second=
=A0 faster .....

Huh.  I dunno how, but it definitely seems like the conditional
version wasn't operating properly.

Does putting a "likely" branch prediction on that if make any difference?

> STM32MP> bootstage report
> Timer summary in microseconds (12 records):
> =A0=A0=A0=A0=A0=A0 Mark=A0=A0=A0 Elapsed=A0 Stage
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=A0 reset
> =A0=A0=A0=A0 84,265=A0=A0=A0=A0 84,265=A0 SPL
> =A0=A0=A0 868,330=A0=A0=A0 784,065=A0 end SPL
> =A0=A0=A0 871,163=A0=A0=A0=A0=A0 2,833=A0 board_init_f
> =A0 2,360,135=A0 1,488,972=A0 board_init_r
> =A0 2,786,920=A0=A0=A0 426,785=A0 id=3D64
> =A0 2,818,189=A0=A0=A0=A0 31,269=A0 id=3D65
> =A0 2,818,889=A0=A0=A0=A0=A0=A0=A0 700=A0 main_loop
> =A0 2,877,661=A0=A0=A0=A0 58,772=A0 id=3D175
>=20
> Accumulated time:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 54,489=A0 dm_r
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 56,778=A0 dm_spl
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 644,883=A0 dm_f
>=20
> Is the compiler doing some optimization link to the CPU pipeline predicti=
on or something else ?
>=20
> Patrice

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl42ai8ACgkQbDjKyiDZ
s5J2mQ/9G+xJ9OMg71EWPMsDdlR1KoVJl0O1CTw1VCtLWGstvQS5E9Nxf2c8B83q
EpHQwAICeRFVhDWDdL4StJqOQbqEL0X6bC0TdXpZUTryBBNbnqJZ8wiejdunSjgD
2yg6mMNw1OWEuwwZHarLp5u14NIg1l9mIK8NRYW+c+opUIrAvkb8OHBaeqnk3avS
34ghSUu3Bbfr0gFgBX7Twem62U4ZztHcPs8WPNmBqLDbtxVsSPaZX9/B6i2mLLYQ
ioRsHjSNW5z/iSPwRLVuiVfzI54cypCUpb8wxVSJpmGNif1OarDBlFL4lMWYnmSh
PrRyN5hY9IVGzV5a/rwAmv3tLT5NQ57t89Vc1TI9LGd7xvo2fIjlGM00b/zNHb/G
39yxB1+o5pF8bFdJ7bvAxLBKSqZ+vx0okq29BdXd9a0t8yLBvIMOqPZC6GuCNNfU
SAdtjqnpRr94WGQdcmvH5Y1gZ5Zdm8Jhx4O0ZJKRuKj1prCkglWTBHPAEO0c7kVs
6ycz4hVBCFxgvA+LQv41eab6kzAR0UgSUBfV0aasVqkHfp9voXDTCkWwvj5Hk/o4
jY4+mjwt6Gyk7pXIHlSPc+PS1Md+Pi/OHwg8hWdV+TUpZ19jGNdNUNRNAXAIY/lV
WNkNe4VKkqCkCJbUfwFmuJS02YkMZr56lYQv6RylSXHszzhvYZ4=
=C1kD
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
