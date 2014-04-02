From: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Wed, 2 Apr 2014 14:24:03 -0500
Message-ID: <20140402142403.9d3316f14520252a4a3474e0@freescale.com>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
	<1396393358.32034.40.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396393358.32034.40.camel-88ow+0ZRuxG2UiBs7uKeOtHuzzzSOjJt@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

On Tue, 1 Apr 2014 18:02:38 -0500
Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> On Tue, 2014-04-01 at 11:57 -0500, Rob Herring wrote:
> > From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > 
> > Add FDT based address translation. Currently, only simple bus
> > translations are supported, but the framework allows adding other
> > buses like PCI. Adding this to libfdt allows the address
> > translation code to be shared amongst u-boot, Linux kernel and other
> > projects.
> > 
> > This code is based on GPL only licensed code. It must first be
> > re-licensed for dual GPL/BSD to add to libfdt which requires approval
> > from the copyright holders.
> > 
> > This code is copied from u-boot common/fdt_support.c. The portion used
> > here was originally added to u-boot by Kumar Gala in 2010 and Freescale
> > is the copyright holder. Later changes have also only been done by
> > Freescale authors. The u-boot code appears to have been copied from the
> > Linux kernel's address translation code in drivers/of/address.c which
> > has no copyright. This code was moved by Grant Likely in 2010 and
> > originated from arch/powerpc/kernel/prom_parse.c which was written by
> > Ben Herrenschmidt. Who is the copyright holder on a file in the kernel
> > with no copyright? Does this default to the author or Linus or nobody?
> 
> ACK for the Freescale contribution (on copyright issues, not technical -- see below).

FWIW, ack from me too.

> +/* Default translator (generic bus) */
> +static void fdt_bus_default_count_cells(void *blob, int parentoffset,
> +				 	int *addrc, int *sizec)

space before tab in indent (git am).

Also, thanks for not introducing new sparse warnings :)

Kim

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
