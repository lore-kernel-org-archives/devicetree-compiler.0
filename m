Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359620;
	b=QUXx1rHigZSXPswnWvhls5x0gLNFtWDmvPpbXTe48hSTM8myhMI4mujyS01EJkgceyXt
	 ACVMyBPfLGPsLKTvwOry0PYYmYZzTNcHl2wZnnbvC+i0hV95dlWOm8SocvfbzZJAdU/Pv
	 SnmjN2OQH/1y1LMEcPGxb4NoFWP9Zb7Yy6i2hhwNawdtHr02wcPtgDHy8wyy5CYAqG+D3
	 BNfEvnSrz9F6JPe8a5Fwlv+GM+jgDmcnPp9Yhwn55nJ3I7KYeBSFf3tK30u+XBsWUslDt
	 sconwGkvRClGhcLc8JdT1ATQlO6GtXi80ULuxlDxiZIwkxG31zaBB0KjuTnL9QSSDvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359620;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=oOVIvUq+MLtoMez0BD6aNw0kifqnBVqbtOUoGuBbm4E=;
	b=Ydrm6Au7e7wDkiMYwUzNWVWMBNL/nXjDYhYOGeiXshi0SVn2ZFQYT9mrxVdGoIJDMh4q
	 VAUXMI3+DidYVuyu7g2oR7/sCgD0b7K/nohXDB5gy4skPzw0NRFFTUJgvTcLVd1ZyPmTu
	 SjMuawWSaB0SkPEifzzbmygRSE3RNj/HyEVUIVtw9SRqelTAP06oIAIIEsQl6YH06iMcM
	 gtNCak83IsMvkQYJ8aUBh9xx96iDSHAm7jHvcltNCumTcUGS2bwjqjufA+5q/JdNI7OIu
	 7vgRnCGRajPdZbf6VMKAZ0kr1OYFNpk4KzCj4ipUYzgBU73XleHIK0zPzQLxOUWjwWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=p+5w2lkm;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28045606A31D;
	Fri, 30 Oct 2026 11:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28045606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=p+5w2lkm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793359615;
	bh=oOVIvUq+MLtoMez0BD6aNw0kifqnBVqbtOUoGuBbm4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+5w2lkmPSNmBJvxhgzB0vP1DHNOj75ETPyKKDwhe3ssdyDFSzeLVblqJTAY7WhSA
	 t8Ht/UhernC8IGvZqtPxHMlEhrib5cr6+68eEDKx96LlszkX+qO8RKk0cFJwvUOTpH
	 +8TqFdjJO7Akb9j/rQ0SJsRhuPJSaRvIurYcWtAJ/dOTwyIQkBapHTH0mNuoAyiKJ8
	 sLLJoo0V1YRMgLF/3jyN+tGy0m1Z8X+efj3n/Bp1+TddVWXHjfiKMFWjwL1mXCKGGN
	 FcH7rdW+ivSOpBDMOE9FZbHcd4ZRDW3R43BlaVhX6bFu1lr8Sz1QAVfvVRBlNWFeUv
	 lcMlB5O08krEg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jGJhv2rY2z59rG; Fri, 30 Oct 2026 22:26:55 +1100 (AEDT)
Date: Fri, 30 Oct 2026 22:26:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 06/10] libfdt: overlay: Update base /__local_fixups__
 on apply
Message-ID: <auR-OXOpim7dVTpH@gractus.seuss>
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-7-dianders@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment
In-Reply-To: <20261028215600.1713475-7-dianders@chromium.org>

