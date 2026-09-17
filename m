Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C84F4038;
	Thu, 17 Sep 2026 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666107; cv=none; b=c+KtOiptwwKilntWPKnI0D+5hZGur9bopIz9T1jVgP9ZVEaKzp201wJjJzInblAs5IcBZxIUZRCI/Jdposa4J/ISWTk02pTH52a0sEmUAsJ9vXBvMqCZWaGYWLbFWke2LrM5lgLa5dZvzOkpmFbyqZ8EwvaAUmN6fFfF0Lp6ZJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666107; c=relaxed/simple;
	bh=e+C7jweyfvHzPOlW8hxz8v3C7UF0nD8KwYxETIQeorU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GuWoKTp7PNVjCS6V4GjFAzAwa9ebrpmixEyyFPg64wLqKZOfnk68J9j/XNVr1okQTHhNN7aMT0bwr5ia+gQvChSCPPBIRHWlqcCe70ofLTXQtZOVYwscow306jeNaSFFrEQfIvLPGZKlXJEEfUcvQL68Fp/trAEaTc1g+LMJAqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SdECUU/n; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SdECUU/n"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 074C84E407BD;
	Thu, 17 Sep 2026 17:28:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C108A60580;
	Thu, 17 Sep 2026 17:28:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0FE111C787D7;
	Thu, 17 Sep 2026 19:28:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789666101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hNJxwhBrwzDgqLAquVY8yCZwaijeExwguM1iRW3rd+E=;
	b=SdECUU/ntQfdCok7oD11+N1Kj9mqBsKm+6H7XhpDp4yjCZb4WBG9KvJoUPLETsi7Dd18Gb
	xZsLiBysaHvymD9rzpyxZzIXEeqnRxHUVwEDr/CcDlA3SOx2C0bCZQg+2eUN5fyVrbkus0
	2xAh/m77tNG6VeqD5RuqGh/HVRq+VbXvna2YXnmDab+phNgeWtd7SYMs7cDPfDNDVAwy+b
	4KauanhzbWTZbuS1drfMdKLqhwXKGodObBf8MYiHWhC2aunXOl13Ge8tMD55z+epesEOn7
	cKa8aXk0CBvWoVhhKsf6NRylgT3t0+h5grPxe0g9WIibh1yCSMM4Uuuf9D9YpA==
Date: Thu, 17 Sep 2026 19:28:14 +0200
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 09/15] libfdt: Handle unknown tags in fdt_next_tag()
Message-ID: <20260917192814.70cbecbb@bootlin.com>
In-Reply-To: <aqu0c3qMJOLoD0Ho@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-10-herve.codina@bootlin.com>
	<aqpc9HZ2T74Q2lYs@gractus.seuss>
	<20260917103410.1fcfe0f1@bootlin.com>
	<aqu0c3qMJOLoD0Ho@gractus.seuss>
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

Hi David,

On Thu, 17 Sep 2026 19:36:06 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Thu, Sep 17, 2026 at 10:34:10AM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Wed, 16 Sep 2026 19:10:27 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Aug 26, 2026 at 10:31:40AM +0200, Herve Codina wrote:  
> > > > The structured tag value definition introduced recently gives the
> > > > ability to ignore unknown tags without any error when they are read.
> > > > 
> > > > libfdt uses fdt_next_tag() to get a tag.
> > > > 
> > > > Filtering out tags that should be ignored in fdt_next_tag() allows to
> > > > have the filtering done globally and allows, in future releases, to have
> > > > a central place to add new known tags that should not be filtered out.
> > > > 
> > > > An already known tag exists with the meaning of "just ignore". This tag
> > > > is FDT_NOP. fdt_next_tag() callers already handle the FDT_NOP tag.
> > > > 
> > > > Avoid unneeded modification at callers side and use a fake FDT_NOP tag
> > > > when an unknown tag that should be ignored is encountered.
> > > > 
> > > > Add also fdt_next_tag_() internal function for callers who need to know
> > > > if the FDT_NOP tag returned is a real FDT_NOP or a fake FDT_NOP due to
> > > > an unknown tag.    
> > > 
> > > I'm a bit unsure about this one.  If we were designing the libfdt
> > > interface from scratch, I'd definitely say that fdt_next_tag() - as a
> > > low level function - should return every tag, and it's up to the
> > > caller to skip unknown ones.  fdt_next_tag() already provides
> > > nextoffset making it fairly easy to do so.
> > > 
> > > But, of course, we're not building from scratch so we do need to
> > > consider backwards compatibility.  Supplying a skipping and
> > > non-skipping version as you have here is the obvious approach.
> > > 
> > > But I'm not entirely convinced it's the only or best approach.  A user
> > > which calls fdt_next_tag() is, in a sense, already opting in to
> > > low-level handling of the dtb.  They could well already be broken by
> > > new tags (depending on how they handle the default case).  Arguably
> > > it's reasonable to require them to be updated (once only) for this new
> > > family of tags.  
> > 
> > I can go in that way. We will have same kind of sequence in almost all
> > callers.
> > 
> >    do {
> >       tag = fdt_next_tag()
> >    } while (!fdt_tag_is_unknown(tag));  
> 
> Not really - users of fdt_next_tag() will typically already have a
> switch on the tag type, so the unknown tag handling would be an
> addition to the 'default' case, not requiring an extra loop.

