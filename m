Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DFD288B1
	for <devicetree-compiler@vger.kernel.org>; Fri, 16 Jan 2026 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576659; cv=none; b=XjqrGDg9SceOugpQl4vJXNcugxwiCZMs9ffGnXbJsAYT07pZZt4L1um5cG0IvksAOzrgUeGYQhFFFwUzHfdHfXiQYZrQy7WdGvLoyn/cSXY5LnXPf0H/GCL6Ikxe49mzwrisvFbaj1Jm1jfIHYc0kxJlWmeuDWNSiH6SBQEG1fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576659; c=relaxed/simple;
	bh=d8ibYRhXbYz1u1gx+ZYfdgs1LIb9Yz+sIuix7rp+jDo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilBS5rZZoIx9VS7wFaqnGT/uGU0sbNbGihqpEbYjHrBBES9bSmDAZ695DCQhcjnstVnT2Iymp1qEc58aorSLTSs4GkiUIr64acRcDjOsStVbSZHepwZOt5N1ohXX024yXS5dD0zTyoHOsODXG5LCfsC+rYpu54smiYnBpAFuBlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2q8B82Us; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2q8B82Us"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3522AC1F1FC;
	Fri, 16 Jan 2026 15:17:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D31A560732;
	Fri, 16 Jan 2026 15:17:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C0D710B68805;
	Fri, 16 Jan 2026 16:17:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768576653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dfVob1RBqEgBNMF28NVVnEsg3TwRdSyxpplex3+Q4lA=;
	b=2q8B82UsQP/Mz68CZs5LdOl+D6vE4d35ilFUuFt9Ypyma2NG7AbO2K3qL8nfh5obWTzEyN
	hgzA71ro3uEE4gfEyvcrFH+w+wGDNHuI4dOvkmtTEriQO87STJOTBpcAQ1BwZWsGWj3zXk
	+XU5S+XxvEAZ40G1qusYgi+Zwdns4ccI2YKX7hsLxs8q8DNpuda3/pS+cPBAVFDNsWNBo6
	+ayDZoweqnsx6LouspzL9cgPp7yYmYEuwyKlea2l6pg7ezh6JMzwsAxWmLLNTmmJp3ZBdX
	rRarMJzA3+4I7L5iChhWJYIw0fYLqzHLtBgge9NrpZENHDqlWi8uh1mYsybrnw==
Date: Fri, 16 Jan 2026 16:17:27 +0100
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
Subject: Re: [RFC PATCH 11/77] Add support for FDT_REF_PHANDLE dtb tag
Message-ID: <20260116161727.7fe14658@bootlin.com>
In-Reply-To: <aWhB4fYnXCD2f6Uq@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-12-herve.codina@bootlin.com>
	<aWhB4fYnXCD2f6Uq@zatzit>
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

On Thu, 15 Jan 2026 12:24:49 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:01PM +0100, Herve Codina wrote:
> > The FDT_REF_PHANDLE dtb tag is similar to the FDT_REF_LOCAL tag except
> > that it identifies a reference to an external phandle. The node
> > referenced by the phandle is not present in the device-tree blob.  
> 
> The names FDT_REF_PHANDLE and FDT_REF_LOCAL are perhaps a little
> misleading - both are marking a phandle, the difference is in the form
> of reference.  That's quite difference from the distinction between
> the REF_PHANDLE and REF_PATH marker types, where the difference is in
> what the reference expands to in the property.

I am agree.

FDT_PHANDLE: A local phandle with the value known.
FDT_PHANDLE_REF: An external phandle, its value need to be resolved ?

This is aligned with FDT_EXPORT_SYM / FDT_EXPORT_SYM_REF.

Or maybe:
FDT_TYPE_PHANDLE
FDT_TYPE_PHANDLE_REF

"TYPE" has been mentioned by Rob in the "FDT_TYPE_U32" context.

Any other ideas are welcome.

> 
> > The FDT_REF_PHANDLE dtb tag is a meta-data tag attached to a property.
> > 
> > It indicates that the property defined before this tag (FDT_PROP) uses a
> > phandle value and the node related to this phandle value is not local
> > node (i.e. the node is not present in the device-tree blob). This tag
> > can be available only in overlay or addon device-tree blobs. The phandle
> > value used in the property has to be resolved when the device-tree blob
> > is applied on top of a base device-tree.  
> 
> This is kind of looking ahead, but does that imply that this tag is
> only valid in addon dtbs?

addon dtbs for sure but also overlay (plugin) dtbs.

> 
> > It is followed by two values and a possible alignment padding:
> >  - offset (32bit):
> >      Offset in the property data where the phandle is available.
> >  - label (string including \0):
> >      The label to use to resolve the phandle value.  
> 
> I expect it will become apparent later in the series, but it would be
> helpful to clarify what the scope of that label is.  A single node?
> The whole tree?  Across a tree and all its possible addons?

This label is the unresolved reference. Its scope is the dtb.

For instance, "prop = < 0 1 &foo>;" in a dts with the node referenced by
&foo not present in this dts (possible for addons and plugins) will lead
to 'FDT_REF_PHANDLE 8 "foo"'

The way "foo" is used when the dtb is applied is covered later in the
series.

It will be resolved with import/export mechanism (when the addon is
applied).

Also it can be a namespace label reference (see patch 66 for the definition
of namespace label reference) and here also it will be resolved thanks to
import/export mechanism. Namespace label references can only be present in
addons.

Best regards,
Hervé
