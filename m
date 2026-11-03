Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725678;
	b=AOnewXVFYPW/zpk6u9c1PtV0iVnEWnJDE92y1Bz6dxnL8wCN0NxOf9ReibuLmKnRAzoT
	 +wSpU5Idm58RklwaruMwvHyxtDr01rAnarLtRt1uAUy4/5acUTvjVonaZSIVjJhqflIA7
	 lM6G/GhUxWlhxyMMUZnwE+zkujrkKCiu0CswcXOH7K8cpl6OAd4y79aXpF3hFEkJzLfpL
	 xPp8qmTwzFDrJCta27TDc7bN7M3b0AxIgKwIt9YcVxj1H9onjkffL/J8BcRuToMldCkDI
	 ll+KDbL+mfvHVB0KpvNnj6A8Qs0KTDoBhOabJmdKkkHa5B16eVvtSqQHdSYgAgp+oVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725678;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=90mqcFh6O97o/JE+B1l1X2BfcACbaFX95ayJnc1+EF4=;
	b=AuClxUGj5tSr4i9J09YM62s4lg4GazHgtRWzXz/Bz6qIRsKiEgjyDTPKpts+yfaMHE8Q
	 jXPlyr8TrA0/buwvKcTRHS2hWipDN2lacpoFP3T/EECtMWR+8SBpxopY9a4ftHL+DH1KR
	 FFTsij0WOvK0SfyvUnzcNuPIdqPXdPbx0e4QsMlZoZsozH+gZeEtZnnG4khEzeeyiUcRV
	 WxlCUQ0cPqtMKGcmVt9Q9QZrWxQ35a+cskUsG2oMdmaTsqYFvwWuxrsgaHhbCWRtWUG1l
	 ZFzgemBCO8cWoTo6F5lStzY1t9KwtOaISzlKupdCQTXookraGQsjZeMRdufkvAS1pfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="nc1G/4kN";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C255606A32D
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 17:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C255606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nc1G/4kN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6E7ACC49F46
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 17:08:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE4EA6046C;
	Tue,  3 Nov 2026 17:07:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 112F310329123;
	Tue,  3 Nov 2026 18:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793725674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=90mqcFh6O97o/JE+B1l1X2BfcACbaFX95ayJnc1+EF4=;
	b=nc1G/4kNTG2vURpjE0oj+Ovr5+vgUPp3UrWKt/XV62j9zC3PdmySfeg5M+0yKvC2wRpNLd
	/0xehbhCXbw8Fp2kPYcPd/56ZvweCULr9IS27gaL7/ExXfDF8RpYTVAepGZd5MieDG5fSB
	MnRVDI+XM/toe621ct5UBGbOCjAtPZdEC0ULbXWqkZD3znBtslvwi/pp8i7cj3zZ5XQACB
	5hJQZn9/btm5JHqbl1oApYjbP3AtzE15+88AWJFlaz4mQdNIo0aixnyvWcZmA65jrURTlS
	vQkyFcHeSX5BD25VGUXXwdjyjdPRj60l9BygVdazSnGXNXHPUcG8wJhCqDdBSw==
Date: Tue, 3 Nov 2026 18:07:53 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 12/13] dtc: Merge the fragments of a dts file after
 parsing
Message-ID: <20261103180753.37c83a4c@bootlin.com>
In-Reply-To: <20261101163721.2458982-13-sjg@chromium.org>
References: <20261101163721.2458982-1-sjg@chromium.org>
	<20261101163721.2458982-13-sjg@chromium.org>
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

On Sun,  1 Nov 2026 09:37:06 -0700
Simon Glass <sjg@chromium.org> wrote:

