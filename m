From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] overlays: auto allocate phandles for nodes in base fdt
Date: Thu, 4 Jan 2018 22:00:33 -0600
Message-ID: <CACNAnaG3evrq3pXwSc_wLizzCAvtdZNZvHe8oXd_1jR=JT+6pw@mail.gmail.com>
References: <CACNAnaEGfaZ=s5x8pw2AHf+SQHLTCTGCedL+TxOKXbA=e=kj0w@mail.gmail.com>
 <9711cac8-2501-7d68-2fb3-1c3a952fa96a@gmail.com> <CACNAnaHck=vyC8dYa0HeFzd=MryucvOUSyYvkJw68tBe_goxWQ@mail.gmail.com>
 <20180105034057.GH24581@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105034057.GH24581-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Jan 4, 2018 at 9:40 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Jan 04, 2018 at 02:41:22PM -0600, Kyle Evans wrote:
>> On Thu, Jan 4, 2018 at 2:33 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > [... snip ...]
>> >
>> > Does this remove the need for the proposed patch, or am I still
>> > missing something?
>>
>> ... nope. Apparently I never tested this with this particular dtc(1)
>> and instead just assumed it did the same as ours- allocate phandle
>> sparsely, even with -@. That certainly removes the need for this
>> patch, and I'm somewhat upset that I hadn't previously considered
>> this.
>
> Ah! Sorry, I'd forgotten about that behaviour of -@.
>
>> @David, Jon: Please disregard all of the patches along these lines...
>> I'll fix this in our dtc, where it should be fixed.
>
> Ok :).

Heh, sorry for the flip-flop, but this might have been premature. I'm
still trying to decide based on Frank's responses if it's really a bad
idea to support this in libfdt, given that I don't think we have any
intention of supporting such a thing on a running devicetree. It would
certainly help if there were some spec mandating that all nodes
eligible for cross-referencing have a phandle, but even [1] (albeit
recently published) doesn't have a strong position on this.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.2/devicetree-specification-v0.2.pdf
