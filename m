From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 3/7] libfdt: Add support for disabling dtb checks
Date: Tue, 11 Feb 2020 12:42:54 +1100
Message-ID: <20200211014254.GJ22584@umbus.fritz.box>
References: <20200206054034.162732-1-sjg@chromium.org>
 <20200206054034.162732-4-sjg@chromium.org>
 <20200210040201.GA22584@umbus.fritz.box>
 <CAPnjgZ3Ut2CCVqDnRiafMqR+sV0eMn_obhcXYLfbuQgXhhPS1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oplxJGu+Ee5xywIT"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581385388;
        bh=CMJxXXq2DXLGCuYyQpZBTFL+OTePykeHjiUFrXoypys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=InKd2G1F24SGjRTpBsFcSoHHGZOLXUjpslPMnUpxlmidzT7kSf/F//km+GQH/2tbH
         xSSfmJl6sIkfEEUUAvNHxxJmQZ0jxxTFOw0+OBULW100i0SPPTYaQBlamjYQo7BrZ9
         QGa8rQ3MbgacoS/g8HBX1icmV/+HIo/OTaoRtm/w=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3Ut2CCVqDnRiafMqR+sV0eMn_obhcXYLfbuQgXhhPS1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--oplxJGu+Ee5xywIT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 06:04:47PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Sun, 9 Feb 2020 at 23:31, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> >
