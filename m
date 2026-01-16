Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267230C617;
	Fri, 16 Jan 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558587; cv=none; b=LiZKM2ZoFvVMW4bvsAcV5zmE7Iejx84hzAmY4XWeRsMfWJNjnEnMyN6oOHC3EUa55M27VAMbUvGhHMevbVivHyM4eeGiIPneKMdtDZwzMQAPudH81ixcSO/Rnuc+5Ldey4rleAPuRbMN1xvOtuwafiaNseF+Pam0Q9YQ7s56YGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558587; c=relaxed/simple;
	bh=OsSOi1umBwT9KPJ6PWJ24wlNQEMsqkVuQZNNcU1Sg70=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C45GtIKN9yiYv2HA9Oa2iny33Imj7+h7HihmicNNFulyzhVJz8ycP2UHYDWLmvAhkxmxna5eBVGvlj2FTX5S8ubcfiNc4kBdI3z9Q5D0mIn37At6I9N62jdszi4xgBOgEuNoL0JDcTcZXEun8kXMH/cm3n1nfgNRxo66rc+vC/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qI3OgUQa; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qI3OgUQa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 17A5B4E420F3;
	Fri, 16 Jan 2026 10:16:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E05B760732;
	Fri, 16 Jan 2026 10:16:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1AE310B68A07;
	Fri, 16 Jan 2026 11:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768558583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BwFh3dqnElkDjsVScjD0Zht5jJxeEA5L+T8f5a2gW40=;
	b=qI3OgUQamD5XXTxS/GldUkcVK6TGGUoTqa1UYApyCkUM1BAQleg0+7XjM7xQnGsnjOk4s/
	cKnmdMXxp/ytLqxJj6QBP2g6AxQg0o3tDXvO1YbNJqZi0IcGY62gxjwNNhGzsh77m0IzJx
	IUWcQCbge3rXcsi4orMcUkY1ML0zU+fphr1B7KtuEQi538LlJqZc23+bB0OTBzWDHO2aAf
	vski3FdzLMX4pxS7eKEfpwk/wXQm/MItL+0iiGycfZ8HXl5VH5ZLHk36689DKv7rouv6mI
	WeR8Iws42H5VDi2GVYb1cclPNEK/6r2KPgnrthe2wZu84v5FiazXnJS5cC9QxA==
Date: Fri, 16 Jan 2026 11:16:16 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ayush Singh
 <ayush@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 06/77] Add support for FDT_REF_LOCAL dtb tag
Message-ID: <20260116111616.3a6c9ffc@bootlin.com>
In-Reply-To: <CAL_JsqLx-NWM=gFdQfQ1Nw10ii2n5gX93WgH+zTcbHRt=Ze_vA@mail.gmail.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-7-herve.codina@bootlin.com>
	<CAL_Jsq+EDvrEqqwsFjs0sGxYfKgQuSFqCiqQs-1b3TnbG+gATQ@mail.gmail.com>
	<aWg2JJstA0F-h9hi@zatzit>
	<CAL_JsqLx-NWM=gFdQfQ1Nw10ii2n5gX93WgH+zTcbHRt=Ze_vA@mail.gmail.com>
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

Hi Rob, David,

On Thu, 15 Jan 2026 09:54:22 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jan 14, 2026 at 6:51 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Tue, Jan 13, 2026 at 01:22:08PM -0600, Rob Herring wrote:  
> > > On Mon, Jan 12, 2026 at 8:20 AM Herve Codina <herve.codina@bootlin.com> wrote:  
> > > >
> > > > FDT_REF_LOCAL dtb tag is a meta-data tag attached to a property.
> > > >
> > > > It indicates that the property defined before this tag (FDT_PROP) uses a
> > > > phandle value and the node related to this phandle value is local (i.e.
> > > > the node is present in the device-tree blob).
> > > >
> > > > It is followed by one value:
> > > >  - offset (32bit):
> > > >      Offset in the property data where the phandle is available.
> > > >
> > > > Example:
> > > >   FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0x04
> > > >   FDT_REF_LOCAL 0x00000004
> > > >
> > > >   This means that at the offset 4 of the property data, the value
> > > >   (0x01020304) is a phandle and the related node is available in the
> > > >   dtb.
> > > >
> > > >   This is what is encoded in the dtb when the related dts has a property
> > > >   with the value set to <0xcafedeca &foo> with 'foo' a reference to an
> > > >   existing node where the phandle value is 0x01020304.
> > > >
> > > > If several local phandles are used in the property data, several
> > > > FDT_REF_LOCAL are present after the FDT_PROP tag. Each of them points
> > > > with its offset value to the position of one phandle.
> > > >
> > > > For instance, if a first property with 8 bytes of data has a phandle
> > > > value at offset 4 and a second property with 16 bytes of data has
> > > > phandle values at offset 0 and 8, the following tags sequence is
> > > > present:
> > > >   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
> > > >   FDT_REF_LOCAL 0x00000004
> > > >   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
> > > >   FDT_REF_LOCAL 0x00000000
> > > >   FDT_REF_LOCAL 0x00000008  
> > >
> > > To follow up on my desire to both be easily extended and have more
> > > type info, I have something like this in mind:
> > >
> > > FDT_TYPE_INFO 0x10 FDT_REF_LOCAL 0x0 FDT_TYPE_U32 0x4 FDT_REF_LOCAL
> > > 0x8 FDT_TYPE_U32 0xc  
> >
> > I think general type info should be out of scope for this:
> >  * This series is already enormous and complicated without that  
> 
> It is enormous, but I don't think the intention was to finalize and
> merge it all at once. I certainly don't intend to review it all now.
> The final result looks sane to me and with that we have a good idea
> what information needs to go in the DTB. I think the first step is to
> define the new metadata tags and what DTB format changes are needed.

Indeed, the goal of this RFC is to give the big picture and open
discussions.

FDT_TYPE_INFO tag is a container. It just groups other tags together.

I don't use the term TYPE in the proposal related to generic tag values [1].
I use FDT_INFO_PROPERTY which is more generic.

Best regards,
Hervé
