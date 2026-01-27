Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681FC35CBB4
	for <devicetree-compiler@vger.kernel.org>; Tue, 27 Jan 2026 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527160; cv=none; b=rzWAOKhb6f0TGYV4MpvVbkGYBRLtsjLn/07tmUlw0lk3t/kRcMDkdRl/h1Q3dH+6kGY5bH+OmLGdHo/VjlDoPGUN6zsOymwYWfpMudMGXHpfswMHJiJ2B4+AMKZd/+0h5PGkFLhJsR4/EAIWBPpe4hJ1K9I3N59+UXmIY3rL9go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527160; c=relaxed/simple;
	bh=EIo7pHHR4gO4mfGCmnUXZm4mLaL8wgTqA2CvQFXF+84=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6zZCzgd6eqL+Oar4oedvTo0zZOJE3VG92V8u5XL2H6aD1OcIcipcL2kuu52MYhTirxNfjtaEi0zIReE2XQgZl9FH+9QqhHawWZxsYOk0HZ7YbQ4o9JEMdDGYRseV9XRZzGxmlfGkcK3kO3D4GspHhCJuovhhsrn80Cxe+t2Dkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BR2jD5LI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BR2jD5LI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B4C0B4E422D2;
	Tue, 27 Jan 2026 15:19:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8943F606F5;
	Tue, 27 Jan 2026 15:19:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEFE5119A8637;
	Tue, 27 Jan 2026 16:19:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769527153; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=heh6QTABC1RnxC0/CG7m3EfBRVf7thqpKJghKBFLwUE=;
	b=BR2jD5LIdOE6ItV2BRJUFQObFYdruvwGz1lszaCg7pAFfAIg4EC6Yzwx0VbPAs97IpAWlH
	ztlECsdrIIHhCobpxvfCpphGNOmb7I5qO1gbTrzIqbIIfKKQLmugUTwolXAUhCNRRqahdu
	d1pe6pudiyyRMQS55g6bLXou7oxF0cBUbpAC6QvIWx83ZGuZyNnclutPMGnlcYDalA38U9
	dhGNvT7GzmcPFn2OvVXBMWbhIDKzN/COaakTGpMYm7oi52m9O6avbqeN0GphqiSVpEMnop
	FgCodcIV4ut386bv+8WU4mHlpG+7CSBbLeaGq++gogMXc4Se1ESBEr348WL3iw==
Date: Tue, 27 Jan 2026 16:19:07 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ayush Singh <ayush@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Hui Pu
 <hui.pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@kernel.org>
Subject: Re: [RFC PATCH 00/77] Add support for dtb metadata and addon
 device-trees
Message-ID: <20260127161907.23e62463@bootlin.com>
In-Reply-To: <aW3IjNpBnnFE7-r7@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<CAL_JsqK4nH0B-CfKz5wgg12C+Vzi31ceHeOes94Z8hg3uN=X1g@mail.gmail.com>
	<20260114171822.2a44d2a5@bootlin.com>
	<aW3IjNpBnnFE7-r7@zatzit>
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

On Mon, 19 Jan 2026 17:00:44 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

