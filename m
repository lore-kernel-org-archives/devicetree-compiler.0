Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1942359FA1;
	Mon, 19 Jan 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824859; cv=none; b=GkywPwj0L4nRTbLiePmmbi51q+tafqzPjnRmrSleOS11ZXqNSOiL0u+Q8pTkUrdsH6N/65l8zyPG7B3WVxDHGmygA4/ocqVd6p0s5rNviwt6fGtqXi83NYi9IBrcm2s2GFnByx6QdSFdtPA7lAVERwyiku34DL3fIMjAoCpPbNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824859; c=relaxed/simple;
	bh=XryzhOHa41z8m7PsycTorfIXsENzLf8YHcHzV/a/X60=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kkVi21b3rlq/L5wAuDyLP0CX6Q40z1kawpcxM0+MFuD6oRMLDNC8gT07Xd7sEh5gWH8Bk/vZ3AEDyMJHOtszku/4TLyFCH6JcPSkEBrovrGifO2kbT+NDtLtS68VkZtZrFcyIzUsueHWYWu9g6a4j8U4E4fn0i88I8krqtBnbsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1XC3ESJy; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1XC3ESJy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 35DD04E42178;
	Mon, 19 Jan 2026 12:14:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A42760731;
	Mon, 19 Jan 2026 12:14:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99E7A10B6AF00;
	Mon, 19 Jan 2026 13:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768824853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a/sX83dIQSwOj6eBiYLBpNp0DUp4Dh1s597Hdwug/7A=;
	b=1XC3ESJymppL/Llfy5JxuSG+impN+9M9djtlhXLCMySNByxWZkBRcu1LXxDfdWs+fDlVhM
	I4qZk+fzbmHhxhGJaJ04ussLgs3H4cPb/FRl7Tm/LfenXHcGDEm/SDAI5NtLdB8QBpLzW/
	nXd5EeCtJ5s++N5bP2pKWqh6/bKkeJ1MnsX08SmYFgo0QiHb59RAWybK4o39DOulBHDKD2
	cY6Rl2tMBpE8SZs4/XqNR8iKMAza6BHLJ56EJwEffiFB1Fv95JQuVm/eNps0axgtApjkq/
	Ny/6iR53BjTiyqfpQtc4xGIElyg+ETSQSdHx0lOR6RSK2FlRPS77tkCCj1WiGA==
Date: Mon, 19 Jan 2026 13:14:07 +0100
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
Subject: Re: [RFC PATCH 09/77] dtc: Introduce mark_local_phandles()
Message-ID: <20260119131407.4a9431f1@bootlin.com>
In-Reply-To: <aW3FPbd7Dw0Rdqtc@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-10-herve.codina@bootlin.com>
	<aWg5bD4zWYAQOYai@zatzit>
	<20260116140912.3d18ae39@bootlin.com>
	<aW3FPbd7Dw0Rdqtc@zatzit>
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

On Mon, 19 Jan 2026 16:46:37 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Jan 16, 2026 at 02:09:12PM +0100, Herve Codina wrote:
> > Hi David,
> > 
> > On Thu, 15 Jan 2026 11:48:44 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Mon, Jan 12, 2026 at 03:18:59PM +0100, Herve Codina wrote:  
> > > > In order to have the new FDT_REF_LOCAL tag present in a dtb, the phandle
> > > > reference needs to be identify as a local reference.
> > > > 
> > > > This is the purpose of mark_local_phandles().
> > > > 
> > > > It identifies a phandle reference as a local reference when this
> > > > reference points to a local node.
> > > > 
> > > > With that node, the related FDT_REF_LOCAL tag is set in the dtb.    
> > > 
> > > I dislike caching redundant information (whether the ref is local) -
> > > it's an opportunity for them to get out of sync and cause bugs.  Is
> > > there a strong case that you can't just determine whether it's local
> > > only when you actually go to use it?  
> > 
> > Well, I can't find any strong case.
> > 
> > I would like to avoid passing the full dti (struct dt_info) to flatten_tree()
> > in order to determine if the ref is local or not to set a FDT_REF_LOCAL or
> > a FDT_REF_PHANDLE tag.
> > 
> > Also, this flag, set when a FDT_REF_LOCAL tag is parsed from a dtb, is
> > useful later when the ref has to be found based on the phandle value.
> > 
> > Indeed, because the is_local flag is set, the phandle value available in the
> > property *must* reference an existing node in the dtb.
> > 
> > In other word, in update_phandles_ref_internal(),  
> 
> Hmm, I see.  As with the "known phandle, unknown ref" vs. "known ref,
> unknown phandle" cases, I think this might be clearer with different
> marker types.  During parse we make everything "known ref, unknown
> phandle", then later change to either "known ref, resolved to local
> phandle" or "known ref, needs external resolution" markers.

When we parse a dtb, we have "Unknown ref, known phandle". FDT_REF_LOCAL
identify a local phandle value without any 'ref' involved.

The ref is set after parsing and it is set to the full path of the node
matching the phandle value.

Will see what I can do with new markers to identify those different cases.

> 
> 
> 
> > --- 8< ---
> > 	if (m->is_local) {
> > 		phandle = propval_cell_n(prop,
> > 					 m->offset / sizeof(cell_t));
> > 		refnode = dti_get_node_by_phandle(dti, phandle);
> > 		if (!refnode)
> > 			die("Node not found for phandle 0x%"PRIx32"\n", phandle);
> > 
> > 		m->ref = refnode->fullpath;
> > 		continue;
> > 	} else {
> > 		...
> > --- 8< ---
> > 
> > Best regards,
> > Hervé
> >   
> 

Best regards,
Hervé
