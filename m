From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RESEND PATCHv2 1/4] ARM: dts: add support for building DT
 overlays
Date: Wed, 5 Sep 2018 13:36:20 -0700
Message-ID: <71d48595-f40f-acce-2660-ce1630ffc398@gmail.com>
References: <1535719666-13595-1-git-send-email-t-kristo@ti.com>
 <1536048344-9995-1-git-send-email-t-kristo@ti.com>
 <1536048344-9995-2-git-send-email-t-kristo@ti.com>
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
	List-Owner; bh=WiDZKPYQd8ny6PquDlkcIXS3KlawnvOB0mV4co3p1Wo=; b=SI8dqtCns1g1zq
	3VJzDB+b4z/gwjF7fU9HAmAQehb2wVU0WgR+89zV3Ba+uxBJVd+xoTbos+iN2rbNSjPvjrACbOINC
	w0E5tW6mvkTHVsN7IE4d32Fum3ncTYKfxnvdNYyaQT4u4biD33DBviknc3913jYgj8vBO+IO24VX6
	0SuuRPsa0QT1MguQv3Q7l5F6XH0QYRaksr5qVOdYMCdb8TDa+yCcGmPz/QFneSCyzckBL4SJxcfuu
	/9ALlj3/kT6aiRoaAH9H0aPu1GteMjg7QK7SkWiZPNlI9xXBEJwRenxBE66fZIhskk3KOhcXlN5MS
	TUfUcK33NWe61ZHW8jzw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nOLOUFxxRuzeEMJhooeEwelAuHxo9WqlV7c2pBpp6bk=;
 b=GNJbbGoBg6FNLb0XcLzYsAPsbEKUGhnnz85UjCchCZwUueNTE2x85p73X01U3Na35I
 KkY8arxJBNb6koqsUCwFxq5poPcKrZOGJFYNwjSc33sy48K8GBs3pZ22qQpIswyIIfs7
 DDObpgTZzYY+ln2SR9/Jq8rhWvyc+aAyz+fHxhiZ45DUFNeBHks5+oCoGFnm6Ba0vM7t
 Twk4NexXYMGNVPZaMvJlOHxIMhJA8CtBhRPHBgUGztyopCUfkfxF1SvtWmekNm5UbkyE
 EpvBcURoE18762i6Mv7YZaSAMIMC8obMLmubZT5Zsn6YLx8OyTr3lyTc5PjedDGbsq8a
 4HYw==
In-Reply-To: <1536048344-9995-2-git-send-email-t-kristo@ti.com>
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

+cc: devicetree-compiler@vger.kernel.org

     For context on the device-tree compiler list, this patch is for
     the Linux kernel.

On 09/04/18 01:05, Tero Kristo wrote:
> Add simple support for building DT overlays. This just compiles any
> given .dtso file under the base arch/arm/boot/dts directory into
> a .dtbo.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index d1516f8..ab555a0 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -339,7 +339,7 @@ $(BOOT_TARGETS): vmlinux
>  $(INSTALL_TARGETS):
>  	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $@
>  
> -%.dtb: | scripts
> +%.dtb %.dtbo: | scripts
>  	$(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $(boot)/dts/$@
>  
>  PHONY += dtbs dtbs_install
> 

The idea of adding knowledge of .dtso and .dtbo files to the dtc
compiler, but that idea and the related patches have fallen by
the wayside.

Current overlay sources and blobs are properly handled by dtc when
they are .dts and .dtb files.

If the dtc compiler is updated with knowledge of .dtso and .dtbo
then these changes would be needed.  At the moment the distinction
of a .dtso and .dtbo is a naming convention that provides a clue
about the intended use of the file.  But dtc does not know these
file name extensions, requiring a specific flag to tell dtc to
treat them as .dts or .dtb files.  I think the negative outweighs
the positive for this patch.

-Frank
