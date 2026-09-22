Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A36568551
	for <devicetree-compiler@vger.kernel.org>; Tue, 22 Sep 2026 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094370; cv=none; b=FwhbkOhd2/yzeUDGIhcYpFb95QdSCYnlEnzHUkdEa62g3JUIgLVwuzFN+d6IMZ8jbalG880gm7nguV4aG0k+03rp/3zL/Vna+p88jKMdeiFkBEFt/OoJHjtc+t/pkg7B2vo3EVCqfL1l7DnCoeGQL83OihNh/qJe+9oITL6uwuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094370; c=relaxed/simple;
	bh=75xifshhMhGE0zG1GfFtGKkEULils3W6gikSq9G6cAw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1AciwmQJJbCrQ+BNArDYMBvABCffbsFj8Y54S097sUdzr6ZNPMCbcGNfusrK4SzZmBNBD1hxSTNX0Fd+YaUExYf0MJsw2Ywt0jYMhiud8gvYlxbLPmBfyX1Zd6hOzH9lvF4i3F/afpLex6ZvMchn8H3vnpAbjRQOs+1O7phGJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KbMEflfr; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KbMEflfr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8ED6BC5CD79;
	Tue, 22 Sep 2026 16:26:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB58A60580;
	Tue, 22 Sep 2026 16:26:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9521F103292CA;
	Tue, 22 Sep 2026 18:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790094358; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YRCEsU9owQDChhSiuiHFbeIZzKL/egDpwwGl4F/22+0=;
	b=KbMEflfrlAIwU+HoKLLxyJOChtx3xhmWGMGxALmi86ITa+Tkb/nm0lLPwJ+CMqe7YYJJ1t
	nHp96lPGFbiQCbMnAMvYcdiSv95qZwCDOwwjuHlk9pabj6cF0lXK/RfzfWSv7ijaEOexGN
	ifrLgsrTCUHTipmrG1GFGVjUZg8f10mgjuPfQ1agpGSTZrJNHZ0qZH1mvGUsNgkF+APEob
	PAqwuaW1rWcEnGToXzVLV1ynobWJ9DrtrcXphFlt5/29ZQeNa+/Y5z6zvyhqoYvN7g6SFH
	FtTiPXXCiWzIuQeqX5gf1Rv22t9mTW379cAA4PgAglIqqLoNK87dehhVX2V0yg==
Date: Tue, 22 Sep 2026 18:25:47 +0200
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
Message-ID: <20260922182547.6cc7475c@bootlin.com>
In-Reply-To: <arDJmHPwgvwwmITG@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-13-herve.codina@bootlin.com>
	<arDJmHPwgvwwmITG@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 21 Sep 2026 16:07:21 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:43AM +0200, Herve Codina wrote:
> > Future operations, such as handling unknown tags on dtb modifications,
> > need to get an offset to a property based on the node offset and the
> > property name.
> > 
> > Several function exists to get a property based on the node offset
> > and the property name but none of them allows to get the property
> > offset.
> > 
> > Fill the lack and introduce fdt_getprop_offset_namelen() and its
> > simple variant fdt_getprop_offset().
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> This seems redundant with fdt_ptr_offset_(), which can trivially get
> this information when combined with fdt_get_property().

Indeed, It should be ok using both functions you pointed out.

I will remove fdt_getprop_offset_namelen() introduced here and use directly 
functions mentionned in the next iteration without wrapping those calls in
a new function. 

Best regards,
Hervé
