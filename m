Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3A4DD3A7;
	Tue, 22 Sep 2026 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059333; cv=none; b=ZG0E1Wa5qUr7mUbxDcAUccpRe+eCOyoxkSOKfFwVaXn97221KiLBC1Nz/93d93FFrpzTt/oMdA6/kTE0wvjeSvbcakrV8t1BUpWwaaqWNN/2oh3P+loF63iRLo1Aggs3B05WUA0o3+HrTCm125m9raUQdsa1TwMbhCteHxiXdcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059333; c=relaxed/simple;
	bh=szeWvxi07zaZ8VBuWTXfsFEpNXFbl3+Oq+wxER2IuTY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYnAfim3y6OhWbbSxMdo7eZ7sjU4OgEcYh6aBgde8KVlGclDCL0B6v2QHKv6lW0s2So4PIK5R8i0oFj6mCLF28FXFkA7soTAxpuZzZpxp81c/yUJnn0OL94Dt3q/Kn78LNkdY6KvtiiiRqJ06J0fONIWyzGoxhp4AEIlTfZm2CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xaic2v4j; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xaic2v4j"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5E681C23DB0;
	Tue, 22 Sep 2026 06:42:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C006860580;
	Tue, 22 Sep 2026 06:42:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86EC510328173;
	Tue, 22 Sep 2026 08:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790059326; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q3Vf+8PWFtWZUIskQ6CRyBCwIFSfIMrS0KXNG+qbKwU=;
	b=Xaic2v4jLtt8XX/zhvYaeYDc8ugTaD/X14ypw5QxtPpPTys/SyKAEPG6rXST+syZA8Yo5s
	FOZA2kFPQK9BJjBx/qbnds0FM6vWIEoRueFk81jskBW67A0kxVrmLeoGPJCllKJR6vO4aJ
	2vC+YVsVPxgkKqGDV5a8nFRGOA9PP637r8RCEvsdZqtmjfcx9fQMqWvvhLo97asUA/DpJE
	tI1ItkptkspVLoUTavwqxLkHUOxOzbIfqiKuHcL9QqdF4sLoH3ZoQM0vbRlHCbDtAtj6Ju
	GzPtMUsd6duO8uMhnn2Lc1nEepsF40MIDdzd7Sekqg7HD1nSnulZ0UQnO3/pgg==
Date: Tue, 22 Sep 2026 08:41:54 +0200
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
Subject: Re: [PATCH v3 06/15] Introduce structured tag value definition
Message-ID: <20260922084154.576a42d0@bootlin.com>
In-Reply-To: <aq4N5zbuCVZ4e6-C@gractus.seuss>
References: <aqI3KnnQnUytqkEc@gractus.seuss>
	<20260910094126.4bf4cae6@bootlin.com>
	<aqJ5OhJcv4k-ZAj8@gractus.seuss>
	<20260911091653.37b22b0f@bootlin.com>
	<aqS6HmkaVYbrePtN@gractus.seuss>
	<20260914121937.5b7fa2bb@bootlin.com>
	<aqonNkbVqW9tf6Bg@gractus.seuss>
	<20260917090450.770c107a@bootlin.com>
	<aqzA11pFzN_3_Nhf@gractus.seuss>
	<20260918101617.46b3477e@bootlin.com>
	<aq4N5zbuCVZ4e6-C@gractus.seuss>
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

