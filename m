From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Fri, 31 Jan 2020 14:38:10 +1100
Message-ID: <20200131033810.GE15210@umbus.fritz.box>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d8Lz2Tf5e5STOWUP"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580441899;
        bh=asmMss4gOoJrrZx2N4sqOnUyhn107hPhnxdJurY/4oc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GppMnKQeVq3MOUCT7cLYww+TTmu+63tQnfoUT2hGkTvxcwbKqTjuaiBjgvhEY+/VE
         89CYQdGgUl+ZBOK5BxN//yEzCyYm0IqmE5qJzbGPLJpE1RxXfa2A+b/i9Ng8Seugc4
         EBq28/Y00vYDboy8ihjNxOlz7wUQ9c6SAzI1FipM=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+43Opib7vUpZ_VxbJig3gT8crBoL6nw_yC=xOfcsbOvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--d8Lz2Tf5e5STOWUP
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
[snip]
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

Drat.

> That's odd. It should be just an AND and a conditional branch added.
> Those should be a few cycles compared to tens to hundreds of cycles
> for 4 loads instead of 1.

The later loads are very likely to hit in cache though, right?  Or is
this done before the caches are activated?

> Doesn't u-boot build with -Os typically? Maybe it's not actually
> inlining.

Apparently it is.  And yet... it seems pretty suspicious that the
numbers are so close, despite doing something quite different here.
Can we somehow verify that the fast path is really being executed?

For comparison purposes, what are the numbers if we change these to
unconditionally do an aligned load?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--d8Lz2Tf5e5STOWUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4zoR4ACgkQbDjKyiDZ
s5KYPg/+Id8/d1J7BQWOw7yA0qBLYh+xLNtcCHYcaiQryQiTUOMiKHfdv4UmTs1w
B8bZbsnNLrqcmU92ZoCRsFJBpMKXCWScsa/p+GNLpTXVANwVpFJDGMXn7RFx2xUV
o8L/lLcSkYHDA6g4t/kwXUFvRu9JdivALm0F01PEHgieGKARgdlvAna1vlZbPydt
G21rgLh6B+XleXCDDkn3FeCIptU2c1+x+Q0nW+yAcjpvVQe3gq+AlnEgQN5fqYS7
opqzbBUC6KRrP2rX6zirJy2xxVA7y4Enn+fpT1u6eE6WjmkScdW980Ma1zw47TnQ
fBYZz9z8x5X+YW4HFq2XR7wo2USg/Nr5Xjt3AAxLpx/QOQdC3qno2qebDPlucBMP
ew2oKTcz8fKDDa/AUQO8El1rrXYFVlac4NzgvIQKJFDZVX2yzdTIrO2gS4vbZZMt
E1pKPSWoweiFG7cIxl1mao8R/HicGHm3A1wjyveKF0UKfH6dFrPSfEzKgz+ppnhr
SxAnzFbKVpj7Ti/yaatnDTWkxsuJCbnph22XLcMezsYydYrrAXmyCglfCnBCX37h
mGmWAbB8NyrQoOH0/iiQzm8m6P/QFpxXGl6yWVlYz113C50KxMKYKE9R/1QIfddO
gOgFFYSP9wysFpCZ09mcI6iKPTpSASFfpqm2bklwdvyK1IIxiqI=
=VnyN
-----END PGP SIGNATURE-----

--d8Lz2Tf5e5STOWUP--
