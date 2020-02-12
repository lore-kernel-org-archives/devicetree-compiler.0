From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 4/7] libfdt: Add support for disabling sanity checks
Date: Wed, 12 Feb 2020 13:05:03 +1100
Message-ID: <20200212020503.GO22584@umbus.fritz.box>
References: <20200206054034.162732-1-sjg@chromium.org>
 <20200206054034.162732-5-sjg@chromium.org>
 <20200211011231.GI22584@umbus.fritz.box>
 <CAPnjgZ29PgXrG65RKVsGFzxiSYX5VJrynD+u-mwwiFO+HkKQPg@mail.gmail.com>
 <20200212010519.GN22584@umbus.fritz.box>
 <CAPnjgZ1apEQmMYKT0TVQQOGgtUwOHryRbmujO92ovqHjT1rxrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zBPbvmIlJjvpbu6L"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581479504;
        bh=dC9pbzjiA7pLDKl/yd0H+1R6AhYwbYX5a98Wv6x+RSI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S5tYMPdCD/qYc3f57UHnLyxtT7LtQex+2kVuGD4lO5r6AHdqZmlA0/XSj7SNJ5rXV
         gunsVvvyrn1tx7/oobdVcsaXTwopbcdbhgI9xyQRpopQD/ivCmsra/eVcpcEZB+Hqs
         o04el/Qt2lcxwb8x4wioVqi1ks6hE3fqOC1vF03A=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1apEQmMYKT0TVQQOGgtUwOHryRbmujO92ovqHjT1rxrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--zBPbvmIlJjvpbu6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 06:23:46PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Tue, 11 Feb 2020 at 18:12, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > On Tue, Feb 11, 2020 at 01:08:42PM -0700, Simon Glass wrote:
> > > Hi David,
> > >
> > > On Mon, 10 Feb 2020 at 18:12, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6rL0yjEaa7Ru@public.gmane.org=
au> wrote:
> > > >
> > > > On Wed, Feb 05, 2020 at 10:40:31PM -0700, Simon Glass wrote:
> > > > > Allow enabling ASSUME_VALID_INPUT to disable sanity checks on the=
 device
> > > > > tree and the parameters to libfdt. This assumption covers that ca=
ses where
> > > > > the problem could be with either.
> > > > >
> > > > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > > > ---
> > > > >
> > > > > Changes in v5:
> > > > > - Include just VALID_INPUT checks in this patch
> > > > >
> > > > > Changes in v4: None
> > > > > Changes in v3: None
> > > > > Changes in v2: None
> > > > >
> > > > >  libfdt/fdt.c    | 12 +++++----
> > > > >  libfdt/fdt_ro.c | 71 ++++++++++++++++++++++++++++++++-----------=
------
> > > > >  2 files changed, 54 insertions(+), 29 deletions(-)
> > > > >
> > > > > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > > > > index 03f2b7d..e2c1da0 100644
> > > > > --- a/libfdt/fdt.c
> > > > > +++ b/libfdt/fdt.c
> > > > > @@ -126,10 +126,11 @@ const void *fdt_offset_ptr(const void *fdt,=
 int offset, unsigned int len)
