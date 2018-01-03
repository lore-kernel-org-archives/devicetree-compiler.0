From: Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Subject: Re: __local_fixups__ format
Date: Tue, 2 Jan 2018 20:29:33 -0600
Message-ID: <CACNAnaHztnD1MbvL7EsphWzY6OwxxRZo=Ckx8cJ-skTiAui6xQ@mail.gmail.com>
References: <CACNAnaHU2ETa4WryMHzyHH0br6BighhJzen3qqv0EL8u8-_1Kw@mail.gmail.com>
 <20180103000323.GC24581@umbus.fritz.box>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103000323.GC24581-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Jan 2, 2018 at 6:03 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Jan 02, 2018 at 03:54:30PM -0600, Kyle Evans wrote:
>> Hi,
>>
>> I'm working on using libfdt's overlay support in bootloaders on
>> FreeBSD. I find that our BSD-licensed dtc(1) currently generates a
>> /__local_fixups__ node that matches the format (roughly, with some
>> slight bugs that I need to address) of /__fixups__; i.e. a bunch of
>> properties whose values are "path:name:offset".
>>
>> I've not found any documentation on what is actually valid here, but I
>> do know that libfdt will not accept this. Is this completely invalid
>> and our BSD-licensed dtc(1) should write /__local_fixups__
>> differently?
>
> It's completely invalid and your dtc should write /__local_fixups__
> differently.  As well as libfdt, the Linux kernel won't accept
> overlays in this format, and there might be other tooling which is
> also affected.

Thanks for the clarification! I'll take this up with our folks, then. =)

>> If not, Is it OK enough that a patch would be welcome to
>> support this in libfdt? I like the consistency myself, for what it's
>> worth.
>
> Join the club.  I complained about this inconsistency when the overlay
> formats were proposed, but wasn't listened to.  Now it's deployed
> pretty widely, so we're stuck with it.

Well, that's less than great, but I guess that's how these things go sometimes.
