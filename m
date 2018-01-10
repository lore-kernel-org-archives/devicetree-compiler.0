From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Wed, 10 Jan 2018 07:34:42 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801100732290.2157@hadrien>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr> <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr> <20180109111614.GL2131@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109111614.GL2131-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> >  			add_child(old_node, new_child);
> >  	}
> >
> > +	old_node->srcpos = srcpos_copy_all(new_node_begin_srcpos);
>
> This doesn't seem right.  Replacing the old position with the new
> makes sense for indivudal properties where the whole value is also
> replaced.  But for nodes we really need to track both locations.
>
> I think the extra complexity here is why I didn't add this tracking
> earlier.

I've added a next field to be able to make a list of positions.  Here, I
append the lists, with the new ones at the front.

julia
