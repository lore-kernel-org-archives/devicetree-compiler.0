From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] checks: add phandle with arg property checks
Date: Tue, 22 Aug 2017 09:38:59 -0500
Message-ID: <CAL_JsqKynMDP2LBjPj2KSgJiVfmNM4e1=uHYUO6GcUjXt7oJbQ@mail.gmail.com>
References: <20170814214807.338-1-robh@kernel.org> <20170818043502.GQ5509@umbus.fritz.box>
 <CAL_Jsq+yA2W=SD9zSkWxw-R16uNELeqPqJK3fVMvi0_jhEbooQ@mail.gmail.com> <20170819073333.GA12356@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170819073333.GA12356-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sat, Aug 19, 2017 at 2:33 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Aug 18, 2017 at 11:02:01AM -0500, Rob Herring wrote:
>> On Thu, Aug 17, 2017 at 11:35 PM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Mon, Aug 14, 2017 at 04:48:06PM -0500, Rob Herring wrote:
>> >
>> > Yay! Someone actually implementing checks.
>>
>> Not like it is my first. I'll celebrate when someone else does.
>>
>>
>> >> Many common bindings follow the same pattern of client properties
>> >> containing a phandle and N arg cells where N is defined in the provider
>> >> with a '#<specifier>-cells' property. Add a checks for properties
>> >> following this pattern.
>> >
>> > I think this description would be easier to follow if you led with an example.
>> >
>> >>
>> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >
>> > Looks pretty good, though I have some suggestions.
>> >
>> >> ---
>> >>  checks.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> >>  1 file changed, 117 insertions(+)
>> >>
>> >> diff --git a/checks.c b/checks.c
>> >> index afabf64337d5..c0450e118043 100644
>> >> --- a/checks.c
>> >> +++ b/checks.c
>> >> @@ -956,6 +956,120 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
>> >>  WARNING(obsolete_chosen_interrupt_controller,
>> >>       check_obsolete_chosen_interrupt_controller, NULL);
>> >>
>> >> +struct provider {
>> >> +     const char *prop_name;
>> >> +     const char *cell_name;
>> >> +     bool optional;
>> >> +};
>> >> +
>> >> +static void check_property_phandle_args(struct check *c,
>> >> +                                       struct dt_info *dti,
>> >> +                                       struct node *node,
>> >> +                                       struct property *prop,
>> >> +                                       const struct provider *provider)
>> >> +{
>> >> +     struct marker *m = prop->val.markers;
>> >> +
>> >> +     if (!m) {
>> >> +             FAIL(c, dti, "Missing phandles in %s:%s",
>> >> +                  node->fullpath, prop->name);
>> >> +             return;
>> >> +     }
>> >> +     for_each_marker_of_type(m, REF_PHANDLE) {
>> >
>> > So going through the markers I think is not the best approach.
>> > That'll work if the source contains a reference here, which it usually
>> > will, but there are some circumstances where it could contain a "raw"
>> > phandle value (the most obvious being when you're decompiling an
>> > existing dtb).
>> >
>> > But I don't think you really need to.  Instead you should be able to
>> > read the actual value, look it up with get_node_by_phandle().  You can
>> > make this check dependent on fixup_phandle_references to make sure
>> > it's executed after the references are resolved.
>>
>> That's how I implemented it initially...
>
> Ok.. why did you change?

Just because the code is a bit more compact using markers. But
decompiling a dtb is a good reason I didn't think of.

Rob
