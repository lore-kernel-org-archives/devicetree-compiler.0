From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build
 information
Date: Fri, 21 Feb 2020 11:52:34 -0600
Message-ID: <592e41a4-6115-474e-b6ce-eeb82f858a78@gmail.com>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-2-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pfOqpQDUaur2M6YY/gkICE0ETj9HGANxbXQFE0s27Qs=;
        b=T8rtdkXd7pSann2Acm8dZHl0L8ucIUt34HX10/+FdzKbPO6vXXvd1qO+G4fGgMyGKD
         Lez9AIuBpCxJnUHXzL/KXaHoe6Nk8TB6fRHO5ykztU2BqNTn2fBvE150o0/SZIM1nBsa
         Un2WauQf+OnWf6o6hdqorjNO1nVtSPp/RKUhPVop1Kjb8GcV+fj/9UUiXNln2xpXVdEw
         drqK2p5MolJ5p3w2SKYLkLBsSAcLCwbdMJCgfbbZOY8VMuV0W1eIRyJFkms6ZhYa7PNI
         VBzbsQEIgQn5LaLuEq2ZEdCbjt1iP3T+DS8z6+JKT6PrwiCc7AWJVFeKbsdIohA23q+l
         T24A==
In-Reply-To: <20200221161418.20225-2-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

On 2/21/20 10:14 AM, Alexandre Torgue wrote:
> This commit adds a new script to create a file (in dts file directory) with
> some information (date, Linux version, user). This file could then be used
> to populate "build-info" property in every dts file that would use this
> build information:
> 
> Example:
> 
> / {
> 	...
> 	build-info = /incbin/("dtb-build.txt");

s/.txt/.dtsi/

and same wherever the file name is used.


> 	...
> };
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index bae62549e3d2..a5af84ef4ffc 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
>  # DTC
>  # ---------------------------------------------------------------------------
>  DTC ?= $(objtree)/scripts/dtc/dtc
> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
>  
>  # Disable noisy checks by default
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
> @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>  
>  quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
> +	$(DTB_GEN_INFO) $(src) ; \
>  	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>  	$(DTC) -O $(2) -o $@ -b 0 \
>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
> new file mode 100755
> index 000000000000..0cd8bd98e410
> --- /dev/null
> +++ b/scripts/gen_dtb_build_info.sh
> @@ -0,0 +1,10 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -o nounset
> +
> +DTB_DIR=$1
> +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
> +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"

I would remove the filler words "From", "by", "the", and the trailing
period ('.').

<bikeshed>
You might consider using a format more like the Linux
kernel version line, which puts parenthesis around the
compiled by info.
</bikeshed>

-Frank

> +
> +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
> 

