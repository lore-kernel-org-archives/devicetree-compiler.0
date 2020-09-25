From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 00/14] libfdt: Fix signed/unsigned comparison warnings
Date: Fri, 25 Sep 2020 09:44:25 +0100
Message-ID: <4cf99739-e7b4-534a-ff9d-409332aa87e2@arm.com>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200925041243.GA2298@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200925041243.GA2298-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
Content-Language: en-GB
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 25/09/2020 05:12, David Gibson wrote:

Hi David,

> On Mon, Sep 21, 2020 at 05:52:49PM +0100, Andre Przywara wrote:
>> When libfdt is compiled with -Wsign-compare or -Wextra, GCC emits quite
>> some warnings about the signedness of the operands not matching:
>> =================
>> libfdt/fdt.c:140:18: error: comparison between signed and unsigned integer expressions [-Werror=sign-compare]
>>    if ((absoffset < offset)
>> .....
>> =================
>>
>> This does not occur under normal conditions in the dtc repo, but might
>> show up when libfdt is embedded in another project. There have been reports
>> from U-Boot and Trusted-Firmware-A.
>>
>> The underlying issue is mostly due to C's promotion behaviour (ANSI C
>> section 6.1.3.8) when dealing with operands of different signedness
>> (but same size): Signed values get implictly casted to unsigned, which
>> is not typically what we want if they could have been negative.
>>
>> The Internet(TM) suggests that blindly applying casts is probably doing
>> more harm than it helps, so this series tries to fix the underlying
>> issues properly.
>> In libfdt, some types are somewhat suboptimal ("int bufsize" comes to mind);
>> some signed types are due to them being returned along wih error values in
>> other functions (node offsets).
>> So these fixes here have been based on the following assumptions:
>> - We cannot change the prototype of exported functions.
>> - It's better to change types (for local variables) than to cast.
>> - If we have established that a signed value is not negative, we can safely
>>   cast it to an unsigned type.
>>
>> I split up the fixes in small chunks, to make them easier to review.
>> The first four patches change types, the next six ones use casts after
>> we made sure the values are not negative.
>>
>> This is only covering libfdt for now (which is what those other projects
>> care about). There are more issues with dtc, but they can be addressed
>> later.
>>
>> Not sure if some of these checks should be gated by can_assume() calls.
>>
>> Please have a look, happy to discuss the invididual cases.
> 
> Thanks so much for these.  I've applied about half of them, the rest I
> have mostly minor comments for.

Many thanks for reviewing (and applying)! I will send the remaining
patches ASAP, fixed accordingly.

Cheers,
Andre
