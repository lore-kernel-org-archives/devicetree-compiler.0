From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] checks: add phandle with arg property checks
Date: Fri, 18 Aug 2017 11:02:01 -0500
Message-ID: <CAL_Jsq+yA2W=SD9zSkWxw-R16uNELeqPqJK3fVMvi0_jhEbooQ@mail.gmail.com>
References: <20170814214807.338-1-robh@kernel.org> <20170818043502.GQ5509@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170818043502.GQ5509-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Aug 17, 2017 at 11:35 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Aug 14, 2017 at 04:48:06PM -0500, Rob Herring wrote:
>
> Yay! Someone actually implementing checks.

Not like it is my first. I'll celebrate when someone else does.


>> Many common bindings follow the same pattern of client properties
>> containing a phandle and N arg cells where N is defined in the provider
>> with a '#<specifier>-cells' property. Add a checks for properties
>> following this pattern.
>
> I think this description would be easier to follow if you led with an example.
>
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Looks pretty good, though I have some suggestions.
>
>> ---
>>  checks.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 117 insertions(+)
>>
>> diff --git a/checks.c b/checks.c
>> index afabf64337d5..c0450e118043 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -956,6 +956,120 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
>>  WARNING(obsolete_chosen_interrupt_controller,
>>       check_obsolete_chosen_interrupt_controller, NULL);
>>
>> +struct provider {
>> +     const char *prop_name;
>> +     const char *cell_name;
>> +     bool optional;
>> +};
>> +
>> +static void check_property_phandle_args(struct check *c,
>> +                                       struct dt_info *dti,
>> +                                       struct node *node,
>> +                                       struct property *prop,
>> +                                       const struct provider *provider)
>> +{
>> +     struct marker *m = prop->val.markers;
>> +
>> +     if (!m) {
>> +             FAIL(c, dti, "Missing phandles in %s:%s",
>> +                  node->fullpath, prop->name);
>> +             return;
>> +     }
>> +     for_each_marker_of_type(m, REF_PHANDLE) {
>
> So going through the markers I think is not the best approach.
> That'll work if the source contains a reference here, which it usually
> will, but there are some circumstances where it could contain a "raw"
> phandle value (the most obvious being when you're decompiling an
> existing dtb).
>
> But I don't think you really need to.  Instead you should be able to
> read the actual value, look it up with get_node_by_phandle().  You can
> make this check dependent on fixup_phandle_references to make sure
> it's executed after the references are resolved.

That's how I implemented it initially...

> That should also let you more strictly verify the property in the
> client node, including checking for misaligned entries of extraneous bits.
>
>> +             int cellsize;
>> +             struct node *root = dti->dt;
>> +             struct node *provider_node;
>> +             struct property *cellprop;
>> +
>> +             provider_node = get_node_by_ref(root, m->ref);
>> +             if (!provider_node) {
>> +                     FAIL(c, dti, "Could not get provider for %s:%s",
>> +                          node->fullpath, prop->name);
>> +                     break;
>> +             }
>
> AFAIK the "provider" terminology isn't standardized somewhere.  It's a
> reasonable term internally, but if can rephrase to it in the displayed
> messages that would be a bonus.

The kernel uses that at least. I guess maybe "phandle node" will work.

>> +             cellprop = get_property(provider_node, provider->cell_name);
>> +             if (cellprop) {
>> +                     cellsize = propval_cell(cellprop);
>> +             } else if (provider->optional) {
>> +                     cellsize = 0;
>> +             } else {
>> +                     FAIL(c, dti, "Missing %s in provider %s for %s",
>> +                          provider->cell_name,
>> +                          provider_node->fullpath,
>> +                          node->fullpath);
>> +                     break;
>> +             }
>> +
>> +             if (prop->val.len < ((cellsize + 1) * sizeof(cell_t))) {
>> +                     FAIL(c, dti, "%s property size (%d) too small for cell size %d in %s",
>> +                          prop->name, prop->val.len, cellsize, node->fullpath);
>> +             }
>> +     }
>> +}
>> +
>> +static const struct provider providers[] = {
>> +     { "clocks", "#clock-cells" },
>> +     { "phys", "#phy-cells" },
>> +     { "interrupts-extended", "#interrupt-cells" },
>> +     { "mboxes", "#mbox-cells" },
>> +     { "pwms", "#pwm-cells" },
>> +     { "dmas", "#dma-cells" },
>> +     { "resets", "#reset-cells" },
>> +     { "hwlocks", "#hwlock-cells" },
>> +     { "power-domains", "#power-domain-cells" },
>> +     { "io-channels", "#io-channel-cells" },
>> +     { "iommus", "#iommu-cells" },
>> +     { "mux-controls", "#mux-control-cells" },
>> +     { "cooling-device", "#cooling-cells" },
>> +     { "thermal-sensors", "#thermal-sensor-cells" },
>> +     { "sound-dais", "#sound-dai-cells" },
>> +     { "msi-parent", "#msi-cells", true },
>> +     { NULL },
>> +};
>
> How hard would it be to use macros to make each of these providers
> different check structures.  I think the output would be a bit more
> useful if errors in different types of these things was reported as a
> different check failure rather than one big generic one.

Should be doable.

> It does mean listing everything in the check_table which is a pain.  I
> would really like to change things so that a single macro can both
> declare the check and add it to the master list, but I haven't thought
> of a portable way to do that so far.

This is done in the kernel frequently using linker sections. Each
check entry would get put into a specific section, then you just
iterate through the entries. Would that work? I could imagine that
linker magic may not be all the portable.

> If you do need the providers array, ARRAY_SIZE() is preferred over a
> terminator NULL.

Okay.

>> +static void check_provider_cells_property(struct check *c,
>> +                                       struct dt_info *dti,
>> +                                       struct node *node)
>> +{
>> +     int i;
>> +
>> +     for (i = 0; providers[i].prop_name; i++) {
>> +             struct property *prop = get_property(node, providers[i].prop_name);
>> +             if (!prop)
>> +                     continue;
>> +             check_property_phandle_args(c, dti, node, prop, &providers[i]);
>> +     }
>> +}
>> +WARNING(provider_cells_property, check_provider_cells_property, NULL);
>> +
>> +static void check_gpio_cells_property(struct check *c,
>> +                                       struct dt_info *dti,
>> +                                       struct node *node)
>> +{
>> +     struct property *prop;
>> +
>> +     for_each_property(node, prop) {
>> +             char *str;
>> +             struct provider provider;
>> +
>> +             /* Skip over false matches */
>> +             if (strstr(prop->name, "nr-gpio"))
>> +                     continue;
>> +
>> +             str = strrchr(prop->name, '-');
>> +             if (!str || !(streq(str, "-gpio") || streq(str, "-gpios")))
>> +                     continue;
>> +
>> +             provider.prop_name = prop->name;
>> +             provider.cell_name = "#gpio-cells";
>> +             provider.optional = false;
>> +             check_property_phandle_args(c, dti, node, prop, &provider);
>> +     }
>> +
>> +}
>> +WARNING(gpio_cells_property, check_gpio_cells_property, NULL);
>
> Since the gpio stuff is a bit tweaker, it would be good to go into a
> separate patch.  Then the commit message can explain what the logic
> here is for (I'm having a little trouble following it).

Okay.

Rob
