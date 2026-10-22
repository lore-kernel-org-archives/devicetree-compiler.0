Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662473;
	b=vGkF9ZdvULfXjAZYeyQX49oK5w9qZgAnEYmSedsiLFJvisZSpXJ4mT2vWdkctyhmt7nO
	 +N7cV/iTCYvDk4/1uThNoRucXgppnxcdVUt3R1XSMIosyP6k+9Jbr1SKGz6efAhxlIEj4
	 3D97nPHzddNN4Ib3hPNhDiB8HhVrG/nYdIQlyQYNn2kJJLVUONljJo/Rgoj51fToA4nlZ
	 v1PjPgcMvgfDDaleUOz1dtQcrYPJkLxmipvarDhDciXoSq2i7FiqMwIuuY8zldX7Af4k0
	 sGpHO8ZF962W1KKH6zmeoPpJ5wqMXx7BeEMyxkfYHwuHFMoawNA6rwU3WaBi/aU8V9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662473;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=fLZrkDHTW99lYmYtpYbwH9NJHcUfkylrMGIDD7IU7Zw=;
	b=k32CN2c/aG3QvwNV1Nz9axiTyNe17gVTo4/rAuwYv1A0D298X+We84ER0KyyZTKWyItF
	 JgaQ58fDAv6Kow/KOSmYZO+5zZuUPOBTCLnlz7VhOB6CBedoC/dV63tvmhIDfXF6FIXoO
	 7ruzHtogpO2iMNIvsXePysTBlMRYtpJNAmctAIQKW+IHVPMGXOVU8elHh1x9pBpS0XjYP
	 R1h4VpmtsDtIOOdduiy3Jq2Mlg9y0l5mXmFYIMBGU772G2xF24Nf+jlNWFPyfKnMlyf80
	 ChZ9vQz16GNMB83+3mqhQcblDE6ORDBZerrihpdPWM+iR/anMtm862X/U1xSp4cqT8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l4LphxNG;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6397606A326;
	Thu, 22 Oct 2026 09:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6397606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=l4LphxNG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE3654E412AE;
	Thu, 22 Oct 2026 09:47:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0F2D60360;
	Thu, 22 Oct 2026 09:47:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4F6310328E09;
	Thu, 22 Oct 2026 11:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792662467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fLZrkDHTW99lYmYtpYbwH9NJHcUfkylrMGIDD7IU7Zw=;
	b=l4LphxNGF82GbFqghSpseeNljHH/VoqprVHmfuIKAMbMuFoe4HIPu0jrU1MWdWi7i2y5WK
	bTlqidB+N8uD4Oo7RiOx7vfFMenUX62b6MkeEP+JD0HSCbKPSq5/49cFM64oad5Uo3bVxb
	peDS9zcwrd44Hr1W8bl1nisro6zcNwlceooo8tv8/LSkCcBNyIYrlmds0Gr1Q/Q4PZtZJw
	o6QuWce/5kAWdO6R5mJ45BUl6TXsiTV+eERM8DHYy0uXBBtRtVLCFLwcOej785HSCVi18c
	C3SyTReyYv59kMLIqFfHYC6BdQkrPH/8aGbrBzEqrtp7+weV+Y63+mGX5xQrLQ==
Date: Thu, 22 Oct 2026 11:47:41 +0200
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
Subject: Re: [RFC PATCH v2 07/74] Add support for FDT_PROPDATA_PHANDLE dtb
 tag
Message-ID: <20261022114741.31171b04@bootlin.com>
In-Reply-To: <atl8nkrGFvhWRqDr@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-8-herve.codina@bootlin.com>
	<atgtw8QubzVfWMYP@gractus.seuss>
	<20261021192615.1f5b91ff@bootlin.com>
	<atl8nkrGFvhWRqDr@gractus.seuss>
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

On Thu, 22 Oct 2026 14:02:05 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > What do you think is clunky ?
> > Is it the PROPDATA term itself ?  
> 
> Pretty much yes.
> 
> After the explanation above, I think I'm ok with FDT_PROPDATA_PHANDLE.

Ok, I will keep it (and FDT_PROPDATA_PHANDLE_REF).

...

