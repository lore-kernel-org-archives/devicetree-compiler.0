Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A0018FDDE;
	Tue,  1 Sep 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265124; cv=none; b=osdewU5mwX5VXc7cOFgyh90CSZpSjywTSsPjE3mLgs/fxgg5L08JpalmBFsTyQByAkPHwkssW4uxBvGwn+VgRv7tmSyFWjBDoWpjGTxoyuF+PeszKn/zWavs5nJrqUOAl1U5NQ38TBW2YERhynkFtjTlLE1ZMi2soE8/hlhS5FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265124; c=relaxed/simple;
	bh=tMRhqb3YRTHNWUFIi3H7GQXBr3LmkmJho1temWzTBxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SiCsKvX2cx7o6Xys3zmz4SC7iwe3h73KH242hGvVPtFFBzmbcE0A3wdyQuVs0HLg3pGcFMvvMAvhBUytO37oTdI9jmNJ8EeJrRaFUoviwNGwR/+Irori6RihYoJ+dzoCuIRh9m4Rnjor2TYh4Dx6Nykr03rTwklePVfyKTN1HJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gYASgnKc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gYASgnKc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 502F24E41497;
	Tue,  1 Sep 2026 12:18:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21BE96053C;
	Tue,  1 Sep 2026 12:18:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC52411C7923B;
	Tue,  1 Sep 2026 14:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788265113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HszUgqdfcGfeFAZvII6FGq7FKmmW8QAz5op7ETCMXDw=;
	b=gYASgnKcQyWHS8f1DiE65VAqoGPdnCNkGjOsV+2opXbBeED/B3kKAaDQ9e7I8k4in853m3
	sj3vxOudDw2oBZoMqipq+1GVM77Hkhu+eFBIKbg3MJ+D8IRnFLQF5KaYmlhn3GcyKV2JJ5
	TjNO/pipaBn1TBOOQpr8AVLLCleXe4fPFTAqdCcjZcWSQ2W52jthdO1z7IRt0FMSeqGonj
	l0SeweiLyLfm4WkdNTiOw/o/SVI7kojHbemWnqQpjtIDiB5jz7GzUKtQ6F3CyFvd2VKWg5
	syIceSCxf1+wOsMeun55cm6YSXEhIT8STwvyOyN6KdU99kMhruE0Y8QWjDO4cg==
Date: Tue, 1 Sep 2026 14:18:26 +0200
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
Subject: Re: [PATCH v3 02/15] libfdt: Don't assume the root node is
 available at offset 0
Message-ID: <20260901141826.49b1a1b7@bootlin.com>
In-Reply-To: <apaBuQ8kn2bOzYcI@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-3-herve.codina@bootlin.com>
	<apOhk-NQusFgV5Sx@gractus.seuss>
	<20260831140119.1f14b420@bootlin.com>
	<apaBuQ8kn2bOzYcI@gractus.seuss>
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

