Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E47424469E;
	Mon, 19 Jan 2026 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837601; cv=none; b=ROYAUd5bxVwuBkyukHlrc8dN3usQlHptjah3r++Z+ZYrI5lVzQtAGCD9yN8eflowcw1O7ttcE/iHTg5la8IVCdQK3/sYjvlNVTydFNrC+yN89zsx2H1IrG41BkKVIxa97P9kwtJn1tIPlSl1QNyGpyjVS8KgiHGeMVhq60xXyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837601; c=relaxed/simple;
	bh=WhaNOXhCR17fxcDUn13JEFcH6Y5VegI4bfiETwl02DM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eEE33BNysskcM5jEW+1yYmpVUjraJ80lcOKxnOa15sW0SebDgeTXTR/BzO+ckqi6HVx/qPgjZ0GSwarPNDDWnNJLSnv4g72f2crdXboJiYEy4QGm4wJpNuk5EfLUAiWhXC5F7rDgi8j68GA9XcwfiZ6IIMTTGsoMafc3hzy3iN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ifzdGHkg; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ifzdGHkg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5A196C214CC;
	Mon, 19 Jan 2026 15:46:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 547DA60731;
	Mon, 19 Jan 2026 15:46:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 839BB10B6B05D;
	Mon, 19 Jan 2026 16:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768837596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fYvweRsndOLlQfSis4PX09BZwkJhPZzLAiEE0hCLvkI=;
	b=ifzdGHkgA8+H6vCV/20ijW5BOQT+3wwpOI2/SE3xgTxas9MmMUAQ2iT6hthfS5/DLqnkZ/
	FyJoyAboIjlKBXIZKzzOhg6RgIRXGp2rWwYXDc9gHkONjMEDJLPh8cvW6Kv6SkXlowUR2I
	dJ2BPT40vAJXrT2tvF2+fDQi3rpop4I0C4BftkYqQUt98S93bZnC0gjvKSVuj+w2WLYM9R
	2TCKcpZIFdwr497nsjtws0ZTWZW34B02HEfcRLjJuHeJ2nGpWMSlGdVbmpKHYcJgIRwbmY
	cLipyFz41C5xpr749u9QQh9zAu03Kc8jcr4H/0sj7QJkNS9LoORYBpH8GF5+Dg==
Date: Mon, 19 Jan 2026 16:46:28 +0100
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
Subject: Re: [RFC PATCH 29/77] Add support for FDT_EXPORT_SYM_REF dtb tag
Message-ID: <20260119164628.78f713bd@bootlin.com>
In-Reply-To: <aWiIdpH0oG7H4fMZ@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-30-herve.codina@bootlin.com>
	<aWiIdpH0oG7H4fMZ@zatzit>
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

On Thu, 15 Jan 2026 17:25:58 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Jan 12, 2026 at 03:19:19PM +0100, Herve Codina wrote:
> > The FDT_EXPORT_SYM_REF dtb tag is similar to the FDT_EXPORT_SYM tag
> > except that it identifies a reference to an external phandle. The node
> > referenced by the phandle is not present in the device-tree blob.
> > 
> > The FDT_EXPORT_SYM_REF dtb tag is a meta-data tag defining an exported
> > symbol. It can be present in a node bloc meaning that a symbol is
> > exported at this node level. The node pointed to by this symbol is not a
> > local node (i.e. the node is not present in the device-tree blob.). This
> > tag can be available only in overlay or addon device-tree blobs. The
> > symbol has to be resolved when the device-tree blob is applied on top of
> > a base device-tree.
> > 
> > It is followed by three values and a possible alignment padding:
> >   - name (string including \0)
> >       The export symbol name. I.e. the name used to reference this
> >       exported symbol.
> >   - padding:
> >       Padding (0x00) added to have the next value aligned on 32bit.
> >   - phandle (32bit)
> >       A placeholder for a phandle value.
> >       This placeholder can be used during some dtb manipulation to store
> >       a temporary phandle value.  
> 
> Yuck.

Will see what I can do to avoid this placeholder.

I need to store the phandle value related to this symbol during the symbol
resolution. This is done by addon_resolve_phandles() available in
libfdt/fdt_addon.c in patch 70.

libfdt is not designed to perform allocation to store temporary values. It
manipulates data directly mapped from dtb working with offset in dtb blob
without any other kind of object. No specific objects (C struct) for node,
properties, markers, ...

To have an area for this phandle value, a room reserved in dtb was really
the easier way.

But well, I understand your "yuck".

I think it will be quite tricky to store this temporary phandle value
without allocating some additional data.

This placeholder simplified a lot of things but well, I think I need to find
an other solution.

If anyone has any ideas to store the temporary phandle value, I am all ears.

Best regards,
Hervé

