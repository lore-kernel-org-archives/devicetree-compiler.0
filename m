From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 3/3 v2] annotations: add the annotation functionality
Date: Wed, 17 Jan 2018 06:50:47 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801170649340.3333@hadrien>
References: <1516040650-9848-1-git-send-email-Julia.Lawall@lip6.fr> <1516040650-9848-4-git-send-email-Julia.Lawall@lip6.fr> <20180117011322.GW30352@umbus.fritz.box> <4f3eda57-e50b-922b-0b02-d5859aedda71@gmail.com>
 <3ba34256-9442-5177-90db-0a180728e05b@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3ba34256-9442-5177-90db-0a180728e05b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>



On Tue, 16 Jan 2018, Frank Rowand wrote:

> Hi Julia,
>
> When I was creating the sample output for this reply to David,
> I noticed that the --annotate-full annotation for the dtc
> generated content (eg the phandle properties) are reporting
> "/* <no-file>:<no-line> */".  Did you intend to remove this,
> as you did for the --annotate-full case?

From what you say, it is done backwards.  --annotate-full was intended to
say no file no line and --annotate was supposed to put nothing at all.

julia

> -Frank
>
>
> On 01/16/18 20:13, Frank Rowand wrote:
> > On 01/16/18 17:13, David Gibson wrote:
> >> On Mon, Jan 15, 2018 at 07:24:10PM +0100, Julia Lawall wrote:
> >>> This commit provides two new command-line options:
> >>>
> >>> --annotate (abbreviated -T)
> >>> --annotate-full (abbreviated -F)
> >>
> >> What's the rationale for having two different versions of the
> >> annotations?
> >
> > I'll put an example to try to explain, at the end of this email.
> >
>
> < snip >
>
