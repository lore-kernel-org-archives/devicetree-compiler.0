Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA855166E3;
	Mon, 19 Oct 2026 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418239; cv=none; b=Bzw4NX5+X5dZKC92CBDh4fzrBzS3euhL0qh7SLdi2QRgeMhnbLZ6p2d1pGYIwOPRRpQ5/1bGncQVTkTfduYIgdVN96xTUb+WQcpfsDdMbDxsBqDZrkEZcfAThwb4WVJrj7UuvHp0I/QwlPpsDTupCMmxNLVjQQ/APfsMcnDOALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418239; c=relaxed/simple;
	bh=t+AJB5JCPRUGDk29tGUdIdFLwwbd3dADMravc4AVuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=toinTwBxmzGT59lRKspsVgXkSkUbxL2k2clKBRmJ5svyRJiN/15Okqg6JcFkNrfjFPSAD6AYgOsvixUCYftd5OpDLcydYtlHasdXyUnvHeLvvVnT9EXE+9m6Jcpx+LR8cngjD/A/6PUuAzeEuSNsHZ5NTIsis8hxa3lLlPbg1GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zrcqXtkt; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zrcqXtkt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B8D3B4E41223;
	Mon, 19 Oct 2026 13:57:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DA7460582;
	Mon, 19 Oct 2026 13:57:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F91D10328429;
	Mon, 19 Oct 2026 15:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792418227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2Vu2lt4x/mGouaejn+1yaITokBKKu4MtDgqA/6k12H8=;
	b=zrcqXtkt7T7t7Wvx1XWk7twztmqQI/tqZ0u8xIGY/uJrTNjhiSHHizSEh4bEtZ132vbB85
	oYswu0P5yWk+V7Af87LhRQoiMeBg8/vfGmAjkFm3mplq3psN32pj8qYslTv1dw9PNeKvV6
	cJxpHb5h+lCgoE3s3enSLh4JgZ5szf4Y4Rw5lU5toaLVPe6EDx26SGxKt5BEiZRwGbA36X
	UuKQeBbrRRJ40PKM8gSviIA10J+YozdSrCDil0esMiVeb6dOX0fKOSTr2vp4xB5mtVGDbE
	XCgQAygR5PY7fypILLRbAmQqCXLjms58nWMjTWzb0fF0sJAKKmLpRr2jY8vIRA==
Date: Mon, 19 Oct 2026 15:56:59 +0200
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
Message-ID: <20261019155659.4badecfb@bootlin.com>
In-Reply-To: <atVrHkfXl10FTEye@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-6-herve.codina@bootlin.com>
	<atVrHkfXl10FTEye@gractus.seuss>
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

On Mon, 19 Oct 2026 11:58:17 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 11:48:34AM +0200, Herve Codina wrote:
> > Metadata tags are tags carrying extra information, either global to
> > the DTB, specific to a node, or specific to a property.
> > 
> > In several places (e.g. node/property iterators), these tags just need
> > to be skipped. Introduce fdt_next_tag_filter() which wraps
> > fdt_next_tag() and uses a user-supplied filter function to decide
> > whether a tag should be hidden from the caller. Filtered-out tags are
> > returned as FDT_NOP.
> > 
> > Introduce fdt_tag_filter_skip_metadata() a filter function whose purpose
> > is to filter metadata tags; actual metadata tag filtering will be added
> > when metadata tags are defined.
> > 
> > Metadata tags must also be handled when a DTB is modified. They have to
> > be removed or skipped depending on the modification.
> > 
> > Here also, introduce fdt_tag_is_property_metadata() to provide a central
> > check for whether a tag is a property metadata tag; actual metadata
> > check will be added when metadata tags are defined.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  libfdt/fdt.c             | 34 +++++++++++++--
> >  libfdt/fdt_ro.c          |  3 +-
> >  libfdt/fdt_rw.c          | 90 +++++++++++++++++++++++++++++++++-------
> >  libfdt/fdt_wip.c         | 23 +++++++++-
> >  libfdt/libfdt_internal.h | 10 +++++
> >  5 files changed, 140 insertions(+), 20 deletions(-)
> > 
> > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > index 7941632f..8c026f26 100644
> > --- a/libfdt/fdt.c
> > +++ b/libfdt/fdt.c
> > @@ -323,6 +323,33 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> >  	return fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> >  }
> >  
> > +uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *nextoffset,
> > +			     bool (*tag_filter)(void *priv, uint32_t tag),
> > +			     void *priv)  
> 
> I don't really see why a higher order function is more useful than
> skipping tags you don't care about from the caller.

