Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25465296BD3;
	Mon, 19 Jan 2026 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839069; cv=none; b=gal7ykWRy8M/X0HDvAGRgB8TrG15cTkaAZOjYsUUbhblB1SEmljva/gvn+pEjYglAM7xfDgCOGI5OsNRmB7CCX2wg1oH9L4nanQ5NkfyYqRpPe9sFBuZ2vcQDr1G+Effkg4ZGuaq4IW376Qal/vLDWNTUGneYs4ib5uJ8vSRvcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839069; c=relaxed/simple;
	bh=X6hVVq4e+WYKQF74Mr5UvCWENq/oHS/4UhtZZwku/hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PzOz7DNBIugWiFue/3YSggxuXLWem7axn7rfPQXM2PIooe8+nVVmgKl++uIZwPM7pYDky2Ou9uk4CxdxUEzgO6xBYgpsBLH3jnGSWqYl6R3zaxDn/3NTU13XrD+2GR143OvsXPSqwxtYTRQngm5UQYVCA0KOfcdgSgAMRh12UIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n3KyfGV4; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n3KyfGV4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 613B8C214D1;
	Mon, 19 Jan 2026 16:10:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6464F60731;
	Mon, 19 Jan 2026 16:11:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3992010B68284;
	Mon, 19 Jan 2026 17:11:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3qQqjJpd6CSXgH7ONJQOqUlEU5Q9uUSftXgn6udGVj0=;
	b=n3KyfGV4r5SUBPA4WK5JPEdBzXn6x6dGj9XzOI+FghMsAdDmQeGZIUteYTtuiGAFJu5GGh
	vvwo7ItKAxuMkSSbN1jVZWf7s9t1s0gow/Yoruxfl3W/PqyAErWjQFrxrMl8V7fz8H5YLB
	RiJwxs4wTdZW3RDVy9+9+aKNU7UE03FVRKx+S9OJOzOSkbqiOoRqC9mpVJ/HRHruTAbRY/
	QwNUCSOtzLvA0rBhjfZqM62e/shtoV6Rgiesq595hoElTpKRc996UC9hLWhC0dPzVeESIs
	I45QA7oHR8YzctPpaTauqta3YVIoTI6qLm9nwF258adncRGwidZuYgwCcfcJcw==
Date: Mon, 19 Jan 2026 17:11:02 +0100
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
Subject: Re: [RFC PATCH 51/77] dtc: Avoid NULL fullpath for nodes in orphan
 trees
Message-ID: <20260119171102.22efc1a3@bootlin.com>
In-Reply-To: <aWiPhz92DBQImUw1@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-52-herve.codina@bootlin.com>
	<aWiPhz92DBQImUw1@zatzit>
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

On Thu, 15 Jan 2026 17:56:07 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:41PM +0100, Herve Codina wrote:
> > Orphan nodes have been introduced recently.
> > 
> > The process_checks() function uses fullpath in several places and
> > crashes due NULL pointer dereferences if fullpath is NULL.
> > 
> > In order to have process_checks() function running without crashes with
> > orphan trees (i.e. trees based on orphan nodes), the fullpath of node
> > available in those orphan trees must not be NULL.
> > 
> > Fullpath values are built by dti_fill_fullpaths(). Update it to handle
> > fullpath in trees based on orphan nodes.
> > 
> > Use a simple "__orphan__/" prefix to avoid the NULL pointer and to be
> > distinct from the root node ("/" prefix).
> > 
> > It is worth noting that this "__orphan__/" prefix is a temporary prefix
> > and it will be change later when support for reference by path involving
> > nodes in orphan tree is added.  
> 
> It might be simpler to eliminate the fullpath field entirely, and
> instead have a function that calculates fullpaths at the point you
> need them.

I am not sure it will be simpler.

I would prefer keeping dti_fill_fullpaths() for the moment.

This could be change later when things are more stable.

Many thinks are under discussion and changing all users of the the fullpath
field now will introduce more complexity which is not needed right now.

Best regards,
Hervé
