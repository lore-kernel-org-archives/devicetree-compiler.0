From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base
 fdt
Date: Fri, 5 Jan 2018 12:43:04 -0800
Message-ID: <cdd6bf3f-db1f-2577-ade3-0bf3dd7dc706@gmail.com>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com>
 <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <CACNAnaG=kcaUFFH7Dh70o1x-=1WxgJJGE1s0zsTdLvdYCcviMg@mail.gmail.com>
 <CACNAnaHa=OuCrzVegg=7AemS8x=ADFsDs88WQ0phM+TLuYcZJw@mail.gmail.com>
 <1515103688.1759.29.camel@freebsd.org>
 <20180105035317.GJ24581@umbus.fritz.box>
 <CACNAnaEXyhHcxCPz7MYmKS=uh-QdxUDZx7dSuY2=fpzLO44SWA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j80RhXdi0FKISt/0Imck8J+qmEGAoxCuXKG6vDPIKN0=;
        b=WatqjRBvszabN+hP1WuscU5ITXO57Jmi3toEMrN3hEtFYPLAnbQlbV3QU9rhzK70Jl
         B4Zbx8tBuWJJ8nwBztcf+8x076tNlKyGDX9OSjnrwCZi5LrCeQranM7utUv7YpIdBJdC
         B8EPGuwdi9hZOrB3pgd9r5MqAKbKZ1x8Av7LS2unP8w0RgTszJj0WF8JkD2TMj/7Ih/I
         a60JNs/46oWG8P7ZDgnT7gTOTGq8ZOh7xdF1H9seZGCuZe0tqca5dedavUFzpczL44TV
         stmTKTXhY1pKASnEpHm7eIhErgqKvpcQX0WzyV4VYIUOjVzHNG98KnvpO7fbCngK3c9n
         TtHQ==
In-Reply-To: <CACNAnaEXyhHcxCPz7MYmKS=uh-QdxUDZx7dSuY2=fpzLO44SWA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 01/04/18 20:23, Kyle Evans wrote:
> On Thu, Jan 4, 2018 at 9:53 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> On Thu, Jan 04, 2018 at 03:08:08PM -0700, Ian Lepore wrote:
>>> On Thu, 2018-01-04 at 15:47 -0600, Kyle Evans wrote:
>>>> On Thu, Jan 4, 2018 at 3:34 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>>>>>
>>>>> On Thu, Jan 4, 2018 at 2:41 PM, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
>>>>>>
>>>>>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand  wrote:
>>>>>>>
>>>>>>> [... snip ...]
>>>>>>>
>>>>>>> Does this remove the need for the proposed patch, or am I still
>>>>>>> missing something?
>>>>>> ... nope. Apparently I never tested this with this particular dtc(1)
>>>>>> and instead just assumed it did the same as ours- allocate phandle
>>>>>> sparsely, even with -@. That certainly removes the need for this
>>>>>> patch, and I'm somewhat upset that I hadn't previously considered
>>>>>> this.
>>>>>>
>>>>>> @David, Jon: Please disregard all of the patches along these lines...
>>>>>> I'll fix this in our dtc, where it should be fixed.
>>>>>>
>>>>>> Thanks, Frank!
>>>>> Actually, I'm kind of torn on whether this is useful or not. With
>>>>> being able to have EFI-provided FDT, it's hard to guarantee whether
>>>>> the FDT we're provided has been compiled with GPL dtc(1) and -@. The
>>>>> above solves this problem for most of my personal use-cases , though,
>>>>> since I can guarantee that our FDT and U-Boot provided FDT is compiled
>>>>> properly.
>>>> Apologies for the triple post; I realized that this argument is
>>>> inherently wrong, since we can't reference the node if there's no
>>>> symbol anyways.
>>>>
>>>> The only way this might still be a good idea is to support more
>>>> minimal cases where an implementation might prefer to not create a
>>>> phandle for nodes that haven't been referenced.
>>>>
>>>> In our case, we have a function [1] that walks the tree and generates
>>>> metadata on nodes that have phandles, under the assumption that these
>>>> have been referenced somewhere and provides a way to more quickly
>>>> reference these specifically through a separate linked link.
>>>> Allocating phandles for everything as GPL dtc does adds quite a bit
>>>> more overhead to this.
>>>>
>>>> [1] http://src.illumos.org/source/xref/freebsd-head/sys/dev/ofw/openfirm.c#119
>>>
>>> In particular, it makes lookups more expensive as it now must traverse
>>> a list that includes every node in the dtb, rather than just nodes that
>>> are actually referenced.  (It also increases the amount of storage, but
>>> at 20-ish bytes per node, that's not a big deal.)
>>
>> Lookups of what exactly?  Aren't you unflattening the tree after you
>> read it in?

I was going to ask this question in a separate part of the thread, but
I'll keep it here in this context.  For my education:

    Aren't you unflattening the tree after you read it in?


> Lookup in this context would be a lookup of the device from the xref
> phandle, see OF_device_from_xref [1] and its inverse
> OF_xref_from_device right below it. Devices, as they attach, register
> for the xref phandle, then consumers lookup the device associated with
> it and generally hold a handle to the device afterwards.
> 
> [1] http://src.illumos.org/source/xref/freebsd-head/sys/dev/ofw/openfirm.c#628
> 
