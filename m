From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: columns
Date: Mon, 8 Jan 2018 07:24:43 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801080722520.2754@hadrien>
References: <alpine.DEB.2.20.1801061739130.2579@hadrien> <20180108061233.GB2131@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180108061233.GB2131-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Mon, 8 Jan 2018, David Gibson wrote:

> On Sat, Jan 06, 2018 at 05:43:20PM +0100, Julia Lawall wrote:
> > Hello,
> >
> > I have been working with Frank Rowand on a v7 of file and line number
> > annotations in the -O dts output of the device tree compiler.
> >
> > I wanted to make an --annotate-full option that would print the full
> > filename, and starting and ending line and column numbers.
> >
> > The following commit:
> >
> > commit 728c5e87c655c17c2fbc1d5386b12ff328e0fc76
> > Author: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > Date:   Tue Dec 8 14:24:42 2009 +1100
> >
> > extends the position mechanism with columns, but considers a tab to be 8
> > column.  Would it be ok to drop this feature?  I have the impression that
> > counting 1 column for a tab would be more useful for actually finding the
> > referenced code.
>
> Hrm.  I set it up that way initially so that the reported columns
> would match what shows up inside an editor (e.g. emacs
> 'column-number-mode').
>
> So, I think I'll need to see a more developed case for why not
> expanding tabs this way is preferable before making the change.

OK, my emacs doesn't show column numbers.  I make a macro that moves
forward one space, and run that macro, eg 28 times, which ends up in the
wrong place.  But if you prefer tabs to count as 8, I can leave it as it
is.

julia
