From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] checks: Add markers on known properties
Date: Tue, 15 Jun 2021 08:25:36 -0600
Message-ID: <CAL_Jsq+CCzbSa62EOCpNcoEfbkmGrDgbMBcoSUKTdPYZY=rfZw@mail.gmail.com>
References: <20210526010335.860787-1-robh@kernel.org> <20210526010335.860787-5-robh@kernel.org>
 <YL7VETwYAct0B0Mq@yekko> <CAL_JsqKb-4ay9JNLUOetupxBKNpBsFNB-Ztc1ocbDSj_KxSWsg@mail.gmail.com>
 <YMhCLoMk5mBwqZkN@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623767150;
        bh=r1H89/Vt0Gwwvxu1tLFZhauA+swwRzCBqXNWylwkWQc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iPezUsHrl0MEQiYp6l1ZEjDE1gQ++8tIEGtetlgcejVslFmaBJKXnTSX+M3dv8M8j
         xu/x1wMUOF3V+niLHk8DmMUvkMbyjYv6rnP7taEMtkZGB9nkTxZtbB8YGV6naEBtVi
         onjbDjxvLDH4cxtEheHiaSVIXxCxq0pmht0Vy5bNrt6Xu2wyM7EbDSKwVw2jV4h1bR
         DZjIWwYpaBORoJZ8QlKvuTaLcSVfbuhBXxWp6S0zkOnkf8CVffPv2CXpgvdXphnU4T
         UHM0H7xCFQr4SfriwDv+uxKQqzsWmBdPhNEFWfzhhCi9QBm44H1G2Nk3G9BRFbQWEQ
         5dzzGBl4keWAg==
In-Reply-To: <YMhCLoMk5mBwqZkN@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Jun 15, 2021 at 12:26 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Jun 08, 2021 at 07:49:20AM -0500, Rob Herring wrote:
> > On Mon, Jun 7, 2021 at 9:25 PM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Tue, May 25, 2021 at 08:03:34PM -0500, Rob Herring wrote:
> > > > For properties we already have checks for, we know the type and how to
> > > > parse them. Use this to add type and phandle markers so we have them when
> > > > the source did not (e.g. dtb format).
> > > >
> > > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > ---
> > > >  checks.c | 74 ++++++++++++++++++++++++++++++++++++++++++--------------
> > > >  1 file changed, 56 insertions(+), 18 deletions(-)
> >
> >
> > > > @@ -766,10 +797,15 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
> > > >       size_cells = node_size_cells(node->parent);
> > > >       entrylen = (addr_cells + size_cells) * sizeof(cell_t);
> > > >
> > > > -     if (!entrylen || (prop->val.len % entrylen) != 0)
> > > > +     if (!entrylen || (prop->val.len % entrylen) != 0) {
> > > >               FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
> > > >                         "(#address-cells == %d, #size-cells == %d)",
> > > >                         prop->val.len, addr_cells, size_cells);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     for (offset = 0; offset < prop->val.len; offset += entrylen)
> > > > +             marker_add(&prop->val.markers, TYPE_UINT32, offset);
> > >
> > > This doesn't seem quite right.  A 'reg' property could definitely be
> > > u64s rather than u32s (amongst other possibilities, but u64 is the
> > > most likely).  The user can even indicate that using /bits/ 64, but
> > > this will overrule that.
> >
> > Ignoring malformed sizes, it can only be u32 unless the input is .dts
> > and using /bits/ or [].
>
> Yes.. and using /bits/ is exactly the case I'm talking about.
>
> > I'll make marker_add fail if there's any type
> > marker rather than just a matching marker.
> >
> >
> > > >  }
> > > >  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
> > > >  WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size_cells);
> > > > @@ -1408,19 +1447,6 @@ static void check_property_phandle_args(struct check *c,
> > > >                       continue;
> > > >               }
> > > >
> > > > -             /* If we have markers, verify the current cell is a phandle */
> > > > -             if (prop->val.markers) {
> > > > -                     struct marker *m = prop->val.markers;
> > > > -                     for_each_marker_of_type(m, REF_PHANDLE) {
> > > > -                             if (m->offset == (cell * sizeof(cell_t)))
> > > > -                                     break;
> > > > -                     }
> > > > -                     if (!m)
> > > > -                             FAIL_PROP(c, dti, node, prop,
> > > > -                                       "cell %d is not a phandle reference",
> > > > -                                       cell);
> > > > -             }
> > > > -
> > > >               provider_node = get_node_by_phandle(root, phandle);
> > > >               if (!provider_node) {
> > > >                       FAIL_PROP(c, dti, node, prop,
> > > > @@ -1447,6 +1473,9 @@ static void check_property_phandle_args(struct check *c,
> > > >                                 "property size (%d) too small for cell size %d",
> > > >                                 prop->val.len, cellsize);
> > > >               }
> > > > +
> > > > +             marker_add(&prop->val.markers, REF_PHANDLE, cell * sizeof(cell_t));
> > >
> > > This is definitely broken.  It's safe enough to add TYPE_ markers, but
> > > REF_PHANDLE requires a label or path to be valid, which you don't add,
> > > and have no way of deducing.  I'm kind of surprised you didn't cause a
> > > crash in the later code that fixes up references with this.
> >
> > Didn't see any failures, so maybe the fixup runs first? I'll look at
> > adding the path or perhaps we can loosen this requirement?
>
> Neither of those seems like the right approach.  REF_PHANDLE *means* a
> place to replace a phandle,

What does it mean after we've replaced a phandle? We should be
removing the marker when that is done if it only means that. But
adding more lifetime to markers seems fragile as currently they are
add only.

> we're just re-using that to indicate that
> we have a phandle here.  If you want to know it's a phandle without
> also having a reference to fill in there, then we should add a
> TYPE_PHANDLE marker.

Well, look at v2 as I went the adding the reference route. That also
allows the dts output to have references.

I don't think TYPE_PHANDLE is right as we already have a type with
TYPE_UINT32. The phandle is an extra annotation. So we'd have to treat
it special from TYPE_UINT* such that has_data_type_information() is
false for TYPE_PHANDLE. Doable, but that blurs the current
distinction.

Rob