> > > > >  {
> > > > >       unsigned absoffset =3D offset + fdt_off_dt_struct(fdt);
> > > > >
> > > > > -     if ((absoffset < offset)
> > > > > -         || ((absoffset + len) < absoffset)
> > > > > -         || (absoffset + len) > fdt_totalsize(fdt))
> > > > > -             return NULL;
> > > > > +     if (!can_assume(VALID_INPUT))
> > > > > +             if ((absoffset < offset)
> > > > > +                 || ((absoffset + len) < absoffset)
> > > > > +                 || (absoffset + len) > fdt_totalsize(fdt))
> > > > > +                     return NULL;
> > > > >
> > > > >       if (fdt_version(fdt) >=3D 0x11)
> > > > >               if (((offset + len) < offset)
> > > > > @@ -185,7 +186,8 @@ uint32_t fdt_next_tag(const void *fdt, int st=
artoffset, int *nextoffset)
> > > > >               return FDT_END;
> > > > >       }
> > > > >
> > > > > -     if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> > > > > +     if (!can_assume(VALID_INPUT) &&
> > > > > +         !fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> > > > >               return FDT_END; /* premature end */
> > > > >
> > > > >       *nextoffset =3D FDT_TAGALIGN(offset);
> > > > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > > > index b41083f..07c13c9 100644
> > > > > --- a/libfdt/fdt_ro.c
> > > > > +++ b/libfdt/fdt_ro.c
> > > > > @@ -16,7 +16,7 @@ static int fdt_nodename_eq_(const void *fdt, in=
t offset,
> > > > >       int olen;
> > > > >       const char *p =3D fdt_get_name(fdt, offset, &olen);
> > > > >
> > > > > -     if (!p || olen < len)
> > > > > +     if (!p || (!can_assume(VALID_INPUT) && olen < len))
> > > >
> > > > Oof, this one's subtle.  We certainly *can* have olen < len even in
> > > > perfectly valid cases.  However, if we're assuming validly \0
> > > > terminated strings in the strings block *and* no \0s in s (which you
> > > > can with assume(VALID_INPUT)), then the memcmp() will necessarily p=
ick
> > > > up that case.
> > > >
> > > > If we also assume memcmp() is the obvious byte-by-byte implementati=
on
> > > > then it will stop before accessing beyond the end of the strings bl=
ock
> > > > string.  But... I don't think that's necessarily the case for all C
> > > > libraries / runtimes.  So, if this is close to the end of the strin=
gs
> > > > block, the memcmp() could access beyond the dtb buffer, which is a =
no
> > > > no.
> > > >
> > > > Now, I guess we could have an assume(DUMB_MEMCMP) and/or
> > > > assume(READ_ACCESS_SLIGHTLY_BEYOND_THE_DTB_WILL_WORK), but we're
> > > > getting really esoteric now.
> > > >
> > > > Is avoiding this one comparison worth it?
> > >
> > > For further context see this commit:
> > >
> > > f1879e1 Add limited read-only support for older (V2 and V3) device
> > > tree to libfdt.
> > >
> > > Before that we assumed that it was safe to do the memcmp(), so I
> > > figured we could revert the behaviour with this assumption.
> >
> > We did, but I'm pretty sure that assumption was wrong.  I think we've
> > had Coverity complain about a similar construct at some point.
>=20
> OK.
>=20
> >
> > > Another point is that fdt_subnode_offset_namelen() should probably not
> > > allow namelen to be less than strlen(name). Should we add a comment
> > > and check for that?
> >
> > Absolutely not.  namelen is allowed to be less that strlen(name) and
> > expected to in many common cases.  In general the _namelen() variants
> > aren't (primarily) about an optimization to avoid a strlen() call.
> >
> > Rather, they are to allow callers to use these interfaces with a piece
> > of a larger \0 terminated string without having to either mangle their
> > longer string in place, or copy sections out.
> >
> > For example fdt_path_offset() will use namelen < strlen all the time,
> > because it repeatedly calls subnode_offset_namelen() on individual
> > path components without copying them out of the path.  Copying them
> > out would a) be expensive and b) without an allocator would require an
> > arbitrary length limit.
>=20
> OK I had it around the wrong way. So what does the comment 'short match' =
mean?

I guess it means "the string in the strings block is shorter than the
given string, and therefore doesn't match".  We should probably just
drop the comment, it's not very illuminating.

> > > Also I don't think I fully understand fdt_nodename_eq_(). It doesn't
> > > have a function comment so it's not really clear what it is supposed
> > > to do. But if I call it with:
> > >
> > > fdt_nodename_eq_(fdt, offset, s=3D"ernie", len=3D5)
> > >
> > > and say that fdt_get_name() returns "fred" with olen=3D4.
> > >
> > > Now olen < len is true, so this function will return 0, indicating a
> > > match. But there is no match. What am I missing?
> >
> > 1 is a match, not 0.  Think of it as returning a boolean (that's why
> > the name is 'eq', not 'cmp').
>=20
> OK. I wonder if we could use stdbool?

Yeah, maybe.  I try to be conservative with what C features I use in
libfdt, for the a sake bootloader environments built with weird old
toolchains.  I don't really have a sense of how widely/long stdbool
has been implemented.

> > > Anyway I agree it doesn't seem worth it, but I'd like to get some
> > > comments into these functions.
> > >
> > > >
> > > > >               /* short match */
> > > > >               return 0;
> > > > >
> > >
> > > [..]
> > >
> > > > > @@ -292,8 +304,9 @@ const char *fdt_get_name(const void *fdt, int=
 nodeoffset, int *len)
> > > > >       if (!can_assume(VALID_DTB)) {
> > > > >               if ((err =3D fdt_ro_probe_(fdt)) < 0)
> > > > >                       goto fail;
> > > > > -             if ((err =3D fdt_check_node_offset_(fdt, nodeoffset=
)) < 0)
> > > > > -                     goto fail;
> > > > > +             if (can_assume(VALID_INPUT) &&
> > > >
> > > > That should be !can_assume, no?
> > >
> > > Yes, although I've dropped it in v6 since the check is now in
> > > fdt_check_node_offset_().
> > > >
> > > > > +                 (err =3D fdt_check_node_offset_(fdt, nodeoffset=
)) < 0)
> > > > > +             goto fail;
> > > > >       }
> > > > >
> > > > >       nameptr =3D nh->name;
> > > > > @@ -349,7 +362,8 @@ static const struct fdt_property *fdt_get_pro=
perty_by_offset_(const void *fdt,
> > > > >       int err;
> > > > >       const struct fdt_property *prop;
> > > > >
> > > > > -     if ((err =3D fdt_check_prop_offset_(fdt, offset)) < 0) {
> > > > > +     if (!can_assume(VALID_INPUT) &&
> > > > > +         (err =3D fdt_check_prop_offset_(fdt, offset)) < 0) {
> > > > >               if (lenp)
> > > > >                       *lenp =3D err;
> > > > >               return NULL;
> > > > > @@ -391,7 +405,8 @@ static const struct fdt_property *fdt_get_pro=
perty_namelen_(const void *fdt,
> > > > >            (offset =3D fdt_next_property_offset(fdt, offset))) {
> > > > >               const struct fdt_property *prop;
> > > > >
> > > > > -             if (!(prop =3D fdt_get_property_by_offset_(fdt, off=
set, lenp))) {
> > > > > +             prop =3D fdt_get_property_by_offset_(fdt, offset, l=
enp);
> > > > > +             if (!can_assume(VALID_INPUT) && !prop) {
> > > > >                       offset =3D -FDT_ERR_INTERNAL;
> > > >
> > > > So, arguably you could put this one under a weaker assumption flag.
> > > > Basicaly FDT_ERR_INTERNAL errors should *never* happen, even with b=
ad
> > > > input - they're basically assert()s, except I didn't want to rely on
> > > > the runtime things that assert() needs.
> > >
> > > Yes I see. The fdt_first/next_property_offset() functions should never
> > > return anything invalid.
> >
> > Right.  Actually, I guess this could happen if something is
> > concurrently modifying the fdt blob, but really if that's happening
> > all bets are off - there are some limits to how safe I care to be :).
>=20
> Indeed.
>=20
> Regards,
> Simon
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zBPbvmIlJjvpbu6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5DXUwACgkQbDjKyiDZ
s5L7JxAAgwsT2ttrg4KUpcCtrvbZq8hyjIpjWBBUZv3NdMDshJOHq4maBXLGZWeM
dAZWCGhuLul7RhbyCbCY46ObrTsR0ISCc5McNZfQS3LeMcDXNTzAPnzvgmHXSvhJ
s+dul/+0ZhK5TpNbwhHiey8v05t4e7+tm+MdpucTjPM+nlq6T7Q10vOPhzc126WM
+2Hy45VSUBSLqj8wD79RvIb8IEgzLu++4aH8uyFIV9pGGoM11M5/muCJKvWfPejw
H8ctTF+38l8cy+Ypav5qAmZjefIU3ic1Doln02/v8E1y1+CbSjipQXXDU3V3+uJR
lknKIHbTeDSc31DMdDT8V5fHOoBBBVaOJcqyQS34Ix2fWAmodtzfCismkdABB8m+
TIAui3ZoFH/CxtfdKLGfBpKmduv+S26QjWH/oUOWtNtQ5IZ5f1XowqI8NnA4Q9sV
IfHrPngpDbKjoZiUaU09JsVp78PkFLmEhQExK8npviW29ai+RI70w1XVjK/hHxls
YkniHAtFQ6cSMk3FyjkQpJITWeRK0QFvB6FoyfmFf1/pR1r+VEBLprt75U4hn6Xt
Zb14bu/n+xzjVGuVPyHXoq/cTWtdGFnUCFjQhDnPPRxOfTbRPi4o9wfd2eYGWNBj
iAITJmztYk9wmndE3mrLOuZWetFa1oWAiFz94GHoAyK8yBiaZAc=
=UNi+
-----END PGP SIGNATURE-----

--zBPbvmIlJjvpbu6L--
