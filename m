Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D39420480;
	Fri, 11 Sep 2026 07:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111042; cv=none; b=m3cfxBSodypQDGXkoL6zBWrJsL/XsKC5gmDQVBHAy5mBiefdwCZctoenTdFoFx+taiuCq9Q4+FmnsvUYLhQ2Pc8L0CEJu35D0KVG6oYtX3daNJre3qw8HgaqEM5son5aPpielao2XUqDOg6MzhKtsOYHnKp8jq692u4AytAHzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111042; c=relaxed/simple;
	bh=BK3dlvngstI3umiXDRzLNUucgQ2XGaLh5BwddIA1ISg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EfvC1kdIupdAWIxB7haXPOOPec0JRC8xW80FQ1Zjn0zDuluBgrh9sBstIS6rXQAw2vr/xGTIZXsAyuWaHwspJdUvKXpryo19Br6ZqIIQONvKNfiC49TRTOhOsDxEdMdqL8XyiwJztCrkNgRtXbvgYz+CFg3e38wWGwzLnCL2jKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wRmWHrV0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wRmWHrV0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7EC1F1A0150;
	Fri, 11 Sep 2026 07:17:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F943601DE;
	Fri, 11 Sep 2026 07:17:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B07FD11C7AF71;
	Fri, 11 Sep 2026 09:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789111022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rK46VMEMdF8Kt3Ij0bWA2tQwXOC4yj7vrdn5ZbcHpDE=;
	b=wRmWHrV02SaMUt6qmuCvBo+KvX3yDK+nCATU6V0KPQHtxlB92SqgQr+KLlLVBIq96bII49
	/KIPxLCBCky9OGVowP0CG3kmcyI6f0TP3Ei5riJq4pxHylFo9JjKO59yw0YotY5Bpc/Hg5
	Hv+Em7Uc4syKYmHPZW368VWVQp36jy23rs8kzwR96GaKrkL0RBZU1slH+2RykrtXGIuVx5
	jxwv/jWN4zdEB25N+Oua9DJHJ+0e7YUyBi3nXKhi/vg6MLGzVxOaWPRd/bR2/y2C4x/eUi
	y0q8q1Kdo8W/vZWOESiFd4BDWqDXeU6hl2azsGFVbGjBdfRuucuTB6kL5eRBjg==
Date: Fri, 11 Sep 2026 09:16:53 +0200
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
Message-ID: <20260911091653.37b22b0f@bootlin.com>
In-Reply-To: <aqJ5OhJcv4k-ZAj8@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-7-herve.codina@bootlin.com>
	<aqI3KnnQnUytqkEc@gractus.seuss>
	<20260910094126.4bf4cae6@bootlin.com>
	<aqJ5OhJcv4k-ZAj8@gractus.seuss>
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

On Thu, 10 Sep 2026 19:32:48 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Thu, Sep 10, 2026 at 09:41:26AM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Thu, 10 Sep 2026 14:51:08 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Aug 26, 2026 at 10:31:37AM +0200, Herve Codina wrote:  
> > > > The goal of structured tag values is to ease the introduction of new
> > > > tags in future releases with the capability for an already existing
> > > > release to ignore those structured tags. In order to do that data length
> > > > related to the unknown tag needs to be identified.
> > > > 
> > > > Also add a flag to tell an old release if this tag can be simply skipped
> > > > or must lead to an error.    
> > > 
> > > I suggested/insisted on this in the past, but I've since realised this
> > > isn't actually useful.  The "structured tag" format is only useful
> > > because it allows you to skip over unknown tags, which means there's
> > > no point using it for ags that can't be skipped.  If we need new tags
> > > that can't be safely skipped, they can be added as old-style tags
> > > instead.
> > >
> > > In which case "old style" versus "new style" is no longer a good
> > > characterization: they would exist side by side, so the distinction is
> > > more "skippable" versus "non skippable" tags.  Which suggests that
> > > "skippable tags" or "metadata tags" might be a better term than
> > > "structured tags" - that would focus more on the why than the how.  
> > 
> > Do you mean that the SKIP_SAFE bit should be removed ?  
> 
> Yes.

