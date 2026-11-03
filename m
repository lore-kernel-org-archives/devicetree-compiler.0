Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726631;
	b=fG0Bs7Vib9syyfZbDAFpdQ8JGH+ahph+DhBK6nRblYpbzaxULJXJ0EmhPl69ui+NAqBF
	 274oNavvkF6OF8xErH2dZJcwcFZDDzpt4RT/OUzy156QblW90xdFOlwK+7b35qI+/84VW
	 molHuQfFo5xd0mGYJIDkwSHzAYMqtdyit4w35meR/YNmkQJsqwxzxMfT9CQpDLs6rIwZI
	 JHPn4GLvmIjChHBFfuP0HhgwpawqGIK16DNpIOeIxN1PdZYXE3W+DOaPpOBc4yMda9l+s
	 tarJp8IwEdp59W+sP2hSyhIeI4CwvYfzPoJJaSfLtDTVwzEw70E7Zo/THZy3lsFz5BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726631;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=Vx8eGQ7XXQPX5m3x2xgz8vrt1phmilIOxiXQuIPRHBs=;
	b=e7HgYyTUMe++b/9WT/AHU1Psk+ivnB4rjnv6jvpnh0NBipw5ObbC4ViHDOieQEs52T9q
	 QItMAQJqLZgOtBy1J9kS/HfRk8xcw17gnWB/0vkRMPtyM5q87+3xOubcfS9XJESpz0U+3
	 OWHPp2V01zgUWdSjliVXptt5QvGj+uu285t17UNsEW50UOQjbOBqTJMD80MW3NRlgsmSA
	 5Hpfpct/WvmeUKS/fv0XtMPrBOSRt/+MzLB47MKSQ0G0EwvPSg6I9pVVDqnDNXj/rMzzr
	 ToOrsK0TjjPrL8kwkfRDpSEWkBtR7gaTnNrJNnR5hBpRoE/5wymqz5FGx7TgEVUz4dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=t9ri3PTH;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90343606A32E
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 17:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90343606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=t9ri3PTH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 917C3C49F46;
	Tue,  3 Nov 2026 17:24:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D843A6046C;
	Tue,  3 Nov 2026 17:23:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D02F710329123;
	Tue,  3 Nov 2026 18:23:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793726627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vx8eGQ7XXQPX5m3x2xgz8vrt1phmilIOxiXQuIPRHBs=;
	b=t9ri3PTH1HC8xxzzvVog3XZ70vw/ALN8g326st9q0VMFXx5VxYsxhn95wWfdzLHGVBO+3K
	cE/lABplmVE5mExCoCLRbDB5tyBg4ixzgvyk+CH+4Qf6iPlf7x7KPvKw8whTXX8mcizeC9
	BPu5l0FfomGFZM+wW/wirVBvkIaiG4D5kdyN4++n5+jz0N2fofmKxmSa7INx5jD6knn/dg
	RB31TAEpWBWmc08oIb8M8ZlAH5zC3c2DklwpeFHSAywnm34kcbu8ea6tmONvoMSk9Aywni
	VLnLuONdVdXAg+0RMBGoPswirm+MMovZxU2KfLXL0vmVeWtGRCO23N45AvFqyw==
Date: Tue, 3 Nov 2026 18:23:44 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 11/13] dtc: Add helpers for the errors when merging a
 fragment
Message-ID: <20261103182344.4c9c488e@bootlin.com>
In-Reply-To: <20261101163721.2458982-12-sjg@chromium.org>
References: <20261101163721.2458982-1-sjg@chromium.org>
	<20261101163721.2458982-12-sjg@chromium.org>
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

On Sun,  1 Nov 2026 09:37:05 -0700
Simon Glass <sjg@chromium.org> wrote:

