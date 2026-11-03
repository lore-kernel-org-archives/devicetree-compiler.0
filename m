Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710838;
	b=2CBrPlEAs01Y07nhGDpurLYfBtliphwUvVM+esS9YfSmWonRgQ++lq9JL3zwEmm4n98m
	 o/BNCQfzYEJh9bdY/YniciYhnPKBhqzlZXd+3yP7XjXElSOE6cQiw8dpqRADiG7UsQhLx
	 gsm3ULJ+3+D//lg2FsmvepjD8cyDsRjOgJB1/hSR4nLWqrYX9xUqxc4J/xvhQMY38J2Pp
	 Is3HqBcXVGc6ZP/bxVBRRfpLexdAyXgMY90GtDkRhr5lVJOBLbPm6c3i0HlS+zsc3i4Oq
	 IoP33vPxPYzf6Hjs5AsMVhgDQvFhePwaXnCJFeHtJaFAB7a/xn0gMwLi0Sq59DZYMxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710838;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=yiMaSLMFw4Ic9Foa4GZc0f3FrFYvtdiHp35IA1jyHSg=;
	b=h+fNTmJIOKGc+5oGmg6TXbaHQfsR53HG4j2G4tzXRt+4fMViI58ebi+ArmvxHXTe6uK6
	 t/VHtN67tM+0J0MloFgQ3YdDT6ILEfzIGjhwKiCQFtYprSZD1SzZ6wpmgrglXw6XaUDJB
	 PGlLT4C3PP8zJSqqgyQrwOFOGQKgfgBXWEvG10Qyp+Y4yiEZwvWHBHGU4w9d3pWZ+51uW
	 VcSp8ToxRiEzqRfDahs2fQPbMCtkinz0b3W/RPnWpmObznTpaRL5J86fdaSQPz4ZgCsU0
	 SIQeYX76nJC7lzipNAQYFJa8AHD4WuoRbduwNR/Cqas6b6YdgYyRU0Go8uxLWkjLGjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Aj2PHO4l;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D572606D828
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 13:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D572606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Aj2PHO4l
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7CDB34E413E5
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 13:00:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 52AA46046C;
	Tue,  3 Nov 2026 13:00:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C274810328C5E;
	Tue,  3 Nov 2026 14:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793710833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yiMaSLMFw4Ic9Foa4GZc0f3FrFYvtdiHp35IA1jyHSg=;
	b=Aj2PHO4lnWeN3OIsimngXqMZQFsjVOOuXP66T1QNYnTmvyHAtdvnQhCXonTLhYmsQfzvOZ
	B/q2elPFHzYStBH89KFrhgi2qr0eR4oJRnkvAJAqEtGjMePgdx+se51E4swoPwNTj53Mzl
	GbLbJj4juLJmfKf6EaahCsrF2oTlMpnkke57ETwBEh8prnM8LrKnBhwXkN1zP0shUS+gCl
	j0UYDWVeE0A/lGkkwQRciJhfqdoXM+mPUdeZpRi+Hcf6mQ9c7+dl0iN8eQbNbF4RcVHCOn
	NzRyYHLNi1+NrmJEDvZzFRvl5WPyBKjzmcyemgiuqEA5elk20bL/t9CYfAtmsA==
Date: Tue, 3 Nov 2026 14:00:30 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] dtc: Fix deletes within a section and before a
 redefinition
Message-ID: <20261103140030.3aa7b134@bootlin.com>
In-Reply-To: <aufqF92dKRRdb3V3@gractus.seuss>
References: <20261028093620.3705074-1-sjg@chromium.org>
	<auK0ERvxGCJGSc3p@gractus.seuss>
	<CAFLszTjtkEjBMhbKomVr6WhrZH7hN3AcAMBwN2mvdmf+T-DQdw@mail.gmail.com>
	<aufqF92dKRRdb3V3@gractus.seuss>
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

On Mon, 2 Nov 2026 12:41:24 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> 
> Yes, that was my intention, though we can revisit it if that breakgs
> things for people in practice.  This was the way it was before
> source-level overlays were implemented, and still is for the "base"
> tree fragment in a file.
> 
> > In an overlay, a top-level /delete-node/ &label can remove a node from
> > another fragment of the same overlay, as Hervé pointed out. I assume
> > that should keep working, with only deletes of something in the base
> > tree being an error. Is that right?  
> 
> Uh.. yes.  In a sense this is a question of whether we try to
> partially resolve the overlays in a /plugin/ dts or not.  i.e. Do we
> attempt to merge those fragments we can, or do we translate every
> fragment directly into the dtbo to be resolved at runtime.  I'm not
> sure there's a clear correct answer here, so I'd err on the side of
> maintaining existing behaviour.
> 

David, I don't see you point here.

IMHO, /delete-node/ and /delete-property/ keywords present in a dts
apply to the generated dtb.

A dts with /delete-*/ will generate a dtb with related node/property
deleted.

A dtso with /delete-*/ will generate a dtbo with related node/property
deleted.

David, I don't see why resolution is (or should be) involved here.

Best regards,
Hervé
