From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] libfdt: Correct signed/unsigned comparisons
Date: Thu, 17 Sep 2020 11:26:44 +0100
Message-ID: <a6622ba6-71f5-135a-f215-bc3741d9b721@arm.com>
References: <20200112185209.75847-1-sjg@chromium.org>
 <20200116064955.GR54439@umbus>
 <CAPnjgZ2vbphSbvohBD3YTswX2WtKdVxgs9Ltg9vFfrEQyr2LGw@mail.gmail.com>
 <20200117092332.GW54439@umbus>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200117092332.GW54439@umbus>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 17/01/2020 09:23, David Gibson wrote:

Hi,

> On Thu, Jan 16, 2020 at 08:58:12PM +1300, Simon Glass wrote:
>> Hi David,
>>
>> On Thu, 16 Jan 2020 at 19:50, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>>>
>>> On Sun, Jan 12, 2020 at 11:52:08AM -0700, Simon Glass wrote:
>>>> These warnings appear when building U-Boot on x86 and some other targets.
>>>> Correct them by adding casts.
>>>>
>>>> Example:
>>>>
>>>> scripts/dtc/libfdt/fdt.c: In function ‘fdt_offset_ptr’:
>>>> scripts/dtc/libfdt/fdt.c:137:18: warning: comparison of integer expressions of different signedness: ‘unsigned int’ and ‘int’ [-Wsign-compare]
>>>>    if ((absoffset < offset)
>>>>
>>>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>
>>> Hmm.  So squashing warnings is certainly a good thing in general.
>>>
>>> Unfortunately, I'm really uncomfortable with most of these changes.
>>> In a number of cases they are outright wrong.  In most of the others,
>>> the code was already correct.  I dislike adding casts to suppress
>>> spurious warnings on correct code because that can end up hiding real
>>> problems which might be introduced by future changes.
>>>
>>> Case by case details below.
>>
>> Thanks for the review. I agree this is all really horrible,
>> particularly in light of the fact that it doesn't fix bugs and perhaps
>> introduces some.
>>
>> This was just a quick patch to silence the warnings. If we do make
>> fixes here we should really make sure that there are test cases to
>> trigger each check. I suspect we have some but not all.
> 
> Yeah, adding some safety test cases for egregiously bad input like
> negative buffer sizes is probably a good idea.
> 
>> What do you think we should do? The warnings are going to be very
>> annoying for people. I could perhaps split the patch up and work
>> through things one by one.
> 
> Yeah, we want to find some way to remove the warnings, and I think
> splitting up and working piece by piece will be necessary.

Has anyone done anything on that front?
If not, I would take a deep breath and try to tackle this one by one. I
was grudgingly ignoring this in U-Boot so far, but it popped up in
Trusted Firmware now as well, so I have a business reason (TM).

Cheers,
Andre

> I think the very first step, is to find definitive info on what
> exactly the defined behaviour of C is with a signed vs. unsigned
> comparison.
> 
> The help text of -Wsign-compare seems to imply that assuming:
> 
> 	signed int a;
> 	unsigned int b;
> 
> then 
> 	if (a < b) ...
> 
> is equivalent to
> 	if ((unsigned int)a < b) ...
> 
> But I thought that this was not the case.  Rather, I thought it was
> supposed to always evaluate to true if b > INT_MAX.  We need to know
> which is the case as a starting point.
> 

