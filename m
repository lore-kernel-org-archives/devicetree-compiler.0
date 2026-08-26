Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32ED40B6F9
	for <devicetree-compiler@vger.kernel.org>; Wed, 26 Aug 2026 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760001; cv=none; b=eDk9Hb9iGcCa9gtwSD0OMgWQzC9stBZrGqVUQ1RELTQGzsbR6HSsYKmKgCSVvlWvQIOoOp+Te9BsQwJId6ec+n9TKOIUBEPnavjTyyxiQ3dYFm27doJQEJljeodYRLIrpkYJO38cd+tnacGG/ayYwbweznSo/gWQrbiGRfSY5zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760001; c=relaxed/simple;
	bh=sdj1iroW4e+HahRZ/8hvQQFBmaxGmUw1cfOKUnCW5Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdH9Kv4Z2qerptkdq/Wx2E7n7OG8TM8PDqbT59W5G8Aby6NBic3TpC44mZ01mtTCuvEwGx5pa/0DYJ9xYaL9I9SLNQK/rPQ0rWr2zSVTqfxeK/yP0NcDrmjExOKG02FySjyEIzJ7pwbt7VyOY2W1G9bRBQFBhoZhCgP+wloHpjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pG3mqy+f; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pG3mqy+f"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E4EBA4E413C7;
	Wed, 26 Aug 2026 15:59:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5591604EC;
	Wed, 26 Aug 2026 15:59:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB9C011C7835E;
	Wed, 26 Aug 2026 17:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787759995; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uxcoAlJ4L5u3q+0187sy6WtUjeUa64OA+aFJjTJqHBg=;
	b=pG3mqy+frjhZsY0bOxJpb1gg65sdXop6KmUXKMptDX3YKcNuGP7R4zWN+fZ/DvsPo++ElX
	MVqFpkcL5ZLooDMIQepAbOrHrVwgwJ/+cln0rwCH40JjQO/i6bl2QZ+cHsj76Pn2yOYdgO
	htF2UncxStqUK7JL3PvE50uVTVreSPIXFPTmwoy5CGipBRMSYp8lgfw9xcfMy91tzUNTh2
	NtivAlwLnH8McXsttMBkb1Ph/rchNzcvWf6JJ0wtdL6510VZfm1ZiaytFtyvZbgK3hi8gK
	gZSjGZWXRA0QF6Czr9kmp4X2+1xMuSttXmPbWpPTSFEFTkbjomWEv6uuze8Cjw==
Date: Wed, 26 Aug 2026 17:59:50 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] libfdt: Find a node's parent in a single pass
Message-ID: <20260826175950.4e27a241@bootlin.com>
In-Reply-To: <20260806191321.2476810-1-sjg@chromium.org>
References: <20260806191321.2476810-1-sjg@chromium.org>
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

Hi Simon,

On Thu,  6 Aug 2026 13:13:14 -0600
Simon Glass <sjg@chromium.org> wrote:

> fdt_parent_offset() walks the whole tree from the root twice: once
> inside fdt_node_depth() to discover the node's depth, then again in
> fdt_supernode_atdepth_offset() to find the ancestor one level up.
> Both walks are O(nodes before the target), so a parent lookup costs
> twice what it needs to.
> 
> Walk the tree once instead, remembering the most recent node seen at
> each depth. On reaching the target node its parent is the last node
> seen one level up. Trees deeper than the tracked limit fall back to
> the existing code.
> 
> The single pass needs an int per level of depth, so it costs that
> much stack. FDT_PARENT_MAX_DEPTH sets the limit, in the same way as
> FDT_ASSUME_MASK: 32 by default, which no real tree approaches, and
> lower where stack is tight. Setting it to 0 leaves the single-pass
> code out altogether, for callers who would rather have the smaller
> build.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  libfdt/fdt_ro.c          | 32 +++++++++++++++-
>  libfdt/libfdt_internal.h | 14 +++++++
>  tests/parent_offset.c    | 79 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 124 insertions(+), 1 deletion(-)
> 
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 11f2e2e..b84669a 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -674,7 +674,37 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
>  
>  int fdt_parent_offset(const void *fdt, int nodeoffset)
>  {
> -	int nodedepth = fdt_node_depth(fdt, nodeoffset);
> +#if FDT_PARENT_MAX_DEPTH
> +	int supernode[FDT_PARENT_MAX_DEPTH];
> +	int offset, depth;
> +#endif
> +	int nodedepth;
> +
> +#if FDT_PARENT_MAX_DEPTH
> +	FDT_RO_PROBE(fdt);
> +
> +	/*
> +	 * Walk the tree once, remembering the most recent node seen at each
> +	 * depth. On reaching the target node, its parent is the last node
> +	 * seen one level up
> +	 *
> +	 * The depth goes negative once the walk moves past the root, which
> +	 * happens when nodeoffset does not name a node. Fall back in that
> +	 * case, so that the checks below reject it
> +	 */
> +	for (offset = 0, depth = 0;
> +	     offset >= 0 && offset <= nodeoffset;
> +	     offset = fdt_next_node(fdt, offset, &depth)) {
> +		if (depth < 0 || depth >= FDT_PARENT_MAX_DEPTH)
> +			break;
> +		supernode[depth] = offset;
> +		if (offset == nodeoffset)
> +			return depth ? supernode[depth - 1] :
> +				-FDT_ERR_NOTFOUND;
> +	}
> +#endif /* FDT_PARENT_MAX_DEPTH */
> +
> +	nodedepth = fdt_node_depth(fdt, nodeoffset);
>  
>  	if (nodedepth < 0)
>  		return nodedepth;
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 0e103ca..eefea2a 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -85,6 +85,20 @@ static inline uint64_t fdt64_ld_(const fdt64_t *p)
>  #define FDT_ASSUME_MASK 0
>  #endif
>  
> +/*
> + * Maximum node depth for which fdt_parent_offset() finds a node's parent in
> + * a single pass over the tree. Deeper nodes fall back to walking the tree
> + * twice, which is correct but slower.
> + *
> + * The single pass needs an int for each level, so this costs that much
> + * stack. Reduce it if that matters more than the speed; no real device tree
> + * comes close to the default. Set it to 0 to leave out the single-pass code
> + * altogether, for the smallest build.
> + */
> +#ifndef FDT_PARENT_MAX_DEPTH
> +#define FDT_PARENT_MAX_DEPTH 32
> +#endif
> +
>  /*
>   * Defines assumptions which can be enabled. Each of these can be enabled
>   * individually. For maximum safety, don't enable any assumptions!
> diff --git a/tests/parent_offset.c b/tests/parent_offset.c
> index a935a53..9850f31 100644
> --- a/tests/parent_offset.c
> +++ b/tests/parent_offset.c
> @@ -56,6 +56,82 @@ static void check_path(struct fdt_header *fdt, const char *path)
>  		     parentoffset, parentpathoffset);
>  }
>  
> +/*
> + * Check that an offset which does not name a node never yields a parent.
> + * Sweep the whole blob, plus a little either side of it
> + */
> +static void check_bad_offsets(struct fdt_header *fdt)
> +{
> +	int offset, size = fdt_totalsize(fdt);
> +
> +	for (offset = -8; offset < size + 64; offset++) {
> +		int parentoffset;
> +
> +		if (fdt_get_name(fdt, offset, NULL))
> +			continue;	/* a real node, checked elsewhere */
> +
> +		parentoffset = fdt_parent_offset(fdt, offset);
> +		if (parentoffset >= 0)
> +			FAIL("fdt_parent_offset(%d) returns %d for an offset "
> +			     "which is not a node", offset, parentoffset);
> +	}
> +}
> +
> +#define DEEP_SPACE	65536
> +#define DEEP_LEVELS	40
> +
> +#define CHECK(code) \
> +	do { \
> +		int err_ = (code); \
> +		if (err_) \
> +			FAIL(#code ": %s", fdt_strerror(err_)); \
> +	} while (0)
> +
> +/*
> + * Check a tree deeper than fdt_parent_offset() may track in one pass, so
> + * that both it and the fallback for deeper nodes are covered
> + */
> +static void check_deep_tree(void)
> +{
> +	int seen[DEEP_LEVELS + 1];
> +	int offset, depth, level;
> +	void *fdt = malloc(DEEP_SPACE);
> +
> +	if (!fdt)
> +		FAIL("malloc()");
> +
> +	CHECK(fdt_create(fdt, DEEP_SPACE));
> +	CHECK(fdt_finish_reservemap(fdt));
> +	CHECK(fdt_begin_node(fdt, ""));
> +	for (level = 0; level < DEEP_LEVELS; level++)
> +		CHECK(fdt_begin_node(fdt, "node"));
> +	for (level = 0; level < DEEP_LEVELS; level++)
> +		CHECK(fdt_end_node(fdt));
> +	CHECK(fdt_end_node(fdt));
> +	CHECK(fdt_finish(fdt));

The blob used for tests and built here could be improved.

Indeed, it is composed of only one branch:
--- 8< ---
node {
   node {
     node {
       ...
     };
   };
};
--- 8< ---

At a given level, only one node is present.

IMHO, this could be improved in order to have more branches. For instance,
something like this:
--- 8< ---
node {
   node1 {
     node-a{
       ...
     };
   };
   node2 {
     node-b {
       ...
     };
  };
};
--- 8< ---

This allows to check that with several nodes at the same level, the parent
of nodes and sub-nodes are correct.

With given example,
- the parent of node-b must be node2
- the parent of node-a must be node1
- the parent of node1 must be node
- the parent of node2 must be node

Best regards,
Hervé
