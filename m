Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166F33DBD65
	for <devicetree-compiler@vger.kernel.org>; Thu, 17 Sep 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634069; cv=none; b=lJsp/V56cmpz6wVfSTRPdhU2fEcnjGIhhbRKnR6YCp27VwJcknoKqnryNmQnpleuJEDNQu/MPYNnivqh3I7aYKxpu1FSstgLkqMmKAKaw/zwIvX6ZfPysAcxW4bwWxHQ3rYdVfu3o38U3vKGrDEzZFJ4lbrjbZKlFt2OvMVddss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634069; c=relaxed/simple;
	bh=9xdQOHMrC9uhfMc8ckvOSGGdzePIuPxpA0uo9Z2vHN4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H0gE8+1hyuCLc+ZYmQcOfrUhVj51y40XzJsO1AdcZ3vJuCpkSPIjECe37y/JLrImreXaHuaAii753UijCyablsTI+eRJb5qWWC5ilk3Xk6daBBXSnOig6dWZAqvK1fLIA2NDNaU9dTwd7tnMm59J4E+ERHJh7FI60jX11frOKaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X8U39yTi; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X8U39yTi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 176B8C63440
	for <devicetree-compiler@vger.kernel.org>; Thu, 17 Sep 2026 08:35:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA3595FAA3;
	Thu, 17 Sep 2026 08:34:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D68511C7B04E;
	Thu, 17 Sep 2026 10:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789634057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L0owqmi7IVcEhA98QzwpI2+SlrrkXradIt1XMcgaUVQ=;
	b=X8U39yTiIZOPkwt2+zNDXgnKIpL1UD6p+ZZydGUaYHFj7U1J3IaWZfFnmBKEK90BN5s9xO
	OcgqpHZjE+xJuAg9DG10Qwu+haa223Nh6qZtAdAgp9gkTwMdyeJaqp2bQQZ+LE622pDkwi
	Aso0epCQ6E5/bQJyNJ3VHocNSaVWxtgrgut1DNtllplJBy6RIBIElqv7kH9jqs/JCwyADn
	aGshNgr54PmgERCL5j5DXz/iyhpXUw/AuWCNCYBAKB3ICDQgvSVUQKFfuKnxDpM8X/GTPI
	DMCnzTLBrwnfyL0RPPH7vT+exiUuh26d0NjXI+IluhdmZIhjT0vTkeBtm+DSzA==
Date: Thu, 17 Sep 2026 10:34:10 +0200
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
Subject: Re: [PATCH v3 09/15] libfdt: Handle unknown tags in fdt_next_tag()
Message-ID: <20260917103410.1fcfe0f1@bootlin.com>
In-Reply-To: <aqpc9HZ2T74Q2lYs@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-10-herve.codina@bootlin.com>
	<aqpc9HZ2T74Q2lYs@gractus.seuss>
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

On Wed, 16 Sep 2026 19:10:27 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:40AM +0200, Herve Codina wrote:
> > The structured tag value definition introduced recently gives the
> > ability to ignore unknown tags without any error when they are read.
> > 
> > libfdt uses fdt_next_tag() to get a tag.
> > 
> > Filtering out tags that should be ignored in fdt_next_tag() allows to
> > have the filtering done globally and allows, in future releases, to have
> > a central place to add new known tags that should not be filtered out.
> > 
> > An already known tag exists with the meaning of "just ignore". This tag
> > is FDT_NOP. fdt_next_tag() callers already handle the FDT_NOP tag.
> > 
> > Avoid unneeded modification at callers side and use a fake FDT_NOP tag
> > when an unknown tag that should be ignored is encountered.
> > 
> > Add also fdt_next_tag_() internal function for callers who need to know
> > if the FDT_NOP tag returned is a real FDT_NOP or a fake FDT_NOP due to
> > an unknown tag.  
> 
> I'm a bit unsure about this one.  If we were designing the libfdt
> interface from scratch, I'd definitely say that fdt_next_tag() - as a
> low level function - should return every tag, and it's up to the
> caller to skip unknown ones.  fdt_next_tag() already provides
> nextoffset making it fairly easy to do so.
> 
> But, of course, we're not building from scratch so we do need to
> consider backwards compatibility.  Supplying a skipping and
> non-skipping version as you have here is the obvious approach.
> 
> But I'm not entirely convinced it's the only or best approach.  A user
> which calls fdt_next_tag() is, in a sense, already opting in to
> low-level handling of the dtb.  They could well already be broken by
> new tags (depending on how they handle the default case).  Arguably
> it's reasonable to require them to be updated (once only) for this new
> family of tags.

I can go in that way. We will have same kind of sequence in almost all
callers.

   do {
      tag = fdt_next_tag()
   } while (!fdt_tag_is_unknown(tag));


We have to care about those "unknown_and_skippable" tags only when
we modify a dtb. This is handled by a few functions.

The vast majority of callers of fdt_next_tag() just want to skip
unknown tags.

> 
> Another potential approach would be to actually use the symbol
> versioning we have, but have som far only minimally exploited.  The
> LIBFDT_1.2 version of fdt_next_tag() would skip tags that postdate it,
> but we'd introduce a new version tag and the new default version of
> fdt_next_tag() would return all tags.  That would of course require
> figuring out how to do that with the verison script.