On Tue, 1 Sep 2026 17:42:02 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Aug 31, 2026 at 02:01:19PM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Sun, 30 Aug 2026 13:21:06 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> > 
> > ...
> >   
> > > > -int fdt_next_node(const void *fdt, int offset, int *depth)
> > > > +int fdt_root_offset(const void *fdt)
> > > >  {
> > > >  	int nextoffset = 0;
> > > > +	int offset;
> > > > +	uint32_t tag;
> > > > +
> > > > +	do {
> > > > +		offset = nextoffset;
> > > > +		tag = fdt_next_tag(fdt, offset, &nextoffset);
> > > > +		switch (tag) {
> > > > +		case FDT_END_NODE:
> > > > +		case FDT_PROP:
> > > > +			return -FDT_ERR_BADSTRUCTURE;
> > > > +
> > > > +		case FDT_BEGIN_NODE:
> > > > +			return offset;
> > > > +
> > > > +		default:
> > > > +			break;
> > > > +		}
> > > > +	} while (tag != FDT_END);
> > > > +
> > > > +	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;    
> > > 
> > > This should be BADSTRUCTURE rather than NOTFOUND: a dtb without a root
> > > node is not validly constructed.  (This could matter quite a lot if
> > > this error gets propagated up a call chain - a NOTFOUND is usually
> > > non-fatal, but BADSTRUCTURE means there's basically nothing that can
> > > usefully be done with the dtb, which the caller needs to know as soon
> > > as possible).  
> > 
> > Now yes, a dtb without a root node is an invalid dtb but soon with addon this
> > will be allowed [1].  
> 
> Ah, ok.  I haven't looked at the addon stuff yet.  I do intend to, but
> it will certainly take a while (70+ patches!).
> 
> So, I'm guessing here, but it still seems odd to me that an addon with
> no BEGIN_NODE tags at all could be useful.

No BEGIN_NODE doesn't mean and empty addon.

Addons can have only orphan nodes without any root node. Those orphan nodes are
nodes existing in the base devicetree the addon is applied to. Addon needs to
refer those existing node and this reference is the orphan node.
--- 8< ---
/addon/

&node_from_base_dtb { /* <--- Orphan node. Node defined in the base DT */
   node_defined_in_addon { /* <--- Node added by the addon once applied */
      ...
   };
};
--- 8< ---

In the addon, those orphans are identified with BEGIN_NODE_REF [2] and cannot be
considered as root nodes.

[2] addon series, patch 51/74
    https://lore.kernel.org/all/20260826094950.1088288-52-herve.codina@bootlin.com/

> 
> > addon dtbs will be clearly identified (the dt_flags header field has
> > FDT_FLAG_ADDON set for addon dtbs) and so what do you think if the error code
> > returned depends on this flag.
> > 
> > NOTFOUND in case of addon and BADSTRUCTURE otherwise.  
> 
> I'd need to look at the details of addons to figure out if this makes
> sense but I'm not opposed to the approach in principle.
> 
> > If you are ok with that, I will update this current patch to return BADSTRUCTURE
> > in all case. Indeed, addon are not yet available.  
> 
> Right, regardless of where we go with addons eventually, I think it's
> preferable to return BADSTRUCTURE for now.  That can be changed once
> addons are actually implemented.

Exactly!

> 
> > 
> > [1] https://lore.kernel.org/all/20260826094950.1088288-54-herve.codina@bootlin.com/
> >   
...

> > > 
> > > Do you need this special casing? Won't the fact you've update
> > > fdt_next_node() to handle the offset 0 case be enough?  
> > 
> > The full loop is the following:
> > --- 8< ---
> > 	for (offset = root_offset, depth = 0;
> > 	     (offset >= 0) && (offset <= nodeoffset);
> > 	     offset = fdt_next_node(fdt, offset, &depth)) {
> > 		if (depth == supernodedepth)
> > 			supernodeoffset = offset;
> > 
> > 		if (offset == nodeoffset) {
> > 			if (nodedepth)
> > 				*nodedepth = depth;
> > 
> > 			if (supernodedepth > depth)
> > 				return -FDT_ERR_NOTFOUND;
> > 			else
> > 				return supernodeoffset;
> > 		}
> > 	}
> > --- 8< ---
> > 
> > The test 'offset == nodeoffset' is the problematic one. nodeoffset
> > is the parameter passed to the function.
> > 
> > I have chosen to avoid offset 0 for the root node and I have updated 'nodeoffset'
> > previously if it is 0.
> > 
> > Even if fdt_next_node() updates 'offset' if it is 0, 'nodeoffset' has also to be
> > update if it is 0. Indeed, 'offset' will be updated from 0 to the real root node
> > offset. In all case to have the test be correct, 'nodeoffset' should be updated
> > to the real root node offset if it is 0.  
> 
> > Having fdt_next_node() updating 'offset' if it is 0 will not handle all case.
> > When offsets comparison is done, both offsets should consider the real offset of
> > the root node instead of the 0 value.  
> 
> Ah, right.  I missed the fact it was updating the nodeoffset
> parameter, rather than the working/starting offset.
> 
> > Also the fdt_supernode_atdepth_offset() can be called with 'nodeoffset' set to the
> > real root node offset instead of 0. Indeed, fdt_root_offset() is available (and
> > needed).  
> 
> Theoretically we could avoid explicitly looking at the root offset for
> 'offset', by starting 'offset' negative and moving the fdt_next_node()
> to the start of the loop body instead of the end.  That would handle
> the nodeoffset == root_offset case, not not the nodeoffset == 0 case.
> Arguably we could disallow the later - finding the non-existent
> supernode of something we know at compile time to be the root node
> isn't very useful - if it only turned out to be the root node at
> runtime, I'd expect it to have come from another function, which
> should give us root_offset rather than 0.
> 
> But.. it's certainly safer to keep it working whether passed 0 or the
> real root offset.  There are other ways we could do it, but I think
> they'd turn out equally inelegant.
> 
> Ok, makes sense to me.
> 

Ok, I will update fdt_check_node_offset_() to have it updating its offset
parameter to the real offset of the root node when its value is 0.

Based on this update, will see where it goes. I mean, impacts on callers, if
it simplifies things or not, if the offset update needs also to be propagate
to caller's parameter or any other similar point that we can see during the
implementation.

Having something implemented and available in a patch will be the best to
compare changes and impacts related to fdt_check_node_offset_() update.

Here we have a version of handling offset 0 vs real root node without any
offset update done in fdt_check_node_offset_(). In the next iteration we will
have the version with update done in fdt_check_node_offset_().

I think the golden rules to follow on this point is "keep it as simple as
possible".

Best regards,
Hervé
