Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33783E51CC;
	Mon, 31 Aug 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177698; cv=none; b=C3mre3c25D50g8h3BXPVNPydI8wT3wBIEzrxyQesglgc4if7ULJ186iUkhK2Ro5NlRYiR4ON1LRf722E/FqrFxgWsNILzvmagO956cjkvCtk+BDniY7CobdH8jZlcziZ70laWFpx3RXbXOSidxdaEwDqCF7vy0uM4WqTs2z8uNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177698; c=relaxed/simple;
	bh=UeStCgx93G/Rc9wyKFfNXZQQ9+u6ARkcctm1alR4w4k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tUbWzePe92BtCqeUoXUrNqU9gOQiwm4MIb1ylD0jHH+Qj8G2KE1z8lSAKdgOZqd0gJg0SBHtqHpOCF487vSRlUH+DLpQ0F7vN4zhr+jy5xq+kR9wruBP8pr4HtFsb3/DKqRHknH4TmLNgdLRRtYaZC4x4McscvOWTb2VSYrhGDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FVNfS4Hn; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FVNfS4Hn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C530B1A1903;
	Mon, 31 Aug 2026 12:01:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 961E760231;
	Mon, 31 Aug 2026 12:01:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DBED11C78C5E;
	Mon, 31 Aug 2026 14:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788177687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o7rqoXYl2sTVTebULhbe3smL3G+StGnprS3t+Z32JNA=;
	b=FVNfS4HnG1oFzMSgTBvoV6vQ7uOnsDYScPrytCFg9nqm5tQheqHi0Ys0LWlOimxe4kWBwF
	mOTQK7tTGCwJUz/xCsMp/cnKn7L0huKsvftXLgJMI3U4jFDt/YOVNZePo7V5PSgrb6JtrS
	7TCOD5lO9FVjkrbCTYXtNQa2RPk9AWm4bBpfnfEt4Z5LZwJagJmai++9m4zzimLiycPSL4
	vj/9XV2A897ISrj72H1tSHM6q8xbTHu43kWUIPMMkSXvTaEDeBpqoEEh4Rix75+y0+x+Oo
	+RfabjDF5JKuFumuZtFrL6VOb9tylapTe/HRQ2jDF+O5svmN609NHEcrpicsJA==
Date: Mon, 31 Aug 2026 14:01:19 +0200
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
Message-ID: <20260831140119.1f14b420@bootlin.com>
In-Reply-To: <apOhk-NQusFgV5Sx@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-3-herve.codina@bootlin.com>
	<apOhk-NQusFgV5Sx@gractus.seuss>
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