> We would like to deal with each top-level fragment of a dts file before
> it is merged into the tree, but that requires the fragments to be kept
> apart until the whole file is parsed. At present the parser merges each
> one as soon as it is parsed. The grammar actions also need to know
> whether the file is a plugin, which they find using $<flags>-1
> 
> Have the grammar build a list of the fragments instead, in source order,
> and merge them with a new merge_fragments() once the whole file is
> parsed. This calls merge_fragment() for each one, so the output does not
> change, and frees each fragment once it is merged.
> 
> The $<flags>-1 term is no longer needed. Within a devicetree action it
> reaches back up the parser stack to the value of headers, i.e. the flags
> from /dts-v1/ and /plugin/. The sourcefile action passes the same value
> to build_dt_info(), which stores it in dti->dtsflags, so
> merge_fragments() can use that instead.
> 
> There are two differences in the errors. A syntax error later in the
> file now stops dtc before any earlier reference errors are reported, and
> reference errors now come after any other errors which the parser
> reports, such as a division by zero, rather than in source order.
> 
> dtc gives the same output and messages as before for all 4162 .dts and
> .dtso files in Linux v7.3-12284-g3799eeb906c9, and for the dts files in
> tests/
> 
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractus.seuss/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  dtc-parser.y | 43 +++++++++++++------------------------------
>  dtc.h        |  2 +-
>  livetree.c   | 36 ++++++++++++++++++++++++++++++++++--
>  3 files changed, 48 insertions(+), 33 deletions(-)
> 
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 1ed9731..c1aa4ad 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -24,22 +24,6 @@ extern void yyerror(char const *s);
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
>  
> -/*
> - * Merge a fragment into the tree as soon as it is parsed. The flags come
> - * from the actions using $<flags>-1, which relies on the rule being always:
> - *   headers memreserves devicetree
> - * so $-1 is the value of headers
> - */
> -static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
> -					  unsigned int flags)
> -{
> -	if (merge_fragment(&dt, f, flags & DTSF_PLUGIN))
> -		treesource_error = true;
> -	free_fragment(f);
> -
> -	return dt;
> -}
> -
>  %}
>  
>  %union {
> @@ -94,7 +78,7 @@ static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
>  %type <labelref> dt_ref
>  %type <fragment> fragment_ref
>  
> -%type <node> devicetree
> +%type <fragment> devicetree
>  %type <node> nodedef
>  %type <node> subnode
>  %type <nodelist> subnodes
> @@ -119,8 +103,10 @@ static struct node *merge_parsed_fragment(struct node *dt, struct fragment *f,
>  sourcefile:
>  	  headers memreserves devicetree
>  		{
> -			parser_output = build_dt_info($1, $2, $3,
> -			                              guess_boot_cpuid($3));
> +			parser_output = build_dt_info($1, $2, NULL, 0);
> +			parser_output->fragments = $3;
> +			if (merge_fragments(parser_output))
> +				treesource_error = true;

Why not just pass the fragment list to build_dt_info() instead of using the 
parser_output->fragments and later in merge_fragments() setting this same field
to NULL once the merge is done?

IHMO, the struct dt_info doesn't need the fragments fiels (already mentionned
in patch 2).

If build_dt_info() has too much parameters, a struct dt_info_def could be
created to group all those parameters in one structure.

>  		}
>  	;
>  
> @@ -184,42 +170,39 @@ fragment_ref:
>  devicetree:
>  	  '/' nodedef
>  		{
> -			struct fragment *f = build_fragment(FRAGMENT_ROOT, $2);
> -
> -			$$ = merge_parsed_fragment(NULL, f, $<flags>-1);
> +			$$ = build_fragment(FRAGMENT_ROOT, $2);
>  		}
>  	| devicetree '/' nodedef
>  		{
> -			struct fragment *f = build_fragment(FRAGMENT_ROOT, $3);
> -
> -			$$ = merge_parsed_fragment($1, f, $<flags>-1);
> +			$$ = append_fragment($1, build_fragment(FRAGMENT_ROOT,
> +								$3));
>  		}
>  	| fragment_ref nodedef
>  		{
>  			$1->node = $2;
> -			$$ = merge_parsed_fragment(NULL, $1, $<flags>-1);
> +			$$ = $1;
>  		}
>  	| devicetree DT_LABEL fragment_ref nodedef
>  		{
>  			$3->label = $2;
>  			$3->label_srcpos = srcpos_copy(&@2);
>  			$3->node = $4;
> -			$$ = merge_parsed_fragment($1, $3, $<flags>-1);
> +			$$ = append_fragment($1, $3);
>  		}
>  	| devicetree fragment_ref nodedef
>  		{
>  			$2->node = $3;
> -			$$ = merge_parsed_fragment($1, $2, $<flags>-1);
> +			$$ = append_fragment($1, $2);
>  		}
>  	| devicetree DT_DEL_NODE fragment_ref ';'
>  		{
>  			$3->type = FRAGMENT_DELETE_NODE;
> -			$$ = merge_parsed_fragment($1, $3, $<flags>-1);
> +			$$ = append_fragment($1, $3);
>  		}
>  	| devicetree DT_OMIT_NO_REF fragment_ref ';'
>  		{
>  			$3->type = FRAGMENT_OMIT_IF_NO_REF;
> -			$$ = merge_parsed_fragment($1, $3, $<flags>-1);
> +			$$ = append_fragment($1, $3);
>  		}
>  	;
>  
> diff --git a/dtc.h b/dtc.h
> index 41013f5..fdd0d75 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -368,7 +368,6 @@ struct fragment *build_fragment_ref(char *ref, bool path_ref,
>  				    struct srcpos *srcpos);
>  struct fragment *append_fragment(struct fragment *list, struct fragment *new);
>  void free_fragment(struct fragment *f);
> -bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin);
>  
>  struct dt_info {
>  	unsigned int dtsflags;
> @@ -386,6 +385,7 @@ struct dt_info {
>  struct dt_info *build_dt_info(unsigned int dtsflags,
>  			      struct reserve_info *reservelist,
>  			      struct node *tree, uint32_t boot_cpuid_phys);
> +bool merge_fragments(struct dt_info *dti);
>  void sort_tree(struct dt_info *dti);
>  void generate_labels_from_tree(struct dt_info *dti, const char *name);
>  void generate_label_tree(struct dt_info *dti, const char *name, bool allocph);
> diff --git a/livetree.c b/livetree.c
> index 1e012d4..68ad3c3 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -537,7 +537,8 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  	dti->fragments = NULL;
>  	dti->boot_cpuid_phys = boot_cpuid_phys;
>  
> -	fill_fullpaths(dti->dt, "");
> +	if (tree)
> +		fill_fullpaths(dti->dt, "");
>  
>  	return dti;
>  }
> @@ -718,7 +719,8 @@ static bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
>   *
>   * Returns true if there is an error, which has been reported.
>   */
> -bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
> +static bool merge_fragment(struct node **dtp, struct fragment *f,
> +			   bool plugin)
>  {
>  	struct node *dt = *dtp;
>  
> @@ -750,6 +752,36 @@ bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
>  	return false;
>  }
>  
> +/*
> + * Merge the fragments of a dts file into a single tree, in source order.
> + *
> + * Returns true if there are errors, which have been reported.
> + */
> +bool merge_fragments(struct dt_info *dti)
> +{
> +	bool plugin = dti->dtsflags & DTSF_PLUGIN;
> +	struct fragment *f, *next;
> +	struct node *dt = NULL;
> +	bool error = false;
> +
> +	if (!dti->fragments)
> +		return false;
> +
> +	for (f = dti->fragments; f; f = next) {
> +		next = f->next;
> +		if (merge_fragment(&dt, f, plugin))
> +			error = true;
> +		free_fragment(f);
> +	}
> +
> +	dti->dt = dt;
> +	dti->fragments = NULL;

This field is really a temporary field. Should be removed from the
struct dt_info.


> +	dti->boot_cpuid_phys = guess_boot_cpuid(dt);
> +	fill_fullpaths(dti->dt, "");

fill_fullpaths() should be called only once in build_dt_info() as well as
setting dti->boot_cpuid_phys.

They have nothing to do with fragments.

> +
> +	return error;
> +}
> +
>  /*
>   * Tree accessor functions
>   */

Best regards,
Hervé