> > On Wed, Feb 05, 2020 at 10:40:30PM -0700, Simon Glass wrote:
> > > Support ASSUME_VALID_DTB to disable some sanity checks
> > >
> > > If we assume that the DTB itself is valid then we can skip some check=
s and
> > > save code space. Add various conditions to handle this.
> > >
> > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > ---
> > >
> > > Changes in v5:
> > > - Split out VALID_DTB checks into a separate patch
> > >
> > > Changes in v4: None
> > > Changes in v3: None
> > > Changes in v2: None
> > >
> > >  libfdt/fdt.c             | 50 ++++++++++++++++++++++----------------=
--
> > >  libfdt/fdt_ro.c          |  7 ++++--
> > >  libfdt/fdt_rw.c          |  7 +++++-
> > >  libfdt/fdt_sw.c          | 30 ++++++++++++++++--------
> > >  libfdt/libfdt_internal.h |  7 ++++--
> > >  5 files changed, 64 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > > index 3e37a4b..03f2b7d 100644
> > > --- a/libfdt/fdt.c
> > > +++ b/libfdt/fdt.c
> > > @@ -81,38 +81,44 @@ int fdt_check_header(const void *fdt)
> > >
> > >       if (fdt_magic(fdt) !=3D FDT_MAGIC)
> > >               return -FDT_ERR_BADMAGIC;
> > > -     hdrsize =3D fdt_header_size(fdt);
> > >       if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> > >           || (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION=
))
> > >               return -FDT_ERR_BADVERSION;
> > >       if (fdt_version(fdt) < fdt_last_comp_version(fdt))
> > >               return -FDT_ERR_BADVERSION;
> > > +     hdrsize =3D fdt_header_size(fdt);
> > > +     if (!can_assume(VALID_DTB)) {
> > >
> > > -     if ((fdt_totalsize(fdt) < hdrsize)
> > > -         || (fdt_totalsize(fdt) > INT_MAX))
> > > -             return -FDT_ERR_TRUNCATED;
> > > -
> > > -     /* Bounds check memrsv block */
> > > -     if (!check_off_(hdrsize, fdt_totalsize(fdt), fdt_off_mem_rsvmap=
(fdt)))
> > > -             return -FDT_ERR_TRUNCATED;
> > > +             if ((fdt_totalsize(fdt) < hdrsize)
> > > +                 || (fdt_totalsize(fdt) > INT_MAX))
> > > +                     return -FDT_ERR_TRUNCATED;
> > >
> > > -     /* Bounds check structure block */
> > > -     if (fdt_version(fdt) < 17) {
> > > +             /* Bounds check memrsv block */
> > >               if (!check_off_(hdrsize, fdt_totalsize(fdt),
> > > -                             fdt_off_dt_struct(fdt)))
> > > +                             fdt_off_mem_rsvmap(fdt)))
> > >                       return -FDT_ERR_TRUNCATED;
> > > -     } else {
> > > +     }
> > > +
> > > +     if (!can_assume(VALID_DTB)) {
> > > +             /* Bounds check structure block */
> > > +             if (fdt_version(fdt) < 17) {
> > > +                     if (!check_off_(hdrsize, fdt_totalsize(fdt),
> > > +                                     fdt_off_dt_struct(fdt)))
> > > +                             return -FDT_ERR_TRUNCATED;
> > > +             } else {
> > > +                     if (!check_block_(hdrsize, fdt_totalsize(fdt),
> > > +                                       fdt_off_dt_struct(fdt),
> > > +                                       fdt_size_dt_struct(fdt)))
> > > +                             return -FDT_ERR_TRUNCATED;
> > > +             }
> > > +
> > > +             /* Bounds check strings block */
> > >               if (!check_block_(hdrsize, fdt_totalsize(fdt),
> > > -                               fdt_off_dt_struct(fdt),
> > > -                               fdt_size_dt_struct(fdt)))
> > > +                               fdt_off_dt_strings(fdt),
> > > +                               fdt_size_dt_strings(fdt)))
> > >                       return -FDT_ERR_TRUNCATED;
> > >       }
> > >
> > > -     /* Bounds check strings block */
> > > -     if (!check_block_(hdrsize, fdt_totalsize(fdt),
> > > -                       fdt_off_dt_strings(fdt), fdt_size_dt_strings(=
fdt)))
> > > -             return -FDT_ERR_TRUNCATED;
> > > -
> > >       return 0;
> > >  }
> > >
> > > @@ -142,7 +148,7 @@ uint32_t fdt_next_tag(const void *fdt, int starto=
ffset, int *nextoffset)
> > >
> > >       *nextoffset =3D -FDT_ERR_TRUNCATED;
> > >       tagp =3D fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
> > > -     if (!tagp)
> > > +     if (!can_assume(VALID_DTB) && !tagp)
> > >               return FDT_END; /* premature end */
> > >       tag =3D fdt32_to_cpu(*tagp);
> > >       offset +=3D FDT_TAGSIZE;
> > > @@ -154,13 +160,13 @@ uint32_t fdt_next_tag(const void *fdt, int star=
toffset, int *nextoffset)
> > >               do {
> > >                       p =3D fdt_offset_ptr(fdt, offset++, 1);
> > >               } while (p && (*p !=3D '\0'));
> > > -             if (!p)
> > > +             if (!can_assume(VALID_DTB) && !p)
> > >                       return FDT_END; /* premature end */
> > >               break;
> > >
> > >       case FDT_PROP:
> > >               lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> > > -             if (!lenp)
> > > +             if (!can_assume(VALID_DTB) && !lenp)
> > >                       return FDT_END; /* premature end */
> > >               /* skip-name offset, length and value */
> > >               offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
> > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > index a5c2797..b41083f 100644
> > > --- a/libfdt/fdt_ro.c
> > > +++ b/libfdt/fdt_ro.c
> > > @@ -289,9 +289,12 @@ const char *fdt_get_name(const void *fdt, int no=
deoffset, int *len)
> > >       const char *nameptr;
> > >       int err;
> > >
> > > -     if (((err =3D fdt_ro_probe_(fdt)) < 0)
> > > -         || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0))
> > > +     if (!can_assume(VALID_DTB)) {
> > > +             if ((err =3D fdt_ro_probe_(fdt)) < 0)
> >
> > Seems like it might be cleaner to include the can_assume() check into
> > fdt_ro_probe_().
>=20
> OK.
>=20
> >
> > >                       goto fail;
> > > +             if ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) <=
 0)
