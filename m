From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base
 fdt
Date: Thu, 4 Jan 2018 19:14:05 -0800
Message-ID: <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com>
 <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com>
 <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sIXX7t48h7fxlBRurRYa0h5s+Js/Y1nipiJaoAr8RNE=;
        b=pbg65yAMtJKVUof30NjVcv4kks5iKFiDAm2fugN1xTVGQuubWxruty+0wpJSzqgFLv
         xu2jT7hxpj7/qTZgl++zCn+3YMroNQNY7kIloBT98ApGBwYyhmx89XWOFrwoUAHWZow0
         Cfw/kPSbTRdgAGn7GeiLEcTkspmlUA2sR8M+n4tdWvLOzP3JF5Y5Dt2k9OLjCEKc7MQs
         +O0cMErtgovXl6xaHoLtTxWlFEB/Gyjyfl0CShJQuYjgpv8WEgh1ZefwL0ss3rmeKMrc
         A9q4XnaSeTrh0CzB1q1A2S1pMBJlOKhfakJVgRjMYZjx7AK19kpXrThiwkgoAzOiEKTo
         q0Nw==
In-Reply-To: <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 01/04/18 18:39, Kyle Evans wrote:
> On Thu, Jan 4, 2018 at 7:55 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 01/04/18 13:47, Kyle Evans wrote:
>>> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>>>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>>>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>> [... snip ...]
>>>>>>
>>>>>> Does this remove the need for the proposed patch, or am I still
>>>>>> missing something?
>>>>>
>>>>> ... nope. Apparently I never tested this with this particular dtc(1)
>>>>> and instead just assumed it did the same as ours- allocate phandle
>>>>> sparsely, even with -@. That certainly removes the need for this
>>>>> patch, and I'm somewhat upset that I hadn't previously considered
>>>>> this.
>>>>>
>>>>> @David, Jon: Please disregard all of the patches along these lines...
>>>>> I'll fix this in our dtc, where it should be fixed.
>>>>>
>>>>> Thanks, Frank!
>>>>
>>>> Actually, I'm kind of torn on whether this is useful or not. With
>>>> being able to have EFI-provided FDT, it's hard to guarantee whether
>>>> the FDT we're provided has been compiled with GPL dtc(1) and -@. The
>>>> above solves this problem for most of my personal use-cases , though,
>>>> since I can guarantee that our FDT and U-Boot provided FDT is compiled
>>>> properly.
>>>
>>> Apologies for the triple post; I realized that this argument is
>>> inherently wrong, since we can't reference the node if there's no
>>> symbol anyways.
>>>
>>> The only way this might still be a good idea is to support more
>>> minimal cases where an implementation might prefer to not create a
>>> phandle for nodes that haven't been referenced.
>>>
>>> In our case, we have a function [1] that walks the tree and generates
>>> metadata on nodes that have phandles, under the assumption that these
>>> have been referenced somewhere and provides a way to more quickly
>>> reference these specifically through a separate linked link.
>>> Allocating phandles for everything as GPL dtc does adds quite a bit
>>> more overhead to this.
>>>
>>> [1] http://src.illumos.org/source/xref/freebsd-head/sys/dev/ofw/openfirm.c#119
>>
>> The "-@" option does not add a phandle to _every_ node, just to nodes
>> that have a label:
>>
> 
> In practice, this is still a not necessarily close superset of those
> that are actually going to actually get referenced in a given .dts. I
> note that a number of nodes will still get labelled that are unlikely
> to be referenced for any number of reasons.
> 
> For instance, as an example [1][2][3] of one of the boards I'm working
> on currently, all of the ehci/ohci/mmc nodes, some set of the pio
> nodes... almost every single node has a label, and most of them don't
> need a phandle based on what is currently referenced and actually
> used. I note that 27 of these nodes seem to be referenced, out of 39
> nodes with labels (numbers are approximate), leaving ~30% (12) of
> labelled nodes unreferenced.
> 
> For a slightly larger example, [4][5][6][7]; 74 referenced nodes out
> of 113 labelled nodes, leaving ~35% (39) of labelled nodes
> unreferenced.
> 
> This is only bothersome because it starts adding up as these things
> get bigger, and I don't think it really needs to. The alternative to
> keep phandles down to the minimum set required doesn't add much in
> maintenance cost or overhead from the overlay application side;
> especially for blobs generated by this dtc(1) that make the active
> decision to allocate liberally rather than conservatively.

This concept relies on a hand coded __symbols__ node instead of
having dtc generate it.  This makes the overlay devicetree source
more fragile.  The example dts file in patch 2/2 is fairly safe,
but it is legal syntax to specify:

  test = "/test-node";

instead of:

  test = &test;

And the fragile syntax is exactly what results from a decompiled
overlay dtb.

On another note, in the case of Linux, I have to consider applying
overlays to a live devicetree, as well as possibly the case of
applying overlays to a flattened device tree.  I do not expect
that we will add the dynamic creation of missing phandles when
applying an overlay to a live devicetree.  This would result in
an overlay that can be applied to a flattened device tree, but
will fail to apply to a Linux live devicetree.  BSD and Linux
do not have to be fully compatible, but in my opinion, the more
compatible the better.

-Frank 

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/sun8i-a83t.dtsi
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/sunxi-common-regulators.dtsi
> 
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-bonegreen.dts
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am33xx.dtsi
> [6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-bone-common.dtsi
> [7] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-bonegreen-common.dtsi
> 
