From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 5/6] libfdt: Add support for disabling version checks
Date: Sun, 2 Feb 2020 17:23:50 +1100
Message-ID: <20200202062350.GC30687@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-6-sjg@chromium.org>
 <20200128083709.GK42099@umbus.fritz.box>
 <CAPnjgZ02B2pu9vSh2uUf-4e5HZCWq2nOcpMXrrnXJTv98oScEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580624769;
        bh=jLLaAVXpZA1GuGHnkPO6hXb30mvWNo9QLJYfNPQuHjY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gl3Um44UK2qbFOASs1NKcavsiG5//MM/wJzaDnVxp8PNts5ct7oPClX1oTKiqBcbK
         3NT7PqrHHWC/hyMSlGMyDbvojLewcIWw+kBE/0s5aLIrQ0VSV06piCERPzFhv7oYks
         mRlp4JwnzWhsvVr6lpG8eO5mg0zTa0Y9sUM9t7RY=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ02B2pu9vSh2uUf-4e5HZCWq2nOcpMXrrnXJTv98oScEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 11:14:27AM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Tue, 28 Jan 2020 at 01:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > On Tue, Nov 12, 2019 at 06:54:21PM -0700, Simon Glass wrote:
> > > Allow enabling FDT_ASSUME_LATEST to disable version checks.
> > >
> > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > LGTM, one minor comment below.
> >
> > > ---
> > >
> > > Changes in v4: None
> > > Changes in v3: None
> > > Changes in v2: None
> > >
> > >  libfdt/fdt.c    | 34 +++++++++++++++++++++-------------
> > >  libfdt/fdt_ro.c | 16 ++++++++--------
> > >  libfdt/fdt_rw.c |  6 +++---
> > >  3 files changed, 32 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > > index d89c0e0..78dbe58 100644
> > > --- a/libfdt/fdt.c
> > > +++ b/libfdt/fdt.c
> > > @@ -21,10 +21,13 @@ int32_t fdt_ro_probe_(const void *fdt)
> > >
> > >       if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
> > >               /* Complete tree */
> > > -             if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> > > -                     return -FDT_ERR_BADVERSION;
> > > -             if (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VER=
SION)
> > > -                     return -FDT_ERR_BADVERSION;
> > > +             if (!can_assume(LATEST)) {
> > > +                     if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERS=
ION)
> > > +                             return -FDT_ERR_BADVERSION;
> > > +                     if (fdt_last_comp_version(fdt) >
> > > +                                     FDT_LAST_SUPPORTED_VERSION)
> > > +                             return -FDT_ERR_BADVERSION;
> > > +             }
> > >       } else if (fdt_magic(fdt) =3D=3D FDT_SW_MAGIC) {
> > >               /* Unfinished sequential-write blob */
> > >               if (fdt_size_dt_struct(fdt) =3D=3D 0)
> > > @@ -72,7 +75,8 @@ size_t fdt_header_size_(uint32_t version)
> > >
> > >  size_t fdt_header_size(const void *fdt)
> > >  {
> > > -     return fdt_header_size_(fdt_version(fdt));
> > > +     return can_assume(LATEST) ? FDT_V17_SIZE :
> > > +             fdt_header_size_(fdt_version(fdt));
> > >  }
> > >
> > >  int fdt_check_header(const void *fdt)
> > > @@ -81,11 +85,14 @@ int fdt_check_header(const void *fdt)
> > >
> > >       if (fdt_magic(fdt) !=3D FDT_MAGIC)
> > >               return -FDT_ERR_BADMAGIC;
> > > -     if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> > > -         || (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION=
))
> > > -             return -FDT_ERR_BADVERSION;
> > > -     if (fdt_version(fdt) < fdt_last_comp_version(fdt))
> > > -             return -FDT_ERR_BADVERSION;
> > > +     if (!can_assume(LATEST)) {
> > > +             if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> > > +                 || (fdt_last_comp_version(fdt) >
> > > +                     FDT_LAST_SUPPORTED_VERSION))
> > > +                     return -FDT_ERR_BADVERSION;
> > > +             if (fdt_version(fdt) < fdt_last_comp_version(fdt))
> > > +                     return -FDT_ERR_BADVERSION;
> > > +     }
> > >       hdrsize =3D fdt_header_size(fdt);
> > >       if (!can_assume(SANE)) {
> > >
> > > @@ -101,7 +108,7 @@ int fdt_check_header(const void *fdt)
> > >
> > >       if (!can_assume(SANE)) {
> > >               /* Bounds check structure block */
> > > -             if (fdt_version(fdt) < 17) {
> > > +             if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
> >
> > I wonder if we should make fdt_version() return 17 unconditionally in
> > the can_assume() case, which might make some of these tests redundant.
>=20
> I think that would require fdt_version() to change from being a macro,
> since we cannot check assumptions in libfdt.h without including
> libfdt_internal.h in libfdt.h

Ah.. good point.

> Is that acceptable?

Making it not a macro is fine per se, but for this you'd also need to
make it out-of-line, rather than inline in libfdt.h, and I strongly
suspect that won't be worth the cost.  So, no.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl42avYACgkQbDjKyiDZ
s5L1yRAAuneHHttt/0i+XYwfmKnvVGgkDvkUGx4ITaZZjZDifLxtK1ZUHQtgknFa
MtGKkwcXFY3AHJuaCKR4uWghfFPabYro7gDRT7zxPNCYkE3oSVt+LXBaCmXc5j2Z
GwzkpqX9SxC3Xlyn4pQGww7+skkXkKA9fhix64bidENXPxB8N5wVszkMysXx0FzK
caP5o9WKArxk2cJDITgWEuD/O30jy5IDj+1DUiimpDYEgw1lzW/0pdO/MTj6BRo6
KurWJmuSh0fNMpCKOCNizzQv2xtsd+O/8H3PtY8yYxVgI3Y9aQo9ccTG61y/t7+X
NRqznkUA+zEDDsBLHTTMZXFhzV+d5S8zQm70/yJuyhiBdPaBKSAPn0BmCvesPDs4
iCMglt3Oq0zrwhM/ynuOVe+HlRdDdlE8MgE6mSkNunOt/mNxTYvsZca3KZRiO9un
YwXr0VV+bRzRfJfbxC20lACV1Trq2Eae0BKVHQ8MTYnxoJNtgTW8+DgWWEpPKPev
k4FjTf9+p8bi33/54ZiL0McqUlAuzgvHth7o3t930sDyYVkvcMto1Lhmkx+PmrcL
cjnF368DN5pypwyOKASc5K6gV53uh/zljSsi3yTgWw21w5rB9u5hC0fiu28h4Id3
m5r8sgRtwdbKW3cHL08U4i1W692MpKLoiX5J2xjGAsBtR5jfF+g=
=ElH2
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
