From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 2/6] Add a way to control the level of checks in the
 code
Date: Mon, 3 Feb 2020 11:41:49 +1100
Message-ID: <20200203004149.GC52446@umbus.fritz.box>
References: <20191113015422.67210-1-sjg@chromium.org>
 <20191113015422.67210-3-sjg@chromium.org>
 <20200128082819.GH42099@umbus.fritz.box>
 <CAPnjgZ2x7yi3tgzRkM9m-2JBpYVqaXz42KLNiyUA6nPHu3KjqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1580690625;
        bh=NrlTViTkETHk6SwEkWKbPQq2FQUvW00DYhctPmlkAes=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mTNRI6f03dlWzWUXL+oD+8jF+f8+tRBV3JrXbBTGL3GZ1A3Sp9a4ZYKATo3zcHYdL
         56imW/6BU8aUOUWPZM0XS3pGlPvgrFP7ydWamJwplePh7dv9qhPI10TyzpyviKM5Ks
         IdlpupkjYnXYZkPArKPik6AKckBtMkf58YoUqqYI=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2x7yi3tgzRkM9m-2JBpYVqaXz42KLNiyUA6nPHu3KjqA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 11:14:26AM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Tue, 28 Jan 2020 at 01:37, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > On Tue, Nov 12, 2019 at 06:54:18PM -0700, Simon Glass wrote:
> > > Add a new ASSUME_MASK option, which allows for some control over the
> > > checks used in libfdt. With all assumptions enabled, libfdt assumes t=
hat
> > > the input data and parameters are all correct and that internal errors
> > > cannot happen.
> > >
> > > By default no assumptions are made and all checks are enabled.
> > >
> > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > ---
> > >
> > > Changes in v4:
> > > - Add a can_assume() macros and squash the inline functions into one
> > > - Drop unnecessary FDT_ prefix
> > > - Fix 'Incosistencies' typo
> > > - Merge the 'friendly' and 'sane' checks into one
> > > - Update and expand comments
> > >
> > > Changes in v3:
> > > - Expand the comments about each check option
> > > - Invert the checks to be called assumptions
> > > - Move header-version code to fdt.c
> > > - Move the comments on check options to the enum
> > > - Use hex for CHK_MASK
> > >
> > > Changes in v2:
> > > - Add an fdt_ prefix to avoid namespace conflicts
> > > - Use symbolic names for _check functions and drop leading underscores
> > >
> > >  Makefile                 |  6 ++-
> > >  libfdt/libfdt_internal.h | 88 ++++++++++++++++++++++++++++++++++++++=
++
> > >  2 files changed, 93 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 4d88157..bdeaf93 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -16,7 +16,11 @@ EXTRAVERSION =3D
> > >  LOCAL_VERSION =3D
> > >  CONFIG_LOCALVERSION =3D
> > >
> > > -CPPFLAGS =3D -I libfdt -I .
> > > +# Control the assumptions made (e.g. risking security issues) in the=
 code.
> > > +# See libfdt_internal.h for details
> > > +ASSUME_MASK ?=3D 0
> > > +
> > > +CPPFLAGS =3D -I libfdt -I . -DFDT_ASSUME_MASK=3D$(ASSUME_MASK)
> > >  WARNINGS =3D -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> > >       -Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wsh=
adow
> > >  CFLAGS =3D -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CF=
LAGS)
> > > diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> > > index 058c735..198480c 100644
> > > --- a/libfdt/libfdt_internal.h
> > > +++ b/libfdt/libfdt_internal.h
> > > @@ -48,4 +48,92 @@ static inline struct fdt_reserve_entry *fdt_mem_rs=
v_w_(void *fdt, int n)
> > >
> > >  #define FDT_SW_MAGIC         (~FDT_MAGIC)
> > >
> > > +/*******************************************************************=
***/
> > > +/* Checking controls                                                =
  */
