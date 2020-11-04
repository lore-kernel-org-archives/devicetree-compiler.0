From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Make fdt{32,64}_ld() default to assuming
 unaligned access is safe
Date: Wed, 4 Nov 2020 12:34:55 -0500
Message-ID: <20201104173455.GX5340@bill-the-cat>
References: <20201104134645.30138-1-trini@konsulko.com>
 <CAL_JsqL30DTr4reQ0r98Z7vO6CNaKZPFNWMYzDVN+QPzUq3APw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sTRZlgOVJX3MDkMqhwMOnFj+bt6LjO7Y1JoKdHi8OyA=;
        b=WA5R7vmEXZddY+I3InhcnqX9hiMeh5NQf8oWNBUsSkVDBrFSdMpeyuaEi6+7Q06c+F
         WvJJP6aeivfKhh0YCV61F6cVVV7gtb462FwIDWPAMVnGI064cNKTAR5cc/xzJJYidBze
         aes+SrhHuIpQ5lgHf9R0f2dyVkLD//XhpGnto=
Content-Disposition: inline
In-Reply-To: <CAL_JsqL30DTr4reQ0r98Z7vO6CNaKZPFNWMYzDVN+QPzUq3APw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Wed, Nov 04, 2020 at 11:29:28AM -0600, Rob Herring wrote:
> On Wed, Nov 4, 2020 at 7:46 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >
> > Commits 6dcb8ba4 "libfdt: Add helpers for accessing unaligned words"
> > introduced changes to support unaligned reads for ARM platforms and
> > 11738cf01f15 "libfdt: Don't use memcpy to handle unaligned reads on ARM"
> > improved the performance of these helpers.
> >
> > On further discussion, while there are potential cases where we could be
> > used on platforms that do not fixup unaligned reads for us, making this
> > choice the default is very expensive in terms of binary size and access
> > time.  To address this, suffix the existing fdt{32,64}_ld functions with
> > _unaligned and introduce new load functions that call
> > fdt{32,64}_to_cpu() as was done prior to the above mentioned commits.
> >
> > Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  libfdt/libfdt.h | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index b600c8d6dd41..307ba745c92f 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -126,13 +126,22 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
> >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> >
> >  /*
> > - * Alignment helpers:
> > - *     These helpers access words from a device tree blob.  They're
> > - *     built to work even with unaligned pointers on platforms (ike
> > - *     ARM) that don't like unaligned loads and stores
> > + * Load functions.  Assume that we are on a platform where unaligned memory
> > + * reads will be handled in a graceful manner and that we do not need to ensure
> > + * our reads are aligned.  If this is not the case there are _unaligned
> > + * versions of these functions that follow and can be used.
> >   */
> > -
> >  static inline uint32_t fdt32_ld(const fdt32_t *p)
> > +{
> > +       return fdt32_to_cpu(*p);
> 
> This changes the public behavior of fdt32_ld() which is one of the
> things David was against.
> 
> I think we want a _fdt32_ld or fdt32_ld_internal or ?? which is
> internal only and doesn't create another ABI.

I thought it was minimal code change?  But anyhow, yes, I can easily
respin things.  Should I do that now or wait for David's comments?

-- 
Tom
