Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8151B3EB0F4;
	Wed, 16 Sep 2026 06:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540306; cv=none; b=KaF+1rNMmafLyHwxsCMsj40qv3M45THdkyYpPnGmwvjHQFHG/8W86ciIvBTeKN0la8V/oJ+Pr8x7c5Mn2JBer0AkEvOtfIqWq3MRTcWggJbJ51h6JYVsbxEKRLSJNK4hhZqTNGdbg6pg1ADxexcmCLdkSVYo9w7utRnMuNTfjw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540306; c=relaxed/simple;
	bh=YAV/kewyaNdWKBAHQHg+RtpsAm351nD9dGth/P2j9+0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZlTm/DyBef5i8oWmugijcyjZ7Oa0tL0cXRbEwyQyYpN4nJ0M2qacq6B0yASZd3Qv27ZGVulo3lYFDeGEMEX/uDz+NAccVGsj1pb6FmlhxwfPIt8c4fIWeVFpLNlhhUhqS9bW9T+mkhucTiyuth8aGWNr7IzxwnS7UyHNzRGqR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nk/zMUr9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nk/zMUr9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B388F1A0887;
	Wed, 16 Sep 2026 06:31:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8498E60337;
	Wed, 16 Sep 2026 06:31:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82E2A11C7AFEC;
	Wed, 16 Sep 2026 08:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789540297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i1kgbghZztbsN2wlKygW1jp9280raQAqeNuOcXI9Or4=;
	b=nk/zMUr9tSgz8b4Jo2+i0o93GRzbsPCM2CsLiDJXgYq7n6j5jj5nXJuq4YAw8EOwWyWgJ8
	eHL+9Y4BPCzqfm1t1WRaJ7JcB8QP4VzC8cNsdXqUZ38eufE81sfEjbjSaaWC2L49SpcpF9
	E5k5cJXG93r0BhM3e5lQZpDd2ebDvjnR9ksWFx8V7b0LHq3vuseOPwvxuTLuGzR8tl/YFH
	rKS0sWYcTF2wl80rBeZ65rWUW7ZW5cNSzU6gBsmITZuXCVALTDGRxSmYZ6FTkw9F2w/t1L
	WgbM58+xau6EGaYs4Nub4iiT0LyoM/Ex55w1NAoffB9Su04XlmiHK/TR5HI2rA==
Date: Wed, 16 Sep 2026 08:31:30 +0200
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
Subject: Re: [PATCH v3 08/15] flattree: Handle unknown tags
Message-ID: <20260916083130.7b14e90e@bootlin.com>
In-Reply-To: <aqkxacdQHZuhhyxw@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-9-herve.codina@bootlin.com>
	<aqevEJ_VlBxYUp81@gractus.seuss>
	<20260915121635.39f13d34@bootlin.com>
	<aqkxacdQHZuhhyxw@gractus.seuss>
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

