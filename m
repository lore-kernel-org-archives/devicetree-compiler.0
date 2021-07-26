From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: Add markers on known properties
Date: Mon, 26 Jul 2021 12:32:20 -0600
Message-ID: <CAL_JsqKxw7A0GZgP4N4jzS8SuoWSme_DEy901mvnitC-ozjCRw@mail.gmail.com>
References: <20210608204626.1545418-1-robh@kernel.org> <20210608204626.1545418-2-robh@kernel.org>
 <YM23achEk4QOEAAk@yekko> <CAL_JsqLnbiz-TzH0C0vw57B-1J=N6jBSHeiyv5yKA+Z3+0fWPw@mail.gmail.com>
 <YOuqzf8LtYM4eX39@yekko> <CAL_JsqLYx7Zgd2v_CvTiF0yynB2HX=U+ROV-tkT7qqwxFPnjAQ@mail.gmail.com>
 <YP49qUsDIvFklb6r@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627324354;
        bh=seu2jKtsQvzNMeGykGBs6UOHWfC/RKockN7xWc4sRWc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cK/SW1PF01TINFHUHq8EhqH00WrWafq5eRgcnBY2CfLhpQkJXVCM4AzwRY09HtZ7V
         6vqaztg0TD8cROH03PgmaFYQwe1g/te3Fs2zpY7kLzR4WMJVAk/cmz+NVT9MlI47Tg
         6bsrvC9V4TE/4A74TR2lJncf4uPdHNxzhLSeXTlamR8uxwX0hOdm5SlHRyk7FLwc9p
         EWfC3VwJmn5C+PQRN2MffCz/353EToHtlzIfB59zlBijPZYil/b0gX4CP6IhmN2Xog
         Gd4RbLUv/RNrwN+N1ms0J6JfljizpS6XTmNSFaWw5fssNEa1BsrUDE7b+T2eFw8QO2
         qV76S5SGKOsHg==