> Four of the merge functions look up the node which a fragment refers to
> and report 'Label or path not found' if it is missing, and three check
> for a label-relative reference in a plugin. Each of these has its own
> copy of the error, so a change to a message or its position must be made
> in several places.
> 
> Add lookup_ref() to look up the node, reporting an error if it is not
> found, and check_relative_ref() to report a label-relative reference.
> Use these in the merge functions.
> 
> The output does not change.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  livetree.c | 90 +++++++++++++++++++++++++++++-------------------------
>  1 file changed, 49 insertions(+), 41 deletions(-)
> 
> diff --git a/livetree.c b/livetree.c
> index 6a290fb..1e012d4 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -548,6 +548,40 @@ static bool is_ref_relative(const char *ref)
>  	return ref[0] != '/' && strchr(&ref[1], '/');
>  }
>  
> +/*
> + * Report an error at pos if a fragment uses a label-relative reference, which
> + * a plugin does not support
> + *
> + * Returns true if there is an error
> + */
> +static bool check_relative_ref(struct fragment *f, struct srcpos *pos)
> +{
> +	if (!is_ref_relative(f->ref))
> +		return false;
> +	srcpos_error(pos, "Error",
> +		     "Label-relative reference %s not supported in plugin",
> +		     f->ref);

You suppose that srcpos is valid and so this function and remaining ones are
be called only from dt_from_source() with the parsing done by dtc-parser.y.

Not sure that this is a good assumption for the future.

IHMO, it will be better to decouple those functions from the type of parsing
or just add a simple 'if (pos)' before calling srcpos_error().

Best regards,
Hervé

> +
> +	return true;
> +}
> +
> +/*
> + * Look up the node which a fragment refers to, reporting an error if it is
> + * not found
> + *
> + * Returns the node, or NULL if it is not found
> + */
> +static struct node *lookup_ref(struct node *dt, struct fragment *f)
> +{
> +	struct node *target = get_node_by_ref(dt, f->ref);
> +
> +	if (!target)
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +
> +	return target;
> +}
> +
>  /*
>   * Make the tree at *dtp from a first fragment which refers to a label or path,
>   * rather than being the root node. This is only valid in a plugin, where the
> @@ -557,17 +591,14 @@ static bool is_ref_relative(const char *ref)
>   */
>  static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
>  {
> -	bool error = false;
> +	bool error;
>  
> -	if (!plugin) {
> +	if (plugin) {
> +		error = check_relative_ref(f, f->node->srcpos);
> +	} else {
>  		srcpos_error(f->node->srcpos, "Error",
>  			     "Label or path %s not found", f->ref);
>  		error = true;
> -	} else if (is_ref_relative(f->ref)) {
> -		srcpos_error(f->node->srcpos, "Error",
> -			     "Label-relative reference %s not supported in plugin",
> -			     f->ref);
> -		error = true;
>  	}
>  	/* Make a new, empty tree with a fragment@N node for the reference */
>  	*dtp = add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
> @@ -584,20 +615,12 @@ static bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
>   */
>  static bool merge_labelled_ref(struct node *dt, struct fragment *f, bool plugin)
>  {
> -	struct node *target = get_node_by_ref(dt, f->ref);
> -	bool error = false;
> +	struct node *target;
> +	bool error = plugin && check_relative_ref(f, f->label_srcpos);
>  
> -	if (plugin && is_ref_relative(f->ref)) {
> -		srcpos_error(f->label_srcpos, "Error",
> -			     "Label-relative reference %s not supported in plugin",
> -			     f->ref);
> -		error = true;
> -	}
> -	if (!target) {
> -		srcpos_error(f->ref_srcpos, "Error",
> -			     "Label or path %s not found", f->ref);
> +	target = lookup_ref(dt, f);
> +	if (!target)
>  		return true;
> -	}
>  	add_label(&target->labels, f->label);
>  	merge_nodes(target, f->node);
>  
> @@ -615,26 +638,17 @@ static bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin)
>  	struct node *target;
>  
>  	if (plugin) {
> -		bool error = false;
> +		bool error = check_relative_ref(f, f->ref_srcpos);
>  
> -		if (is_ref_relative(f->ref)) {
> -			srcpos_error(f->ref_srcpos, "Error",
> -				     "Label-relative reference %s not supported in plugin",
> -				     f->ref);
> -			error = true;
> -		}
>  		/* Add a fragment@N node which applies the node at the path */
>  		add_orphan_node(dt, f->node, f->ref);
>  
>  		return error;
>  	}
>  
> -	target = get_node_by_ref(dt, f->ref);
> -	if (!target) {
> -		srcpos_error(f->ref_srcpos, "Error",
> -			     "Label or path %s not found", f->ref);
> +	target = lookup_ref(dt, f);
> +	if (!target)
>  		return true;
> -	}
>  	merge_nodes(target, f->node);
>  
>  	return false;
> @@ -672,13 +686,10 @@ static bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin)
>   */
>  static bool merge_delete_node(struct node *dt, struct fragment *f)
>  {
> -	struct node *target = get_node_by_ref(dt, f->ref);
> +	struct node *target = lookup_ref(dt, f);
>  
> -	if (!target) {
> -		srcpos_error(f->ref_srcpos, "Error",
> -			     "Label or path %s not found", f->ref);
> +	if (!target)
>  		return true;
> -	}
>  	delete_node(target);
>  
>  	return false;
> @@ -692,13 +703,10 @@ static bool merge_delete_node(struct node *dt, struct fragment *f)
>   */
>  static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
>  {
> -	struct node *target = get_node_by_ref(dt, f->ref);
> +	struct node *target = lookup_ref(dt, f);
>  
> -	if (!target) {
> -		srcpos_error(f->ref_srcpos, "Error",
> -			     "Label or path %s not found", f->ref);
> +	if (!target)
>  		return true;
> -	}
>  	omit_node_if_unused(target);
>  
>  	return false;



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
