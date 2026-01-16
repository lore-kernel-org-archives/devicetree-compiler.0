Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054D9394481;
	Fri, 16 Jan 2026 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580864; cv=none; b=gTODJ4E6jCSXpkCRieAHcM1ZAYQLDn1Mbh96d6ug/H+wSogyeIa8y/msoSTwN3hsZ0wUv0uYKP1UpF8X/VzPWRYTrJERlMvEgJ5ueYjHsJ7RZe7rH0BEkTY1vpLYMoxIZGUgnbqcDpPnjRJsihS+MqZhZi07yt4keT6YPs69MXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580864; c=relaxed/simple;
	bh=KPPHebms/O0zkV8byqjKx5N8f3ZIp0R83063ViJX6+I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WF6phswpYJKUUCwpZUuN1jezSE2dja+7AAeObZA15cc/dBPJ2PNvREOAaCULbVbv0Tqqr27oFrCYn68BLHEdO6WiZS0T1gaL659hYiO8AMJ/F/6xAjlIBLocOUEhn5MTBHSzgiECDsZeO1R2VnwQhPmOGG3qfqIsug9kRygNomQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oKfAPcOa; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oKfAPcOa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8DB03C1F1FC;
	Fri, 16 Jan 2026 16:27:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FF23606F9;
	Fri, 16 Jan 2026 16:27:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B594210B68C50;
	Fri, 16 Jan 2026 17:27:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768580859; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aaUK7nMVbgbCiPmttPyv2r5M2YeeZp2WCrBUDgQRPac=;
	b=oKfAPcOaR8Y9oYXTElMuRlNgJe5ajyRceXDCVwT8Vk2pRIRjAvwffUvfV8RiAbsgdOlzvy
	2R5gjgSKWWzKexnTm26/TGkHy1kRM71TIz6pwRNfGMAXSTsE62kRi95thk95ik9O2ghE5/
	eeNQLYbUd5P03x2asPVsHi8eKOjAzgmwb79wHnhaw7BADoVV8DWV8OjD5WL1QTpdHFPLCh
	H9+DNIm66l8P/gAYUhLAjpPyL40AgRD02aH3c6bVj0etwTtBUWR386uNjbpDpESziwqpem
	jlU4GZeNQ74vVfMNhBCZr69HjUnX2OweIj2waJ/SlU4+xtDVs/kFUlM8c8+Hkg==
Date: Fri, 16 Jan 2026 17:27:35 +0100
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
Subject: Re: [RFC PATCH 19/77] dtc: Introduce export symbols
Message-ID: <20260116172735.757c1872@bootlin.com>
In-Reply-To: <aWiAmjfMiKpC4sdp@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-20-herve.codina@bootlin.com>
	<aWiAmjfMiKpC4sdp@zatzit>
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

Hi David,

On Thu, 15 Jan 2026 16:52:26 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:09PM +0100, Herve Codina wrote:
> > Export symbols allow to define a list of symbols exported at a given
> > node level. Those exported symbols can be used by an addon when the
> > addon is applied on the node exporting the symbols.  
> 
> This seems to imply an addon always applies at a single node location.
> I'm not sure that's a good design choice, since I don't see how it
> covers the case of something that connects to several connectors.

Apply the addon on a node that knows about those connectors.

> 
> > In order to perform
> > its symbol resolution. Any unresolved phandle value will be resolved
> > using those exported symbols.
> > 
> > The feature is similar to __symbols__ involved with overlay but while
> > all symbols are visible with __symbols__, only specific symbols
> > (exported symbols) are visible with export symbols.  
> 
> This paragraph doesn't make sense to me.  What's a "symbol" if it's
> not something in __symbols__ or export symbols?

An imported symbols ?

/import/ foo "blabla";

from the addon point of view where this /import/ is present, 'foo' is a
symbol.

> 
> > Also an exported symbol has a specific name and this name has to
> > used for symbol resolution. Having this specific name allows to:
> > 
> >   - Have several nodes providing the same exported symbols
> >     name but each of them pointing to different nodes.  
> 
> That's not a property of having a specific name, that's a property of
> being local to a node.

Yes, exactly. I will reword.

Best regards,
Hervé
