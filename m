From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: Add markers on known properties
Date: Mon, 21 Jun 2021 12:22:45 -0600
Message-ID: <CAL_JsqLnbiz-TzH0C0vw57B-1J=N6jBSHeiyv5yKA+Z3+0fWPw@mail.gmail.com>
References: <20210608204626.1545418-1-robh@kernel.org> <20210608204626.1545418-2-robh@kernel.org>
 <YM23achEk4QOEAAk@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624299779;
        bh=dx9trzFi3TWdQ8wPW91hmqfjeOlwlKUVrj8iJArkxN0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ngPFExLsgJ9kxHlJOJl52GhCQLHQKCV5Zrle87E/32q9eMI+GlTTpbnzrb/hnUQbk
         W+rhPkLUVXux17YnfnbhNEcCQ+J7VsB2Oskrpi3mm0fTOMPXYkr3UV2yfn9AdlSyOv
         oCdDGwD+nT63l2TLIoG/NDrXvaEO+W8WvuSi0ae/nLbR5Onzgjq7PfdY+TBpmQCO/A
         B7GpbjGG0c1TcHuXzQC1kSk2GmAXpshx6Be0dzVeqyPx5XgdBi0gh53T2xjZPcIGJm
         v25sa8D4JMR5JaO8b81nFQ646CjF2X5zofUBnhkYUC2Xxumh+519NFjC5QgeSqOrQR
         pKD+DMEPXQlSg==
