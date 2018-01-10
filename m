From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base fdt
Date: Wed, 10 Jan 2018 08:15:07 -0600
Message-ID: <CACNAnaF0gKZoWp-tzs1Fwc3ahzWHFhhewKwTT6uSQMSGw2d-vg@mail.gmail.com>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com> <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com> <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
 <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com> <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg@mail.gmail.com>
 <5c11d86d-da33-ece5-3170-8fa0bbe5b546@gmail.com> <20180110094431.GC24770@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110094431.GC24770-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Jan 10, 2018 at 3:44 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Jan 04, 2018 at 09:02:38PM -0800, Frank Rowand wrote:
>> On 01/04/18 19:50, Kyle Evans wrote:
>> > On Thu, Jan 4, 2018 at 9:14 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >> On 01/04/18 18:39, Kyle Evans wrote:
>> >>> On Thu, Jan 4, 2018 at 7:55 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >>>> On 01/04/18 13:47, Kyle Evans wrote:
>> >>>>> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>> >>>>>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>> >>>>>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >>>>>>>> [... snip ...]
>> >>>>>>>>
>> >>>>>>>> Does this remove the need for the proposed patch, or am I still
>> >>>>>>>> missing something?
>> >>>>>>>
>> >>>>>>> ... nope. Apparently I never tested this with this particular dtc(1)
>> >>>>>>> and instead just assumed it did the same as ours- allocate phandle
>> >>>>>>> sparsely, even with -@. That certainly removes the need for this
>> >>>>>>> patch, and I'm somewhat upset that I hadn't previously considered
>> >>>>>>> this.
>> >>>>>>>
>> >>>>>>> @David, Jon: Please disregard all of the patches along these lines...
>> >>>>>>> I'll fix this in our dtc, where it should be fixed.
>> >>>>>>>
>> >>>>>>> Thanks, Frank!
>> >>>>>>
>> >>>>>> Actually, I'm kind of torn on whether this is useful or not. With
>> >>>>>> being able to have EFI-provided FDT, it's hard to guarantee whether
>> >>>>>> the FDT we're provided has been compiled with GPL dtc(1) and -@. The
>> >>>>>> above solves this problem for most of my personal use-cases , though,
>> >>>>>> since I can guarantee that our FDT and U-Boot provided FDT is compiled
>> >>>>>> properly.
>> >>>>>
>> >>>>> Apologies for the triple post; I realized that this argument is
>> >>>>> inherently wrong, since we can't reference the node if there's no
>> >>>>> symbol anyways.
>> >>>>>
>> >>>>> The only way this might still be a good idea is to support more
>> >>>>> minimal cases where an implementation might prefer to not create a
>> >>>>> phandle for nodes that haven't been referenced.
>> >>>>>
>> >>>>> In our case, we have a function [1] that walks the tree and generates
>> >>>>> metadata on nodes that have phandles, under the assumption that these
>> >>>>> have been referenced somewhere and provides a way to more quickly
>> >>>>> reference these specifically through a separate linked link.
>> >>>>> Allocating phandles for everything as GPL dtc does adds quite a bit
>> >>>>> more overhead to this.
>> >>>>>
>> >>>>> [1] http://src.illumos.org/source/xref/freebsd-head/sys/dev/ofw/openfirm.c#119
>> >>>>
>> >>>> The "-@" option does not add a phandle to _every_ node, just to nodes
>> >>>> that have a label:
>> >>>>
>> >>>
>> >>> In practice, this is still a not necessarily close superset of those
>> >>> that are actually going to actually get referenced in a given .dts. I
>> >>> note that a number of nodes will still get labelled that are unlikely
>> >>> to be referenced for any number of reasons.
>> >>>
>> >>> For instance, as an example [1][2][3] of one of the boards I'm working
>> >>> on currently, all of the ehci/ohci/mmc nodes, some set of the pio
>> >>> nodes... almost every single node has a label, and most of them don't
>> >>> need a phandle based on what is currently referenced and actually
>> >>> used. I note that 27 of these nodes seem to be referenced, out of 39
>> >>> nodes with labels (numbers are approximate), leaving ~30% (12) of
>> >>> labelled nodes unreferenced.
>> >>>
>> >>> For a slightly larger example, [4][5][6][7]; 74 referenced nodes out
>> >>> of 113 labelled nodes, leaving ~35% (39) of labelled nodes
>> >>> unreferenced.
>> >>>
>> >>> This is only bothersome because it starts adding up as these things
>> >>> get bigger, and I don't think it really needs to. The alternative to
>> >>> keep phandles down to the minimum set required doesn't add much in
>> >>> maintenance cost or overhead from the overlay application side;
>> >>> especially for blobs generated by this dtc(1) that make the active
>> >>> decision to allocate liberally rather than conservatively.
>> >>
>> >> This concept relies on a hand coded __symbols__ node instead of
>> >> having dtc generate it.  This makes the overlay devicetree source
>> >> more fragile.  The example dts file in patch 2/2 is fairly safe,
>> >> but it is legal syntax to specify:
>> >>
>> >>   test = "/test-node";
>> >>
>> >> instead of:
>> >>
>> >>   test = &test;
>> >>
>> >> And the fragile syntax is exactly what results from a decompiled
>> >> overlay dtb.
>> >
>> > I think I might be misunderstanding something here- our dtc (BSDL
>> > dtc), with -@, still writes a full /__symbols__ node of all labeled
>> > nodes, given that this is what -@ is expected to do. The difference is
>>
>> I was talking about the .dts file in patch 2/2, where the __symbols__
>> node was hand coded, instead of being created by dtc.
>>
>>
>> > that our dtc allocates phandles conservatively because they're a
>> > concept for cross-referencing nodes. Conceptually, it doesn't seem
>> > like either way is more or less wrong than the other.
>>
>> Yes, the phandles concept is for cross-referencing.  In your specific
>> context, creating phandle properties at the time that applying the
>> overlay determines that the cross-reference actually occurs does
>> allow dynamically creating the phandle properties.  If overlays
>> were only applied to flattened device trees, then that could be
>> a useful optimization.
>
> I don't actually see why phandles couldn't be added dynamically for a
> live tree.  In fact adding phandles for nodes that don't have them at
> unflattening time seems like it might be a good idea on general
> principle.