...
> > 
> > I think we can have metadata at 3 differents levels:
> > - Property
> > - Node
> > - Global dtb  
> 
> This is a really minor point, but I don't especially like the term
> "metadata" for the symbol / fixup information.  Although it's
> technically accurate that it's metadata for the property bytestrings,
> in most contexts "metadata" makes me think only of tree global
> metadata.  By analogy, symbols and fixup information in a .so or .a
> could be seen as metadata to the raw code / data bytes, but I wouldn't
> normally use that term for it (whereas I might for, say, the soname or
> certain .note sections).
> 
> > With the suggestion you did on patch 6 related to FDT_REF_LOCAL and if I
> > understood correctly, you expect to have a kind of "container" tag to group
> > metadata on each level.
> > 
> > Also you expect to have the ability to handle all 'for now unknown' tag
> > smoothly and so, I agree, the length of the data related to a tag are
> > needed to be present with the tag itself. I see to kind of tag, some with
> > the length of data available in the u32 following the tag and other without
> > the length encoded.
> > 
> > Tags without length encoded are followed by one u32 field containing data
> > related to the tag. This allow to avoid a lot of 'TAG_XXX 0x04 u32_data'
> > Indeed, I have the feeling that quite a lot of tags will have only one u32
> > field as data part and so, having 0x04 encoded (cell aligned) each time.
> > 
> > A tag value is on 32bits. We can define the structure of this value.
> >   - bit 31 (msb):
> >      - 0: This is not a new kind to tag and so it doesn't follow this definition.
> >           All existing tags are in this categorie
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
> > 	    Because this size include some possible padding, its value is a
> >             multiple of 4 bytes.
> >             The offset of the tag + 4 + size points to the next tag.
> >           
> > 
> >   - bit 27..0
> >      tag specific identifier  
> 
> As noted elsewhere, I'm not necessarily opposed to having a general
> length encoding.  However, for each new tag I think we need to think
> carefully about whether it really is safe for older software that
> doesn't understand it to just skip it.
> 
> > With that definition, the following tags can be defined:
> >   - FDT_INFO_PROPERTY (new tag, length encoding): 0xf0000001
> >      This tag is available after a property.
> >      It is followed by a cell for the length of data, the data part is a
> >      sequence of tags (and related data) giving information related to the
> >      last property available before the tag.  
> 
> I'd prefer to avoid an additional layer of nesting here - I'd rather
> just have multiple top level tags.
> 
> >   - FDT_REF_LOCAL (new tag, 1 cell data): 0x90000002:
> >      The cell after this tag is the offset in the property where a local
> >      phandle is available
> > 
> >   - FDT_REF_PHANDLE (new tag, length encoding): 0xf0000003
> >      Cf. patch 11 for definition
> >      It is followed by a cell for the length of data. The data part is
> >      composed of:
> >        - offset (u32)
> >        - label (string including \0)
> >        - padding if needed to have next item aligned on 32bits
> > 
> > 
> > With that defined, supposing the following dts example:
> >   --- 8< ---
> >   /* 'foo' is a reference to local node,
> >    * 'bar' is a reference to an external node
> >    */
> >   prop = <1 2 &foo &bar1>;
> >   --- 8< ---
> > 
> > The dtb will see the following structure:
> > FDT_PROP ...
> > FDT_INFO_PROPERTY (0xf0000001)
> >   28 (length = (4+4)+(4+4+12) bytes)
> >   FDT_REF_LOCAL (0x90000002)
> >     0x8                             <--- offset of &foo
> >   FDT_REF_PHANDLE (0xf0000003)
> >     12 (length = 4+4+1+3 bytes)
> >     0xc                             <--- offset of &bar
> >     "bar1" + its \0                 <-- reference to resolve
> >     0x00 0x00 0x00                  <-- 3 bytes padding
> > 
> > Adding FDT_TYPE_U32 later will consist in defining
> > its value, probably a 0x9 family (1 cell after the tag for the
> > offset value)
> > 
> > At any point, only looking at the higher part of the tag (i.e. 0xN.......), we
> > can skip the tag and its data if don't know about the tag.
> >  - 0x0: Old tag format  
> >     -> Error if unknown  
> > 
> >  - 0x8 to 0xe: New format followed by 0 (0x8) to 6 cells of data  
> >     -> Ignore if unknown and skip the N cells of data to look at the next  
> > 
> >  - 0xf: New format followed by 1 cell giving the size of following data.  
> >     -> Ignore if unknown and read the length available in the cell after the  
> >        tag, skip length byte of data to look at the next.
> >        If the length read is not a multiple of 4: Error, invalid tag.
> > 
> > 
> > For this series we need the container tags:
> > - FDT_INFO_PROPERTY for information related to a property
> >   Among known tags defined in this series, only FDT_REF_LOCAL and
> >   FDT_REF_PHANDLE can be grouped into a FDT_INFO_PROPERTY.
> > 
> > - FDT_INFO_NODE for information related to a node
> >   Among known tags defined in this series, only FDT_EXPORT_SYM_LOCAL
> >   and FDT_EXPORT_SYM_REF can be grouped into a FDT_INFO_NODE.
> > 
> > - FDT_INFO_DTB for information related to the dtb
> >   Among known tags defined in this series, only FDT_IMPORT_SYM can
> >   be present into a FDT_INFO_DTB.
> > 
> > IMHO, the new tag FDT_BEGIN_NODE_REF related to orphan nodes doesn't
> > have to be in one of those containers. Indeed, FDT_BEGIN_NODE_REF
> > is more a node definition than a metadata.  
> 
> That's a perfect example of a new tag that absolutely cannot be just
> skipped if not understood.  Software *must* hard error if they
> encounter this and don't understand it.
> 

I have started to implement this "unknown tag" feature based on the tag
values definition presented here and with complementary feature (bit
allowing to skip an unknown tag) as presented in patch 2 discussion [1].

I didn't introduce any FDT_INFO_xxx tags. They introduce nesting tags
and David seems not agree with that.

I use simple test tags to have some "unknown tags" in dtb and looked at
the way to handle them.

When we read a dtb, no problem, we just skip "unknown tags" if we are
allowed to (flag in tag value).

The issue comes when we modify a dtb.

libftd allows to modify a dtb. It allows to add/modify/remove properties
and nodes. Bootloaders for instance use this capability to update a dtb
before passing it to the kernel.

How should we handle unknown tags in this context?

We don't knwow about the meaning of those tags (unknown tags) and so, we
don't know if those tags are still consistent with modifications done?

A property can be followed by an unknown tags related to this property.
Also a property can be followed by an unknown tag related to the node.
We simply don't know.

Any modification can impact unknown tags and make them inconsistent.
Here again, we simply don't know.

Should we avoid any modification when a dtb contains unknown tags?
Should we simply remove all unknown tags when a modification is done?

Bootloaders need to modify the dtb. Avoiding modification is a no-go.
Removing "unknown tags" when a modification is done will lead to removing
all unknown tags at bootloader stage.

Rob, David, any opinion related to this specific issue and the strategy we
should follow when modification are involved?

[1] https://lore.kernel.org/all/20260119104852.3e7043ee@bootlin.com/

Best regards,
Hervé
