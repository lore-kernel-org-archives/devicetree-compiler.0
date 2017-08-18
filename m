From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] checks: add interrupts property check
Date: Fri, 18 Aug 2017 10:53:56 -0500
Message-ID: <CAL_JsqJuUu-6FpLqQZZyVdCueV18CHRZ4qQUvacSrn2XAfpiSQ@mail.gmail.com>
References: <20170814214807.338-1-robh@kernel.org> <20170814214807.338-2-robh@kernel.org>
 <20170818044303.GR5509@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170818044303.GR5509-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Aug 17, 2017 at 11:43 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Aug 14, 2017 at 04:48:07PM -0500, Rob Herring wrote:
>> Add a check for nodes with interrupts property that they have a valid
>> parent, the parent has #interrupt-cells property, and the size is a
>> valid multiple of #interrupt-cells.
>>
>> This may not handle every possible case and doesn't deal with
>> translation thru interrupt-map properties, but should be enough for
>> modern dts files.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  checks.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>
>> diff --git a/checks.c b/checks.c
>> index c0450e118043..0d452bf8e674 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -1070,6 +1070,63 @@ static void check_gpio_cells_property(struct check *c,
>>  }
>>  WARNING(gpio_cells_property, check_gpio_cells_property, NULL);
>>
>> +static void check_interrupts_property(struct check *c,
>> +                                   struct dt_info *dti,
>> +                                   struct node *node)
>> +{
>> +     struct node *root = dti->dt;
>> +     struct node *irq_node = NULL, *parent = node;
>> +     struct property *irq_prop, *prop = NULL;
>> +     int irq_cells, phandle;
>> +
>> +     irq_prop = get_property(node, "interrupts");
>> +     if (!irq_prop)
>> +             return;
>> +
>> +     while (parent && !prop) {
>> +             if (parent != node) {
>
> So, it's kind of academic, but is it actually disallowed for an
> interrupt-controller node to itself have interrupts which are
> implicityly routed to itself?

I think so, yes. Because otherwise how do you describe a chained
interrupt controller? "interrupts" in the chained controller's node
are the parent's interrupts. I guess you have to rely on the
compatible implying any interrupts connected to itself. It could work
with interrupts-extended though.

[...]

>> @@ -1103,6 +1160,7 @@ static struct check *check_table[] = {
>>
>>       &provider_cells_property,
>>       &gpio_cells_property,
>> +     &interrupts_property,
>>
>>       &always_fail,
>>  };
>
> With both these patches testcases to make sure the checks actually
> trip on a bad example would be good.

Yeah, I wanted to get some initial feedback first.

Rob
