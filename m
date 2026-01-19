Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA573090DE;
	Mon, 19 Jan 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816142; cv=none; b=YtMw5KTJwGHVcuyZ/9V+/cPP62jltg1PlYsi79Jbp5i36sDIifg6dGzx2O9T+rnURq3s2cBk32lc4j0P7UGPRGxmxq0cABoyRWmah+JGe7pQEPKBT/Ty0hn7Cu/lw7Ch72+vsZpiJ8jhKzCEtpdN3PhyLMUjM+nHN/yshfyNMMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816142; c=relaxed/simple;
	bh=4yhv37ymq/kWQdmPjnSv7j8SmLCZ0LVUbS5HqLdFpvs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GqF9+LSNSRn2lHZ5qAwy9lGL7ktm7bulnXnPj31WV82H+MkgEhRnxi2kdG+DT1a62zly0Cs0YrkFJobMwuEFccdgGdSrQ2SLjCJffELpqJCbLgJyOG02CZiXlzLcP4UU8cstiDtBU4NksmMRwGWRHb0PJt1DXChOtfQhPcIIHgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SeMLafDb; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SeMLafDb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F315C2033F;
	Mon, 19 Jan 2026 09:48:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B18C60731;
	Mon, 19 Jan 2026 09:48:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6009410B68457;
	Mon, 19 Jan 2026 10:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768816137; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FfuTvUkYKx9QvK8dNqqzEt65/138odmagZGiTcUAwGI=;
	b=SeMLafDbGmUptNbiKz5KTTX/cV7RkQaiGJdb/ZmdK0GB001Z2XA64X5qvrdDt7afG8vY/Z
	ktVi1zUR9FFt24eDtXcvjiBzzQxmPl3lgb0KgSQ13Jei/FBE52WqQd6yJ7WHhkLcVIly6t
	NHqdA6GXpj2tOsG1HHV+7Kx/PVyYZo9Y9I8Uq0b5sB0OJEIwnmIL2yu6n4J38HuFJ3PthK
	OzDnfvKH2lm6AG2GXcLpHpO+WHLYFW1OkiA2MkbtHM4v+HUSIr7ImBc92rRtyloU4PzKEz
	QTCVKInLI1Ce0ajxDlHt9VDBeSJ9vROa56YSnzt8vpbnQZtx9eRooJ0dmUuKZQ==
Date: Mon, 19 Jan 2026 10:48:52 +0100
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
Subject: Re: [RFC PATCH 02/77] Introduce v18 dtb version
Message-ID: <20260119104852.3e7043ee@bootlin.com>
In-Reply-To: <aW29fwFEB6_qjVEc@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-3-herve.codina@bootlin.com>
	<aWgxAVfUYMUy9mz1@zatzit>
	<20260116100934.7d522b1a@bootlin.com>
	<aW29fwFEB6_qjVEc@zatzit>
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

On Mon, 19 Jan 2026 16:13:35 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Jan 16, 2026 at 10:09:34AM +0100, Herve Codina wrote:
> > Hi David,
> > 
> > On Thu, 15 Jan 2026 11:12:49 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Mon, Jan 12, 2026 at 03:18:52PM +0100, Herve Codina wrote:  
> > > > This v18 version will add support for
> > > >  - metadata in device-tree blobs in order to have a better handling of
> > > >    phandles and unresolved references.
> > > >  - Addon device-tree blob (successor of device-tree overlay)
> > > >  - Import and export symbols feature
> > > >  - multiple trees in a addon device-tree blob (i.e. root device tree and
> > > >    orphan node tree)    
> > > 
> > > So, once this patch is applied, the rest of the series pretty much has
> > > to be applied "atomically" - otherwise a version built in the interim
> > > will be lying in saying that it supports v18.
> > > 
> > > I therefore suggest moving any changes that *can* be moved before this
> > > patch, should be moved before this patch.  That will assist in
> > > reviewing and merging the series piecemeal, rather than as a single
> > > giant blob.
> > > 
> > > 
> > > Regarding the content itself.  It seems like this is a pretty major
> > > change to the dtb format - maybe that would suggest bumping the
> > > version by more than one (e.g. like we went from v3 to v16 in the
> > > past).  
> > 
> > I see your point.
> > 
> > Maybe the Rob's idea related to 'unknown tag' and the suggestion I did [1]
> > related to the generic tag value definition to support those 'unknown tag'
> > could help here.  
> 
> Having a standard encoding of tag length so unknown tags can be
> skipped is a reasonable idea.  I think you do need provision to mark a
> tag as "safe to ignore" or not - e.g. something like FDT_BEGIN_NODE
> could never be safely ignored.

