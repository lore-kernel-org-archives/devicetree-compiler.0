From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Date: Mon, 20 Jan 2020 11:56:41 +0100
Message-ID: <220e3aea-b273-417a-69c9-059236c888af@st.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
 <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=bIRHwgpqgU803NnMOwsEIsnL8ULDWviN0SfB76bEG7w=;
 b=WhmySkKWFl6omfBikRqjrkeanA12VrhTOSj6gS1L2zzZwGjE1YKG9x0kRn2VLnE5tOp/
 qthIHKggg+8tz0/zrrESxk86w4lRa8DJVwi9X7SJ/4iQM1cJncdKenYYVjdaBn1zrFzr
 nbWp0FjNF0Fpe7/WsuVJtSMXx6Eo/7+FB/6c6EkBLPyt7RTBM4yK3lXtqovoyWLtV4r7
 brBTdoRVkdZwtwDqtm1w/StIDTvGaFVhH3QU14ZGrPbmtH3HQ7HiMfh0xijnCTtETazY
 lQJXoArSolItFYhFuWhKfxXKr9hQgYKKPmf5VwFFBTuXIB71+9rV0sv4qRQZl0LipHf/ Eg== 
In-Reply-To: <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Frank Rowand <frowand.list@gmail.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

Hi Franck

On 1/17/20 8:13 PM, Frank Rowand wrote:
> 
> On 1/16/20 2:19 AM, Alexandre Torgue wrote:
>> Hi Franck,
>>
>> On 1/16/20 3:28 AM, Frank Rowand wrote:
>>> On 1/13/20 12:16 PM, Alexandre Torgue wrote:
>>>> Hi,
>>>>
>>>> The goal of this series is to add device tree build information in dtb.
>>>> This information can be dtb build date, where devicetree files come from,
>>>> who built the dtb ... Actually, same kind of information that you can find
>>>> in the Linux banner which is printout during kernel boot. Having the same
>>>> kind of information for device tree is useful for debugging and maintenance.
>>>>
>>>> To achieve that a new option "-B" (using an argument) is added to dtc.
>>>> The argument is a file containing a string with build information
>>>> (e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>>>> DTC use it to append dts file with a new string property "Build-info".
>>>>
>>>> of/fdt.c is modified to printout "Build-info" property during Kernel boot and
>>>> scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>>>> last part could be improved for sure).
>>>
>>> Please read through the thread at:
>>>
>>>     https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104@gmail.com/
>>>
>>> which was my attempt to do something similar.
>>
>> Yes the idea is the same: get build DTB information like build date,
>> "who built the DTB" ... The difference seems to be the way to do it.
>> In my case, I don't want to modify existing dts source files., but I
>> "just" append them by creating a new property with a string
>> containing this build information.>
>> Why your proposition has not been accepted ?
> 
> Since you are asking this question, I am presuming that you did not
> read the replies in the thread I referenced.  Please read through
> the entire thread.  Most of the review comments were objecting to
> the concept of my proposal.

Sorry I have been lazy :$. This series is a tiny one compare to yours, 
and adds less dtb information (only git used, who built dtb and the 
date). There are no "dtb versions", and "absolute/relative" path which 
created concerns. One remaining concern is "reproducible build" but 
making dtb info optional could respond to it.
I continue to think that it's useful to get those information (even if 
it's only a string) But before continuing (and find a better technical 
way to do it), I need to know if there are no other obstacles.


Regards
Alex


> 
> -Frank
> 
>>
>> Regards
>> Alex
>>
>>>
>>> -Frank
>>>
>>>>
>>>> Regards
>>>> Alex
>>>>
>>>> Alexandre Torgue (3):
>>>>     dtc: Add dtb build information option
>>>>     of: fdt: print dtb build information
>>>>     scripts: Use -B dtc option to generate dtb build information.
>>>>
>>>>    drivers/of/fdt.c           |  9 +++++++
>>>>    scripts/Makefile.lib       | 11 +++++---
>>>>    scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
>>>>    scripts/gen_dtb_build_info | 11 ++++++++
>>>>    4 files changed, 76 insertions(+), 10 deletions(-)
>>>>    create mode 100755 scripts/gen_dtb_build_info
>>>>
>>>
>>
> 
