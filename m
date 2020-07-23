From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 3/4] dtc: Move some definitions into dtc-plugin.h
Date: Thu, 23 Jul 2020 08:16:15 -0600
Message-ID: <CAL_Jsq+JHr81ota59UpUXmBdDCh8yqaarLE-d99TQcryu+20Ew@mail.gmail.com>
References: <20200721155900.9147-1-andrei.ziureaev@arm.com> <20200721155900.9147-4-andrei.ziureaev@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595513789;
        bh=weXdO9+lxFRxY83jK2PVFQrA2/5T7M3A4+weGdCOFA0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WpNnPtMKi2NMW58kdmN7+YK5FQpnlttozLa6ZK0EjcKO+Gu5kOS2fV5tc3Zw8Wl2+
         ewCJf0BpwVdbSYnVdY1NA1H83AnrSB9UPbi3WaFFB7CN+3rP9aVH4bBrObvaMHP3XL
         XAQ3GJtAuAVVx/GIJINxaFKWQrvlkElP637MJBj4=
In-Reply-To: <20200721155900.9147-4-andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, Jul 21, 2020 at 9:59 AM Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org> wrote:
>
> Put various bits and pieces into the header for plugins.
>
> Signed-off-by: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>
> ---
>  dtc-plugin.h | 173 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  dtc.h        | 145 +-----------------------------------------
>  treesource.c |  21 -------
>  3 files changed, 174 insertions(+), 165 deletions(-)
>  create mode 100644 dtc-plugin.h
>
> diff --git a/dtc-plugin.h b/dtc-plugin.h
> new file mode 100644
> index 0000000..35c3d19
> --- /dev/null
> +++ b/dtc-plugin.h
> @@ -0,0 +1,173 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef DTC_PLUGIN_H
> +#define DTC_PLUGIN_H
> +
> +/*
> + * (C) Copyright Arm Holdings.  2020
> + * (C) Copyright David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, IBM Corporation.  2005.
> + */
> +
> +#include <stdint.h>
> +#include <stdbool.h>
> +
> +struct dt_info {
> +       const char *version;

I think just an int is sufficient here.

> +       unsigned int dtsflags;
> +       struct reserve_info *reservelist;

This struct needs to be defined in this header.

> +       uint32_t boot_cpuid_phys;
> +       struct node *dt;                /* the device tree */
> +       const char *outname;            /* filename being written to, "-" for stdout */
> +};
> +
> +typedef uint32_t cell_t;
> +
> +enum markertype {
> +       TYPE_NONE,
> +       REF_PHANDLE,
> +       REF_PATH,
> +       LABEL,
> +       TYPE_UINT8,
> +       TYPE_UINT16,
> +       TYPE_UINT32,
> +       TYPE_UINT64,
> +       TYPE_STRING,
> +};
> +
> +struct marker {
> +       enum markertype type;
> +       int offset;
> +       char *ref;
> +       struct marker *next;
> +};
> +
> +struct data {
> +       int len;
> +       char *val;
> +       struct marker *markers;
> +};
> +
> +#define for_each_marker(m) \
> +       for (; (m); (m) = (m)->next)
> +#define for_each_marker_of_type(m, t) \
> +       for_each_marker(m) \
> +               if ((m)->type == (t))
> +
> +/* Live trees */
> +struct label {
> +       bool deleted;
> +       char *label;
> +       struct label *next;
> +};
> +
> +struct bus_type {
> +       const char *name;
> +};
> +
> +struct property {
> +       bool deleted;
> +       char *name;
> +       struct data val;
> +
> +       struct property *next;
> +
> +       struct label *labels;
> +       struct srcpos *srcpos;

This struct also needs to be defined in here.

> +};
> +
> +struct node {
> +       bool deleted;
> +       char *name;
> +       struct property *proplist;
> +       struct node *children;
> +
> +       struct node *parent;
> +       struct node *next_sibling;
> +
> +       char *fullpath;
> +       int basenamelen;
> +
> +       cell_t phandle;
> +       int addr_cells, size_cells;
> +
> +       struct label *labels;
> +       const struct bus_type *bus;
> +       struct srcpos *srcpos;
> +
> +       bool omit_if_unused, is_referenced;
> +};
> +
> +#define for_each_label_withdel(l0, l) \
> +       for ((l) = (l0); (l); (l) = (l)->next)
> +
> +#define for_each_label(l0, l) \
> +       for_each_label_withdel(l0, l) \
> +               if (!(l)->deleted)
> +
> +#define for_each_property_withdel(n, p) \
> +       for ((p) = (n)->proplist; (p); (p) = (p)->next)
> +
> +#define for_each_property(n, p) \
> +       for_each_property_withdel(n, p) \
> +               if (!(p)->deleted)
> +
> +#define for_each_child_withdel(n, c) \
> +       for ((c) = (n)->children; (c); (c) = (c)->next_sibling)
> +
> +#define for_each_child(n, c) \
> +       for_each_child_withdel(n, c) \
> +               if (!(c)->deleted)
> +
> +static inline uint16_t dtb_ld16(const void *p)
> +{
> +       const uint8_t *bp = (const uint8_t *)p;
> +
> +       return ((uint16_t)bp[0] << 8)
> +               | bp[1];
> +}
> +
> +static inline uint32_t dtb_ld32(const void *p)
> +{
> +       const uint8_t *bp = (const uint8_t *)p;
> +
> +       return ((uint32_t)bp[0] << 24)
> +               | ((uint32_t)bp[1] << 16)
> +               | ((uint32_t)bp[2] << 8)
> +               | bp[3];
> +}
> +
> +static inline uint64_t dtb_ld64(const void *p)
> +{
> +       const uint8_t *bp = (const uint8_t *)p;
> +
> +       return ((uint64_t)bp[0] << 56)
> +               | ((uint64_t)bp[1] << 48)
> +               | ((uint64_t)bp[2] << 40)
> +               | ((uint64_t)bp[3] << 32)
> +               | ((uint64_t)bp[4] << 24)
> +               | ((uint64_t)bp[5] << 16)
> +               | ((uint64_t)bp[6] << 8)
> +               | bp[7];
> +}
> +
> +static inline bool has_data_type_information(struct marker *m)
> +{
> +       return m->type >= TYPE_UINT8;
> +}
> +
> +static inline struct marker *next_type_marker(struct marker *m)
> +{
> +       while (m && !has_data_type_information(m))
> +               m = m->next;
> +       return m;
> +}
> +
> +static inline size_t type_marker_length(struct marker *m)
> +{
> +       struct marker *next = next_type_marker(m->next);
> +
> +       if (next)
> +               return next->offset - m->offset;
> +       return 0;
> +}
> +
> +#endif /* DTC_PLUGIN_H */
