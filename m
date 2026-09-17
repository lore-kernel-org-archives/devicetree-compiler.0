Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC53955F6;
	Thu, 17 Sep 2026 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635399; cv=none; b=OAhXE9+jzVZO78aV4wuX3fYTGqY0M+14ne2ClTHxJrDw8Xy8GzQbTzv1jef5My14qnZUxkUEvvCPtG8p2c3e0uRkeAjHiRl+kzhCiRWGLxHFSVAvseQKId9/7G3KDjBhf4p8Hj02hARRG9JeAnxd5vd6U6jsZj2MqJi0CVx5izQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635399; c=relaxed/simple;
	bh=kdiOnh+GsU5d1rD2flvYj89P5gX1Dk5qBVQX7c3DlOM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ndxeas1WpM/6VG1GXfo87zRMuh9Kv48q6lYTu7quhnbHFGj9R0lu7CxxB9x+vDvtoAkvPekrv1V6fXop+3bh60vXyzfxnodx1TNbuLK4/3EB1sUr5+dND8834M/8k5kq4wwJ3Xzg9X2Nv7V/GwJUKWI839AG3JLMSz340dVQkO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yHXNJPhS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yHXNJPhS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A95064E40658;
	Thu, 17 Sep 2026 08:56:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D54B5FAA3;
	Thu, 17 Sep 2026 08:56:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B40611C7B06C;
	Thu, 17 Sep 2026 10:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789635377; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wxmtzGTHOhJMvWhaJPsR2kpeTDmIIsU636OajBBsDHk=;
	b=yHXNJPhS1JuJHa+fh5seY0/UlpEd+emuizCS/Ld0O1sdgqxnqROCk+GPRXGYrA1MHExECw
	V4DQ47jHxtTjgaOhRk6tP4LUg8m/2Xr2p5+7c+xLTMXiyteP5cHAISnU7BNzpTQd6za835
	cmop59GrN+Z7HdMU88D45VdGaz5DA5eAojA8JpjE5MKFA1f4PdjJ/P33U+aMwalGgNwheY
	4+lmivIoM60fXxC8vgAgStgKCgnbTEtEvwg2r8IMY/fWoOAILJkCgEmGsXVQd6z0X+90Hl
	cPKTdEk7s3ihO2HMb1XRi52i0/v2oSdvWFoXg3iBtHbWBgM9EJENMNMkKIAHRQ==
Date: Thu, 17 Sep 2026 10:56:12 +0200
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
Message-ID: <20260917105612.0900797b@bootlin.com>
In-Reply-To: <aqS6XbyzTmVIv4vr@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-7-herve.codina@bootlin.com>
	<aqJBOdFPJbDKHt_9@gractus.seuss>
	<20260910095823.1f5abc2b@bootlin.com>
	<aqJ7SC9s5z1FRML1@gractus.seuss>
	<20260911095339.14833b5d@bootlin.com>
	<aqS6XbyzTmVIv4vr@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Sat, 12 Sep 2026 12:35:10 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Sep 11, 2026 at 09:53:39AM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Thu, 10 Sep 2026 19:41:42 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> > 
> > ...  
> > > > > > +/* Tests reserved tags */
> > > > > > +#define FDT_TEST_NONE_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_NONE, 0)
> > > > > > +#define FDT_TEST_1CELL_CAN_SKIP		FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0)
> > > > > > +#define FDT_TEST_2CELLS_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_2CELLS, 0)
> > > > > > +#define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
> > > > > > +#define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)      
> > > > >   
> > ...
> >   
> > > > 
> > > > /*
> > > >  * Tests reserved tags
> > > >  *
> > > >  * A TAG_ID range in "structured tags" is reserved to tests tags.
> > > >  * This tests reserved range is from tag_id 0 to tag_id 0x100.
> > > >  *
> > > >  * When those tags are encountered they should be considered as "unknown"
> > > >  * tags and rules related to "unknown" tags must be followed.
> > > >  *
> > > >  * Readers should skip them or fail depending on the SKIP_SAFE flag. Writers
> > > >  * should never use those tags. Their usage is only acceptable in test cases.
> > > >  */
> > > > 
> > > > Is it ok?    
> > > 
> > > I'd probably put the reserved range up high somewhere rather than
> > > starting at 0.  Otherwise it looks good.
> > > 
> > >   
> > 
> > Ok I will move the reserved range at an higher area and probable the
> > highest possible area.  
> 
> Sounds good.
> 
> > Will choose also the highest possible value for FDT_TEST_NONE_NO_SKIP
> > Indeed, this one is a non-skippable tag and so should use "old style"
> > tag.  
> 
> With non-skippable new-style tags no longer being a thing, do you even
> need this tag and test?
> 

Yes indeed, the test and the FDT_TEST_NONE_NO_SKIP tag can be just removed.
I will remove them in the next iteration.

Best regards,
Herve
