From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] libfdt: place new nodes & properties after the parent's ones
Date: Tue, 11 Feb 2020 14:29:22 -0600
Message-ID: <CAL_JsqJLLWnx-K9T5wv_i+FnPwbWpfak4RD_9P1Xz_2-XkYncA@mail.gmail.com>
References: <CGME20200204125854eucas1p19ace564a5f45b9231e0fba8af07009cd@eucas1p1.samsung.com>
 <20200204125844.19955-1-m.szyprowski@samsung.com> <20200205054508.GG60221@umbus.fritz.box>
 <bc380fd8-71bb-897e-f060-b51386dec9be@samsung.com> <20200210234406.GH22584@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581452975;
        bh=050Spu/rOU3M2mOId8IXyEhwRlEOjhxlUycw+DTlrAU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LefOiRP31zOt17a/0mZeErAs3SLjX6rxUajiE6zk+ZHw5rNpW0kPYozl2m3vp2OvQ
         HTUuTEX4/6m9nO8mHTctSbXZ+j7kHj5fdynX4FmZfVJsBmiKpM6eIPUkSXdnnXoY6H
         o3er5cfpYWlylCbvpwchBWOog+/g/IfGeFIzw2Ro=
In-Reply-To: <20200210234406.GH22584-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

On Mon, Feb 10, 2020 at 5:44 PM David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>
> On Mon, Feb 10, 2020 at 12:40:19PM +0100, Marek Szyprowski wrote:
> > Hi David,
> >
> > On 05.02.2020 06:45, David Gibson wrote:
> > > On Tue, Feb 04, 2020 at 01:58:44PM +0100, Marek Szyprowski wrote:
> > >> While applying dt-overlays using libfdt code, the order of the applied
> > >> properties and sub-nodes is reversed. This should not be a problem in
> > >> ideal world (mainline), but this matters for some vendor specific/custom
> > >> dtb files. This can be easily fixed by the little change to libfdt code:
> > >> any new properties and sub-nodes should be added after the parent's node
> > >> properties and subnodes.
> > >>
> > >> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > I'm not convinced this is a good idea.
> > >
> > > First, anything that relies on the order of properties or subnodes in
> > > a dtb is deeply, fundamentally broken.  That can't even really be a
> > > problem with a dtb file itself, only with the code processing it.
> >
> > I agree about the properties, but generally the order of nodes usually
> > implies the order of creation of some devices or objects.
>
> Huh?  From the device tree client's point of view the devices just
> exist - the order of creation should not be visible to it.

I'm not sure if downstream is different, but upstream this stems from
Linux initcalls being processed in link order within a given level.
It's much better than it used to be, but short of randomizing the
ordering, I'm not sure we'll ever find and fix all these hidden
dependencies.

> > This sometimes
> > has some side-effects.
>
> If those side effects matter, your code is broken.  If you need to
> apply an order to nodes, you should be looking at 'reg' or other
> properties.

The general preference is to sort by 'reg'. And we try to catch and
reject any node re-ordering patches.

Rob
