From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RESEND PATCHv2 3/4] arm64: dts: add support for building DT
 overlays
Date: Wed, 5 Sep 2018 13:36:40 -0700
Message-ID: <bbfcd3d0-d3ce-d499-f14d-e284008c959a@gmail.com>
References: <1535719666-13595-1-git-send-email-t-kristo@ti.com>
 <1536048344-9995-1-git-send-email-t-kristo@ti.com>
 <1536048344-9995-4-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubFfRIROxV7698h5WwuwRT8efwlIq2+dl1Ml7XMc3s8=; b=WeOu26b6OvYp7x
	gq0eogW1o4osAzvgX+4cWkSyXqK+vp7/+QNOOA6+zEHU1nEtOdsrPmWUFhRmN7ns5db/quoeLvfFo
	qNmkA9EgT42dg+Wjwi4ajHveYHQWh14phLjHgSZjzwnP66KQNeNbAhKLioxmKVEFBDf6OwFCujvHs
	r6I9kSWH2qL/d0ANPWTczmSRBpGK+PXGGFOsi8SiVmY6S7WwFZMfklmhv0/SdvV4oREVzg2qhsnJU
	J91PQYU19lSBU0keVctSh8vNQVkx9GvLml6x76hOT//WamveQuBQmwt/DlD8r2t4mkr9YXzCa/Uc2
	Tkqlt/jr+mYbFt6gRC3w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/YyW8xH8c2pjfoA6901gOdHxhKFgct+Bc4nbdRRdT5M=;
 b=R2KQoNPHjR2e/83cGW9RuUfAyEKB98rCJ/ZKRgAgmYrDBpRWDAcF2OUS9a1FAHIFd8
 vLhAcTBdgOKOiikuML1JDYwxhmEYo4gyb3XM5J0N28tMKH1LM35PoCQJrU0oNMq060T4
 xJBRCRs+76m3BH9uDB9yUle6gmkXIW4pjzeiqTLDiLoSo/yrTxa2PjVjBm/rF6K8Mohx
 kRXJQt04P24/CCeLJBT0vRKmPPg2eupjcfnamcqXqJ65j9jPrD+wQ8hhTamsZQqx8EII
 ceOdfFck6MKLwZpTuYdNyK1oh2l6DMTUjsYc8WEI1Auaz4fNAyDICsun6q7zGUC+TyvM
 2LEw==
In-Reply-To: <1536048344-9995-4-git-send-email-t-kristo@ti.com>
Content-Language: en-US
List-Id: <devicetree-compiler.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, tony@atomide.com, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On 09/04/18 01:05, Tero Kristo wrote:
> Add simple support for building DT overlays. This just compiles any
> given .dtso file under the base arch/arm64/boot/dts/*/ directory into
> a .dtbo.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm64/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 106039d..f04c814 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -127,7 +127,7 @@ Image.%: Image
>  zinstall install:
>  	$(Q)$(MAKE) $(build)=$(boot) $@
>  
> -%.dtb: scripts
> +%.dtb %.dtbo: scripts
>  	$(Q)$(MAKE) $(build)=$(boot)/dts $(boot)/dts/$@
>  
>  PHONY += dtbs dtbs_install
> 

Same comments as for patch 1/4.
