From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 2/3 v3] annotations: add positions
Date: Sat, 27 Jan 2018 18:53:24 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801271848180.3593@hadrien>
References: <1516746091-28522-1-git-send-email-Julia.Lawall@lip6.fr> <1516746091-28522-3-git-send-email-Julia.Lawall@lip6.fr> <20180127100928.GD12900@umbus>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180127100928.GD12900@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

> > +struct srcpos *srcpos_extend(struct srcpos *pos, struct srcpos *newtail)
> > +{
> > +	struct srcpos *next, *p;
> > +
> > +	if (!pos)
> > +		return newtail;
>
> I'm having a lot of trouble following this.  You've got both a
> recursion and a loop through the list, so you seem to have an O(n^2)
> with multiple redundant checks.
>
> > +
> > +	next = srcpos_extend(pos->next, newtail);
> > +
> > +	for (p = next; p != NULL; p = p->next)
> > +		if (same_pos(pos, p))
> > +			return next;
> > +
> > +	pos = srcpos_copy(pos);
>
> And while I'm not *that* fussed by memory leaks, I have a nasty
> feeling this will leak stuff at every level of the recursion, which is
> a bit much.
>
> > +	pos->next = next;
> > +	return pos;
> > +}

It copies the first list and puts the second list at the end of it.  The
inner for loop checks that the current element in the first list is not
found in the rest of the constructed list.  It should be posssible to
replace:

for (p = next; p != NULL; p = p->next)

by

for (p = newtail; p != NULL; p = p->next)

since the original lists should not have duplicates.

Just overwriting the next field at the end of the first list to point to
the second list creates infinite loops.

julia
