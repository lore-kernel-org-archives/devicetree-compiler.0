Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015791;
	b=0G4svKBwjie3o2EJ/77Fw2eTwlBOxRKxz0bvVGS0IaAL+IZSlM6ptsvq/LJVZZKyJP+g
	 tngFaTdEn7gAuYy0ZsR+RKU593h4AP5n4b6MKckNEBby7+fcWAkL320JkZ8+CREWIKQJG
	 R53eNrDXd08FE7mXdpYIny7sq+A4bX6iTCQ9DaJI35/jqUVAcw2ukMbD/9YtpUrjLfcQb
	 wcTm63EVbeBxKgqgDH/45NR7NwPp7kPiWjlyq7M3C/qw1NpE7R6SzEWpPCXZfWMPUGZOY
	 oXWUY1xFzwxf1Q7RuG1+y4hwC7mHVslkBwzz390RczoDDwP0ZzBtswp6nECSy5YuYmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015791;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=HFiOrM97HwRVCFpE4g+Fj9tumKj4KLeVGsM2WR0PuTs=;
	b=kghke42z9P9txr9tI5USEINyZInuEBAeskqgi5N8u5W5g4M10p0oWULMphi3sO+aYfyc
	 y7g7nP0oOlaV4feI0O2TuDtrS4ns86BBQFjNOOIUILm/8/BIGthruNWVRLg4Kd93UZfwG
	 HB4qYwLx+hkmrevD86c9C2Hs8nnMTQSZjUJV+aQhYmPieyfWiqxoU9C1XHEefSXWdifUH
	 QiE678oUwNpNQUZlUx6C4gtQf1YPJ5vUTBj1Phr4gkjJBQBgoLNUYr5HduC56XZ9PluKW
	 uv4WAahEZ7tu9Lr+Eq1GaptdZysLTKof48T9yrXKso1XRlqfJmR8U7MOOYpQXguhKew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="b1E5jA8/";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A2B606A31E
	for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 11:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b1E5jA8/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D42581A12B0;
	Mon, 26 Oct 2026 11:56:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E34760740;
	Mon, 26 Oct 2026 11:56:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7B911032900F;
	Mon, 26 Oct 2026 12:56:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793015785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HFiOrM97HwRVCFpE4g+Fj9tumKj4KLeVGsM2WR0PuTs=;
	b=b1E5jA8/ZqtYxSc98+8jPuYdYPFjTSSMTlkPp1JnTNBnioXheY5yefHR+XNUwbigBCOif6
	xLm6HTWZrlfQVe/a+Wf9pzEY1unE2L6ZdXTiy9pso78RWFnZ+2CWFW92hYIcxHmQqmfcyV
	EMoMuhP8CnqwP1tUuCuXUzng2jMpBoYmU/OGz48Dr9wb9tAB/1TfpzkRcRhwU5NasOgcOl
	TeOp7/UzoKHs4eD5/zwAK67JVukr77unFhgVcdehfIOmeHoZ74pS0nwY8htQY2Td8+O6nu
	XWr/wkfCFpaiEuoAiJe/nUFQhJ68k7tJUTsD/yektuKce7bYpqwwnfmtFPtqyA==
Date: Mon, 26 Oct 2026 12:56:15 +0100
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
Subject: Re: [RFC PATCH v2 08/74] livetree: Improve get_node_by_phandle()
Message-ID: <20261026125615.055e7214@bootlin.com>
In-Reply-To: <at6t-l9XYYFfS48T@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-9-herve.codina@bootlin.com>
	<atrTn_I_8O6q9QUW@gractus.seuss>
	<20261023181533.0c44a57f@bootlin.com>
	<at6t-l9XYYFfS48T@gractus.seuss>
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

