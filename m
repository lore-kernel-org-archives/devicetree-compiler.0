From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: Add markers on known properties
Date: Mon, 12 Jul 2021 12:37:01 +1000
Message-ID: <YOuqzf8LtYM4eX39@yekko>
References: <20210608204626.1545418-1-robh@kernel.org>
 <20210608204626.1545418-2-robh@kernel.org>
 <YM23achEk4QOEAAk@yekko>
 <CAL_JsqLnbiz-TzH0C0vw57B-1J=N6jBSHeiyv5yKA+Z3+0fWPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OP14suSRIk9GDj/l"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1626057542;
        bh=SGuf6PErOIChw9FrabFvIRbBR5FyFSfRh95g066+rIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CXElDoqby24JjlRnHZ61SOzuUNiUixbgYA6yQwvZPw1iKxxBKQQ7Y+imisG/NAxbZ
         0hKaoD1Im10jSrfBEsKUUfICj+Ai/JIcV40LrIz/w/wMzKgmV1Hn0OvWe+D+vV5NTE
         TsKYM0yKUF0TjFzisrjT3KOeoVsFF9N0YLxLf3gM=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLnbiz-TzH0C0vw57B-1J=N6jBSHeiyv5yKA+Z3+0fWPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--OP14suSRIk9GDj/l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 12:22:45PM -0600, Rob Herring wrote:
