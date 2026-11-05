Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869649;
	b=1rByGcSy9EtixZZAPifzuU2MfLxrITnljv+Xvuov4fSwgQlQfcbLnwrIXOqpB/lEKeW2
	 Si9Sp5KxxkdGR2hWgWcqtWveTzWcQycd2pBnbxO+cS07Jk4RxCcsYpkWtuj2iecudgWYA
	 M6x3taEMewftsPbLf0ybvsyNuC3iro4EYuXg+Pxy/D5hyP54Mvs0kIewEmTSJon7WMeoi
	 ZyAYRhmlXrPalieqQuQdP3XvRopRs9Z7w/wYS1FJ8lJF+mQg8pzsMISEvFo5RxeGc3+4B
	 VyTl4WFtyQP938nvSdKy16sM8dHowiU+VyYPSQsjpkzMR+QxQ/1u2M0K3ITctBT7nCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869649;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=wAQlmHNNEzaEBWY3G0XKXUuYexHUttuEMeVFbj6hNhI=;
	b=RZCJOaUNlmWJTByw8vek3nj1r6FCmItLsFnFUFTi6RCuxNPKAxHY6JRESR4j250Kfzf5
	 lgjXMyBNoRNhelDzZZseh5KyGQvOAZ77Hp6lRvYHujPp8fY9UiueAJJBF8JBBjH7FTQ/T
	 ZtycbBKOncBoqy8erV/mTbPpebvwdvWn8EU7kbT52oWYg21QMSqLpl1i/P3O45YfMTJ10
	 DFXFYb+ZIuVFEJ/+Nho3LBx7JES9ObARS00Z2/iIseGcf68nwEZgiDv3EGvK1ZN+Vql7R
	 so1fnTItJfyRZnHtt1buV+CunaoeufbUGUZzTGZNiWiUNLoeUUtDS3Ywl/WC1v6kr/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FeFffb+A;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81019606A31B
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Nov 2026 09:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81019606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FeFffb+A
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D04C8C69155
	for <devicetree-compiler@vger.kernel.org>; Thu,  5 Nov 2026 09:07:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B26795FF85;
	Thu,  5 Nov 2026 09:07:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AB9F103291D2;
	Thu,  5 Nov 2026 10:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793869638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wAQlmHNNEzaEBWY3G0XKXUuYexHUttuEMeVFbj6hNhI=;
	b=FeFffb+A/TRRSqdQcVcl/YTM9lDGzXIsXygyjB2gEyNzjPYC6kkmL2DdGOD1UjLGMLuyD/
	zrW3yCO1gqYKPnHrdqkV3fouxMdASGZZXv6zypmxSWkf0uu2f/JnXkzzKdazTsoQySPT5b
	nLuV+OuunbGjx8HQtJnZSzOe8vlvkmG7fTYtaHZG+Ro47MnX2IE7SkH9VVOLNF+01OlroK
	MvPu8c0pgHZsHkT+B41DQQ49jsRL71qN4PJR84Vs0dIUtQLwv0+lJuiTMm9F3uEQ5wSPX6
	vZBXKKWSfXE5xPO+DygJ+0I+5JqayBuLKQeEBt0SvE1pvNNAPGj44ZSLPx+UfA==
Date: Thu, 5 Nov 2026 10:07:14 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 07/15] dtc: Move label-reference handling out of the
 grammar
Message-ID: <20261105100714.47bf0434@bootlin.com>
In-Reply-To: <20261104211807.972610-8-sjg@chromium.org>
References: <20261104211807.972610-1-sjg@chromium.org>
	<20261104211807.972610-8-sjg@chromium.org>
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

Hi David, Simon,

On Wed,  4 Nov 2026 14:17:46 -0700
Simon Glass <sjg@chromium.org> wrote:

> The grammar action for a top-level &label { ... } holds its merge logic,
> including making an overlay fragment in a plugin when the label is not
> found.
> 
> Move it into a new merge_ref(), passing it a struct fragment for the
> reference and node.
> 
> The output does not change.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Rename merge_label_ref() to merge_ref()
> - Build the fragment in one step, with build_fragment_ref()
> - Return true on success from merge_ref()
> - Check the fragment type with assert()
> 
>  dtc-parser.y | 23 +++++++++--------------
>  dtc.h        |  1 +
>  livetree.c   | 26 ++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 14 deletions(-)
> 
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 9b9b6db..c58a66d 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -214,21 +214,16 @@ devicetree:
>  		}
>  	| devicetree DT_LABEL_REF nodedef
>  		{
> -			struct node *target = get_node_by_ref($1, $2);
> +			struct fragment *f;
>  
> -			if (target) {
> -				merge_nodes(target, $3);
> -			} else {
> -				/*
> -				 * We rely on the rule being always:
> -				 *   versioninfo plugindecl memreserves devicetree
> -				 * so $-1 is what we want (plugindecl)
> -				 */
> -				if ($<flags>-1 & DTSF_PLUGIN)
> -					add_orphan_node($1, $3, $2);
> -				else
> -					ERROR(&@2, "Label or path %s not found", $2);
> -			}
> +			f = build_fragment_ref(NULL, NULL, $2, &@2, $3);
> +			/*
> +			 * We rely on the rule being always:
> +			 *   versioninfo plugindecl memreserves devicetree
> +			 * so $-1 is what we want (plugindecl)
> +			 */
> +			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error = true;
>  			$$ = $1;
>  		}
>  	| devicetree DT_DEL_NODE dt_ref ';'
> diff --git a/dtc.h b/dtc.h
> index 8c4d7bf..9b4389b 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -373,6 +373,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *ref,
>  struct fragment *append_fragment(struct fragment *list, struct fragment *new);
>  void free_fragment(struct fragment *f);
>  bool is_ref_relative(const char *ref);
> +bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
>  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
>  
> diff --git a/livetree.c b/livetree.c
> index 3ff4e14..179866d 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -573,6 +573,32 @@ bool is_ref_relative(const char *ref)
>  	return ref[0] != '/' && strchr(&ref[1], '/');
>  }
>  
> +/*
> + * Merge a fragment which refers to a label into the node with that label. In
> + * a plugin, a label which is not found becomes an overlay fragment.
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_ref(struct node *dt, struct fragment *f, bool plugin)
> +{
> +	struct node *target = get_node_by_ref(dt, f->ref);
> +
> +	assert(f->type == FRAGMENT_NODE);
> +	if (target) {
> +		merge_nodes(target, f->node);
> +		return true;
> +	}
> +	if (!plugin) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return false;
> +	}
> +	/* The label may be in the base tree, so add a fragment@N node for it */
> +	add_orphan_node(dt, f->node, f->ref);
> +
> +	return true;
> +}
> +

Even if this function is slightly modified in later patches, I think it mixes
two different operations:
 - Merging fragments
 - Converting fragments in overlay output format.

IHMO, those two operations should be fully decoupled.

merge_ref() or any other operation whose goal is to merge a fragment should
only merge fragment either in the existing root node or in a previous fragment
available in the fragment list.

add_orphan_node() should not be called from a merge_*() function related to
fragments.

After merging all fragment we should have a root node and/or a list of fragment
reduced to unmerged ones.

Base on that, the overlay conversion can be performed using a dedicated
function, out of merge_*() functions.

Something like this:
---- 8< ----
void convert_to_overlay_output_format(struct dt_info *dti)
{
	struct fragment *f;

	if (!dti->dt) {
		/* The root node is not present. Create an empty one */
		dti->dt = ...;
	}

	/*
	 * The fragment list have been previously merged.
	 * Available fragment left in the list are fragments
	 * that cannot be merged and so those fragments are
	 * orphan nodes.
	 *
	 * Convert those orphan nodes to the /fragment@N format overlay
	 * format.
	 */
	for (f = dti->fragments; f; f = next) {
		add_orphan_node(dti->dt, f->node, f->ref);
	
	/* Add __fixups__ and __local_fixups__ nodes ? */
	todo();
}

in main():

	/* Parse input */
	dti = dt_from_*();

	checks_pre_fragment_merge(dti);

	merge_fragments(dti); /* <--- Fragments are merged.
			       *      Remaining items in the fragment list, if
			       *      any are Orphan nodes (i.e. fragments that
			       *      couldn't be merged).
			       */

	checks_post_fragment_merge(dti); <--- Orphan ok for overlays but ko for !overlay dts
	
	/* Convert outputs */
	if (dti->dtsflags & DTSF_PLUGIN) {
		convert_to_overlay_output_format(dti);
		checks_overlay_format(dti);  /* <--- Not sure it is needed */ 
	}

	/* Generate output */
	dt_to_*();
}
--- 8< ---

Best regards,
Hervé