On Tue, 15 Sep 2026 21:52:24 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Sep 15, 2026 at 12:16:35PM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Mon, 14 Sep 2026 18:23:49 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Aug 26, 2026 at 10:31:39AM +0200, Herve Codina wrote:  
> > > > The structured tag value definition introduced recently gives the
> > > > ability to ignore unknown tags without any error when they are read.
> > > > 
> > > > Handle those structured tag.
> > > > 
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  flattree.c                                 | 65 ++++++++++++++++++++--
> > > >  tests/run_tests.sh                         |  5 ++
> > > >  tests/unknown_tags_can_skip.dtb.dts.expect | 19 +++++++
> > > >  3 files changed, 84 insertions(+), 5 deletions(-)
> > > >  create mode 100644 tests/unknown_tags_can_skip.dtb.dts.expect
> > > > 
> > > > diff --git a/flattree.c b/flattree.c
> > > > index f3b698c1..88dbfa7e 100644
> > > > --- a/flattree.c
> > > > +++ b/flattree.c
> > > > @@ -579,7 +579,8 @@ static void flat_read_chunk(struct inbuf *inb, void *p, int len)
> > > >  	if ((inb->ptr + len) > inb->limit)
> > > >  		die("Premature end of data parsing flat device tree\n");
> > > >  
> > > > -	memcpy(p, inb->ptr, len);
> > > > +	if (p)
> > > > +		memcpy(p, inb->ptr, len);
> > > >  
> > > >  	inb->ptr += len;
> > > >  }
> > > > @@ -604,6 +605,61 @@ static void flat_realign(struct inbuf *inb, int align)
> > > >  		die("Premature end of data parsing flat device tree\n");
> > > >  }
> > > >  
> > > > +static bool flat_skip_unknown_tag(struct inbuf *inb, uint32_t tag)
> > > > +{
> > > > +	uint32_t lng;
> > > > +
> > > > +	if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
> > > > +		return false;
> > > > +
> > > > +	switch (tag & FDT_TAG_DATA_MASK) {
> > > > +	case FDT_TAG_DATA_NONE:
> > > > +		break;
> > > > +
> > > > +	case FDT_TAG_DATA_1CELL:
> > > > +		flat_read_word(inb);
> > > > +		break;
> > > > +
> > > > +	case FDT_TAG_DATA_2CELLS:
> > > > +		flat_read_word(inb);
> > > > +		flat_read_word(inb);
> > > > +		break;
> > > > +
> > > > +	case FDT_TAG_DATA_VARLEN:
> > > > +		/* Get the length */
> > > > +		lng = flat_read_word(inb);    
> > > 
> > > I think it would be more natural to get the length as a single value,
> > > then have a common flat_read_chunk() and flat_realign() to consume it.
> > > That's for two reasons:
> > >  * Assuming we keep this length encoding, getting the final tag size
> > >    seems like it would make a useful helper function anyway.
> > >  * Using flat_read_word() is misleading - it implies it's integer data
> > >    where endianness matters.  In this case it's not - it's just some
> > >    bytes we're skipping over, we don't know the internal structure.  
> > 
> > Well, without the length for all tags (I mean keeping some size encoding
> > in the tag value), we can avoid the flat_read_word().
> > --- 8< ---
> > 	switch (tag & FDT_TAG_DATA_MASK) {
> > 	case FDT_TAG_DATA_NONE:
> > 		lng = 0;
> > 		break;
> > 
> > 	case FDT_TAG_DATA_1CELL:
> > 		lng = sizeof(uint32_t);
> > 		break;
> > 
> > 	case FDT_TAG_DATA_2CELLS:
> > 		lng = 2 * sizeof(uint32_t);
> > 		break;
> > 
> > 	case FDT_TAG_DATA_VARLEN:
> > 		/* Get the length */
> > 		lng = flat_read_word(inb)
> > 		break;
> >         }
> > 
> >         if (lng) {
> > 		flat_read_chunk(inb, NULL, lng);
> > 		flat_realign(inb, sizeof(uint32_t));
> >         }
> > ---- 8< ----  
> 
> Right, that's exactly what I'm suggesting.
> 
> > Related to a helper, I have introduced one in the addon series where new tags
> > are present and these new tags are no more "unknown" tags and flat_read_subbuf()
> > has been introduced to parse them. You can see that in the patch 11/74 [0] or
> > directly in the final code [1]
> > 
> > [0] https://lore.kernel.org/devicetree-compiler/20260826094950.1088288-12-herve.codina@bootlin.com/
> > [1] https://github.com/bootlin/dtc/blob/c68038e0ff4cde5de37a21419df8a082032ef994/flattree.c#L1169
> > 
> > I can see to avoid some more code duplication between functions skipping "unknown" tags
> > and function parsing new "known" tags.  
> 
> Uh.. I don't quite see the relevance of that here.  I'm just
> suggesting the length calculation alone be a helper function.
> 

Ah, okay, I'll introduce and use this small length calculation helper.

> 
> > > > +
> > > > +		/* Skip the following length bytes */
> > > > +		flat_read_chunk(inb, NULL, lng);
> > > > +
> > > > +		flat_realign(inb, sizeof(uint32_t));
> > > > +		break;
> > > > +	}
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > > +static uint32_t flat_read_tag(struct inbuf *inb)
> > > > +{
> > > > +	uint32_t tag;
> > > > +
> > > > +	do {
> > > > +		tag = flat_read_word(inb);
> > > > +		switch (tag) {
> > > > +		case FDT_BEGIN_NODE:
> > > > +		case FDT_END_NODE:
> > > > +		case FDT_PROP:
> > > > +		case FDT_NOP:
> > > > +		case FDT_END:
> > > > +			return tag;
> > > > +		default:
> > > > +			break;
> > > > +		}
> > > > +	} while (flat_skip_unknown_tag(inb, tag));    
> > > 
> > > Having this as a separate function seems odd to me...  
> > 
> > Well, this clearly decouples "known" tags from "unknown" tags and keeps the
> > function small.
> >   
> > >   
> > > > +	die("Cannot skip unknown tag 0x%08x\n", tag);
> > > > +}
> > > > +
> > > >  static const char *flat_read_string(struct inbuf *inb)
> > > >  {
> > > >  	int len = 0;
> > > > @@ -750,7 +806,7 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
> > > >  		struct property *prop;
> > > >  		struct node *child;
> > > >  
> > > > -		val = flat_read_word(dtbuf);
> > > > +		val = flat_read_tag(dtbuf);
> > > >  		switch (val) {    
> > > 
> > > 
> > > .. rather than having handling unknown tags as part of the default:
> > > case here.  
> > 
> > Here and probably on some other part if we go in that direction.
> > 
> > Here you have already parsed a FDT_BEGIN_NODE to call unflatten_tree().
> > 
> > Unknown tags should be handle and skipped if possible at lower level to handle
> > them everywhere and without code duplication.
> > 
> > flat_read_tag() is this lower level.
> >   
> > >   
> > > >  		case FDT_PROP:
> > > >  			if (node->children)
> > > > @@ -905,14 +961,13 @@ struct dt_info *dt_from_blob(const char *fname)
> > > >  
> > > >  	reservelist = flat_read_mem_reserve(&memresvbuf);
> > > >  
> > > > -	val = flat_read_word(&dtbuf);
> > > > -
> > > > +	val = flat_read_tag(&dtbuf);
> > > >  	if (val != FDT_BEGIN_NODE)
> > > >  		die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);    
> > > 
> > > Hmm.. doesn't this already need to be fixed to handle NOP tags before
> > > the root node?  Logically that change would go before this one.  
> > 
> > Oh yes, good catch. I missed that one.
> > 
> > Will be update in next iteration (in offset 0 vs real root node offset part)
> > with 2 points:
> >   - handle the case here with something like
> >     --- 8< ---
> >        /* Skip possible FDT_NOP available before the root node */
> >        do {
> > 	  val = flat_read_tag(&dtbuf);
> >        } while (tag == FDT_NOP);
> > 
> >        if (val != FDT_BEGIN_NODE)
> > 	  die("Device tree blob doesn't begin with FDT_BEGIN_NODE (begins with 0x%08x)\n", val);
> >        ...
> >     --- 8< ---
> > 
> >   - Add a test calling dtc with a "nopulated" dtb
> >     This test is really missing. Only functions from libfdt are tested with
> >     a nopulated dtb. DTC has to be tested too.  
> 
> Sounds good.

Perfect.

> 
> > >   
> > > >  
> > > >  	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);
> > > >  
> > > > -	val = flat_read_word(&dtbuf);
> > > > +	val = flat_read_tag(&dtbuf);
> > > >  	if (val != FDT_END)
> > > >  		die("Device tree blob doesn't end with FDT_END\n");    
> > > 
> > > Likewise here for that matter, a NOP should be valid between the last
> > > FDT_END_NODE and the FDT_END.  
> > 
> > Yes, exactly and this will be taken into account in the next iteration.  
> 
> Great.
> 
> > > > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > > > index f3647e63..8fc23cb7 100755
> > > > --- a/tests/run_tests.sh
> > > > +++ b/tests/run_tests.sh
> > > > @@ -882,6 +882,11 @@ dtc_tests () {
> > > >  
> > > >      # Tests for overlay/plugin generation
> > > >      dtc_overlay_tests
> > > > +
> > > > +    # Tests with "unknown tags"
> > > > +    run_dtc_test -I dtb -O dts -o unknown_tags_can_skip.dtb.dts unknown_tags_can_skip.dtb
> > > > +    base_run_test check_diff unknown_tags_can_skip.dtb.dts "$SRCDIR/unknown_tags_can_skip.dtb.dts.expect"    
> > > 
> > > It's best to avoid tests based on -O dts output unless we're
> > > explicitly checking -O dts behaviour: because there are multiple ways
> > > to format property values, the exact output isn't really guaranteed.  
> > 
> > But at a give version dtc and a given dtb file, there is only one way
> > to generate a dts.  
> 
> Yes, but if we tweak our -Odts formatting decisions, we don't want to
> have to churn tests that aren't specifically related to -Odts.
> 
> > If it change because of some modification in dtc, having some changes in
> > tests expected value should not be a big deal.  
> 
> It's not a huge deal, but it's still preferable to avoid.
> 
> > > What I'd suggest instead is to adjust treegen to generate two dtbs
> > > that are identical _except_ for the skippable tag.  Then you can use
> > > dtc -I dtb -O dtb, and compare the dtc output (which should strip the
> > > tag) against the dtb which was constructed without it in the first
> > > place.
> > > 
> > > Or, rather than explicitly creating two new trees, you could make your
> > > skippable tag example identical to test_tree1, except for the
> > > additional tag, and re-use one of the other instances of test_tree1 as
> > > the "tagless" version.  
> > 
> > Why not just one dtb generated to treegen with unknown tags (already available
> > unknown_tags_can_skip.dtb)
> > 
> > dtc -I dtb -O dtb -o unknown_tags_can_skip.dtb.dtb unknown_tags_can_skip.dtb
> > 
> > And then
> > 	base_run_test wrap_fdtdump unknown_tags_can_skip.dtb.dtb unknown_tags_can_skip.dtb.dtb.out
> >     	# Remove unneeded comments
> > 	sed -i '/^\/\/ [^U]/d' unknown_tags_can_skip.dtb.out
> >     	base_run_test check_diff unknown_tags_can_skip.dtb.dtb.out "$SRCDIR/unknown_tags_can_skip.dtb.expect"  
> 
> I don't like it - the output formatting of fdtdump is even less
> guaranteed than -Odts.
> 
> > This avoid the need for 2 dtbs generated by treegen and also avoid to compare
> > binary files which are difficult to analyze when the comparison detects a problem
> > due to something broken by some modifications.  
> 
> We _want_ to understand and test things at the binary byte level.
> Debugging differences is a little trickier, but it's really not that
> bad - -Odts or fdtdump or dtdiff can be used if/when there's a test
> failure.  I really think doing the comparison in binary is preferable
> - that's the level at which the behaviour is specified and should be
> tested.

Right, will see what I can do. Probably generating using two specific dtbs
as suggested in your first proposal.

Worth noting that each time a dtb will change due to, for instance, a new
dtb version (or any other header field update), this test will need to be
updated. DTC will generate the dtb with new headers value.

Best regards,
Hervé
