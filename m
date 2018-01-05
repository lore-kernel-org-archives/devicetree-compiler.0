From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base fdt
Date: Thu, 4 Jan 2018 23:47:51 -0600
Message-ID: <CACNAnaER1_EW0_HSWcViSiGPTqoLKkh-JF0UKLN1hAwzxhizvw@mail.gmail.com>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com> <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com> <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
 <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com> <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg@mail.gmail.com>
 <5c11d86d-da33-ece5-3170-8fa0bbe5b546@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5c11d86d-da33-ece5-3170-8fa0bbe5b546-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Jan 4, 2018 at 11:02 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 01/04/18 19:50, Kyle Evans wrote:
>> On Thu, Jan 4, 2018 at 9:14 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 01/04/18 18:39, Kyle Evans wrote:
>>>> On Thu, Jan 4, 2018 at 7:55 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> On 01/04/18 13:47, Kyle Evans wrote:
>>>>>> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>>>>>>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>>>>>>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>>>>> [... snip ...]
>>>>>>>>>
>>>>>>>>> Does this remove the need for the proposed patch, or am I still
>>>>>>>>> missing something?
>>>>>>>>
>>>>>>>> ... nope. Apparently I never tested this with this particular dtc(1)
>>>>>>>> and instead just assumed it did the same as ours- allocate phandle
>>>>>>>> sparsely, even with -@. That certainly removes the need for this
>>>>>>>> patch, and I'm somewhat upset that I hadn't previously considered
>>>>>>>> this.
>>>>>>>>
>>>>>>>> @David, Jon: Please disregard all of the patches along these lines...
>>>>>>>> I'll fix this in our dtc, where it should be fixed.
>>>>>>>>
>>>>>>>> Thanks, Frank!
>>>>>>>
>>>>>>> Actually, I'm kind of torn on whether this is useful or not. With
>>>>>>> being able to have EFI-provided FDT, it's hard to guarantee whether
>>>>>>> the FDT we're provided has been compiled with GPL dtc(1) and -@. The
>>>>>>> above solves this problem for most of my personal use-cases , though,
>>>>>>> since I can guarantee that our FDT and U-Boot provided FDT is compiled
>>>>>>> properly.
>>>>>>
>>>>>> Apologies for the triple post; I realized that this argument is
>>>>>> inherently wrong, since we can't reference the node if there's no
>>>>>> symbol anyways.
>>>>>>
>>>>>> The only way this might still be a good idea is to support more
>>>>>> minimal cases where an implementation might prefer to not create a
>>>>>> phandle for nodes that haven't been referenced.
>>>>>>
>>>>>> In our case, we have a function [1] that walks the tree and generates
>>>>>> metadata on nodes that have phandles, under the assumption that these
>>>>>> have been referenced somewhere and provides a way to more quickly
>>>>>> reference these specifically through a separate linked link.
>>>>>> Allocating phandles for everything as GPL dtc does adds quite a bit
>>>>>> more overhead to this.
>>>>>>
>>>>>> [1] http://src.illumos.org/source/xref/freebsd-head/sys/dev/ofw/openfirm.c#119
>>>>>
>>>>> The "-@" option does not add a phandle to _every_ node, just to nodes
>>>>> that have a label:
>>>>>
>>>>
>>>> In practice, this is still a not necessarily close superset of those
>>>> that are actually going to actually get referenced in a given .dts. I
>>>> note that a number of nodes will still get labelled that are unlikely
>>>> to be referenced for any number of reasons.
>>>>
>>>> For instance, as an example [1][2][3] of one of the boards I'm working
>>>> on currently, all of the ehci/ohci/mmc nodes, some set of the pio
>>>> nodes... almost every single node has a label, and most of them don't
>>>> need a phandle based on what is currently referenced and actually
>>>> used. I note that 27 of these nodes seem to be referenced, out of 39
>>>> nodes with labels (numbers are approximate), leaving ~30% (12) of
>>>> labelled nodes unreferenced.
>>>>
>>>> For a slightly larger example, [4][5][6][7]; 74 referenced nodes out
>>>> of 113 labelled nodes, leaving ~35% (39) of labelled nodes
>>>> unreferenced.
>>>>
>>>> This is only bothersome because it starts adding up as these things
>>>> get bigger, and I don't think it really needs to. The alternative to
>>>> keep phandles down to the minimum set required doesn't add much in
>>>> maintenance cost or overhead from the overlay application side;
>>>> especially for blobs generated by this dtc(1) that make the active
>>>> decision to allocate liberally rather than conservatively.
>>>
>>> This concept relies on a hand coded __symbols__ node instead of
>>> having dtc generate it.  This makes the overlay devicetree source
>>> more fragile.  The example dts file in patch 2/2 is fairly safe,
>>> but it is legal syntax to specify:
>>>
>>>   test = "/test-node";
>>>
>>> instead of:
>>>
>>>   test = &test;
>>>
>>> And the fragile syntax is exactly what results from a decompiled
>>> overlay dtb.
>>
>> I think I might be misunderstanding something here- our dtc (BSDL
>> dtc), with -@, still writes a full /__symbols__ node of all labeled
>> nodes, given that this is what -@ is expected to do. The difference is
>
> I was talking about the .dts file in patch 2/2, where the __symbols__
> node was hand coded, instead of being created by dtc.

