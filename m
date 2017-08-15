From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] checks: add interrupts property check
Date: Tue, 15 Aug 2017 08:21:23 -0500
Message-ID: <CAL_JsqKRUpxFp7EBAMzZ4Sk0g5M4ZN2tNLA+rZ+xpf_LUma3Qw@mail.gmail.com>
References: <20170814214807.338-1-robh@kernel.org> <20170814214807.338-2-robh@kernel.org>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814214807.338-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Mon, Aug 14, 2017 at 4:48 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> Add a check for nodes with interrupts property that they have a valid
> parent, the parent has #interrupt-cells property, and the size is a
> valid multiple of #interrupt-cells.
>
> This may not handle every possible case and doesn't deal with
> translation thru interrupt-map properties, but should be enough for
> modern dts files.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/checks.c b/checks.c
> index c0450e118043..0d452bf8e674 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1070,6 +1070,63 @@ static void check_gpio_cells_property(struct check *c,
>  }
>  WARNING(gpio_cells_property, check_gpio_cells_property, NULL);
>
> +static void check_interrupts_property(struct check *c,
> +                                     struct dt_info *dti,
> +                                     struct node *node)
> +{
> +       struct node *root = dti->dt;
> +       struct node *irq_node = NULL, *parent = node;
> +       struct property *irq_prop, *prop = NULL;
> +       int irq_cells, phandle;
> +
> +       irq_prop = get_property(node, "interrupts");
> +       if (!irq_prop)
> +               return;
> +
> +       while (parent && !prop) {
> +               if (parent != node) {
> +                       prop = get_property(parent, "interrupt-controller");
> +                       if (prop) {
> +                               irq_node = parent;
> +                               break;
> +                       }

This also needs a similar interrupt-map check here which I somehow
dropped in rebasing.

> +               }
> +
> +               prop = get_property(parent, "interrupt-parent");
> +               if (prop) {
> +                       phandle = propval_cell(prop);
> +                       irq_node = get_node_by_phandle(root, phandle);
> +                       if (!irq_node) {
> +                               FAIL(c, dti, "Bad interrupt-parent phandle for %s",
> +                                    node->fullpath);
> +                               return;
> +                       }
> +                       break;
> +               }
> +
> +               parent = parent->parent;
> +       }
> +
> +       if (!irq_node) {
> +               FAIL(c, dti, "Missing interrupt-parent for %s", node->fullpath);
> +               return;
> +       }
> +
> +       prop = get_property(irq_node, "#interrupt-cells");
> +       if (!prop) {
> +               FAIL(c, dti, "Missing #interrupt-cells in interrupt-parent %s",
> +                    irq_node->fullpath);
> +               return;
> +       }
> +
> +       irq_cells = propval_cell(prop);
> +       if (irq_prop->val.len % (irq_cells * sizeof(cell_t))) {
> +               FAIL(c, dti, "interrupts size is (%d), expected multiple of %d in %s",
> +                    irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)), node->fullpath);
> +       }
> +}
> +WARNING(interrupts_property, check_interrupts_property, &phandle_references);
> +
>  static struct check *check_table[] = {
>         &duplicate_node_names, &duplicate_property_names,
>         &node_name_chars, &node_name_format, &property_name_chars,
> @@ -1103,6 +1160,7 @@ static struct check *check_table[] = {
>
>         &provider_cells_property,
>         &gpio_cells_property,
> +       &interrupts_property,
>
>         &always_fail,
>  };
> --
> 2.11.0
>