> > > +                     goto fail;
> > > +     }
> > >
> > >       nameptr =3D nh->name;
> > >
> > > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > > index 8795947..7a41a31 100644
> > > --- a/libfdt/fdt_rw.c
> > > +++ b/libfdt/fdt_rw.c
> > > @@ -13,6 +13,8 @@
> > >  static int fdt_blocks_misordered_(const void *fdt,
> > >                                 int mem_rsv_size, int struct_size)
> > >  {
> > > +     if (can_assume(VALID_DTB))
> > > +             return false;
> >
> > Urgh... the spec doesn't actually specify a block order, so I'm not
> > sure we can put this one under VALID_DTB.
>=20
> But if this returns true then we return -FDT_ERR_BADLAYOUT in
> fdt_rw_probe_() below. So it does seem to be wrong.

Ah, right.  So, that's true for all cases, except the call in
fdt_open_into().  The idea is that you have to call fdt_open_into()
before any of the other rw functions.  fdt_open_into() will re-order
the blocks, if necessary, subsequent functions then require them in
the "standard" order.

So for the cases other than open_into() you can probably put this
under VALID_INPUT, I think it's reasonable to include "you've called
prerequisite functions correctly" under requiring suitable input.

You almost certainly also want to elide the block reordering code in
fdt_open_into(), though.  That one probably wants another flag

> > >       return (fdt_off_mem_rsvmap(fdt) < FDT_ALIGN(sizeof(struct fdt_h=
eader), 8))
> > >               || (fdt_off_dt_struct(fdt) <
> > >                   (fdt_off_mem_rsvmap(fdt) + mem_rsv_size))
> > > @@ -24,6 +26,8 @@ static int fdt_blocks_misordered_(const void *fdt,
> > >
> > >  static int fdt_rw_probe_(void *fdt)
> > >  {
> > > +     if (can_assume(VALID_DTB))
> > > +             return 0;
> > >       FDT_RO_PROBE(fdt);
> > >
> > >       if (fdt_version(fdt) < 17)
> > > @@ -40,7 +44,8 @@ static int fdt_rw_probe_(void *fdt)
> > >  #define FDT_RW_PROBE(fdt) \
> > >       { \
> > >               int err_; \
> > > -             if ((err_ =3D fdt_rw_probe_(fdt)) !=3D 0) \
> > > +             if (!can_assume(VALID_DTB) && \
> > > +                 (err_ =3D fdt_rw_probe_(fdt)) !=3D 0) \
> >
> >
> > You shouldn't need the test both inside fdt_rw_probe_() and in the
> > FDT_RW_PROBE() macro, no?
>=20
> OK. It saves a small amount of code space but we can look at it once
> we get something applied...

Ok, do you know why that is?

>=20
> >
> > >                       return err_; \
> > >       }
> > >
>=20
> I'll hold off sending a new version until I hear back.
>=20
> Regards,
> Simon
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oplxJGu+Ee5xywIT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5CBpwACgkQbDjKyiDZ
s5J9CQ//TT+AIz0Fxk4i7/Fvm/O8vJqhe+CT72sneeUPtJ210EgAKYwoyPTTpgzh
w9hvAoUD9lLYmT/drgy2sOqCHACpnm/F6LFW1btnedJU2uSmT/Lk1rjOx+6PSrMG
5lxwOK7sTS/xcTp0J37ImTZ0qGvfvuHLrh+m8PpvqWfnkNw+1jLym7nJmicUSwVY
COUY84GCDnNRHMLjSY2eNLhfy+IUwiInWYHDSyh+MSPzJCSqYHC0AVvTG086vLpS
XBVwviX9SrhExC0a7mkvaBXfbi7KuH5O7JJcA64GX/undofysQVsoqLsaxcNG/hK
pl0GBUK6DKxT3+I9SsBlssw8J750erfLSGSONvAnlySVCpQuG7Hm5on8uBYUw1zt
OISZMwF5UuYhHEP+RhzqL2jNOY+ERDJHIXdE3vZuQKOZEA815+kxdGbbFHWJt6x0
T4/7P7Dhn640xzasmoK0DZE8aMtZzzTOR/mgGwe31x73ctL0JqD0r8DIJCSO3i9C
cck0WI9szaLBs+d5Gzt9No7C28T02md6esNXTeszxukJHiJixvuUIPspkN7zHRIs
uv7qyAcrQeAuA8lWWWs35x2wWiyeEg3XYUUAEEwO2epTEhptCrRmJlF9/5C/U+UB
jKiHJAaiQnagbrMLQcV/X29UO6M2Jx7u+hVzICu2GYxoxq2U860=
=/3h3
-----END PGP SIGNATURE-----

--oplxJGu+Ee5xywIT--
