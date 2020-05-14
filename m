From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] checks: interrupt-map: Dump entries on error
Date: Wed, 13 May 2020 22:08:13 -0500
Message-ID: <CAL_Jsq+hj8-_cmFbDr9fwZN+XcJK+15S7V99tYfsmW2-Z2HZkw@mail.gmail.com>
References: <20200513163339.29607-1-andre.przywara@arm.com> <20200513163339.29607-3-andre.przywara@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589425705;
        bh=F+cYEHMhOCTXUElBhMJG4xjeY1nWDnXwqJc1LLVh+Tk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Id3GlPK2xXgecKre8poqEIYyoBR9QtjvOvKnVU5ZoFP0cgdSS/Zet4djphFzbB3eR
         Y6rRHbkLKHIFFQUbWq/HneCkkC401LCS8Pm5yv4RpXQHFx7lsRTvZ+Z6jLyGT3zFUj
         xYOhqexJ9YCEoUtRQWL5oXT9kemxv60OHtc3ZkgI=
In-Reply-To: <20200513163339.29607-3-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, May 13, 2020 at 11:35 AM Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
>
> While the interrupt-map property is now validated, the current error
> messages will probably leave people scratching their head on what the
> actual problem is.
>
> To help with the diagnosis, dump the map property formatted in a way
> that corresponds to the actual interpretation from an IRQ consumer's
> point of view. While this can't pinpoint the actual problem, it's much
> easier to see what went wrong, especially when comparing it to the .dts
> source.
>
> As this will generate one line per mapped interrupt, it can be
> potentially long on those larger maps.
> A report would look like this:
> Warning (interrupt_map): /soc/pci@1c00000:interrupt-map: invalid phandle for interrupt-map entry
>         < <0x0 0x0 0x0>, <0x1>, <&gic@17a00000>, <0x0>, <0x87 0x4 0x0> >,
>         < <0x0 0x0 0x2>, <0x1>, <&invalid>, >
>
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  checks.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/checks.c b/checks.c
> index 12518db..5a63c20 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -924,6 +924,80 @@ static void check_pci_device_reg(struct check *c, struct dt_info *dti, struct no
>  }
>  WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format, &pci_bridge);
>
> +static void dump_cell_group(struct property *prop, int index, int cells,
> +                           int nr_cells)
> +{
> +       int limit, i;
> +
> +       if (index + cells > nr_cells)
> +               limit = nr_cells - index;
> +       else
> +               limit = cells;
> +
> +       fputs("<", stderr);
> +       for (i = 0; i < limit; i++) {
> +               cell_t v = propval_cell_n(prop, index + i);
> +               fprintf(stderr, "%s0x%x", i == 0 ? "" : " ", v);
> +       }
> +       if (limit < cells)
> +               fputs(", MISSING", stderr);
> +       fputs(">", stderr);

Printing like this doesn't work well when you have parallel calls to
dtc. You have to print everything to a buffer and then write the
buffer to stderr in one call.

> +}
> +
> +static void dump_interrupt_map(struct node *root, struct node *nexus,
> +                              struct property *map, int irq_cells)
> +{
> +       int cells = map->val.len / 4;
> +       struct property *prop;
> +       int value;
> +       int i;
> +
> +       for (i = 0; i < cells;) {
> +               struct node *intc = NULL;
> +
> +               fprintf(stderr, "%s\t< ", i == 0 ? "" : ",\n");
> +               dump_cell_group(map, i, node_addr_cells(nexus), cells);
> +               fputs(", ", stderr);
> +               dump_cell_group(map, i + node_addr_cells(nexus), irq_cells, cells);
> +               fputs(", <&", stderr);
> +               i += node_addr_cells(nexus) + irq_cells;
> +               if (i >= cells)
> +                       break;
> +               value = propval_cell_n(map, i);
> +               if (value != 0)
> +                       intc = get_node_by_phandle(root, value);
> +               fprintf(stderr, "%s>, ",
> +                       intc && intc->name ? intc->name : "invalid");
> +               if (!intc) {
> +                       fprintf(stderr, ">\n");
> +                       return;
> +               }
> +               /*
> +                * Linux treats non-existing #address-cells in the interrupt
> +                * parent as 0 (and not 2, as the spec says).
> +                * Deal with that, since many DTs rely on that.
> +                */
> +               prop = get_property(intc, "#address-cells");
> +               if (prop)
> +                       value = propval_cell(prop);
> +               else
> +                       value = 0;
> +               dump_cell_group(map, i + 1, value, cells);
> +               fputs(", ", stderr);
> +               i += 1 + value;
> +
> +               prop = get_property(intc, "#interrupt-cells");
> +               if (prop) {
> +                       value = propval_cell(prop);
> +                       dump_cell_group(map, i, value, cells);
> +               } else
> +                       fputs("<?>", stderr);
> +               fputs(" >", stderr);
> +               i += value;
> +       }
> +       fputs("\n", stderr);
> +}
> +
>  static void check_interrupt_map(struct check *c, struct dt_info *dti,
>                                 struct node *node)
>  {
> @@ -956,6 +1030,7 @@ static void check_interrupt_map(struct check *c, struct dt_info *dti,
>                 if (phandle_idx + 1 >= cells) {
>                         FAIL_PROP(c, dti, node, map,
>                                 "insufficient cells for interrupt-map entry");
> +                       dump_interrupt_map(dti->dt, node, map, irq_cells);
>                         return;
>                 }
>                 intc_phandle = propval_cell_n(map, phandle_idx);
> @@ -965,6 +1040,7 @@ static void check_interrupt_map(struct check *c, struct dt_info *dti,
>                 if (!intc) {
>                         FAIL_PROP(c, dti, node, map,
>                                   "invalid phandle for interrupt-map entry");
> +                       dump_interrupt_map(dti->dt, node, map, irq_cells);
>                         return;
>                 }
>
> @@ -972,6 +1048,7 @@ static void check_interrupt_map(struct check *c, struct dt_info *dti,
>                 if (!prop) {
>                         FAIL_PROP(c,dti, node, map,
>                                   "interrupt-map phandle does not point to interrupt controller");
> +                       dump_interrupt_map(dti->dt, node, map, irq_cells);
>                         return;
>                 }
>
> @@ -994,6 +1071,7 @@ static void check_interrupt_map(struct check *c, struct dt_info *dti,
>                 if (!prop) {
>                         FAIL_PROP(c,dti, node, map,
>                                   "interrupt-controller misses #interrupt-cells property");
> +                       dump_interrupt_map(dti->dt, node, map, irq_cells);
>                         return;
>                 }
>                 intc_irq_cells = propval_cell(prop);
> @@ -1001,6 +1079,7 @@ static void check_interrupt_map(struct check *c, struct dt_info *dti,
>                 if (phandle_idx + intc_addr_cells + intc_irq_cells >= cells) {
>                         FAIL_PROP(c, dti, node, map,
>                                 "insufficient cells for interrupt-map entry");
> +                       dump_interrupt_map(dti->dt, node, map, irq_cells);
>                         return;
>                 }
>                 i = phandle_idx + 1 + intc_addr_cells + intc_irq_cells;
> --
> 2.14.1
>
