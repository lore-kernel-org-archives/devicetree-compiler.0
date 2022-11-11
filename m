From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checks: Handle #dma-address-cells and #dma-size-cells
Date: Fri, 11 Nov 2022 11:01:58 -0600
Message-ID: <CAL_JsqLV2ZHLJ=14zf9zNfq+S+Rs09EYmZrNHsvdhbmvvehj6g@mail.gmail.com>
References: <20221111114728.462767-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668186129;
        bh=u5vfdNgfF2qS9r0IoINtr5hYjQOKZphC2WJeYo2JfVE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=olwLHd7F1nZUJP1sowFfDYuT9WXUdXBRJjueKVvUqKqJpofCGjPdZTa6FyvWVgfeJ
         cBoZruXdJE1dLJRaxWtkdldb46xT3MHfJlw2cG2sn93vf8ZtNhMlFaLz0mT0Okuq6q
         2vf5u4Wtig1MVwtJf4AY9sF1QryBOymMzK/Fy8skVDjxUXai6AUOiaXmcOoIKyvPiq
         mst2w3/gP8gcud3d/9qTPndrexbCOPQp6NnOtxZZxIJN2Tilf78anETZQ6R49ot8aO
         kA1vV1ZgIKjH1ql0g30yPfJfuTyD/UkCDldAqaDE/2mcGPKc80gOErZQ26pyORhi5r
         7AzjT2yUyP0GQ==
In-Reply-To: <20221111114728.462767-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Nov 11, 2022 at 5:47 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The #dma-address-cells and #dma-size-cells properties can be used to
> override their non-DMA counterparts (#address-cells and #size-cells)
> for cases where the control bus (defined by the "reg" and "ranges"
> properties) has different addressing requirements from the DMA bus.
>
> The "dma-ranges" property needs to be sized depending on these DMA
> bus properties rather than the control bus properties, so adjust the
> check accordingly.

I assume I'll be seeing a spec and schema addition too.

I imagine David is wondering where this is coming from given these are
new properties, not existing ones that the checks just didn't handle.

>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  checks.c | 48 +++++++++++++++++++++++++++++++++++++-----------
>  dtc.h    |  1 +
>  2 files changed, 38 insertions(+), 11 deletions(-)
>
> diff --git a/checks.c b/checks.c
> index 9f31d2607182..ee13dce03483 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -743,6 +743,17 @@ static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
>         prop = get_property(node, "#size-cells");
>         if (prop)
>                 node->size_cells = propval_cell(prop);
> +
> +       node->dma_addr_cells = -1;
> +       node->dma_size_cells = -1;
> +
> +       prop = get_property(node, "#dma-address-cells");
> +       if (prop)
> +               node->dma_addr_cells = propval_cell(prop);

else
    node->dma_addr_cells = node->addr_cells;

> +
> +       prop = get_property(node, "#dma-size-cells");
> +       if (prop)
> +               node->dma_size_cells = propval_cell(prop);
>  }
>  WARNING(addr_size_cells, fixup_addr_size_cells, NULL,
>         &address_cells_is_cell, &size_cells_is_cell);
> @@ -751,6 +762,10 @@ WARNING(addr_size_cells, fixup_addr_size_cells, NULL,
>         (((n)->addr_cells == -1) ? 2 : (n)->addr_cells)
>  #define node_size_cells(n) \
>         (((n)->size_cells == -1) ? 1 : (n)->size_cells)
> +#define node_dma_addr_cells(n) \
> +       (((n)->dma_addr_cells == -1) ? node_addr_cells(n) : (n)->dma_addr_cells)
> +#define node_dma_size_cells(n) \
> +       (((n)->dma_size_cells == -1) ? node_size_cells(n) : (n)->dma_size_cells)

Then these can be just "(n)->dma_size_cells".

But wait, what about the default sizes? Those have been a dtc warning
since longer than I've run dtc. The defaults don't even agree with
Linux depending on the architecture. Certainly anyone using these new
properties must not be relying on defaults.

>
>  static void check_reg_format(struct check *c, struct dt_info *dti,
>                              struct node *node)
> @@ -787,6 +802,7 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
>         struct property *prop;
>         int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
>         const char *ranges = c->data;
> +       const char *prefix;
>
>         prop = get_property(node, ranges);
>         if (!prop)
> @@ -798,28 +814,38 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
>                 return;
>         }
>
> -       p_addr_cells = node_addr_cells(node->parent);
> -       p_size_cells = node_size_cells(node->parent);
> -       c_addr_cells = node_addr_cells(node);
> -       c_size_cells = node_size_cells(node);
> +       if (strcmp(ranges, "dma-ranges") == 0) {
> +               p_addr_cells = node_dma_addr_cells(node->parent);
> +               p_size_cells = node_dma_size_cells(node->parent);
> +               c_addr_cells = node_dma_addr_cells(node);
> +               c_size_cells = node_dma_size_cells(node);
> +               prefix = "dma-";
> +       } else {
> +               p_addr_cells = node_addr_cells(node->parent);
> +               p_size_cells = node_size_cells(node->parent);
> +               c_addr_cells = node_addr_cells(node);
> +               c_size_cells = node_size_cells(node);
> +               prefix = "";
> +       }
> +
>         entrylen = (p_addr_cells + c_addr_cells + c_size_cells) * sizeof(cell_t);
>
>         if (prop->val.len == 0) {
>                 if (p_addr_cells != c_addr_cells)
>                         FAIL_PROP(c, dti, node, prop, "empty \"%s\" property but its "
> -                                 "#address-cells (%d) differs from %s (%d)",
> -                                 ranges, c_addr_cells, node->parent->fullpath,
> +                                 "#%saddress-cells (%d) differs from %s (%d)",
> +                                 ranges, prefix, c_addr_cells, node->parent->fullpath,

This is going to misleadingly print '#dma-address-cells' in cases that
actually have '#address-cells'. It's probably easiest if you say 'DMA?
address cells' rather than using the property name.

>                                   p_addr_cells);
>                 if (p_size_cells != c_size_cells)
>                         FAIL_PROP(c, dti, node, prop, "empty \"%s\" property but its "
> -                                 "#size-cells (%d) differs from %s (%d)",
> -                                 ranges, c_size_cells, node->parent->fullpath,
> +                                 "#%ssize-cells (%d) differs from %s (%d)",
> +                                 ranges, prefix, c_size_cells, node->parent->fullpath,
>                                   p_size_cells);
>         } else if (!is_multiple_of(prop->val.len, entrylen)) {
>                 FAIL_PROP(c, dti, node, prop, "\"%s\" property has invalid length (%d bytes) "
> -                         "(parent #address-cells == %d, child #address-cells == %d, "
> -                         "#size-cells == %d)", ranges, prop->val.len,
> -                         p_addr_cells, c_addr_cells, c_size_cells);
> +                         "(parent #%saddress-cells == %d, child #%saddress-cells == %d, "
> +                         "#size-cells == %d)", ranges, prop->val.len, prefix,
> +                         p_addr_cells, prefix, c_addr_cells, c_size_cells);
>         }
>  }
>  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
> diff --git a/dtc.h b/dtc.h
> index 0a1f54991026..3d2ef7f3616f 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -228,6 +228,7 @@ struct node {
>
>         cell_t phandle;
>         int addr_cells, size_cells;
> +       int dma_addr_cells, dma_size_cells;
>
>         struct label *labels;
>         const struct bus_type *bus;
> --
> 2.38.1
>
