From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Size growth?
Date: Tue, 27 Oct 2020 15:57:30 +0000
Message-ID: <a14daf09-4d97-052f-5071-09e67ccb925e@arm.com>
References: <CAPnjgZ3jPciWmoVpuoYb9KC2h3eCevZsq+1BzefCOCAFCDoseQ@mail.gmail.com>
 <20201019014213.GA11625@yekko.fritz.box>
 <20201019123700.GH14816@bill-the-cat>
 <20201020020907.GA64103@yekko.fritz.box>
 <20201021224914.GB14816@bill-the-cat>
 <20201022040013.GB1821515@yekko.fritz.box>
 <20201022123254.GH14816@bill-the-cat>
 <20201022145804.GI1821515@yekko.fritz.box>
 <20201022152253.GJ14816@bill-the-cat>
 <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJiKETTMJX3MsEmECE+jtbwYydVSgt1a6poz_L+pPRFTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 26/10/2020 21:51, Rob Herring wrote:
> On Thu, Oct 22, 2020 at 10:23 AM Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> On Fri, Oct 23, 2020 at 01:58:04AM +1100, David Gibson wrote:
>>> On Thu, Oct 22, 2020 at 08:32:54AM -0400, Tom Rini wrote:
>>>> On Thu, Oct 22, 2020 at 03:00:13PM +1100, David Gibson wrote:
>>>>> On Wed, Oct 21, 2020 at 06:49:14PM -0400, Tom Rini wrote:
> 
> [...]
> 
>>>>>> But what does all of this _mean_ ?  I kinda think I have an answer now.
>>>>>> One of the things that sticks out is 6dcb8ba408ec adds a lot and
>>>>>> 11738cf01f15 reduces it just a little.
>>>>>
>>>>> Ah, that's a tricky one.  If we don't handle unaligned accesses we
>>>>> instead get intermittent bug reports where it just crashes.
>>>>
>>>> We really need to talk about that then.  There was a problem of people
>>>> turning off the sanity check for making sure the entire device tree was
>>>> aligned and then having everything crash.
>>>
>>> Ok... I'm not really sure where you're going with that thought.
>>
>> In my reading of the mailing list history of how this issue came up,
>> it was someone was booting a dragonboard or something, and they (or
>> rather, the board maintainer set by default) the flag to use the device
>> tree wherever it is in memory and NOT to relocate it to a properly
>> aligned address.  This in turn lead to the kernel getting an unaligned
>> device tree and everything crashing.  The "I know what I'm doing" flag
>> was set, violated the documented requirements for device trees need to
>> reside in memory and everything blew up.
>>
>> After that it was noticed that there could be some internal
>> mis-alignment and if you tried those accesses on a CPU that doesn't
>> support doing those reads easily there could be problems, but that's not
>> a common at all case (as noted by it not having been seen in practice).
> 
> Nor a problem on many environments to begin with. More below...
> 
>>>>> I suppose we could add an ASSUME_ALIGNED_ACCESS flag, and it will just
>>>>> break for either an unaligned dtb (unlikely) or if you attempt to load
>>>>> an unaligned value from a property (more likely, but don't add the
>>>>> flag if you're not sure you don't need it).
>>>>
>>>> So long as it's abstracted in such a way that we don't grow the size of
>>>> everything again, yes, that is the right way forward I think.
>>>
>>> All the ASSUME flags should be resolved at compile time (at least with
>>> normal optimization levels enabled in the compiler), so testing for
>>> those shouldn't increase size at all.  If they do, something is wrong.
>>
>> I'm saying that how ever this new ASSUME flag is done, it needs to be
>> done in such a way the compiler really will be smart about it.  So
>> something like making a new function that does fdt64_ld() if we aren't
>> ASSUME_ALIGNED_ACCESS and fdt64_to_cpu() if we are
>> ASSUME_ALIGNED_ACCESS.
> 
> Ah, unaligned accesses again... To summarize, both performance and
> size suffer with not doing unaligned accesses.
> 
> Why not a HAS_UNALIGNED_ACCESS flag instead (or the inverse) that will
> do unaligned accesses? That would be more aligned with what the system
> can support rather than sanity checking associated with ASSUME_*.
> 
> To repeat from last time, everything ARMv6 and up can do unaligned
> accesses if enabled. 

But that requires the MMU to be enabled, doesn't it? If I read the ARM
ARM correctly, unaligned accesses always trap on device memory,
regardless of SCTLR.A. And without the MMU enabled everything is device
memory. We compile U-Boot with -mno-unaligned-access/-mstrict-align to
cope with that, and that most likely affects libfdt as well?

Also some 32-bit ARM platforms run U-Boot proper with the MMU disabled
all the time, and I know of at least the sunxi-aarch64 SPL running with
the MMU off as well.

Cheers,
Andre

> people care about. Whether that's enabled or not is up to how SCTLR.A
> is configured. Last I checked, u-boot clears this. Don't know about
> SPL case though.
> 
> Rob
> 

