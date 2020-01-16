From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Date: Thu, 16 Jan 2020 09:19:22 +0100
Message-ID: <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=VA1LsnuX6faMUJQvhZzy7LZ3v6e2+z9OibnTE+vdYBA=;
 b=U6P8jg0BIbNy7cmOlAkekIOtLTvBcQWP2OfQAz266SLdRno96feVCD7rFVSbtYBcmf9r
 /vkaOcoxV+sh5Ds8roj0Ewf9yQhAUnRdeMG1c3d5YBRYnYjEmOnDU2vtWSrq+8BfaE7L
 2BFu4e0SJRxu986Wq+HbXyp6OvP/YCT0g8nZEbvlC2ox8MlJbsSiLTPBGPXqwxtzC1yp
 NGYl2k/sCVD8EjT2VXYXwwvHFtvbDovGotVvEv+lDfa3ojLtfykalS2Xq2GN65jGrkN5
 d7kZSTFe1rYgbfQIV6wu++Vm6/+qyHM9tl4cC2qoPVroNUWLkA6wq15iOzTsoMt8TtjS UQ== 
In-Reply-To: <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank Rowand <frowand.list@gmail.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

Hi Franck,

On 1/16/20 3:28 AM, Frank Rowand wrote:
> On 1/13/20 12:16 PM, Alexandre Torgue wrote:
>> Hi,
>>
>> The goal of this series is to add device tree build information in dtb.
>> This information can be dtb build date, where devicetree files come from,
>> who built the dtb ... Actually, same kind of information that you can find
>> in the Linux banner which is printout during kernel boot. Having the same
>> kind of information for device tree is useful for debugging and maintenance.
>>
>> To achieve that a new option "-B" (using an argument) is added to dtc.
>> The argument is a file containing a string with build information
>> (e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>> DTC use it to append dts file with a new string property "Build-info".
>>
>> of/fdt.c is modified to printout "Build-info" property during Kernel boot and
>> scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>> last part could be improved for sure).
> 
> Please read through the thread at:
> 
>    https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104@gmail.com/
> 
> which was my attempt to do something similar.

Yes the idea is the same: get build DTB information like build date, 
"who built the DTB" ... The difference seems to be the way to do it. In 
my case, I don't want to modify existing dts source files., but I "just" 
append them by creating a new property with a string containing this 
build information.

Why your proposition has not been accepted ?

Regards
Alex

> 
> -Frank
> 
>>
>> Regards
>> Alex
>>
>> Alexandre Torgue (3):
>>    dtc: Add dtb build information option
>>    of: fdt: print dtb build information
>>    scripts: Use -B dtc option to generate dtb build information.
>>
>>   drivers/of/fdt.c           |  9 +++++++
>>   scripts/Makefile.lib       | 11 +++++---
>>   scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
>>   scripts/gen_dtb_build_info | 11 ++++++++
>>   4 files changed, 76 insertions(+), 10 deletions(-)
>>   create mode 100755 scripts/gen_dtb_build_info
>>
> 