On Wed, Oct 28, 2026 at 02:46:55PM -0700, Douglas Anderson wrote:
> When a base device tree is compiled with `dtc -L` (`--local-fixups`), it
> contains a root `/__local_fixups__` node recording the byte offsets of
> all phandle references in its properties.
> 
> Previously, `fdt_overlay_apply()` updated the base tree's `/__symbols__`
> via `overlay_symbol_update()`, but left the base tree's
> `/__local_fixups__` untouched. As a result, applying an overlay to a
> base tree with `/__local_fixups__` left `/__local_fixups__` missing the
> phandle references introduced by the overlay (both from the overlay's
> `/__local_fixups__` and from its resolved `/__fixups__`), and left stale
> offsets if the overlay overwrote a base property that previously had
> phandle references.
> 
> Add `overlay_local_fixups_update()` to update the base tree's
> `/__local_fixups__` whenever `/__local_fixups__` is present in the base
> tree:
> 
> - Remove pre-existing `/__local_fixups__` properties for any base
>   properties overwritten by overlay fragments.
> - Merge the overlay's `/__local_fixups__` and `/__fixups__` offsets into
>   the base tree's `/__local_fixups__` in sorted ascending order.
> - Prune any subnodes under `/__local_fixups__` that become empty after
>   overwriting properties.
> 
> When the base tree does not have a `/__local_fixups__` node,
> `overlay_local_fixups_update()` is a no-op.

So, this turned out to be substantially more involved than I realised.
I wonder if it might be better to make --strip-locals the default, and
only add support for preserving the local fixups as a later extension.

> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - New patch updating base /__local_fixups__ in libfdt
>   fdt_overlay_apply() instead of stripping /__local_fixups__ by default
>   (David Gibson)
> 
>  libfdt/fdt_overlay.c | 621 ++++++++++++++++++++++++++++++++++++++++++-
>  tests/run_tests.sh   |  19 ++
>  2 files changed, 636 insertions(+), 4 deletions(-)
> 
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index eb87b356145f..47acab15041d 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -804,7 +804,7 @@ static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
>   *      Negative error code on failure
>   */
>  static int overlay_apply_node(void *fdt, int target,
> -			      void *fdto, int node)
> +			      const void *fdto, int node)

This change is unrelated to the rest of the patch.

>  {
>  	int property;
>  	int subnode;
> @@ -1003,9 +1003,8 @@ static int overlay_split_fragment_path(const char *path, int path_len,
>   * overlay_symbol_update() updates the symbols of the base tree with the
>   * symbols of the applied overlay
>   *
> - * This is the last step in the device tree overlay application
> - * process, allowing the reference of overlay symbols by subsequent
> - * overlay operations.
> + * This step in the device tree overlay application process allows
> + * the reference of overlay symbols by subsequent overlay operations.
>   *
>   * returns:
>   *      0 on success
> @@ -1122,6 +1121,616 @@ static int overlay_symbol_update(void *fdt, void *fdto)
>  	return 0;
>  }
>  
> +/**
> + * overlay_create_path - Create a relative path under a parent node
> + * @fdt: Base Device Tree blob
> + * @parent: Node offset of the starting parent node
> + * @path: Relative or slash-prefixed path to traverse
> + * @path_len: Length of @path in bytes
> + *
> + * overlay_create_path() walks the slash-separated path components in @path
> + * starting at @parent, creating any missing intermediate subnodes along the
> + * way.
> + *
> + * returns:
> + *      Node offset of the resolved or created subnode on success
> + *      Negative error code on failure
> + */
> +static int overlay_create_path(void *fdt, int parent, const char *path,
> +			       int path_len)
> +{
> +	const char *sep;
> +	int node = parent;
> +
> +	while (path_len > 0 && *path == '/') {
> +		path++;
> +		path_len--;
> +	}

In Python, I'm pretty happy to have the code to optionally allow extra
slashes to make the functions more widely useful.  In C - especially
since this is code that may be run in limited environments - I'd
prefer to pin down exactly what the expected format is and require
that.  So, I'd suggest this function only take a relative path, and
make sure that's the case from the callers.

> +
> +	while (path_len > 0) {
> +		int comp_len;
> +		int next;
> +
> +		sep = memchr(path, '/', path_len);
> +		comp_len = sep ? (sep - path) : path_len;
> +
> +		if (comp_len > 0) {

Similarly, in C I'd treat comp_len == 0 as an error condition, rather
than trying to handle it.

> +			next = fdt_subnode_offset_namelen(fdt, node, path,
> +							  comp_len);
> +			if (next == -FDT_ERR_NOTFOUND)
> +				next = fdt_add_subnode_namelen(fdt, node, path,
> +							       comp_len);
> +			if (next < 0)
> +				return next;
> +			node = next;
> +		}
> +
> +		path += comp_len;
> +		path_len -= comp_len;
> +		while (path_len > 0 && *path == '/') {
> +			path++;
> +			path_len--;
> +		}

Same thoughts here.

> +	}
> +
> +	return node;
> +}
> +
> +/**
> + * overlay_fragment_local_fixups - Find or create a fragment's target under /__local_fixups__
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + * @fragment: Node offset of the fragment in @fdto
> + * @create: Whether to create missing subnodes under /__local_fixups__
> + *
> + * overlay_fragment_local_fixups() resolves the target of @fragment in @fdt and
> + * locates (or creates, when @create is true) the corresponding node at the
> + * same path under @fdt's /__local_fixups__ subtree.
> + *
> + * returns:
> + *      Node offset of the corresponding /__local_fixups__ node on success
> + *      Negative error code on failure
> + */
> +static int overlay_fragment_local_fixups(void *fdt, const void *fdto,
> +					 int fragment, bool create)
> +{
> +	int root_lf, target, cur_fdt, node;
> +
> +	root_lf = fdt_subnode_offset(fdt, 0, "__local_fixups__");
> +	if (root_lf < 0)
> +		return root_lf;



> +
> +	target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
> +	if (target < 0)
> +		return target;
> +
> +	cur_fdt = 0;

"cur_fdt" isn't a great name, it's not really suggesting to me what
it's tracking.

> +	node = root_lf;

Might be better to call this node_lf as a reminder that it's tracking
a subnode of __local_fixups__.

> +	while (cur_fdt != target) {
> +		int subnode, ancestor = -FDT_ERR_INTERNAL;
> +		const char *name;
> +		int namelen, next_lf;
> +
> +		fdt_for_each_subnode(subnode, fdt, cur_fdt) {
> +			if (subnode <= target)
> +				ancestor = subnode;
> +			else
> +				break;

I think
	if (subnode > target)
		break;
	ancestor = subnode;
would be clearer.

> +		}
> +		if (ancestor < 0)
> +			return ancestor;
> +
> +		name = fdt_get_name(fdt, ancestor, &namelen);
> +		if (!name)
> +			return namelen;
> +
> +		next_lf = fdt_subnode_offset_namelen(fdt, node, name, namelen);
> +		if (next_lf == -FDT_ERR_NOTFOUND && create) {
> +			char namebuf[256];

Arbitrary buffer size.

> +			int old_struct_size = fdt_size_dt_struct(fdt);
> +
> +			if ((size_t)namelen >= sizeof(namebuf))
> +				return -FDT_ERR_INTERNAL;
> +			memcpy(namebuf, name, namelen);
> +			next_lf = fdt_add_subnode_namelen(fdt, node, namebuf,
> +							  namelen);
> +			if (next_lf < 0)
> +				return next_lf;
> +			if (next_lf <= ancestor) {
> +				int delta = fdt_size_dt_struct(fdt) -
> +					    old_struct_size;
> +				target += delta;
> +				ancestor += delta;

Subtle, but necessary :/.  Probably worth a comment that this - as
well as the memcpy() above is because the fdt_add_subnode_namelen()
might move 'target', and therefore also its name within the fdt.

> +			}
> +		} else if (next_lf < 0) {
> +			return next_lf;
> +		}
> +
> +		cur_fdt = ancestor;
> +		node = next_lf;
> +	}

What this function is doing is pretty similar to
fdt_supernode_atdepth_offset().  I wonder if it there's a reasonable
way to make a common helper.

> +
> +	return node;
> +}
> +
> +/**
> + * overlay_clear_overwritten_local_fixups - Remove local fixups for overwritten properties
> + * @fdt: Base Device Tree blob
> + * @target_lf: Node offset in @fdt's /__local_fixups__ subtree
> + * @fdto: Device tree overlay blob
> + * @overlay: Node offset in @fdto's __overlay__ subtree

I'd probably suggest s/overlay/node/ and s/target_lf/node_lf/.

> + *
> + * overlay_clear_overwritten_local_fixups() recursively deletes properties under
> + * @target_lf that correspond to properties overwritten by @overlay in @fdto.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_clear_overwritten_local_fixups(void *fdt, int target_lf,
> +						  const void *fdto, int overlay)
> +{
> +	int prop, subnode;
> +
> +	fdt_for_each_property_offset(prop, fdto, overlay) {
> +		const char *name;
> +		const void *val;
> +		int len, ret;
> +
> +		val = fdt_getprop_by_offset(fdto, prop, &name, &len);
> +		if (!val)
> +			return len;
> +
> +		ret = fdt_delprop(fdt, target_lf, name);
> +		if (ret && ret != -FDT_ERR_NOTFOUND)
> +			return ret;

Doing this as a post-processing step, reconsulting the properties
fromt the overlay seems a bit odd to me, rather than zapping the
__local_fixups__ entry from within overlay_apply_node().  Is there a
reason for it?

> +	}
> +
> +	fdt_for_each_subnode(subnode, fdto, overlay) {
> +		const char *name;
> +		int namelen, sub_lf, ret;
> +
> +		name = fdt_get_name(fdto, subnode, &namelen);
> +		if (!name)
> +			return namelen;
> +
> +		sub_lf = fdt_subnode_offset_namelen(fdt, target_lf, name,
> +						    namelen);
> +		if (sub_lf == -FDT_ERR_NOTFOUND)
> +			continue;
> +		if (sub_lf < 0)
> +			return sub_lf;
> +
> +		ret = overlay_clear_overwritten_local_fixups(fdt, sub_lf,
> +							     fdto, subnode);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * overlay_add_local_fixup_offset - Insert a sorted u32 offset into a local fixup property
> + * @fdt: Base Device Tree blob
> + * @lf_node: Node offset in @fdt's /__local_fixups__ subtree
> + * @name: Property name to update
> + * @name_len: Length of @name in bytes
> + * @poffset: Byte offset of the phandle reference within the target property
> + *
> + * overlay_add_local_fixup_offset() inserts @poffset in ascending sorted order
> + * (ignoring duplicates) into the u32 array property @name on @lf_node.

Does the spec actually require that these offsets be sorted?  A
reference to that requirement might be useful here.

> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_add_local_fixup_offset(void *fdt, int lf_node,
> +					  const char *name, int name_len,
> +					  uint32_t poffset)
> +{
> +	const fdt32_t *old_val;
> +	fdt32_t *vals;
> +	void *prop_data;
> +	int old_len, count, i, idx, ret;
> +
> +	old_val = fdt_getprop_namelen(fdt, lf_node, name, name_len, &old_len);
> +	if (!old_val && old_len != -FDT_ERR_NOTFOUND)
> +		return old_len;
> +
> +	if (!old_val) {
> +		old_len = 0;
> +		count = 0;
> +		idx = 0;
> +	} else {
> +		if (old_len % sizeof(uint32_t))
> +			return -FDT_ERR_BADSTRUCTURE;

This should probably be BADVALUE rather than BADSTRUCTURE.

> +		count = old_len / sizeof(uint32_t);
> +		idx = count;
> +		for (i = 0; i < count; i++) {
> +			uint32_t cur = fdt32_ld(old_val + i);
> +
> +			if (cur == poffset)
> +				return 0;

I'm trying to think under what circumstances this would occur.  Does
it indicate a bad overlay if we're attempting to add a fixup that
already exists?

> +			if (cur > poffset) {
> +				idx = i;
> +				break;
> +			}
> +		}
> +	}
> +
> +	ret = fdt_setprop_placeholder_namelen(fdt, lf_node, name, name_len,
> +					      old_len + sizeof(uint32_t),
> +					      &prop_data);
> +	if (ret)
> +		return ret;
> +
> +	vals = prop_data;
> +	if (idx < count)
> +		memmove(vals + idx + 1, vals + idx,
> +			(count - idx) * sizeof(uint32_t));
> +	fdt32_st(vals + idx, poffset);
> +
> +	return 0;
> +}
> +
> +/**
> + * overlay_merge_fixup_into_local_fixups - Record one /__fixups__ property for a fragment
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + * @property: Property offset in @fdto's /__fixups__ node
> + * @fragment: Node offset of the current fragment in @fdto
> + * @target_frag_name: Name of @fragment
> + * @target_frag_len: Length of @target_frag_name in bytes

fdt_get_name() is a pretty cheap operation.  Might be simpler to allow
this function to derive the @target_frag_* values from @fragment.

> + * @target_lfp: In/out cached node offset of @fragment under @fdt's /__local_fixups__
> + *
> + * overlay_merge_fixup_into_local_fixups() parses all "path:prop:offset" entries
> + * in a single /__fixups__ property of @fdto and adds the resolved property
> + * byte offsets belonging to @fragment into @fdt's /__local_fixups__ subtree.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_merge_fixup_into_local_fixups(void *fdt, const void *fdto,
> +						 int property, int fragment,
> +						 const char *target_frag_name,
> +						 int target_frag_len,
> +						 int *target_lfp)
> +{
> +	const char *value, *label;
> +	int len;
> +
> +	value = fdt_getprop_by_offset(fdto, property, &label, &len);
> +	if (!value)
> +		return len;
> +
> +	do {
> +		const char *path, *name, *frag_name, *rel_path;
> +		uint32_t path_len, name_len, poffset;
> +		int frag_name_len, rel_path_len, lf_node, ret;
> +		bool is_overlay;
> +
> +		ret = overlay_parse_fixup_entry(&value, &len, &path, &path_len,
> +						&name, &name_len, &poffset);
> +		if (ret)
> +			return ret;
> +
> +		ret = overlay_split_fragment_path(path, path_len,
> +						  &frag_name, &frag_name_len,
> +						  &rel_path, &rel_path_len,
> +						  &is_overlay);
> +		if (ret)
> +			return ret;
> +		if (!is_overlay)
> +			continue;
> +
> +		if (frag_name_len != target_frag_len ||
> +		    memcmp(frag_name, target_frag_name, frag_name_len) != 0)
> +			continue;

Why filter by target fragment?  Neither the __fixups__ node you're
working from, nor the __local_fixups__ node you're updating is
naturally divided by fragment.

> +		if (*target_lfp < 0) {
> +			*target_lfp = overlay_fragment_local_fixups(
> +				fdt, fdto, fragment, true);
> +			if (*target_lfp < 0)
> +				return *target_lfp;
> +		}
> +
> +		lf_node = overlay_create_path(fdt, *target_lfp, rel_path,
> +					      rel_path_len);
> +		if (lf_node < 0)
> +			return lf_node;
> +
> +		ret = overlay_add_local_fixup_offset(fdt, lf_node, name,
> +						     name_len, poffset);
> +		if (ret)
> +			return ret;
> +	} while (len > 0);
> +
> +	return 0;
> +}
> +
> +/**
> + * overlay_merge_fixups_into_local_fixups - Record resolved /__fixups__ for a fragment
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + * @fragment: Node offset of the current fragment in @fdto
> + * @frag_name: Name of @fragment
> + * @frag_name_len: Length of @frag_name in bytes
> + * @target_lfp: In/out cached node offset of @fragment under @fdt's /__local_fixups__
> + *
> + * overlay_merge_fixups_into_local_fixups() parses external phandle references
> + * belonging to @fragment in @fdto's /__fixups__ node and records their resolved
> + * property byte offsets in @fdt's /__local_fixups__ subtree.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_merge_fixups_into_local_fixups(void *fdt, const void *fdto,
> +						  int fragment,
> +						  const char *frag_name,
> +						  int frag_name_len,
> +						  int *target_lfp)
> +{
> +	int fixups_off, prop;
> +
> +	fixups_off = fdt_subnode_offset(fdto, 0, "__fixups__");
> +	if (fixups_off == -FDT_ERR_NOTFOUND)
> +		return 0;
> +	if (fixups_off < 0)
> +		return fixups_off;
> +
> +	fdt_for_each_property_offset(prop, fdto, fixups_off) {
> +		int ret;
> +
> +		ret = overlay_merge_fixup_into_local_fixups(
> +			fdt, fdto, prop, fragment, frag_name, frag_name_len,
> +			target_lfp);
> +		if (ret)
> +			return ret;
> +	}

Is there a reason to do this as a post-processing pass, rather than
making the __local_fixups__ adjustment at the same time we already
process the fixup in overlay_fixup_phandle()?

> +	return 0;
> +}
> +
> +/**
> + * overlay_prune_empty_local_fixups - Remove empty subnodes from /__local_fixups__
> + * @fdt: Base Device Tree blob
> + * @lf_node: Node offset in @fdt's /__local_fixups__ subtree
> + *
> + * overlay_prune_empty_local_fixups() recursively deletes any child subnodes
> + * under @lf_node that have neither properties nor subnodes remaining.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_prune_empty_local_fixups(void *fdt, int lf_node)
> +{
> +	int subnode = fdt_first_subnode(fdt, lf_node);
> +
> +	while (subnode >= 0) {

We should propagate the error if subnode < 0 but is not
-FDT_ERR_NOTFOUND.

> +		int next, ret;
> +
> +		ret = overlay_prune_empty_local_fixups(fdt, subnode);
> +		if (ret < 0)
> +			return ret;
> +
> +		next = fdt_next_subnode(fdt, subnode);
> +		if (fdt_first_property_offset(fdt, subnode) == -FDT_ERR_NOTFOUND &&
> +		    fdt_first_subnode(fdt, subnode) == -FDT_ERR_NOTFOUND) {
> +			int old_struct_size = fdt_size_dt_struct(fdt);
> +
> +			ret = fdt_del_node(fdt, subnode);
> +			if (ret < 0)
> +				return ret;
> +			if (next >= 0)
> +				next += fdt_size_dt_struct(fdt) -
> +					old_struct_size;
> +		}
> +		subnode = next;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * overlay_validate_local_fixups - Validate /__local_fixups__ fragment nodes in overlay
> + * @fdto: Device tree overlay blob
> + * @ov_lf_root: Node offset of /__local_fixups__ in @fdto
> + *
> + * overlay_validate_local_fixups() verifies that every fragment subnode under
> + * @ov_lf_root that contains an __overlay__ subnode corresponds to a valid
> + * fragment node at the root of @fdto.

What's the reason for doing this as a pre-validation pass, rather than
checking this as we go to process each individual local_fixups entry?

> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_validate_local_fixups(const void *fdto, int ov_lf_root)
> +{
> +	int lf_frag;
> +
> +	fdt_for_each_subnode(lf_frag, fdto, ov_lf_root) {
> +		const char *frag_name;
> +		int frag_name_len, lf_overlay, fragment;
> +
> +		frag_name = fdt_get_name(fdto, lf_frag, &frag_name_len);
> +		if (!frag_name)
> +			return frag_name_len;
> +
> +		lf_overlay = fdt_subnode_offset(fdto, lf_frag, "__overlay__");
> +		if (lf_overlay == -FDT_ERR_NOTFOUND)
> +			continue;
> +		if (lf_overlay < 0)
> +			return lf_overlay;
> +
> +		fragment = fdt_subnode_offset_namelen(fdto, 0, frag_name,
> +						      frag_name_len);
> +		if (fragment < 0)
> +			return -FDT_ERR_BADOVERLAY;
> +
> +		if (fdt_subnode_offset(fdto, fragment, "__overlay__") < 0)
> +			return -FDT_ERR_BADOVERLAY;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * overlay_fragment_local_fixups_src - Find a fragment's __overlay__ in overlay /__local_fixups__
> + * @fdto: Device tree overlay blob
> + * @ov_lf_root: Node offset of /__local_fixups__ in @fdto (or -FDT_ERR_NOTFOUND)
> + * @frag_name: Name of the fragment node
> + * @frag_name_len: Length of @frag_name in bytes
> + *
> + * overlay_fragment_local_fixups_src() locates the __overlay__ subnode for
> + * @frag_name under @ov_lf_root in @fdto.
> + *
> + * returns:
> + *      Node offset of /__local_fixups__/<frag_name>/__overlay__ on success
> + *      -FDT_ERR_NOTFOUND if @ov_lf_root, <frag_name>, or __overlay__ is absent
> + *      Negative error code on other failures
> + */
> +static int overlay_fragment_local_fixups_src(const void *fdto, int ov_lf_root,
> +					     const char *frag_name,
> +					     int frag_name_len)
> +{
> +	int lf_frag;
> +
> +	if (ov_lf_root < 0)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	lf_frag = fdt_subnode_offset_namelen(fdto, ov_lf_root, frag_name,
> +					     frag_name_len);
> +	if (lf_frag < 0)
> +		return lf_frag;
> +
> +	return fdt_subnode_offset(fdto, lf_frag, "__overlay__");
> +}
> +
> +/**
> + * overlay_fragment_update_local_fixups - Update base /__local_fixups__ for one fragment
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + * @fragment: Node offset of the fragment in @fdto
> + * @ov_lf_root: Node offset of /__local_fixups__ in @fdto (or -FDT_ERR_NOTFOUND)
> + *
> + * overlay_fragment_update_local_fixups() clears any base /__local_fixups__
> + * entries overwritten by @fragment, then merges phandle offsets for @fragment
> + * from @fdto's /__local_fixups__ and /__fixups__ subtrees.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_fragment_update_local_fixups(void *fdt, const void *fdto,
> +						int fragment, int ov_lf_root)
> +{
> +	const char *frag_name;
> +	int frag_name_len, overlay, target_lf, lf_overlay, ret;
> +
> +	overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> +	if (overlay == -FDT_ERR_NOTFOUND)
> +		return 0;
> +	if (overlay < 0)
> +		return overlay;
> +
> +	frag_name = fdt_get_name(fdto, fragment, &frag_name_len);
> +	if (!frag_name)
> +		return frag_name_len;
> +
> +	target_lf = overlay_fragment_local_fixups(fdt, fdto, fragment, false);
> +	if (target_lf < 0 && target_lf != -FDT_ERR_NOTFOUND)
> +		return target_lf;
> +
> +	if (target_lf >= 0) {
> +		ret = overlay_clear_overwritten_local_fixups(fdt, target_lf,
> +							     fdto, overlay);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	lf_overlay = overlay_fragment_local_fixups_src(fdto, ov_lf_root,
> +						       frag_name,
> +						       frag_name_len);
> +	if (lf_overlay < 0 && lf_overlay != -FDT_ERR_NOTFOUND)
> +		return lf_overlay;
> +
> +	if (lf_overlay >= 0) {
> +		if (target_lf < 0)
> +			target_lf = overlay_fragment_local_fixups(fdt, fdto,
> +								  fragment,
> +								  true);
> +		if (target_lf < 0)
> +			return target_lf;
> +
> +		ret = overlay_apply_node(fdt, target_lf, fdto, lf_overlay);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return overlay_merge_fixups_into_local_fixups(
> +		fdt, fdto, fragment, frag_name, frag_name_len, &target_lf);
> +}
> +
> +/**
> + * overlay_local_fixups_update - Update base /__local_fixups__ with overlay fixups
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + *
> + * overlay_local_fixups_update() updates the base device tree's
> + * /__local_fixups__ subtree (when present) by walking each overlay fragment in
> + * application order, clearing entries for properties overwritten by that
> + * fragment, and merging phandle reference offsets from @fdto's
> + * /__local_fixups__ and /__fixups__ subtrees.
> + *
> + * This is part of the device tree overlay application process, when you want
> + * the merged device tree to retain complete local phandle fixup metadata.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_local_fixups_update(void *fdt, const void *fdto)
> +{
> +	int root_lf, ov_lf_root, fragment, ret;
> +
> +	root_lf = fdt_subnode_offset(fdt, 0, "__local_fixups__");
> +	if (root_lf == -FDT_ERR_NOTFOUND)
> +		return 0;
> +	if (root_lf < 0)
> +		return root_lf;
> +
> +	ov_lf_root = fdt_subnode_offset(fdto, 0, "__local_fixups__");
> +	if (ov_lf_root >= 0) {
> +		ret = overlay_validate_local_fixups(fdto, ov_lf_root);
> +		if (ret)
> +			return ret;
> +	} else if (ov_lf_root != -FDT_ERR_NOTFOUND) {
> +		return ov_lf_root;
> +	}
> +
> +	/*
> +	 * Process fragments in application order so that if a later fragment in
> +	 * fdto overwrites a property modified by an earlier fragment, the
> +	 * earlier fragment's local fixups for that property are cleared first.
> +	 */
> +	fdt_for_each_subnode(fragment, fdto, 0) {
> +		ret = overlay_fragment_update_local_fixups(fdt, fdto, fragment,
> +							   ov_lf_root);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	root_lf = fdt_subnode_offset(fdt, 0, "__local_fixups__");
> +	if (root_lf < 0)
> +		return root_lf;
> +
> +	return overlay_prune_empty_local_fixups(fdt, root_lf);
> +}
> +
>  int fdt_overlay_apply(void *fdt, void *fdto)
>  {
>  	uint32_t delta;
> @@ -1162,6 +1771,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
>  	if (ret)
>  		goto err;
>  
> +	ret = overlay_local_fixups_update(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
>  	/*
>  	 * The overlay has been damaged, erase its magic.
>  	 */
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 842b543059bb..e232c86aab37 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1089,6 +1089,25 @@ fdtoverlay_tests() {
>  
>      shorten_echo "check phandle to noda d wasn't overwritten:	"
>      run_wrap_test test "$bd" = "$pd"
> +
> +    # verify that /__local_fixups__ in a -L base blob is updated when applying an overlay
> +    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_phandle_lf.test.dtb "$SRCDIR/overlay_base_phandle.dts"
> +    run_wrap_test $FDTOVERLAY -i overlay_base_phandle_lf.test.dtb -o overlay_base_phandle_lfO.test.dtb overlay_overlay_phandle.test.dtb
> +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b a
> +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/b d
> +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/c b
> +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d a
> +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d b
> +    run_fdtget_test 0 overlay_base_phandle_lfO.test.dtb /__local_fixups__/d c
> +
> +    run_dtc_test -@ -L -I dts -O dtb -o overlay_base_lf.test.dtb "$SRCDIR/overlay_base.dts"
> +    run_wrap_test $DTPUT overlay_base_lf.test.dtb -cp /__local_fixups__/test-node/sub-test-node
> +    run_wrap_test $DTPUT overlay_base_lf.test.dtb /__local_fixups__/test-node/sub-test-node new-sub-test-property -tu 0
> +    run_dtc_test -@ -I dts -O dtb -o overlay_overlay.fdtoverlay.test.dtb "$SRCDIR/overlay_overlay.dts"
> +    run_wrap_test $FDTOVERLAY -i overlay_base_lf.test.dtb -o overlay_base_lfO.test.dtb overlay_overlay.fdtoverlay.test.dtb
> +    run_fdtget_test "0 4" overlay_base_lfO.test.dtb /__local_fixups__/test-node test-phandle
> +    run_fdtget_test "0 4" overlay_base_lfO.test.dtb /__local_fixups__/test-node test-several-phandle
> +    run_test check_path overlay_base_lfO.test.dtb not-exists "/__local_fixups__/test-node/sub-test-node"
>  }
>  
>  pylibfdt_tests () {
> -- 
> 2.56.0.313.g2479322e68-goog
> 
> 

-- 
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson
