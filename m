From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 1/5] annotations: Check for NULL pos
Date: Tue, 9 Jan 2018 11:32:10 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801091131000.3301@hadrien>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr> <1515418607-26764-2-git-send-email-Julia.Lawall@lip6.fr> <20180109100400.GK2131@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109100400.GK2131-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Tue, 9 Jan 2018, David Gibson wrote:

> On Mon, Jan 08, 2018 at 02:36:43PM +0100, Julia Lawall wrote:
> > Check for NULL position and file name.  Check for xasprintf failure.
> > Builds on a patch proposed by Frank Rowand:
> >
> > https://www.mail-archive.com/devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg00377.html
> >
> > Annotation extension will introduce the possibility of the position
> > being NULL.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> > ---
> >  srcpos.c | 35 +++++++++++++++++++++++------------
> >  1 file changed, 23 insertions(+), 12 deletions(-)
> >
> > diff --git a/srcpos.c b/srcpos.c
> > index 9d38459..7f2626c 100644
> > --- a/srcpos.c
> > +++ b/srcpos.c
> > @@ -249,24 +249,35 @@ srcpos_copy(struct srcpos *pos)
> >  char *
> >  srcpos_string(struct srcpos *pos)
> >  {
> > -	const char *fname = "<no-file>";
> > +	const char *fname;
> >  	char *pos_str;
> > -
> > -	if (pos->file && pos->file->name)
> > +	int rc;
> > +
> > +	if (!pos) {
> > +		rc = asprintf(&pos_str, "%s:<no-line>", fname);
>
> Uh.. you've removed the initializer of fname, so this branch will use
> it uninitialized, no?

Oops, not sure why that looked like a good idea.

>
> > +		goto out;
> > +        } else if (!pos->file)
>
> I prefer to keep braces on all branches if they're present on any
> branch.

OK.

>
> > +		fname = "<no-file>";
> > +	else if (!pos->file->name)
> > +		fname = "<no-filename>";
> > +	else
> >  		fname = pos->file->name;
> >
> > -
> >  	if (pos->first_line != pos->last_line)
> > -		xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
> > -			  pos->first_line, pos->first_column,
> > -			  pos->last_line, pos->last_column);
> > +		rc = xasprintf(&pos_str, "%s:%d.%d-%d.%d", fname,
> > +			       pos->first_line, pos->first_column,
> > +			       pos->last_line, pos->last_column);
> >  	else if (pos->first_column != pos->last_column)
> > -		xasprintf(&pos_str, "%s:%d.%d-%d", fname,
> > -			  pos->first_line, pos->first_column,
> > -			  pos->last_column);
> > +		rc = xasprintf(&pos_str, "%s:%d.%d-%d", fname,
> > +			       pos->first_line, pos->first_column,
> > +			       pos->last_column);
> >  	else
> > -		xasprintf(&pos_str, "%s:%d.%d", fname,
> > -			  pos->first_line, pos->first_column);
> > +		rc = xasprintf(&pos_str, "%s:%d.%d", fname,
> > +			       pos->first_line, pos->first_column);
> > +
> > +out:
> > +	if (rc == -1)
> > +		die("Couldn't allocate in srcpos string");
>
> You shouldn't need this - xasprintf() will already abort on allocation
> failure, that's the whole point of it.

OK, I'll drop it.

Thanks for the feedback.  I'll try to send a new version later today.

julia

> >  	return pos_str;
> >  }
>
> --
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
>