Based on discussion we had related to fdt_next_tag() during the series introducing
structured tags, I has been decided that fdt_next_tag() will return all tags and
callers will handle them.

With that done, fdt_next_tag_filter() doesn't make sense anymore. I have already
planned to fully remove it.

> 
> > +{
> > +	int startoffset = offset;
> > +	uint32_t tag;
> > +
> > +	tag = fdt_next_tag_(fdt, startoffset, nextoffset, NULL);
> > +	if (tag == FDT_END)
> > +		return tag;
> > +
> > +	if (tag_filter(priv, tag))
> > +		return FDT_NOP;
> > +
> > +	return tag;
> > +}

...

> >  
> > +int fdt_prop_remove_metadata_tags(void *fdt, bool force_inplace,
> > +				  int prop_offset)
> > +{
> > +	int nextoffset, offset;
> > +	uint32_t tag;
> > +
> > +	/*
> > +	 * Only inplace using nopify is supported even if we could use an other
> > +	 * method involving splices if force_inplace is set to false.
> > +	 */  
> 
> As with earlier things, I'd really prefer to see this splice, based on
> principle of least surprise.

Yes, splice will be done (already planned for unknown tags in the series
adding support for structured tags).

> 
> > +
> > +	tag = fdt_next_tag(fdt, prop_offset, &nextoffset);
> > +	if (tag == FDT_END)
> > +		return nextoffset;
> > +
> > +	/*
> > +	 * Look at all tags related to the current property. I.e. tags after the
> > +	 * current property and before either the next property, a sub-node  or
> > +	 * the end of current node
> > +	 */
> > +	do {
> > +		offset = nextoffset;
> > +		tag = fdt_next_tag(fdt, offset, &nextoffset);
> > +		if (tag == FDT_END)
> > +			return nextoffset;
> > +
> > +		/* Remove metadata tags related to the property */
> > +		if (fdt_tag_is_property_metadata(tag))
> > +			fdt_nopify_area(fdt, offset, nextoffset);  
> 
> The distinction between "metadata" and other tags doesn't make much
> sense to me.  Specifically why would the tag being "metadata" make it
> more of a candidate for removal?  What we need to know (for the
> callers so far) is whether the tag is invalidated by changing the
> contents of the property: I can't see how that would be related to
> whether it's "metadata" or not.

All of this is going to be reworked based on discussion we've already had
during the previous series (introducing structured tag) review.

The distinction was done because for "unknown" tags, downgrade should
be done whereas for "known" tags it shouldn't.

Anyway, all of that is going to be reworked for the next iteration.

> 
> > +
> > +	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
> > +		 (tag != FDT_END_NODE));
> > +
> > +	return 0;
> > +}

...

> > @@ -332,10 +377,10 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
> >  
> >  	/*
> >  	 * nextoffset it at the first tag after the node.
> > -	 * Skip possible unknown tags related to the node in order to add the
> > -	 * property after those tags.
> > +	 * Skip possible unknown tags and metadata tags related to the node in
> > +	 * order to add the property after those tags.
> >  	 */
> > -	nextoffset = fdt_node_skip_unknown_tags(fdt, nextoffset);
> > +	nextoffset = fdt_node_skip_unknown_and_metadata_tags(fdt, nextoffset);  
> 
> This makes even less sense to me.  The tags following the node belong
> to the node, until either FDT_BEGIN_NODE, FDT_END_NODE or FDT_PROP.
> We need to skip all of them regardless of whether they're "metadata"
> or not.

Yes, I will rework that part too.

