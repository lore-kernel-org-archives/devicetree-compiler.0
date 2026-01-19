Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6EB2C2374
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 Jan 2026 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840721; cv=none; b=qK8g8ORjAZeZzQJB/kWZG7yUbvMwNr1uRtrQIkIg9GEK5X2VnflBdlzJfaSA+1nX4iRlFCZtotnJCEkEnU7ODdQFkGRgZmPaHIXVmKcbCbJweaK5sdNELjJ4tbibO9B+zEnJ0YFU/gK+oTUcabnqkfqe/+7w10TndaHfFuOb0mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840721; c=relaxed/simple;
	bh=cT6TMWgEiHok/mzRoM1Qi129PrM4vrK60JZqag83xds=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJqUh4sMm4VgHkw+W3TSGpXqspqAhuOKEijl6LqQcpfYVHpm1M4cV+a6IydjGoxkR33fZMI41c1VRRs9hPVR4ScrfBhe7HNSKhg90JpH1QglQcUzsbshoA7jF4XeIjCKTxY/V9uJPxxve/lj4lCxtE4Ws4h3EqSgKdPDE/9sPMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aHf4lWJh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aHf4lWJh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AE5614E42178;
	Mon, 19 Jan 2026 16:38:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7429260731;
	Mon, 19 Jan 2026 16:38:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD49F10B68284;
	Mon, 19 Jan 2026 17:38:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768840716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pzxFrCRT7i2xIHwt1xGuuNbIr1dZ85Go9vJwcOeS/gU=;
	b=aHf4lWJhNugJJ5UYyKp38B5I+RXv1B4dKjV1FuxW8cbsRxUtaGr1EBEVzn/6d0uHegNgge
	OB4lpi07ay7tXTk7HSHFeRS2dMIYYhUVHubVYwyftnWJ+PIXpzfS9ORMUL5WOjH1eutCeL
	w9oAaTp54dqQhFD2YeXjIGKiAsDfz3GrreKr9y7W+XP0BHu0/PrZfYq3oEvO6FjNe3/Ygj
	MTSZLbBtkRHVVH8rt7gQESbQHYYZGyeKq+L41Q6wXEQ4Y4vK3p3u8uH75PuIaGYF19RemY
	Drw8dOxbQh0FTcHjU6RI9eAsda0Lf3pSvLO1L/w2zti4ML0FbUKQ8mtWuWMGIw==
Date: Mon, 19 Jan 2026 17:38:31 +0100
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
Subject: Re: [RFC PATCH 64/77] dtc: Add support for references by path
 involving orphan nodes
Message-ID: <20260119173831.3341e827@bootlin.com>
In-Reply-To: <aWiQ05zlfPfcIaZk@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-65-herve.codina@bootlin.com>
	<aWiQ05zlfPfcIaZk@zatzit>
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

On Thu, 15 Jan 2026 18:01:39 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:54PM +0100, Herve Codina wrote:
> > Referencing a sub-node from an orphan node using a path is needed.
> > 
> > Indeed, using the following snippet:
> > --- 8< ---
> > /addon/;
> > 
> > &node1 {
> > 	subnode {
> > 		foo-phandle = <&foo_label>;
> > 	};
> > };
> > 
> > &node2 {
> > 	foo_label: foo {
> > 		prop = <1>;
> > 	};
> > };
> > --- 8< ---
> > 
> > Even if node2 is an orphan node, foo is a local node. foo-phandle
> > references the foo node using a label.  
> 
> Another option would be to eliminate the idea of local references, and
> require a symbol be attached to things that you want to reference by
> label.

Hum, new kind of references.

We have reference by phandle to local nodes. Reference by symbol for
external nodes (i.e. nodes not present in current dtb).

Now new kind of reference for node available in the current dtb but
in a different tree (orphan tree).

For that we need to:
  - Mark the phandle value in the property as a cross-tree phandle
    reference
  - Add the symbol label in the referenced node.

When the addon is applied, this new kind of reference need to be taken
into account in a new way:
  - The phandle value in the referenced node need to be updated in the
    same way as all other phandle value in nodes to avoid collisions.
  - The cross-tree reference needs to be resolved.

This adds an unneeded complexity.

IMHO, we shouldn't eliminate local references.

We need to reference all possible local nodes by path even if cross-tree
due to orphan tree is involved.

Best regards,
Hervé
