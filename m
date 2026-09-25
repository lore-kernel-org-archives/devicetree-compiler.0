Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639B41CB31;
	Fri, 25 Sep 2026 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340020; cv=none; b=DzIvPZmiRX4b9nr2w/OqUBBki3jC7cUVR0ZmT39Ta7x9KSMJom2f2VqDfmolZJ3gJlmNw3MbE7ff2YKenwQRp6YmnBvFLSRHCu6u9jfefx/qO6ZK4H8elHtOhFzXukCAGRudt1Xhm/spK/0pH48ps11BfFEsx2uiSU95lo9FJyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340020; c=relaxed/simple;
	bh=t5TgdFp9JDZClhDnQvACZ0OjWdO7aaMGNvF4oE0OZ04=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nvDbd+zbtrRT8w54+ciZdwji7metEMxoxqWQkek/PM5g87nBy4Hc34DC2MHOnZX0+wN5pW8F17N4TIPfMIivptBJLO45HDGiV7nCBwWJRluygFNEFHj+JWfqKqT/oH1pkTzZvzlbpI1XXXvab0F5FG9tPbuM0czMDhMtExBQ3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hx+5LL7y; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hx+5LL7y"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DC0B4E41072;
	Fri, 25 Sep 2026 12:40:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28BC06073B;
	Fri, 25 Sep 2026 12:40:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B9D710328315;
	Fri, 25 Sep 2026 14:40:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790340012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3TWz9gl3JLtVFYqm9nsB58GTbreELFhICXRV8Ta5Ues=;
	b=hx+5LL7yy18/GBwko5aTJI11rgKLBH0xPOwGvcxNsPn0exP8+PN0b4h5/YNvQRyTJmn40I
	/n+uqJO3gvGycXqrZv9ht4MvcITLwvSik1TAnyUOU7nmtR7HHL0T1it34+9Hci7mcXMt/h
	i6jzkQB3HMKoEUgikl7r4t+7U3+Pjrjx8ApFH/O1WNUOBvOhPyMc7BgSuNUdxJaUmFux53
	2vNtR36zzGt4Q5a+1n9qFxqe2eHczWrftkpkrr+Lofweq2xF40Y7E4DrgoU+UvYoG9ZpVg
	XgV9gBNftddqWgd+lHRrCOQbf9ZWXtjzAdaxZdGb/hfbaP4Z9x+u4fID5Knk8w==
Date: Fri, 25 Sep 2026 14:40:03 +0200
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
Subject: Re: [PATCH v3 14/15] libfdt: Handle unknown tags on dtb
 modifications
Message-ID: <20260925144003.61f72c0e@bootlin.com>
In-Reply-To: <arDJSBEh9Duus0kz@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-15-herve.codina@bootlin.com>
	<arDJSBEh9Duus0kz@gractus.seuss>
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

On Mon, 21 Sep 2026 16:06:13 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 10:31:45AM +0200, Herve Codina wrote:
> > The structured tag value definition introduced recently gives the
> > ability to ignore unknown tags without any error.
> > 
> > When the dtb is modified those unknown tags have to be taken into
> > account.
> > 
> > First, depending on the unknown tag location, the item associated with
> > the tag is identified:
> >   - An unknown tag located just after a FDT_BEGIN_NODE is related to the
> >     node.
> > 
> >   - An unknown tag located just after a FDT_PROP is related to the
> >     property.
> > 
> >   - An unknown tag out of any node (i.e located before the first
> >     FDT_BEGIN_NODE or after the last FDT_END_NODE) is a global tag
> >     related to the dtb itself.  
> 
> Since we rely on those constraings here, it seems like those should
> probably be written into the structured tag specs / description.
> Which to my mind strengthens the case for explicitly calling them
> "metadata tags".

Yes this need to be documented somewhere but where?
In the end it should be present in the Devicetree Specification.

Related to the term "metadata" I am not sure that all future tags will be
"metadata" tags. Especially global tags (out of any nodes). At this point
we have "skippable" tags without any more knowledge.

But anyway, I will use the term "metadata".

