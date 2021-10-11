From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] checks: Add an interrupt-map check
Date: Mon, 11 Oct 2021 11:56:19 -0500
Message-ID: <CAL_JsqKrRAOiuY=71xsZ0RRojsOraXmSaLpDYSXx1E84SF_qDQ@mail.gmail.com>
References: <20210928212335.2061125-1-robh@kernel.org> <YWPEEyJn1o0ikYEL@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633971395;
        bh=LIS7vvy3gJvadDPnCjFtuF9WW+C2JF8EpZwWhCI4Wq8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fRFzKhXtngZl6X/SzVnpUU+kBrA6+WTAKHnkQO6wPk1SKkKv4whI7B4fYB/OJPKUn
         SvtlCtJ1s5LkG2O4KixFLvulLUgZzReXDEx9O/gukq4uuwX0kiiuRxcg78XGc8M/+q
         rmE3V2rIXvN2a2wzxn3/mmqu+VDXonKV4cwAKgTNO3VfOxISvaIedPImtPpLzsl3Fw
         93dLp6+xYNWzZjKvqa0JaMpLnzYHBcO04MS0E0X6/d+TZPaHi3ONC1g4ECWufkefRX
         f2PHvCjzQT6cYiYHh9RC6XxlcwZeLoFZDlpti3NkT/CUyCerCKf062CxTr0nkMu6zB
         Ehu21tDCL/XxQ==
In-Reply-To: <YWPEEyJn1o0ikYEL@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