Hum, I really don't want to have versioning in loop for fdt_next_tag().

Also, this could work in the dynamic lib (.so) case but not for static
link and even less for libfdt code copy compiled in bootloaders or Linux
kernel code.

fdt_next_tag() is a low level function accessible out of libfdt (API).
If it doesn't skip unknown tags even for other libfdt internal function it
will be a too lower function. Ok, we can have a wrapper on top of
fdt_next_tag() to skip unknown tags.

fdt_next_tag() is a low level function but the rule related to skipping
unknown tags is also a low level rule.

We have to choose:
a) fdt_next_tag() as I proposed
   Of course ok for me

b) fdt_next_tag() returns all tags -> Full handling at caller side
   Ok, we can go in that direction but it will bring quite a lot of
   code duplication. I am not fully convinced by this option.

c) lib version
   I disagree on my side

d) Other idea
   Of course, I am still open.

> 
> 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  libfdt/fdt.c             | 75 ++++++++++++++++++++++++++++++++++++++--
> >  libfdt/libfdt_internal.h |  3 ++
> >  tests/run_tests.sh       |  9 +++--
> >  3 files changed, 83 insertions(+), 4 deletions(-)
> > 
> > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > index eb803e8a..506e0dd3 100644
> > --- a/libfdt/fdt.c
> > +++ b/libfdt/fdt.c
> > @@ -167,7 +167,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
> >  	return fdt_offset_ptr_(fdt, offset);
> >  }
> >  
> > -uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> > +static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffset)
> >  {
> >  	const fdt32_t *tagp, *lenp;
> >  	uint32_t tag, len, sum;
> > @@ -218,7 +218,37 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> >  		break;
> >  
> >  	default:
> > -		return FDT_END;
> > +		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
> > +			return FDT_END;
> > +
> > +		switch (tag & FDT_TAG_DATA_MASK) {
> > +		case FDT_TAG_DATA_NONE:
> > +			break;
> > +		case FDT_TAG_DATA_1CELL:
> > +			offset += FDT_CELLSIZE;
> > +			break;
> > +		case FDT_TAG_DATA_2CELLS:
> > +			offset += 2 * FDT_CELLSIZE;
> > +			break;
> > +		case FDT_TAG_DATA_VARLEN:
> > +			/* Get the length */
> > +			lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
> > +			if (!can_assume(VALID_DTB) && !lenp)
> > +				return FDT_END; /* premature end */
> > +			len = fdt32_to_cpu(*lenp);
> > +			/*
> > +			 * Skip the cell encoding the length and the
> > +			 * following length bytes
> > +			 */
> > +			len += sizeof(*lenp);
> > +			sum = len + offset;
> > +			if (!can_assume(VALID_DTB) &&
> > +			    (sum >= INT_MAX || sum < (uint32_t) offset))
> > +				return FDT_END; /* premature end */
> > +
> > +			offset += len;
> > +			break;
> > +		}
> >  	}
> >  
> >  	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> > @@ -228,6 +258,47 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
> >  	return tag;
> >  }
> >  
> > +static bool fdt_tag_is_unknown(uint32_t tag)  
> 
> Regardless of what approach we decide to take, "unknown" is a
> misleading term here.  As we add support for new metadata tags to
> libfdt, they will no longer be unknown to libfdt.  But what matters

Yes, metadata tags once supported in libfdt will not be considered as "unknown"
tags.

An unknow tag is a tag libfdt don't know about except:
- weither it can be skip or not,
- the data length related to this tag.
- Is relation ship with other objects:
   - Global to the whole dtb if found out of any nodes
   - Related to a node if found right after FDT_BEGIN_NODE
   - Related to a poperty if found right after FDT_PROP

> for the interface compatibility is whether they're unknown to the
> caller, which we can't know.  So really this is checking for

If a caller need to handle this unknown tag, it has to use a libfdt which
support this tag.

> structured tags specifically.
> 
> > +{
> > +	switch (tag) {
> > +	case FDT_BEGIN_NODE:
> > +	case FDT_END_NODE:
> > +	case FDT_PROP:
> > +	case FDT_NOP:
> > +	case FDT_END:

This list will grow as soon as new tags are defined and supported in libfdt.

See all tags added by the addon series:
https://github.com/bootlin/dtc/blob/c68038e0ff4cde5de37a21419df8a082032ef994/libfdt/fdt.c#L435

> > +		return false;
> > +	default:
> > +		break;
> > +	}
> > +	return true;
> > +}
> > +
> > +uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset, bool *is_unknown)  
> 
> 
> Nothing in this patch uses the is_unknown parameter.  Presumably
> something later does, but it's not clear to me what it's useful for.

Yes later in [PATCH v3 14/15] libfdt: Handle unknown tags on dtb modifications
In this patch, libfdt/fdt_rw.c, fdt_prop_remove_unknown_tags().
Code also in git repo [0].

[0] https://github.com/bootlin/dtc/blob/2653bb9cd4414780c863051467b5e77eea6e5bdd/libfdt/fdt_rw.c#L211

Best regards,
Hervé
