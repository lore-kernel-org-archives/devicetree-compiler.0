From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 3/8] fdtget: Fix signedness comparisons warnings
Date: Tue, 15 Jun 2021 22:51:33 +0100
Message-ID: <20210615225133.4a597e7d@slackpad.fritz.box>
References: <20210611171040.25524-1-andre.przywara@arm.com>
        <20210611171040.25524-4-andre.przywara@arm.com>
        <YMgUKtrYpxG8jADT@yekko>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <YMgUKtrYpxG8jADT@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

On Tue, 15 Jun 2021 12:44:58 +1000
David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:

Hi,

> On Fri, Jun 11, 2021 at 06:10:35PM +0100, Andre Przywara wrote:
> > With -Wsign-compare, compilers warn about a mismatching signedness in
> > the different legs of the conditional operator, in fdtget.c.
> > 
> > In the questionable expression, we are constructing a 16-bit value out of
> > two unsigned 8-bit values, however are relying on the compiler's
> > automatic expansion of the uint8_t to a larger type, to survive the left
> > shift. This larger type happens to be an "int", so this part of the
> > expression becomes signed.
> > 
> > Fix this by explicitly blowing up the uint8_t to a larger *unsigned* type,
> > before doing the left shift. And while we are at it, convert the hardly
> > readable conditional operator usage into a sane switch/case expression.
> > 
> > This fixes "make fdtget", when compiled with -Wsign-compare.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>  
> 
> Hmm... this code is pretty confusing.  I can't actually see any path
> where size will be set to something other than 4, 1 or -1.

If I read correctly, then size==2 could come from the format modifier
"h", as parsed by utilfdt_decode_type().
 
> The change looks correct, despite that.  Though I wonder if we should
> add an fdt16_ld() helper for this case.

Done.

Cheers,
Andre

> 
> > ---
> >  fdtget.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fdtget.c b/fdtget.c
> > index 777582e..1f6eb73 100644
> > --- a/fdtget.c
> > +++ b/fdtget.c
> > @@ -62,8 +62,14 @@ static int show_cell_list(struct display_info *disp, const char *data, int len,
> >  	for (i = 0; i < len; i += size, p += size) {
> >  		if (i)
> >  			printf(" ");
> > -		value = size == 4 ? fdt32_ld((const fdt32_t *)p) :
> > -			size == 2 ? (*p << 8) | p[1] : *p;
> > +		switch (size) {
> > +		case 4: value = fdt32_ld((const fdt32_t *)p); break;
> > +		case 2: value = ((unsigned)(*p) << 8) | p[1]; break;
> > +		case 1:
> > +		default:
> > +			value = *p;
> > +			break;
> > +		}
> >  		printf(fmt, value);
> >  	}
> >    
> 

