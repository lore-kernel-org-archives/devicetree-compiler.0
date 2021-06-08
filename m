From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] checks: Add check_is_cell() for all phandle+arg properties
Date: Tue, 8 Jun 2021 09:45:42 -0500
Message-ID: <CAL_JsqL5ks9G1_q+8LN_ceNjE-d40ri8G2BmnxnPCCa+UrqHgw@mail.gmail.com>
References: <20210526010335.860787-1-robh@kernel.org> <20210526010335.860787-3-robh@kernel.org>
 <YL7OmqDaZRrcWbjo@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623163554;
        bh=IzzvlSPQ7fAvllSIsD5uJgifdJXaxqza0aW4VtcKAq0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cEElBfCwGugT11rwp3hS6nUIGePcE4bpAN86/WFA4MTaNNwz+qSO8e33yHcgufE61
         JZae8nITKP409ZeeOiqJlnfbtN0zC1f/K8fi8UrMgS79mB8MpEnkVHSS5XPdYiIXWu
         OHvQBR8AYf2bCzNmkaRzzEDGPFIUWtS51WJ5C3zqX0zDttF04q/eZ6xOjcZ7BNsErK
         S9kVrhnLdGD0s5c64lzfYljdEATjfJILgpd2wkpZRfiN8Kajk0/6WKIii+SIiiA+9B
         b80EyeZhgpGnx2ARp7EeX7a+tNHHNbjfVi6elbc93JTFmGy4LdRiuuJ137fpbr6tRP
         DWHQtvnsl1+mw==
In-Reply-To: <YL7OmqDaZRrcWbjo@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Mon, Jun 7, 2021 at 9:25 PM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, May 25, 2021 at 08:03:32PM -0500, Rob Herring wrote:
> > There's already a check for '#.*-cells' properties, so let's enable it for
> > all the ones we already know about.
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Good idea, applied.
>
> > ---
> >  checks.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/checks.c b/checks.c
> > index eb91c8ea22fa..6a01a2468c42 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -1466,7 +1466,8 @@ static void check_provider_cells_property(struct check *c,
> >  }
> >  #define WARNING_PROPERTY_PHANDLE_CELLS(nm, propname, cells_name, ...) \
> >       static struct provider nm##_provider = { (propname), (cells_name), __VA_ARGS__ }; \
> > -     WARNING(nm##_property, check_provider_cells_property, &nm##_provider, &phandle_references);
> > +     WARNING_IF_NOT_CELL(nm##_is_cell, cells_name); \
> > +     WARNING(nm##_property, check_provider_cells_property, &nm##_provider, &nm##_is_cell, &phandle_references);
> >
> >  WARNING_PROPERTY_PHANDLE_CELLS(clocks, "clocks", "#clock-cells");
> >  WARNING_PROPERTY_PHANDLE_CELLS(cooling_device, "cooling-device", "#cooling-cells");
> > @@ -1843,21 +1844,37 @@ static struct check *check_table[] = {
> >       &chosen_node_is_root, &chosen_node_bootargs, &chosen_node_stdout_path,
> >
> >       &clocks_property,
> > +     &clocks_is_cell,
> >       &cooling_device_property,
> > +     &cooling_device_is_cell,
> >       &dmas_property,
> > +     &dmas_is_cell,
> >       &hwlocks_property,
> > +     &hwlocks_is_cell,
> >       &interrupts_extended_property,
> > +     &interrupts_extended_is_cell,
> >       &io_channels_property,
> > +     &io_channels_is_cell,
> >       &iommus_property,
> > +     &iommus_is_cell,
> >       &mboxes_property,
> > +     &mboxes_is_cell,
> >       &msi_parent_property,
> > +     &msi_parent_is_cell,
> >       &mux_controls_property,
> > +     &mux_controls_is_cell,
> >       &phys_property,
> > +     &phys_is_cell,
> >       &power_domains_property,
> > +     &power_domains_is_cell,
> >       &pwms_property,
> > +     &pwms_is_cell,
> >       &resets_property,
> > +     &resets_is_cell,
> >       &sound_dai_property,
> > +     &sound_dai_is_cell,
> >       &thermal_sensors_property,
> > +     &thermal_sensors_is_cell,
>
> Incidentally, if anyone can see a decent, portable way of avoiding the
> ugly redundancy of listing all the tests in this array, I'd love to
> hear it.

If we have a standard prefix to match on, we could generate the list:

nm -P checks.o | sed -n -e 's/^\(check_[a-zA-Z0-9_]*\).*/\&\1,/p'

(Obviously, 'check_' is not the right prefix currently.)

Most of the work here is in the build system and I don't really care
to implement this twice. :( What happened to the Makefile wrapping
meson?

Rob