In-Reply-To: <YM23achEk4QOEAAk@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sat, Jun 19, 2021 at 3:22 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Jun 08, 2021 at 03:46:24PM -0500, Rob Herring wrote:
> > For properties we already have checks for, we know the type and how to
> > parse them. Use this to add type and phandle markers so we have them when
> > the source did not (e.g. dtb format).
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> > v2:
> >  - Set marker.ref on phandle markers
> >  - Avoid adding markers if there's any conflicting type markers.
> > ---
> >  checks.c | 102 ++++++++++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 82 insertions(+), 20 deletions(-)
> >
> > diff --git a/checks.c b/checks.c
> > index e6c7c3eeacac..0f51b9111be1 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -58,6 +58,38 @@ struct check {
> >  #define CHECK(nm_, fn_, d_, ...) \
> >       CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> >
> > +static struct marker *marker_add(struct marker **list, enum markertype type,
> > +                              unsigned int offset)
>
> Now that this is only conditionally adding markers, it needs a
> different name.  Maybe "add_type_annotation".

marker_add_type_annotation to be consistent that marker_* functions
work on markers?

>
> > +{
> > +     struct marker *m = *list;
>
> Since this is strictly about type annotations (and you don't have
> parameters for the necessary ref parameter for other things), an
> assert() that the given type is a TYPE_* wouldn't go astray.
>
> > +
> > +     /* Check if we already have a different type or a type marker at the offset*/
> > +     for_each_marker_of_type(m, type) {
> > +             if ((m->type >= TYPE_UINT8) && (m->type != type))
>
> I'm assuming the >= TYPE_UINT8 is about checking that this is a type
> marker rather than a ref marker.  Adding a helper function for that
> would probably be a good idea.  Putting it inline in dtc.h would make
> it less likely that we break it if we ever add new marker types in
> future.

It's checking that we don't have markers of a different type within
the property. While that is valid dts format, it's never the case for
any known (by checks.c) properties. It could be an assert() as it's
one of those 'should never happen'.

We already have another case of (m->type >= TYPE_UINT8), so I can add
an inline for that.

> Checking for m->type != type doesn't seem useful to me.  If m->type ==
> type then either it's at the same offset, in which case there's
> nothing to do, or it's at a different offset in which case... well,
> it's not totally clear what's going on, but it's probably safest to
> leave it alone.

Only the same type at a different offset is expected. More on that below.

>
> > +                     return NULL;
> > +             if (m->type == type && m->offset == offset)
> > +                     return NULL;
> > +     }
> > +
> > +     m = xmalloc(sizeof(*m));
> > +     m->type = type;
> > +     m->offset = offset;
> > +     m->next = NULL;
> > +     m->ref = NULL;
> > +
> > +     /* Find the insertion point, markers are in order by offset */
> > +     while (*list && ((*list)->offset < m->offset))
> > +             list = &((*list)->next);
> > +
> > +     if (*list) {
> > +             m->next = (*list)->next;
> > +             (*list)->next = m;
> > +     } else
> > +             *list = m;
> > +
> > +     return m;
> > +}
> > +
> >  static inline void  PRINTF(5, 6) check_msg(struct check *c, struct dt_info *dti,
> >                                          struct node *node,
> >                                          struct property *prop,
> > @@ -260,8 +292,12 @@ static void check_is_cell(struct check *c, struct dt_info *dti,
> >       if (!prop)
> >               return; /* Not present, assumed ok */
> >
> > -     if (prop->val.len != sizeof(cell_t))
> > +     if (prop->val.len != sizeof(cell_t)) {
> >               FAIL_PROP(c, dti, node, prop, "property is not a single cell");
> > +             return;
> > +     }
> > +
> > +     marker_add(&prop->val.markers, TYPE_UINT32, 0);
> >  }
> >  #define WARNING_IF_NOT_CELL(nm, propname) \
> >       WARNING(nm, check_is_cell, (propname))
> > @@ -517,6 +553,7 @@ static cell_t check_phandle_prop(struct check *c, struct dt_info *dti,
> >                * we treat it as having no phandle data for now. */
> >               return 0;
> >       }
> > +     marker_add(&prop->val.markers, TYPE_UINT32, 0);
> >
> >       phandle = propval_cell(prop);
> >
> > @@ -756,7 +793,7 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
> >                            struct node *node)
> >  {
> >       struct property *prop;
> > -     int addr_cells, size_cells, entrylen;
> > +     int addr_cells, size_cells, entrylen, offset;
> >
> >       prop = get_property(node, "reg");
> >       if (!prop)
> > @@ -774,10 +811,16 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
> >       size_cells = node_size_cells(node->parent);
> >       entrylen = (addr_cells + size_cells) * sizeof(cell_t);
> >
> > -     if (!is_multiple_of(prop->val.len, entrylen))
> > +     if (!is_multiple_of(prop->val.len, entrylen)) {
> >               FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
> >                         "(#address-cells == %d, #size-cells == %d)",
> >                         prop->val.len, addr_cells, size_cells);
> > +             return;
> > +     }
> > +
> > +     for (offset = 0; offset < prop->val.len; offset += entrylen)
> > +             if (!marker_add(&prop->val.markers, TYPE_UINT32, offset))
> > +                     break;
>
> I don't see any point to adding multiple markers.  Each type marker
> indicates the type until the next marker, so just adding one has the
> same effect.

Multiple markers is the whole point. This is to match the existing
behavior when we have:

reg = <baseA sizeA>, <baseB sizeB>;

In this case, there's a type marker for each <> entry. That is then
used by the output stages (dts and yaml). We already have a single
marker as the format guessing based on property length being a
multiple of 4 achieves that. Though, for that to work with the yaml
output we'd have to do (dtb -> dts -> yaml).

Currently, the output formatting is dependent on the input format.
This makes the output consistent in that brackets (via type markers)
delineate #*-cells boundaries.

> >  }
> >  WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
> >
> > @@ -785,7 +828,7 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
> >                               struct node *node)
> >  {
> >       struct property *prop;
> > -     int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
> > +     int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen, offset;
> >       const char *ranges = c->data;
> >
> >       prop = get_property(node, ranges);
> > @@ -821,6 +864,10 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
> >                         "#size-cells == %d)", ranges, prop->val.len,
> >                         p_addr_cells, c_addr_cells, c_size_cells);
> >       }
> > +
> > +     for (offset = 0; offset < prop->val.len; offset += entrylen)
> > +             if (!marker_add(&prop->val.markers, TYPE_UINT32, offset))
> > +                     break;
> >  }
> >  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
> >  WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size_cells);
> > @@ -1400,6 +1447,7 @@ static void check_property_phandle_args(struct check *c,
> >       for (cell = 0; cell < prop->val.len / sizeof(cell_t); cell += cellsize + 1) {
> >               struct node *provider_node;
> >               struct property *cellprop;
> > +             struct marker *m;
> >               int phandle;
> >
> >               phandle = propval_cell_n(prop, cell);
> > @@ -1416,19 +1464,6 @@ static void check_property_phandle_args(struct check *c,
> >                       continue;
> >               }
> >
> > -             /* If we have markers, verify the current cell is a phandle */
> > -             if (prop->val.markers) {
> > -                     struct marker *m = prop->val.markers;
> > -                     for_each_marker_of_type(m, REF_PHANDLE) {
> > -                             if (m->offset == (cell * sizeof(cell_t)))
> > -                                     break;
> > -                     }
> > -                     if (!m)
> > -                             FAIL_PROP(c, dti, node, prop,
> > -                                       "cell %d is not a phandle reference",
> > -                                       cell);
> > -             }
> > -
>
> Why are you removing this part of the check?

Well, it didn't really match up with adding markers. It was checking
if markers were correct, but now we're adding the markers if not
present. Plus the get_node_by_phandle() call after this is a better
check for being a valid phandle. I can make this a separate commit.

Rob
