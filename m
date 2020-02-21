From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH v2 4/4] script: make automatic dtb build info
 generation
Date: Fri, 21 Feb 2020 11:59:20 -0600
Message-ID: <cdeab1e4-9220-2f08-575d-15309caed14d@gmail.com>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-5-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d+3XR2+xUaDuja2XE/EGJWyGmU2O7nDCNT8Z/xea85c=;
        b=F1AUvinjYNfKfJKmXNWxwf0qr/7noCmBuxd9yZTjj2p7M1gaQ3dR09hEZsxJB7oz+n
         wDpUcwKkBOzTX0ccVFa7tb0ZRA7ktCQ3Hmi5t178srD5vt1Ct6jfy9wcqMzP4wyC35Vj
         pOY0BDk1zA1qPMKpppHGQDT/cuLhfjpU25EdjauYXmBm+1o0xdmkWNVX8v1+vuY4aaQX
         fHgMlwAzb30PlGG6v+AoaqhtjeNxl41K+pSho98x7pRypPCNpYfk2JtiMuHNZsSRouvC
         3/vY3RH4DfDQzxdPkuFlQMm80mKjZ18gzEe1eDLmw74JFhqZn9pkYnV3adwtACApxxh5
         j4EA==
In-Reply-To: <20200221161418.20225-5-alexandre.torgue@st.com>
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Ian Lepore <ian@freebsd.org>

On 2/21/20 10:14 AM, Alexandre Torgue wrote:
> Append each "xxx.dtb.dts.tmp" file with "build-info" entry during dtb
> build. It allows to get build information (date, source version, ...)
> for each device tree without modify them manually.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index a5af84ef4ffc..f084e78267b2 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -289,6 +289,7 @@ quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>  	$(DTB_GEN_INFO) $(src) ; \
>  	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> +	$(DTB_GEN_INFO) $(src) $(dtc-tmp) ; \
>  	$(DTC) -O $(2) -o $@ -b 0 \
>  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
> index 0cd8bd98e410..72f31e386787 100755
> --- a/scripts/gen_dtb_build_info.sh
> +++ b/scripts/gen_dtb_build_info.sh
> @@ -6,5 +6,7 @@ set -o nounset
>  DTB_DIR=$1
>  DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
>  DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
> +DTS_FILE=$2
>  
> -printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
> +printf "$DTB_INFO" > "arch/arm/boot/dts/dtb-build.txt"
> +echo "&{/} {build-info = /incbin/(\"dtb-build.txt\");};" >> $DTS_FILE
> 

Whatever the correct version of this ends up being, it should be
implemented as a single patch instead of patch 1/4 being modified
by patch 4/4.

