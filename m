From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build
 information
Date: Wed, 26 Feb 2020 10:38:40 -0600
Message-ID: <e0b65cba-6e37-8937-897d-ae82973f34e8@gmail.com>
References: <20200221161217.20069-1-alexandre.torgue@st.com>
 <20200221161217.20069-2-alexandre.torgue@st.com>
 <CAK7LNATmJN-U2GNe2Qd7fS=h5URswe=aFgVJRaBTZt7pi374wg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=erd2mUrd075M8oO2yPj+tKoxoFziTJnQdLvZCm0QgxY=;
        b=X9eERp8QG/tuKn6AKY+yJvRNdFHoS9pG+JMlUdxyQYPYSOzXWyPyebgUOFwJQwTnVg
         4WNiomgsGWrQ0M0jMCaVVWJs7dlZlXLR/eX/6C+oeoKyGLE+jhdN32JS4BYUFo/TxxkK
         VBegQxaPBHScmsO2HL1l0CyID+cPVJodQeGAqj5sC/1pZ7I+lkj0InOF6xAJuJ5w4/CQ
         yuksL+0Y/WfH+iSin0lVK6OjOtzg9JxNw5xV8nsH2FQyD2zTZ7iStRxS+zUfqMg59gED
         V0q+EO0lQnMJdfUJfvaVZ+f23YaZ4eL1wOFDU0GtLKgB08EKzym3aLaNH4VXUidqgdX6
         7vtw==
In-Reply-To: <CAK7LNATmJN-U2GNe2Qd7fS=h5URswe=aFgVJRaBTZt7pi374wg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

Hi Alexandre,

On 2/24/20 11:45 AM, Masahiro Yamada wrote:
> Hi.
> 
> On Sat, Feb 22, 2020 at 1:12 AM Alexandre Torgue
> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
>>
>> This commit adds a new script to create a file (in dts file directory) with
>> some information (date, Linux version, user). This file could then be used
>> to populate "build-info" property in every dts file that would use this
>> build information:
>>
>> Example:
>>
>> / {
>>         ...
>>         build-info = /incbin/("dtb-build.txt");
>>         ...
>> };
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index bae62549e3d2..a5af84ef4ffc 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
>>  # DTC
>>  # ---------------------------------------------------------------------------
>>  DTC ?= $(objtree)/scripts/dtc/dtc
>> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
>>
>>  # Disable noisy checks by default
>>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>> @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>>
>>  quiet_cmd_dtc = DTC     $@
>>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>> +       $(DTB_GEN_INFO) $(src) ; \
>>         $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>>         $(DTC) -O $(2) -o $@ -b 0 \
>>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
>> new file mode 100755
>> index 000000000000..0cd8bd98e410
>> --- /dev/null
>> +++ b/scripts/gen_dtb_build_info.sh
>> @@ -0,0 +1,10 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +set -o nounset
>> +
>> +DTB_DIR=$1
>> +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
>> +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
>> +
>> +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
>> --
>> 2.17.1
>>
> 
> 
> There are more than 1000 *.dts files
> in arch/arm/boot/dts/.
> 
> So, with this patch, the build system will creates
> arch/arm/boot/dts/dtb-build.txt 1000 times.
> 
> 
> Does it work with parallel build ?
> 
> Think about what would happen
> with 'make -j32 ARCH=arm  dtbs'
> 
> 
> The 32 threads will write to
> arch/arm/boot/dts/dtb-build.txt
> at the same time.
> 
> Then, some of DTB would very likely to
> include the broken dtb-build.txt
> 
> 
> A list of missing parts in this approach:
> 
>  - make it work with parallel build
>  - clean it up with 'make clean'
>  - add it .gitignore  (and Documentation/dontdiff)
> 
> 
> 

You might be able to rework script 'version_dtb_increment_once' from my
previous attempt at this concept.  I do not know if the build system
has changed since 2015 in a way that would make the script incorrect
or if it is still valid.

https://lore.kernel.org/linux-arm-kernel/550A44A8.9090302-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/

-Frank
