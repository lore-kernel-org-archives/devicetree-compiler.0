Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20F239A7E5;
	Tue,  7 Apr 2026 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551885; cv=none; b=FxMKIO3guSvtCbx+E0i9YuCZDCfDbG/CQ1pYZtttsC5hyUW52eP9DxsxI+aIDGj3qugGRaUqGaISn0nm5Q1ilS7BDH7V985dhUDvzbBw2Kng+YO7WpiUCL0QNE8dbbK4+V5hSJVAiDH3tT2ZDLciZN6PCcUCX/VN9fDgRjDEf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551885; c=relaxed/simple;
	bh=Ahg9vdJz943hFz5wvxcMOJCGbsqUVvccdAeDILnAfNA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSrAlTKz30QwMnlABbjb4TQtM1eLfR+owkyDl+73Zef6neVuuj1GdQUFOp8klSgQu64NaOCVvjdBVu9QAxgyQT9dUPooogczkUK2rmZpVbsM8OFZz1OuyH3zOxVdQzeNh1rowHRhwPjFHREhmaBp4h37MOHZuSNf+d5C1P/GqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sPibANfZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sPibANfZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 11A8A1A31B2;
	Tue,  7 Apr 2026 08:51:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0D3E603C7;
	Tue,  7 Apr 2026 08:51:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5E5A1045021A;
	Tue,  7 Apr 2026 10:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775551876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=34dWfgt8RETdYQ5i5Y66cncGUqJhP18j4DDELxo0hGY=;
	b=sPibANfZWhfnKBLE0Ea+NqC9VsMh/cBKgwtdSHBZm0qqIWzea5XPbCJdo15H/SCQf0j35m
	HG6rxYYRRUkt6hsu2zAyLkcET/Ydo5k8yrWqHNgtG4u8DtyG9vyGZhlnT82EyJn2lpJ7ON
	EZhVPr/h8K1Y3kbbglCR8/A0ZZ/nyAcwpG6MOFjtbMiF4ao0sWnHM7EVteoHLon11awjTQ
	m+bDotlSnd/wdnET1OGw1Fkjo4eqVPLlKCiLkS1na8BcM33oM6vaUJw597k2UA6B+ZsahC
	+OedEPJprPzHCQt+phHrRLBZC9L5l64rYkPYnrAqI/D/qiLirCcBidj8fNO2NA==
Date: Tue, 7 Apr 2026 10:51:11 +0200
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
Subject: Re: [RFC PATCH 06/15] libfdt: Don't assume that a FDT_BEGIN_NODE
 tag is available at offset 0
Message-ID: <20260407105111.10178de4@bootlin.com>
In-Reply-To: <DHHWY06CRC21.XENO1ENNAV55@bootlin.com>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
	<20260210173349.636766-7-herve.codina@bootlin.com>
	<DHHWY06CRC21.XENO1ENNAV55@bootlin.com>
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

Hi Luca, David,

On Wed, 01 Apr 2026 17:11:42 +0200
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> On Tue Feb 10, 2026 at 6:33 PM CET, Herve Codina wrote:
> > In several places, libfdt assumes that a FDT_BEGIN_NODE tag is present
> > at the offset 0 of the structure block.
> >
> > This assumption is not correct. Indeed, a FDT_NOP can be present at the
> > offset 0 and this is a legit case.
> >
> > fdt_first_node() has been introduce recently to get the offset of the  
>                             ^
> 			    introduced

Will be fixed in the next iteration.

...
> >  int fdt_next_node(const void *fdt, int offset, int *depth)
> >  {
> > -	int nextoffset = 0;
> > +	int nextoffset = offset;
> >  	uint32_t tag;
> >
> > +	if (offset <= 0) {  
> 
> What is the difference between 0 and a engative value?

I will add a comment in the code.

0 means that we want the next node from the first node.

The negative value is an invalid value. In that case we start from the
first node. This was the behavior of the code without my modification and
I kept the same behavior in that case.

> 
> This is where the parameter value is not obvious to the newcomer and I'd
> love seeing it concisely documented.

David, is functions documentation expected ?

I can add to this documentation if you want it.

Best regards,
Hervé
