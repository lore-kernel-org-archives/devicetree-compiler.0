From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] checks: Add markers on known properties
Date: Tue, 8 Jun 2021 07:49:20 -0500
Message-ID: <CAL_JsqKb-4ay9JNLUOetupxBKNpBsFNB-Ztc1ocbDSj_KxSWsg@mail.gmail.com>
References: <20210526010335.860787-1-robh@kernel.org> <20210526010335.860787-5-robh@kernel.org>
 <YL7VETwYAct0B0Mq@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623156573;
        bh=+kTJ5IZtTfF0tvGlT41hoyF0tynxCwJ5Dm7bawDsNkw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eprlJAstU3dIdca5s5ovemdXpJ+VW8PviBKFFhbejTA5qtWEj1Hbgx3RjYE6sXaP6
         fZiZBTtulufOch/0EAuxAkm2P3TMkEH1DWaSXXk4aHrcsdquxQipRmlnwk95Yem7Wc
         43MOSRvnxwuQvlCPVreABxXoZr1j8crICNTtyjHueka4ZTLxfxWruGlqHdMaP7830N
         bcWVuumEj4kPpu/xl+tdAP7J+EmDHX6OVs7xc8M79ZG2hMV+6NXNImKaB8bEbDm0OS
         F/QcNX+cmkJOPGHbNH8RCyQlPqDHwNwedJ997pF+MdCXI3CfdBvIufRoTsq8+KVCoD
         gyTKt+rR2PEtQ==
In-Reply-To: <YL7VETwYAct0B0Mq@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Jun 7, 2021 at 9:25 PM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, May 25, 2021 at 08:03:34PM -0500, Rob Herring wrote:
> > For properties we already have checks for, we know the type and how to
> > parse them. Use this to add type and phandle markers so we have them when
> > the source did not (e.g. dtb format).
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >  checks.c | 74 ++++++++++++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 56 insertions(+), 18 deletions(-)


> > @@ -766,10 +797,15 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
> >       size_cells = node_size_cells(node->parent);
> >       entrylen = (addr_cells + size_cells) * sizeof(cell_t);
> >
> > -     if (!entrylen || (prop->val.len % entrylen) != 0)
> > +     if (!entrylen || (prop->val.len % entrylen) != 0) {
> >               FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
> >                         "(#address-cells == %d, #size-cells == %d)",
> >                         prop->val.len, addr_cells, size_cells);
> > +             return;
> > +     }
> > +
> > +     for (offset = 0; offset < prop->val.len; offset += entrylen)
> > +             marker_add(&prop->val.markers, TYPE_UINT32, offset);
>
> This doesn't seem quite right.  A 'reg' property could definitely be
> u64s rather than u32s (amongst other possibilities, but u64 is the
> most likely).  The user can even indicate that using /bits/ 64, but
> this will overrule that.

Ignoring malformed sizes, it can only be u32 unless the input is .dts
and using /bits/ or []. I'll make marker_add fail if there's any type
marker rather than just a matching marker.


> >  }
> >  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
> >  WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size_cells);
> > @@ -1408,19 +1447,6 @@ static void check_property_phandle_args(struct check *c,
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
> >               provider_node = get_node_by_phandle(root, phandle);
> >               if (!provider_node) {
> >                       FAIL_PROP(c, dti, node, prop,
> > @@ -1447,6 +1473,9 @@ static void check_property_phandle_args(struct check *c,
> >                                 "property size (%d) too small for cell size %d",
> >                                 prop->val.len, cellsize);
> >               }
> > +
> > +             marker_add(&prop->val.markers, REF_PHANDLE, cell * sizeof(cell_t));
>
> This is definitely broken.  It's safe enough to add TYPE_ markers, but
> REF_PHANDLE requires a label or path to be valid, which you don't add,
> and have no way of deducing.  I'm kind of surprised you didn't cause a
> crash in the later code that fixes up references with this.

Didn't see any failures, so maybe the fixup runs first? I'll look at
adding the path or perhaps we can loosen this requirement?

Rob
