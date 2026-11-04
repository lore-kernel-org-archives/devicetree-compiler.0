Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782127;
	b=Z5c5i/16MaiT5U4/M+wYrmAmThhu8pAF/rqr2QZT8unfq5YMW5/WefWAl/s3xgAPfamL
	 y64yP7wzVMSPfBU5X3oYigOJykv3gxH+MsdqPQdO+fGsmpFfGldcEkBOWQNzQOxpC7U1j
	 Tb0SoMzoIVAFHYHtkE4F0wYFc/rqrkbNBQC9Dvowdw+wYuFnMQlgLxZXBVl408Yc/LAVf
	 H09Z4sNtfYHep5TB8hvZU8uAilTfYIN2U8ORHVdKgGL7gUr0rxXVcjThkHHTunCRTbUdE
	 gdB7Bflzv78W03kLEDLg4l2waGSn3tHsm6fCy8ZS5Z4cgas6MvkxhVr+ydqy5JgiKRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782127;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=hKl6v5J2yLePYcQ6uJpmk/E/6XV+9DoBAu8LcbAyp9w=;
	b=lUB5XISdwJaCDF6XUOhKweB3v09kyaCXcGDQAW6psJMWF/ExBQuZ9sUT4FaUHe6f9nA3
	 KtZd50+M2xno5t0nEkxEGTzAItJjGz2E3w61tTAweHyTDJ74tLRxJhL136qXuInH5SPuF
	 +BCHkRw9FkikibCx+cQRk0Mi65b08cFr2QAMmtjjHEwMtJlSVPlhRTIi8FHtmuyJLmdWf
	 hZbKZRYKY93I3QxnkrHIGBGiJWeXOdVJOqlcm941ALVhNNZ+kw3TNO4ItTM6b4E6Wt4Kr
	 iSrQBWCnahNAhiciVf8qh69xfclFJKLkXI7aGqRIknJ9SotkUukJ5N/Fs7gQc3Xb+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wbho0WSU;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C671606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 08:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C671606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wbho0WSU
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D5256C8F46C
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 08:49:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAC9060770;
	Wed,  4 Nov 2026 08:48:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FEC2103290E8;
	Wed,  4 Nov 2026 09:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793782117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hKl6v5J2yLePYcQ6uJpmk/E/6XV+9DoBAu8LcbAyp9w=;
	b=Wbho0WSUeETUO9iAqnEVTMowDOses/46y2v+uir9GN7Bk5nv6yeZdHVhVR87tBJCufAumM
	lk6Vfda0SEKHJhJkSEgmInz035CrzFdMq82l62QbRyAZVxVluiGbPvYgIOvIWaDmk6h3u0
	X7IHY41xUzb45+VMtgkpY+crQAuNrLpe4QdgBLTUyFprquiFG/3e0SkQu7xMf4KaTs4Paj
	LjhTr6G3k8N9hpL6bGZyM1IDAT6QfFO5cZTbl+R9VKJ3CEUI1Cd5JxaUjEbofSwjmqeImx
	kt5GnVpqaV30+NRLVYSI660ibhbibLAC80PnkvY7vE8LuhtxVHBdKIQJoN6F6Q==
Date: Wed, 4 Nov 2026 09:48:34 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] dtc: Fix deletes within a section and before a
 redefinition
Message-ID: <20261104094834.5aaf1b17@bootlin.com>
In-Reply-To: <aurKRLcMjjFA70CM@gractus.seuss>
References: <20261028093620.3705074-1-sjg@chromium.org>
	<auK0ERvxGCJGSc3p@gractus.seuss>
	<CAFLszTjtkEjBMhbKomVr6WhrZH7hN3AcAMBwN2mvdmf+T-DQdw@mail.gmail.com>
	<aufqF92dKRRdb3V3@gractus.seuss>
	<20261103140030.3aa7b134@bootlin.com>
	<aurKRLcMjjFA70CM@gractus.seuss>
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

On Wed, 4 Nov 2026 17:01:55 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Nov 03, 2026 at 02:00:30PM +0100, Herve Codina wrote:
> > Hi Simon, David,
> > 
> > On Mon, 2 Nov 2026 12:41:24 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> > 
> > ...
> >   
> > > 
> > > Yes, that was my intention, though we can revisit it if that breakgs
> > > things for people in practice.  This was the way it was before
> > > source-level overlays were implemented, and still is for the "base"
> > > tree fragment in a file.
> > >   
> > > > In an overlay, a top-level /delete-node/ &label can remove a node from
> > > > another fragment of the same overlay, as Hervé pointed out. I assume
> > > > that should keep working, with only deletes of something in the base
> > > > tree being an error. Is that right?    
> > > 
> > > Uh.. yes.  In a sense this is a question of whether we try to
> > > partially resolve the overlays in a /plugin/ dts or not.  i.e. Do we
> > > attempt to merge those fragments we can, or do we translate every
> > > fragment directly into the dtbo to be resolved at runtime.  I'm not
> > > sure there's a clear correct answer here, so I'd err on the side of
> > > maintaining existing behaviour.
> > >   
> > 
> > David, I don't see you point here.
> > 
> > IMHO, /delete-node/ and /delete-property/ keywords present in a dts
> > apply to the generated dtb.
> > 
> > A dts with /delete-*/ will generate a dtb with related node/property
> > deleted.
> > 
> > A dtso with /delete-*/ will generate a dtbo with related node/property
> > deleted.
> > 
> > David, I don't see why resolution is (or should be) involved here.  
> 
> So the restructure I'm now suggesting here means that processing those
> deletes doesn't happen during the parse, but as an explicit later
> step.  For dtb output, that must result in a single tree.  For dtbo
> output although we may be able to merge some parts, we don't expect to
> be able to fully resolve them.

Yes.

> 
> Given that, and ignoring deletes for now, the merge step could be
> entirely skipped for dtbo output: just emit each dts fragment as a
> dtbo fragment and let them be resolved at runtime, regardless of
> whether they modify things from a base tree or from earlier fragment.

IHMO, having possible merges done is better but well, we can have
unmerged fragments.

> 
> However, once we consider deletes we need an intermediate
> representation of "a delete" within a fragment.  But that can't be
> encoded into dbto format.  So, deletes in a /plugin/ dts require that
> we attempt to resolve the fragment merge (as much as we can), rather
> than leaving it all to runtime.
> 

Ok.

Best regards,
Hervé
