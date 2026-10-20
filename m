Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494860;
	b=xdSDOwTvaSvOwo8lCH/tIM+ixro12YsS7cKe7Mq4Amk62X1N/AMYsbS3JiYvtFci/I5v
	 W/9jsZtgDUX3QyU2Aou6xCEFmpQ41iM3TF49DyzOZBqjV0J7FqqcPdew4XOcrnZR5/MnA
	 wClu4I7KSViklaYxQh0Ji+i0c+6vsF3oNIiom81RrTeZBSOLZ3i4cdz87+1yfqBAaR8Bj
	 qMMUZq32lLk4lglwAnYPRy/Bn9ggROPMCTU/xqDcEjmsn0XxPY2qZMVYZsGbFQQJ+GBPv
	 ipKhe6dYcdfkjvjQQfdwuWqKmPT0xx3zOPWj2dBdP/KyOALkQVAhFMdxTlIvn6I7rxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494860;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=VD9PXrKPsg52orzhOiFjXJRmRbfBHyc5RoWWdwKxF0M=;
	b=zt99Pj9GgN0b5l2nzpwZDWRnV3rWgeJ9/oiv7FZl/2Jj4qQKMv0DZK7hbMO8twKCpujH
	 dsqQ1mooWHPOUluosLinhwKTfvWY4UgMim1sZsHNTigCHPbPEuLcR4HqoSfnQu3XhHK6q
	 csZsEpueT2wLMeDbr4pCePPrIBly7RVt5UX0t8fvXmxfZla50+FmSn+iwpApIgUJ2/tXR
	 00cBJEdYwlYjzpYqrun7h0mLEiDssgjvTCM2rotobRj0jKkNYPD37bL3H4Om1UDezPSCv
	 rF2CqVFh0Ztmweo2wF14d1QF9jfzHI6IPWX9NNne9HthsEpueJV4wUTnDL4hJ2rMSCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WKhtmytc;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967BB606A31C;
	Tue, 20 Oct 2026 11:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WKhtmytc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3EBE4C6344F;
	Tue, 20 Oct 2026 11:15:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98A9260393;
	Tue, 20 Oct 2026 11:14:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C205103289A8;
	Tue, 20 Oct 2026 13:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792494853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VD9PXrKPsg52orzhOiFjXJRmRbfBHyc5RoWWdwKxF0M=;
	b=WKhtmytcvf2MutFOnrTwk8Hyl4xsuxLJNdJN2WRMXFXZZLwzaI/lVjUDILPv0K4dMa6F6S
	MB/Ca3ceDlD29We5fCzPLvqIcntcLr1FDjmgaFj86ibYCwk/J4atUSDUcuotG+45tItVqN
	PoTEPdpR10zrh7bFc04uxHtbtUQL7qZiCrxfufI0JUaC/8eBHyAYW+c73+z7sUAJxRHvi4
	OJ7uHDvYYvSgrazItH4tK/i41CsHShRG0nx05bXHfH4fauFlCHcRN3nTswrCcyl6rfhkW6
	1wYWw38OR1tWNh322uXHRVgFQDqZ/z+HYjUjb6yiqI6SXc6+g2/W1EIcW6f8dw==
Date: Tue, 20 Oct 2026 13:14:06 +0200
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 05/74] libfdt: Prepare for metadata tag support
Message-ID: <20261020131406.02bd50ec@bootlin.com>
In-Reply-To: <atcM7MFZTFXLbap8@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-6-herve.codina@bootlin.com>
	<atVrHkfXl10FTEye@gractus.seuss>
	<20261019155659.4badecfb@bootlin.com>
	<atcM7MFZTFXLbap8@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Tue, 20 Oct 2026 17:41:04 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Oct 19, 2026 at 03:56:59PM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Mon, 19 Oct 2026 11:58:17 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Aug 26, 2026 at 11:48:34AM +0200, Herve Codina wrote:  
