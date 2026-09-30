Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71F24C33E9
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Sep 2026 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768733; cv=none; b=n4y43ZC3ef/shqPwDssWu6G4eYA1/PatfNB3dLcOOJki41kpDh1MBc48WvdcyC9+Epk6EHg1ezuXk2P7xDNFSd5DMXW7PAi/o5xTxe9ni236/RoBZmEQwtqiXOV6SqdX9Bo5vaOc2It8NhcvhuZk2VZ2ZU/05r0qPxh2YB6Ei8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768733; c=relaxed/simple;
	bh=m57PLjCcf8y63R90gePUV9tyZwtrY7b5N5CRxFHJacE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJZh55osRsbOCldrdZ038y84ULU7QFGeCyFZtzcArWIgd6xoMl8uZ+98FVqopFSkWKdnOF3oK1OcvXgL13arojLcDCoQXps3oUInN6V00GbsCPkGwvKsUFcIs4PmGn7KFMCN0U7H39qWPP5YcNXta50O5QvGJX98lT2vc7jnclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A5T1eDq8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A5T1eDq8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F373B4E410C7;
	Wed, 30 Sep 2026 11:45:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC82560749;
	Wed, 30 Sep 2026 11:45:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B18CD103288F9;
	Wed, 30 Sep 2026 13:45:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790768727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U/bVVcCqW2GOUO+80+Gt3hwLdrceTV4S1v5GYbcBv2E=;
	b=A5T1eDq8Uy6fl7F2eywnRA1p1bQGjN8l8KJOUNV3YmCS4r0NDt/6WkQIuM7XgAyKGyo2UP
	z9qlKJuades0GzFr7A3eOhAP65m4o7yWdebo6/3hdXEMJ6SxtI8lR75Gw1yN4AIvoZrI/F
	0/1eV84BaE7q5DzNAG/+iKNq8q27S/M8bavkt5Vo4HnnEdznZKHSsiU/7WLx+gr4cBbEbW
	LHSEIWE+4UUnBCrtXpUTkyGjnLzzGcos19ZkuvRr6vpr25CqDKaCYIXs7DuAHU8uSoJDDR
	NjkrIsSqq6q4bwFAdA1Is4PkeA6c+p7hroe95QEfav/CpHaRVXDu4X4aD8MhKg==
Date: Wed, 30 Sep 2026 13:45:22 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Warn about overlapping reserved-memory ranges
Message-ID: <20260930134522.35dcd951@bootlin.com>
In-Reply-To: <arzaAE-rwQUNKtpK@gractus.seuss>
References: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
	<20260925190300.7e3c1620@bootlin.com>
	<arzaAE-rwQUNKtpK@gractus.seuss>
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

Hi,

On Wed, 30 Sep 2026 19:44:42 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > 
> > Weird to have '[' and ')'.  
> 
> [x..y) is a standard notation in maths (it means x is included in the
> range, but y is not).  But that doesn't mean it's generally known.
> 

I was surprised by the notation and I've looked deeper about it.

Two different math notations exist for an interval notation [0]. The one
you mention (with square brackets and parenthesis) but also the one I know
about (square brackets only).

Knowing now about both notation, having "[x, y)" is not weird anymore. It
matches the "[x, y[" syntax I know about.

[0] https://en.wikipedia.org/wiki/Interval_(mathematics)#Including_or_excluding_endpoints

Hervé
