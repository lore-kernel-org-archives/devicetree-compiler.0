From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] Preserve datatype information when parsing dts
Date: Mon, 18 Dec 2017 11:20:38 +0000
Message-ID: <CACxGe6uALfhN7w-fLzKAbK+g+bwciX-Qx=5WN=Num7ZkraLe=g@mail.gmail.com>
References: <20171128115710.9267-1-grant.likely@arm.com> <20171128115710.9267-2-grant.likely@arm.com>
 <20171212061409.GO2226@umbus.fritz.box> <CACxGe6tyHMTH_jOkacqLwcu+GeiNhAu54Q2WqN=PC8P0P2qJ8Q@mail.gmail.com>
 <20171218043452.GU7753@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=1ByVUqxQLc2AmDNmRHfa+0uX6QKMV4uK/jWibJoxyMY=;
        b=qUji2XFyu4ZGuYORbVEPz0Uj41uM0i2Y1TuDC+18mSMlS0/LLgz3V36753YA/z89oe
         jGpjWl/ZjzBdAbIDD0IQtvBVdOhdV4dwIw+fhDk3k1ovjUwqvUV66TDTIjZkQgH4ZyQI
         /3YxIQYXSgo3wsdAKrEIpuvLpiM1sMJQXUoUWzS83CYt2aCYs5RM485jc26W/3nzCF4p
         WbbuByCMmZ67rSSXJyNTLlrWqPeOLx1pNqhdBD40+BxCFOPaSdTe+3F6EtQGYsa8Wqux
         PX638xXraIMK0RX9WY8gmsl8m8CWMbupIywNQPwSdSYRjCoMnqC6o/31BYFWOuQh/6d4
         LJiQ==
In-Reply-To: <20171218043452.GU7753-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

On Mon, Dec 18, 2017 at 4:34 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Dec 12, 2017 at 12:48:10PM +0000, Grant Likely wrote:
>> On Tue, Dec 12, 2017 at 6:14 AM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Tue, Nov 28, 2017 at 11:57:09AM +0000, Grant Likely wrote:
>> >> The current code throws away all the data type and grouping information
>> >> when parsing the DTS source file, which makes it difficult to
>> >> reconstruct the data format when emitting a format that can express data
>> >> types (ie. dts and yaml). Use the marker list to mark the beginning and
>> >> end of each integer array block (<> and []), the datatype contained in
>> >> each (8, 16, 32 & 64 bit widths), and the start of each string.
>> >>
>> >> At the same time, factor out the heuristic code used to guess a property
>> >> type at emit time. It is a pretty well defined standalone block that
>> >> could be used elsewhere, for instance, when emitting YAML source. Factor
>> >> it out into a separate function so that it can be reused, and also to
>> >> simplify the write_propval() function.
>> >>
>> >> When emitting, group integer output back into the same groups as the
>> >> original source and use the REF_PATH and REF_PHANDLE markers to emit the
>> >> the node reference instead of a raw path or phandle.
>> >>
>> >> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
>> >
>> > I'm a bit dubious how well forcing the marker mechanism to do all this
>> > stuff it was never intended for can work in the long term.  Still,
>> > it's an interesting experiment.
>>
>> As long as the actual data is stored as flat buffer, the markers
>> mechanism works quite well for this. I tried doing something entirely
>> separate, and it turned out to be awful. Another alternative is to
>> break up the flat buffer into a chain of data blocks with attached
>> type information, but that is a very invasive change.
>>
>> This approach has the advantage of being robust on accepting both
>> typed and anonymous data. If the markers are not there then the
>> existing behaviour can be maintained, but otherwise it can emit a
>> higher fidelity of source language.
>
> Hm, true.  The approach is growing on me.  I guess what I'm still
> dubious about is how much this type annotation can get us to approach
> the YAML model.  For example, YAML can distinguish between [ [1, 2],
> [3, 4] ] and [1, 2, 3, 4] which isn't really feasible in dtc.

To start with I'm constraining what is permissible in the YAML
encoding. So, even though YAML can encode multiple nested lists, I'm
not permitting that in this iteration. To take an example:

in dts: reg = <0x1000 0x100> <0x4000 0x300>;
In YAML I'm encoding as:   reg: [ [0x1000, 0x100], [0x4000, 0x300] ]

in dts: compatible = "acme,uart9000", "ns16550"
is in YAML: compatible: [ "acme,uart9000", "ns16550"]

in dts: #size-cells = <1>;
in YAML: "#size-cells": [ [ 1 ] ]

in dts: uint16-prop = /bits/ 16 <31>;
in YAML: uint16-prop: [ !uint16 [31] ]

I'm not allowing anything outside that pattern. So, the following are
all disallowed currently:
reg: [0x1000, 0x100, 0x4000, 0x300] /* integers need to be in a list -
maps to <...> in dts */
compatible: "ns16550" /* not encoded into list */
reg: [ [ [0x4, 0xffff0000], 0x80000], [ [0x4, 0xfffe0000], 0x40000] ]
/* Triple nesting not allowed*/

This could be relaxed later to allow arbitrary YAML structure and
encoding rules to go with them. The markers could even be nested to
keep track of the nesting in DTC, but I want to take the cautious
route and simply disallow that for now.

<digress>
You'll notice that I'm always encoding a property as a list. That's to
be able to preserve the grouping that is usually in .dts files, but
avoid ambiguity between when something is a single value or a tuple.
So, even though "#size-cells":1 would make the most sense, DTC has no
good way to know when a property is a single value, a list of single
values, or a list of tuples.

For example: given in dts interrupts = <10>; how should DTC encode it
into YAML without knowing the binding? Is it:

interrupts:10
interrupts: [ 10 ]
interrupts: [ [ 10 ] ]

In this case the best choice would be [ [ 10 ] ] because each
interrupt specifier is a tuple, and interrupts is a list of interrupt
specifiers. Being really strict about this makes it simpler to craft
schema tests because the schema doesn't need to account for multiple
encodings.

I am thinking about another way to skin this though. If the binding
schemas are available to DTC at YAML emit time, then I can force the
correct encoding. So, if DTC knows it is a #size-cells property, then
it know that is must be encoded as a bare integer.
</digress>

Cheers,
g.


>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
