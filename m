Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793273650;
	b=fTIL0bxdM7ahnd4Tud6E8kz+336vF9kUKVQF6bKTK8Fava18r8Jik/4S88vydrZpPHx3
	 a6VEXInLRx749jpykU2DOx9bO3Jh9azQ3V6abDxAyY5xvdQIc05XBp5ToSAEVJJnA1H14
	 NP3G4Ehl9JDNIgRGsJrpw0wvVCQuPK4ONwDU/DvVkvdwerqhTamXY1L/fsq7+8IvUAqur
	 JowS8auu8OZEAt4YC0l5dPS/jKrRbtq6oQgF9WmsDgK/qftHsmM/VpReLbEcdEfNZZ10m
	 0ofioiRwOHjBzyD8o6qudcFRQ19WFkEkXwof9F/EUaZ5XwT523tviOplqsVVl/NCieg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273650;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=DxtL+8VG9FF7KKBLW89SFrTBRRIUkaHNYJv0FwCFU0k=;
	b=12KfAWuxJj3N0I141sShOePV09SFFohn1Z8j+bafcJGnitEl7pp243nLTDykTuhhuo15
	 dHPcLUrOheB2rxXtWsonWXwSQISc06Gp+rBygqy1o/s7YUzUPmEdVYyvEVr6p3Kclycuq
	 fYJdQFTpfWEvmVLus27WMh2iI0Wm+4l49BHTtw/M2pTthRe7JhTuj4QbpfCg7g0DterMv
	 qSIqsGtqS2RT6P73fGBEIJ9CcSm2xofPNdSnAV0fJ/b8WfGeQivU5Tv5RBZK7msvfKBLf
	 PVd6Gv9U3VnWER4NG3p8lvqlccl5+82cLt5+lSDLnPWg8VyVT2SeZd5YK47tKSZgiFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xN3xnMUc;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187EC606A31F
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 11:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187EC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xN3xnMUc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81FF5C49F42;
	Thu, 29 Oct 2026 11:35:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03F2660360;
	Thu, 29 Oct 2026 11:34:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8187A103290ED;
	Thu, 29 Oct 2026 12:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793273641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DxtL+8VG9FF7KKBLW89SFrTBRRIUkaHNYJv0FwCFU0k=;
	b=xN3xnMUcM2T6+X8AYzDRKI2xeYsDr6kM/FFJzDU9NnAs7AOGyTuLi/R6EHA6FfPnuo39pB
	zHs2blsb6HVibN7PvkUDsKSdJkvY5krenzY/PA/qgz+i+k6LIp/WyST9bKN61gKUsgcrJh
	m9ry4BucvJgFAFcEgSElKuTNdzd3keR67zmA5viN9EnKNTt5yIA7wcwoYIWPb8B17Qg2AZ
	9NqUtRluYf+X7A+BhW2+mXpipxm3OBZp3z0FWAIhzmIucwpl2x8SaYnm2XxXHCXvx8KiVO
	ld6N5HFPqAEXqIvigG95EggpwwzNlZAWh0UiXxB2HHiIt4zqmPlWKy7DQutWkg==
Date: Thu, 29 Oct 2026 12:33:59 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 4/4] doc: dts-format: Correct what happens without
 /dts-v1/
Message-ID: <20261029123359.0bfd11d6@bootlin.com>
In-Reply-To: <20261029093115.3647778-5-sjg@chromium.org>
References: <20261029093115.3647778-1-sjg@chromium.org>
	<20261029093115.3647778-5-sjg@chromium.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Simon,

On Thu, 29 Oct 2026 03:30:57 -0600
Simon Glass <sjg@chromium.org> wrote:

> dts-format.txt says that dtc treats a file without /dts-v1/ as the
> obsolete version 0 format. That has not been true since commit
> 4e1a0a0129b3 ("Remove support for the legacy DTS source file format."),
> and dtc now gives a syntax error instead.
> 
> Say that dtc does not accept such files.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v3:
> - Add new patch to correct the description of /dts-v1/
> 
>  Documentation/dts-format.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
> index da0783b..87d3d8e 100644
> --- a/Documentation/dts-format.txt
> +++ b/Documentation/dts-format.txt
> @@ -137,9 +137,8 @@ Version 1 DTS files have the overall layout:
>  	};
>  
>  * The "/dts-v1/;" must be present to identify the file as a version 1
> -  DTS (dts files without this tag will be treated by dtc as being in
> -  the obsolete "version 0", which uses a different format for integers
> -  amongst other small but incompatible changes).
> +  DTS. dtc does not accept files without it, which would be in the
> +  obsolete "version 0" format.

     obsolete and no more supported "version 0" format.

Just to be clear about the "version 0" format.

With that done:
Reviewed-by: Herve Codina <herve.codina@bootlin.com>

>  
>  * Memory reservations define an entry for the device tree blob's
>    memory reservation table.  They have the form:

Best regards,
Hervé