> On Sat, Jun 19, 2021 at 3:22 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Tue, Jun 08, 2021 at 03:46:24PM -0500, Rob Herring wrote:
> > > For properties we already have checks for, we know the type and how to
> > > parse them. Use this to add type and phandle markers so we have them =
when
> > > the source did not (e.g. dtb format).
> > >
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > ---
> > > v2:
> > >  - Set marker.ref on phandle markers
> > >  - Avoid adding markers if there's any conflicting type markers.
> > > ---
> > >  checks.c | 102 ++++++++++++++++++++++++++++++++++++++++++++---------=
--
> > >  1 file changed, 82 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/checks.c b/checks.c
> > > index e6c7c3eeacac..0f51b9111be1 100644
> > > --- a/checks.c
> > > +++ b/checks.c
> > > @@ -58,6 +58,38 @@ struct check {
> > >  #define CHECK(nm_, fn_, d_, ...) \
> > >       CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> > >
> > > +static struct marker *marker_add(struct marker **list, enum markerty=
pe type,
> > > +                              unsigned int offset)
> >
> > Now that this is only conditionally adding markers, it needs a
> > different name.  Maybe "add_type_annotation".
>=20
> marker_add_type_annotation to be consistent that marker_* functions
> work on markers?

Sure, that's fine too.  It's a local function, so naming consistency
isn't as important as for globals.

> > > +{
> > > +     struct marker *m =3D *list;
> >
> > Since this is strictly about type annotations (and you don't have
> > parameters for the necessary ref parameter for other things), an
> > assert() that the given type is a TYPE_* wouldn't go astray.
> >
> > > +
> > > +     /* Check if we already have a different type or a type marker a=
t the offset*/
> > > +     for_each_marker_of_type(m, type) {
> > > +             if ((m->type >=3D TYPE_UINT8) && (m->type !=3D type))
> >
> > I'm assuming the >=3D TYPE_UINT8 is about checking that this is a type
> > marker rather than a ref marker.  Adding a helper function for that
> > would probably be a good idea.  Putting it inline in dtc.h would make
> > it less likely that we break it if we ever add new marker types in
> > future.
>=20
> It's checking that we don't have markers of a different type within
> the property. While that is valid dts format, it's never the case for
> any known (by checks.c) properties.

That comment doesn't seem to quite match the thing above.

Besides, I don't think that's really true.  It would be entirely
sensible for 'reg' to have mixed u32 & u64 type to encode PCI
addresses.  Likewise it would make sense for 'ranges' to have mixed
u32 & u64 type if mapping between a 32-bit and 64-bit bus.

> It could be an assert() as it's
> one of those 'should never happen'.

An assert() should only be used if the problem must have been caused
by an error in the code.  Bad user input should never trigger an
assert().
>=20
> We already have another case of (m->type >=3D TYPE_UINT8), so I can add
> an inline for that.

Thanks.

>=20
> > Checking for m->type !=3D type doesn't seem useful to me.  If m->type =
=3D=3D
> > type then either it's at the same offset, in which case there's
> > nothing to do, or it's at a different offset in which case... well,
> > it's not totally clear what's going on, but it's probably safest to
> > leave it alone.
>=20
> Only the same type at a different offset is expected. More on that below.
>=20
> >
> > > +                     return NULL;
> > > +             if (m->type =3D=3D type && m->offset =3D=3D offset)
> > > +                     return NULL;
> > > +     }
> > > +
> > > +     m =3D xmalloc(sizeof(*m));
> > > +     m->type =3D type;
> > > +     m->offset =3D offset;
> > > +     m->next =3D NULL;
> > > +     m->ref =3D NULL;
> > > +
> > > +     /* Find the insertion point, markers are in order by offset */
> > > +     while (*list && ((*list)->offset < m->offset))
> > > +             list =3D &((*list)->next);
> > > +
> > > +     if (*list) {
> > > +             m->next =3D (*list)->next;
> > > +             (*list)->next =3D m;
> > > +     } else
> > > +             *list =3D m;
> > > +
> > > +     return m;
> > > +}
> > > +
> > >  static inline void  PRINTF(5, 6) check_msg(struct check *c, struct d=
t_info *dti,
> > >                                          struct node *node,
> > >                                          struct property *prop,
> > > @@ -260,8 +292,12 @@ static void check_is_cell(struct check *c, struc=
t dt_info *dti,
> > >       if (!prop)
> > >               return; /* Not present, assumed ok */
> > >
> > > -     if (prop->val.len !=3D sizeof(cell_t))
> > > +     if (prop->val.len !=3D sizeof(cell_t)) {
> > >               FAIL_PROP(c, dti, node, prop, "property is not a single=
 cell");
> > > +             return;
> > > +     }
> > > +
> > > +     marker_add(&prop->val.markers, TYPE_UINT32, 0);
> > >  }
> > >  #define WARNING_IF_NOT_CELL(nm, propname) \
> > >       WARNING(nm, check_is_cell, (propname))
> > > @@ -517,6 +553,7 @@ static cell_t check_phandle_prop(struct check *c,=
 struct dt_info *dti,
> > >                * we treat it as having no phandle data for now. */
> > >               return 0;
> > >       }
> > > +     marker_add(&prop->val.markers, TYPE_UINT32, 0);
> > >
> > >       phandle =3D propval_cell(prop);
> > >
> > > @@ -756,7 +793,7 @@ static void check_reg_format(struct check *c, str=
uct dt_info *dti,
> > >                            struct node *node)
> > >  {
> > >       struct property *prop;
> > > -     int addr_cells, size_cells, entrylen;
> > > +     int addr_cells, size_cells, entrylen, offset;
> > >
> > >       prop =3D get_property(node, "reg");
> > >       if (!prop)
> > > @@ -774,10 +811,16 @@ static void check_reg_format(struct check *c, s=
truct dt_info *dti,
> > >       size_cells =3D node_size_cells(node->parent);
> > >       entrylen =3D (addr_cells + size_cells) * sizeof(cell_t);
> > >
> > > -     if (!is_multiple_of(prop->val.len, entrylen))
> > > +     if (!is_multiple_of(prop->val.len, entrylen)) {
> > >               FAIL_PROP(c, dti, node, prop, "property has invalid len=
gth (%d bytes) "
> > >                         "(#address-cells =3D=3D %d, #size-cells =3D=
=3D %d)",
> > >                         prop->val.len, addr_cells, size_cells);
> > > +             return;
> > > +     }
> > > +
> > > +     for (offset =3D 0; offset < prop->val.len; offset +=3D entrylen)
> > > +             if (!marker_add(&prop->val.markers, TYPE_UINT32, offset=
))
> > > +                     break;
> >
> > I don't see any point to adding multiple markers.  Each type marker
> > indicates the type until the next marker, so just adding one has the
> > same effect.
>=20
> Multiple markers is the whole point. This is to match the existing
> behavior when we have:
>=20
> reg =3D <baseA sizeA>, <baseB sizeB>;

Urgh, because you're using the type markers for that broken YAML
conversion.  Fine, ok.

> In this case, there's a type marker for each <> entry. That is then
> used by the output stages (dts and yaml). We already have a single
> marker as the format guessing based on property length being a
> multiple of 4 achieves that. Though, for that to work with the yaml
> output we'd have to do (dtb -> dts -> yaml).
>=20
> Currently, the output formatting is dependent on the input format.
> This makes the output consistent in that brackets (via type markers)
> delineate #*-cells boundaries.
>=20
> > >  }
> > >  WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
> > >
> > > @@ -785,7 +828,7 @@ static void check_ranges_format(struct check *c, =
struct dt_info *dti,
> > >                               struct node *node)
> > >  {
> > >       struct property *prop;
> > > -     int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, ent=
rylen;
> > > +     int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, ent=
rylen, offset;
> > >       const char *ranges =3D c->data;
> > >
> > >       prop =3D get_property(node, ranges);
> > > @@ -821,6 +864,10 @@ static void check_ranges_format(struct check *c,=
 struct dt_info *dti,
> > >                         "#size-cells =3D=3D %d)", ranges, prop->val.l=
en,
> > >                         p_addr_cells, c_addr_cells, c_size_cells);
> > >       }
> > > +
> > > +     for (offset =3D 0; offset < prop->val.len; offset +=3D entrylen)
> > > +             if (!marker_add(&prop->val.markers, TYPE_UINT32, offset=
))
> > > +                     break;
> > >  }
> > >  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cel=
ls);
> > >  WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_=
size_cells);
> > > @@ -1400,6 +1447,7 @@ static void check_property_phandle_args(struct =
check *c,
> > >       for (cell =3D 0; cell < prop->val.len / sizeof(cell_t); cell +=
=3D cellsize + 1) {
> > >               struct node *provider_node;
> > >               struct property *cellprop;
> > > +             struct marker *m;
> > >               int phandle;
> > >
> > >               phandle =3D propval_cell_n(prop, cell);
> > > @@ -1416,19 +1464,6 @@ static void check_property_phandle_args(struct=
 check *c,
> > >                       continue;
> > >               }
> > >
> > > -             /* If we have markers, verify the current cell is a pha=
ndle */
> > > -             if (prop->val.markers) {
> > > -                     struct marker *m =3D prop->val.markers;
> > > -                     for_each_marker_of_type(m, REF_PHANDLE) {
> > > -                             if (m->offset =3D=3D (cell * sizeof(cel=
l_t)))
> > > -                                     break;
> > > -                     }
> > > -                     if (!m)
> > > -                             FAIL_PROP(c, dti, node, prop,
> > > -                                       "cell %d is not a phandle ref=
erence",
> > > -                                       cell);
> > > -             }
> > > -
> >
> > Why are you removing this part of the check?
>=20
> Well, it didn't really match up with adding markers. It was checking
> if markers were correct, but now we're adding the markers if not
> present. Plus the get_node_by_phandle() call after this is a better
> check for being a valid phandle. I can make this a separate commit.

Ok.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OP14suSRIk9GDj/l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDrqs0ACgkQbDjKyiDZ
s5IM4A//fNrtm34L8txVkHHbTAOV0Z/HQksZ5TuROvZpvYNSXqt1+Wd7GPR+Lepv
8W8JyyZEwhxHMB/QmbN8ygjYwOz9FBzdKj1xoyXqfQVIt7kO7Hbf5jgKo1USmk1i
DlhjZHRTLxR5+00k2wT0qDcEvyW+IrAnEB002omn4w//hoj4ZT4bKX7gtWWgW0U1
d4M+ohPoYFQPD/RNaO2n+4eTuhL+r43tpmgChc0pHkOjNjqChTVpikcXwYq/+M69
NDnZTHIlbSG3pmtYQzZAuVmkEB+3GCkbviXdx8guyOsKwGKKAF8vGL50UqadP5Jo
AnCi4Me22Fl59GrAr4IX8oNQ4OeLO270vx8ni0Nfy06ToCLi5w9Xt5QERKF2+tzT
mQL6Dirma0Llj0X7745gmwnHJSHCp5pQTLm3MxH19iF+caL30LzmO8bNhS/nRRjt
dEAi/JzY/ZjTIzbMIu/Uyqa2ZfVL/MQB9YGfEDzdyeTCgb7X/vuy4yYKZQJztRGU
BbJ2wF7HO4VQHbKBZhUjjJ0K/or7H7TWVEd130PXo0OC84JIaUpU8/cpSbUQxTMy
7VtrZSCHWNS5wewQ1xnDyKPI36Iru8NbUU+JJZvKk7WbcKDfcCLHxkvoT0FVJv4s
0eE9Dqd7T+MGhJk3k9NfDmrrxCXztr3DKJ1GVj+BvBFTRn/+zDk=
=UkaA
-----END PGP SIGNATURE-----

--OP14suSRIk9GDj/l--
