Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725647;
	b=lQJjlCKTiZ9wdzdRtJzw8bvoXTrHkcLAGab/eWW83eFpyEvlyhgss2680k/If/B7BC/E
	 OT+YZlrLBYzN6tTwQEIZmdSJ1/XoAUkX1zxgiSuFHtOw9zUGp0oQ8dYCkAJqN+tDEV9Nq
	 +W+GzYXsEiZSm6OdkH9zIAGB+8J8z64xsbgztYdTibIU6ERn+ULutW3rQBu0hpw4bZ0q8
	 TGIwRYrsdYPDV007Q2ErtSF/uCBFdYs3fLFuo4tCj5wBOzXcI2xkalNFm59kxcBQkbCxX
	 peGzfiYBuKQLRPqc4INpxU37d9mJS/EbOsOSecbiBPUNWedfl+9hAWoI2hr1Th6OAPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725647;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=D2xD3RQLPrEvc8tcEZsFGXT/WQc+p6TazoyYM2JerWM=;
	b=M7VOpjxB50oNiIRaSUS/BKqsRi7aSMzFpLCKijE1TQKCn1HIPe8M6BjXvl4Y89FHksgT
	 jjkW9tqifufX/U94OubQMDLwVcNLjCDdqkftrbLy5XT0UZrPJO5Vii0hPdd+pg/mwtauo
	 pva/UsLvBw2TC+cdqfl9RWmzXlMJF205iSbGbM2q5kihoI7KE+iKx/71fO9ReiHx8cClq
	 kPSev8Yiosn2rCxeZFs24bEOYcueo2bMQfxRgiiVdpa9YkvK457Hwn3ON6FjCfxSMtJ+6
	 dC1eV0dtSQsl3SDP8RlfOHkYRkm56aVlTrNspGdutTAyzU6TCBt8QepkoE10nCQEfkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iGFyXCYc;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88E606A329
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 17:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA88E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iGFyXCYc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 950F4C49F46;
	Tue,  3 Nov 2026 17:08:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EEDB66046C;
	Tue,  3 Nov 2026 17:07:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADC441032914F;
	Tue,  3 Nov 2026 18:07:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793725638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D2xD3RQLPrEvc8tcEZsFGXT/WQc+p6TazoyYM2JerWM=;
	b=iGFyXCYcoRR9+HZw0AE4pUYalKTtnZKoSS7rGKqsgzui2PGDYGz6esiIUZGLhSLfmSCH2s
	l0WZIlZM3r00e4Blg9HKxTnPd2TCN2tDSV+YhhnWB/YvcKvFncZpIs+UnYxmPhNI62Eo4+
	EVAt6fQQfOEbdPQqISbmqYxdnLWNuObgZ/3zYqeGiXJ6qK7VlGRXJMsIexKGBH59/jwEjR
	e0PzoJm6a34mPrIBQNWaFFlLNJNyi1P+RL63JjS/lMU2TsfdYARQx+PNXGFpZFi8LKFjCY
	V+5vJ3S922uDEMnEErlm/SroMG5jZxVqUADJhKgBjq+v7BJXBKos1ullrC4fag==
Date: Tue, 3 Nov 2026 18:07:14 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
Message-ID: <20261103180714.4b987a45@bootlin.com>
In-Reply-To: <20261101163721.2458982-3-sjg@chromium.org>
References: <20261101163721.2458982-1-sjg@chromium.org>
	<20261101163721.2458982-3-sjg@chromium.org>
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

On Sun,  1 Nov 2026 09:36:56 -0700
Simon Glass <sjg@chromium.org> wrote:

> A dts file is made up of top-level fragments: the root node, later
> definitions of a node by label or path, and /delete-node/ or
> /omit-if-no-ref/ with a reference. We would like to deal with each
> fragment on its own before it is merged, for example to apply deletes
> consistently or to run some checks on each one, but that requires
> keeping the fragments apart. At present the parser merges each one into
> the tree as soon as it is parsed.
> 
> Add a struct fragment to hold one of these, functions to build one, to
> append it to a list and to free it, and a list of them in struct dt_info
> 
> These are not used yet.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  dtc.h      | 47 ++++++++++++++++++++++++++++++++++++++++++
>  livetree.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 107 insertions(+)
> 
> diff --git a/dtc.h b/dtc.h
> index 473552e..c0d8e8f 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -322,12 +322,59 @@ struct reserve_info *chain_reserve_entry(struct reserve_info *first,
>  struct reserve_info *add_reserve_entry(struct reserve_info *list,
>  				       struct reserve_info *new);
>  
> +/*
> + * A fragment is one top-level part of a dts file, after the header and any
> + * memory reservations: the root node, a later definition of a node which
> + * refers to it by label or path, or a /delete-node/ or /omit-if-no-ref/ with
> + * a reference. Fragments are kept apart until they are merged into a single
> + * tree.
> + *
> + * This is not the same as an overlay fragment (a fragment@N node), although
> + * in a plugin a fragment may become one when it is merged.
> + */
> +
> +enum fragment_type {
> +	FRAGMENT_ROOT,		/* / { ... }; */
> +	FRAGMENT_REF,		/* [label:] &ref { ... }; */
> +	FRAGMENT_DELETE_NODE,	/* /delete-node/ &ref; */
> +	FRAGMENT_OMIT_IF_NO_REF, /* /omit-if-no-ref/ &ref; */
> +};
> +
> +/*
> + * Which fields are used depends on the type:
> + *
> + *   FRAGMENT_ROOT            node
> + *   FRAGMENT_REF             ref, path_ref, ref_srcpos and node, plus label
> + *                            and label_srcpos if there is a label
> + *   FRAGMENT_DELETE_NODE     ref, path_ref and ref_srcpos
> + *   FRAGMENT_OMIT_IF_NO_REF  ref, path_ref and ref_srcpos
> + *
> + * Unused fields are NULL or false.
> + */
> +struct fragment {
> +	enum fragment_type type;
> +	char *ref;			/* label or path referred to */
> +	bool path_ref;			/* ref is a path, i.e. &{...} */
> +	struct srcpos *ref_srcpos;	/* position of ref */
> +	char *label;			/* label to add to the target */
> +	struct srcpos *label_srcpos;	/* position of label */
> +	struct node *node;		/* the node definition */
> +
> +	struct fragment *next;		/* NULL at the end of the list */
> +};
> +
> +struct fragment *build_fragment(enum fragment_type type, struct node *node);
> +struct fragment *build_fragment_ref(char *ref, bool path_ref,
> +				    struct srcpos *srcpos);
> +struct fragment *append_fragment(struct fragment *list, struct fragment *new);
> +void free_fragment(struct fragment *f);
>  
>  struct dt_info {
>  	unsigned int dtsflags;
>  	struct reserve_info *reservelist;
>  	uint32_t boot_cpuid_phys;
>  	struct node *dt;		/* the device tree */
> +	struct fragment *fragments;	/* not yet merged into dt */

Why to we need the fragment list in struct dt_info ?

This list is a temporary list built_dt_info() could have the list as parameter and
handle it leading to the struct node *dt fully updated.

Other function using the struct dt_info should never see the temporary fragment 
list and so, IMHO, there is no reason to store it in the struct dt_info.

Best regards,
Hervé
