From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH] srcpos: correct column numbers
Date: Tue, 16 Jan 2018 07:10:23 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801160707350.2617@hadrien>
References: <alpine.DEB.2.20.1801151932100.25462@hadrien> <4eec9dbb-c047-86ae-e4b2-08de9f0499fe@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4eec9dbb-c047-86ae-e4b2-08de9f0499fe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Mon, 15 Jan 2018, Frank Rowand wrote:

> On 01/15/18 10:33, Julia Lawall wrote:
> > The start of a line is column 0, at least according to emacs.
>
> According to vim, the first character of a line is column 1.  I don't know
> if it has a concept of column 0, to the left of that character.
>
> $ vim --version
> VIM - Vi IMproved 7.4
>
> Let the editor wars begin.... :-)
>
> Personally, I use vim, but if the dtc column numbers match emac's world view
> instead of vim's, that is fine with me.

At the start of a line, ie just after a \n, there has been no character.
This change made the column numbers work for me in the annotations.

There is also the issue of tabs.  David wanted tabs to count as 8
characters, but actually cpp converts tabs to spaces.  So if a dts file
has been through cpp, the numbers will be smaller.  So it could be better
to consider tabs to be 1 character, to not have to think about what kind
of include was used.

julia

>
> -Frank
>
> >
> > Every character counts, so need to increment by 1 before adjusting for tab.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> > ---
> >  srcpos.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/srcpos.c b/srcpos.c
> > index 9d38459..e8fced9 100644
> > --- a/srcpos.c
> > +++ b/srcpos.c
> > @@ -154,7 +154,7 @@ void srcfile_push(const char *fname)
> >  	srcfile->prev = current_srcfile;
> >
> >  	srcfile->lineno = 1;
> > -	srcfile->colno = 1;
> > +	srcfile->colno = 0;
> >
> >  	current_srcfile = srcfile;
> >  }
> > @@ -223,8 +223,9 @@ void srcpos_update(struct srcpos *pos, const char *text, int len)
> >  	for (i = 0; i < len; i++)
> >  		if (text[i] == '\n') {
> >  			current_srcfile->lineno++;
> > -			current_srcfile->colno = 1;
> > +			current_srcfile->colno = 0;
> >  		} else if (text[i] == '\t') {
> > +			current_srcfile->colno++;
> >  			current_srcfile->colno =
> >  				ALIGN(current_srcfile->colno, TAB_SIZE);
> >  		} else {
> >
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
