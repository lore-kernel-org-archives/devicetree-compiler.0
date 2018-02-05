From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5] libfdt: add helpers to read address and size from reg
Date: Mon, 5 Feb 2018 09:24:34 -0600
Message-ID: <e9edce2a-d37a-768e-17d5-e48a620780a2@ti.com>
References: <20180201230416.6641-1-afd@ti.com>
 <CAL_JsqLJ=KK=PPnKBJBu1S5meTYRQxHyH5JFQGs2MLkm-ALuyA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1517844274;
        bh=9R+0BUBAtmmBP+hsrHMPuiSduhgtnPlOWVqR7x+N9V4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Pe31DmpvRJhH/G/H/5O9nPoVofKjXHzPOQOBxoqLfWCcFVP46ol6f9cFyrbzMP5bE
         Ll8TJzB1rmGrg3maL/MKMRjGcDaz/cs0RyjV3oe7/V/rauKaPpybimlyzUS3eZc+B9
         2dq8VfVCw/ks+PqxLKD/oXtmDPMFMrP2B4rYSlAc=
In-Reply-To: <CAL_JsqLJ=KK=PPnKBJBu1S5meTYRQxHyH5JFQGs2MLkm-ALuyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 02/01/2018 10:35 PM, Rob Herring wrote:
> On Thu, Feb 1, 2018 at 5:04 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
>> From: Benjamin Fair <b-fair-l0cyMroinI0@public.gmane.org>
>>
>> This patch extends the capability of libfdt to parse the contents of device
>> trees in a similar manner to fdt_address_cells and fdt_size_cells.
>>
>> It adds a helper function which reads the address and size of a device from
>> the reg property and performs basic sanity checks.
>>
>> It does not perform translation to a physical address using the ranges
>> properties of parents, but this enhancement may be added as a separate
>> function in the future.
> 
> I'm concerned about merging this without translation support. First,
> I'd question its usefulness without it. Second, it may encourage
> people to write their DTs without any ranges just so this will work.
> 

It can be useful for nodes where ranges is not appropriate for whatever
reason, or more likely as a base for other helpers that do perform
translation (hence the "simple" in this ones name), it will need to
still be extended for many use-cases.

> I tried to upstream the kernel and u-boot implementations to libfdt in
> April 2014 (I couldn't find an archive). We've got to get it
> relicensed and then David didn't like the implementation. He said he
> was about to post his version, but then it derailed into PCI handling.
> There's another implementation in the kernel powerpc boot code that
> may be easier to re-license.
> 

My worry with adding translation is this kind of feature creep. PCI and
other odd cases will block this effort with little gain for the users
where this simple helper is sufficient.

> Rob
> 
