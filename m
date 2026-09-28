Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCF84DD3A9;
	Mon, 28 Sep 2026 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607295; cv=none; b=atbZbQvL9JZ4hSMLGxBMgm2VX6cyVij3xzf3IX6hme0YPAw1rTqb/tREMtqZ2KSD5jGTkhm2ysCW62lI3uWeDKvDQMzPfhQra1PjPcoiiRwU41cPC1plW0X7i2auWabfFsWL9YF+nMpbRZqzI95WfczU9AbAcLju2lOVamcMMlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607295; c=relaxed/simple;
	bh=6yieF4Vp/vRP7j0R8HdN8tJPRF8llcsolJgbINS0J3c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VkE8cf3w7n2NXDX9Az8jjwPo06QBKeCuprNrHlT+YdFT7kAJD9S68VahaPvbBgbM9yI6eFoVHX26hy3Ax8LOMpcOi0q3TvWWVqgv52doWuhLrzorGrCx38QbQDAZJyLMLzSz7JW1axv+cSD/yGvSa2ZkaiPCVzu+5pxHmMvzHV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cS9pv7MQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cS9pv7MQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D9F2A1A103C;
	Mon, 28 Sep 2026 14:54:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A8C41601BD;
	Mon, 28 Sep 2026 14:54:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C5041032961D;
	Mon, 28 Sep 2026 16:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790607285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HHQt9qxqw7Z1QyqeYSPpWqh1lm0th3dlIjOaJAPq4mc=;
	b=cS9pv7MQI936Fq5U52d0usMfKN4saz8161j9gXnJQVzsVIAWz0wSoaOPLXvBHQzM5XHowl
	gHaIsUkt/Ly2kkkqGzO7ZWnaR56ppj/gW6wg3gykGWLbjy1wQklMMyynrz+SfY/oF6WYP3
	bztM5Q44YyzYfjQuvBW4vwBNg8NFYViaUyzXac/dD4mrAB9O/jILf0zyqF3ycx8o+7cLtm
	fwfGXI5WsDc3jUiVhf48afCn0ZzxcUb4bT52K9CFl5J3b2U4PARqf6PTQtWDxZqRt6VxUF
	BWGmIzqu6HqW6JhMUvCFHOkFTCo01RCj6aLHq46OE77ZyVcFuGCD0aDHhl4X0g==
Date: Mon, 28 Sep 2026 16:54:35 +0200
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
Message-ID: <20260928165435.6249a989@bootlin.com>
In-Reply-To: <arnvWl4PJUG9b8pb@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-15-herve.codina@bootlin.com>
	<arDJSBEh9Duus0kz@gractus.seuss>
	<20260925144003.61f72c0e@bootlin.com>
	<arnvWl4PJUG9b8pb@gractus.seuss>
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