> > > > Metadata tags are tags carrying extra information, either global to
> > > > the DTB, specific to a node, or specific to a property.
> > > > 
> > > > In several places (e.g. node/property iterators), these tags just need
> > > > to be skipped. Introduce fdt_next_tag_filter() which wraps
> > > > fdt_next_tag() and uses a user-supplied filter function to decide
> > > > whether a tag should be hidden from the caller. Filtered-out tags are
> > > > returned as FDT_NOP.
> > > > 
> > > > Introduce fdt_tag_filter_skip_metadata() a filter function whose purpose
> > > > is to filter metadata tags; actual metadata tag filtering will be added
> > > > when metadata tags are defined.
> > > > 
> > > > Metadata tags must also be handled when a DTB is modified. They have to
> > > > be removed or skipped depending on the modification.
> > > > 
> > > > Here also, introduce fdt_tag_is_property_metadata() to provide a central
> > > > check for whether a tag is a property metadata tag; actual metadata
> > > > check will be added when metadata tags are defined.
> > > > 
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > > ---
> > > >  libfdt/fdt.c             | 34 +++++++++++++--
> > > >  libfdt/fdt_ro.c          |  3 +-
> > > >  libfdt/fdt_rw.c          | 90 +++++++++++++++++++++++++++++++++-------
> > > >  libfdt/fdt_wip.c         | 23 +++++++++-
> > > >  libfdt/libfdt_internal.h | 10 +++++
> > > >  5 files changed, 140 insertions(+), 20 deletions(-)
> > > > 
> > > > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > > > index 7941632f..8c026f26 100644
> > > > --- a/libfdt/fdt.c
> > > > +++ b/libfdt/fdt.c
> > > > @@ -323,6 +323,33 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> > > >  	return fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> > > >  }
> > > >  
> > > > +uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *nextoffset,
> > > > +			     bool (*tag_filter)(void *priv, uint32_t tag),
> > > > +			     void *priv)    
> > > 
> > > I don't really see why a higher order function is more useful than
> > > skipping tags you don't care about from the caller.  
> > 
> > Based on discussion we had related to fdt_next_tag() during the series introducing
> > structured tags, I has been decided that fdt_next_tag() will return all tags and
> > callers will handle them.
> > 
> > With that done, fdt_next_tag_filter() doesn't make sense anymore. I have already
> > planned to fully remove it.  
> 
> Ok, great.
> 
> > > > +{
> > > > +	int startoffset = offset;
> > > > +	uint32_t tag;
> > > > +
> > > > +	tag = fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> > > > +	if (tag == FDT_END)
> > > > +		return tag;
> > > > +
> > > > +	if (tag_filter(priv, tag))
> > > > +		return FDT_NOP;
> > > > +
> > > > +	return tag;
> > > > +}  
> > 
> > ...
> >   
> > > >  
> > > > +int fdt_prop_remove_metadata_tags(void *fdt, bool force_inplace,
> > > > +				  int prop_offset)
> > > > +{
> > > > +	int nextoffset, offset;
> > > > +	uint32_t tag;
> > > > +
> > > > +	/*
> > > > +	 * Only inplace using nopify is supported even if we could use an other
> > > > +	 * method involving splices if force_inplace is set to false.
> > > > +	 */    
> > > 
> > > As with earlier things, I'd really prefer to see this splice, based on
> > > principle of least surprise.  
> > 
> > Yes, splice will be done (already planned for unknown tags in the series
> > adding support for structured tags).  
> 
> Ok.
> 
> > > > +
> > > > +	tag = fdt_next_tag(fdt, prop_offset, &nextoffset);
> > > > +	if (tag == FDT_END)
> > > > +		return nextoffset;
> > > > +
> > > > +	/*
> > > > +	 * Look at all tags related to the current property. I.e. tags after the
> > > > +	 * current property and before either the next property, a sub-node  or
> > > > +	 * the end of current node
> > > > +	 */
> > > > +	do {
> > > > +		offset = nextoffset;
> > > > +		tag = fdt_next_tag(fdt, offset, &nextoffset);
> > > > +		if (tag == FDT_END)
> > > > +			return nextoffset;
> > > > +
> > > > +		/* Remove metadata tags related to the property */
> > > > +		if (fdt_tag_is_property_metadata(tag))
> > > > +			fdt_nopify_area(fdt, offset, nextoffset);    
> > > 
> > > The distinction between "metadata" and other tags doesn't make much
> > > sense to me.  Specifically why would the tag being "metadata" make it
> > > more of a candidate for removal?  What we need to know (for the
> > > callers so far) is whether the tag is invalidated by changing the
> > > contents of the property: I can't see how that would be related to
> > > whether it's "metadata" or not.  
> > 
> > All of this is going to be reworked based on discussion we've already had
> > during the previous series (introducing structured tag) review.
> > 
> > The distinction was done because for "unknown" tags, downgrade should
> > be done whereas for "known" tags it shouldn't.
> > 
> > Anyway, all of that is going to be reworked for the next iteration.  
> 
> Ok, fair enough.  Should I stop reviewing the current version of this
> series, since it will probably need a lot of rework based on my
> comments to the first series.

I wouldn't say you should stop reviewing.

Maybe you can have in mind that fdt_next_tag() will return all tags and so,
filtering out tags at fdt_next_tag() or using fdt_next_tag_filter() will not
be there anymore. This will not change fundamentally the way tags are used.
If they are skipped by filter function in this series, they will be skipped
by callers in the next iteration.

New tags added in the series will be there in the next iteration. The meaning
of those new tags will not be changed. As well as new dts keywords or other
concepts such as referencing an orphan node by path.

Tests introduced will also be there in the next iteration.

A lot of things available in the series will be there in the next iteration.

For all those reasons, I thing your review can still be useful.

Maybe you will find some other patches that could be applied or move to the
series introducing "structured" tags.

IMHO, even if I (we) know that some modification discussed in the series
adding support for structured tags will have impacts to this series, either
due the modification itself or because I will keep things consistent, having
your feedback and potential discussion on this series is still relevant.

Best regards,
Hervé
