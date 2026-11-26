Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725387;
	b=PhXY3kPTIvnQQETzkGqs2vr4V8ViFx+b18OF1LoH6gXYiRObKJ7XkXHLvQsI8Y/8sq7l
	 ugW94lQRsOAlJ1d1+z+n+cJeWfztzvfZf03IqujIu6B5t0I23xNaXQrOu3hMtHIr4rIZg
	 HmWKtQYo0+SWUVNBhHKZq0KhzRA4gN57tEb8Vl6clSLSD2Kz0xjYPMkrp4ZPF1yjxXNiu
	 XE5KfqhMkTh4BY91X6B64ot3U1itm2mvvZ213fj3a9TNMGMjZYfAiDp9CqDCQMQFbI7TJ
	 2rmVv5QCryc40BO8vQNQWdcjrxZf7lP3a5XanBnyE5MqS3RB7vsHRvvNzKiLTfA45Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725387;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=5VhoZjnH0SLElzpHNkTUgJy65X9rakEayHEQftFGekc=;
	b=qtadqMx7UMzUT/3X7m3MpzL2wOuj8uW65Pim6ojTzs/vEf/pmJscREUwoi6rOyD3RtoC
	 +iLabmzVnogXcJdz+9eOky70uDsCt6DoY13xG2fhSWB5k+fzgPS70RzPHJ29QePfc8p7d
	 jTChe1t89rR8rbPNGocRDWW40DAS4XiQfDhAnEwv4AS3gHPTkFhr9w+cuOOaJypct+rAd
	 Qf7I4KDvNxTj1+RlVXHIdLALl9SB0IKIKlCcorxqaoJAHpkvPGU0aWjlw0ydd2KCmP1Jr
	 t1b+HZn8QbAVRCpNhl8hdCCVlMh/qn7JeAc8Vg48ynuDNGhlUy+mInloUz4BM8qPk3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2YgBs3qV;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68299606A31E
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Nov 2026 20:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68299606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2YgBs3qV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BDEC11A1826;
	Thu, 26 Nov 2026 20:36:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9260460558;
	Thu, 26 Nov 2026 20:36:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A42EE11E691D1;
	Thu, 26 Nov 2026 21:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795725380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5VhoZjnH0SLElzpHNkTUgJy65X9rakEayHEQftFGekc=;
	b=2YgBs3qVjHWMWaNt5NgYF7o1UJOiKZ/sIVznZN61kTTLfhK/bJyeUqyAElaH1DiCUcihxP
	rItBdv/vd1FzUac9HM5bb7zDhy96Mm1p9TQHthEBLASKe+ouz8ZyfGxM6Y0T9DgT1DGlYD
	bPL9gwU6nSemvlxCM/ch8VhTXkstDOQecdb9U4dVfZplvt805VM3Bqw7LnSc9E5RPLlzWt
	unC1LA+HQcLGkCjGPrAQNkpbx8x+Ir28MEqdvVXtI+Xy85lkevK9ODPXkIOFqaYUekbavo
	Xy1UdM+WyJfKYXwawmoJTK9Jse3oWg20tlfakwat6iAbsglFZzyvt70kvq8lvQ==
Date: Thu, 26 Nov 2026 21:36:15 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] dtc: Add a struct for the top-level fragments
 of a dts file
Message-ID: <20261126213615.030c2366@bootlin.com>
In-Reply-To: <CAFLszTjALSPc+oJ7uVYaqZoPxUKJ0ggKSB2LU_QhyohSVaSyLw@mail.gmail.com>
References: <20261116235813.935070-1-sjg@chromium.org>
	<20261116235813.935070-3-sjg@chromium.org>
	<awYvRAeiVSO9f0ls@gractus.seuss>
	<CAFLszTjALSPc+oJ7uVYaqZoPxUKJ0ggKSB2LU_QhyohSVaSyLw@mail.gmail.com>
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

Hi Simon, David,

On Thu, 26 Nov 2026 10:34:24 -0800
Simon Glass <sjg@chromium.org> wrote:

> Hi David,
> 
> On 2026-11-25T00:44:05, David Gibson <david@gibson.dropbear.id.au> wrote:
> 
> > After consideration of our previous discussions, I'm leaning towards
> > using the term "source layer" for these top level components (thanks
> > for the "layer" suggestion).  It's more verbose than I'd like, but I
> > think disambiguating from dtb level "fragments" is worth it.  
> 
> OK, done in v5, through the series. The struct is struct source_layer,
> but to keep the lines short the helpers just say 'layer':
> build_layer_ref(), free_layer(), LAYER_NODE and so on. Let me know if
> you would prefer source_layer throughout. 'Overlay fragment' and
> fragment@N are unchanged.
> 

Maybe late but "snippet" instead of "source_layer" or "layer" comes in my
mind.

Could this "snippet" make sense?

Best regards,
Hervé
