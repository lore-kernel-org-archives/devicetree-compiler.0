Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748931;
	b=RrAdgORygavwbzLT9ZGADTKMxzh4rVcSpoX0/PaDHa2h6RcLLy91tNSBAwxKjQLVqLYl
	 q0HungesEgM1EZN815nYjYwt2HYSa5AX89LNRGVDQFzTgIITEmrinY2VfEuh++1YFPTPS
	 lckoBLe84xtJ5Vxu/AYrXGAqNJcDnCBjKJU4ARic4ULruFi4mWEwI72OEm+VKk5i7iwTS
	 pjn732R1qMu2KsQgOLkH+omG3ERgiPN7u34xBGJrspClfrf+2sANGzhPT65YP1ItbwVbI
	 JrhQ6f5Jgky4b4nUb3h4DWNPdfDVfIKUpy3GjFH5I/h7yzmA5m7uNBVrxd6FwtPFjmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748931;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=3OwpcleijCj24n+D4c9hINsd8SYD1CRnMLJtoqMJ2SI=;
	b=G4qWpW7mMEFnibnzkNGZA8DsjQ2NljJB6lwHV1tfr3kJLjiMo1KzHfZRDXmAe4S44CkU
	 m1NAt4cE15nQ8SmIOjHoWFEfl55oC8t9f6Jk2osCmJZvnudqYETgpaV57wXTtWgVho+iA
	 QB8B5EEfFEVt6iDREXVlN0UuSVQCpyLrl+C8i1bW3GcG6fOpmgu7jSDc4P3gc1wyM/uTq
	 olESr4HBsx4De2YG2DAnTUUKO247rjv5BvVs6CfurkVzSP4KHXTOol2G5xjWuebLzfLiX
	 OVKsvXwppXniHBSazYLqeS575KXfIohaXfnrY+gKp7dUkpgGb/AvC22PujjPAn+vzrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KZS5ZC2Z;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62908606A31E
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 03:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62908606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KZS5ZC2Z
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9682BC2AC46
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 03:08:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB0616049C;
	Fri, 27 Nov 2026 03:08:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4ACE611E691F7;
	Fri, 27 Nov 2026 04:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795748926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3OwpcleijCj24n+D4c9hINsd8SYD1CRnMLJtoqMJ2SI=;
	b=KZS5ZC2ZRh9cPKMXYk/lYk5LECTjyHmpVPlVmYoNLRapcfjQJW621B3q11KA8iUBFZDVER
	f2VnIyaRUMFdc62a7zLnLFpPQLr4OcfvGi1kpXaB1mU9T3tJ3i4fh4KX2FwsJrkH6uujYp
	zVSDg342O7aq0hgkIMnhxRFXhE/46LtEtaGTff097AUlZUV1boL3gWXts+ltnZ5zw2IyG5
	0g9y7w8vR91x+j6N4dqjuWxBqAW5YoH5vDRr2JxbIPM43vRc5uFeMkcCtk2Fz1tJBJpoLk
	N7747IL/7QMJKdk4qVd7FrCM7oSulNSP2Zl6jYHrfToXTkE9raocl/X4wMliRg==
Date: Fri, 27 Nov 2026 04:08:43 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Simon Glass <sjg@chromium.org>, Devicetree Compiler
 <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] dtc: Add a struct for the top-level fragments
 of a dts file
Message-ID: <20261127040843.21de136d@bootlin.com>
In-Reply-To: <awjq9pu5MKwQYlk4@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
	<20261116235813.935070-3-sjg@chromium.org>
	<awYvRAeiVSO9f0ls@gractus.seuss>
	<CAFLszTjALSPc+oJ7uVYaqZoPxUKJ0ggKSB2LU_QhyohSVaSyLw@mail.gmail.com>
	<20261126213615.030c2366@bootlin.com>
	<awjq9pu5MKwQYlk4@gractus.seuss>
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

On Fri, 27 Nov 2026 13:29:23 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Thu, Nov 26, 2026 at 09:36:15PM +0100, Herve Codina wrote:
> > Hi Simon, David,
> > 
> > On Thu, 26 Nov 2026 10:34:24 -0800
> > Simon Glass <sjg@chromium.org> wrote:
> >   
> > > Hi David,
> > > 
> > > On 2026-11-25T00:44:05, David Gibson <david@gibson.dropbear.id.au> wrote:
> > >   
> > > > After consideration of our previous discussions, I'm leaning towards
> > > > using the term "source layer" for these top level components (thanks
> > > > for the "layer" suggestion).  It's more verbose than I'd like, but I
> > > > think disambiguating from dtb level "fragments" is worth it.    
> > > 
> > > OK, done in v5, through the series. The struct is struct source_layer,
> > > but to keep the lines short the helpers just say 'layer':
> > > build_layer_ref(), free_layer(), LAYER_NODE and so on. Let me know if
> > > you would prefer source_layer throughout. 'Overlay fragment' and
> > > fragment@N are unchanged.
> > >   
> > 
> > Maybe late but "snippet" instead of "source_layer" or "layer" comes in my
> > mind.
> > 
> > Could this "snippet" make sense?  
> 
> Eh.  "snippet"s not a bad idea, but I prefer "source layer" even
> though it's longer.
> 
> 1) To me "snippet" suggests something small, but the layers can be an
>    entire dt
> 2) "layer" at leasts hints at the correct merge semantics: later
>    layers "cover" (overwrite) earlier layers.
> 

Make sense. Let's go with "layer".

You can just ignore the same comment I did in the v5 iteration.

Best regards,
Hervé
