From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Remove special handling for unaligned reads
Date: Thu, 30 Jan 2020 23:15:24 -0500
Message-ID: <20200131041524.GU13379@bill-the-cat>
References: <20200123091440.GQ2347@umbus.fritz.box>
 <20200123121650.GV26536@bill-the-cat>
 <20200127032351.GA1818@umbus.fritz.box>
 <20200127150434.GJ9259@bill-the-cat>
 <20200128085918.GO42099@umbus.fritz.box>
 <20200128134304.GQ13379@bill-the-cat>
 <CAL_JsqJ0Pp8e4iFOKuKESO4DJ0ky2aO+GB_HDiGcNhY1qBxgfw@mail.gmail.com>
 <c56c4206-1be1-1701-1423-1f74f6913bbf@st.com>
 <CAL_Jsq+43Opib7vUpZ_VxbJig3gT8crBoL6nw_yC=xOfcsbOvA@mail.gmail.com>
 <20200131033810.GE15210@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xzyfs59K7sVdWrbC"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+7UW/xfgyKTByQ2GZnotoAXKoJ3tS967TlRmY6W6zgw=;
        b=UBzBghUdHHlWMIPj5NhFwSrjRG4CikRiR+njjZP6sVrgcY2Ogbr5YAuUI50qJGdMLB
         SA2GDfngZRm/nA8RqzgqT+i0jaTxDQljSmVlNZNJWqNbfGSGk3LoGWmd/Ma50YySmIhb
         41Rv6yRyK/QaiLA1c0jdTpMNXPkCU60gttavA=
Content-Disposition: inline
In-Reply-To: <20200131033810.GE15210-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrick DELAUNAY <patrick.delaunay-qxv4g6HH51o@public.gmane.org>


--xzyfs59K7sVdWrbC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 02:38:10PM +1100, David Gibson wrote:
> On Thu, Jan 30, 2020 at 02:18:21PM -0600, Rob Herring wrote:
> > On Thu, Jan 30, 2020 at 8:44 AM Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org=
> wrote:
> > >
> > > Hi Rob, Tom, David
> > >
> > > On 1/28/20 3:08 PM, Rob Herring wrote:
> > > > On Tue, Jan 28, 2020 at 7:43 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > > >> On Tue, Jan 28, 2020 at 07:59:18PM +1100, David Gibson wrote:
> > > >>> On Mon, Jan 27, 2020 at 10:04:34AM -0500, Tom Rini wrote:
> > > >>>> On Mon, Jan 27, 2020 at 02:23:51PM +1100, David Gibson wrote:
> > > >>>>> On Thu, Jan 23, 2020 at 07:16:50AM -0500, Tom Rini wrote:
> > > >>>>>> On Thu, Jan 23, 2020 at 08:14:40PM +1100, David Gibson wrote:
> > > >>>>>>> On Fri, Jan 17, 2020 at 10:31:06AM -0500, Tom Rini wrote:
> [snip]
> > > > Why not just fix the helpers for the aligned case and be done with =
it:
> > > >
> > > > static inline uint32_t fdt32_ld(const fdt32_t *p)
> > > > {
> > > >        const uint8_t *bp =3D (const uint8_t *)p;
> > > >
> > > > +       if (!((unsigned long)p & 0x3))
> > > > +               return fdt32_to_cpu(*p);
> > > > +
> > > >        return ((uint32_t)bp[0] << 24)
> > > >                | ((uint32_t)bp[1] << 16)
> > > >                | ((uint32_t)bp[2] << 8)
> > > >                | bp[3];
> > > > }
> > >
> > >
> > > Here are the results, before and after your proposed patch:
> > >
> > > tested tag: V2020.04-RC1
> > >
> > > STM32MP> bootstage report
> > > Timer summary in microseconds (12 records):
> > >        Mark    Elapsed  Stage
> > >           0          0  reset
> > >      84,268     84,268  SPL
> > >     962,921    878,653  end SPL
> > >     965,800      2,879  board_init_f
> > >   4,314,348  3,348,548  board_init_r
> > >   4,863,763    549,415  id=3D64
> > >   4,908,759     44,996  id=3D65
> > >   4,909,459        700  main_loop
> > >   5,322,309    412,850  id=3D175
> > >
> > > Accumulated time:
> > >                 83,284  dm_r
> > >                 95,842  dm_spl
> > >              1,502,020  dm_f
> > >
> > >
> > > ---------------------------------------------------------------------=
----------
> > >
> > > tested tag : V2020.04-RC1 + following fdt32_ld patch :
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
> > >
> > >
> > > STM32MP> bootstage report
> > > Timer summary in microseconds (12 records):
> > >        Mark    Elapsed  Stage
> > >           0          0  reset
> > >      84,264     84,264  SPL
> > >     959,300    875,036  end SPL
> > >     962,192      2,892  board_init_f
> > >   4,310,598  3,348,406  board_init_r
> > >   4,860,074    549,476  id=3D64
> > >   4,905,119     45,045  id=3D65
> > >   4,905,819        700  main_loop
> > >   5,098,636    192,817  id=3D175
> > >
> > > Accumulated time:
> > >                 83,202  dm_r
> > >                 95,252  dm_spl
> > >              1,501,950  dm_f
> > >
> > >
> > > There is no gain in board_init_r(), the added alignment test is expen=
sive itself.
>=20
> Drat.
>=20
> > That's odd. It should be just an AND and a conditional branch added.
> > Those should be a few cycles compared to tens to hundreds of cycles
> > for 4 loads instead of 1.
>=20
> The later loads are very likely to hit in cache though, right?  Or is
> this done before the caches are activated?
>=20
> > Doesn't u-boot build with -Os typically? Maybe it's not actually
> > inlining.
>=20
> Apparently it is.  And yet... it seems pretty suspicious that the
> numbers are so close, despite doing something quite different here.
> Can we somehow verify that the fast path is really being executed?
>=20
> For comparison purposes, what are the numbers if we change these to
> unconditionally do an aligned load?

