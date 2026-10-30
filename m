Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355080;
	b=kieAR77NkzH5qgHA23OMabSAgwTNruCsaER/w3kSLSejBO14sYi4//f6l1QWtOYZ+5eO
	 S8xjT70vofF562BqlDk6+K04mghJm+2+RzAfhh4+bSrDUkZO3aePcQsbHsb8ejQuMMmae
	 vNrdGoa06QclRcIVnFX/2OeMoxrNtVZJI+RUu0wyDt2CrGU8QTUvEOqElY6PN3zcI0jd5
	 oSUUAB/q6E8bgky9Yv5p/0Bo/OCcHiXhKAgMfFM/7m4gI/gxlCAjL5i8hPR5kcHku800M
	 FUJWTuZXZtj6URwVmSAqLwPvDGXAsl9MIoRyzMBe3xUOcwLW+PU+eBiZPCtZ5dQz4YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355080;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=c8pH/CdshWLIkQEJSfq8442Br3qC36LxjjRq+e7VMxA=;
	b=xuiQIW1BRYZS+2JgvyjzUvMzugkspaQMfKjUqsjdT0ymvkNitKprYnfLzQZhm8ua+KlS
	 DI3lPjaKhh+ml5hRrBWNGFX4iMm/MnPn5dj+muSoHZTxRUIA9Du0cEufAI3nPp5I7Uxoz
	 DUmewrobLWnuyeF7pLXSVqpRq/60QtxcNGB5g5fSBB9JwufyfDJG9jz6o1PZBwBJJdSu1
	 r7I8LqLBjCipy5w7pzg5dWIGJDo0pPObFs+LA6FrFs785S25Erj+qltGVztEcuii9iBIv
	 eDexY70sW73nxIOgBMxuGMIArXgZnZtcKk5P+vKWWgOUWl6uhawAuE/l9RARESSKzfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZaAfZ8as;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4312A606A31D
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 10:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4312A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZaAfZ8as
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 964DA4E41396;
	Fri, 30 Oct 2026 10:11:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A998603C2;
	Fri, 30 Oct 2026 10:11:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDE77103287DA;
	Fri, 30 Oct 2026 11:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793355075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c8pH/CdshWLIkQEJSfq8442Br3qC36LxjjRq+e7VMxA=;
	b=ZaAfZ8as/q7KO50GLIatdRqtadVk1ZriyJHKA7DNQFK+4EUPVX4uV8cacCMb8Z4aJeD3zZ
	vMj3xLJ6JIJ4IYe6R7HHMiwqub3F6hwSKTDo0SvrhmoPgZ55Roraen1TDHsWhHrl+idsnN
	UG+r1oWLTEiG7ZiCyVJvkFf/NymdasWVtMaf0tWVASXucVR2vR1nTBulHSCYPFLFhy3lbu
	6w1BqKpc6Td8+KS4/8NPsXZ5MdpeZenk8Ersrfaycvfs5Btp8x9zFEHqGog68FkitaK5wB
	bG0kT5BL9lkgDwvHhUWukQC9liRnuPFyQ2tjqKp6rXJuJNX+IjQPwhtpS+2gZw==
Date: Fri, 30 Oct 2026 11:11:07 +0100
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
Subject: Re: [RFC PATCH v2 09/74] dtc: Complete REF_PHANDLE markers with ref
 strings and is_local flags
Message-ID: <20261030111107.10e63a9a@bootlin.com>
In-Reply-To: <auQpi8LGNldeNdK-@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-10-herve.codina@bootlin.com>
	<auQpi8LGNldeNdK-@gractus.seuss>
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

On Fri, 30 Oct 2026 16:22:20 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> >  
> > +static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
> > +				      bool *is_local, cell_t phandle)
> > +{
> > +	struct node *refnode;
> > +
> > +	/*
> > +	 * When created from a dts, the reference is available but the is_local
> > +	 * flag is not set.
> > +	 *
> > +	 * When created from a dtb, the is_local flag is set (and a valid
> > +	 * phandle value is available) but not the reference.
> > +	 *
> > +	 * Complete both ref and is_local based on existing values.  
> 
> The two cases share essentially zero code in this function, which
> suggests to me they'd be better as different functions (each of which
> could then have a more natural signature).
> 
> > +	 */
> > +
> > +	if (*ref) {
> > +		refnode = get_node_by_ref(dti->dt, *ref);
> > +		if (refnode)
> > +			*is_local = true;
> > +		else
> > +			*is_local = false;
> > +		return;
> > +	}
> > +
> > +	if (*is_local) {
> > +		refnode = get_node_by_phandle(dti->dt, phandle);
> > +		if (!refnode)
> > +			die("Node not found for phandle 0x%"PRIx32"\n", phandle);
> > +
> > +		*ref = refnode->fullpath;
> > +		return;
> > +	}
> > +
> > +	die("Cannot have a non local reference without a reference\n");
> > +}
> > +
> > +static void complete_references_internal(struct dt_info *dti, struct node *node)
> > +{
> > +	struct property *prop;
> > +	struct marker *m;
> > +	struct node *c;
> > +	cell_t phandle;
> > +
> > +	/*
> > +	 * In order to have a complete state, a REF_PHANDLE marker needs to
> > +	 * have a reference set (either a label or a path) and the is_local
> > +	 * flag must be also correctly set.
> > +	 *
> > +	 * When created from dtb, references are not present in REF_PHANDLE
> > +	 * markers created from the FDT_PROPDATA_PHANDLE tag. Indeed, only a
> > +	 * phandle value is available with this tag.
> > +	 *
> > +	 * When created from dts, references are available for REF_PHANDLE
> > +	 * markers but 'is_local' flag is not set.
> > +	 *
> > +	 * Completing a REF_PHANDLE marker consists in setting those fields.
> > +	 */
> > +	for_each_property(node, prop) {
> > +		m = prop->val.markers;
> > +		for_each_marker_of_type(m, REF_PHANDLE) {
> > +			phandle = propval_cell_n(prop,
> > +						 m->offset / sizeof(cell_t));
> > +			complete_ref_and_is_local(dti, &m->ref, &m->is_local,
> > +						  phandle);
> > +		}
> > +	}
> > +
> > +	for_each_child(node, c)
> > +		complete_references_internal(dti, c);  
> 
> Of course the change suggested above would mean that you need two
> different cases in the callers as well.  I think that's worth it:
> treating this as symmetric when we should know going in what direction
> _all_ the fixups will go seems odd to me.  Or more concretely, I'm
> concerned that if some bug means we get a marker in bogus state
> (e.g. ref valid when coming from dtb) this approach means we'll carry
> on sort of working, when it would be preferable to catch the bad state
> and die earlier.

ref can be valid when coming from dtb: FDT_PROPDATA_PHANDLE_REF.

Anyway, I understood the idea and will see what I can do for the next
iteration.

The is_local field will be removed (already discussed) and so, only the
ref field is present.
 - ref NULL: dtb only
 - ref non NULL: dtb and dts

Not sure that two functions will be needed. Will see when I remove is_local
but I keep your feedback in mind.

Best regards,
Hervé
