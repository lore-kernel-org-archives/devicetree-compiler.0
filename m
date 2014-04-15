From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Tue, 15 Apr 2014 17:55:32 -0500
Message-ID: <CAL_JsqLm9XPZKOKAGaOEDWKpiaq1x_xzOUWZuCPukD-6FgaZpw@mail.gmail.com>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
	<CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=yUbdS9AVeZCu8M3OjDls3gaQpFEaD0sAu8ADedcg3tI=;
        b=LxTDZ7wNDWEMoU7GjcFy7VRGO2FWqN0mg+h5hQ6roLmw5GcdmF6ASpqJLLGrZRdk4P
         GgBB3e/Ca3lyEZu/b7qMV9KccFkqkVnweXGFMRLXQVDcVgwmr8nNTNY7+cvegIq/vDTa
         7hQPt602YZ1IOAefTHK30DsyuYs7Qt25zu3S+TLx1okJH7b6gtiE0eCfM0IATjvgipdN
         SyZqnG7D955FVE8ccSj1Bwn9YfujeE/Q2PYsgfwtoJCVJZ80wxFZAAlKqRXL/TJByVf2
         jgQJPzzMQc/Xp5S2wZh8w88TuFY96HPUL2x82fPfzBR0+Z0R/PmQ2b++Nhrr+hlsZTYl
         oDIg==
In-Reply-To: <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

On Tue, Apr 15, 2014 at 4:57 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Apr 1, 2014 at 5:57 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Add FDT based address translation. Currently, only simple bus
>> translations are supported, but the framework allows adding other
>> buses like PCI. Adding this to libfdt allows the address
>> translation code to be shared amongst u-boot, Linux kernel and other
>> projects.
>>
>> This code is based on GPL only licensed code. It must first be
>> re-licensed for dual GPL/BSD to add to libfdt which requires approval
>> from the copyright holders.
>>
>> This code is copied from u-boot common/fdt_support.c. The portion used
>> here was originally added to u-boot by Kumar Gala in 2010 and Freescale
>> is the copyright holder. Later changes have also only been done by
>> Freescale authors. The u-boot code appears to have been copied from the
>> Linux kernel's address translation code in drivers/of/address.c which
>> has no copyright. This code was moved by Grant Likely in 2010 and
>> originated from arch/powerpc/kernel/prom_parse.c which was written by
>> Ben Herrenschmidt.
>
> Okay, so this makes things a bit more complicated. You need to compose
> a list of every commit that has touched this file in *both* the u-boot
> and kernel trees, and identify all of the copyright holders based on
> who submitted the patches. Once you have that list, then you need to
> get an Ack from every single one of them. If anyone does not respond,
> or does not give agreement, then we need to look at their change and
> determine whether or not we consider it to be a significant enough
> change that it would warrant copyright protection.

Fortunately, it is not that complicated. The u-boot version was done
almost exactly the same time as the PPC version was moved by you (June
2010). The next commit that was not you was Oct 2010. Therefore, any
changes to drivers/of/address.c can be ignored (I'm assuming you will
ack this :)). So we only need to look at the powerpc version in
arch/powerpc/kernel/prom_parse.c. Ignoring lines other than the
default address translation code, there are only 3 committers: Ben,
Jeremy Kerr, and Stephen Rothwell. The overwhelming majority of the
code is from the original commit by Ben (hence why I only considered
him to begin with).

Here are the commits from Jeremy and Stephen. I would characterize as
trivial fixes, but I've copied both of them here.

Stephen:
e2eb639 [POWERPC] Rename get_property to of_get_property: arch/powerpc
9213fee [POWERPC] Rename prom_n_size_cells to of_n_size_cells
a8bda5d [POWERPC] Rename prom_n_addr_cells to of_n_addr_cells

Jeremy:
a7f67bd [POWERPC] Constify & voidify get_property()
b5a1a9a [POWERPC] Use const qualifiers for prom parsing utilites

Here is the git blame I used for the analysis:
git blame dbbdee9^ arch/powerpc/kernel/prom_parse.c


For the u-boot side, I don't think the situation is any different from
we originally discussed. I've verified the copyrights are in agreement
with the history. The file has relevant copyrights (although missing
source attribution), and all changes of the relevant code are/were
employees of the copyright holder Freescale.

Rob