In-Reply-To: <YP49qUsDIvFklb6r@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sun, Jul 25, 2021 at 10:44 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Jul 12, 2021 at 04:15:43PM -0600, Rob Herring wrote:
> > On Sun, Jul 11, 2021 at 8:39 PM David Gibson
> > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > >
> > > On Mon, Jun 21, 2021 at 12:22:45PM -0600, Rob Herring wrote:
> > > > On Sat, Jun 19, 2021 at 3:22 AM David Gibson
> > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > >
> > > > > On Tue, Jun 08, 2021 at 03:46:24PM -0500, Rob Herring wrote:
> > > > > > For properties we already have checks for, we know the type and how to
> > > > > > parse them. Use this to add type and phandle markers so we have them when
> > > > > > the source did not (e.g. dtb format).
> > > > > >
> > > > > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > > > ---
> > > > > > v2:
> > > > > >  - Set marker.ref on phandle markers
> > > > > >  - Avoid adding markers if there's any conflicting type markers.
> > > > > > ---
> > > > > >  checks.c | 102 ++++++++++++++++++++++++++++++++++++++++++++-----------
> > > > > >  1 file changed, 82 insertions(+), 20 deletions(-)
> > > > > >
> > > > > > diff --git a/checks.c b/checks.c
> > > > > > index e6c7c3eeacac..0f51b9111be1 100644
> > > > > > --- a/checks.c
> > > > > > +++ b/checks.c
> > > > > > @@ -58,6 +58,38 @@ struct check {
> > > > > >  #define CHECK(nm_, fn_, d_, ...) \
> > > > > >       CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> > > > > >
> > > > > > +static struct marker *marker_add(struct marker **list, enum markertype type,
> > > > > > +                              unsigned int offset)
> > > > >
> > > > > Now that this is only conditionally adding markers, it needs a
> > > > > different name.  Maybe "add_type_annotation".
> > > >
> > > > marker_add_type_annotation to be consistent that marker_* functions
> > > > work on markers?
> > >
> > > Sure, that's fine too.  It's a local function, so naming consistency
> > > isn't as important as for globals.
> > >
> > > > > > +{
> > > > > > +     struct marker *m = *list;
> > > > >
> > > > > Since this is strictly about type annotations (and you don't have
> > > > > parameters for the necessary ref parameter for other things), an
> > > > > assert() that the given type is a TYPE_* wouldn't go astray.
> > > > >
> > > > > > +
> > > > > > +     /* Check if we already have a different type or a type marker at the offset*/
> > > > > > +     for_each_marker_of_type(m, type) {
> > > > > > +             if ((m->type >= TYPE_UINT8) && (m->type != type))
> > > > >
> > > > > I'm assuming the >= TYPE_UINT8 is about checking that this is a type
> > > > > marker rather than a ref marker.  Adding a helper function for that
> > > > > would probably be a good idea.  Putting it inline in dtc.h would make
> > > > > it less likely that we break it if we ever add new marker types in
> > > > > future.
> > > >
> > > > It's checking that we don't have markers of a different type within
> > > > the property. While that is valid dts format, it's never the case for
> > > > any known (by checks.c) properties.
> > >
> > > That comment doesn't seem to quite match the thing above.
> >
> > The comment applies to both 'if' conditions. I can make it 2 comments.
>
> Sorry, I wasn't clear.  I didn't mean the code comment I meant your
> remark in the thread "It's checking that...".  It didn't seem apropos
> to my comment it's in reply to.
>
> > > Besides, I don't think that's really true.  It would be entirely
> > > sensible for 'reg' to have mixed u32 & u64 type to encode PCI
> > > addresses.  Likewise it would make sense for 'ranges' to have mixed
> > > u32 & u64 type if mapping between a 32-bit and 64-bit bus.
> >
> > Yes, we could have all sorts of encoding. We could mix strings, u8,
> > u16, u32, and u64 too, but we don't because that would be insane given
> > next to zero type information is maintained.
>
> Who's "we"?  My point is that you're interacting with user supplied
> type information, and we can't control what the user supplies.

"We" is the modern users of FDT following the DT spec and where
bindings are reviewed. At least within that (sizable) set of users, we
do control what the user supplies (with schema checks). I get that DTC
needs to not care about the input beyond what's legal for the language
like any compiler. However, that line has already been blurred in dtc.
Pretty much all of checks.c goes beyond just what's allowed for the
language. For example, who's to say 'interrupts' can't be a string for
some user?

> > But this isn't really about what encoding we could have for 'reg' as
> > if we have any type information already, then we do nothing.
>
> But.. that's *not* what this logic does.  It's quite explicitly more
> complicated than "if there's any other type information, then do
> nothing".

Yes and no. It depends on the caller of marker_add() when we only have
a type marker at the beginning. In the cases of reg, ranges, #*-cells
and interrupts, it will do nothing. For phandle+arg properties, it
will still bracket each entry if there's only a TYPE marker at offset
0. We should be consistent there at least.

I went with let's get consistent output regardless of the input which
seemed like a good thing to me. If you don't think that's an
improvement, I can drop that though as dts -> dtb -> dts/yaml can
accomplish the same thing.

> > This is
> > only what is the encoding when there is no other information to go on
> > besides the property name. IMO, that should be bracketing each entry
> > which is all we're doing here. Maybe you disagree on bracketing, but
> > as a user shouldn't I be able to get the output I want?
>
> Yes... that's my point...

That you disagree on bracketing or that I should be able to get the
output I want?

I know you don't like any requirements on input formatting, but surely
you have some opinion on preferred formatting.

> > Debating it is
> > like debating tabs vs. spaces (BTW, dtc already decided I get tabs).
> > So maybe all this would be better in a linter, but we don't have one
> > and if I wrote one it would start with forking dtc. We could make this
> > all a command line option I suppose.
> >
> > > > It could be an assert() as it's
> > > > one of those 'should never happen'.
> > >
> > > An assert() should only be used if the problem must have been caused
> > > by an error in the code.  Bad user input should never trigger an
> > > assert().
> >
> > Maybe I misunderstood what you suggested an assert() for.
>
> I didn't, you were the one suggesting an assert().

I mixed up the context where you did suggest one...

> > > > > > @@ -774,10 +811,16 @@ static void check_reg_format(struct check *c, struct dt_info *dti,
> > > > > >       size_cells = node_size_cells(node->parent);
> > > > > >       entrylen = (addr_cells + size_cells) * sizeof(cell_t);
> > > > > >
> > > > > > -     if (!is_multiple_of(prop->val.len, entrylen))
> > > > > > +     if (!is_multiple_of(prop->val.len, entrylen)) {
> > > > > >               FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
> > > > > >                         "(#address-cells == %d, #size-cells == %d)",
> > > > > >                         prop->val.len, addr_cells, size_cells);
> > > > > > +             return;
> > > > > > +     }
> > > > > > +
> > > > > > +     for (offset = 0; offset < prop->val.len; offset += entrylen)
> > > > > > +             if (!marker_add(&prop->val.markers, TYPE_UINT32, offset))
> > > > > > +                     break;
> > > > >
> > > > > I don't see any point to adding multiple markers.  Each type marker
> > > > > indicates the type until the next marker, so just adding one has the
> > > > > same effect.
> > > >
> > > > Multiple markers is the whole point. This is to match the existing
> > > > behavior when we have:
> > > >
> > > > reg = <baseA sizeA>, <baseB sizeB>;
> > >
> > > Urgh, because you're using the type markers for that broken YAML
> > > conversion.  Fine, ok.
> >
> > Uhh well, type markers were added in the first place to support YAML,
>
> No, they weren't.  They were added first so that dts -I dts -O dts
> would preserve input formatting more closely.

I think I remember why Grant wrote this and I upstreamed it. All of
this only happened because of schema validation work. Like many
things, the easy part went in first...

>  Shortly afterwards they
> were used for the YAML stuff.  They're taking what was originally just
> a user choice of input formatting and giving it semantic importance,
> which I have always thought was a super fragile approach.  But, I've
> merged it anyway, since people seem to really want it and I haven't
> had time to work on something else myself.

Yes, you've made that perfectly clear. This series is about being less
dependent on user's input formatting by being more consistent on the
output formatting.

The issue here boils down to the #*-cells pattern being a PIA to deal
with. It's a pretty peculiar construct that anything utilizing DT has
to know how to handle. I'm just trying to not implement it yet again
in the schema tools. If we redesigned everything, we'd most certainly
embed type and size information directly in properties. I'm not
holding my breath on any of that happening (there are discussions
happening though), so we're pretty much stuck with what we have other
than making the bracketing significant.

> > but they are used on the dts output as well which has changed it a lot
> > from what was output before. The YAML and dts code is just about the
> > same in terms of how the type information is used. If anything is
> > broken, it's the dts output guessing. Multiples of 4 bytes are always
> > UINT32 data?
>
> dts output was never supposed to be reliably type accurate - just like
> any decompiler.  It was just trying to take a simple guess for
> convenience in debugging.  It *does* guarantee that the -O dts output
> will produce byte for byte identical dtb output if you feed it back
> into dtc.

Why guess when we already have code that knows the type of properties
and we can accurately output the correct type?

No one is going to complain about better debug output.

Rob