So, in that case the term "skippable" tags makes sense.

Any non-skippable tag are then defined using the "old style".

The only non-skippable tag that will be introduce later by addons is
FDT_BEGIN_NODE_REF (patch 51/71 [1]).

Data related to this tag is the symbol name and so a string.

Using the "old style" for this tag, I will remove the 32-bit data lengh.
The next tag will be after the end of string '\0' + potential alignment.

This is consistent with "old style" tags which have a string as data. Indedd
no 32-bit data lengh were present for those "old style" tags.

Does it make sense on your side?

[1] https://lore.kernel.org/all/20260826094950.1088288-52-herve.codina@bootlin.com/

> 
> > I like the defined structure with the DATA_LEN_ENCODING part. Even for tags
> > which are not "skippable".
> > 
> > This ensures a kind of standardized format for all future tags instead of a 
> > specific definition (related to the length of the data) for each new tag.  
> 
> If we were designing the dtb format from scratch, I'd agree.  But
> given we already have what we have I think the drawbacks of
> introducing a second way of doing tags outweighs the benefits.
> 
> > For this kind of information related to the length of data, I prefer a global
> > rule instead of tag-specific rules.  
> 
> Right, but it can't truly be global, because we have the existing
> tags.
> 
> > > > Structured tag value is defined on 32bit and is defined as follow:
> > > > 
> > > >   Bits  | 31 | 30        | 29             28 | 27    0|
> > > >   ------+----+-----------+-------------------+--------+
> > > >   Fields| 1  | SKIP_SAFE | DATA_LEN_ENCODING | TAG_ID |
> > > >   ------+----+-----------+-------------------+--------+
> > > > 
> > > > Bit 31 is always set to 1 to identify a structured tag value.
> > > > 
> > > > Bit 30 (SKIP_SAFE) is set to 1 if the tag can be safely ignored when its
> > > > TAG_ID value is not a known value (unknown tag). If the SKIP_SAFE bit is
> > > > set to 0 this tag must not be ignored and an error should be reported
> > > > when its TAG_ID value is not a known value (unknown tag).
> > > > 
> > > > Bits 29..28 (DATA_LEN_ENCODING) indicates the length of the data related
> > > > to the tag. Following values are possible:
> > > >   - 0b00: No data.
> > > >           The tag is followed by the next tag value.    
> > > 
... 
> > > >   - 0b11: Data length encoding
> > > >           The tag is followed by a cell (u32) indicating the size of the
> > > >           data. This size is given in bytes. Data are available right
> > > >           after this cell.
> > > > 
> > > >           The next tag is available after the data. Padding is present
> > > >           after the data in order to have the next tag aligned on 32bits.
> > > >           This padding is not included in the size of the data.    
> > > 
> > > I'm guessing the 1 & 2 cell cases are pretty common so it saves a
> > > moderate amount of dtb size to have this encoding.  However, it does
> > > come at the cost of greater code complexity.  Is it worth it?  I'm
> > > willing to believe it is, but I think the case needs to be made.  
> > 
> > In term of code complexity, FDT_PROPDATA_PHANDLE introduced in the addons
> > series, patch 7/74 [0], is a 1-cell (or 1-fdt32) "structured" tag.
> > 
> > It can be compared with FDT_PROPDATA_PHANDLE_REF, introduced in patch 11/74 [1].
> > FDT_PROPDATA_PHANDLE_REF is a "Data length encoding" tag.
> > 
> > Modifications in libfdt/fdt.c are pretty similar for both tags.  
> 
> Right, it won't be in the case of specific tag handling.  It's the
> general case skipping that's more complex, because it has to consider
> both cases.

I don't understand. What do you mean ?

Current implementation for skipping tags is not so complex.

Do you mean that we should avoid the DATA_LEN_ENCODING and always have the
32-bit value right after the tag to give the size for all "skippable" tags?


Best regards,
Hervé
