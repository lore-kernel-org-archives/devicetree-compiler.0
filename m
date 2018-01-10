From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Wed, 10 Jan 2018 07:26:40 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801100726280.2157@hadrien>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr> <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr> <20180109111614.GL2131@umbus.fritz.box> <alpine.DEB.2.20.1801091321030.3301@hadrien> <20180110053255.GE19773@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110053255.GE19773-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Wed, 10 Jan 2018, David Gibson wrote:

> On Tue, Jan 09, 2018 at 01:27:48PM +0100, Julia Lawall wrote:
> > > > +struct srcpos *
> > > > +srcpos_copy_all(struct srcpos *pos)
> > > > +{
> > > > +	struct srcpos *pos_new;
> > > > +	struct srcfile_state *srcfile_state;
> > > > +
> > > > +	if (!pos)
> > > > +		return NULL;
> > > > +
> > > > +	pos_new = srcpos_copy(pos);
> > > > +
> > > > +	if (pos_new) {
> > > > +		/* allocate without free */
> > > > +		srcfile_state = xmalloc(sizeof(struct srcfile_state));
> > > > +		memcpy(srcfile_state, pos->file, sizeof(struct srcfile_state));
> > > > +
> > > > +		pos_new->file = srcfile_state;
> > > > +	}
> > > > +
> > > > +	return pos_new;
> > > > +}
> > >
> > > I don't really see a reason we'd need both a deep and a shallow copy.
> > > If you need a deep copy, I'd suggest just changing srcpos_copy() to do
> > > that.
> >
> > The deep copy is needed due to the treatment of #includes.  The following
> > function overwrites the file name information:
> >
> > void srcpos_set_line(char *f, int l)
> > {
> >         current_srcfile->name = f;
> >         current_srcfile->lineno = l;
> > }
> >
> > srcpos_combine doesn't need to use the deep copy, because the result gets
> > copied again.  Maybe this is not a big issue or there is a better way to
> > solve this.
>
> Well, dtbs are generally so small that performance really isn't an
> issue for dtc.  So I think simplifying the code to only have one
> (deep) copy routine is worth more than the minor speedup from avoiding
> deep copies in some places they're not necessary.

OK, I will do this.

julia
