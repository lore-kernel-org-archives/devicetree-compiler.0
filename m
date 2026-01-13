Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92DC354AF9;
	Tue, 13 Jan 2026 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291358; cv=none; b=FHIivqznkKPFSaUY92/CWUQmMxNGNOJncX8G5cU0A8ct5T3sNYx1zonh8TTRHHHf1DKqbCGxwarHVtvoLUasbYjwZ8hYYt7tDuA6ncodxo5VPDW3Bc8DP6jCOkKY+o+rqVCrnB0JIVxcQ4oZ0xwO9QPLMfygMYGx+noZ8UQ3FOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291358; c=relaxed/simple;
	bh=qcXa97CRToZ5YY95GwskKDcO6CO5tuicjzb8ZpokXh4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pAAygf8oV6zGlxIPeYziJKaQYQ9HOVP1oIToBaypAQxwKja61ZgTdyGHaT7/rOf9S9nbjXdCt8lZU0LWNY2Jh20Ooye4kmFOd3vIVR3Q7T+YViBtH/dbBTB7tlJnIu/LDvtHVf4mDrO4phlc3Ap8IE5kSRhst50sz2dGXwEY8Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eUq1SejK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eUq1SejK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AA07AC20878;
	Tue, 13 Jan 2026 08:01:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 316BE60732;
	Tue, 13 Jan 2026 08:02:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 698A7103C92AC;
	Tue, 13 Jan 2026 09:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768291343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1SJc2k5EYXpf3Mw2uOPUkgNSsGuCU2bdxx8UB84ppvE=;
	b=eUq1SejK6Y7BhoFfM4i7J2V+WVSwAYNMDVqPn+AdkjVRjy1h7LCJ8PW5UGmYZMJnfbWxvS
	fhztrUDxpqAuTwX8QaVTqgSHYQ9l9LVxRxditM34ZJCyxxUIgpgCRCwe8Ee3knG+RiMoeM
	xeoSErFUoB+aqUImq9SUJ0aujOyclWF0umvY/s5xdrtiBxINmdV+xzvqYgEXbouQxhDPh/
	LcN27kcIKy/ns/zNRZfQuo+E2ROB0/aHT3+HxJmZrGJ444xD/EW0X5t5Lb/0PGgshfWyiu
	ogdIgJLNh65Bo4XWWA8ZTviAcL00Mnq9mDBwsvuBnnVqEk/W57/iGYr/i51ysw==
Date: Tue, 13 Jan 2026 09:02:16 +0100
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
Subject: Re: [RFC PATCH 01/77] checks: Use consistent type for strspn()
 returned value
Message-ID: <20260113090216.34d71ee4@bootlin.com>
In-Reply-To: <aWXNN0bW_xx-YMy1@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-2-herve.codina@bootlin.com>
	<aWW3Rs_uoJdksA_n@zatzit>
	<aWXNN0bW_xx-YMy1@zatzit>
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

On Tue, 13 Jan 2026 15:42:31 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Jan 13, 2026 at 02:08:54PM +1100, David Gibson wrote:
> > On Mon, Jan 12, 2026 at 03:18:51PM +0100, Herve Codina wrote:  
> > > strspn() returns a size_t value.
> > > 
> > > The function is called in several places and in all places this value is
> > > stored in a size_t variable except in check_node_name_chars_strict().
> > > 
> > > Fix the variable type used in check_node_name_chars_strict().
> > > 
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>  
> > 
> > This one makes sense regardless of the rest, so, merged.  
> 
> I spoke too soon.  This causes a compile error:
> 
> https://github.com/dgibson/dtc/actions/runs/20944813954/job/60185662154#step:5:130
> 
> For some reason it's only showing on the make build, not meson.  I
> guess there must be a mismatch in which warnings are enabled.

I used only meson and so I missed the signed/unsigned comparison warning.

I will remove this signed/unsigned warning in the next iteration.

Best regards,
Hervé
