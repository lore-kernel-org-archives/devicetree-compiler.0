From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH] srcpos: correct column numbers
Date: Fri, 19 Jan 2018 06:59:48 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801190659220.3505@hadrien>
References: <alpine.DEB.2.20.1801151932100.25462@hadrien> <4eec9dbb-c047-86ae-e4b2-08de9f0499fe@gmail.com> <alpine.DEB.2.20.1801160707350.2617@hadrien> <20180118042202.GI30352@umbus.fritz.box> <alpine.DEB.2.20.1801180556230.2995@hadrien>
 <20180118070123.GV30352@umbus.fritz.box> <alpine.DEB.2.20.1801181111390.3589@hadrien> <20180119054454.GA28299@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180119054454.GA28299-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Fri, 19 Jan 2018, David Gibson wrote:

> On Thu, Jan 18, 2018 at 11:12:16AM +0100, Julia Lawall wrote:
> >
> >
> > On Thu, 18 Jan 2018, David Gibson wrote:
> >
> > > On Thu, Jan 18, 2018 at 06:15:47AM +0100, Julia Lawall wrote:
> > > >
> > > >
> > > > On Thu, 18 Jan 2018, David Gibson wrote:
> > > >
> > > > > On Tue, Jan 16, 2018 at 07:10:23AM +0100, Julia Lawall wrote:
> > > > > >
> > > > > >
> > > > > > On Mon, 15 Jan 2018, Frank Rowand wrote:
> > > > > >
> > > > > > > On 01/15/18 10:33, Julia Lawall wrote:
> > > > > > > > The start of a line is column 0, at least according to emacs.
> > > > > > >
> > > > > > > According to vim, the first character of a line is column 1.  I don't know
> > > > > > > if it has a concept of column 0, to the left of that character.
> > > > > > >
> > > > > > > $ vim --version
> > > > > > > VIM - Vi IMproved 7.4
> > > > > > >
> > > > > > > Let the editor wars begin.... :-)
> > > > > > >
> > > > > > > Personally, I use vim, but if the dtc column numbers match emac's world view
> > > > > > > instead of vim's, that is fine with me.
> > > > > >
> > > > > > At the start of a line, ie just after a \n, there has been no character.
> > > > > > This change made the column numbers work for me in the annotations.
> > > > > >
> > > > > > There is also the issue of tabs.  David wanted tabs to count as 8
> > > > > > characters, but actually cpp converts tabs to spaces.  So if a dts file
> > > > > > has been through cpp, the numbers will be smaller.  So it could be better
> > > > > > to consider tabs to be 1 character, to not have to think about what kind
> > > > > > of include was used.
> > > > >
> > > > > Urgh.. debating which editor to match sounds like it's going to be a
> > > > > rathole.
> > > > >
> > > > > Let's try a different approach: does gcc ever report column numbers?
> > > > > If so, what's its interpretation?
> > > >
> > > > Chosen at random, I have the following error:
> > > >
> > > > drivers/thermal/kirkwood_thermal.c:88:15: warning: assignment makes
> > > > pointer from
> > > >  integer without a cast [enabled by default]
> > > >   priv->sensor = devm_request_and_ioremap(&pdev->dev, res);
> > > >
> > > > and the following code:
> > > >
> > > > 	priv->sensor = devm_request_and_ioremap(&pdev->dev, res);
> > > >
> > > > In emacs, the go to the line and type control f 15 times solution puts the
> > > > cursor right afher after the =.  The column numbers of emacs report 22 for
> > > > that position.  I guess in vim, putting the cursor right on the = would
> > > > report 15.
> > > >
> > > > When I run the dts compiler on tests/test_tree1.dts, for line 39:
> > > >
> > > >
> > > >                         compatible = "subsubnode2", "subsubnode";
> > > >
> > > > I get the start and end as 24 and 65.  24 is what emacs shows as the
> > > > column number when I put the cursor right on the c.  65 is what the column
> > > > number shows when I put the cursor right past the semicolon.
> > > >
> > > > I tried to move around in vim, but I don't know how it works.  It seems to
> > > > report the position of the c as 4 or 25.  It seems to report the position
> > > > of the final semicolon as 44 or 65.  I am not sure how it work though,
> > > > because it gives the impression that there is a single blank character
> > > > before c, which is not the case.
> > >
> > > Ok, let's go with the gcc definition, which appears to be "# of bytes
> > > past the last \n".
> >
> > So that would be the strategy of the patch, where seeing a newline sets
> > the counter to 0.
>
> Right, but we should kill the tab expansion stuff at the same time.

OK, I'll do that.

julia
