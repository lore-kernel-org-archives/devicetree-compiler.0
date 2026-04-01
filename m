Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858E339A046;
	Wed,  1 Apr 2026 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056674; cv=none; b=FwZrRDnF3F7uqHXx8GRjn8RNpCXrSVv6uN0hDbGpEFYMHLM6EK4W/7L1D5mDOv0VoOyCC5bzxNmkxCgT8KFfdSjZUADkd7Lh93k2MnkjihjW5dprildV1kvHVYZEB1Kqxwg5bEzpqXhCtkWrRT/yl54zw6dtOedkDdd5bbpTXLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056674; c=relaxed/simple;
	bh=gBXw4dt8/h1iPocGpr1eq366xSmy4b59F+laknw25HM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=HN9pWbIQyRPrT86Fpr7hDQtjwm2DHtSUYICO4tqAxCHRKuPt5z06ZSJNthXpuUhV0v4kGwI62rn0/38XgTXQUx59E4n10bYgLY3nBM+IUHm7aMzyh86F6HtnaWP3rdpGfRFrK2g9XdcLB0Gg9POgG5oaUjwEGGn9t4/RYpZYpgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hEaGWqGd; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hEaGWqGd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 060921A30A0;
	Wed,  1 Apr 2026 15:17:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1498602BF;
	Wed,  1 Apr 2026 15:17:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA7BE10450290;
	Wed,  1 Apr 2026 17:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775056670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dFFbYJigz0s6tFtFXTo9/IMYwgyvCHntDw6JcPXENGI=;
	b=hEaGWqGdrBU/UXfQgQ1PlQr+I2oufhE4sIqPqASDzElO4jKtaGvsGGvOlgA4CHodLVPFa3
	qz0t72ztmhmzj+EceWjbGkR9YTDpv6wY+Hrtgy5Xk0yW6/WuZvD3y7PFOAKyAZtCWPkbYD
	OWuv0kTZf3ILgTD+xzDvasj0ag3KhDuObT40zlYmN1IVnIAjR7Gmjdgh1d6Rf9gVbeI03V
	h0z7dXhD+CKAn5NtdjlNDG84IAPv4yCjBm5gw6NgutGYUjqFYTr+okp3kMnQX/F2F3CbrT
	bt+AmnAsLqOI20eeR5KWv9p/OTSSQFpQZxNNvzi2OrNGOqiBSVAePHiT1l1zuA==
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:17:46 +0200
Message-Id: <DHHX2NDIC0DE.178QX4JKCVHF0@bootlin.com>
Cc: "Ayush Singh" <ayush@beagleboard.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, <devicetree-compiler@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree-spec@vger.kernel.org>, "Hui Pu" <hui.pu@gehealthcare.com>, "Ian
 Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Herve Codina" <herve.codina@bootlin.com>, "David Gibson"
 <david@gibson.dropbear.id.au>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [RFC PATCH 12/15] libfdt: Handle unknown tags in fdt_get_next()
X-Mailer: aerc 0.20.1
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-13-herve.codina@bootlin.com>
In-Reply-To: <20260210173349.636766-13-herve.codina@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> The structured tag value definition introduced recently gives the
> ability to ignore unknown tags without any error when they are read.
>
> libfdt uses fdt_get_next() to get a tag.

I think you mean fdt_next_tag(), here and elsewhere in the commit message.

>
> Filtering out tags that should be ignored in fdt_get_next() allows to
> have the filtering done globally and allows, in future release, to have
                                                         ^
							 releases

> a central place to add new known tags that should not be filtered out.
>
> An already known tag exists with the meaning of "just ignore". This tag
> is FDT_NOP. fdt_get_next() callers already handle the FDT_NOP tag.
>
> Avoid unneeded modification at callers side and use a fake FDT_NOP tag
> when an unknown tag that should be ignored is encountered.
>
> Add also fdt_get_next_() internal function for callers who need to know

And here fdt_next_tag_()?

> if the FDT_NOP tag returned is a real FDT_NOP or a fake FDT_NOP due to
> an unknown tag.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Looks good otherwise, so with those fixed:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
