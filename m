From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Date: Fri, 17 Jan 2020 13:13:08 -0600
Message-ID: <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ADIZocMZReJrjMbw9nPTOASTb/3FgLZiglzVEfrysHc=;
        b=tut0kCOMkdGJSiNqMoxqMqsN95iTpjZu26IZYYPHVmrheqlXj7wgoVZYGYSrZTagC0
         GlOiATVb3lLOs9X8kl58SAff/aaXsJE6HaoAaHgB6AMQa1Zcgp/x9B6RbVX+2oQzZEZX
         FSow2qGOHBbyb5gmJBiHYD2/ybpmCEfwNU8WwqAH/OPYjua8zM8mFhSnQKP8NGiy05yJ
         OoHtNQMzYZobtel7K8BxouDmmQanyxIF0PkWOQl0lou3apjHcHm0wWoSrSgmOyKHM1bA
         rquGOWNKd7PfXAcpUnzquGxUzuXWygcks7+mmsdCa5cz/Qt5prxbbCCKDsj5c6HEXh7L
         DC9g==
In-Reply-To: <233e0a5f-d38f-908c-5ca7-66ee87d0fcae-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


On 1/16/20 2:19 AM, Alexandre Torgue wrote:
> Hi Franck,
> 
> On 1/16/20 3:28 AM, Frank Rowand wrote:
>> On 1/13/20 12:16 PM, Alexandre Torgue wrote:
>>> Hi,
>>>
>>> The goal of this series is to add device tree build information in dtb.
>>> This information can be dtb build date, where devicetree files come from,
>>> who built the dtb ... Actually, same kind of information that you can find
>>> in the Linux banner which is printout during kernel boot. Having the same
>>> kind of information for device tree is useful for debugging and maintenance.
>>>
>>> To achieve that a new option "-B" (using an argument) is added to dtc.
>>> The argument is a file containing a string with build information
>>> (e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>>> DTC use it to append dts file with a new string property "Build-info".
>>>
>>> of/fdt.c is modified to printout "Build-info" property during Kernel boot and
>>> scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>>> last part could be improved for sure).
>>
>> Please read through the thread at:
>>
>>    https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
>>
>> which was my attempt to do something similar.
> 
> Yes the idea is the same: get build DTB information like build date,
> "who built the DTB" ... The difference seems to be the way to do it.
> In my case, I don't want to modify existing dts source files., but I
> "just" append them by creating a new property with a string
> containing this build information.> 
> Why your proposition has not been accepted ?

Since you are asking this question, I am presuming that you did not
read the replies in the thread I referenced.  Please read through
the entire thread.  Most of the review comments were objecting to
the concept of my proposal.

-Frank

> 
> Regards
> Alex
> 
>>
>> -Frank
>>
>>>
>>> Regards
>>> Alex
>>>
>>> Alexandre Torgue (3):
>>>    dtc: Add dtb build information option
>>>    of: fdt: print dtb build information
>>>    scripts: Use -B dtc option to generate dtb build information.
>>>
>>>   drivers/of/fdt.c           |  9 +++++++
>>>   scripts/Makefile.lib       | 11 +++++---
>>>   scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
>>>   scripts/gen_dtb_build_info | 11 ++++++++
>>>   4 files changed, 76 insertions(+), 10 deletions(-)
>>>   create mode 100755 scripts/gen_dtb_build_info
>>>
>>
> 

