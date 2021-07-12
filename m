From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: Add markers on known properties
Date: Mon, 12 Jul 2021 16:15:43 -0600
Message-ID: <CAL_JsqLYx7Zgd2v_CvTiF0yynB2HX=U+ROV-tkT7qqwxFPnjAQ@mail.gmail.com>
References: <20210608204626.1545418-1-robh@kernel.org> <20210608204626.1545418-2-robh@kernel.org>
 <YM23achEk4QOEAAk@yekko> <CAL_JsqLnbiz-TzH0C0vw57B-1J=N6jBSHeiyv5yKA+Z3+0fWPw@mail.gmail.com>
 <YOuqzf8LtYM4eX39@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626128156;
        bh=ZcOoI583z6PFEoyp5J27aOZ3cnTvNdYbGIImtD8eWF0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WUIgkETreuLCQIkFTZr8WdhFXxuQkkRai3nlwS71Q9chLB5MslAEpdzmqLM8U2S3G
         1Is0KhUZYZSo9x91xJz4HNoolWLem+9ps5D4Iy+pPbPGfu0BKV3oAOLWGHeMhFvT6i
         0xGsP0kv9b3y9ukfiX4GOx72j3snKYiyzqpv5SaN8yHeePt1ITrga6LJbz2Serw38B
         Pao3Af81tpj80lkNBkMwFWV8kCi2sEX5jxC4axprRXpeqvvpdkhqDJkXY6UbZrCzfH
         bcsmvyuB6TwCsIHNMWWVL0/Uc/bmLs6LYswGqBSNUkXJVqMG5gbAXyg3eIfgWB3bKl
         ampM4CLN6kXJg==
In-Reply-To: <YOuqzf8LtYM4eX39@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sun, Jul 11, 2021 at 8:39 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Jun 21, 2021 at 12:22:45PM -0600, Rob Herring wrote:
> > On Sat, Jun 19, 2021 at 3:22 AM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Tue, Jun 08, 2021 at 03:46:24PM -0500, Rob Herring wrote:
> > > > For properties we already have checks for, we know the type and how to
> > > > parse them. Use this to add type and phandle markers so we have them when
> > > > the source did not (e.g. dtb format).
> > > >
> > > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > ---
> > > > v2:
> > > >  - Set marker.ref on phandle markers
> > > >  - Avoid adding markers if there's any conflicting type markers.
> > > > ---
> > > >  checks.c | 102 ++++++++++++++++++++++++++++++++++++++++++++-----------
> > > >  1 file changed, 82 insertions(+), 20 deletions(-)
> > > >
> > > > diff --git a/checks.c b/checks.c
> > > > index e6c7c3eeacac..0f51b9111be1 100644
> > > > --- a/checks.c
> > > > +++ b/checks.c
> > > > @@ -58,6 +58,38 @@ struct check {
> > > >  #define CHECK(nm_, fn_, d_, ...) \
> > > >       CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> > > >
> > > > +static struct marker *marker_add(struct marker **list, enum markertype type,
> > > > +                              unsigned int offset)
> > >
> > > Now that this is only conditionally adding markers, it needs a
> > > different name.  Maybe "add_type_annotation".
> >
> > marker_add_type_annotation to be consistent that marker_* functions
> > work on markers?
>
> Sure, that's fine too.  It's a local function, so naming consistency
> isn't as important as for globals.
>
> > > > +{
> > > > +     struct marker *m = *list;
> > >
> > > Since this is strictly about type annotations (and you don't have
> > > parameters for the necessary ref parameter for other things), an
> > > assert() that the given type is a TYPE_* wouldn't go astray.
> > >
> > > > +
> > > > +     /* Check if we already have a different type or a type marker at the offset*/
> > > > +     for_each_marker_of_type(m, type) {
> > > > +             if ((m->type >= TYPE_UINT8) && (m->type != type))
> > >
> > > I'm assuming the >= TYPE_UINT8 is about checking that this is a type
> > > marker rather than a ref marker.  Adding a helper function for that
> > > would probably be a good idea.  Putting it inline in dtc.h would make
> > > it less likely that we break it if we ever add new marker types in
> > > future.
> >
> > It's checking that we don't have markers of a different type within
> > the property. While that is valid dts format, it's never the case for
> > any known (by checks.c) properties.
>
> That comment doesn't seem to quite match the thing above.

The comment applies to both 'if' conditions. I can make it 2 comments.

> Besides, I don't think that's really true.  It would be entirely
> sensible for 'reg' to have mixed u32 & u64 type to encode PCI
> addresses.  Likewise it would make sense for 'ranges' to have mixed
> u32 & u64 type if mapping between a 32-bit and 64-bit bus.

Yes, we could have all sorts of encoding. We could mix strings, u8,
u16, u32, and u64 too, but we don't because that would be insane given
next to zero type information is maintained.

But this isn't really about what encoding we could have for 'reg' as
if we have any type information already, then we do nothing. This is
only what is the encoding when there is no other information to go on
besides the property name. IMO, that should be bracketing each entry
which is all we're doing here. Maybe you disagree on bracketing, but
as a user shouldn't I be able to get the output I want? Debating it is
like debating tabs vs. spaces (BTW, dtc already decided I get tabs).
So maybe all this would be better in a linter, but we don't have one
and if I wrote one it would start with forking dtc. We could make this
all a command line option I suppose.

> > It could be an assert() as it's
> > one of those 'should never happen'.
>
> An assert() should only be used if the problem must have been caused
> by an error in the code.  Bad user input should never trigger an
> assert().

Maybe I misunderstood what you suggested an assert() for.


> > > > @@ -774,10 +811,16 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
> > > >       size_cells = node_size_cells(node->parent);
> > > >       entrylen = (addr_cells + size_cells) * sizeof(cell_t);
> > > >
> > > > -     if (!is_multiple_of(prop->val.len, entrylen))
> > > > +     if (!is_multiple_of(prop->val.len, entrylen)) {
> > > >               FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
> > > >                         "(#address-cells == %d, #size-cells == %d)",
> > > >                         prop->val.len, addr_cells, size_cells);
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     for (offset = 0; offset < prop->val.len; offset += entrylen)
> > > > +             if (!marker_add(&prop->val.markers, TYPE_UINT32, offset))
> > > > +                     break;
> > >
> > > I don't see any point to adding multiple markers.  Each type marker
> > > indicates the type until the next marker, so just adding one has the
> > > same effect.
> >
> > Multiple markers is the whole point. This is to match the existing
> > behavior when we have:
> >
> > reg = <baseA sizeA>, <baseB sizeB>;
>
> Urgh, because you're using the type markers for that broken YAML
> conversion.  Fine, ok.

Uhh well, type markers were added in the first place to support YAML,
but they are used on the dts output as well which has changed it a lot
from what was output before. The YAML and dts code is just about the
same in terms of how the type information is used. If anything is
broken, it's the dts output guessing. Multiples of 4 bytes are always
UINT32 data?

Rob