On Mon, 28 Sep 2026 14:39:18 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Sep 25, 2026 at 02:40:03PM +0200, Herve Codina wrote:
> > On Mon, 21 Sep 2026 16:06:13 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Aug 26, 2026 at 10:31:45AM +0200, Herve Codina wrote:  
> > > > The structured tag value definition introduced recently gives the
> > > > ability to ignore unknown tags without any error.
> > > > 
> > > > When the dtb is modified those unknown tags have to be taken into
> > > > account.
> > > > 
> > > > First, depending on the unknown tag location, the item associated with
> > > > the tag is identified:
> > > >   - An unknown tag located just after a FDT_BEGIN_NODE is related to the
> > > >     node.
> > > > 
> > > >   - An unknown tag located just after a FDT_PROP is related to the
> > > >     property.
> > > > 
> > > >   - An unknown tag out of any node (i.e located before the first
> > > >     FDT_BEGIN_NODE or after the last FDT_END_NODE) is a global tag
> > > >     related to the dtb itself.    
> > > 
> > > Since we rely on those constraings here, it seems like those should
> > > probably be written into the structured tag specs / description.
> > > Which to my mind strengthens the case for explicitly calling them
> > > "metadata tags".  
> > 
> > Yes this need to be documented somewhere but where?  
> 
> Yeah, that's a good question.
> 
> > In the end it should be present in the Devicetree Specification.  
> 
> Right, eventually.  But that will take a while, plus it's preferable
> to have the documentation as close as possible to the things you'd be
> looking at when it becomes relevant.
> 
> So, for starters, I think your commit messages should include this
> kind of context and rationale at the point the concepts are introdcued
> to the code.  It also might make sense to have some of this  in
> comments in fdt.h.  We haven't done much of that so far, but providing
> more detail around the bare structure and constant definitions is
> probably worthwhile.
> 
> > Related to the term "metadata" I am not sure that all future tags will be
> > "metadata" tags. Especially global tags (out of any nodes). At this point
> > we have "skippable" tags without any more knowledge.  
> 
> Hm, ok.
> 
> > But anyway, I will use the term "metadata".
> >   
> > >   
> > > > Then, if we are allowed to write a dtb containing unknown tags, the
> > > > following rules are used:
> > > >   - When a property is modified, tags related to this property are
> > > >     removed and the dtb version is downgraded.    
> > > 
> > > Hmm.  This seems weird to me, but maybe that's because we haven't
> > > pinned down in specs / docs what the interaction is between new
> > > skippable tags and the overall version.
> > > 
> > > My assumption had been that tags - even structured tags - newer than
> > > vNNN must not appear in a dtb with version == NNN (but they can appear
> > > in a dtb with last_compat_version < NNN).
> > > 
> > > With that model, this seems kind of backwards - downgrading the
> > > version would require removing newer tags throughout the tree, rather
> > > than removing some tags causing the version to be downgraded.  
> > 
> > 
> > The discussion which led to this mechanism is available at [1].  
> 
> Ah, thanks for the reminder.
> 
> > If all tags are removed, there is no way to forward a dtb with unknown tags
> > from a bootloader point of view (support for Vnnn in bootloader) to a Linux
> > Kernel having support for newer dtb version.  
> 
> I'm guessing that's with the assumption that the bootloader is making
> at least minor changes to the tree?  Certainly a tree with unknown
> tags can be forwarded unmodified.
> 
> > [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk49on8VfkP7CDvw@mail.gmail.com/  
> 
> TBH, I'm finding it pretty hard to follow what Rob's saying there.  It
> does help me understand some things you've said elsewhere.
> 
> > > >   - When a property is removed, tags related to this property are
> > > >     obviously removed. The dtb version is kept unchanged.
> > > > 
> > > >   - When a property or a node is added, obviously no unknown tags are
> > > >     added and the dtb version is kept unchanged.    
> > > 
> > > This seems weird to me in combination with the behaviour on
> > > modification.  The previous one makes more sense to me in the context
> > > of an alternative model: newer versions might *require* certain
> > > metadata tags are present.  But in that case this part doesn't work.  
> > 
> > Suppose a tag defined at Vnnn. An older libfdt can add a property to a node
> > but cannot add the tag defined at Vnnn. Indeed this tag is unknown.
> > 
> > At a given version, libfdt cannot add unknown tags and so as unknown tags
> > are not involved when a property is added, there is no need to dowgrade the
> > version.  
> 
> Only if we assume "skippable" tags are always optional.  Making this
> assumption means we can't, for example, say: from v23, all properties
> _must_ have an FDT_XXX metadata tag.  Constraining future versions
> that way seems undesirable to me, since a number of previous revisions
> exist to say "you can count on this particular information being
> present".  That's been in the form of extra header fields previously,
> but I think the same principle applies.  e.g.  it seems like it would
> be pretty useful to tell an addon aware bootloader "if version >= NNN
> then you can rely on all necessary fixup tags being present.

An old version doesn't add constraints to new version but new version allows
or not possible modification done by old version.

Focusing on property only, all libfdt version need to handle cases where a
unknown skippable tag is present.

A skippable is a tag with bit31 set to 1 and, by definition, has needed
information to skip related data.

An unknown tag is a tag not defined in the current libfdt version. It can be
in a skippable format but the current libfdt version doesn't known about the
exact meaning of the tag nor about the related data.

Also, we know that a skippable tag locate after FDT_PROP is related to the
property. So, even if the current libfdt version cannot determine the exact
meaning of the tag, it can determine that the tag is related to the property.

For the current libfdt version, we have a property and a skippable unknown
tag related to this property. The current version of libfdt wants to modify
the property. What to do with the unknown tag?

Rules are defined to handle this case:
 - First can I perform some modification in this dtb (last_comp_version_w compared
   against my last supported dtb version). If I cannot perform a modification
   I don't do the modification and report an error.
   This prevent old libfdt version (me) to do a modification because I am too old
   and I haven't enough knownledge to perform the modification.

 - Ok, I can do the modification. I apply the following rule known by all libfdt
   version:
     If a property is modify, related unknown tags are removed and the dtb version
     is downgrade.
   I modify the property, remove skippable unknown tags and downgrade the dtb
   version (i.e. set the dtb version to my last supported version).

That's the rule used by all libfdt version when an unknwon tag related to a property
is present. This rule have to be kept in mind when a new skippable tag is defined.

When the tag is defined we need to check if this rule is correct. If the tag cannot
be removed when the property is modified by old libfdt version, the new libfd/dtc
version generating the dtb blob must set the last_comp_version_w to prevent any
modification.


I mentioned only unknown tags for this rule. Indeed, if the tag is known (tag
defined at current libfdt version with a perfect knownledge of related data), the
problem is different. A property is modified and a known tag related to this property
is present. In this case, the way of handling the tag depends on the tag itself.

For instance, in the support for addon series. The FDT_PROPDATA_PHANDLE is added.
This tag identify a phandle at some offset in a property data.
When the property is modified, code in the series chooses to remove the tag only if
modification are done at the offset where the phandle is present. Otherwise, the
tag is still valid and there is no reason to remove it.

Now the question can be: Do we need a finer grain and use a flag per tag in
addition to the global last_comp_version_w field. We can imagine the following
rules for unknown tag:
  - First check last_comp_version_w with non semantic change (global write
    enable/disable).

  - Check the unknown tag value to see if the bit "Allow remove on modification" is
    set. If not set, do not perform the modification and report an error.

  - If we can remove on modification, modify the property, remove the unknown tags
    and downgrade the dtb version

This new "Allow remove on modification" bit, if it makes sense, has to be added in
the skippable tag format (alongside the data lengh encoding bits).


> 
> > > >   - When a node is removed, tags related to this node are obviously
> > > >     removed. The dtb version is kept unchanged.
> > > > 
> > > >   - Adding, removing or modifying a property is not considered as a node
> > > >     modification and so, those operations have no impacts on unknown
> > > >     tags related to the node. Those node related tags are kept unchanged.    
> > > 
> > > That.. certainly constrains what it's possible to put in skippable
> > > tags, in a way that we'd have to document, though it's not especially
> > > easy to do so.  
> > 
> > Yes, and that's why the FDT_BEGIN_NODE_REF tag defined by the support for addon
> > cannot be skipped. If this tag is skipped by older libfdt weird behavior will
> > happen. The old libfdt will think that the root node is a subnode of an orphan
> > node.  
> 
> Sure, it's pretty clear than anything that would alter the tree
> structure can't be skipped.  But the constraints on what needs to be
> dropped on what sorts of modification constrict things substantially
> further.  For example. the fact that property modifications don't
> affect node tags means it wouldn't be possible to have a node tag
> which was, say, "total number of properties in this subtree".  That's

If such a tag is introduced, last_comp_version_w will be also set to avoid
old libfdt version (this tag is an unknown tag for old version) to perform
some modification.

Only version having knownledge about this tag can perform modification, probably
updating the tag data if a property is added or removed.

> a contrived example, obviously, but it's not obvious to me there
> wouldn't be some use for "summary" tags of this nature, that is,
> something which collates information for an entire node or subtree for
> quick reference.
> 
> > top level dtb:
> >   FDT_BEGIN_NODE_REF <--- Skip by old libfdt
> >     FDT_BEGIN_NODE <---- Root node identified by old libfdt
> > 
> > To avoid that FDT_BEGIN_NODE_REF cannot be skipped and so old libfdt will
> > report an error: Unknown tag which cannot be skipped.
> >   
> > >   
> > > >   - The only modification considered as a node modification is setting
> > > >     its name. We consider that this operation has no impact on tags
> > > >     related to the node. Here also, those node related tags and the
> > > >     dtb version are kept unchanged.
> > > > 
> > > >   - Global (dtb related) unknown tags are kept unchanged regardless the
> > > >     modification done.
> > > > 
> > > > Implement those rules when a dtb is modified.
> > > > 
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > > ---
> > > >  libfdt/fdt_rw.c                               | 129 +++++++++++++++++-
> > > >  libfdt/fdt_wip.c                              |  28 +++-
> > > >  libfdt/libfdt_internal.h                      |   3 +
> > > >  tests/run_tests.sh                            |  78 +++++++++++
> > > >  ...own_tags_can_skip.fdtput.test.dtb.0.expect |  31 +++++
> > > >  ...own_tags_can_skip.fdtput.test.dtb.1.expect |  35 +++++
> > > >  ...own_tags_can_skip.fdtput.test.dtb.2.expect |  33 +++++
> > > >  ...own_tags_can_skip.fdtput.test.dtb.3.expect |  35 +++++
> > > >  ...own_tags_can_skip.fdtput.test.dtb.4.expect |  34 +++++
> > > >  ...own_tags_can_skip.fdtput.test.dtb.5.expect |  32 +++++
> > > >  ...own_tags_can_skip.fdtput.test.dtb.6.expect |  27 ++++
> > > >  ...nknown_tags_can_skip.wip.test.dtb.0.expect |  31 +++++
> > > >  ...nknown_tags_can_skip.wip.test.dtb.1.expect |  35 +++++
> > > >  ...nknown_tags_can_skip.wip.test.dtb.2.expect |  37 +++++
> > > >  ...nknown_tags_can_skip.wip.test.dtb.3.expect |  38 ++++++
> > > >  15 files changed, 603 insertions(+), 3 deletions(-)
> > > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.0.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.1.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.2.expect
> > > >  create mode 100644 tests/unknown_tags_can_skip.wip.test.dtb.3.expect
> > > > 
> > > > diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> > > > index ceef49b8..87776609 100644
> > > > --- a/libfdt/fdt_rw.c
> > > > +++ b/libfdt/fdt_rw.c
> > > > @@ -197,10 +197,69 @@ int fdt_del_mem_rsv(void *fdt, int n)
> > > >  	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
> > > >  }
> > > >  
> > > > +static void fdt_nopify_area(void *fdt, int start_offset, int next_offset)    
> > > 
> > > This should be written in terms of fdt_nop_region_() from fdt_wip.c
> > > (or else the other way around).  It should also probably live in
> > > fdt_wip.c.
> > >   
> > > > +{
> > > > +	int count = (next_offset - start_offset) / sizeof(fdt32_t);
> > > > +	fdt32_t fdt32_nop = cpu_to_fdt32(FDT_NOP);
> > > > +	fdt32_t *ptr;
> > > > +
> > > > +	ptr = fdt_offset_ptr_w_(fdt, start_offset);
> > > > +	while (count--)
> > > > +		*(ptr++) = fdt32_nop;
> > > > +};
> > > > +
> > > > +int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
> > > > +				 int prop_offset, bool downgrade_version)
> > > > +{
> > > > +	int nextoffset, offset;
> > > > +	bool is_unknown;
> > > > +	uint32_t tag;
> > > > +
> > > > +	/*
> > > > +	 * Only inplace using nopify is supported even if we could use an other
> > > > +	 * method involving splices if force_inplace is set to false.    
> > > 
> > > This comment is fairly hard to understand without reading a lot of the
> > > rest of the patch first.  It's also really not ideal - when we're in
> > > the fdt_rw context, we want to be able to really truly remove the
> > > stale tags, not just NOP them.  
> > 
> > Well nopifying them is not optimized in the fdt_rw context but it is not
> > incorrect.  
> 
> It breaks the principle of least surprise, though.  Especially since
> we don't have a "strip nops" function (aside: that would be a nice
> addition).
> 
> > Well if nopifying them in the fdt_rw context is a no go, I will add more
> > complexity in the next iteration to really remove them instead of just
> > nopifying them. Let me know what do you prefer.  
> 
> I don't think it's actually that much more complex.  You already have
> to deal with tree splicing in this case.
> 
> > > > +	 */
> > > > +
> > > > +	tag = fdt_next_tag(fdt, prop_offset, &nextoffset);
> > > > +	if (tag == FDT_END)
> > > > +		return nextoffset;
> > > > +    
> > > 
> > > Should this error out if tag != FDT_PROP?  
> > 
> > prop_offset points to a FDT_PROP. Already ckecked.  
> 
> Not in this function, AFAICT.  I assume the callers ensure this, but
> that's not obvious when looking just at this code.  I'd prefer to see
> this checked here (unless can_assume(ASSUME_LIBFDT_FLAWLESS))
> returning FDT_ERR_INTERNAL if it fails.

Ok, I will add a check even if this function is not part of the libfdt API.

> 
> > The check here is done to be sure that nextoffset if set to the next offset
> > and not to a error code. Indeed, we use nextoffset as the next offset in the
> > following loop.  
> 
> Yes, but I get nervous whenever I see a non-exhaustive check on a
> return value.
> 
> > > > +	/*
> > > > +	 * Look at all tags related to the current property. I.e. tags after the
> > > > +	 * current property and before either the next property, a sub-node  or
> > > > +	 * the end of current node
> > > > +	 */
> > > > +	do {
> > > > +		offset = nextoffset;
> > > > +		tag = fdt_next_tag_(fdt, offset, &nextoffset, &is_unknown);
> > > > +		if (tag == FDT_END)
> > > > +			return nextoffset;
> > > > +
> > > > +		/*
> > > > +		 * Unknown tags are returned as NOP. Force FDT_NOP to be really
> > > > +		 * present in the area to remove the unknown tag and its related
> > > > +		 * data. Also, as a tag is removed, downgrade the dtb version
> > > > +		 * if asked for.
> > > > +		 */
> > > > +		if (tag == FDT_NOP) {    
> > > 
> > > It seems to me this would be more natural using fdt_next_tag_all() (or
> > > whatever it ends up being called) and handling the nopping in the
> > > 'default' case.  
> > 
> > This doesn't work in current implementation. All unknown tags are returned as
> > FDT_NOP tags. That's fdt_next_tag_() is used. It allows to know if the returned
> > FDT_NOP tag is a real FDT_NOP or an unknown tag translated to FDT_NOP.
> > 
> > This is the only use case where we really have to handle unknown tags. We need
> > to remove them and so not skipping them.  
> 
> Yes, exactly, that's why I'm saying it would make more sense to use
> the iterator that *doesn't* skip unknown tags (whatever it gets called).
> 
> > Of course, you asked to change the fdt_next_tag() behavior to have it returned
> > all tags (known and unknown skippable ones) and so this part of code will be
> > updated accordingly.  
> 
> Sure.
> 
> > > > +			if (is_unknown) {
> > > > +				if (downgrade_version)
> > > > +					fdt_downgrade_version(fdt);
> > > > +				fdt_nopify_area(fdt, offset, nextoffset);
> > > > +			}
> > > > +		}
> > > > +
> > > > +	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
> > > > +		 (tag != FDT_END_NODE));
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int fdt_resize_property_(void *fdt, int nodeoffset,
> > > >  				const char *name, int namelen,
> > > >  				int len, struct fdt_property **prop)
> > > >  {
> > > > +	int prop_offset;
> > > >  	int oldlen;
> > > >  	int err;
> > > >  
> > > > @@ -209,6 +268,15 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
> > > >  	if (!*prop)
> > > >  		return oldlen;
> > > >  
> > > > +	/*
> > > > +	 * The property is resized. Remove possible unknown tags related to the
> > > > +	 * property downgrading the dtb version.
> > > > +	 */
> > > > +	prop_offset = fdt_ptr_offset_(fdt, *prop);
> > > > +	err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset, true);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >  	if ((err = fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
> > > >  				      FDT_TAGALIGN(len))))
> > > >  		return err;
> > > > @@ -217,6 +285,29 @@ static int fdt_resize_property_(void *fdt, int nodeoffset,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static int fdt_node_skip_unknown_tags(void *fdt, int next)    
> > > 
> > > Is 'next' the offset of a node?  If so it should probably have a more
> > > suggestive name.  
> > 
> > No, next is the offset of the first tag available after a FDT_BEGIN_NODE.  
> 
> Ah, right.
> 
> > Should I rename to 'node_next' ?  
> 
> No, it's ok as is.
> 
> > > > +{
> > > > +	int nextoffset = next;
> > > > +	int offset;
> > > > +	uint32_t tag;
> > > > +
> > > > +	/*
> > > > +	 * Skip all tags related to the current node. I.e. tags after the
> > > > +	 * current node and before either the next property, a sub-node or the
> > > > +	 * end of current node.
> > > > +	 */
> > > > +	do {
> > > > +		offset = nextoffset;
> > > > +		tag = fdt_next_tag(fdt, offset, &nextoffset);
> > > > +		if (tag == FDT_END)
> > > > +			return nextoffset;
> > > > +
> > > > +	} while ((tag != FDT_PROP) && (tag != FDT_BEGIN_NODE) &&
> > > > +		 (tag != FDT_END_NODE));
> > > > +
> > > > +	return offset;
> > > > +}
> > > > +
> > > >  static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
> > > >  			     int namelen, int len, struct fdt_property **prop)
> > > >  {
> > > > @@ -235,6 +326,15 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
> > > >  	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
> > > >  		return nextoffset;
> > > >  
> > > > +	/*
> > > > +	 * nextoffset it at the first tag after the node.
> > > > +	 * Skip possible unknown tags related to the node in order to add the
> > > > +	 * property after those tags.
> > > > +	 */
> > > > +	nextoffset = fdt_node_skip_unknown_tags(fdt, nextoffset);
> > > > +	if (nextoffset < 0)
> > > > +		return nextoffset;
> > > > +
> > > >  	namestroff = fdt_find_add_string_(fdt, name, namelen, &allocated);
> > > >  	if (namestroff < 0)
> > > >  		return namestroff;
> > > > @@ -333,11 +433,22 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
> > > >  {
> > > >  	struct fdt_property *prop;
> > > >  	int err, oldlen, newlen;
> > > > +	int prop_offset;
> > > >  
> > > >  	FDT_RW_PROBE(fdt);
> > > >  
> > > >  	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
> > > >  	if (prop) {
> > > > +		/*
> > > > +		 * The property is going to be modified. Remove possible unknown
> > > > +		 * tags related to this property downgrading the dtb version.
> > > > +		 */
> > > > +		prop_offset = fdt_ptr_offset_(fdt, prop);
> > > > +		err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset,
> > > > +						   true);
> > > > +		if (err)
> > > > +			return err;    
> > > 
> > > Just NOPing the unknown tags isn't ideal here.  This function can
> > > already insert/remove stuff from the structure block, so removing the
> > > tags entirely would be preferable.  
> > 
> > I can add the complexity needed to fully remove those tags.
> > IHMO it could be added later as an optimisation.
> >   
> > >   
> > > >  		newlen = len + oldlen;
> > > >  		err = fdt_splice_struct_(fdt, prop->data,
> > > >  					 FDT_TAGALIGN(oldlen),    
> > >   
> > > > @@ -360,6 +471,8 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
> > > >  {
> > > >  	struct fdt_property *prop;
> > > >  	int len, proplen;
> > > > +	int prop_offset;
> > > > +	int err;
> > > >  
> > > >  	FDT_RW_PROBE(fdt);
> > > >  
> > > > @@ -367,6 +480,15 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
> > > >  	if (!prop)
> > > >  		return len;
> > > >  
> > > > +	/*
> > > > +	 * The property is going to be removed. Remove also possible unknown
> > > > +	 * tags related to this property. Keep the dtb version unchanged.
> > > > +	 */
> > > > +	prop_offset = fdt_ptr_offset_(fdt, prop);
> > > > +	err = fdt_prop_remove_unknown_tags(fdt, false, prop_offset, false);
> > > > +	if (err)
> > > > +		return err;    
> > > 
> > > Here, only NOPing the tags is worse, since delprop is expected to
> > > entirely remove the property without leaving NOPs.
> > > 
> > > Also.. just NOPing unknown tags isn't correct either.  The property is
> > > being removed, so *all* the associated skippable tags should be
> > > removed as well (ideally with a single fdt_splice_struct_()).  
> > 
> > Skippable tags are remove. They don't exist anymore in the resulting DT.  
> 
> No, *unknown* (by this libfdt version) tags are nopped.  Known
> skippable tags are left unaltered.  Presumably they would then apply
> to the previous property, which is definitely wrong.

There is no "known skippable" tags at this libfdt version.

Can you list them on you side?

You cannot. When you compile the library all known tags are defined in fdt.h header
file. In this libfdt version, no new tags were added. No new tags, no new "knwown" tags.

If you look at the addon series where new tags are added, known tags added
are handled to avoid the problem you reports [1].

If later more new tags are added, they have to be handled as soon as they are
added depending of the tag meaning, the handling could be different.

[1] https://github.com/bootlin/dtc/blob/c68038e0ff4cde5de37a21419df8a082032ef994/libfdt/fdt_rw.c#L540

> 
> > You have FDT_NOP tags. No issue with that.
> > 
> > It is not optimized but it is correct.
> > 
> > Here again, I can fully remove them.  
> 
> That would be good, but it's not the issue I'm pointing out above.
> 
> > > > +
> > > >  	proplen = sizeof(*prop) + FDT_TAGALIGN(len);
> > > >  	return fdt_splice_struct_(fdt, prop, proplen, 0);
> > > >  }
> > > > @@ -395,7 +517,12 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
> > > >  	else if (offset != -FDT_ERR_NOTFOUND)
> > > >  		return offset;
> > > >  
> > > > -	/* Try to place the new node after the parent's properties */
> > > > +	/*
> > > > +	 * Try to place the new node after the parent's properties and unknown
> > > > +	 * tags related to those properties.
> > > > +	 * Unknown tags are reported as FDT_NOP tags by fdt_next_tag.
> > > > +	 * Skipping FDT_NOP tags will correctly skip unknown tags.    
> > > 
> > > True, but I think it would be clearer and more robust to explicitly
> > > look for an FDT_BEGIN_NODE or FDT_END_NODE tag instead.  
> > 
> > Ok, will have look in that direction.
> >   
> > >   
> > > > +	 */
> > > >  	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
> > > >  	/* the fdt_subnode_offset_namelen() should ensure this never hits */
> > > >  	if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
> > > > diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> > > > index c2d7566a..7ca3ffbc 100644
> > > > --- a/libfdt/fdt_wip.c
> > > > +++ b/libfdt/fdt_wip.c
> > > > @@ -15,17 +15,30 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
> > > >  					uint32_t idx, const void *val,
> > > >  					int len)
> > > >  {
> > > > +	int prop_offset;
> > > >  	void *propval;
> > > >  	int proplen;
> > > > +	int err;
> > > >  
> > > > -	propval = fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
> > > > -					&proplen);
> > > > +	prop_offset = fdt_getprop_offset_namelen(fdt, nodeoffset, name, namelen);
> > > > +	if (prop_offset < 0)
> > > > +		return prop_offset;
> > > > +
> > > > +	propval = fdt_getprop_by_offset_w(fdt, prop_offset, NULL, &proplen);
> > > >  	if (!propval)
> > > >  		return proplen;
> > > >  
> > > >  	if ((unsigned)proplen < (len + idx))
> > > >  		return -FDT_ERR_NOSPACE;
> > > >  
> > > > +	/*
> > > > +	 * Remove unknown tags related to the property downgrading the dtb
> > > > +	 * version.
> > > > +	 */
> > > > +	err = fdt_prop_remove_unknown_tags(fdt, true, prop_offset, true);    
> > > 
> > > Functions in fdt_wip.c should not depend on functions in fdw_rw.c.
> > > Part of the reason for organising things this way is so that a client
> > > only uses write-in-place functions, the linker will omit the more
> > > complex full read-write code (even if an old or limited linker that
> > > doesn't do e.g. function sections).  fdt_rw.c by contrast _is_
> > > permitted to rely on fdt_wip.c  
> > 
> > Makes sense.
> > 
> > I will take this relationship into account in the next iteration.
> >   
> > >   
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > >  	memcpy((char *)propval + idx, val, len);
> > > >  	return 0;
> > > >  }
> > > > @@ -59,12 +72,23 @@ static void fdt_nop_region_(void *start, int len)
> > > >  int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
> > > >  {
> > > >  	struct fdt_property *prop;
> > > > +	int prop_offset;
> > > >  	int len;
> > > > +	int err;
> > > >  
> > > >  	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
> > > >  	if (!prop)
> > > >  		return len;
> > > >  
> > > > +	/*
> > > > +	 * The property is going to be removed (nopified). Remove unknown tags
> > > > +	 * related to this property. Keep the dtb version unchanged.
> > > > +	 */
> > > > +	prop_offset = fdt_ptr_offset_(fdt, prop);
> > > > +	err = fdt_prop_remove_unknown_tags(fdt, true, prop_offset, false);
> > > > +	if (err)
> > > > +		return err;    
> > > 
> > > Similar to fdt_delprop() this needs to NOP *all* the properties
> > > associated with the property we're killing, not just the unknown ones
> > > (again, ideally with a single fdt_nop_region_()).  
> > 
> > I don't follow you.
> > 
> > Only unknown tags need to be removed for the moment.
> > What other tags do you want to remove?  
> 
> Again, all skippable tags on the property need to be nopped, not just
> unknown ones.  Otherwise they'll stay there and now apply to the
> previous property.

No, only unknown skippable tag for the moment.
There is no "known" skippable tag in this libfdt version.

New skippable tags added in future version are seen as unknown skippable ones
by older version.

At a given version, we need to remove all unknown tags and handle all tags
known at this version.

In this first libfdt version introducing skippable tag, no new tags are added.
and so all skippable tags seen are "unknown" tags at this first libfdt version.

> 
> > > >  	fdt_nop_region_(prop, len + sizeof(*prop));
> > > >  
> > > >  	return 0;
> > > > diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> > > > index e3923629..ce128fda 100644
> > > > --- a/libfdt/libfdt_internal.h
> > > > +++ b/libfdt/libfdt_internal.h
> > > > @@ -26,6 +26,9 @@ uint32_t fdt_next_tag_(const void *fdt, int startoffset, int *nextoffset,
> > > >  int fdt_check_node_offset_(const void *fdt, int offset);
> > > >  int fdt_check_prop_offset_(const void *fdt, int offset);
> > > >  
> > > > +int fdt_prop_remove_unknown_tags(void *fdt, bool force_inplace,
> > > > +				 int prop_offset, bool downgrade_version);
> > > > +
> > > >  int fdt_getprop_offset_namelen(const void *fdt, int nodeoffset,
> > > >  			       const char *name, int namelen);
> > > >  static inline int fdt_getprop_offset(const void *fdt, int nodeoffset,
> > > > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > > > index 419a24d8..980ed6a0 100755
> > > > --- a/tests/run_tests.sh
> > > > +++ b/tests/run_tests.sh
> > > > @@ -586,6 +586,34 @@ libfdt_tests () {
> > > >  		unknown_tags_no_skip.dtb; do
> > > >  	run_test check_full -n $bad
> > > >      done
> > > > +
> > > > +    # Check inplace modification with "unknown" tags that can be skipped
> > > > +    dtb=unknown_tags_can_skip.wip.test.dtb
> > > > +    cp unknown_tags_can_skip.dtb $dtb
> > > > +    base_run_test wrap_fdtdump $dtb $dtb.0.out
> > > > +    # Remove unneeded header fields (keep those related to versions)
> > > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> > > > +    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"    
> > > 
> > > As noted earlier in the series, tests of binary-level behaviour
> > > shouldn't depend on specific source formatting.  The use of wip_func
> > > to essentially do some of the test steps in shell seems clumsy to me -
> > > I think this would be nicer as explicit tests written in C which
> > > directly look at the binary dtb contents.  
> > 
> > I don't like that.
> > 
> > We need to check all the output dtb to be sure that everything is correct and
> > avoid missing something.  
> 
> Yes.. a C program can do that...
> 
> > Here with unknown tag handling and with future metadata tags, we have to observe
> > those tags in the binary blob.  
> 
> Certainly.
> 
> > If fdtdump is an issue, I will write fdtanalyze which dump a dtb blob in an other
> > human readable format. We need to see all tags, and they raw data values an hex.  
> 
> fdtdump is an issue - it's a sometimes-useful hack, not a tool to be
> relied on.  What would probably make more sense here is a
> 'dtbs_equal_with_tags' or something, that performs a stricter
> comparison that the existing dtbs_equal_ordered.

dtbs_equal_with_tags will compare a binary against a binary.
Also, looking at the dtbs_equal_ordered(), libfdt function are used to get
informations. fdt_next_tag() is used.

I don't want to rely on libfdt to check that the binary blob is correct. I use libfdt
to modify the binary blob, using also libfdt to check it can hide issues.

What I would like is a tool to transform the binary to something more human friendly
without any use of libfdt functions and perform a diff between an expected file I can
check myself (human friendly format) and a dtb generated by the test sequence and just
converted to the human friendly format.

What do you think is wrong with this approach?

> 
> > When I wrote the code, I did some mistake and using only binary files is really
> > not easy to debug stuff. When a given test is broken by some modification, we need
> > to have an easy way to see the root cause.
> >   
> > >   
> > > > +    run_test wip_func $dtb set_prop / prop-str 0 "vwxy"
> > > > +    base_run_test wrap_fdtdump $dtb $dtb.1.out
> > > > +    # Remove unneeded header fields (keep those related to versions)
> > > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> > > > +    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
> > > > +
> > > > +    cp unknown_tags_can_skip.dtb $dtb
> > > > +    run_test wip_func $dtb nop_prop /subnode2 prop-int1
> > > > +    base_run_test wrap_fdtdump $dtb $dtb.2.out
> > > > +    # Remove unneeded header fields (keep those related to versions)
> > > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
> > > > +    base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
> > > > +
> > > > +    cp unknown_tags_can_skip.dtb $dtb
> > > > +    run_test wip_func $dtb nop_node /subnode2/subsubnode
> > > > +    base_run_test wrap_fdtdump $dtb $dtb.3.out
> > > > +    # Remove unneeded header fields (keep those related to versions)
> > > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
> > > > +    base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
> > > >  }
> > > >  
> > > >  dtc_tests () {
> > > > @@ -1045,6 +1073,56 @@ fdtput_tests () {
> > > >      run_wrap_error_test $DTPUT $dtb -d /chosen   non-existent-prop
> > > >  
> > > >      # TODO: Add tests for verbose mode?
> > > > +
> > > > +    # Modify a dtb containing some "unknown" tags that can be skipped
> > > > +    dtb=unknown_tags_can_skip.fdtput.test.dtb
> > > > +    cp unknown_tags_can_skip.dtb $dtb
> > > > +    base_run_test wrap_fdtdump $dtb $dtb.0.out
> > > > +    # Remove unneeded header fields (keep those related to versions)
> > > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> > > > +    base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
> > > > +    run_fdtput_test "vwxyz" $dtb / prop-str -ts "vwxyz"
> > > > +    base_run_test wrap_fdtdump $dtb $dtb.1.out
> > > > +    # Remove unneeded header fields (keep those related to versions)
> > > > +    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> > > > +    base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"    
> > > 
> > > Doing these as fdtput tests again seems kind of clumsy, unless the
> > > point is explicitly to check the fdtput utility's behaviour.  The core
> > > library functionality should be tested directly without introducing
> > > extra layers.  
> > 
> > Need to check the whole resulting binary skippable tags removed, version
> > downgrade. We need to check that the whole binary is still correct.  
> 
> Yes, but how does that relate to the use of fdtput?

fdtput is used to modify the dtb and so trigger the rules when unknown tags
are involved. I see fdtput as a wrapper usable from a bash script. Nothing
more.

No similar tools were available for fdt_wip.c functions. I introduced wip_func
tools to wrap fdt_wip.c function and perform several tests consisting in
different fdt_wip function call sequences.

> 
> > 'hexdump $dtb' could be used but having an array of hex value without any
> > other formatting related to dtb defined format will be ugly.  
> 
> Sure.  Again, seems like what you want is a dtbs_equal_with_tags.
> 
> > Here also fdtanalyzer could output hex values with some formating based on
> > dtb format definition. For instance:
> >   (0x1-FDT_BEGIN_NODE): "my_node"
> >     (0x3-FDT_PROP): ...
> >     (0x3-FDT_PROP): ...
> >   (0x2-FDT_END_NODE)
> >   ...
> >   (0x9-FDT_END)
> > 
> > Maybe offset (absolute and/or based on the beginning of the structure block)
> > could also be interesting in this kind of dumps.
> > 
> > 
> > Best regards,
> > Hervé
> >   
> 

Best regards,
Hervé

