Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F513B0ADA;
	Tue,  7 Apr 2026 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572200; cv=none; b=pMLdmC5xbnkkt6ZCnoOs02Rv/OUlJp16ad5RI6qSmcTjU5na1w9nRrRNu1cBDXE9GEah3m/cerlqPV+Cd701gonrvIkCC8JwM3ybsoRTvjtNAUeqOeGR9WhOB+DMpmO6ZUQKE25UxSpNd9t/T41X+azwqeeqGCk5nsrVEYt+jDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572200; c=relaxed/simple;
	bh=v3v0+1k+LCXsj9IbikgT+WkIoxCsJj+yQiW6/DSGn4s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=udslxyNHxRR/wYv+iOBrWtGzFm2bEjRTIGFsJtVKsCvM6YJ3o6GIuyx+y5gg7LUCa9Vug8UaPJR2h2EA22OJ4WZyo1wTTWYRizyLzwBy4LhkNpjRAQ/OzjMl1CG5tst6L8KeoZrwgshY6fCX0y5pt5R+NiO3kez6FGxBgUWsaJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BK1IOgjm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BK1IOgjm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0222B4E4294A;
	Tue,  7 Apr 2026 14:29:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAE03603C7;
	Tue,  7 Apr 2026 14:29:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63E89104500E5;
	Tue,  7 Apr 2026 16:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775572197; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xCE/Ogz7luzHG3jFHvscO1SI6y7qHQPVbWCRyJeBoIE=;
	b=BK1IOgjm8Fzptl3sPIEOMCrJo4g4ZsvJUMLSCpsU78QPqnn9lCV2aEDoy97I5bzp+fJvqo
	BfWnWzoXc1QRT4Fc+JBW2c536hygeyj6jatFBcVc7wukzVFbcKYK1rGsKGO9WPPUYhjcL8
	HMvNbihmrTtTsTzm4xwhwVJ/1CyOG2zuB7zgR/sBD1aY2hxAXsF7wInsnHb8BUV1AKvF43
	l37d26/dfY3CJbAVrErFJA5WV8qilxSexaqC3NrInf/bcHr/ClwITeJnTBrHbjwDidNWnT
	3yQ35aHmdFUrcng3SZtHnajo3raqpFVBL2xLThjTa3MTtgjtl7hGoIF54/gPFQ==
Date: Tue, 7 Apr 2026 16:29:52 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "David Gibson" <david@gibson.dropbear.id.au>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Ayush Singh" <ayush@beagleboard.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>,
 <devicetree-compiler@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree-spec@vger.kernel.org>, "Hui Pu"
 <hui.pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 12/15] libfdt: Handle unknown tags in fdt_get_next()
Message-ID: <20260407162952.443d9090@bootlin.com>
In-Reply-To: <DHHX2NDIC0DE.178QX4JKCVHF0@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
	<20260210173349.636766-13-herve.codina@bootlin.com>
	<DHHX2NDIC0DE.178QX4JKCVHF0@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Luca,

On Wed, 01 Apr 2026 17:17:46 +0200
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> > The structured tag value definition introduced recently gives the
> > ability to ignore unknown tags without any error when they are read.
> >
> > libfdt uses fdt_get_next() to get a tag.  
> 
> I think you mean fdt_next_tag(), here and elsewhere in the commit message.
> 
> >
> > Filtering out tags that should be ignored in fdt_get_next() allows to
> > have the filtering done globally and allows, in future release, to have  
>                                                          ^
> 							 releases
> 
> > a central place to add new known tags that should not be filtered out.
> >
> > An already known tag exists with the meaning of "just ignore". This tag
> > is FDT_NOP. fdt_get_next() callers already handle the FDT_NOP tag.
> >
> > Avoid unneeded modification at callers side and use a fake FDT_NOP tag
> > when an unknown tag that should be ignored is encountered.
> >
> > Add also fdt_get_next_() internal function for callers who need to know  
> 
> And here fdt_next_tag_()?
> 

You're perfectly right. fdt_next_tag() and fdt_next_tag_() are the correct
functions.

This will be fixed in the next iteration as well as the commit title (same
issue) and the 'release' typo.

Best regards,
Hervé
