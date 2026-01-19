Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E611B36C5A1
	for <devicetree-compiler@vger.kernel.org>; Mon, 19 Jan 2026 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830689; cv=none; b=fo95bjw7k+59cdESAyklQEpGdOS57PuGgNqazUYSqmBa3MDdkFujyyt41kax1q5wtGfUzRS26ux6025YjdnB2D9gl545iCZr/jJpye1uqmH4JEirdsA1CpH3Jmz0m1oSiF4efhXgzbvMj7sLJQ+/eFh6w1Y3GnUsliZwuG1Laog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830689; c=relaxed/simple;
	bh=fAZCHieISFsZnHq7ZBZ5G98mt7NznbqgCWwW7lkYmbg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VALc6FETPmwRFKhrk13u93sx0+Yq9PoS45RE0WaY/i1DhfXiWuSxW3lss5qk6IH4U0ReU0v7QJlctHt69sCbB7q6T9eci52GDbQP4t+ysCVNKECHDBpf7fP0gJ7m3hXH3VnaMBZz2vrOpmtgnf9Do1dgUlFz71FmgrzgLZR+D+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jcYctsTk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jcYctsTk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6A46B1A2958;
	Mon, 19 Jan 2026 13:51:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C2A460731;
	Mon, 19 Jan 2026 13:51:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 606F710B6B018;
	Mon, 19 Jan 2026 14:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768830685; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BagPtz+xR382fnv7uowNeqpW6pTaVKl6rZQoMQBOSR4=;
	b=jcYctsTkfKn9TmTshNYKPIZ2QdV5y57tThUWAfMtBP38sC13Hmy3EUKTUfaoHLZVcaj7VY
	70SgTKpmLYMHTHKhAPUxH+WrKhw2Plq/CQQy5aEOjfS18HqIqIRoRXiqGtiAg1VcvXXoBq
	LZZ8vwWZDiE6d/v0Vpe30ENc8B0iVKhMIZpUo6utgdr/N+L0VWk+MspLLFMeNDtozixtpn
	Wjcx9z0dPq3Oi7XPBl1MEwQFJqdliVjOr9aXp3+45fxZfQLQzf/85olsWUBt2frKevR8nN
	8xrQVVEtqKnyhKnip+ZkU3wWJr2TjbXAkqmfNKgw2jM6BSAweyNDsnrVgSQPPQ==
Date: Mon, 19 Jan 2026 14:51:20 +0100
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
Message-ID: <20260119145120.724c419d@bootlin.com>
In-Reply-To: <aW3GWZl8AmzsTEu0@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-20-herve.codina@bootlin.com>
	<aWiAmjfMiKpC4sdp@zatzit>
	<20260116172735.757c1872@bootlin.com>
	<aW3GWZl8AmzsTEu0@zatzit>
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

On Mon, 19 Jan 2026 16:51:21 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Jan 16, 2026 at 05:27:35PM +0100, Herve Codina wrote:
> > Hi David,
> > 
> > On Thu, 15 Jan 2026 16:52:26 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Mon, Jan 12, 2026 at 03:19:09PM +0100, Herve Codina wrote:  
> > > > Export symbols allow to define a list of symbols exported at a given
> > > > node level. Those exported symbols can be used by an addon when the
> > > > addon is applied on the node exporting the symbols.    
> > > 
> > > This seems to imply an addon always applies at a single node location.
> > > I'm not sure that's a good design choice, since I don't see how it
> > > covers the case of something that connects to several connectors.  
> > 
> > Apply the addon on a node that knows about those connectors.  
> 
> That seems limiting to me, because it requires the base tree to know
> about all possible connector combinations, which I'm not sure is
> feasible.  If I understood Geert(?)'s case properly, there are use
> cases where a board might have, say, six "type foo" connectors, and an
> addon board could connect to any two of those.  Of a board might have
> 3 "type foo" and 3 "type bar" connectors and an addon board needs to
> connect to (any) of each.  It seems much more natural to me that at
> attach time you say
> 	"addon foo 0 => board foo 1, addon foo 1 => board foo 5"
> or	"addon foo 0 => board foo 2, addon bar 0 => board bar 1"

Who can perform this mapping ?

The user applying the addon if a tool is used such as fdtaddon for instance
(even if this kind of mapping is not yet available in fdtaddon I proposed).

Or a driver that knows about the board connectors.

This driver will apply the addon dtb and provide custom mapping between
symbols expected by the addon (/import/) and symbols provided by the board.

> 
> Rather than the board itself having to anticipate all combinations.
> 
> > > > In order to perform
> > > > its symbol resolution. Any unresolved phandle value will be resolved
> > > > using those exported symbols.
> > > > 
> > > > The feature is similar to __symbols__ involved with overlay but while
> > > > all symbols are visible with __symbols__, only specific symbols
> > > > (exported symbols) are visible with export symbols.    
> > > 
> > > This paragraph doesn't make sense to me.  What's a "symbol" if it's
> > > not something in __symbols__ or export symbols?  
> > 
> > An imported symbols ?
> > 
> > /import/ foo "blabla";
> > 
> > from the addon point of view where this /import/ is present, 'foo' is a
> > symbol.  
> 
> I guess, but existing plugin stuff doesn't really have imported
> symbols, so the example doesn't really illuminate the difference from
> the status quo.

A plugin need to know about all possible symbols available on the board
is applied too. This is the purpose of __symbols__. This just means that for
plugin all possible symbols are imported and symbol translation is not possible.

A plugin is designed for a specific base board. It needs to know about each
busses and how they are wired.

I mean a plugin references i2c5, the i2c controller number 5, and i2c5 needs
to be present in __symbols__.

The target property in __overlay__ identify the target node. Here also, this
is dependent on the board the plugin is applied to.

Addons depend only on the node, describing the connector, they are applied
to. They do not depend on the full specific board where this connector is
available.

Two different boards can have the same connector available and a given board
can have two connectors of the same family the addon can be connected to.

Best regards,
Hervé
