From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v5 4/7] libfdt: Add support for disabling sanity checks
Date: Wed, 12 Feb 2020 12:05:19 +1100
Message-ID: <20200212010519.GN22584@umbus.fritz.box>
References: <20200206054034.162732-1-sjg@chromium.org>
 <20200206054034.162732-5-sjg@chromium.org>
 <20200211011231.GI22584@umbus.fritz.box>
 <CAPnjgZ29PgXrG65RKVsGFzxiSYX5VJrynD+u-mwwiFO+HkKQPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LvAn5G4Ewe70kJ1i"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581469915;
        bh=4j3uGSLpdCD9KM12MZgqSY5ig+KSv2J5uWOcLIjxdpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bf8vWpw/z05YhFSLyb50ktQC9FGPcAyF+Z3nrBKi9OoUuILGt7pAVharrU6dGY1Gn
         9H6+FT3fmpfDnIyGXmKXwDQfRhLterMdT4Rx4Wp0wyp5A11OWiUYigVFHHUiojHOTw
         ENpfaSWaJd6Jd9EZ/bQjrYNpBV5kdHroOwm29FGQ=
Content-Disposition: inline
In-Reply-To: <CAPnjgZ29PgXrG65RKVsGFzxiSYX5VJrynD+u-mwwiFO+HkKQPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--LvAn5G4Ewe70kJ1i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 01:08:42PM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Mon, 10 Feb 2020 at 18:12, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >
> > On Wed, Feb 05, 2020 at 10:40:31PM -0700, Simon Glass wrote:
> > > Allow enabling ASSUME_VALID_INPUT to disable sanity checks on the dev=
ice
> > > tree and the parameters to libfdt. This assumption covers that cases =
where
> > > the problem could be with either.
> > >
> > > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > > ---
> > >
> > > Changes in v5:
> > > - Include just VALID_INPUT checks in this patch
> > >
> > > Changes in v4: None
> > > Changes in v3: None
> > > Changes in v2: None
> > >
> > >  libfdt/fdt.c    | 12 +++++----
> > >  libfdt/fdt_ro.c | 71 ++++++++++++++++++++++++++++++++---------------=
--
> > >  2 files changed, 54 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > > index 03f2b7d..e2c1da0 100644
> > > --- a/libfdt/fdt.c
> > > +++ b/libfdt/fdt.c
> > > @@ -126,10 +126,11 @@ const void *fdt_offset_ptr(const void *fdt, int=
 offset, unsigned int len)
> > >  {
> > >       unsigned absoffset =3D offset + fdt_off_dt_struct(fdt);
> > >
> > > -     if ((absoffset < offset)
> > > -         || ((absoffset + len) < absoffset)
> > > -         || (absoffset + len) > fdt_totalsize(fdt))
> > > -             return NULL;
> > > +     if (!can_assume(VALID_INPUT))
> > > +             if ((absoffset < offset)
> > > +                 || ((absoffset + len) < absoffset)
> > > +                 || (absoffset + len) > fdt_totalsize(fdt))
> > > +                     return NULL;
> > >
> > >       if (fdt_version(fdt) >=3D 0x11)
> > >               if (((offset + len) < offset)
> > > @@ -185,7 +186,8 @@ uint32_t fdt_next_tag(const void *fdt, int starto=
ffset, int *nextoffset)
> > >               return FDT_END;
> > >       }
> > >
> > > -     if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> > > +     if (!can_assume(VALID_INPUT) &&
> > > +         !fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> > >               return FDT_END; /* premature end */
> > >
> > >       *nextoffset =3D FDT_TAGALIGN(offset);
> > > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > > index b41083f..07c13c9 100644
> > > --- a/libfdt/fdt_ro.c
> > > +++ b/libfdt/fdt_ro.c
> > > @@ -16,7 +16,7 @@ static int fdt_nodename_eq_(const void *fdt, int of=
fset,
> > >       int olen;
> > >       const char *p =3D fdt_get_name(fdt, offset, &olen);
> > >
> > > -     if (!p || olen < len)
> > > +     if (!p || (!can_assume(VALID_INPUT) && olen < len))
> >
> > Oof, this one's subtle.  We certainly *can* have olen < len even in
> > perfectly valid cases.  However, if we're assuming validly \0
> > terminated strings in the strings block *and* no \0s in s (which you
> > can with assume(VALID_INPUT)), then the memcmp() will necessarily pick
> > up that case.
> >
> > If we also assume memcmp() is the obvious byte-by-byte implementation
> > then it will stop before accessing beyond the end of the strings block
> > string.  But... I don't think that's necessarily the case for all C
> > libraries / runtimes.  So, if this is close to the end of the strings
> > block, the memcmp() could access beyond the dtb buffer, which is a no
> > no.
> >
> > Now, I guess we could have an assume(DUMB_MEMCMP) and/or
> > assume(READ_ACCESS_SLIGHTLY_BEYOND_THE_DTB_WILL_WORK), but we're
> > getting really esoteric now.
> >
> > Is avoiding this one comparison worth it?
>=20
> For further context see this commit:
>=20
> f1879e1 Add limited read-only support for older (V2 and V3) device
> tree to libfdt.
>=20
> Before that we assumed that it was safe to do the memcmp(), so I
> figured we could revert the behaviour with this assumption.

We did, but I'm pretty sure that assumption was wrong.  I think we've
had Coverity complain about a similar construct at some point.

> Another point is that fdt_subnode_offset_namelen() should probably not
> allow namelen to be less than strlen(name). Should we add a comment
> and check for that?

Absolutely not.  namelen is allowed to be less that strlen(name) and
expected to in many common cases.  In general the _namelen() variants
aren't (primarily) about an optimization to avoid a strlen() call.

Rather, they are to allow callers to use these interfaces with a piece
of a larger \0 terminated string without having to either mangle their
longer string in place, or copy sections out.

For example fdt_path_offset() will use namelen < strlen all the time,
because it repeatedly calls subnode_offset_namelen() on individual
path components without copying them out of the path.  Copying them
out would a) be expensive and b) without an allocator would require an
arbitrary length limit.

> Also I don't think I fully understand fdt_nodename_eq_(). It doesn't
> have a function comment so it's not really clear what it is supposed
> to do. But if I call it with:
>=20
> fdt_nodename_eq_(fdt, offset, s=3D"ernie", len=3D5)
>=20
> and say that fdt_get_name() returns "fred" with olen=3D4.
>=20
> Now olen < len is true, so this function will return 0, indicating a
> match. But there is no match. What am I missing?

1 is a match, not 0.  Think of it as returning a boolean (that's why
the name is 'eq', not 'cmp').

> Anyway I agree it doesn't seem worth it, but I'd like to get some
> comments into these functions.
>=20
> >
> > >               /* short match */
> > >               return 0;
> > >
>=20
> [..]
>=20
> > > @@ -292,8 +304,9 @@ const char *fdt_get_name(const void *fdt, int nod=
eoffset, int *len)
> > >       if (!can_assume(VALID_DTB)) {
> > >               if ((err =3D fdt_ro_probe_(fdt)) < 0)
> > >                       goto fail;
> > > -             if ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) <=
 0)