On Mon, 26 Oct 2026 12:33:51 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Oct 23, 2026 at 06:15:33PM +0200, Herve Codina wrote:
> > Hi David,
> > 
> > On Fri, 23 Oct 2026 14:25:29 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >   
> > > On Wed, Aug 26, 2026 at 11:48:37AM +0200, Herve Codina wrote:  
> > > > get_node_by_phandle() allows to get a node based on its phandle value.
> > > > It checks the phandle value against value available in internal node
> > > > structure.
> > > > 
> > > > This internal phandle value is updated during process_check() and so,
> > > > get_node_by_phandle() cannot give correct results before the
> > > > process_check() call.
> > > > 
> > > > Improve get_node_by_phandle() to look at node phandle properties when
> > > > the internal phandle value is not valid.
> > > > 
> > > > This allows to return a correct matching node even if process_check()
> > > > was not called yet.    
> > > 
> > > The idea is sound - it's always been kind of clunky that we need the
> > > process_checks() pass to fill the phandles before we can use them.
> > > But, there's at least one significant catch:
> > > 
> > > [Aside: you might notice the way it's done violates the principle I
> > >  stated elsewhere of avoiding structures where you must know where you
> > >  are in the flow to know which parts are populated.  My type
> > >  discipline has improved since I first wrote this code :)]
> > > 
> > > We need to gracefully handle the case of malformed phandle /
> > > linux,phandle properties; that's actually the reason for the weird
> > > placement of this in checks.c.  By treating it as a "check" we handle
> > > this case by failing the check.  Other checks that rely on phandles
> > > then have the 'explicit_phandles' check as a prereq so they don't need
> > > to verify this again.  We can still report errors for other checks
> > > that don't rely on that (which is the whole point of the checks
> > > mechanism).
> > > 
> > > That's not the only way to do it, of course, but we need something to
> > > check for that error case.  Further notes on the code.
> > >   
> > > > With the recently introduced FDT_PROPDATA_HANDLE dtb tag, this will be
> > > > needed to update internal phandle references before the call to
> > > > process_check(). Indeed, this tag allows to identify phandles and
> > > > internal references need to be updated based on the phandle value before
> > > > the process_check() call.
> > > > 
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > > ---
> > > >  livetree.c | 21 ++++++++++++++++++++-
> > > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/livetree.c b/livetree.c
> > > > index abe73de1..a9f8c5d2 100644
> > > > --- a/livetree.c
> > > > +++ b/livetree.c
> > > > @@ -628,16 +628,35 @@ struct node *get_node_by_label(struct node *tree, const char *label)
> > > >  	return NULL;
> > > >  }
> > > >  
> > > > +static cell_t get_node_phandle_existing(struct node *node)
> > > > +{
> > > > +	struct property *prop;
> > > > +
> > > > +	if (phandle_is_valid(node->phandle))
> > > > +		return node->phandle;
> > > > +
> > > > +	prop = get_property(node, "phandle");
> > > > +	if (!prop) {
> > > > +		prop = get_property(node, "linux,phandle");
> > > > +		if (!prop)
> > > > +			return 0;
> > > > +	}
> > > > +
> > > > +	return propval_cell(prop);    
> > > 
> > > In the case of a malformed property, this could SEGV.  
> > 
> > Ok, will update to
> > --- 8< ---
> > 	if (prop->val.len != sizeof(cell_t))
> > 		return 0;
> > 
> > 	return propval_cell(prop)
> > --- 8< ---
> >   
> > >   
> > > > +}
> > > > +
> > > >  struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
> > > >  {
> > > >  	struct node *child, *node;
> > > > +	cell_t tree_phandle;
> > > >  
> > > >  	if (!phandle_is_valid(phandle)) {
> > > >  		assert(generate_fixups);
> > > >  		return NULL;
> > > >  	}
> > > >  
> > > > -	if (tree->phandle == phandle) {
> > > > +	tree_phandle = get_node_phandle_existing(tree);    
> > > 
> > > This means that every time we search for a phandle, for every node
> > > scanned before the destination with no phandle, we do a full property
> > > scan to check that no, it still doesn't have a phandle.
> > > 
> > > I don't care that much about dtc performance, but that's still a bit
> > > much to swallow.  I think we need to cache negative lookups to avoid
> > > that.  Happily, since there are two invalid phandle values this
> > > shouldn't be too hard.  We could, say, use tree->phandle == 0 to mean
> > > we don't know if there's a phandle, and tree->phandle == -1 to mean
> > > we've scanned the properties and we know there isn't one.
> > > 
> > > In fact, caching property lookups might be the better way to do this.
> > > Rather than having an explicit pass where tree->phandle is populated,
> > > we could have get_node_by_phandle() cache its property scan (success
> > > or failure) in tree->phandle.
> > > 
> > > I think that's a more elegant approach than the current one, but we do
> > > still need to handle the malformed property case.  
> > 
> > Well, get_node_phandle_existing() can be improved:
> > ---- 8< ----
> > static cell_t get_node_phandle_existing(struct node *node)
> > {
> > 	cell_t phandle1, phandle2;
> > 	struct property *prop1, *prop2;
> > 
> > 	if (phandle_is_valid(node->phandle))
> > 		return node->phandle;
> > 	if (node->phandle == ~0UL) {
> > 		/*
> > 		 * We've already looked at existing properties and no valid
> > 		 * phandle value were present. Avoid looking at them again
> > 		 * and just return the invalid phandle value.
> > 		 */
> > 		return 0;
> > 	}
> > 
> > 	/* Try to get it from the 'phandle' property */
> > 	phandle1 = 0; /* Assume invalid */
> > 	prop1 = get_property(node, "phandle");
> > 	if (prop1) {
> > 		if (prop1->val.len == sizeof(cell_t))
> > 			phandle1 = propval_cell(prop1); /* Well formed -> Get it */
> > 	}
> > 
> > 	/* Try to get it from the 'linux,phandle' property */
> > 	phandle2 = 0; /* Assume invalid */
> > 	prop2 = get_property(node, "linux,phandle");
> > 	if (prop2) {
> > 		if (prop2->val.len == sizeof(cell_t))
> > 			phandle2 = propval_cell(prop2); /* Well formed -> Get it */
> > 	}
> > 
> > 	if (prop1 && prop2) {
> > 		/*
> > 		 * Both property are present. They values must be the same
> > 		 * and valid.
> > 		 */
> > 		if (phandle1 == phandle2) && phandle_is_valid(phandle1)) {
> > 			/* Ok, Cache this correct phandle value and return it */
> > 			node->phandle = phandle1;
> > 			return phandle1;
> > 		}
> > 	} else if (prop1) {
> > 		/*
> > 		 * Only the 'phandle' property is present.
> > 		 * Check its value validity
> > 		 */
> > 		if (phandle_is_valid(phandle1)) {
> > 			/* Ok, Cache this correct phandle value and return it */
> > 			node->phandle = phandle1;
> > 			return phandle1;
> > 		}
> > 	} else if (prop2) {
> > 		/*
> > 		 * Only the 'linux,phandle' property is present.
> > 		 * Check its value validity
> > 		 */
> > 		if (phandle_is_valid(phandle2)) {
> > 			/* Ok, Cache this correct phandle value and return it */
> > 			node->phandle = phandle2;
> > 			return phandle2;
> > 		}
> > 	}
> > 
> > 	/*
> > 	 * No valid phandle value were found. Cache this information and return
> > 	 * the invalid phandle value.
> > 	 */
> > 	node->phandle == ~0UL;
> > 	return 0;
> > }
> > --- 8< ---
> 
> That looks good to me.  But the "existing" in the name no longer says
> anything useful - this can be the standard way to get a node's
> phandle.  In fact it might be worth changing the name of the
> node->phandle field to make sure we don't have any stale users rather
> than going through the get_phandle() function.

Ok, I will rename node->phandle to node->phandle_ and add a comment saying
that phandle_ field must not be accessed directly.

Related to existing users, I can see check_explicit_phandles() available
in the checks.c file.

check_explicit_phandles() could use the new get_node_phandle_exising() with
the caching feature. The only problematic part will be
--- 8< ---
	if (linux_phandle && phandle && (phandle != linux_phandle))
		FAIL(c, dti, node, "mismatching 'phandle' and 'linux,phandle'"
		     " properties");
--- 8< ---

Indeed, this check is done in get_node_phandle_existing() and the function
returns 0 (invalid phandle) when both properties are set with a different
value. A value other than 0 should be returned by get_node_phandle_existing()
to identify that mismatching properties values.

This should not be a big deal if we introduced a new invalid phandle value:
  - 0:
    Invalid value. Can be returned by get_node_phandle_existing().

  - ~0:
    Unresolved value (phandle value in properties) or value cached in 
    phandle->node_ for "mismatch 'phandle' and 'linux,phandle' properties
    values". Can be returned by get_node_phandle_existing().

  - (~0)-1:
    Invalid value in properties and or value cached in phandle->node_ for Invalid value.
    Will not be returned by get_node_phandle_existing().
    When this cached value is found, 0 will be returned.

In phandle_is_valid(), those 3 values will be checked to determine if the phandle
value is valid or not.

Now last point, renaming get_node_phandle_existing().

get_node_phandle() already exist. It get a phandle but also if the node doesn't
have a phandle, it allocate a new phandle value and set node "phandle" or
"linux, phandle" property to this allocated value.

IHMO, get_node_phandle() should be renamed to set_node_phandle() and
get_node_phandle_existing() should be renamed to get_node_phandle().

Does all of these make sense?

I so, I will try to implement that and maybe I will see other issue I might
have missed.

Worth noting that if you're ok to rename get_node_phandle() to
set_node_phandle(), I will do it in a dedicated patch. Indeed, this will
ensure that get_node_phandle() has been renamed everywhere (compilation
without failure) and so I can safely rename get_node_phandle_existing() to
get_node_phandle() in a next patch.

> 
> > In get_node_by_phandle(), no change compared to my proposition and so the
> > full function is:
> > --- 8< ---
> > struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
> > {
> >         struct node *child, *node;
> >         cell_t tree_phandle;
> > 
> >         if (!phandle_is_valid(phandle)) {
> >                 assert(generate_fixups);
> >                 return NULL;
> >         }
> > 
> >         tree_phandle = get_node_phandle_existing(tree);
> >         if (phandle_is_valid(tree_phandle) && tree_phandle == phandle) {
> >                 if (tree->deleted)
> >                         return NULL;
> >                 return tree;
> >         }
> > 
> >         for_each_child(tree, child) {
> >                 node = get_node_by_phandle(child, phandle);
> >                 if (node)
> >                         return node;
> >         }
> > 
> >         return NULL;
> > }
> > --- 8< ---
> > 
> > Caching should work correctly without any other modification.
> > 
> > I let you double-check on your side. Let me know about your opinion.  
> 
> Yes, I think that should work.
> 

Best regards,
Hervé
