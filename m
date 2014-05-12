From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Mon, 12 May 2014 16:14:12 +1000
Message-ID: <1399875252.17624.93.camel@pasglop>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
	 <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
	 <20140512060000.GA28789@voom> <1399875002.17624.89.camel@pasglop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399875002.17624.89.camel@pasglop>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

On Mon, 2014-05-12 at 16:10 +1000, Benjamin Herrenschmidt wrote:
> On Mon, 2014-05-12 at 16:00 +1000, David Gibson wrote:
> > I'm not all that impressed by this translation code - in particular
> > the per-bus-type hooks don't make sense to me.  AFAIK the
> > interpretation of ranges is not bus specific. I think it will also
> > fail in some cases with #address-cells > 2, which is unfortunate.
> > 
> > I'm about to post my own implementation of address translation.
> 
> Well, I came up with the original code which did per-bus type hooks.
> There are cases where it is needed.
> 
> Take PCI. The top word can contain completely unrelated stuff such
> as the "prefetchable" attribute.
> 
> It's perfectly legal to put a prefetchable BAR under a non-prefetchable
> bridge window.
> 
> However a translation scheme that doesn't know to know that bit
> will fail.

Oh and the other way around with IO vs. memory btw.

> It's not far fetched, it happens on our machines today.
> 
> And that's just one of the problems I had back then...

Note that I'm just stating the problem :-) There may be a better way to
address it. For example, for the one above specifically, well, we could
have a per-bus-type list of masks to apply before translation (bits to
ignore).

I wish in fact OF had done that to begin with like we have
interrupt-map-mask, maybe we should introduce that concept to limit the
damage to existing well known cases like PCI and have anything new just
tell us what to use for the compare.

In fact, thinking more, the above mask trick might not fully work for
PCI, we have to check the exact values, because I think the same field
somewhat use an enumeration for 32-bit MEM, 64-bit MEM and IO ... oh
well.

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
