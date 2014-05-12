From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] libfdt: add address translation support
Date: Tue, 13 May 2014 08:01:05 +1000
Message-ID: <1399932065.17624.139.camel@pasglop>
References: <1396371463-7516-1-git-send-email-robherring2@gmail.com>
	 <CACxGe6uPerPT_cT+p1zvL20ERwuguDJWDHasxz5gAUe5kPQHNg@mail.gmail.com>
	 <20140512060000.GA28789@voom> <1399875002.17624.89.camel@pasglop>
	 <CAL_Jsq+zi72PAjQ+RGvUddLtHocgphPQQ9x2X0S0dYGOKz+Hgg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+zi72PAjQ+RGvUddLtHocgphPQQ9x2X0S0dYGOKz+Hgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

On Mon, 2014-05-12 at 14:27 -0500, Rob Herring wrote:
> But what you wrote was for unflattened tree. For early FDT uses, do we
> really need to worry about PCI or other special cases? The current FDT
> address translation code in arch/powerpc/boot/devtree.c (yes, now we
> have 3 implementations) does not for example.

This is specific to a bootloader case yes and it's ... fishy.

PCI on ARM is here now. PCI is everywhere (well, pseudo-PCI but that's
the basic issue here) on Intel embedded.

Some embedded systems will probably want to enumerate from the firmware
and Linux will need to translate. For example because the UART or some
critical GPIO that needs to be handled early on is behind a pseudo-PCI
interface of some sort.

I think we need to handle these cases rather than fail in obscure ways.

Cheers,
Ben.

 

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
