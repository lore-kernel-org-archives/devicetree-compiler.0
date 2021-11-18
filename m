From: Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/1] libfdt: overlay: make overlay_get_target() public
Date: Thu, 18 Nov 2021 10:58:07 -0800
Message-ID: <20211118185807.GA408308@xilinx.com>
References: <1637204036-382159-1-git-send-email-fnu.vikram@xilinx.com>
 <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
 <YZXkBbk1mp5QZOao@yekko>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyljWlh5nEOEYHr/Bjy9ZgCWDOF4lO/zsdf4foVNLJ0=;
 b=ZenU0MhPjrtm9CUI8WEVLDMU+qAQ0j+Z0SqYDubLr68zKg6IDfAQ/TmaJxTJ7v+UkzJz8j/FWAuup6ZuFQ4Sd4LRrP7IQcmoxRakfE4EXNbB0AfRgOC7oE5dtk+skSTIKZO07cKoDodjhD2qqMSxIqwDDApTMcmIc1FDFxYrWP4=
Content-Disposition: inline
In-Reply-To: <YZXkBbk1mp5QZOao@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Nov 18, 2021 at 04:26:29PM +1100, David Gibson wrote:
> On Wed, Nov 17, 2021 at 06:53:56PM -0800, Vikram Garhwal wrote:
> > This is done to get the target path for the overlay nodes which is very useful
> > in many cases. For example, Xen hypervisor needs it when applying overlays
> > because Xen needs to do further processing of the overlay nodes, e.g. mapping of
> > resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.
> > 
> > Signed-off-by: Vikram Garhwal <fnu.vikram-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> 
> Applied, thanks.
Thanks!
> 
> If you can follow up with some testcases for the newly-public
> function, that would be most appreciated.
Sure, will check the existing test cases and add tests for new public function.

Regards,
Vikram
> 
> > ---
> >  libfdt/fdt_overlay.c | 29 +++++++----------------------
> >  libfdt/libfdt.h      | 18 ++++++++++++++++++
> >  libfdt/version.lds   |  1 +
> >  3 files changed, 26 insertions(+), 22 deletions(-)
> > 
> > diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> > index d217e79..5c0c398 100644
> > --- a/libfdt/fdt_overlay.c
> > +++ b/libfdt/fdt_overlay.c
> > @@ -40,37 +40,22 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
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
> > -			      int fragment, char const **pathp)
> > +int fdt_overlay_target_offset(const void *fdt, const void *fdto,
> > +			      int fragment_offset, char const **pathp)
> >  {
> >  	uint32_t phandle;
> >  	const char *path = NULL;
> >  	int path_len = 0, ret;
> >  
> >  	/* Try first to do a phandle based lookup */
> > -	phandle = overlay_get_target_phandle(fdto, fragment);
> > +	phandle = overlay_get_target_phandle(fdto, fragment_offset);
> >  	if (phandle == (uint32_t)-1)
> >  		return -FDT_ERR_BADPHANDLE;
> >  
> >  	/* no phandle, try path */
> >  	if (!phandle) {
> >  		/* And then a path based lookup */
> > -		path = fdt_getprop(fdto, fragment, "target-path", &path_len);
> > +		path = fdt_getprop(fdto, fragment_offset, "target-path", &path_len);
> >  		if (path)
> >  			ret = fdt_path_offset(fdt, path);
> >  		else
> > @@ -636,7 +621,7 @@ static int overlay_merge(void *fdt, void *fdto)
> >  		if (overlay < 0)
> >  			return overlay;
> >  
> > -		target = overlay_get_target(fdt, fdto, fragment, NULL);
> > +		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
> >  		if (target < 0)
> >  			return target;
> >  
> > @@ -779,7 +764,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> >  			return -FDT_ERR_BADOVERLAY;
> >  
> >  		/* get the target of the fragment */
> > -		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
> > +		ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
> >  		if (ret < 0)
> >  			return ret;
> >  		target = ret;
> > @@ -801,7 +786,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> >  
> >  		if (!target_path) {
> >  			/* again in case setprop_placeholder changed it */
> > -			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
> > +			ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
> >  			if (ret < 0)
> >  				return ret;
> >  			target = ret;
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index 7f117e8..a7f432c 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -2116,6 +2116,24 @@ int fdt_del_node(void *fdt, int nodeoffset);
> >   */
> >  int fdt_overlay_apply(void *fdt, void *fdto);
> >  
> > +/**
> > + * fdt_overlay_target_offset - retrieves the offset of a fragment's target
> > + * @fdt: Base device tree blob
> > + * @fdto: Device tree overlay blob
> > + * @fragment_offset: node offset of the fragment in the overlay
> > + * @pathp: pointer which receives the path of the target (or NULL)
> > + *
> > + * fdt_overlay_target_offset() retrieves the target offset in the base
> > + * device tree of a fragment, no matter how the actual targeting is
> > + * done (through a phandle or a path)
> > + *
> > + * returns:
> > + *      the targeted node offset in the base device tree
> > + *      Negative error code on error
> > + */
> > +int fdt_overlay_target_offset(const void *fdt, const void *fdto,
> > +			      int fragment_offset, char const **pathp);
> > +
> >  /**********************************************************************/
> >  /* Debugging / informational functions                                */
> >  /**********************************************************************/
> > diff --git a/libfdt/version.lds b/libfdt/version.lds
> > index 7ab85f1..cbce5d4 100644
> > --- a/libfdt/version.lds
> > +++ b/libfdt/version.lds
> > @@ -77,6 +77,7 @@ LIBFDT_1.2 {
> >  		fdt_appendprop_addrrange;
> >  		fdt_setprop_inplace_namelen_partial;
> >  		fdt_create_with_flags;
> > +		fdt_overlay_target_offset;
> >  	local:
> >  		*;
> >  };
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson


