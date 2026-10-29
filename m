Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793273310;
	b=LtbEpIkS4U83okqV4CFbTXJJnfL7KOdmRUGCIWEVOX2PyUUI1zoBUaDAghaSiZePAfCx
	 e8/jQwYBJXo2RyPMZz8Uy5i/jIaum9qfTy1vYmZOMveTn/EnxsM+PZ6EZHCjiwz9VN+2o
	 caSZgzFyvnxAsTzj8jkMXV5VcMNws2wdc7zFWXn/3t6SDj5eebCsddfnle0HDWbMEOX6M
	 nlm983L8Ueg029JIKB41nqxaFdep3Z+mYobPeCKmWWmjrgMOOA0MJn73ux/QRzz8G+QkX
	 CsFy98VskQW/wOWpYrBOADqk+nR6xpdafM0iMOT768KXX4BhS0J6RW45zhDhKq7Dgbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273310;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=KmtH09LFrr3FuSF/vu6soVo3/jkWvzLG3xS+BDjiY9A=;
	b=qspzWI2kSQa6B/zr02p7gQ4GPlFkCqNMxR+HmT/Lg3gfaP7vJf4g0b1qA/mkM72iBU5+
	 c66AcQir4FsgG3MdHmm9eUbFxo7UDLV6oxjj+WkScU4w20F1KwUfysztQ+AxhUE7ps6JH
	 H5wCbvimDDEUrYdwyqtqKSfnv7+drzNguvAZJ83L+H1T0z7YAXyChcTBtchqw7AVsG1Fb
	 DLmvdxoKTrhWVSZewYeIfKhIvEkkPbKKRtHyEMkWq7Sja21cmDuH06gCVL7IJI9y1p1wW
	 OZKwApjZi87QULzXb+UOW49O4NDDv7J6S6+hn+04KyUw3gy8ZsRhjBc75jplRBY7xFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RAMYemol;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A73606A31A
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 11:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RAMYemol
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CC2761A1398;
	Thu, 29 Oct 2026 11:28:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9919F60360;
	Thu, 29 Oct 2026 11:28:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD6C7103290ED;
	Thu, 29 Oct 2026 12:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793273301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KmtH09LFrr3FuSF/vu6soVo3/jkWvzLG3xS+BDjiY9A=;
	b=RAMYemolywzlx5b1U+VNg4lhQQxgwag2U/aQmUXrvovQDmK5zi3jhHpZZ65CsKjFE40Yb/
	G5RgIxPM/Q4lcayCMYxTwJT9kyEemcXWRJ4itmUM4bbVM810vaeVjLUk6Tqr1H30b5uZRo
	HJrttSvZCUWsLI6jCxNzAnfGLi97sRE4LwNzh1OF1H2GQCK67l5TIw2lPviHxDtXeevGmO
	w8o8vG9dyfbCPjQtXBUAxkLX5AkU/1P67p8DxzrG9vK9UsRVYzsI6MUzrSYtNa/j5Tf6JX
	HNBFldz5vG9+k8peojKgUzDFFif0EeP5gsU2C1MQDU40ams9qbAqGObmz7Ftjw==
Date: Thu, 29 Oct 2026 12:28:18 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 3/4] doc: dts-format: Describe later definitions and
 deletes
Message-ID: <20261029122818.0efd211a@bootlin.com>
In-Reply-To: <20261029093115.3647778-4-sjg@chromium.org>
References: <20261029093115.3647778-1-sjg@chromium.org>
	<20261029093115.3647778-4-sjg@chromium.org>
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

On Thu, 29 Oct 2026 03:30:56 -0600
Simon Glass <sjg@chromium.org> wrote:

> dts-format.txt does not say that a node can be defined more than once,
> nor describe /delete-property/ and /delete-node/, so anyone wanting to
> use them has to learn from examples or the parser.
> 
> Add a section on how later definitions are merged, how to delete a
> property or node, and that an overlay cannot delete anything from the
> tree it is applied to.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v3:
> - Describe only the general rules, leaving out the edge cases
> 
> Changes in v2:
> - Add new patch to document deletes
> 
>  Documentation/dts-format.txt | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
> index 41741df..da0783b 100644
> --- a/Documentation/dts-format.txt
> +++ b/Documentation/dts-format.txt
> @@ -87,6 +87,41 @@ elements, as NUL-terminated strings, as bytestrings or a combination of these.
>  	e.g. prop = [ab cd ef byte4: 00 ff fe];
>  	e.g. str = start: "string value" end: ;
>  
> +Later definitions and deletes
> +-----------------------------
> +
> +A node may be defined more than once, for example in an included file
> +and again in the file which includes it. A later definition refers to
> +the node by '&' followed by its label or full path in braces, or
> +repeats the path from the root. The definitions are merged in source
> +order: a property which is defined again takes the new value, and new
> +properties and child nodes are added.
> +
> +	e.g. / {
> +		serial: serial@1000 {
> +			status = "disabled";
> +			clock-frequency = <100000000>;
> +		};
> +	     };
> +
> +	     &serial {
> +		status = "okay";
> +		/delete-property/ clock-frequency;
> +	     };
> +
> +Within a node definition, a property or child node can be removed with:
> +	/delete-property/ property-name;
> +	/delete-node/ node-name;
> +and outside any node, a node can be removed with:
> +	/delete-node/ &label;
> +
> +A delete in a later definition removes the property or node from the
> +earlier ones. Like child nodes, /delete-node/ must come after any
> +properties in a node definition.
> +
> +An overlay (a file with /plugin/) cannot delete anything from the tree
> +it is applied to, since the overlay format has no way to express this.
> +
>  
>  File layout
>  -----------

Sounds good to me.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