On Sun, 30 Aug 2026 13:21:06 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > -int fdt_next_node(const void *fdt, int offset, int *depth)
> > +int fdt_root_offset(const void *fdt)
> >  {
> >  	int nextoffset = 0;
> > +	int offset;
> > +	uint32_t tag;
> > +
> > +	do {
> > +		offset = nextoffset;
> > +		tag = fdt_next_tag(fdt, offset, &nextoffset);
> > +		switch (tag) {
> > +		case FDT_END_NODE:
> > +		case FDT_PROP:
> > +			return -FDT_ERR_BADSTRUCTURE;
> > +
> > +		case FDT_BEGIN_NODE:
> > +			return offset;
> > +
> > +		default:
> > +			break;
> > +		}
> > +	} while (tag != FDT_END);
> > +
> > +	return (nextoffset < 0) ? nextoffset : -FDT_ERR_NOTFOUND;  
> 
> This should be BADSTRUCTURE rather than NOTFOUND: a dtb without a root
> node is not validly constructed.  (This could matter quite a lot if
> this error gets propagated up a call chain - a NOTFOUND is usually
> non-fatal, but BADSTRUCTURE means there's basically nothing that can
> usefully be done with the dtb, which the caller needs to know as soon
> as possible).

Now yes, a dtb without a root node is an invalid dtb but soon with addon this
will be allowed [1].

addon dtbs will be clearly identified (the dt_flags header field has
FDT_FLAG_ADDON set for addon dtbs) and so what do you think if the error code
returned depends on this flag.

NOTFOUND in case of addon and BADSTRUCTURE otherwise.

If you are ok with that, I will update this current patch to return BADSTRUCTURE
in all case. Indeed, addon are not yet available.

[1] https://lore.kernel.org/all/20260826094950.1088288-54-herve.codina@bootlin.com/

> 
> > +}
> > +
> > +int fdt_next_node(const void *fdt, int offset, int *depth)
> > +{
> > +	int nextoffset = offset;  
> 
> This initialiser should be omitted, since it is now overwritten in
> every possible case.

Yes indeed, will be updated in the next iteration.

> 
> >  	uint32_t tag;
> >  
> > +	/*
> > +	 * Get the root node if asked for next node from the root node
> > +	 * (offset == 0) or if the given offset is not valid (negative).
> > +	 */
> > +	if (offset <= 0) {
> > +		nextoffset = fdt_root_offset(fdt);
> > +		if (nextoffset < 0)
> > +			return nextoffset;
> > +	}
> > +  
> 
> The various changes you've made look correct, but I don't love the
> fact that it requires nearly every function which takes a node offset
> to be altered non-trivially.  As well as making for a large diff, it
> strikes me as fragile - a bit of logic that could easily be forgotten
> on a new function.
> 
> I think we want to move the offset 0 handling into a common helper.
> Logically that should be fdt_check_node_offset_(), since that's the
> standard way of validating a node offset parameter.  As you've pointed
> out, that doesn't work with the current signature/semantics of
> fdt_check_node_offset_() - but it's a strictly internal function, so
> we can alter its signature freely.

Ok, you insist on this point. I will updade fdt_check_node_offset_() to
handle the offset 0 case.

> 
> >  	if (offset >= 0)
> > -		if ((nextoffset = fdt_check_node_offset_(fdt, offset)) < 0)
> > +		if ((nextoffset = fdt_check_node_offset_(fdt, nextoffset)) < 0)
> >  			return nextoffset;
> >  
> >  	do {
> > diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> > index 11f2e2ee..856c62f1 100644
> > --- a/libfdt/fdt_ro.c
> > +++ b/libfdt/fdt_ro.c
> > @@ -231,6 +231,12 @@ int fdt_subnode_offset_namelen(const void *fdt, int offset,
> >  
> >  	FDT_RO_PROBE(fdt);
> >  
> > +	if (!offset) {
> > +		offset = fdt_root_offset(fdt);
> > +		if (offset < 0)
> > +			return offset;
> > +	}
> > +
> >  	for (depth = 0;
> >  	     (offset >= 0) && (depth >= 0);
> >  	     offset = fdt_next_node(fdt, offset, &depth))
> > @@ -253,13 +259,17 @@ int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
> >  {
> >  	const char *end = path + namelen;
> >  	const char *p = path;
> > -	int offset = 0;
> > +	int offset;
> >  
> >  	FDT_RO_PROBE(fdt);
> >  
> >  	if (!can_assume(VALID_INPUT) && namelen <= 0)
> >  		return -FDT_ERR_BADPATH;
> >  
> > +	offset = fdt_root_offset(fdt);
> > +	if (offset < 0)
> > +		return offset;
> > +
> >  	/* see if we have an alias */
> >  	if (*path != '/') {
> >  		const char *q = memchr(path, '/', end - p);
> > @@ -304,14 +314,24 @@ int fdt_path_offset(const void *fdt, const char *path)
> >  
> >  const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
> >  {
> > -	const struct fdt_node_header *nh = fdt_offset_ptr_(fdt, nodeoffset);
> > +	const struct fdt_node_header *nh;
> >  	const char *nameptr;
> >  	int err;
> >  
> > +	if (!nodeoffset) {
> > +		nodeoffset = fdt_root_offset(fdt);
> > +		if (nodeoffset < 0) {
> > +			err = nodeoffset;
> > +			goto fail;
> > +		}
> > +	}
> > +
> > +
> >  	if (!can_assume(VALID_DTB) && (((err = fdt_ro_probe_(fdt)) < 0)
> >  	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
> >  			goto fail;
> >  
> > +	nh = fdt_offset_ptr_(fdt, nodeoffset);
> >  	nameptr = nh->name;
> >  
> >  	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
> > @@ -344,6 +364,12 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset)
> >  {
> >  	int offset;
> >  
> > +	if (!nodeoffset) {
> > +		nodeoffset = fdt_root_offset(fdt);
> > +		if (nodeoffset < 0)
> > +			return nodeoffset;
> > +	}
> > +
> >  	if ((offset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> >  		return offset;
> >  
> > @@ -581,7 +607,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
> >  	if (buflen < 2)
> >  		return -FDT_ERR_NOSPACE;
> >  
> > -	for (offset = 0, depth = 0;
> > +	for (offset = fdt_root_offset(fdt), depth = 0;
> >  	     (offset >= 0) && (offset <= nodeoffset);
> >  	     offset = fdt_next_node(fdt, offset, &depth)) {
> >  		while (pdepth > depth) {
> > @@ -619,7 +645,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
> >  	else if (offset == -FDT_ERR_BADOFFSET)
> >  		return -FDT_ERR_BADSTRUCTURE;
> >  
> > -	return offset; /* error from fdt_next_node() */
> > +	return offset; /* error from fdt_next_node() or fdt_root_offset() */
> >  }
> >  
> >  int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
> > @@ -627,13 +653,21 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
> >  {
> >  	int offset, depth;
> >  	int supernodeoffset = -FDT_ERR_INTERNAL;
> > +	int root_offset;
> >  
> >  	FDT_RO_PROBE(fdt);
> >  
> >  	if (supernodedepth < 0)
> >  		return -FDT_ERR_NOTFOUND;
> >  
> > -	for (offset = 0, depth = 0;
> > +	root_offset = fdt_root_offset(fdt);
> > +	if (root_offset < 0)
> > +		return root_offset;
> > +
> > +	if (!nodeoffset)
> > +		nodeoffset = root_offset;
> > +
> > +	for (offset = root_offset, depth = 0;  
> 
> Do you need this special casing? Won't the fact you've update
> fdt_next_node() to handle the offset 0 case be enough?

The full loop is the following:
--- 8< ---
	for (offset = root_offset, depth = 0;
	     (offset >= 0) && (offset <= nodeoffset);
	     offset = fdt_next_node(fdt, offset, &depth)) {
		if (depth == supernodedepth)
			supernodeoffset = offset;

		if (offset == nodeoffset) {
			if (nodedepth)
				*nodedepth = depth;

			if (supernodedepth > depth)
				return -FDT_ERR_NOTFOUND;
			else
				return supernodeoffset;
		}
	}
--- 8< ---

The test 'offset == nodeoffset' is the problematic one. nodeoffset
is the parameter passed to the function.

I have chosen to avoid offset 0 for the root node and I have updated 'nodeoffset'
previously if it is 0.

Even if fdt_next_node() updates 'offset' if it is 0, 'nodeoffset' has also to be
update if it is 0. Indeed, 'offset' will be updated from 0 to the real root node
offset. In all case to have the test be correct, 'nodeoffset' should be updated
to the real root node offset if it is 0.

Having fdt_next_node() updating 'offset' if it is 0 will not handle all case.
When offsets comparison is done, both offsets should consider the real offset of
the root node instead of the 0 value.

Also the fdt_supernode_atdepth_offset() can be called with 'nodeoffset' set to the
real root node offset instead of 0. Indeed, fdt_root_offset() is available (and
needed).

My feeling was that it is less error prone to have offset 0 converted to the real
root node offset as soon as possible and then consider only the real offset of the
root node instead of a mix between the real offset and the offset 0.

I think that "for (offset = root_offset, ..." will still be needed.

Best regards,
Hervé