>
> g.
>
>
>> Who is the copyright holder on a file in the kernel
>> with no copyright? Does this default to the author or Linus or nobody?
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Cc: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> Cc: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>> ---
>>  libfdt/fdt_ro.c | 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  libfdt/libfdt.h |   4 ++
>>  2 files changed, 207 insertions(+)
>>
>> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
>> index 50007f6..3c1bde1 100644
>> --- a/libfdt/fdt_ro.c
>> +++ b/libfdt/fdt_ro.c
>> @@ -571,3 +571,206 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
>>
>>         return offset; /* error from fdt_next_node() */
>>  }
>> +
>> +/* Max address size we deal with */
>> +#define OF_MAX_ADDR_CELLS      4
>> +#define OF_CHECK_COUNTS(na, ns)        ((na) > 0 && (na) <= OF_MAX_ADDR_CELLS && \
>> +                       (ns) > 0)
>> +
>> +/* Helper to read a big number; size is in cells (not bytes) */
>> +static uint64_t fdt_read_number(const fdt32_t *cell, int size)
>> +{
>> +       uint64_t r = 0;
>> +       while (size--)
>> +               r = (r << 32) | fdt32_to_cpu(*(cell++));
>> +       return r;
>> +}
>> +
>> +/* Callbacks for bus specific translators */
>> +struct of_bus {
>> +       void (*count_cells)(void *blob, int parentoffset,
>> +                           int *addrc, int *sizec);
>> +       uint64_t (*map)(fdt32_t *addr, const fdt32_t *range,
>> +                               int na, int ns, int pna);
>> +       int (*translate)(fdt32_t *addr, uint64_t offset, int na);
>> +};
>> +
>> +/* Default translator (generic bus) */
>> +static void fdt_bus_default_count_cells(void *blob, int parentoffset,
>> +                                       int *addrc, int *sizec)
>> +{
>> +       const fdt32_t *prop;
>> +
>> +       if (addrc) {
>> +               prop = fdt_getprop(blob, parentoffset, "#address-cells", NULL);
>> +               if (prop)
>> +                       *addrc = fdt32_to_cpu(*prop);
>> +               else
>> +                       *addrc = 2;
>> +       }
>> +
>> +       if (sizec) {
>> +               prop = fdt_getprop(blob, parentoffset, "#size-cells", NULL);
>> +               if (prop)
>> +                       *sizec = fdt32_to_cpu(*prop);
>> +               else
>> +                       *sizec = 2;
>> +       }
>> +}
>> +
>> +static uint64_t fdt_bus_default_map(fdt32_t *addr, const fdt32_t *range,
>> +                                   int na, int ns, int pna)
>> +{
>> +       uint64_t cp, s, da;
>> +
>> +       cp = fdt_read_number(range, na);
>> +       s  = fdt_read_number(range + na + pna, ns);
>> +       da = fdt_read_number(addr, na);
>> +
>> +       if (da < cp || da >= (cp + s))
>> +               return FDT_BAD_ADDR;
>> +       return da - cp;
>> +}
>> +
>> +static int fdt_bus_default_translate(fdt32_t *addr, uint64_t offset, int na)
>> +{
>> +       uint64_t a = fdt_read_number(addr, na);
>> +       memset(addr, 0, na * 4);
>> +       a += offset;
>> +       if (na > 1)
>> +               addr[na - 2] = cpu_to_fdt32(a >> 32);
>> +       addr[na - 1] = cpu_to_fdt32(a & 0xffffffffu);
>> +
>> +       return 0;
>> +}
>> +
>> +/* Array of bus specific translators */
>> +static const struct of_bus of_busses[] = {
>> +       /* Default */
>> +       {
>> +               .count_cells = fdt_bus_default_count_cells,
>> +               .map = fdt_bus_default_map,
>> +               .translate = fdt_bus_default_translate,
>> +       },
>> +};
>> +
>> +static int fdt_translate_one(void * blob, int parent,
>> +                            const struct of_bus *bus,
>> +                            const struct of_bus *pbus, fdt32_t *addr,
>> +                            int na, int ns, int pna, const char *rprop)
>> +{
>> +       const fdt32_t *ranges;
>> +       int rlen;
>> +       int rone;
>> +       uint64_t offset = FDT_BAD_ADDR;
>> +
>> +       /* Normally, an absence of a "ranges" property means we are
>> +        * crossing a non-translatable boundary, and thus the addresses
>> +        * below the current not cannot be converted to CPU physical ones.
>> +        * Unfortunately, while this is very clear in the spec, it's not
>> +        * what Apple understood, and they do have things like /uni-n or
>> +        * /ht nodes with no "ranges" property and a lot of perfectly
>> +        * useable mapped devices below them. Thus we treat the absence of
>> +        * "ranges" as equivalent to an empty "ranges" property which means
>> +        * a 1:1 translation at that level. It's up to the caller not to try
>> +        * to translate addresses that aren't supposed to be translated in
>> +        * the first place. --BenH.
>> +        */
>> +       ranges = fdt_getprop(blob, parent, rprop, &rlen);
>> +       if (ranges == NULL || rlen == 0) {
>> +               offset = fdt_read_number(addr, na);
>> +               memset(addr, 0, pna * 4);
>> +               goto finish;
>> +       }
>> +
>> +       /* Now walk through the ranges */
>> +       rlen /= 4;
>> +       rone = na + pna + ns;
>> +       for (; rlen >= rone; rlen -= rone, ranges += rone) {
>> +               offset = bus->map(addr, ranges, na, ns, pna);
>> +               if (offset != FDT_BAD_ADDR)
>> +                       break;
>> +       }
>> +       if (offset == FDT_BAD_ADDR)
>> +               return -FDT_ERR_NOTFOUND;
>> +
>> +       memcpy(addr, ranges + na, 4 * pna);
>> +
>> + finish:
>> +       /* Translate it into parent bus space */
>> +       return pbus->translate(addr, offset, pna);
>> +}
>> +
>> +static uint64_t __fdt_translate_address(void *blob, int node_offset,
>> +                                       const char *rprop)
>> +{
>> +       int parent, len;
>> +       const struct of_bus *bus, *pbus;
>> +       const fdt32_t *reg;
>> +       fdt32_t addr[OF_MAX_ADDR_CELLS];
>> +       int na, ns, pna, pns;
>> +       uint64_t result = FDT_BAD_ADDR;
>> +
>> +       reg = fdt_getprop(blob, node_offset, "reg", &len);
>> +       if (!reg)
>> +               goto bail;
>> +
>> +       /* Get parent & match bus type */
>> +       parent = fdt_parent_offset(blob, node_offset);
>> +       if (parent < 0)
>> +               goto bail;
>> +       bus = &of_busses[0];
>> +
>> +       /* Cound address cells & copy address locally */
>> +       bus->count_cells(blob, parent, &na, &ns);
>> +       if (!OF_CHECK_COUNTS(na, ns))
>> +               goto bail;
>> +
>> +       memcpy(addr, reg, na * 4);
>> +
>> +       /* Translate */
>> +       for (;;) {
>> +               /* Switch to parent bus */
>> +               node_offset = parent;
>> +               parent = fdt_parent_offset(blob, node_offset);
>> +
>> +               /* If root, we have finished */
>> +               if (parent < 0) {
>> +                       result = fdt_read_number(addr, na);
>> +                       break;
>> +               }
>> +
>> +               /* Get new parent bus and counts */
>> +               pbus = &of_busses[0];
>> +               pbus->count_cells(blob, parent, &pna, &pns);
>> +               if (!OF_CHECK_COUNTS(pna, pns))
>> +                       break;
>> +
>> +               /* Apply bus translation */
>> +               if (fdt_translate_one(blob, node_offset, bus, pbus,
>> +                                       addr, na, ns, pna, "ranges"))
>> +                       break;
>> +
>> +               /* Complete the move up one level */
>> +               na = pna;
>> +               ns = pns;
>> +               bus = pbus;
>> +       }
>> + bail:
>> +       return result;
>> +}
>> +
>> +/*
>> + * Translate an address from the device-tree into a CPU physical address,
>> + * this walks up the tree and applies the various bus mappings on the
>> + * way.
>> + *
>> + * Note: We consider that crossing any level with #size-cells == 0 to mean
>> + * that translation is impossible (that is we are not dealing with a value
>> + * that can be mapped to a cpu physical address). This is not really specified
>> + * that way, but this is traditionally the way IBM at least do things
>> + */
>> +uint64_t fdt_translate_address(void *fdt, int node_offset)
>> +{
>> +       return __fdt_translate_address(fdt, node_offset, "ranges");
>> +}
>> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
>> index c4d5a91..afbea65 100644
>> --- a/libfdt/libfdt.h
>> +++ b/libfdt/libfdt.h
>> @@ -118,6 +118,8 @@
>>
>>  #define FDT_ERR_MAX            13
>>
>> +#define FDT_BAD_ADDR           ((uint64_t)-1)
>> +
>>  /**********************************************************************/
>>  /* Low-level functions (you probably don't need these)                */
>>  /**********************************************************************/
>> @@ -852,6 +854,8 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
>>   */
>>  int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
>>
>> +uint64_t fdt_translate_address(void *blob, int node_offset);
>> +
>>  /**********************************************************************/
>>  /* Write-in-place functions                                           */
>>  /**********************************************************************/
>> --
>> 1.8.3.2
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
