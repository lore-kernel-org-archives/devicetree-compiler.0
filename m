From: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: Testsuite failures on sparc64 due to unaligned access since 1.5.0
Date: Fri, 11 Dec 2020 15:57:45 +0100
Message-ID: <3a1ceab0-b9b9-a67d-0789-377442db4d05@physik.fu-berlin.de>
References: <10d4dbcb-506c-df88-cd71-f3ad27254341@physik.fu-berlin.de>
 <4e3cdb1c-87c4-810b-513d-eaae64456d36@physik.fu-berlin.de>
 <20201211010739.GB4874@yekko.fritz.box>
 <3b237853-dd8c-99b7-e258-7c51e9970560@physik.fu-berlin.de>
 <20201211144158.GX32272@bill-the-cat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20201211144158.GX32272@bill-the-cat>
Content-Language: en-US
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi!

On 12/11/20 3:41 PM, Tom Rini wrote:
>> From my discussions with GCC developers I have learnt that it shouldn't
>> be a problem to use memcpy() in such cases to avoid aliasing problems
>> resulting in unaligned access.
>>
>> GCC will just optimize memcpy() in cases where an unaligned access is
>> faster.

I meant "optimize memcpy() out", sorry.

> It's just restoring the historical behavior, and Rob was just saying
> this was a change in dtc and not libfdt, so should be fine.  I sent out
> v3 last night, but I don't see it in the archives yet, if I sent it to
> you directly would you be able to give it a quick spin?  Thanks!

Sure, no problem. Will do.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
`. `'   Freie Universitaet Berlin - glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