> > > > -static struct data data_append_markers(struct data d, struct marker *m)
> > > > +struct data data_append_markers(struct data d, struct marker *m)
> > > >  {
> > > >  	struct marker **mp = &d.markers;
> > > >  
> > > > @@ -288,6 +288,7 @@ struct marker *alloc_marker(unsigned int offset, enum markertype type,
> > > >  	m->type = type;
> > > >  	m->ref = ref;
> > > >  	m->next = NULL;
> > > > +	m->is_local = 0;    
> > > 
> > > Storing is_local in the marker doesn't make sense to me.  I think the
> > > locality should be calculated only when we actually go to emit the dtb
> > > - I believe we should be able to deduce it from m->ref.  
> > 
> > When we parse a dtb, we do not have any reference for local phandle, we have
> > only the phandle value.  
> 
> Heh, right, I remarked on that further down.
> 
> > Later in build_dt_info(), complete_references() is called. This new function
> > is introduced in patch 9 ("dtc: Complete REF_PHANDLE markers with ref strings
> > and is_local flags"). It completes the reference either filling the ref field
> > based on the phandle value for all local reference (parsing from a dtb) or
> > setting is_local based on the reference (parsing from a dts).  
> 
> Ah, right having that logic in a different patch makes it harder to
> follow.
> 
> What concerns me here is that currently we have an invariant that a
> REF_PHANDLE marker always has a meaningful m->ref field - from as soon
> as it's added to the property data.
> 
> This patch breaks that assumption, which means when looking at some
> random part of the code it's hard to know whether we're in a state
> where m->ref is valid or it might not me.
> 
> One approach is to minimise the gap where m->ref is invalid.  That's
> both in terms of code path - at minimum the m->ref fields should be
> valid by return from dt_from_*().  It's also in terms of not leaving
> intermediate patches where this is not fixed up.
> 
> The other approach would be to create new marker types indicating
> these intermediate states.  The markers are for dtc internal use, they
> don't need to have 1 to 1 correspondance with things in either dtb or
> source format.

I don't want to introduce new markers for handling intermediate states.

I really prefer avoiding those kind of "fake" marker which will have
a short lifetime and should not be seen by code (other than the code
moving this intermediate state to the final state).

My strategy was to ensure that once build_dt_info() is called, all
markers are fully correct with all field (is_local and ref) correctly
set.

build_dt_info() is called by all parser at the end of the parsing
operation to return a struct dt_info which is the dtc internal
internal representation used by the rest of code.

Are you ok with this strategy?

If yes, patches order in this series will be changed.

The current order is
 - Patch 7: Add support for FDT_PROPDATA_PHANDLE dtb tag
 - Patch 8: livetree: Improve get_node_by_phandle()
 - Patch 9: dtc: Complete REF_PHANDLE markers with ref strings and is_local flags

With that order we have the incomplete marker state present after patch 7 and
before patch 9.

Moving 'Add support for FDT_PROPDATA_PHANDLE dtb tag' after introducing the marker
state completion will avoid the problem.
 - Patch 7: livetree: Improve get_node_by_phandle()
 - Patch 8: dtc: Complete REF_PHANDLE markers with ref strings and is_local flags
 - Patch 9: Add support for FDT_PROPDATA_PHANDLE dtb tag

Patch 8 and 9 could be squashed if you prefer to have the completion added
in the 'Add support for FDT_PROPDATA_PHANDLE dtb tag' patch.

> 
> It seems to me there's an important difference between the -Idts and
> -Idtb cases: in the dts case, we have a valid reference, but the
> phandle needs to be filled in later; in the dtb case, we have a valid
> phandle, but the reference needs to be filled in later.  Using
> different marker types for those cases doesn't seem unreasonable for
> me.  In fact, for clarity it might even make sense to have a third
> variant for "both phandle and m->ref are valid" - the fixup code
> between input and output would convert either of the first two
> variants into the third, which is what the final output code would
> require.
> 
> That's not necessarily the best way to do it, but I really prefer
> where what's valid in a structure can be determined from the type and
> contents alone - rather than having to know where you are in a complex
> code path to know what's valid.

Performing marker completion in build_dt_info() avoid additional markers
and avoid also incomplete markers in the code path.

Before build_dt_info() call, the internal devicetree representation doesn't
exits for dtc. We are in the process of parsing and so we are building this
internal representation. After this call, the internal representation exists
and all markers are fully set without the need to introduce (and handle)
additional markers.

In other word, dti returned by all dt_from_*() functions returns a fully
complete dt_info.
--- 8< ---
	if (streq(inform, "dts"))
		dti = dt_from_source(arg);
	else if (streq(inform, "fs"))
		dti = dt_from_fs(arg);
	else if(streq(inform, "dtb"))
		dti = dt_from_blob(arg);
	else
		die("Unknown input format \"%s\"\n", inform);
--- 8< ---

User of this dti will never see an incomplete marker.

...

...
> > > > +		case FDT_PROPDATA_PHANDLE:
> > > > +			if (!(flags & FTF_PROPDATA_PHANDLE))
> > > > +				die("PROPDATA_PHANDLE tag found in flat tree"
> > > > +				    " version <20\n");
> > > > +
> > > > +			if (!prop)
> > > > +				die("PROPDATA_PHANDLE tag found without a previous PROP tag");
> > > > +
> > > > +			offset = flat_read_word(dtbuf);
> > > > +
> > > > +			/*
> > > > +			 * A reference to a phandle is present in the property
> > > > +			 * Mark the whole property as TYPE_UINT32.
> > > > +			 */
> > > > +			property_add_marker(prop, TYPE_UINT32, 0, NULL);
> > > > +
> > > > +			/* Mark the offset as a local phandle reference */
> > > > +			m = alloc_marker(offset, REF_PHANDLE, NULL);
> > > > +			m->is_local = true;
> > > > +			prop->val = data_append_markers(prop->val, m);    
> > > 
> > > This doesn't properly populate m->ref which is an essential field in a
> > > REF_PHANDLE marker.  Of course, doing so is kind of tricky - it
> > > requires searching for the node with the referenced phandle, which
> > > might not have been parsed yet.  So, alas, it will require a second
> > > pass to fix up the REF_PHANDLE markers.  
> > 
> > We cannot do it here. The whole dtb needs to be parsed to set correctly
> > m->ref.  
> 
> Right, that's what I mean by a second pass.
> 
> > This is done by complete_references() introduced in patch 9.  
> 
> Yeah, as above I don't like leaving this structure in a potentially
> incomplete state for several patches.

Patch re-ordering proposed above will fix this problem.



...
> > > Need to check for overflows here.  
> > 
> > What do you think about
> > 	if ((tmp + sizeof(fdt32_t) < tmp) ||
> > 	    (uint32_t)proplen < tmp + sizeof(fdt32_t))
> > 		return -FDT_ERR_???
> > Probably using an uint32_t for tmp here.  
> 
> That'd work, but it might be more natural to use:
> 	if (proplen < sizeof(fdt32_t) ||
> 	    tmp < 0 ||
> 	    tmp > proplen - sizeof(fdt32_t))
> 		return <error>;
> 
> That lets tmp remain an 'int'.  Using 'int' for offsets is sometimes
> problematic, but it's a convention that's now pretty baked into the
> libfdt interface.  Note that offsets encoded into the dtb are required
> to be < 2^31, not just < 2^32.

Fine, will do what you've suggested.

> 
> >   
> > >   
> > > > +				return -FDT_ERR_BADSTRUCTURE;    
> > > 
> > > I'm not sure BADSTRUCTURE makes sense for this.  I think it's probably
> > > worth adding a new error code for bad metadata tags.  
> > 
> > #define FDT_ERR_BADMETADATA	20
> > 	/* FDT_ERR_BADMETADATA: The device tree has corrupt metadata. */
> > 
> > Is it ok on your side ?  
> 
> Works for me.

Perfect.

> 
> > > > +
> > > > +			/* Retrieve the phandle value from the property */
> > > > +			pfdt32 = prop;
> > > > +			pfdt32 += tmp / sizeof(fdt32_t);    
> > > 
> > > Again, this will need updating for non-aligned phandles.  
> > 
> > Will handle unaligned offset.
> >   
> > >   
> > > > +			val = fdt32_ld(pfdt32);    
> > > 
> > > ... which reminds me the entire fdt32_ld() interface is kind of
> > > broken.  They're specifically intended to handle misaligned accesses,
> > > strictly speaking it's already UB to generate a misaligned pointer, so
> > > there's a problem before we even call it.  Fixing this within API/ABI
> > > constraints is a nasty problem :(.  
> > 
> > I can introduce and use the following:
> > ---- 8< ----
> > static inline uint32_t fdt32_ld_unaligned(const uint8_t *pfdt32)
> > {
> > 	return ((uint32_t)b[0] << 24)
> > 		| ((uint32_t)b[1] << 16)
> > 		| ((uint32_t)b[2] << 8)
> > 		| b[3];
> > }
> > ---- 8< ----  
> 
> Uh.. I'd rather not handle the fdt32_ld() mess at the same time as
> dealing with the addon stuff.  For now I think use fdt32_ld(), and
> continue to rely on the fact that in practice creating (but not
> dereferencing) misaligned fdt32_t * pointers is generally fine.

Ok, will keep fdt32_ld().

...
> > > >   * be set to the offset immediately following the tag.
> > > >   *
> > > >   * returns:
> > > > - *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_END),
> > > > + *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_END
> > > > + *	or any other known tags),    
> > > 
> > > This hunk looks like it belongs in an earlier patch.  
> > 
> > Well we add FDT_PROPDATA_PHANDLE and this is the first known tag added other
> > the existing ones already listed. Do you prefer an exhaustive list of known tags?
> > 
> > Also worth noting that fdt_next_tag() can return all unknown strutured tags that
> > can be skipped this has to be mentioned in the series adding support for structured
> > tag.  
> 
> Ah, yes.  Probably easiest to revise this to remove the complete
> listing of tags at the point we introduce structured tags.

Will update in the next iteration of the structured tag series and so no
modification will be present here in this support for addon series.

What do you thing about:
--- 8< ---
	/**
	 * fdt_next_tag - get next tag in the device tree
	...
	* returns:
 	*	The tag type, either a known tag or an unknown structured tag
	*       if this unknown tag can be skipped (SAFE_SKIP bit set in this
	*       tag).
	*	In case of error, FDT_END is returned with @nextoffset set to
	*	a negative error code.
 	*/
--- 8< ---

I suppose here, that you're ok to re-introduce SAFE_SKIP bit in structured tags
format. Asked in [1] and you don't reply yet.

[1]: https://lore.kernel.org/devicetree-compiler/20261021155923.55e48904@bootlin.com/

Best regards,
Hervé