Ah, ok. I was confused because I hadn't seen any mention of a
hand-rolled /__symbols__; this example base dts upon which overlays
are applied was copy+paste from the non-auto_phandle version of it,
and altered to reflect what our BSDL dtc would actually generate. I'm
also not sure what you mean by 'reliant' upon here; you use the same
overlays and .dts as you do now. I altered nothing but what libfdt
does when it takes a /__fixup__, looks up the corresponding symbol in
the base fdt, and fails to find a phandle at that path.

>> that our dtc allocates phandles conservatively because they're a
>> concept for cross-referencing nodes. Conceptually, it doesn't seem
>> like either way is more or less wrong than the other.
>
> Yes, the phandles concept is for cross-referencing.  In your specific
> context, creating phandle properties at the time that applying the
> overlay determines that the cross-reference actually occurs does
> allow dynamically creating the phandle properties.  If overlays
> were only applied to flattened device trees, then that could be
> a useful optimization.

Indeed, but...

>>> On another note, in the case of Linux, I have to consider applying
>>> overlays to a live devicetree, as well as possibly the case of
>>> applying overlays to a flattened device tree.  I do not expect
>>> that we will add the dynamic creation of missing phandles when
>>> applying an overlay to a live devicetree.  This would result in
>>> an overlay that can be applied to a flattened device tree, but
>>> will fail to apply to a Linux live devicetree.  BSD and Linux
>>> do not have to be fully compatible, but in my opinion, the more
>>> compatible the better.
>>
>> I'm probably being dense here, so please excuse me, but I don't see
>> this as necessarily a problem- likely because I have no familiarity of
>> how Linux works with overlays or FDT bits in general. My stupid
>> question of the hour: Linux actually supports applying overlays to
>> live devicetree?
>
> Not fully implemented yet.  In fact there are some pretty important
> issues to be resolved or implemented.  But there are people who
> have implemented enough of it out of mainline to be able to
> successfully apply specific overlays to the live devicetree for
> specific use cases.  There is also the concept of removing an
> overlay from the live devicetree at some point after having
> applied it.

I think that kind of changes my perspective on this. Given that it's
not a stable implementation, I honestly don't think it's reasonable to
expect the final implementation to be this strict and I do hope this
detail would be reconsidered. If an overlay can reasonably be applied,
why would you fail it based on a missing phandle?

Your implementation knows what my overlay means otherwise because I
reference a labelled node using &foo, dtc generated a /__fixup__ for
it, your implementation takes that /__fixup__ and does the lookup in
the symbol table. The symbol exists and points to a node, what's the
point of rejecting it there?

It seems unreasonable to me, because you cannot always control the
source of your live tree. In many cases, sure, it's generated in-tree
or in U-Boot and passed to you, and you can reasonably expect you
won't encounter this. What if you have vendor-provided tree?

I think the point I'm getting at is that it seems like this will have
to change at some point anyways simply because you can't control all
sources of your devicetree, and this isn't strictly wrong. Telling
someone "No, we can't apply that overlay because your vendor's
internal tool for generating dts and $other_format_used_internally
simultaneously didn't generate a phandle for that" is kind of hard,
especially when your reasoning ISN'T "their blob is malformed" or
"your overlay's reference is ambiguous" but rather, "we know what
that's pointing at, but we just don't generate handles."