The before / after numbers can be seen at
https://lists.denx.de/pipermail/u-boot/2020-January/396707.html

--=20
Tom

--xzyfs59K7sVdWrbC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4zqdgACgkQh/n2NdMd
dlKUNw/+K6IsejnWI3/KIcboBFjOoG4BqEozWhMUHXUJd5sb1uehiqp72Lr60Tr2
9eOvJdtoTJvzYUWnN3gkX8kJC8Vy/1wSOVGNxw141w1eTqY3Lmu5fjVwy3k7QaET
ElbWGi9TTDE/SnchTyT5uHuh2C7SGcJEwc5vr0JJ6PtOPbkYdhB2P+Z/xLM+xQTh
aZDGYXBr+sZyOvMeURprPvSo5YZMw5wfd8gbHLaDeuueXhT+ZoHdu6rP3cyeTF2G
Q/uvWMmKP4ypCK96/UHjK3ovRdR/0Xof8vnvPCdyNXcvtXEJZbh+1rlUqsj2+1Pl
xjA4CQwlya2qMg61ZGLpRiYF5lcBTJfiX49Wb3l+Jj/CAVui8YKhUMAt/JNy97fh
c23440ILXU6NP+RTeRwTP1TFKHjQoIhq4U36B5zOLSheuKe8tsIDjk5plI8QED7U
JA3JCdNG9KVDvUlaLxsTIEVUEBVllSq/rzJnV3ljp+RU6r+8EfiXBsAzSM8d9uFM
IgG/jKG3Nj34kWqlScDJe3BTIreDSW2mojLQRsxbQkoEmCFYbaNuG/Z6rhKUqv4S
bDlH++Xk42RVqfViT+zs9ooe3LQcvne+6mMAi8+NmIzQXUoUED8K2vD6PXlkxZ/+
oWSHQggeUWZT6K22HQL60bG5UMPb7vzZLqYVUvuCw5CRZLC1Vu0=
=O1qp
-----END PGP SIGNATURE-----

--xzyfs59K7sVdWrbC--
