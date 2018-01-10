From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 1/5] annotations: Check for NULL pos
Date: Wed, 10 Jan 2018 07:29:46 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801100729240.2157@hadrien>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr> <1515418607-26764-2-git-send-email-Julia.Lawall@lip6.fr> <d7cae26a-a92f-6a39-61ca-05fee9509722@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d7cae26a-a92f-6a39-61ca-05fee9509722-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Tue, 9 Jan 2018, Frank Rowand wrote:

> On 01/08/18 05:36, Julia Lawall wrote:
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
> > +		goto out;
> > +        } else if (!pos->file)
>    ^^^^^^^^
>     spaces instead of a tab

Thanks.  This code is different now.

julia

>
> -Frank
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
> >
> >  	return pos_str;
> >  }
> >
>
>
