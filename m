From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base fdt
Date: Fri, 5 Jan 2018 15:04:24 -0600
Message-ID: <CACNAnaFHQSPz4c_hLtGdn+9K6fz9iAZ+wL0Z+Tmz_7+=CJfkOQ@mail.gmail.com>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com> <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com> <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
 <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com> <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg@mail.gmail.com>
 <5c11d86d-da33-ece5-3170-8fa0bbe5b546@gmail.com> <CACNAnaER1_EW0_HSWcViSiGPTqoLKkh-JF0UKLN1hAwzxhizvw@mail.gmail.com>
 <79ae4708-6a55-a6b6-7eaf-e473baa2c1ac@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <79ae4708-6a55-a6b6-7eaf-e473baa2c1ac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Jan 5, 2018 at 2:40 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 01/04/18 21:47, Kyle Evans wrote:
>> On Thu, Jan 4, 2018 at 11:02 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Your implementation knows what my overlay means otherwise because I
>> reference a labelled node using &foo, dtc generated a /__fixup__ for
>> it, your implementation takes that /__fixup__ and does the lookup in
>> the symbol table. The symbol exists and points to a node, what's the
>> point of rejecting it there?>
>> It seems unreasonable to me, because you cannot always control the
>> source of your live tree. In many cases, sure, it's generated in-tree
>> or in U-Boot and passed to you, and you can reasonably expect you
>> won't encounter this. What if you have vendor-provided tree?
>>
>> I think the point I'm getting at is that it seems like this will have
>> to change at some point anyways simply because you can't control all
>> sources of your devicetree, and this isn't strictly wrong. Telling
>> someone "No, we can't apply that overlay because your vendor's
>> internal tool for generating dts and $other_format_used_internally
>> simultaneously didn't generate a phandle for that" is kind of hard,> especially when your reasoning ISN'T "their blob is malformed" or
>> "your overlay's reference is ambiguous" but rather, "we know what
>> that's pointing at, but we just don't generate handles."
>
> No, the blob _is_ malformed.  I know there is no official binding
> document for overlays (we do need such things once we figure out
> what we are doing), so this comment is purely my opinion.
>
> The blob is malformed because it was not compiled with the "-@"
> flag.  Mostly not because of anything in the source, although
> again the __symbols__ node should not be hand coded.

I know this is only tangential to the point you're making above, but
the __symbols__ node in this specific example you're referencing was
hand coded by someone else, probably to avoid having to write
different invocations of DTC for the different test cases. I'm only
responsible for removing one line of this .dts, the phandle
assignment.

> Here is an analogy: the overlay metadata is conceptually similar
> to the symbol table in an object file compiled from C source code.
> The linker will use the symbol table to link a second object file
> that contains references to the first object file, resulting in
> a program object file.  It is not normal to hand code the symbol
> table in the object file.  Similarly dtc creates the __symbols__
> node, which is essentially a symbol table.  The Linux kernel
> (or a bootloader, or whatever) performs the linking role as
> part of applying on overlay devicetree to a base devicetree.

There is no hand coding of /__symbols__ nodes anywhere, except for
this test case that was written by someone else. I think your analogy
is inaccurate for the actual situation, though.

The linker has all of the metadata it needs to properly link, but
refuses to for dubious reasons. It can do the lookup in the symbol
table, and that symbol table points to a valid segment of code
("properties and subnodes"), but is refusing to complete the link
based on a missing property that's arbitrarily assigned by someone
else anyways and cannot be relied on to have any meaning or special
value.

To be perfectly clear here: we're talking about taking a blob compiled
from a sensible overlay, such as [1], and applying it to a fellow
sensible blob that has been generated with a proper /__symbols__ node
and phandles assigned only to nodes within its tree that have been
cross-referenced by other nodes within its tree.

> Also hand coded overlay meta data is fragile by nature.  My long
> term goal is that overlay meta data is only generated by the
> compiler.  Or maybe a compiler flag will be needed to allow hand
> coded overlay meta data to not cause compile errors, so that hand
> coded overlay meta data remains possible, but it is obvious that
> it is discouraged.
>
> But this conversation is now far afield from discussing the
> patch series.

Indeed.

[1] http://people.freebsd.org/~kevans/sun8i-a83t-emac.dts
