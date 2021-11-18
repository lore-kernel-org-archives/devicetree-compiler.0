From: Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] libfdt: overlay: Add fdt_ prefix to overlay_get_target()
Date: Wed, 17 Nov 2021 18:26:49 -0800
Message-ID: <20211118022649.GA371971@xilinx.com>
References: <1637019043-452179-1-git-send-email-fnu.vikram@xilinx.com>
 <YZWTwFNy0ZPNcYbQ@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+aOHkXko4qmmGWeckoW3E46pAStlTwlWIumlzcpzs0=;
 b=IKowRTtN1d3Zvv9rZtnvwaifLL9/wsT6fGcxQiYiG7uE7wZ8vEtaFKsVyDLm1Xbwc6T1p9gVAAxfigLq09ycfS68cec1Y/8p2tXpgw/AruvYjesOHUXJkcLao+2ce/4KOltFgUgZ3GPfUI5Z7KA2e3jWO05LSgNSFDOswjRN13o=
Content-Disposition: inline
In-Reply-To: <YZWTwFNy0ZPNcYbQ@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Nov 18, 2021 at 10:44:00AM +1100, David Gibson wrote:
> On Mon, Nov 15, 2021 at 03:30:43PM -0800, Vikram Garhwal wrote:
> > Add fdt_ prefix to overlay_get_target() and remove static type.
> 
> The short description is burying the lede a bit, the key point is that
> you're making this function public.
> 
> > This is done to get the target path for the overlay nodes which is very useful
> > in many cases. For example, Xen hypervisor needs it when applying overlays
> > because Xen needs to do further processing of the overlay nodes, e.g. mapping of
> > resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.
> > 
> > Signed-off-by: Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> 
> The concept looks fine to me.  A few details to polish noted below:
> 
> > ---
> >  libfdt/fdt_overlay.c | 23 ++++-------------------
> >  libfdt/libfdt.h      | 19 +++++++++++++++++++
> >  libfdt/version.lds   |  1 +
> >  3 files changed, 24 insertions(+), 19 deletions(-)
> > 
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index d217e79..e141053 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -40,22 +40,7 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
> >  	return fdt32_to_cpu(*val);
> >  }
> >  
> > -/**
> > - * overlay_get_target - retrieves the offset of a fragment's target
> > - * @fdt: Base device tree blob
> > - * @fdto: Device tree overlay blob
> > - * @fragment: node offset of the fragment in the overlay
> > - * @pathp: pointer which receives the path of the target (or NULL)
> > - *
> > - * overlay_get_target() retrieves the target offset in the base
> > - * device tree of a fragment, no matter how the actual targeting is
> > - * done (through a phandle or a path)
> > - *
> > - * returns:
> > - *      the targeted node offset in the base device tree
> > - *      Negative error code on error
> > - */
> > -static int overlay_get_target(const void *fdt, const void *fdto,
> > +int fdt_overlay_get_target(const void *fdt, const void *fdto,
> >  			      int fragment, char const **pathp)
> 
> "overlay_get_target" was fine as an internal name.  When published, I
> think "fdt_overlay_target_offset" would better fit the naming
> conventions for the rest of the interface.
> 
> Similarly, I'd like the @fragment parameter renamed @fragment_offset.
> 
> [The insistent use of explicit "offset" throughout the interface is
>  deliberate - it's an attempt to constantly remind users that these
>  quantities are explicit offsets in the blob, which can be invalidated
>  by other changes, rather than some sort of safe, stable handle on a
>  node]
> 
Understood, i will make the changes and send v2 soon.
Thanks for reviewing the patch. 
> >  {
> >  	uint32_t phandle;
> > @@ -636,7 +621,7 @@ static int overlay_merge(void *fdt, void *fdto)
> >  		if (overlay < 0)
> >  			return overlay;
> >  
> > -		target = overlay_get_target(fdt, fdto, fragment, NULL);
> > +		target = fdt_overlay_get_target(fdt, fdto, fragment, NULL);
> >  		if (target < 0)
> >  			return target;
> >  
> > @@ -779,7 +764,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> >  			return -FDT_ERR_BADOVERLAY;
> >  
> >  		/* get the target of the fragment */
> > -		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
> > +		ret = fdt_overlay_get_target(fdt, fdto, fragment, &target_path);
> >  		if (ret < 0)
> >  			return ret;
> >  		target = ret;
> > @@ -801,7 +786,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> >  
> >  		if (!target_path) {
> >  			/* again in case setprop_placeholder changed it */
> > -			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
> > +			ret = fdt_overlay_get_target(fdt, fdto, fragment, &target_path);
> >  			if (ret < 0)
> >  				return ret;
> >  			target = ret;
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index 7f117e8..5d42533 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -2116,6 +2116,25 @@ int fdt_del_node(void *fdt, int nodeoffset);
> >   */
> >  int fdt_overlay_apply(void *fdt, void *fdto);
> >  
> > +/**
> > + * fdt_overlay_get_target - retrieves the offset of a fragment's target
> > + * @fdt: Base device tree blob
> > + * @fdto: Device tree overlay blob
> > + * @fragment: node offset of the fragment in the overlay
> > + * @pathp: pointer which receives the path of the target (or NULL)
> > + *
> > + * fdt_overlay_get_target() retrieves the target offset in the base
> > + * device tree of a fragment, no matter how the actual targeting is
> > + * done (through a phandle or a path)
> > + *
> > + * returns:
> > + *      the targeted node offset in the base device tree
> > + *      Negative error code on error
> > + */
> > +
> > +int fdt_overlay_get_target(const void *fdt, const void *fdto, int fragment,
> > +                           char const **pathp);
> > +
> >  /**********************************************************************/
> >  /* Debugging / informational functions                                */
> >  /**********************************************************************/
> > diff --git a/libfdt/version.lds b/libfdt/version.lds
> > index 7ab85f1..9e0daa1 100644
> > --- a/libfdt/version.lds
> > +++ b/libfdt/version.lds
> > @@ -77,6 +77,7 @@ LIBFDT_1.2 {
> >  		fdt_appendprop_addrrange;
> >  		fdt_setprop_inplace_namelen_partial;
> >  		fdt_create_with_flags;
> > +		fdt_overlay_get_target;
> >  	local:
> >  		*;
> >  };
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson


