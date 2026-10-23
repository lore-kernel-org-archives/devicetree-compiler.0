Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772151;
	b=j9tgWkVSFNFWIVYybebCE0XWotKuOyDCq1q1yv7opZlWDZMSVrgysd0HUz1mP0my2s4j
	 Wfr4f3Y3RO3IGpb9zAVEcgCxtXBHzN7N/mM7nA+8grjwkN5D/NzuqFDed944jbhgbvSCm
	 mfDac608sUUPoEESecejDEzq9XEuZA8QwTqiWFn+teTgLS4Pjik3KTYOznCqzqTliJLgm
	 itl4q3uowSQWcYUKVV72ZvyA+XucE61MmH/PjT9s85SeCkUqiAlo1hVQDY5TjXa0VEOGE
	 VjP681hyTgEbBqVMdmyxP6ygRB2b0hi8tJEtEJZ0lnzvoQN84msh5hF4ZHhwBPohVsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772151;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=206TRBL9eH7CzQSwmeMOSHt4wSQsqIurTtCbXibhaPQ=;
	b=r3/odCb2XcpuXOhZFadBSldykJ0p/s8rnyyHUY/6GmlUc5DMWJgpa3v2EZCTOZevbpMr
	 ElE8ZPhHDGb74+i31fnwM75VzkoypHGdJUg2ZqIF7Dr47DfOgRaAisxSREVN/LluuWFjG
	 VEE/65qGR4vTQwzGs1zUBq4GaWPJB4a/oX5aMkSYORtMczaYx47Z5GHvY8zBoODDahC0w
	 eRwXUh5Ym+v8YEAJM1rbVOM/fxA42kR0X/zQu7sk7zeybYWvUoK+PJPfJ7bzMAwNP2YmD
	 vzNsESRbAO6x+SK9iAQOiFp5E3sjti8j+FxYfEkXZre5vW9L3gGprEmAWuO7elhDbqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=chPlhnte;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5833606A31B;
	Fri, 23 Oct 2026 16:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5833606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=chPlhnte
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D3974E412D7;
	Fri, 23 Oct 2026 16:15:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E31B660398;
	Fri, 23 Oct 2026 16:15:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 947C110328BF4;
	Fri, 23 Oct 2026 18:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792772141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=206TRBL9eH7CzQSwmeMOSHt4wSQsqIurTtCbXibhaPQ=;
	b=chPlhntexBlGk+bKnPv/3cD5pxqu5Jj9HqkXjijAG6wD8eo07eJArVLJSYfI8JtWB/LEMi
	xJpVDgMefgj5KltbMEqLcew9rV3+nekdH124ktlTPlZTzR6WLo615iP/ZKdHKKAspcqAuN
	P/+6+VgoG71dEpho0QXxx3kOrueVPpM+D+KUOG/0wv5fi+LNAjwLv3kAoZ2ic2bQPhDt6n
	maK39KHZ+7gj1NJX2DKPvGyV77+hxu2ZkUInGUMxwyvH4a3Wfn+5pLti8etTiiCVx/oBbs
	SAUtJdLQfS2vdf0mQS5G9F6jp8Zs/gT0PIrIrssEEyVZkWyhjcdyX4alDPCrUg==
Date: Fri, 23 Oct 2026 18:15:33 +0200
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
Message-ID: <20261023181533.0c44a57f@bootlin.com>
In-Reply-To: <atrTn_I_8O6q9QUW@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-9-herve.codina@bootlin.com>
	<atrTn_I_8O6q9QUW@gractus.seuss>
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

