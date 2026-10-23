Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740373;
	b=1rc3o8G/pYDXyTthYZluCyysOfHSENIWIMpK/gpqqreI8rr+pd1xhLYgEjY357sh61Ca
	 nzxGaydHGxgE/Li7+S4mklBf3jCZY3vAUWa6EsJjP0zUWOo75AP9LNlnkCl17iaTiPfkJ
	 Kb+NqGrxjIgIoZaGtR+lZDo2roLa42mMLY/z8tDCS2jNI7ozpgJsUfrSj/t2yPGCkAHOR
	 srjii5vbjDuhxS40YgRMnet7V4QYL005o0EaJVmcoDV+LKdmFpDFVXM1hTexYH2MhJxfT
	 GgBIdDUFEvKR0XSk6Izq+4EgIotnbt7ktOeNQyMSRqIcW0iPmqXSmdvXQovvkMyCi3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740373;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=EWh775ixuDkqq5/XMz+/SNNIBOmyxiAfk8vpWlaY5xk=;
	b=Cd4UJSHsh1RPgy10ExWIgAIunlMAVxxQ5jVrPXvNK+J4Dug0urH5h8wbq27iX+2b12Dj
	 sAnPbjbqrlFT61OXQ2S/1zizqMcpXe5TR/ymrQxi0zLxqCAuWWG6baCutvcK29oUNYSc8
	 gcmp2J2uMhj70z/iJQxKn4hqI0BsK84brnfX5ysucXVqZKnbu+uSugjekunXczyT7hfZ2
	 8sih/Xn2wSlmk82nax2d/gUjmAyBy1bYnDgO18p6goIUSMmMQMrmJ3rwT/xieRm8priuW
	 fWjCp2F3OlgVKDLUBcEZ3HJi/72G0R4SvRZbDhDFTDNZaLXcAufy+0bWfewRSjSls0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LvL4Glmz;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C8E606A31D;
	Fri, 23 Oct 2026 07:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C8E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LvL4Glmz
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C5F78C51460;
	Fri, 23 Oct 2026 07:27:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0868260398;
	Fri, 23 Oct 2026 07:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAEA110328EBA;
	Fri, 23 Oct 2026 09:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792740368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EWh775ixuDkqq5/XMz+/SNNIBOmyxiAfk8vpWlaY5xk=;
	b=LvL4GlmzkNyIqK9Ep7eVn/sWbm8nFqvbiMAvbSgriU1nrEoLwh+8NqTWQMVt8OF8EmcBEa
	RZ/pCV7eAcV6Oz9VvSuGxYC9jPgbSQCQLjvqP5gpDrBEYJXw3FLXBIG9HOLs80RK4UCzrO
	BA8Ioe7RydKo4yFxtHoR+2qWiiIUzzJ+SUmTh9WPLLNhLH3dJCIsoomAeC/7VT7j2uttK+
	utt7YU8Rz+S9uDicPBBqFYKcMqhp94c8+jvPwfrRDEdcSWP4ESQjvK9mIXY88Wj2l8Hh58
	h+JU9O9uWyruKAxpNKqL0BUej1svH9q0VCdU4x9YA8F4HLsDizyhOfdTVgGXZA==
Date: Fri, 23 Oct 2026 09:25:59 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 12/15] libfdt: Introduce fdt_getprop_offset_namelen()
Message-ID: <20261023092559.7608ff25@bootlin.com>
In-Reply-To: <20260922182547.6cc7475c@bootlin.com>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-13-herve.codina@bootlin.com>
	<arDJmHPwgvwwmITG@gractus.seuss>
	<20260922182547.6cc7475c@bootlin.com>
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

Hi David,

On Tue, 22 Sep 2026 18:25:47 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> On Mon, 21 Sep 2026 16:07:21 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
> > On Wed, Aug 26, 2026 at 10:31:43AM +0200, Herve Codina wrote:  
> > > Future operations, such as handling unknown tags on dtb modifications,
> > > need to get an offset to a property based on the node offset and the
> > > property name.
> > > 
> > > Several function exists to get a property based on the node offset
> > > and the property name but none of them allows to get the property
> > > offset.
> > > 
> > > Fill the lack and introduce fdt_getprop_offset_namelen() and its
> > > simple variant fdt_getprop_offset().
> > > 
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>    
> > 
> > This seems redundant with fdt_ptr_offset_(), which can trivially get
> > this information when combined with fdt_get_property().  
> 
> Indeed, It should be ok using both functions you pointed out.
> 
> I will remove fdt_getprop_offset_namelen() introduced here and use directly 
> functions mentionned in the next iteration without wrapping those calls in
> a new function. 

I've started to replace fdt_getprop_offset_namelen() by the combination
of fdt_ptr_offset_() and fdt_get_property_namelen().

As a reminder fdt_getprop_offset_namelen() I proposed was the following:
--- 8< ---
> +int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
> +			       const char *name, int namelen)
> +{
> +	const struct fdt_property *prop;
> +	int lenp, offset;
> +
> +	prop = fdt_get_property_namelen_(fdt, nodeoffset, name, namelen,
> +					 &lenp, &offset);
> +	if (!prop)
> +		return lenp;
> +	return offset;
> +}
--- 8< ---

fdt_get_property_namelen_() was called.

Switching to fdt_get_property_namelen() introduces a regression.

fdt_get_property_namelen() calls fdt_get_property_namelen() and this function
(without the '_' suffix) performs a check on fdt_version() returning an error
on version < 16.

Using it to replace my fdt_getprop_offset_namelen() function will break
write-in-place setprop() for dtb version < 16. Indeed, it is used in [1]

[1]: https://lore.kernel.org/devicetree-compiler/20260826083146.304291-15-herve.codina@bootlin.com/#Z31libfdt:fdt_wip.c

Now, several options:

a) No problem if we break dtb version < 16
   Ok, I will use directly fdt_get_property_namelen() + fdt_ptr_offset_() to
   get an offset and remove my fdt_getprop_offset_namelen() wrapper.

b) Keep my fdt_getprop_offset_namelen() function without any modification
   We support version < 16, problem solved.

c) Keep my fdt_getprop_offset_namelen() but static inline in libfdt_internal.h
   Export fdt_get_property_namelen_() in libfdt_internal.h and use it in the
   static inline fdt_getprop_offset_namelen().
   This implies that fdt_get_property_namelen_() will be no more static and
   usable internally out of fdt_ro.c but only the fdt_getprop_offset_namelen()
   wrapper should be used.

d) Use directly fdt_get_property_namelen_()
   Export fdt_get_property_namelen_() in libfdt_internal.h and use it
   directly to get the offset.
   I don't really like this solution. I would prefer to have a wrapper to
   explicitly return the offset instead of exposing and using directly
   fdt_get_property_namelen_().

On my side, I would prefer b) as it support version < 16 without the need
to expose fdt_get_property_namelen_() out of fdt_ro.c.

I would like to have your opinion on this point.
Is also option b) ok on your side ?

Best regards,
Hervé