> > > +/*******************************************************************=
***/
> > > +
> > > +#ifndef FDT_ASSUME_MASK
> > > +#define FDT_ASSUME_MASK 0
> > > +#endif
> > > +
> > > +/*
> > > + * Defines assumptions which can be enabled. Each of these can be en=
abled
> > > + * individually. For maximum saftey, don't enable any assumptions!
> > > + *
> > > + * For minimal code size and no safety, use ASSUME_PERFECT at your o=
wn risk.
> > > + * You should have another method of validating the device tree, suc=
h as a
> > > + * signature or hash check before using libfdt.
> > > + *
> > > + * For situations where security is not a concern it may be safe to =
enable
> > > + * ASSUME_SANE.
> > > + */
> > > +enum {
> > > +     /*
> > > +      * This does essentially no checks. Only the latest device-tree
> > > +      * version is correctly handled. Inconsistencies or errors in t=
he device
> > > +      * tree may cause undefined behaviour or crashes.
> >
> > Likewise for errors in parameters, yes?
>=20
> Will add
>=20
> >
> > > +      * If an error occurs when modifying the tree it may leave the =
tree in
> > > +      * an intermediate (but valid) state. As an example, adding a p=
roperty
> > > +      * where there is insufficient space may result in the property=
 name
> > > +      * being added to the string table even though the property its=
elf is
> > > +      * not added to the struct section.
> > > +      *
> > > +      * Only use this if you have a fully validated device tree with
> > > +      * the latest supported version and wish to minimise code size.
> > > +      */
> > > +     ASSUME_PERFECT          =3D 0xff,
> > > +
> > > +     /*
> > > +      * This assumes that the device tree is sane. i.e. header metad=
ata
> > > +      * and basic hierarchy are correct.
> > > +      *
> > > +      * It also assumes libfdt functions are called with valid param=
eters,
> > > +      * i.e. not trigger FDT_ERR_BADOFFSET or offsets that are out o=
f bounds.
> > > +      * It disables any extensive checking of parameters and the dev=
ice
> > > +      * tree, making various assumptions about correctness. Normal d=
evice
> > > +      * trees produced by libfdt and the compiler should be handled =
safely.
> > > +      * Malicious device trees and complete garbage may cause libfdt=
 to
> > > +      * behave badly or crash.
> > > +      *
> > > +      * These checks will be sufficient if you have a valid device t=
ree with
> > > +      * no internal inconsistencies and call libfdt with correct par=
ameters.
> > > +      * With this assumption, libfdt will generally not return
> > > +      * -FDT_ERR_INTERNAL, -FDT_ERR_BADLAYOUT, etc.
> > > +      */
> > > +     ASSUME_SANE             =3D 1 << 0,
> >
> > How tricky would it be to split this into ASSUME_VALID_DTB and
> > ASSUME_VALID_PARAMETERS?  I don't know useful those are on their own,
> > but it seems to me it might be easier to define the effect of this if
> > split that way.
>=20
> From my reading of the checks I've added, we could split out the
> ASSUME_VALID_DTB assumption and that would have some checks in it
> (e.g. in fdt_check_header()).
>=20
> But for parameters the code doesn't currently check whether the DT or
> the argument is wrong. E.g.:
>=20
> const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
> {
> unsigned absoffset =3D offset + fdt_off_dt_struct(fdt);
>=20
> if (!can_assume(SANE))
> if ((absoffset < offset)
>     || ((absoffset + len) < absoffset)
>     || (absoffset + len) > fdt_totalsize(fdt))
> return NULL;
>=20
> Either the struct offset or @offset could be wrong here.

Ah, I see your point.  And in some cases it's not necessarily possible
to tell - for example there are several places where it really possible to
tell - there's a bunch of cases where we can't really know whether
it's a bad offset or bad data in the tree.

> I think we could use ASSUME_VALID_DTB for the checks where it makes
> sense. For the others we could perhaps assume that the DTB is valid
> and blame any failure on parameters. So:
>=20
> - anything that has no parameters in the check would use ASSUME_VALID_DTB
> - anything else would use ASSUME_VALID_PARAMETERS
>=20
> What do you think?

I think that sounds workable, though I'd suggest refining it a bit.
Anything that can only be caused by bad dtb, you can elide with
ASSUME_VALID_DTB.  Anything that might be bad dtb or bad parameters
you'd need ASSUME_VALID_PARAMETERS.  Or maybe call it
ASSUME_VALID_INPUT, to imply both the dtb and all other inputs to the
library are correct?

I think that's essentially the approach we already use for the
purposes of picking what error code we return.  We should only return
BADSTRUCTURE if it's definitely bad content in the dtb.  However, in
some cases we could return BADOFFSET where the problem really likes in
the dtb, not the offset parameter.  I mean, I guess a "valid offset"
isn't even a meaningful concept if the dtb is bad.

That would mean that setting ASSUME_VALID_PARAMETERS without setting
ASSUME_VALID_DTB wouldn't make sense, which should be documented.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl43bE0ACgkQbDjKyiDZ
s5LwEA//Upjj1e5y1uLCE6gPkAXIE1fB60Ashrhvlkpyo2JWLz7ttRTZ2lKiag4j
/m7bovZFz5mUkTEz3UJmGnX3HpYIBUbqZqvuKrqZzC+41YjTqyTfYnuJ+b/jpDUi
9aFmilYT3hRt8D6rVPW1XSR5RIVY2/Gnb+PEPTb7ll2YTTZa1pdO6mGE6DQPP6Gg
Q7dnNGuzFqOb0qOyJ38cg8tB6sjX8lnVX/T0MWE7w59yT4yM+nM2vsD91YJEM0Ml
XzkAbZWH6ehwKadLKBEmhj97ER5GWdrmjnLNnDot7gh770ZC1iUuQKW8nwr2EgdZ
mgLMrNWSUw0Gh8NNQEY7uGfdQfwIOV6bHj/F/EAAvmW26lEMsyikVcGbpQYcjEpA
7IPUnd+K/5rRbhWBdd3mpVP3ELxDUZT7yncmG5F4eUBbQdlV3e5G6F/hp5XS/F36
418xASDwDfl1VZ+BMm6idqLGISmYcAaqUuFQ84LqsU8IJSRkVNhWIo8xImF7QHyI
XBqb07RM/2bXuFkTRF7dTUe/N2jfCv2pev4G8mZiAMjYbCdvr5FxldQLee0z2zog
fJH+0Wa5ajVPfuWK5YxK8+WgZR9ee2mxdDylJWJv79l7uVm2Ajok0Mp7b7CZcL3v
Efy3hWo3KLu45V5wqpwtm1c4aPwpR5BzCUfHILP+KWkR9XN+D2g=
=7dgp
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