On Fri, 23 Oct 2026 14:25:29 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 11:48:37AM +0200, Herve Codina wrote:
> > get_node_by_phandle() allows to get a node based on its phandle value.
> > It checks the phandle value against value available in internal node
> > structure.
> > 
> > This internal phandle value is updated during process_check() and so,
> > get_node_by_phandle() cannot give correct results before the
> > process_check() call.
> > 
> > Improve get_node_by_phandle() to look at node phandle properties when
> > the internal phandle value is not valid.
> > 
> > This allows to return a correct matching node even if process_check()
> > was not called yet.  
> 
> The idea is sound - it's always been kind of clunky that we need the
> process_checks() pass to fill the phandles before we can use them.
> But, there's at least one significant catch:
> 
> [Aside: you might notice the way it's done violates the principle I
>  stated elsewhere of avoiding structures where you must know where you
>  are in the flow to know which parts are populated.  My type
>  discipline has improved since I first wrote this code :)]
> 
> We need to gracefully handle the case of malformed phandle /
> linux,phandle properties; that's actually the reason for the weird
> placement of this in checks.c.  By treating it as a "check" we handle
> this case by failing the check.  Other checks that rely on phandles
> then have the 'explicit_phandles' check as a prereq so they don't need
> to verify this again.  We can still report errors for other checks
> that don't rely on that (which is the whole point of the checks
> mechanism).
> 
> That's not the only way to do it, of course, but we need something to
> check for that error case.  Further notes on the code.
> 
> > With the recently introduced FDT_PROPDATA_HANDLE dtb tag, this will be
> > needed to update internal phandle references before the call to
> > process_check(). Indeed, this tag allows to identify phandles and
> > internal references need to be updated based on the phandle value before
> > the process_check() call.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  livetree.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/livetree.c b/livetree.c
> > index abe73de1..a9f8c5d2 100644
> > --- a/livetree.c
> > +++ b/livetree.c
> > @@ -628,16 +628,35 @@ struct node *get_node_by_label(struct node *tree, const char *label)
> >  	return NULL;
> >  }
> >  
> > +static cell_t get_node_phandle_existing(struct node *node)
> > +{
> > +	struct property *prop;
> > +
> > +	if (phandle_is_valid(node->phandle))
> > +		return node->phandle;
> > +
> > +	prop = get_property(node, "phandle");
> > +	if (!prop) {
> > +		prop = get_property(node, "linux,phandle");
> > +		if (!prop)
> > +			return 0;
> > +	}
> > +
> > +	return propval_cell(prop);  
> 
> In the case of a malformed property, this could SEGV.

Ok, will update to
--- 8< ---
	if (prop->val.len != sizeof(cell_t))
		return 0;

	return propval_cell(prop)
--- 8< ---

> 
> > +}
> > +
> >  struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
> >  {
> >  	struct node *child, *node;
> > +	cell_t tree_phandle;
> >  
> >  	if (!phandle_is_valid(phandle)) {
> >  		assert(generate_fixups);
> >  		return NULL;
> >  	}
> >  
> > -	if (tree->phandle == phandle) {
> > +	tree_phandle = get_node_phandle_existing(tree);  
> 
> This means that every time we search for a phandle, for every node
> scanned before the destination with no phandle, we do a full property
> scan to check that no, it still doesn't have a phandle.
> 
> I don't care that much about dtc performance, but that's still a bit
> much to swallow.  I think we need to cache negative lookups to avoid
> that.  Happily, since there are two invalid phandle values this
> shouldn't be too hard.  We could, say, use tree->phandle == 0 to mean
> we don't know if there's a phandle, and tree->phandle == -1 to mean
> we've scanned the properties and we know there isn't one.
> 
> In fact, caching property lookups might be the better way to do this.
> Rather than having an explicit pass where tree->phandle is populated,
> we could have get_node_by_phandle() cache its property scan (success
> or failure) in tree->phandle.
> 
> I think that's a more elegant approach than the current one, but we do
> still need to handle the malformed property case.

Well, get_node_phandle_existing() can be improved:
---- 8< ----
static cell_t get_node_phandle_existing(struct node *node)
{
	cell_t phandle1, phandle2;
	struct property *prop1, *prop2;

	if (phandle_is_valid(node->phandle))
		return node->phandle;
	if (node->phandle == ~0UL) {
		/*
		 * We've already looked at existing properties and no valid
		 * phandle value were present. Avoid looking at them again
		 * and just return the invalid phandle value.
		 */
		return 0;
	}

	/* Try to get it from the 'phandle' property */
	phandle1 = 0; /* Assume invalid */
	prop1 = get_property(node, "phandle");
	if (prop1) {
		if (prop1->val.len == sizeof(cell_t))
			phandle1 = propval_cell(prop1); /* Well formed -> Get it */
	}

	/* Try to get it from the 'linux,phandle' property */
	phandle2 = 0; /* Assume invalid */
	prop2 = get_property(node, "linux,phandle");
	if (prop2) {
		if (prop2->val.len == sizeof(cell_t))
			phandle2 = propval_cell(prop2); /* Well formed -> Get it */
	}

	if (prop1 && prop2) {
		/*
		 * Both property are present. They values must be the same
		 * and valid.
		 */
		if (phandle1 == phandle2) && phandle_is_valid(phandle1)) {
			/* Ok, Cache this correct phandle value and return it */
			node->phandle = phandle1;
			return phandle1;
		}
	} else if (prop1) {
		/*
		 * Only the 'phandle' property is present.
		 * Check its value validity
		 */
		if (phandle_is_valid(phandle1)) {
			/* Ok, Cache this correct phandle value and return it */
			node->phandle = phandle1;
			return phandle1;
		}
	} else if (prop2) {
		/*
		 * Only the 'linux,phandle' property is present.
		 * Check its value validity
		 */
		if (phandle_is_valid(phandle2)) {
			/* Ok, Cache this correct phandle value and return it */
			node->phandle = phandle2;
			return phandle2;
		}
	}

	/*
	 * No valid phandle value were found. Cache this information and return
	 * the invalid phandle value.
	 */
	node->phandle == ~0UL;
	return 0;
}
--- 8< ---

In get_node_by_phandle(), no change compared to my proposition and so the
full function is:
--- 8< ---
struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
{
        struct node *child, *node;
        cell_t tree_phandle;

        if (!phandle_is_valid(phandle)) {
                assert(generate_fixups);
                return NULL;
        }

        tree_phandle = get_node_phandle_existing(tree);
        if (phandle_is_valid(tree_phandle) && tree_phandle == phandle) {
                if (tree->deleted)
                        return NULL;
                return tree;
        }

        for_each_child(tree, child) {
                node = get_node_by_phandle(child, phandle);
                if (node)
                        return node;
        }

        return NULL;
}
--- 8< ---

Caching should work correctly without any other modification.

I let you double-check on your side. Let me know about your opinion.

Best regards,
Hervé
