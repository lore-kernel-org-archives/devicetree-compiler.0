From: Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build information
Date: Tue, 25 Feb 2020 02:45:05 +0900
Message-ID: <CAK7LNATmJN-U2GNe2Qd7fS=h5URswe=aFgVJRaBTZt7pi374wg@mail.gmail.com>
References: <20200221161217.20069-1-alexandre.torgue@st.com> <20200221161217.20069-2-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01OHjfA3000853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582566342;
        bh=KVRS2dbwL2EdiX0y9rPIxU4NY6nXK8pE6d2zwnmUmHo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=utcxfWn0yW1TR7HUPR4KiWV58Gaubm+IlmcbfFTvs7khTCv3+srqLqWUigTxwOMAW
         fQ0sxGGEmtUcYcUZtodqHN+aG8U/OtYFpSUP/4Yy3AUQxwp3luUh8HPG4b8rIFfeVd
         JTsE5jPczaCQjzjiQKfPIki7yfWKJyaGU17Qk1ToIJmAWizk1EPl3nNf4CIoTFfMb1
         VCRzVY771EG7It1BDHnSS3QGd71I0mvzHhJPKG8KJo5JqKNOZqZ1fwAEjCpeFkND+V
         RcZ4+0QscM2VCECR4xlVFmPjksoPKbCu28UcjPd7pRNlM6gK6tZlTWXTR4VByIMj5H
         04VV/MV6EEQYw==
In-Reply-To: <20200221161217.20069-2-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

Hi.

On Sat, Feb 22, 2020 at 1:12 AM Alexandre Torgue
<alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
>
> This commit adds a new script to create a file (in dts file directory) with
> some information (date, Linux version, user). This file could then be used
> to populate "build-info" property in every dts file that would use this
> build information:
>
> Example:
>
> / {
>         ...
>         build-info = /incbin/("dtb-build.txt");
>         ...
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
> +       $(DTB_GEN_INFO) $(src) ; \
>         $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>         $(DTC) -O $(2) -o $@ -b 0 \
>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
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
> +
> +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
> --
> 2.17.1
>


There are more than 1000 *.dts files
in arch/arm/boot/dts/.

So, with this patch, the build system will creates
arch/arm/boot/dts/dtb-build.txt 1000 times.


Does it work with parallel build ?

Think about what would happen
with 'make -j32 ARCH=arm  dtbs'


The 32 threads will write to
arch/arm/boot/dts/dtb-build.txt
at the same time.

Then, some of DTB would very likely to
include the broken dtb-build.txt


A list of missing parts in this approach:

 - make it work with parallel build
 - clean it up with 'make clean'
 - add it .gitignore  (and Documentation/dontdiff)



-- 
Best Regards
Masahiro Yamada
