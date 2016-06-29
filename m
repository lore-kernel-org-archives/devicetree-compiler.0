From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 00/12] cmd: fdt: Add device tree overlays support
Date: Tue, 28 Jun 2016 20:28:01 -0700
Message-ID: <CAPnjgZ1BSP2HGCG_Rdga20Yv5yxqynd47JubwPrfB4ts+OpC0g@mail.gmail.com>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160626153719.GP15625@voom.fritz.box> <20160627062912.GM4000@lukather>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=LqqA2LPo8YUZdnyNK3rNzp9LmjfXpTfJl/HUN/KiZoc=;
        b=l4UN9MUlFCxAXtEOT5jD5f2QL9nsh1cts2Er8Ea1qUvb4qZo/zIEBbei+vEdg5tVaK
         ypfH5Xs9LI1JVV0CAiXzp06OCkWzSanviZ8qZ4qkKiPIcf62vTg779+voUaVzmNLSpK7
         XGOqyFgnpNbnHIWIyTjQmHmJgDcMya66lK43Y4wguZLOLWVC5VyWYHDpz88C1niy0jGg
         Zr7CtjOV44wf+a5GqjqMyHG7r8v9lSey7IOdueM4CMIELzjXAKkuUbtV8l3vs4uDF6II
         xpJTFJkHpsXcS/jy+G/UoYN5hwh7kituJQ+vf5cpGLJt6hbkUtsrAr4El+NHSHc7fpVH
         vlZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=LqqA2LPo8YUZdnyNK3rNzp9LmjfXpTfJl/HUN/KiZoc=;
        b=VeHsHj0M7TKX+EZudZ5xax5zp3v9VOdNG6sSWMvNTWW4eSkOlBHolhlosFCWF/mu3r
         m9SihXpLf2ZHG7gK4gpaoDe/4WAjDS0QnOArmJJkMd0UnmiYzIh9055PyY6uvDTtPJ+x
         0LceFDHsyf8Y0QukAGmFJCTVq3k6DTUBveg0Y=
In-Reply-To: <20160627062912.GM4000@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Hi Maxime,

On 26 June 2016 at 23:29, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi David,
>
> On Mon, Jun 27, 2016 at 01:37:19AM +1000, David Gibson wrote:
>> On Fri, Jun 24, 2016 at 04:27:45PM +0200, Maxime Ripard wrote:
>> > Hi,
>> >
>> > The device tree overlays are a great solution to the issue raised by
>> > the bunch expandable boards we find everywhere these days, like the
>> > Beaglebone, Raspberry Pi or CHIP.
>> >
>> > However, most of the time, the overlays are applied through a
>> > mechanism involving the firmware request interface in Linux, that is
>> > only fully functional once the userspace has been mounted and is
>> > running.
>> >
>> > Some expansion boards might need to be enabled before that, because
>> > they simply need to patch the DT early on, or need to be initialized
>> > early in order to be fully functional, or because they provide access
>> > to the root filesystem.
>> >
>> > In these cases, having the bootloader applying the overlay before
>> > Linux starts seems like the easiest solution.
>> >
>> > This implementation doesn't provide all the Linux fancyness though,
>> > there's no transactional application, which means that if the overlay
>> > cannot be applied for a reason while you're still halfway through the
>> > application, you're probably screwed. It also cannot remove an
>> > overlay, but I don't think that it is currently a use-case.
>> >
>> > There's still a bunch of work to extend the libfdt unit tests to test
>> > the new functions introduced, but these patches will be submitted
>> > in a near future.
>>
>> Are you planning to send a new version of (the relevant portions of)
>> these against upstream libfdt?
>
> Of course, I just only have to work on the test cases now.
>
> Simon wanted to merge this in U-Boot for the next merge window, and
> then sync with libfdt when it would be merged, hence why I posted it
> first.

Yes I'll wait until after the current release as it is too close. Feel
free to send a fix-up patch (or whatever means you prefer) once this
is applied upstream.

Regards,
Simon
