From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Wed, 14 May 2014 15:23:58 +1000
Message-ID: <1400045038.17624.239.camel@pasglop>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
	 <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
	 <20140512060000.GA28789@voom> <1399875002.17624.89.camel@pasglop>
	 <20140514041849.GC28789@voom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140514041849.GC28789@voom>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

On Wed, 2014-05-14 at 14:18 +1000, David Gibson wrote:
> I supposed it's arguable that a PCI ranges property really should have
> windows for both prefetchable and non-prefetchable areas, but since
> that's not done in practice, it's pretty much moot.

They don't have to, only if there's a relevant difference, ie it's
perfectly legit for a firmware to assign prefetchable BARs in a
non-prefetchable region.

Now granted, those are somewhat special cases so maybe we should
do just that ... special case PCI and try to not continue that mess
with new bindings.

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
