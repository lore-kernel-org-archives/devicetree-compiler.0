Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42891C8626;
	Fri, 16 Jan 2026 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570571; cv=none; b=VweRA/iJFrmMC/g90aprSzvOBhDFn+F0qla3/m3v3OQr0G3AHuvpjQTuuQSI/RSveGps2soDwD1E/u9L76IaxSgKP8aHYEA1yCbqO+2lcPpPRPPqSOH8DckpME+VvRLJcbugH0utGIeJPHlrcVL6nO1ArUuhcmW7KoCG87xI5mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570571; c=relaxed/simple;
	bh=SqaE28L+BIfKar/T+pLOn5aZOKr5wXy2kDvgIFUSX7w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/oaPxd7z36MnZGH2Z6IlraYvTBL0432iwv3lqr2CsnQP3OYasFxE8HjNOZ8VVk5d5mtLB1jMYKjyy9J83YgB5oAMwdOooUQMxcmC8wAsEQetcNLrPPpipdzov20YhpEu8i4J+5m0jDAStiqwIkKW/QlJ011GsdgSpXkBW88XKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KyHedZvx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KyHedZvx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2EA07C1F1FA;
	Fri, 16 Jan 2026 13:35:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C7660732;
	Fri, 16 Jan 2026 13:36:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E056710B68A96;
	Fri, 16 Jan 2026 14:36:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768570566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3fdOsjcVVBmzDRNcI+ru+Uu3VzOKUdDXyPGaxdnDz10=;
	b=KyHedZvx7rtmHe/cnnbNoKHaQS22Or4qHnCC4b4eQ0jNJH7x4QBldH0/UUPUXfMsNjhDTx
	OGeVUTOd/P6x1mUovZLDDscxP5ZbVZSU5zLvOL5LXdM0LqdMBKJGhEylyJH+aCuGJWGjZK
	w83tVr6JpRwvBD46qZ9Id7CPrlPRVC0EKBB4AtWpbNSbGZ3sobEatTH7RqgXUBd10ZBxES
	IVI+zb0ctXXO25GxCG3rU8WOkDadzRtJnATmVFU9IngqF3f951IHjsGU5wyBH1ssBV+0jr
	WmwS/kfIkpBkmWtEb3dJVsFsb4Cg/Mg/0vfQ3A3EMiR7GDRAYAnnieKir1k0xw==
Date: Fri, 16 Jan 2026 14:36:00 +0100
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
Subject: Re: [RFC PATCH 10/77] tests: Add basic metadata tests
Message-ID: <20260116143600.5aacf12b@bootlin.com>
In-Reply-To: <aWg58Gfb1KnMvQoG@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-11-herve.codina@bootlin.com>
	<aWg58Gfb1KnMvQoG@zatzit>
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

On Thu, 15 Jan 2026 11:50:56 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:00PM +0100, Herve Codina wrote:
> > This first test is related to local phandle references (FDT_REF_LOCAL
> > dtb tag).
> > 
> > The test pattern used is
> >   - Generate a dts (xxx.dts.dts) from an input dts
> >   - Check this generated dts against expected contents
> >   - Generate a dtb (xxx.dtb) from the same input dts
> >   - Check this generated dtb against expected contents
> >   - Generate a dts (xxx.dtb.dts) from the generated dtb
> >   - Check this generated dts against expected contents
> >   - Generate a dtb (xxx.dtb.dts.dtb) from the generated dts
> >   - Check this generated dtb, expect the same contents as for xxx.dtb
> > 
> > Even if only one meta-data feature is currently tested in this tests
> > introduction, use a loop in order to ease future addition consisting in
> > adding new input dts as soon as new meta-data feature are supported.  
> 
> As a rule of tumb, I prefer tests to be introduced in the same patch
> that introduces the feature tested.  Usually, I don't care that much,
> but in a giant series like this, it would really help review (the
> tests help to document the feature being added without switching
> between patches).

Hum ok but it is worth noting that a feature needs several patches to be
fully supported.

In order to ease the review (maybe I was wrong), I chose to have distinct
patches for modification related to new dts keywords and for modification
related to new dtb tag and tried to have patches as small as possible.

The last patch of a new feature was a patch adding test.

I am open to remove patches that just add tests. In that case tests will be
added in the last patch related to a new feature. You still need to switch
between patches in that case.

Further more, during iteration, the last patch of a new feature could be
modified just because the test part is present in this patch even if other
part of the patch itself is not impacted.

I mean:
  - patch 1: related to dts keyword
  - patch 2: related to dtb + test

Update patch 1 will imply an update to patch 2.
I am not sure that this will ease the review.


To avoid that, I can merge all patches related to feature into only one
patch. This patch can be quite huge and I am not sure that it will be easy
to review it.

Once again, I am open to merging patches. Let me know what do you prefer
in terms of patch granularity.

Best regards,
Hervé
