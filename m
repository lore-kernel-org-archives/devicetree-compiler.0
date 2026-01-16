Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B272735B12C
	for <devicetree-compiler@vger.kernel.org>; Fri, 16 Jan 2026 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558631; cv=none; b=ZGbN8GxtY4tn0vo8xe8JrOIqYj2QG2SY2c8ajjFfz7LqarouadhJWuf0RxsdtqyzpxTjLJ8KP83oxBQa73ZHExkUBDwhyTCYprIVpYoSlHf8wlhWgytrXitYt3+ij1riX/0xV+YwJS0MSED7akOLuXg2VlbxTkPuxD291D0hes0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558631; c=relaxed/simple;
	bh=xVhTfp97pDXAaRzlsPRIep1s9lhfB+E1MxRtuaZon80=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t30oZrn6gP1bKag602FGLLiHBEwDNdjdoMDZWewRmBYvR2SKS+82/4UoI19wP7xc2KMA3JulqEBu7F0uhrZhmbuXQJtLdtN0/u7UCUpUmf3mW8JqGqY1593Nb2rn7sgwLJ4e4HBtPyiWb/5uQfXzJtn1OlmgzaT3XPVZV4OVF5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MjdfdSq/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MjdfdSq/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 573C61A28A8;
	Fri, 16 Jan 2026 10:17:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D4DC60732;
	Fri, 16 Jan 2026 10:17:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1290110B689B4;
	Fri, 16 Jan 2026 11:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768558627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h6ZcSdzqinE3TmWerFxTItmJ+1uErU+4DNdOPnfMLxY=;
	b=MjdfdSq/9Nf06aH/gE/rTZHEHqMUVMq8Pg9VuYA7sMdCBShtVBv+aAkP6hzL1J9k73H8lc
	H6TAp0JM9Lwd9udwljgmgRcu/njIiVwoQlAyYvp/5L7N1G64/QKKewsLgpumGgs8voGdpw
	5UDs7YbA/oeSoVGv21L0lBjFN+cqMPLHp3BmTpviqzRN1Cfu49rrA3MCEA4720tqXZbfsM
	dClHC+AhVf2lPDDRNoqtVBYHLfbHmoU0ASB0pKqBCeNR5H/W+EiOvkDoMJr1FXT2ZGG8zn
	ew4IWWkW3gbgf5McyO/QHnlFpoyySBeytnzCFDIQNgOYoKuLl4GGBswgL+MoYg==
Date: Fri, 16 Jan 2026 11:17:05 +0100
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
Message-ID: <20260116111705.69bc914c@bootlin.com>
In-Reply-To: <20260116111616.3a6c9ffc@bootlin.com>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
	<20260112142009.1006236-7-herve.codina@bootlin.com>
	<CAL_Jsq+EDvrEqqwsFjs0sGxYfKgQuSFqCiqQs-1b3TnbG+gATQ@mail.gmail.com>
	<aWg2JJstA0F-h9hi@zatzit>
	<CAL_JsqLx-NWM=gFdQfQ1Nw10ii2n5gX93WgH+zTcbHRt=Ze_vA@mail.gmail.com>
	<20260116111616.3a6c9ffc@bootlin.com>
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

On Fri, 16 Jan 2026 11:16:16 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Rob, David,
> 
> On Thu, 15 Jan 2026 09:54:22 -0600
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Wed, Jan 14, 2026 at 6:51 PM David Gibson
> > <david@gibson.dropbear.id.au> wrote:  
> > >
> > > On Tue, Jan 13, 2026 at 01:22:08PM -0600, Rob Herring wrote:    
> > > > On Mon, Jan 12, 2026 at 8:20 AM Herve Codina <herve.codina@bootlin.com> wrote:    
> > > > >
> > > > > FDT_REF_LOCAL dtb tag is a meta-data tag attached to a property.
> > > > >
> > > > > It indicates that the property defined before this tag (FDT_PROP) uses a
> > > > > phandle value and the node related to this phandle value is local (i.e.
> > > > > the node is present in the device-tree blob).
> > > > >
> > > > > It is followed by one value:
> > > > >  - offset (32bit):
> > > > >      Offset in the property data where the phandle is available.
> > > > >
> > > > > Example:
> > > > >   FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0x04
> > > > >   FDT_REF_LOCAL 0x00000004
> > > > >
> > > > >   This means that at the offset 4 of the property data, the value
> > > > >   (0x01020304) is a phandle and the related node is available in the
> > > > >   dtb.
> > > > >
> > > > >   This is what is encoded in the dtb when the related dts has a property
> > > > >   with the value set to <0xcafedeca &foo> with 'foo' a reference to an
> > > > >   existing node where the phandle value is 0x01020304.
> > > > >
> > > > > If several local phandles are used in the property data, several
> > > > > FDT_REF_LOCAL are present after the FDT_PROP tag. Each of them points
> > > > > with its offset value to the position of one phandle.
> > > > >
> > > > > For instance, if a first property with 8 bytes of data has a phandle
> > > > > value at offset 4 and a second property with 16 bytes of data has
> > > > > phandle values at offset 0 and 8, the following tags sequence is
> > > > > present:
> > > > >   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
> > > > >   FDT_REF_LOCAL 0x00000004
> > > > >   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
> > > > >   FDT_REF_LOCAL 0x00000000
> > > > >   FDT_REF_LOCAL 0x00000008    
> > > >
> > > > To follow up on my desire to both be easily extended and have more
> > > > type info, I have something like this in mind:
> > > >
> > > > FDT_TYPE_INFO 0x10 FDT_REF_LOCAL 0x0 FDT_TYPE_U32 0x4 FDT_REF_LOCAL
> > > > 0x8 FDT_TYPE_U32 0xc    
> > >
> > > I think general type info should be out of scope for this:
> > >  * This series is already enormous and complicated without that    
> > 
> > It is enormous, but I don't think the intention was to finalize and
> > merge it all at once. I certainly don't intend to review it all now.
> > The final result looks sane to me and with that we have a good idea
> > what information needs to go in the DTB. I think the first step is to
> > define the new metadata tags and what DTB format changes are needed.  
> 
> Indeed, the goal of this RFC is to give the big picture and open
> discussions.
> 
> FDT_TYPE_INFO tag is a container. It just groups other tags together.
> 
> I don't use the term TYPE in the proposal related to generic tag values [1].
> I use FDT_INFO_PROPERTY which is more generic.
> 
> Best regards,
> Hervé

[1] https://lore.kernel.org/all/20260114171822.2a44d2a5@bootlin.com/

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
