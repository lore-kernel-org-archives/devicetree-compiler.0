From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/5] checks: Add markers on known properties
Date: Mon, 11 Oct 2021 08:57:09 -0500
Message-ID: <CAL_JsqJgLAYyaW2tmNsHWtOcSgd=mKHbSL6CZM=Z4ftC-Vg1pQ@mail.gmail.com>
References: <20210727183023.3212077-1-robh@kernel.org> <20210727183023.3212077-4-robh@kernel.org>
 <YWPHDJBS51Ne2fMT@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633960642;
        bh=ceW6bRUWwYwMnAdJn3tx1mpK+JDL84l6x21p7XSS/eU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r6QKPR/CBFpzvtP7DHs+veBaZUmH93X+FW6zgdd8kIWnbqMFh1Mj/Uf4swUiEXmZF
         FplT9nizt0n6I39j4rOkCOzssGidaDqddOEu3gEVL7+eYZK5Tcdw16TMM05tG60GjY
         4mPwRAiCJeRhvLeIUdmGCO+1hZZrjj88JkJL871U5Qj0k+nvL755th1nH1zbpEPBCS
         SEKfE1Trkd93lL3P2IyeTwzfXltM7L2z1Quivzl4HTa2jBYX/cR9ZYCzQhyN1BwRpr
         Xzn8td73M89Wh6VEP2VYe4G9lMixsOrY54fYdOWXK3xPqAa9MB4lGYb8sdt1eehME4
         ypVau7gT26YkQ==
In-Reply-To: <YWPHDJBS51Ne2fMT@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Oct 11, 2021 at 2:19 AM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Jul 27, 2021 at 12:30:21PM -0600, Rob Herring wrote:
> > For properties we already have checks for, we know the type and how to
> > parse them. Use this to add type and phandle markers so we have them when
> > the source did not (e.g. dtb format).
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> > v3:
> >  - Rework marker_add() and callers into 3 functions. marker_add() just
> >    adds a marker. marker_add_type_annotations() adds type annotations
> >    at each entry offset. marker_add_phandle_annotation() adds a phandle
> >    and type annotation at a phandle offset.
> >  - Only add type info when no type markers are present at all.
> >  - Keep phandle ref check on phandle+args properties.
> > v2:
> >  - Set marker.ref on phandle markers
> >  - Avoid adding markers if there's any conflicting type markers.
> > ---
> >  checks.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 82 insertions(+), 5 deletions(-)
> >
> > diff --git a/checks.c b/checks.c
> > index e2690e90f90c..b7ac1732b0b8 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -58,6 +58,56 @@ struct check {
> >  #define CHECK(nm_, fn_, d_, ...) \
> >       CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> >
> > +static struct marker *marker_add(struct marker **list, enum markertype type,
> > +                              unsigned int offset, char * ref)
> > +{
> > +     struct marker *m = *list;
> > +
> > +     m = xmalloc(sizeof(*m));
> > +     m->type = type;
> > +     m->offset = offset;
> > +     m->next = NULL;
> > +     m->ref = ref;
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
> > +static void marker_add_type_annotations(struct property *prop,
> > +                                     enum markertype type,
> > +                                     unsigned int entrylen)
> > +{
> > +     unsigned int offset;
> > +
> > +     assert(is_type_marker(type));
> > +
> > +     if (has_type_markers(prop->val.markers))
> > +             return;
> > +
> > +     for (offset = 0; offset < prop->val.len; offset += entrylen)
> > +             marker_add(&prop->val.markers, type, offset, NULL);
> > +}
> > +
> > +static void marker_add_phandle_annotation(struct property *prop,
> > +                                       unsigned int cell,
> > +                                       char *ref)
> > +{
> > +     if (!cell && has_type_markers(prop->val.markers))
> > +             return;
>
> So, you allow adding a phandle annotation if the property has no
> existing type markers *or* you're adding it after position 0.  That
> seems a bit arbitrary and fragile.

[...]

> > @@ -1776,8 +1849,12 @@ static struct node *get_remote_endpoint(struct check *c, struct dt_info *dti,
> >               return NULL;
> >
> >       node = get_node_by_phandle(dti->dt, phandle);
> > -     if (!node)
> > +     if (!node) {
> >               FAIL_PROP(c, dti, endpoint, prop, "graph phandle is not valid");
> > +             return NULL;
> > +     }
> > +
> > +     marker_add_phandle_annotation(prop, 0, node->fullpath);
>
> Shouldn't this be the same as check_property_phandle_args() and verify
> the type annotation if there's one already, only adding it if there
> are no pre-existing types.

That's why marker_add_phandle_annotation() has the above check, but
yeah, I guess for consistency, checking for existing type markers
needs to always be outside marker_add_phandle_annotation() calls.

Rob