On Sat, 19 Sep 2026 14:22:09 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Sep 18, 2026 at 10:16:17AM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Fri, 18 Sep 2026 14:41:11 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Thu, Sep 17, 2026 at 09:04:50AM +0200, Herve Codina wrote:  
> > > > Hi David,
> > > > 
> > > > On Wed, 16 Sep 2026 15:21:15 +1000
> > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > >     
> > > > > On Mon, Sep 14, 2026 at 12:19:37PM +0200, Herve Codina wrote:    
> > > > > > Hi David,
> > > > > > 
> > > > > > On Sat, 12 Sep 2026 12:34:24 +1000
> > > > > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > > > > > 
> > > > > > ...
> > > > > >       
> > > > > > > > Do you mean that we should avoid the DATA_LEN_ENCODING and always have the
> > > > > > > > 32-bit value right after the tag to give the size for all "skippable" tags?        
> > > > > > > 
> > > > > > > Yes.
> > > > > > >       
> > > > > > 
> > > > > > I did a test using a dts file available in kernel sources. I used (arbitrary
> > > > > > choice) juno.dts [0].
> > > > > > 
> > > > > > Without any new tags, the size of the compiled dtb is 27067 bytes.
> > > > > > 
> > > > > > With new metadata tags identifying phandles in properties (FDT_PROPDATA_PHANDLE),
> > > > > > the size of the dtb becomes 29027 bytes and so 29027 - 27067 = 1960 bytes for
> > > > > > those FDT_PROPDATA_PHANDLE tags (+7.2%).
> > > > > > 
> > > > > > The tags used are composed of:
> > > > > > 32-bit: FDT_PROPDATA_PHANDLE value encoding 1 x 32-bit for data
> > > > > > 32-bit: offset in the property where a phandle is present.
> > > > > > 
> > > > > > Removing the '1 x 32-bit' information from the tag value and adding a 32-bit
> > > > > > 'length' in all cases will lead 3 x 32-bit values for a FDT_PROPDATA_PHANDLE
> > > > > > tag (tag + length + offset) instead of the 2 x 32-bit (tag + offset).
> > > > > > 
> > > > > > Back to juno.dts instead of 1960 bytes, the FDT_PROPDATA_PHANDLE will need
> > > > > > 1960 * 3 / 2 = 2640 bytes (+9.7%). This leads to around +2.5% of the whole
> > > > > > dtb just to have the 32-bit for length. This +2.5% can be easily avoided.
> > > > > > 
> > > > > > Also, I will not be surprised to see more tags in the future adding some more
> > > > > > metadata information and so increasing dtb sizes.
> > > > > > 
> > > > > > Quite often you have mentioned memory constraints system where libfdt should
> > > > > > be as small as possible. On those system, the dtb itself is embedded in the
> > > > > > binary close to libfdt. The size of dtb should be taken into account.      
> > > > > 
> > > > > Yeah, those proportions are high enough that I think it's worth it.
> > > > >     
> > > > > > If the SAFE_SKIP bit is removed, I even plan to use this now free bit in the
> > > > > > length encoding part:
> > > > > >   0b000: No data
> > > > > >   0b001: 1 fdt32
> > > > > >   0b010: 2 fdt32
> > > > > >   ...
> > > > > >   0b110: 6 fdt32
> > > > > >   0b111: On additional fdt32 to encode the length of data.
> > > > > > 
> > > > > > IHMO, length encoding bits in tag value definition should be kept and used
> > > > > > for all tags where the length is fixed and can be encoded using
> > > > > > these bits.      
> > > > > 
> > > > > Well, I'm convinced we want some sort of compact encoding of the
> > > > > length, but I think we can do better than the current proposal.  It
> > > > > seems implausible to me that we'll need 2^29 different metadata tags,
> > > > > so I think we can spend some more of the tag bits on the length.  How about:
> > > > > 
> > > > >    0x80000000		structured tag bit
> > > > >    0x7fff0000		tag type
> > > > >    0x0000ffff		tag length
> > > > > 
> > > > > So we have up to 2^15 (32k) different structured tags each with a
> > > > > length of [0..65534] bytes (length==65535 reserved for those that need
> > > > > a full 32-bit length word).
> > > > > 
> > > > > I believe that will avoid the extra length word for everything you
> > > > > have currently drafted.
> > > > >     
> > > > 
> > > > Yes, this will avoid the extra length field. The drawback is the that the
> > > > tag value is no more a well fixed value. Each time we have to check the tag
> > > > value we have to filter out the tag length.
> > > > 
> > > > For instance:
> > > > - FDT_PROPDATA_PHANDLE
> > > >   fixed data size 4 bytes for offset
> > > >   tag value: 0x80010004
> > > > 
> > > > - FDT_PROPDATA_PHANDLE_REF
> > > >   data: 4 bytes for offset + N bytes for a string
> > > >   tag value 0x8002ssss with ssss for the size
> > > > 
> > > > This will lead to code like this:
> > > >   tag = fdt_next_tag();
> > > >   if (tag == FDT_PROPDATA_PHANDLE)
> > > >     /* Do something */
> > > >      
> > > >   if (TAG_GET_ID(tag) == FDT_PROPDATA_PHANDLE_REF)
> > > >     /* Do something */    
> > > 
> > > True.  But.. a similar problem kind of exists with the original
> > > proposed encoding too: we *expect* a tag with fixed 4-byte contents to
> > > use the "1 cell" flags, but we need to consider the case of encoding
> > > it as VARLEN with a length field of 4.  We could choose to make that
> > > forbidden, but we'd still need to consider who's responsible for
> > > enforcing that.
> > > 
> > > Similarly, if a variable length metadata tag happens to have length 4
> > > or 8 in a particular place, is it valid to encode it with the 1-cell
> > > or 2-cell flag?  
> > 
> > My position was: if we expect a tag with "1-cell" flag, using varlen
> > field encoding is considered as an other tag and so either an error
> > or a skippable unknown tag.  
> 
> So essentially tags of different (fixed) length live in different
> namespaces.  Ok, that makes good sense to me, but wasn't initially
> obvious to me.  So, I think we need to spell this out a bit better.
> 
> > The same apply for varlen defined tag. Even if the data is, let's
> > say 8 bytes, the tag cannot be moved to a "2-cells" tag.
> > 
> > The kind of data length encoding (1-cell, 2-cells, varlength) is done
> > when the tag is defined and cannot be changed.
> > 
> > Who is responsible for enforcing that ?
> > I would say the documentation of the tag should clearly set the data
> > encoding used for the tag and the documentation of the "skippable"
> > format should say that data encoding is fixed for a given tag. It is
> > set when the tag is defined and any changes at runtime should be
> > considered as a different tag.
> > 
> > Of course we can introduce dynamic length encoding to set the data length
> > encoding in the tag according to the exact data length found at runtime.
> >   
> > > As a variant on my proposal, I'd also be fine with dividing the
> > > structed tags into several classes with bits indicating which is
> > > which.  Either:
> > > 
> > >  * "short" vs "long": "short" always has the length within the tag
> > >    word (and so cannot exceed 64k, or however many bits we set aside)
> > >    whereas long always has a length word
> > >  * "fixed" vs "variable", fixed length tag types always have the same
> > >    length, so the length can be considered part of the tag.  Variable
> > >    would have a length word.  
> > 
> > Well, only strings, or more generally arrays, need a varlen. For those
> > item, I would use the varlen word and so "long" in your definition.
> > 
> > For all others where the sizeof(data) is well known when the tag is
> > defined, I would use "fixed" and "long" only if sizeof(data) cannot
> > be encoded by "fixed" (lengh > limit of dedicated bits).  
> 
> Right, now understanding your thoughts on the originally proposed
> encoding, the "fixed" versus "variable" distinction makes more sense I
> think.  I do see the advantage of never having a variable length
> encoded within the tag word.
> 
> > Without any additional bits for any category, all of these fit with the
> > following length encoding:
> >   000...00: No data
> >   000...01: 1 x 32-bit
> >   111...10: N x 32-bit
> >   111...11: varlen word  
> 
> Right, so revising my suggestions in light of a better understanding
> of what you had in mind originally, it comes down to:
> 
>  * I think adding more bits to the size field would be worthwhile to
>    allow a wider variety of future fixed length metadata tags.

Right, I have planned to add one more bit compared to the original proposal.
This leads to 3 bits and so 0 to 6 32-bit data words (0b111 means varlen word).

Do you think we should add one more bits?

> 
>  * Originally I was thinking that having a length in bytes rather than
>    just a length in 32-bit words would be worth it.  But thinking
>    further, there's probably no benefit.  The length rounded up to
>    32-bit words is all we need for skipping over it when unknown.
>    Even if we want a fixed length tag with, say, 3 bytes of data, we
>    can pad that out to a 1-word tag with a reserved byte.

The varlen word could be kept in bytes.

> 
> Ok, so more length bits and better documentation of the fixed
> vs. variable distinction are the only remaming suggestions.
> 

Best regards,
Hervé


-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