After getting some more in-depth insight (in case we want to use it)
from Frank off-list about how they're planning on allowing live
overlays, I think I get it.

If I were personally the one implementing what he described to me with
the way this works in libfdt, the first thing I'd do after all drivers
have attached and I've effectively unflattened the FDT is strip almost
all of the phandles. As a libfdt user, I have no other way that
doesn't suck of making sure that an overlay can't access resources
they shouldn't be.

The alternative to relying on this is obviously walking the overlay's
tree and checking all of the /__fixups__ or node properties, depending
on your perspective on life. Why? That sucks performance wise,
especially when you're going to have to do it all over again if you've
seen nothing wrong when libfdt applies it.

It all boils down to: not all libfdt environments are the same. Some
environments may want to strictly control what an overlay can do (like
Frank's) without taking an absolutely stupid performance hit. Other
environments may effectively see the overlay as an extension of the
base blob and rather not inhibit what the overlay can do, like my
loader.

After what Frank's told me, I'd rather not see this as a default
behavior of libfdt, but I'd like it to be an option for those
environments that consider the overlay they're about to apply an
effective extension of the base.

I'll re-propose this, probably in a couple weeks, as a compile-time
feature that's off by default. I think that would address any concerns
I personally have of this- I fixed the specific case that started this
path in our dtc, but I'd still like this to be an option for our
loader-applied overlays.

In the meantime, nathanw@'s recent patch for reading older FDT is more
pressing in order for me to update our libfdt and punting our overlay
implementation in favor if libfdt's, so I'd rather not detract any
potential effort that could be put towards merging that in.