> 
> > Then, if we are allowed to write a dtb containing unknown tags, the
> > following rules are used:
> >   - When a property is modified, tags related to this property are
> >     removed and the dtb version is downgraded.  
> 
> Hmm.  This seems weird to me, but maybe that's because we haven't
> pinned down in specs / docs what the interaction is between new
> skippable tags and the overall version.
> 
> My assumption had been that tags - even structured tags - newer than
> vNNN must not appear in a dtb with version == NNN (but they can appear
> in a dtb with last_compat_version < NNN).
> 
> With that model, this seems kind of backwards - downgrading the
> version would require removing newer tags throughout the tree, rather
> than removing some tags causing the version to be downgraded.


The discussion which led to this mechanism is available at [1].

If all tags are removed, there is no way to forward a dtb with unknown tags
from a bootloader point of view (support for Vnnn in bootloader) to a Linux
Kernel having support for newer dtb version.

[1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com/


> 
> >   - When a property is removed, tags related to this property are
> >     obviously removed. The dtb version is kept unchanged.
> > 
> >   - When a property or a node is added, obviously no unknown tags are
> >     added and the dtb version is kept unchanged.  
> 
> This seems weird to me in combination with the behaviour on
> modification.  The previous one makes more sense to me in the context
> of an alternative model: newer versions might *require* certain
> metadata tags are present.  But in that case this part doesn't work.

Suppose a tag defined at Vnnn. An older libfdt can add a property to a node
but cannot add the tag defined at Vnnn. Indeed this tag is unknown.

At a given version, libfdt cannot add unknown tags and so as unknown tags
are not involved when a property is added, there is no need to dowgrade the
version.

> 
> >   - When a node is removed, tags related to this node are obviously
> >     removed. The dtb version is kept unchanged.
> > 
> >   - Adding, removing or modifying a property is not considered as a node
> >     modification and so, those operations have no impacts on unknown
> >     tags related to the node. Those node related tags are kept unchanged.  
> 
> That.. certainly constrains what it's possible to put in skippable
> tags, in a way that we'd have to document, though it's not especially
> easy to do so.

Yes, and that's why the FDT_BEGIN_NODE_REF tag defined by the support for addon
cannot be skipped. If this tag is skipped by older libfdt weird behavior will
happen. The old libfdt will think that the root node is a subnode of an orphan
node.

top level dtb:
  FDT_BEGIN_NODE_REF <--- Skip by old libfdt
    FDT_BEGIN_NODE <---- Root node identified by old libfdt

To avoid that FDT_BEGIN_NODE_REF cannot be skipped and so old libfdt will
report an error: Unknown tag which cannot be skipped.

> 
> >   - The only modification considered as a node modification is setting
> >     its name. We consider that this operation has no impact on tags
> >     related to the node. Here also, those node related tags and the
> >     dtb version are kept unchanged.
> > 
> >   - Global (dtb related) unknown tags are kept unchanged regardless the
> >     modification done.
> > 
> > Implement those rules when a dtb is modified.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  libfdt/fdt_rw.c                               | 129 +++++++++++++++++-
> >  libfdt/fdt_wip.c                              |  28 +++-
> >  libfdt/libfdt_internal.h                      |   3 +
> >  tests/run_tests.sh                            |  78 +++++++++++
> >  ...own_tags_can_skip.fdtput.test.dtb.0.expect |  31 +++++
> >  ...own_tags_can_skip.fdtput.test.dtb.1.expect |  35 +++++
> >  ...own_tags_can_skip.fdtput.test.dtb.2.expect |  33 +++++
> >  ...own_tags_can_skip.fdtput.test.dtb.3.expect |  35 +++++
> >  ...own_tags_can_skip.fdtput.test.dtb.4.expect |  34 +++++
> >  ...own_tags_can_skip.fdtput.test.dtb.5.expect |  32 +++++
> >  ...own_tags_can_skip.fdtput.test.dtb.6.expect |  27 ++++
> >  ...nknown_tags_can_skip.wip.test.dtb.0.expect |  31 +++++
> >  ...nknown_tags_can_skip.wip.test.dtb.1.expect |  35 +++++
> >  ...nknown_tags_can_skip.wip.test.dtb.2.expect |  37 +++++
> >  ...nknown_tags_can_skip.wip.test.dtb.3.expect |  38 ++++++
> >  15 files changed, 603 insertions(+), 3 deletions(-)
> >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
> >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
> >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
> >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
> >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
> >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
> >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.0.expect
> >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.1.expect
> >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.2.expect
> >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.3.expect
> > 
> > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > index ceef49b8..87776609 100644
> > --- a/libfdt/fdt_rw.c
> > +++ b/libfdt/fdt_rw.c
> > @@ -197,10 +197,69 @@ int fdt_del_mem_rsv(void *fdt, int n)
> >  	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
> >  }
> >  
> > +static void fdt_nopify_area(void *fdt, int start_offset, int next_offset)  
> 
> This should be written in terms of fdt_nop_region_() from fdt_wip.c
> (or else the other way around).  It should also probably live in
> fdt_wip.c.
> 
> > +{
> > +	int count = (next_offset - start_offset) / sizeof(fdt32_t);
> > +	fdt32_t fdt32_nop = cpu_to_fdt32(FDT_NOP);
> > +	fdt32_t *ptr;
> > +
> > +	ptr = fdt_offset_ptr_w_(fdt, start_offset);
> > +	while (count--)
> > +		*(ptr++) = fdt32_nop;
> > +};
> > +
> > +int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
> > +				 int prop_offset, bool downgrade_version)
> > +{
> > +	int nextoffset, offset;
> > +	bool is_unknown;
> > +	uint32_t tag;
> > +
> > +	/*
> > +	 * Only inplace using nopify is supported even if we could use an other
> > +	 * method involving splices if force_inplace is set to false.  
> 
> This comment is fairly hard to understand without reading a lot of the
> rest of the patch first.  It's also really not ideal - when we're in
> the fdt_rw context, we want to be able to really truly remove the
> stale tags, not just NOP them.

Well nopifying them is not optimized in the fdt_rw context but it is not
incorrect.

Well if nopifying them in the fdt_rw context is a no go, I will add more
complexity in the next iteration to really remove them instead of just
nopifying them. Let me know what do you prefer.

> 
> 
> 
> 
> > +	 */
> > +
> > +	tag = fdt_next_tag(fdt, prop_offset, &nextoffset);
> > +	if (tag == FDT_END)
> > +		return nextoffset;
> > +  
> 
> Should this error out if tag != FDT_PROP?

prop_offset points to a FDT_PROP. Already ckecked.

The check here is done to be sure that nextoffset if set to the next offset
and not to a error code. Indeed, we use nextoffset as the next offset in the
following loop. 

> 
> > +	/*
> > +	 * Look at all tags related to the current property. I.e. tags after the
> > +	 * current property and before either the next property, a sub-node  or
> > +	 * the end of current node
> > +	 */
> > +	do {
> > +		offset = nextoffset;
> > +		tag = fdt_next_tag_(fdt, offset, &nextoffset, &is_unknown);
> > +		if (tag == FDT_END)
> > +			return nextoffset;
> > +
> > +		/*
> > +		 * Unknown tags are returned as NOP. Force FDT_NOP to be really
> > +		 * present in the area to remove the unknown tag and its related
> > +		 * data. Also, as a tag is removed, downgrade the dtb version
> > +		 * if asked for.
> > +		 */
> > +		if (tag == FDT_NOP) {  
> 
> It seems to me this would be more natural using fdt_next_tag_all() (or
> whatever it ends up being called) and handling the nopping in the
> 'default' case.

This doesn't work in current implementation. All unknown tags are returned as
FDT_NOP tags. That's fdt_next_tag_() is used. It allows to know if the returned
FDT_NOP tag is a real FDT_NOP or an unknown tag translated to FDT_NOP.

This is the only use case where we really have to handle unknown tags. We need
to remove them and so not skipping them.

Of course, you asked to change the fdt_next_tag() behavior to have it returned
all tags (known and unknown skippable ones) and so this part of code will be
updated accordingly.

> 
> > +			if (is_unknown) {
> > +				if (downgrade_version)
> > +					fdt_downgrade_version(fdt);
> > +				fdt_nopify_area(fdt, offset, nextoffset);
> > +			}
> > +		}
> > +
> > +	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
> > +		 (tag != FDT_END_NODE));
> > +
> > +	return 0;
> > +}
> > +
> >  static int fdt_resize_property_(void *fdt, int nodeoffset,
> >  				const char *name, int namelen,
> >  				int len, struct fdt_property **prop)
> >  {
> > +	int prop_offset;
> >  	int oldlen;
> >  	int err;
> >  
> > @@ -209,6 +268,15 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
> >  	if (!*prop)
> >  		return oldlen;
> >  
> > +	/*
> > +	 * The property is resized. Remove possible unknown tags related to the
> > +	 * property downgrading the dtb version.
> > +	 */
> > +	prop_offset = fdt_ptr_offset_(fdt, *prop);
> > +	err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset, true);
> > +	if (err)
> > +		return err;
> > +
> >  	if ((err = fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
> >  				      FDT_TAGALIGN(len))))
> >  		return err;
> > @@ -217,6 +285,29 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
> >  	return 0;
> >  }
> >  
> > +static int fdt_node_skip_unknown_tags(void *fdt, int next)  
> 
> Is 'next' the offset of a node?  If so it should probably have a more
> suggestive name.

