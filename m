Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB032693E;
	Mon, 19 Jan 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831914; cv=none; b=gSdd6oohN4txShpDMKLAFr7sclPwWwyyDS1EZXxmHeVwVWmPR99bjOdhdLlAXvO9zOlF1FLpxmBMy0QDT5T7faJ4evon1nVfuAHVjHuKDpcCXGz7GDcMj55YTUKJA3CH6FtvHRjyaD8/mfpxJPX/V8U7i+MPpzJL7AEcJv/pl5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831914; c=relaxed/simple;
	bh=QVnAQXATigDPFxgb2z2Vvw/8470ub4WmV5WzsyDyK4w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uL4UeXw29rCOhHEoLR5FHhHq2s5lo4ldyyIbB9gs5azAJeYxL/4CdpFKhi1+1XmZ1k/TNIq18N9qSIgTRET5esSEndJreKrCEhQ1wz7GD1dLRLojx/q44TzljB82yxJ3E4lyzyKNzTjA77U168+Sp0KGZUGd0WmiiuDI8mo4PvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VHAPs9o/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VHAPs9o/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3067B1A2963;
	Mon, 19 Jan 2026 14:11:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0350760731;
	Mon, 19 Jan 2026 14:11:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1366E10B69816;
	Mon, 19 Jan 2026 15:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768831910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zBnoXZkSDvXVR2uiVsNq/HoNx+6eyb4cj7sy3fWGhx4=;
	b=VHAPs9o/0bh98pJpJm+4YjDxevnw+lNDeaCne/NHTsIN/Ryn2gOh6+plwi6VQB3v4kHxCs
	8uFii8UixVPvu52ZcLZnNXjxXn/SqmfBV+z5v4xHjH50nTxnyfTzQ7OtLlv++zvGSzd0NM
	nSRTDnoU4Y8lzJ6cWPuCcQ+OSwi6vcoSCVcfoY4d5H8O1do87Akt4xdZEux//0RSspcC76
	Zdn8F5PwHAGo7LaAZX0NeS6bADz47d4nQyBYpnALp4lFCG/AJThSsBMRkejYJ5CAancej3
	OpFc/kjOyZamxlJIngSXIobI6Bv6qCDskxAgGXq6YOUT4tEpQ4TG5WN2Rzx0cw==
Date: Mon, 19 Jan 2026 15:11:45 +0100
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
Subject: Re: [RFC PATCH 32/77] dtc-parser: Introduce last_header_flags
Message-ID: <20260119151145.2f67139e@bootlin.com>
In-Reply-To: <aWiJvEEgjl44h6vd@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-33-herve.codina@bootlin.com>
	<aWiJvEEgjl44h6vd@zatzit>
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

On Thu, 15 Jan 2026 17:31:24 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:22PM +0100, Herve Codina wrote:
> > The parser needs to get header flags value in different places.
> > 
> > It relies on the fact that the rule used to parse the dts file is always
> >   headers memreserves devicetree
> > 
> > With that only rule to parse the file, it uses '$<flags>-1' construct to
> > get the flags value.
> > 
> > With the future introduction of import symbols parsing, this rule will
> > change and the parser couldn't rely anymore on '$<flags>-1' to get flags
> > value. Indeed, import symbols parsing will add a new optional symbol in
> > this rule leading to two possible rules (with and without the new
> > symbol) to parse the source file.
> > 
> > Introduce the last_header_flags variable to explicitly keep track of
> > flags while also being agnostic of the rule structure and use this new
> > variable instead of '$<flags>-1'.  
> 
> I'm not sure this approach is safe: I'm not sure bison guarantees that
> semantic rules will always be executed in the same order, so using
> global variables is risky.

if rules were not executed in the same order '$<flags>-1' construct would
not work.

The problem is not the order. I don't think the order will change. The
problem is related to the number of items on stack.

With import symbols, that the stack will be:
  header memreserved devicetree
or
  header memreserved importsyms devicetree

Using '$-1' will no more be possible. Indeed, '$-1' from the devicetree
rule will reference 'header' in one case and 'memreserved' in the other
case.

Without a global variable, I don't know how to reference 'header' (or flags
value) in all cases.

Any better ideas are welcome.

Best regards,
Hervé
