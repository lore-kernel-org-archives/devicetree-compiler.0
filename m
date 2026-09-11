Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1374078E6
	for <devicetree-compiler@vger.kernel.org>; Fri, 11 Sep 2026 07:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113232; cv=none; b=qfeGBych1xjTt15+P9BJZAY9+En1QWJC4eqyGWj3xfjBcsEHaPSGVAtjr8FU3T23xWoRXWnzqppsY3K/WhkLDT+ipMUfaXvTzsMXwa/biNLoJ9SteEnt45ktnPFn7cAquGu3VoKJYHyN31d2Sbs2OSAXjoy0r45bfcQO5iw67i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113232; c=relaxed/simple;
	bh=x9CLRY42PqaytON/BBM6ACJRDjTKu1ui0543N4jgI0E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvKYiJBWplLhslpFOq0Et3wEZz7VJEKO+Zrv0v8L6WpnD7mKg/wyh6T6USvdY7l0LrlXdKsBkiZzyjEIUSH5VBdCuxqPisIgHsT9WsywvJoNnrPKls1jYT4NDx/+5gKxD0hwjq+XAe8kKXnUs9keihzHUSEZCkJQF8KIWJRqTfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1x4FiNJj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1x4FiNJj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9EB754E40134;
	Fri, 11 Sep 2026 07:53:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A391601DE;
	Fri, 11 Sep 2026 07:53:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A93FD11C7AF8E;
	Fri, 11 Sep 2026 09:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789113226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1jimcl3pdwhHCGx4G+jLWM1PzhhagK02dBVoH2hCI1Y=;
	b=1x4FiNJjYvCMcm4fh5I+NrlgH0ZYMb/m0ikCQ27/1D05MD7rmr/QRQWVkPv/HDUhh+psVD
	iz4Zeuyrf9HE/ba3wJnObM2cTCXZi6vGIP3AV1KM7H7kvMCPaLNoua/MYbtRhg998ookFj
	vDFdNkb0Cp4CozGfLM0D1rh84WaA4z1Io+9tJKpKZHiuwVY5EH9kNK3a3R5EmbsvgVtZTf
	faBKp+yrvyx2wbOD2fLlXOAxmlHuwG0GCLDynv4bTqy/RKygwQ8QsLUGMySGAiDWnSIknk
	YGozv+xHK+5Ws4vvfEzqMnkvNjSOvqHytt8D+EPa01mmOTjMn4D0oOUFNSuhtA==
Date: Fri, 11 Sep 2026 09:53:39 +0200
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <20260911095339.14833b5d@bootlin.com>
In-Reply-To: <aqJ7SC9s5z1FRML1@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-7-herve.codina@bootlin.com>
	<aqJBOdFPJbDKHt_9@gractus.seuss>
	<20260910095823.1f5abc2b@bootlin.com>
	<aqJ7SC9s5z1FRML1@gractus.seuss>
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

On Thu, 10 Sep 2026 19:41:42 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

...
> > > > +/* Tests reserved tags */
> > > > +#define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, 0)
> > > > +#define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0)
> > > > +#define FDT_TEST_2CELLS_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_2CELLS, 0)
> > > > +#define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
> > > > +#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)    
> > > 
...

> > 
> > /*
> >  * Tests reserved tags
> >  *
> >  * A TAG_ID range in "structured tags" is reserved to tests tags.
> >  * This tests reserved range is from tag_id 0 to tag_id 0x100.
> >  *
> >  * When those tags are encountered they should be considered as "unknown"
> >  * tags and rules related to "unknown" tags must be followed.
> >  *
> >  * Readers should skip them or fail depending on the SKIP_SAFE flag. Writers
> >  * should never use those tags. Their usage is only acceptable in test cases.
> >  */
> > 
> > Is it ok?  
> 
> I'd probably put the reserved range up high somewhere rather than
> starting at 0.  Otherwise it looks good.
> 
> 

Ok I will move the reserved range at an higher area and probable the
highest possible area.

Will choose also the highest possible value for FDT_TEST_NONE_NO_SKIP
Indeed, this one is a non-skippable tag and so should use "old style"
tag.

Best regards.
Hervé
