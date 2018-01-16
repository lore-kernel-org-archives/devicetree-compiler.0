From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base fdt
Date: Tue, 16 Jan 2018 09:24:44 -0600
Message-ID: <CACNAnaEWNAXMFReZxQGJn2uyUvx_c0GuLWCo4h53bZOt7Fhvrg@mail.gmail.com>
References: <fe1b36f1-9e38-0d32-6879-b9cd495afd12@gmail.com>
 <CACNAnaFX6D8xqPFpgGGP6n7OzA29gB1pjFUpmmNM9roJgpPrdw@mail.gmail.com>
 <41a2006b-9b54-d803-7a28-457091db6f42@gmail.com> <CACNAnaGoZ+Ne6-d75q7bRokQ-Kr4iDr5kJAEXUybYvw2g2cbPg@mail.gmail.com>
 <5c11d86d-da33-ece5-3170-8fa0bbe5b546@gmail.com> <CACNAnaER1_EW0_HSWcViSiGPTqoLKkh-JF0UKLN1hAwzxhizvw@mail.gmail.com>
 <79ae4708-6a55-a6b6-7eaf-e473baa2c1ac@gmail.com> <CACNAnaFHQSPz4c_hLtGdn+9K6fz9iAZ+wL0Z+Tmz_7+=CJfkOQ@mail.gmail.com>
 <2a75a5f8-dba9-7ff2-4443-f1c2ffb374cc@gmail.com> <CACNAnaFA7WHR1aDzX9qu=cbV48bDkdTDpR0x=bbARdOSmx7VOg@mail.gmail.com>
 <20180116140512.GO30352@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180116140512.GO30352-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Jan 16, 2018 at 8:05 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Jan 05, 2018 at 06:47:46PM -0600, Kyle Evans wrote:
>> On Fri, Jan 5, 2018 at 3:22 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On 01/05/18 13:04, Kyle Evans wrote:
>> >> On Fri, Jan 5, 2018 at 2:40 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >>> On 01/04/18 21:47, Kyle Evans wrote:
>> >>>> On Thu, Jan 4, 2018 at 11:02 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> [snip]
>> > Yes, so not a base overlay that has not been compiled by the dtc (in
>> > this project) with the "-@" flag specified.  Either the __symbols__
>> > node was hand coded, or a compiler other than dtc was used, which
>> > chooses to not create a phandle property for a node whose label
>> > is not de-referenced in the same source file.
>>
>> My understanding was that libfdt was not necessarily supposed to be so
>> tightly coupled to this dtc that it would make such assumptions when
>> it's otherwise not a malformed blob. Ditto for the comment below about
>> the use case being described in the patch- I had goofed and not
>> checked that this particular dtc implementation does it differently,
>> but I also was of the belief that libfdt was only supposed to be
>> loosely coupled to the dtc implementation in this same repository.
>>
>> Of course, I can't recall/find what I had looked at that gave me this
>> impression. =)
>>
>> > This use case should have been clearly described in the patch
>> > description.  And David can then choose to accept or reject the
>> > patch as he sees fit.  I clearly think it is a bad idea, but
>> > David will either agree or disagree with my opinion.
>
> Sorry I've taken so long to reply to all these, I've been super busy.
>
>> David: If I may, I would appreciate if you would re-re-consider this
>> patch set on the following basis:
>>
>> 1.) For base blobs compiled by your dtc, this is a no-op. The latest
>> version does entail one extra tree walk at the beginning of applying
>> /__fixups__ even if all phandles are assigned, but I've since realized
>> this could be moved further down to a tree walk the first time it has
>> to assign a phandle so that it really is a no-op for blobs compiled by
>> your compiler.
>>
>> 2.) For other base blobs, you have compatibility. As of right now, how
>> phandles are assigned in a base blob is an implementation detail,
>> given that there is no clear spec on this. You gain nothing from
>> remaining strict on this, and you lose compatibility with blobs that
>> aren't blatantly invalid that libfdt can't control as well as
>> potential (other) users of your library that may value this. Of
>> course, you wouldn't lose us as users, we'd adapt.
>>
>> I consider this one to be fairly important. We had to implement
>> reading of older formats (see nathanw@'s recent patch to this effect)
>> because we can't control what we're given in all cases. I fully expect
>> that even if I'm asked to drop this and we adapt our dtc, we'll
>> eventually run into a case where this is needed because of
>> vendor-provided DTS via EFI.
>>
>> 3.) There's nothing inherently wrong with what I've done in this
>> patch, I've just supplemented the arbitrary assignment of phandles by
>> dtc with arbitrary assignment of phandles by libfdt. There is no
>> change to how the referenced node is looked up or generated, and this
>> has no bearing on how anything is actually written.
>
> Note that the comments I've made elsewhere in the thread about not
> having seem strong arguments for your position were written before I
> got to reading this mail.
>
> You've got a reasonably compelling case above - let me mull on it a
> while.
>
>> As an aside, IMO, phandles assigned to nodes are pointless once you
>> have a symbol table to reference; just a nice thing to have so you
>> don't *have* to take the performance hit at runtime to assign them.
>
> I'm really not sure what you're getting at here.  phandles are a
> fundamental structural element of device trees going back to the year
> dot, symbols really can't make them go away.  In particular you can't
> easily determine if the phandle on a given node is necessary - doing
> so requires full understanding of *every* binding used anywhere in the
> tree so that you can interpret every other property to see if they
> reference the phandle.

Sorry, my wording is quite inconsistent here: the above should read
"explicit phandles" as I say in some other e-mails.

From my perspective, this isn't a particularly hard problem to solve-
dtc already has to read the entire DTS into its internal
representation before writing it to another format. It already has
some understanding of every binding used everywhere in the tree by the
time it's done. Deferring explicit phandle assignment until after it's
made a full pass over the DTS and knows what's been referenced
elsewhere isn't too bad.

>> The labels you would otherwise be losing are now stored in the blob's
>> symbol table, so references are not ambiguous as they would be in a
>> normal blob compiled without -@.
>
> Not sure what you're getting at here.  References aren't _ambiguous_
> without -@; they simply make no sense - what are you referencing.

Sorry, I've been dealing with a lot of "the labels match the unit
name" nodes lately. You're right. =) The point here is that you can
resolve these references in a DTS compiled with -@, with or without
phandles being explicitly assigned. They don't offer that much value
in this case, other than keeping the resolution of the references into
the compiler.

>> I have other thoughts about the argument of blobs being able to be
>> applied to fdt but not a livetree, but I think they can all be summed
>> up as: this is a non-issue if you're expecting all of your base blobs
>> to be compiled by this dtc -@ anyways.
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
