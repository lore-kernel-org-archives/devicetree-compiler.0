Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609301;
	b=zeJ7L0UFhLxos7n5ePWa3q+3AjzCwafU/H4PYLYZ569ID/tiv3NugrHbL4r2hEpOA5E9
	 /uuM6ciwDUmpgbyaH5zOSbGPhNPOqkYHD2xae9kA57/s8kJo6mZZrNKgdXISmEv2+RRTh
	 a/+zDC518Dz9WTGXUZy/LfSXxhR3MRLo85Pfs5rKigPxHTBBvVpJ0hMxLcy62fg2hWJyO
	 RI+R/KbKnNFhiXWA45vfYQI8Vbj9TDwJ8BDyyDR2hJLuEg3KdD3NsdbHWTWtRia1o9Ebu
	 VtQKGPT8fMAtvxAfsx71ChNGml8b6cgdZNZZIiY9bma9Ya55Ff9vWoQr0GfEdvCHpQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609301;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=TnIv1Y4yd4Mhc945y7QfQ2on6nqrz7qZxWUanwGbrnU=;
	b=mKr5BmCDFxzSAb1IpnTyYUH6Qbl/5zwIFeBC8zkQGOEeNzjgKbXALxwwWOe9DtFMF9/S
	 kbcvzwsyoCUl2xYxz5RtUdPhsu/EGzySb7It1aouxVJl44JDFZJL4zuLEp+BbiTdDmyyq
	 q7RUo/3YSzm7MTY8U+htSl8ARqmd+cqDVRhaQMBndLvolThfm8YDszJlBRVQb1c6tdlrd
	 YIjfjDTiO9p20dJWFMY7+flP7c3mYCPMzvQ63Gx15Jx8gZLUzFtE//1nHUrDT7wHMDI0w
	 5cBozpdiRurR72gGxV8H5HiLowdM6cZgJk0/R6nbOfBfFcxjvwCzFtI8dBwfYAdDb9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vr6Amkan;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B7606A32C;
	Wed, 25 Nov 2026 12:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6B7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vr6Amkan
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F4414E41776;
	Wed, 25 Nov 2026 12:21:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D07E60480;
	Wed, 25 Nov 2026 12:21:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A081411E69019;
	Wed, 25 Nov 2026 13:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795609298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TnIv1Y4yd4Mhc945y7QfQ2on6nqrz7qZxWUanwGbrnU=;
	b=vr6AmkantyhAjjGl6cQQ8JlCZQEeL54d7CiK+WU5+srMe0BYCqVTCBsC1aaWiz9StW9/c6
	MhMkh8G04wTSHrG8/G+ky+nEMzoT5ZOM7K5CWwph9g3oHSN0vL4D9E5hiPFlhDmxonQRkS
	coU0UpLK5uXXOz+GtgOWA1VOi8fjW3HO8KnU746B4sDLDRlkldpJg+detvg/Lpcj3jEuIY
	ApZH1qz7SdxgBJEagfZiaNJlmjNPmJgYx+oND9DlycxbmiMV1qMFa3JqaZXipw6O9E3DLE
	DSrD6hBUCnR93AhTtHomej7qO3qX6q0Ycgw34+EKZ9Spph6HYune7M6fF92oXQ==
Date: Wed, 25 Nov 2026 13:21:29 +0100
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 35/74] checks: Get 'chosen' node using
 get_subnode()
Message-ID: <20261125132129.4f4695ac@bootlin.com>
In-Reply-To: <awan_SrUGC7OEMIL@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-36-herve.codina@bootlin.com>
	<awan_SrUGC7OEMIL@gractus.seuss>
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

hi David,

On Wed, 25 Nov 2026 20:19:04 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 11:49:04AM +0200, Herve Codina wrote:
> > get_node_by_path() is going to be updated in order to handle orphan node
> > support for addon device-tree.
> > 
> > The 'chosen' node is a subnode of the root node and can perfectly be
> > retrieved using get_subnode().  
> 
> The change certainly shouldn't break anything, but I don't really
> understand the rationale for it.  AIUI, get_node_by_path() should
> still work, even if it's (trivially) more expensive.

Removing the get_node_by_path() call here avoid a later modification when
get_node_by_path() is changed.

The code can use get_subnode() here. I thought that using it was more relevant
here (getting the 'choosen' sub-node from the root node) than using the more
generic get_node_by_path() function.

Well, if you prefer the get_node_by_path() call here, no problem, I can
revert this change.

Best regards,
Hervé

> 
> 
> > In preparation of the future change related to get_node_by_path(),
> > replace its usage to get the 'chosen' node by a call to get_subnode().
> > 
> > The modification doesn't introduce any functional changes.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  checks.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/checks.c b/checks.c
> > index 13e8b121..1332acc4 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -1349,8 +1349,7 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
> >  	if (node != dt)
> >  		return;
> >  
> > -
> > -	chosen = get_node_by_path(dt, "/chosen");
> > +	chosen = get_subnode(dt, "chosen");
> >  	if (!chosen)
> >  		return;
> >  
> > -- 
> > 2.55.0
> > 
> >   
> 



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