> 
> >  	if (nextoffset < 0)
> >  		return nextoffset;
> >  
> > @@ -453,6 +498,12 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
> >  		if (err)
> >  			return err;
> >  
> > +		/*
> > +		 * We append data to the property. If known metadata tags are
> > +		 * present, they are related to existing data and not impacted
> > +		 * by data added. No need to remove them.  
> 
> You don't know that.  It might be true for the tags you have in mind
> so far, but there's no guarantee.  It's a contrived example, but a tag
> which gives "number of 0 bytes in the property" would be invalidated
> by an append, for example.

We talk about known tags. "Known" tags are tags that will be added in this series.
If other tags are added in the future, this could become incorrect indeed and should
be handle when those tags are introduce (in the future).

Anyway, I will probably rework this part too in order to make things clear.

The idea was to keep existing known tags related to the property if not
impacted by the append.

> 
> > +		 */
> > +
> >  		newlen = len + oldlen;
> >  		err = fdt_splice_struct_(fdt, prop->data,
> >  					 FDT_TAGALIGN(oldlen),
> > @@ -484,11 +535,16 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
> >  	if (!prop)
> >  		return len;
> >  
> > +	/* The property is going to be removed. Remove its metadata tags */
> > +	prop_offset = fdt_ptr_offset_(fdt, prop);
> > +	err = fdt_prop_remove_metadata_tags(fdt, false, prop_offset);
> > +	if (err)
> > +		return err;  
> 
> All tags from the property to the next END_NODE or FDT_PROP need to be
> removed, regardless of whether they're "metadata" or not.
> 
> Also, rather than removing them one by one, I'd prefer to see the
> total length of them calculated, and remove the property and extra
> tags with a single splice.

Will be updated in the next iteration.

> 
> > +
> >  	/*
> > -	 * The property is going to be removed. Remove also possible unknown
> > -	 * tags related to this property. Keep the dtb version unchanged.
> > +	 * Remove also possible unknown tags related to this property.
> > +	 * Keep the dtb version unchanged.
> >  	 */
> > -	prop_offset = fdt_ptr_offset_(fdt, prop);
> >  	err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset, false);
> >  	if (err)
> >  		return err;
> > @@ -522,10 +578,15 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> >  		return offset;
> >  
> >  	/*
> > -	 * Try to place the new node after the parent's properties and unknown
> > -	 * tags related to those properties.
> > -	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
> > -	 * Skipping FDT_NOP tags will correctly skip unknown tags.
> > +	 * Try to place the new node after:
> > +	 *  - the parent's properties
> > +	 *  - the metadata tags related to those properties  
> 
> Again, the "metadata" distinction doesn't really make sense.  You want
> to place the new node immediately before the first FDT_BEGIN_NODE or
> FDT_END_NODE tag within the parent node.

Here also, will be updated.

> 
> > +	 *  - unknown tags related to those properties.
> > +	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag_filter.
> > +	 * metadata tags are also reported as FDT_NOP by fdt_next_tag_filter
> > +	 * thanks to the filter function used.
> > +	 * Skipping FDT_NOP tags will correctly skip unknown tags and metadata
> > +	 * tags.
> >  	 */
> >  	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
> >  	/* the fdt_subnode_offset_namelen() should ensure this never hits */
> > @@ -533,7 +594,8 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> >  		return -FDT_ERR_INTERNAL;
> >  	do {
> >  		offset = nextoffset;
> > -		tag = fdt_next_tag(fdt, offset, &nextoffset);
> > +		tag = fdt_next_tag_filter(fdt, offset, &nextoffset,
> > +					  fdt_tag_filter_skip_metadata, NULL);
> >  	} while ((tag == FDT_PROP) || (tag == FDT_NOP));
> >  
> >  	nh = fdt_offset_ptr_w_(fdt, offset);
> > diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> > index 7ca3ffbc..b2f9f8d1 100644
> > --- a/libfdt/fdt_wip.c
> > +++ b/libfdt/fdt_wip.c
> > @@ -31,6 +31,17 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
> >  	if ((unsigned)proplen < (len + idx))
> >  		return -FDT_ERR_NOSPACE;
> >  
> > +	if (idx < (unsigned)proplen) {
> > +		/*
> > +		 * The property existing data are going to be modified.
> > +		 * The property metadata tags are related to the property
> > +		 * data. Remove them.
> > +		 */
> > +		err = fdt_prop_remove_metadata_tags(fdt, true, prop_offset);
> > +		if (err)
> > +			return err;
> > +	}  
> 
> Similar to removal, I'd prefer to see a calculation of the total
> length and a single splice_region, rather than removing them one by
> one.

Yes.

Best regards
Hervé
