From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: libfdt / fdt_check_node_offset_ with VALID_INPUT
Date: Tue, 18 Aug 2020 10:19:37 -0600
Message-ID: <CAL_JsqLAWa-wMMiD=VffemMiqAv-3=GNehNojWrFQqED_+QDow@mail.gmail.com>
References: <34725235.0rVAnNm8GT@noys4> <20200813070945.GD17532@yekko.fritz.box>
 <1846921.vbHbvM2az7@noys4>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597767589;
        bh=x8XS+cHayjlITkqR37Rk493cvtq/a0yJaHpSYLRzZJg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CL0AFEwV22sKR5jLVEKJY1JZ6AlHOm/sYF8Hl+lVF4d6F/gpKaJAZu8peP8Z9Zsvn
         h8D9PkqcFPZQLCvFSnZFOiCt+mKGN8YXfvr6Ln6b4qVlXsWjA/N5zdEPrJpVtbD58M
         pWkyuuajH34FqK4V/t2Pdj++SvLvWzXYz9mcUB/M=
In-Reply-To: <1846921.vbHbvM2az7@noys4>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Aug 13, 2020 at 2:06 AM Frank Mehnert
<frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org> wrote:
>
> Hi David,
>
> On Donnerstag, 13. August 2020 09:09:45 CEST David Gibson wrote:
> > On Wed, Aug 12, 2020 at 05:48:56PM +0200, Frank Mehnert wrote:
> > > Hi all,
> > >
> > > I'm not sure if I found a bug or if I mis-use libfdt.
> > >
> > > I have a valid Linux device tree in memory and want to recursively scan
> > > thru it. The device tree contains a root node and several subnodes.
> > >
> > > First, I start with the root node:
> > >   int root = fdt_next_node(fdt, -1, NULL);
> >
> > Tangential aside: the offset of the root node is *always* 0, you don't
> > need to "find" it with code like this.
> >
> > > Here, root is set to 0. Now I determine the offset of the first sub node:
> > >   int subnode = fdt_first_subnode(fdt, root);
> > >
> > > Here, subnode is either 0 if FDT_ASSUME_MASK contains ASSUME_VALID_INPUT
> > > or 164 (in my case) if FDT_ASSUME_MASK does not contain
> > > ASSUME_VALID_INPUT.
> >
> > That certainly sounds like a bug.  Adding things to FDT_ASSUME_MASK
> > shouldn't change behaviour for valid inputs.
> >
> > > As far as I understand, fdt_first_subnode() should not return the node
> > > offset of the current node if there are subnodes available.
> >
> > That's correct.
> >
> > > I think the problem origins at fdt_check_node_offset_() in fdt.c: If
> > > VALID_INPUT is set, the whole code in that function is skipped. If that
> > > flag is not set then fdt_next_tag(fdt, offset, &offset) is called and
> > > the resulting 'offset' is returned.
> > >
> > > In other words, fdt_check_node_offset_() has a side effect which depends
> > > on the VALID_INPUT flag.
> >
> > Right.  Looks like the problem is that the next if *looks* like just
> > an error/sanity check, which can_assume(VALID_INPUT) is bypassing.
> > However, it also has the fdt_next_tag() call which alters offset.
> >
> > I was afraid of this sort of thing when we added the assumptions
> > stuff.  Really we need to be running the testsuite with different
> > assumptions masks, but it's fiddly to do.
>
> Thank you for these explanations!
>
> > Care to send a patch?
>
> Done in a separate e-mail. Please forgive me if the format is not
> 100% correct.
>
> > [Another aside: why are you using ASSUME_VALID_INPUT - it's really
> > only of value if you have to run your code in an *extremely* space
> > limited environment, I don't recommend it as a rule]
>
> Actually we are using libfdt for parsing and altering the device tree
> before starting a Linux guest in a virtual machine. The setup is kind
> of static, that is, we can assume that the device tree is valid for
> the setup.
>
> Parsing and altering the device tree is part of the setup boot time
> which we need to keep low. Therefore I investigated several approaches
> to speed up parsing and to prevent expensive operations.
>
> I'm completely aware that libfdt is not made for benchmarks and in
> time-critical scenarios it would be probably better to read the device
> tree, create an internal tree representation in memory of it, then
> do the required modifications and finally create a new device tree
> from memory and use that blob for the guest.
>
> However, so far we didn't want to take the effort of such a project,
> because that also requires test cases and proves of correctness.

FYI, there's been some related discussions related to this (mostly at
past Linux Plumbers). One idea is to extend the FDT format to append
overlays rather than applying them in place to the FDT (which is
probably also slow). Then the overlays can be applied later in boot on
an unflattened tree. The other is creating a 'libdt' as a common API
to work on unflattened DTs. dtc has its own unflattened representation
and so does the Linux kernel. Both implementations would need
relicensing as we'd want it dual licensed. The kernel one is more
featureful, but the dtc one would be easier to relicense.

Rob