No, next is the offset of the first tag available after a FDT_BEGIN_NODE.

Should I rename to 'node_next' ?

> 
> > +{
> > +	int nextoffset = next;
> > +	int offset;
> > +	uint32_t tag;
> > +
> > +	/*
> > +	 * Skip all tags related to the current node. I.e. tags after the
> > +	 * current node and before either the next property, a sub-node or the
> > +	 * end of current node.
> > +	 */
> > +	do {
> > +		offset = nextoffset;
> > +		tag = fdt_next_tag(fdt, offset, &nextoffset);
> > +		if (tag == FDT_END)
> > +			return nextoffset;
> > +
> > +	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
> > +		 (tag != FDT_END_NODE));
> > +
> > +	return offset;
> > +}
> > +
> >  static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
> >  			     int namelen, int len, struct fdt_property **prop)
> >  {
> > @@ -235,6 +326,15 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
> >  	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> >  		return nextoffset;
> >  
> > +	/*
> > +	 * nextoffset it at the first tag after the node.
> > +	 * Skip possible unknown tags related to the node in order to add the
> > +	 * property after those tags.
> > +	 */
> > +	nextoffset = fdt_node_skip_unknown_tags(fdt, nextoffset);
> > +	if (nextoffset < 0)
> > +		return nextoffset;
> > +
> >  	namestroff = fdt_find_add_string_(fdt, name, namelen, &allocated);
> >  	if (namestroff < 0)
> >  		return namestroff;
> > @@ -333,11 +433,22 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
> >  {
> >  	struct fdt_property *prop;
> >  	int err, oldlen, newlen;
> > +	int prop_offset;
> >  
> >  	FDT_RW_PROBE(fdt);
> >  
> >  	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
> >  	if (prop) {
> > +		/*
> > +		 * The property is going to be modified. Remove possible unknown
> > +		 * tags related to this property downgrading the dtb version.
> > +		 */
> > +		prop_offset = fdt_ptr_offset_(fdt, prop);
> > +		err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset,
> > +						   true);
> > +		if (err)
> > +			return err;  
> 
> Just NOPing the unknown tags isn't ideal here.  This function can
> already insert/remove stuff from the structure block, so removing the
> tags entirely would be preferable.

I can add the complexity needed to fully remove those tags.
IHMO it could be added later as an optimisation.

> 
> >  		newlen = len + oldlen;
> >  		err = fdt_splice_struct_(fdt, prop->data,
> >  					 FDT_TAGALIGN(oldlen),  
> 
> > @@ -360,6 +471,8 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
> >  {
> >  	struct fdt_property *prop;
> >  	int len, proplen;
> > +	int prop_offset;
> > +	int err;
> >  
> >  	FDT_RW_PROBE(fdt);
> >  
> > @@ -367,6 +480,15 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
> >  	if (!prop)
> >  		return len;
> >  
> > +	/*
> > +	 * The property is going to be removed. Remove also possible unknown
> > +	 * tags related to this property. Keep the dtb version unchanged.
> > +	 */
> > +	prop_offset = fdt_ptr_offset_(fdt, prop);
> > +	err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset, false);
> > +	if (err)
> > +		return err;  
> 
> Here, only NOPing the tags is worse, since delprop is expected to
> entirely remove the property without leaving NOPs.
> 
> Also.. just NOPing unknown tags isn't correct either.  The property is
> being removed, so *all* the associated skippable tags should be
> removed as well (ideally with a single fdt_splice_struct_()).

Skippable tags are remove. They don't exist anymore in the resulting DT.

You have FDT_NOP tags. No issue with that.

It is not optimized but it is correct.

Here again, I can fully remove them.

> 
> > +
> >  	proplen = sizeof(*prop) + FDT_TAGALIGN(len);
> >  	return fdt_splice_struct_(fdt, prop, proplen, 0);
> >  }
> > @@ -395,7 +517,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> >  	else if (offset != -FDT_ERR_NOTFOUND)
> >  		return offset;
> >  
> > -	/* Try to place the new node after the parent's properties */
> > +	/*
> > +	 * Try to place the new node after the parent's properties and unknown
> > +	 * tags related to those properties.
> > +	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
> > +	 * Skipping FDT_NOP tags will correctly skip unknown tags.  
> 
> True, but I think it would be clearer and more robust to explicitly
> look for an FDT_BEGIN_NODE or FDT_END_NODE tag instead.

Ok, will have look in that direction.

> 
> > +	 */
> >  	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
> >  	/* the fdt_subnode_offset_namelen() should ensure this never hits */
> >  	if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
> > diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> > index c2d7566a..7ca3ffbc 100644
> > --- a/libfdt/fdt_wip.c
> > +++ b/libfdt/fdt_wip.c
> > @@ -15,17 +15,30 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
> >  					uint32_t idx, const void *val,
> >  					int len)
> >  {
> > +	int prop_offset;
> >  	void *propval;
> >  	int proplen;
> > +	int err;
> >  
> > -	propval = fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
> > -					&proplen);
> > +	prop_offset = fdt_getprop_offset_namelen(fdt, nodeoffset, name, namelen);
> > +	if (prop_offset < 0)
> > +		return prop_offset;
> > +
> > +	propval = fdt_getprop_by_offset_w(fdt, prop_offset, NULL, &proplen);
> >  	if (!propval)
> >  		return proplen;
> >  
> >  	if ((unsigned)proplen < (len + idx))
> >  		return -FDT_ERR_NOSPACE;
> >  
> > +	/*
> > +	 * Remove unknown tags related to the property downgrading the dtb
> > +	 * version.
> > +	 */
> > +	err = fdt_prop_remove_unknown_tags(fdt, true, prop_offset, true);  
> 
> Functions in fdt_wip.c should not depend on functions in fdw_rw.c.
> Part of the reason for organising things this way is so that a client
> only uses write-in-place functions, the linker will omit the more
> complex full read-write code (even if an old or limited linker that
> doesn't do e.g. function sections).  fdt_rw.c by contrast _is_
> permitted to rely on fdt_wip.c

Makes sense.

I will take this relationship into account in the next iteration.

> 
> > +	if (err)
> > +		return err;
> > +
> >  	memcpy((char *)propval + idx, val, len);
> >  	return 0;
> >  }
> > @@ -59,12 +72,23 @@ static void fdt_nop_region_(void *start, int len)
> >  int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
> >  {
> >  	struct fdt_property *prop;
> > +	int prop_offset;
> >  	int len;
> > +	int err;
> >  
> >  	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
> >  	if (!prop)
> >  		return len;
> >  
> > +	/*
> > +	 * The property is going to be removed (nopified). Remove unknown tags
> > +	 * related to this property. Keep the dtb version unchanged.
> > +	 */
> > +	prop_offset = fdt_ptr_offset_(fdt, prop);
> > +	err = fdt_prop_remove_unknown_tags(fdt, true, prop_offset, false);
> > +	if (err)
> > +		return err;  
> 
> Similar to fdt_delprop() this needs to NOP *all* the properties
> associated with the property we're killing, not just the unknown ones
> (again, ideally with a single fdt_nop_region_()).

I don't follow you.

Only unknown tags need to be removed for the moment.
What other tags do you want to remove?


> 
> >  	fdt_nop_region_(prop, len + sizeof(*prop));
> >  
> >  	return 0;
> > diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> > index e3923629..ce128fda 100644
> > --- a/libfdt/libfdt_internal.h
> > +++ b/libfdt/libfdt_internal.h
> > @@ -26,6 +26,9 @@ uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
> >  int fdt_check_node_offset_(const void *fdt, int offset);
> >  int fdt_check_prop_offset_(const void *fdt, int offset);
> >  
> > +int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
> > +				 int prop_offset, bool downgrade_version);
> > +
> >  int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
> >  			       const char *name, int namelen);
> >  static inline int fdt_getprop_offset(const void *fdt, int nodeoffset,
> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > index 419a24d8..980ed6a0 100755
> > --- a/tests/run_tests.sh
> > +++ b/tests/run_tests.sh
> > @@ -586,6 +586,34 @@ libfdt_tests () {
> >  		unknown_tags_no_skip.dtb; do
> >  	run_test check_full -n $bad
> >      done
> > +
> > +    # Check inplace modification with "unknown" tags that can be skipped
> > +    dtb=unknown_tags_can_skip.wip.test.dtb
> > +    cp unknown_tags_can_skip.dtb $dtb
> > +    base_run_test wrap_fdtdump $dtb $dtb.0.out
> > +    # Remove unneeded header fields (keep those related to versions)
> > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> > +    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"  
> 
> As noted earlier in the series, tests of binary-level behaviour
> shouldn't depend on specific source formatting.  The use of wip_func
> to essentially do some of the test steps in shell seems clumsy to me -
> I think this would be nicer as explicit tests written in C which
> directly look at the binary dtb contents.

I don't like that.

We need to check all the output dtb to be sure that everything is correct and
avoid missing something.

Here with unknown tag handling and with future metadata tags, we have to observe
those tags in the binary blob.

If fdtdump is an issue, I will write fdtanalyze which dump a dtb blob in an other
human readable format. We need to see all tags, and they raw data values an hex.

When I wrote the code, I did some mistake and using only binary files is really
not easy to debug stuff. When a given test is broken by some modification, we need
to have an easy way to see the root cause.

> 
> > +    run_test wip_func $dtb set_prop / prop-str 0 "vwxy"
> > +    base_run_test wrap_fdtdump $dtb $dtb.1.out
> > +    # Remove unneeded header fields (keep those related to versions)
> > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> > +    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
> > +
> > +    cp unknown_tags_can_skip.dtb $dtb
> > +    run_test wip_func $dtb nop_prop /subnode2 prop-int1
> > +    base_run_test wrap_fdtdump $dtb $dtb.2.out
> > +    # Remove unneeded header fields (keep those related to versions)
> > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
> > +    base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
> > +
> > +    cp unknown_tags_can_skip.dtb $dtb
> > +    run_test wip_func $dtb nop_node /subnode2/subsubnode
> > +    base_run_test wrap_fdtdump $dtb $dtb.3.out
> > +    # Remove unneeded header fields (keep those related to versions)
> > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
> > +    base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
> >  }
> >  
> >  dtc_tests () {
> > @@ -1045,6 +1073,56 @@ fdtput_tests () {
> >      run_wrap_error_test $DTPUT $dtb -d /chosen   non-existent-prop
> >  
> >      # TODO: Add tests for verbose mode?
> > +
> > +    # Modify a dtb containing some "unknown" tags that can be skipped
> > +    dtb=unknown_tags_can_skip.fdtput.test.dtb
> > +    cp unknown_tags_can_skip.dtb $dtb
> > +    base_run_test wrap_fdtdump $dtb $dtb.0.out
> > +    # Remove unneeded header fields (keep those related to versions)
> > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> > +    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
> > +    run_fdtput_test "vwxyz" $dtb / prop-str -ts "vwxyz"
> > +    base_run_test wrap_fdtdump $dtb $dtb.1.out
> > +    # Remove unneeded header fields (keep those related to versions)
> > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> > +    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"  
> 
> Doing these as fdtput tests again seems kind of clumsy, unless the
> point is explicitly to check the fdtput utility's behaviour.  The core
> library functionality should be tested directly without introducing
> extra layers.

Need to check the whole resulting binary skippable tags removed, version
downgrade. We need to check that the whole binary is still correct.

'hexdump $dtb' could be used but having an array of hex value without any
other formatting related to dtb defined format will be ugly.

Here also fdtanalyzer could output hex values with some formating based on
dtb format definition. For instance:
  (0x1-FDT_BEGIN_NODE): "my_node"
    (0x3-FDT_PROP): ...
    (0x3-FDT_PROP): ...
  (0x2-FDT_END_NODE)
  ...
  (0x9-FDT_END)

Maybe offset (absolute and/or based on the beginning of the structure block)
could also be interesting in this kind of dumps.


Best regards,
Hervé
