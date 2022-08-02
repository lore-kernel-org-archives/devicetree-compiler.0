From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] fdt_get_phandle: Return invalid phandles as 0
Date: Tue, 2 Aug 2022 14:44:37 +0100
Message-ID: <20220802134437.b75rj4mjvhosvh36@google.com>
References: <20220801123134.1499236-1-ptosi@google.com>
 <YujId/uczDRrdJ9v@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=Hli2zsFl94IpHn53NUCjacIfJxJjgfUS0uLsiFRKioU=;
        b=lJKrFzeAI2t0xMfSw0GbVxzq558vUOBvssTXJ5DNX8tKUfpXJDO2kxON45gBG+wGqY
         sYIlJxrp/fIrbXs++zACzM1mK05uAErIe/GkL0oygmeKP+Kg2JvlEnImh1yUkkdIp4yW
         8KZ1TmYIZ/3EMtkgSQQ9FqHXqbUBRNtM4DhqCh/1yZ8Bt2HEPfYfqr10MDNcPL8ls+aX
         ZehIxhN1CVp9TFt9jI8kJ1f2IRgnxCbtRxj+/FRwjQSGlLoF2hsNZHm4GtbOni/bqGQO
         8qjZ9nix2c7NB9JPAuOzsndl1mph2uKtKIXPuY9KfILpCfX84bitbZbdDqYTlb84gciv
         458A==
Content-Disposition: inline
In-Reply-To: <YujId/uczDRrdJ9v@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Aug 02, 2022 at 04:47:19PM +1000, David Gibson wrote:
> On Mon, Aug 01, 2022 at 01:31:34PM +0100, Pierre-Clément Tosi wrote:
> > If a tree contains an invalid <u32> value as its <phandle> property,
> > mask it with '0' (invalid value) instead of returning it from
> > fdt_get_phandle().
> > 
> > Signed-off-by: Pierre-Clément Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> 
> Hm.. I don't really see the point of this.  Because FDT_MAX_PHANDLE is
> 0xfffffffe (-2), the only effect this has is to change 0xffffffff (-1)
> into 0 when returned.  Both are, indeed, invalid phandles, but they're
> sometimes used to mean slightly different things in incomplete trees,
> so it seems more useful to return these separately

I can see how returning the u32 as-is (without masking invalid values) can be
convenient in internal code giving a different meaning to the field as, in that
particular context, those "invalid" values actually become valid.

However, my worry is that, as this function is exposed by the library, client
code could rely on it and assume that any non-zero value it returns is valid:

    phandle = fdt_get_phandle(fdt, node);
    if (!phandle)
        /* handle error */
    /* (~0U) is considered valid! */

instead of the more verbose and less obvious

    if (!phandle || phandle == ~0U)
        /* handle error */

or (written to be robust against an evolving FDT_MAX_PHANDLE)

    if (!phandle || phandle > (uint32_t)FDT_MAX_PHANDLE)
        /* handle error */

leading to potential bugs.

To address your concern, if that extra meaning for phandles in incomplete trees
is only internal (not exposed out of libfdt), would it make sense to replace all
calls to fdt_get_phandle() by an internal function that behaves like
fdt_get_phandle() does today (returns the _actual_ phandle) and make
fdt_get_phandle() only return valid phandles?

Alternatively, libfdt could provide to its clients a function similar to
phandle_is_valid() (from dtc.h) and document in fdt_get_phandle() the need to
validate its result through that function? That wouldn't fix existing (buggy)
code but would at least make the API clearer.

Lastly, if none of the above can be implemented, the documentation of
fdt_get_phandle() should at least reflect the fact that its result, even if
non-zero, may not be a valid phandle.

> 
> > ---
> >  libfdt/fdt_ro.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index 9f6c551..7d1da6d 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -507,6 +507,7 @@ const void *fdt_getprop(const void *fdt, int nodeoffset,
> >  
> >  uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
> >  {
> > +	uint32_t phandle;
> >  	const fdt32_t *php;
> >  	int len;
> >  
> > @@ -519,7 +520,11 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
> >  			return 0;
> >  	}
> >  
> > -	return fdt32_ld_(php);
> > +	phandle = fdt32_ld_(php);
> > +	if (phandle > (uint32_t)FDT_MAX_PHANDLE)
> > +		phandle = 0;
> > +
> > +	return phandle;
> >  }
> >  
> >  const char *fdt_get_alias_namelen(const void *fdt,
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson



-- 
Pierre