On Sun, Oct 10, 2021 at 11:58 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Tue, Sep 28, 2021 at 04:23:33PM -0500, Rob Herring wrote:
> > Add a check for parsing 'interrupt-map' properties. The check primarily
> > tests parsing 'interrupt-map' properties which depends on and the parent
> > interrupt controller (or another map) node.
> >
> > Note that this does not require '#address-cells' in the interrupt-map
> > parent, but treats missing '#address-cells' as 0 which is how the Linux
> > kernel parses it. There's numerous cases that expect this behavior.
> >
> > Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >  checks.c                           | 88 ++++++++++++++++++++++++++++++
> >  tests/bad-interrupt-map-mask.dts   | 20 +++++++
> >  tests/bad-interrupt-map-parent.dts | 17 ++++++
> >  tests/bad-interrupt-map.dts        | 19 +++++++
> >  tests/run_tests.sh                 |  3 +
> >  5 files changed, 147 insertions(+)
> >  create mode 100644 tests/bad-interrupt-map-mask.dts
> >  create mode 100644 tests/bad-interrupt-map-parent.dts
> >  create mode 100644 tests/bad-interrupt-map.dts
> >
> > diff --git a/checks.c b/checks.c
> > index fb3fc9cda4b1..d4e7facd7f37 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -1589,6 +1589,93 @@ static void check_interrupt_provider(struct check *c,
> >  }
> >  WARNING(interrupt_provider, check_interrupt_provider, NULL);
> >
> > +static void check_interrupt_map(struct check *c,
> > +                             struct dt_info *dti,
> > +                             struct node *node)
> > +{
> > +     struct node *root = dti->dt;
> > +     struct property *prop, *irq_map_prop;
> > +     size_t cellsize, cell, map_cells;
> > +
> > +     irq_map_prop = get_property(node, "interrupt-map");
> > +     if (!irq_map_prop)
> > +             return;
> > +
> > +     prop = get_property(node, "#interrupt-cells");
> > +     if (!prop)
> > +             /* Already checked in check_interrupt_provider */
>
> If you add check_interrupt_provider as a dependency, then you can omit
> this check.  Of course, check_interrupt_provider itself should
> probably have a dependency on the check that ensures than
> len(#interrupt-cells) == 4.

Okay.

> > +             return;
> > +     cellsize = propval_cell(prop);
> > +
> > +     prop = get_property(node, "#address-cells");
> > +     if (!prop) {
> > +             FAIL(c, dti, node,
> > +                  "Missing '#address-cells' in interrupt-map provider");
> > +             return;
> > +     }
> > +     cellsize += propval_cell(prop);
> > +
> > +     prop = get_property(node, "interrupt-map-mask");
> > +     if (prop && (prop->val.len != (cellsize * sizeof(cell_t))))
> > +             FAIL_PROP(c, dti, node, prop,
> > +                       "property size (%d) is invalid, expected %zu",
> > +                       prop->val.len, cellsize * sizeof(cell_t));
> > +
> > +     if (!is_multiple_of(irq_map_prop->val.len, sizeof(cell_t))) {
> > +             FAIL_PROP(c, dti, node, irq_map_prop,
> > +                       "property size (%d) is invalid, expected multiple of %zu",
> > +                       irq_map_prop->val.len, sizeof(cell_t));
> > +             return;
> > +     }
> > +
> > +     map_cells = irq_map_prop->val.len / sizeof(cell_t);
> > +     for (cell = 0; cell < map_cells; ) {
> > +             struct node *provider_node;
> > +             struct property *cellprop;
> > +             int phandle;
> > +             size_t parent_cellsize;
> > +
> > +             if ((cell + cellsize) >= map_cells) {
> > +                     FAIL_PROP(c, dti, node, irq_map_prop,
> > +                               "property size (%d) too small, expected > %zu",
> > +                               irq_map_prop->val.len, (cell + cellsize) * sizeof(cell_t));
> > +                     break;
> > +             }
> > +
> > +             phandle = propval_cell_n(irq_map_prop, cell + cellsize);
> > +
> > +             if ((phandle == 0) || (phandle == -1)) {
> > +                     FAIL_PROP(c, dti, node, irq_map_prop,
> > +                               "Cell %zu is not a phandle(%d)",
> > +                               cell + cellsize, phandle);
> > +                     break;
> > +             }
> > +             provider_node = get_node_by_phandle(root, phandle);
> > +             if (!provider_node) {
> > +                     FAIL_PROP(c, dti, node, irq_map_prop,
> > +                               "Could not get phandle node for (cell %zu)",
> > +                               cell);
> > +                     break;
> > +             }
> > +
> > +             cellprop = get_property(provider_node, "#interrupt-cells");
> > +             if (cellprop) {
> > +                     parent_cellsize = propval_cell(cellprop);
> > +             } else {
> > +                     FAIL(c, dti, node, "Missing property '#interrupt-cells' in node %s or bad phandle (referred from interrupt-map[%zu])",
> > +                          provider_node->fullpath, cell);
> > +                     break;
> > +             }
> > +
> > +             cellprop = get_property(provider_node, "#address-cells");
> > +             if (cellprop)
> > +                     parent_cellsize += propval_cell(cellprop);
> > +
> > +             cell += cellsize + 1 + parent_cellsize;
> > +     }
> > +}
> > +WARNING(interrupt_map, check_interrupt_map, NULL, &phandle_references);
> > +
> >  static void check_interrupts_property(struct check *c,
> >                                     struct dt_info *dti,
> >                                     struct node *node)
> > @@ -1887,6 +1974,7 @@ static struct check *check_table[] = {
> >       &gpios_property,
> >       &interrupts_property,
> >       &interrupt_provider,
> > +     &interrupt_map,
> >
> >       &alias_paths,
> >
> > diff --git a/tests/bad-interrupt-map-mask.dts b/tests/bad-interrupt-map-mask.dts
> > new file mode 100644
> > index 000000000000..10eaffd62310
> > --- /dev/null
> > +++ b/tests/bad-interrupt-map-mask.dts
> > @@ -0,0 +1,20 @@
> > +/dts-v1/;
> > +
> > +/ {
> > +     interrupt-parent = <&intc>;
> > +     intc: interrupt-controller {
> > +             #interrupt-cells = <3>;
> > +             interrupt-controller;
> > +     };
> > +
> > +     node {
> > +             #address-cells = <0>;
> > +             #interrupt-cells = <1>;
> > +             interrupt-map = <1 &intc 1 2 3>;
> > +             interrupt-map-mask = <0 0>;
> > +
> > +             child {
> > +                     interrupts = <1>;
> > +             };
> > +     };
> > +};
> > diff --git a/tests/bad-interrupt-map-parent.dts b/tests/bad-interrupt-map-parent.dts
> > new file mode 100644
> > index 000000000000..fe88ce2fe76f
> > --- /dev/null
> > +++ b/tests/bad-interrupt-map-parent.dts
> > @@ -0,0 +1,17 @@
> > +/dts-v1/;
> > +
> > +/ {
> > +     interrupt-parent = <&intc>;
> > +     intc: interrupt-controller {
> > +     };
> > +
> > +     node {
> > +             #address-cells = <0>;
> > +             #interrupt-cells = <1>;
> > +             interrupt-map = <1 &intc 1 2 3>;
>
> If you just want to verify the check on the bad parent, shouldn't you
> have an interrupt-map-mask here?

No, a missing interrupt-map-mask is not an error. Only the wrong
number of cells is an error. It's treated as all 1s mask if not
present. So, in interest of having a minimal test, I omitted it.

Rob