Ok, those are to be update to use a switch on tag but that's not big deal
 - fdt_check_node_offset_()
 - fdt_check_prop_offset_()
 - fdt_add_subnode_namelen()
 - fdt_finish()

Some others like nextprop_() or fdt_next_node() mix a while loop and a
switch/case. Some rework to be planned.

> 
> > We have to care about those "unknown_and_skippable" tags only when
> > we modify a dtb. This is handled by a few functions.
> > 
> > The vast majority of callers of fdt_next_tag() just want to skip
> > unknown tags.  
> 
> I'm not sure that's true of the (few) callers outside libfdt itself.

Well, today there is no "unknown" tags and existing callers works correctly.

Unknown tags are reported as FDT_NOP. It should be ok with existing callers.
They should handle FDT_NOP.

> 
> > > Another potential approach would be to actually use the symbol
> > > versioning we have, but have som far only minimally exploited.  The
> > > LIBFDT_1.2 version of fdt_next_tag() would skip tags that postdate it,
> > > but we'd introduce a new version tag and the new default version of
> > > fdt_next_tag() would return all tags.  That would of course require
> > > figuring out how to do that with the verison script.  
> > 
> > Hum, I really don't want to have versioning in loop for fdt_next_tag().
> 
> I'm not sure what you mean by "in loop" here.

I don't want to add the versioning extra complexity in this context.
I am sure we can find a solution for this "all tags vs only known tags"
topic without versioning involved.

> 
> > Also, this could work in the dynamic lib (.so) case but not for static
> > link and even less for libfdt code copy compiled in bootloaders or Linux
> > kernel code.  
> 
> Are symbol versions entirely unsupported with static libraries?

I would say yes but maybe I am wrong.

https://sourceware.org/binutils/docs/ld/VERSION.html
https://sourceware.org/binutils/docs/ld.html#index-_002d_002dversion_002dscript_003dversion_002dscriptfile

> Obviously they'd have to be resolved at (static) link time, not
> runtime, but I don't see that it's impossible.
> 
> > fdt_next_tag() is a low level function accessible out of libfdt (API).
> > If it doesn't skip unknown tags even for other libfdt internal function it
> > will be a too lower function.  
> 
> I don't really follow what you're saying here.

Skipping unknown tag is a low level feature.
I think fdt_next_tag() can handle this low level feature.

Upper layer using fdt_next_tag() should not handle this tag skipping the
general case and let fdt_next_tag() do this job.

Got the feeling that we are going to add complexity at upper layer to handle
a feature that should be handled at low level.

> 
> > Ok, we can have a wrapper on top of
> > fdt_next_tag() to skip unknown tags.
> > 
> > fdt_next_tag() is a low level function but the rule related to skipping
> > unknown tags is also a low level rule.
> > 
> > We have to choose:
> > a) fdt_next_tag() as I proposed
> >    Of course ok for me
> > 
> > b) fdt_next_tag() returns all tags -> Full handling at caller side
> >    Ok, we can go in that direction but it will bring quite a lot of
> >    code duplication.  
> 
> I'm not sure it's that bad, since fdt_next_tag() loops will typically
> already have a 'default' case for irrelevant tags, which will
> generally be handled the same as unknown tags.

Well as we did for "offset 0 vs real root node offset", I think the best way
to known if it's bad or not is to try.
 
I will not have time this week to propose something and I have a training
next week.

If you're ok for a try, I will do it but not as quickly as I did for the
"offset 0 vs real root node offset" topic.

> 
> > I am not fully convinced by this option.
> > 
> > c) lib version
> >    I disagree on my side  
> 
> Yeah, I'm not really convinced by this one either.

We are on the same page.

> 
> > d) Other idea
> >    Of course, I am still open.  
> 
> I haven't thought of any more ideas yet.
> 

Best regards,
Hervé
