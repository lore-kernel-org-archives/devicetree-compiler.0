From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 2/5] annotations: Add position information to various
 calls
Date: Mon, 15 Jan 2018 10:28:38 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1801151026410.3305@hadrien>
References: <1515418607-26764-1-git-send-email-Julia.Lawall@lip6.fr> <1515418607-26764-3-git-send-email-Julia.Lawall@lip6.fr> <20180109111614.GL2131@umbus.fritz.box> <alpine.DEB.2.20.1801111614420.3390@hadrien> <20180115073609.GA26066@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180115073609.GA26066-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On Mon, 15 Jan 2018, David Gibson wrote:

> On Thu, Jan 11, 2018 at 04:21:44PM +0100, Julia Lawall wrote:
> > > > +	old_node->srcpos = srcpos_copy_all(new_node_begin_srcpos);
> > >
> > > This doesn't seem right.  Replacing the old position with the new
> > > makes sense for indivudal properties where the whole value is also
> > > replaced.  But for nodes we really need to track both locations.
> > >
> > > I think the extra complexity here is why I didn't add this tracking
> > > earlier.
> >
> > I have the following example:
> >
> > /dts-v1/;
> >
> > / {
> >         #address-cells = < 1 >;
> >         #size-cells = < 1 >;
> >
> >         tree_1: soc@0 {
> >         	reg = <0x0 0x0>;
> >         };
> >
> >         foo: foo_node {
> >                 prop_1: added-prop = <0x99>;
> >         };
> >
> >         bar_node {
> >                 added-prop = <0x77>;
> >         };
> >
> > };
> >
> > /include/ "test_b1.dts"
> > /include/ "test_c1.dts"
> >
> > -------------------
> >
> > Then test_b1.dts and test_c1.dts are both /include/ "test_d.dts".  And
> > test_d.dts is:
> >
> > / {
> >         foo_node {
> >                 added-prop = <0x1 0x2 0x3>;
> >         };
> >
> >         foo_node {
> >                 added-prop = <0x1 0x2 0x3>;
> >         };
> >
> >         bar: bar_node {
> >                 added-prop = <0x5>;
> >         };
> > };
> >
> > ----------
> >
> > The point of the example is that via the includes there are tw ways to
> > reach test_d.dts.
> >
> > Accordingly, by accumulating a list of positions in merge_nodes, I end up with:
> >
> > /dts-v1/;
> >
> > / { /* tests/test_d.dts:1, tests/test_d.dts:1, tests/test_a.dts:10 */
> > 	#address-cells = <0x1>; /* tests/test_a.dts:11 */
> > 	#size-cells = <0x1>; /* tests/test_a.dts:12 */
> >
> > 	tree_1: soc@0 { /* tests/test_a.dts:14 */
> > 		reg = <0x0 0x0>; /* tests/test_a.dts:15 */
> > 	}; /* tests/test_a.dts:16 */
> >
> > 	foo: foo_node { /* tests/test_d.dts:6, tests/test_d.dts:2, tests/test_d.dts:6, tests/test_d.dts:2, tests/test_a.dts:18 */
> > 		prop_1: added-prop = <0x1 0x2 0x3>; /* tests/test_d.dts:7 */
> > 	}; /* tests/test_d.dts:8, tests/test_d.dts:4, tests/test_d.dts:8, tests/test_d.dts:4, tests/test_a.dts:20 */
> >
> > 	bar: bar_node { /* tests/test_d.dts:10, tests/test_d.dts:10, tests/test_a.dts:22 */
> > 		added-prop = <0x5>; /* tests/test_d.dts:11 */
> > 	}; /* tests/test_d.dts:12, tests/test_d.dts:12, tests/test_a.dts:24 */
> > }; /* tests/test_d.dts:13, tests/test_d.dts:13, tests/test_a.dts:26 */
> >
> > --------
> >
> > For example, in the last line, we see tests/test_d.dts:13 twice, because it
> > is merged in twice.  Is this what is wanted?  Should it be there only once?
> > Should there be some indication on how tests/test_d.dts:13 is reached?
> > This is a fake example, but I saw some examples with duplicated positions
> > in the Linux kernel code.
>
> Right, that's ugly, but it's not that easy to fix.  Really we'd need
> to merge/overlap each element in the list to accumulate them.  Going
> back to the original proposal isn't a solution though because of cases
> like this, which will be much more common that duplicated includes:
>
> / {
> 	foo {
> 		compatible = "...";
> 		reg = < .. >;
> 		ranges = < ... >;
> 		lots = ...;
> 		of = ...;
> 		other = ...;
> 		properties = ...;
> 	};
> }
>
> &{/foo} {
> 	one-tiny-change = "yes";
> };
>
> The original proposal would annotate the output with *only* the
> location of the one-tiny-change, which is extremely misleading.  Much
> worse than duplicated locations.

It's only the label on the braces that is affected.  compatible, reg, etc
should still have their original locations.

I can remove the duplicates, if that would be beneficial.

julia

>
> --
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
>
