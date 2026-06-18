Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4EF327BFB;
	Thu, 18 Jun 2026 19:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812546; cv=none; b=RgSpDxJ1vEr3n4uUYwi1gunKpIPGOUTZbVJ4HklBbgzFVQYU8fgljBOJrCNpFUB0r0YnL8SJ4GnzjpykgoRlbIhr5Nsu441Mgs2l3Wq9zfjjfd5nqO1YbOjWoXgWYFvKKWHBQ+/wTUJU5/MEQAHQ9IesIAKxfsDwRC/6L8xuibQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812546; c=relaxed/simple;
	bh=zU6FOXx5z4txtdJ+aueWYGSWusXejcbbTqIDSLrhTAg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOKA0vyIaLl8ZcYhodDsrKmF7pFCj7LcTMeJIaQHnGuBOmLJXYGis2BhFxNX0KibQvBbOx2RVahrN09Qs/b2XvFuVu6IzgVljC0zkzp9kckZGuXSwtqkdxNMwHapnDaVz3qXjez0z07u2e3mRmFHA7AJ+msGdGJ3R/UgEhLD1S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c+d3IkQD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c+d3IkQD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 82B144E42F31;
	Thu, 18 Jun 2026 19:55:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 430B7601AC;
	Thu, 18 Jun 2026 19:55:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFBD9106C8050;
	Thu, 18 Jun 2026 21:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781812541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DSsiDAHTqCQf9GvQ6aa73VhlYkAcQ9k0oqpj1pemtQA=;
	b=c+d3IkQD57oDz3QXnVaqp5bTh5sFVnLCVaz1OATwJBm8h7gDKRanGYV5CwjXNdjkErWghj
	CZzHbkVs/HZCZPkCoV4/0twj/NZTAbANFVnXmsEW5wVuluUIFKqg5/scu2rcifiKa3CZ3q
	Z6RKnfLYlSoHVwOCcux+TDDxA2QG3awRkv2Zx2i4dssJCuFjhB39y8LzaveSFA8rzpr9Yw
	was6bXl/f+CdTmM5K+UPXt3AW0P3LhgFuY4Jd0BHMd6LVDuyx7PTuCdaJMhUfChzWtwqdg
	wjmbj9VbtX6ctAmqv0F07iWKr/uUN2pfpCaoI017F+eqBUg/ufk1puWhjtwiVw==
Date: Thu, 18 Jun 2026 21:55:35 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 03/10] tests: asm: Introduce treehdr_vers macro
Message-ID: <20260618215535.009087aa@bootlin.com>
In-Reply-To: <ajPFLjQ96nmsPLp2@zatzit>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
	<20260409115426.352214-4-herve.codina@bootlin.com>
	<ajPFLjQ96nmsPLp2@zatzit>
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

Hi David,

On Thu, 18 Jun 2026 20:15:10 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Thu, Apr 09, 2026 at 01:54:19PM +0200, Herve Codina wrote:
> > tree.S is used to generate custom dtbs. It uses the treehdr macro to
> > build the header part.
> > 
> > The current definition of this macro doesn't allow to set custom
> > settings related to version fields.
> > 
> > In order to easily generate some dtb with custom version values without
> > duplicating the full header computation, introduce the treehdr_vers
> > macro.
> > 
> > The modification doesn't introduce any functional changes.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> 
> I just killed the not-very-portable trees.S in the main git tree, so
> this will need reworking for the new treegen.c system.

Killing trees.S has been a good idea.

Even if it implies more work on my side, I can only agree with this
decision.

Best regards,
Hervé