A bit can be used for marking a tag as "safe to ignore if unknown".
I can reduce the bits 30..28 field.

bit 30:
 - 0b0: Do not ignore this tag if the tag id is unknown.
        If this tag id is unknown an error in the parsing should be reported.
 - 0b1: This tag can be safely ignore if its id is unknown. I that case the
        tag and its related data are simply skipped.

bits 29..28:
 - 0b00: No data
 - 0b01: tag followed by 1 cell (u32) data
 - 0b10: tag followed by 2 cells (2 x u32) data
 - 0b11: Tag is followed by a cell (u32) indicating the size of following
         data

Also, it is worth noting that the 0x0....... tag value family can still be
used.

Even if related to "old" tags, if a tag in this family is an unknwown tag,
the parser will report an error (at least because it doesn't know how to
skip the data part).

> 
> > As a reminder here, this generic tag value definition consist in:
> > --- 8< ---
> > A tag value is on 32bits. We can define the structure of this value.
> >   - bit 31 (msb):
> >      - 0: This is not a new kind to tag and so it doesn't follow this definition.
> >           All existing tags are in this category
> >      - 1: New kind of tag adopting this definition
> > 
> >   - bits 30..28:
> >      tag data length encoding
> >      0b000: No data related to the tag
> >      0b001: 1 data cell (u32) directly follows the tag
> >      0b010: 2 data cells (2 u32) directly follow the tag
> >      ...
> >      0b110: 6 data cells (6 u32) directly follow the tag
> >      0b111: Tag is followed by a cell (u32) indicating the size (in bytes)
> >             of data available just after this cell (including any padding
> >             if needed).  
> 
> I'd suggesting giving a byte length not including alignment padding.
> That way if you wanted to encode a bytestring in there, you wouldn't
> need a way of encoding the unpadded length in adddition to the
> standard way encoding the padded length.

And so, next tag is always length + sizeof(padding). Next tag is aligned
on 32bits.

> 
> > 	    Because this size include some possible padding, its value is a
> >             multiple of 4 bytes.
> >             The offset of the tag + 4 + size points to the next tag.
> >           
> > 
> >   - bit 27..0
> >      tag specific identifier
> > --- 8< ---
> > 
> > I mean dtb version v20 could be:
> > 
> >  - New header size with dt_flags added in the header (if this new field is
> >    kept).
> > 
> >  - Support for the generic tag values and so the notion of 'unknown tag'
> > 
> > With that done, everything else added afterward will have no impact on the
> > dtb format itself.  
> 
> Well... maybe.  It's not entirely clear to me whether all the new tags
> can be safely ignored by something that doesn't understand them.
> e.g. a consumer can't safely ignore the tags which give unresolved
> phandle references if it then expects the phandle values in the actual
> property values to be correct.

I would say that it depends on new (future) tags.

For instance, FDT_EXPORT_SYM, the tag used for exported symbols can be ignore
by the bootloader if it doesn't know about this tag.
Indeed, it doesn't need to understand and manipulate this tag. It just needs to
keep it in the dtb passed to the kernel.

> > 
> > Only libfdt and dtc will have versions defined at some point with support for
> > some new flags or new keyword.
> > 
> > What do you think about this v20 dtb version?
> >   
> > > 
> > > It would also be nice to have some docs for the new dtb extensions
> > > before or at the same time as this.  
> > 
> > Yes, the generic tag value definition.  
> 
> We'd want that, but it's not enough.  The specific tag types should be
> documented as well.

Yes they will be documented as soon as they are introduced.

The generic tag value definition is the first step to have in docs to allow
the "skip if unknown" feature.

Best regards,
Hervé