> > > -                     goto fail;
> > > +             if (can_assume(VALID_INPUT) &&
> >
> > That should be !can_assume, no?
>=20
> Yes, although I've dropped it in v6 since the check is now in
> fdt_check_node_offset_().
> >
> > > +                 (err =3D fdt_check_node_offset_(fdt, nodeoffset)) <=
 0)
> > > +             goto fail;
> > >       }
> > >
> > >       nameptr =3D nh->name;
> > > @@ -349,7 +362,8 @@ static const struct fdt_property *fdt_get_propert=
y_by_offset_(const void *fdt,
> > >       int err;
> > >       const struct fdt_property *prop;
> > >
> > > -     if ((err =3D fdt_check_prop_offset_(fdt, offset)) < 0) {
> > > +     if (!can_assume(VALID_INPUT) &&
> > > +         (err =3D fdt_check_prop_offset_(fdt, offset)) < 0) {
> > >               if (lenp)
> > >                       *lenp =3D err;
> > >               return NULL;
> > > @@ -391,7 +405,8 @@ static const struct fdt_property *fdt_get_propert=
y_namelen_(const void *fdt,
> > >            (offset =3D fdt_next_property_offset(fdt, offset))) {
> > >               const struct fdt_property *prop;
> > >
> > > -             if (!(prop =3D fdt_get_property_by_offset_(fdt, offset,=
 lenp))) {
> > > +             prop =3D fdt_get_property_by_offset_(fdt, offset, lenp);
> > > +             if (!can_assume(VALID_INPUT) && !prop) {
> > >                       offset =3D -FDT_ERR_INTERNAL;
> >
> > So, arguably you could put this one under a weaker assumption flag.
> > Basicaly FDT_ERR_INTERNAL errors should *never* happen, even with bad
> > input - they're basically assert()s, except I didn't want to rely on
> > the runtime things that assert() needs.
>=20
> Yes I see. The fdt_first/next_property_offset() functions should never
> return anything invalid.

Right.  Actually, I guess this could happen if something is
concurrently modifying the fdt blob, but really if that's happening
all bets are off - there are some limits to how safe I care to be :).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LvAn5G4Ewe70kJ1i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5DT0wACgkQbDjKyiDZ
s5I4kQ//ZRDXG1i55hIbkF4sF93j63WxsV4uu+HZ7JkR92iXWkOBTIyylg6dFUtb
A8OJuQy/GDg1PXIR7WsX5PuwPV38JFG866yfIRHoRXPw0xUfjlsjJFYsN+gp0OHB
FZKhpFlgMA57RyKIyK/+6lP0BSVDSBPkB2Jg2g1hk27wj5B/o4+2Jet4l13wv0KU
6Gvai9YRBGbqNph2RxLXogbigW49rPdH2Tnl820UGPou1CgvZVQDWqbZJwB+M6cv
AoOZ20Dr8tbbyAX7HdhhrxaBKYtyHmGJZYqtkF8Vt7i2pgScXL9tHOOmGL6sZYYx
V+9uflD/gL4QGLm0wzzeHW2r9mFN+Q5dns/iGnTlA98YwKALlPWCIyz9Tza6ED6r
BJdAdfz29V1xMpp+XSHvsWCF394vpNdZXrhs41LNAyM0XZ1nsSQBLZRdQq3BwJXy
QaSKOtF5DbB6our3p0QhNID3nCyeaDFcuEdoMYy+NiTH8bFxE34dt7xKxMEOo/V9
pKLsFlfQpij+6BgU4nrb5fyfVMC7iadPMqExJuTWcl7pw3v5PdqyHMPQIPBr8l7A
b1wZ7dkUcUVbpBVAnZZ0TpmHGWkYKDAF05oLEscmY3J4okVlu7wUhsdqZs0WNKqh
/hCVPwUVLJYVlFO+I5bOwnY7YzJs6+cNbMirrxUiTg7Q7M5OCtQ=
=XHUP
-----END PGP SIGNATURE-----

--LvAn5G4Ewe70kJ1i--
