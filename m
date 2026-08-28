Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF482628D
	for <devicetree-compiler@vger.kernel.org>; Fri, 28 Aug 2026 04:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892600; cv=none; b=dmlAHLmNzfBX4ig6MkfWjCJfU3E07UQOF0iHfrHHWbiRFcChsmMK+0UKDD74Cwt0E2y0G8RRgUArx+GKWQ5eMwqqmgg9BI/igOdZAk0n08eYZkoqMF1PuuG3FQznLO+UUKTE5ZNVHIE7h/hc4VxySQhyQV3ltsbH0Fxb9GwXG2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892600; c=relaxed/simple;
	bh=F0z8NJFP2wvf/Orx5ngKT3rkdkYKetfEEEnJsQSXYpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmXnDn8BUdjsfOyBUmdAQJXN2cT9MigR4wLXy1AsoNY05F+EZvfJWcvR7CaJVoz9IiUGb2GiSTsNwJoRsINK6dGqJWBh/SDbrjmN/3Be6bxAtc2Kdv+t6ym1Gnsy6mC4DRR6RaMmwVQvlF6wC9lvqRVg2XI2md5DOzTiM+7+Yyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=fuZk1Kc8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="fuZk1Kc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1787892593;
	bh=EsEaPL1aTcCetvQAvSVMVS2R4wbAAlqk0krdaXmBQ/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuZk1Kc8mkMJti4P/Oj+coxy0x8tDqh2JBya7j3mMabmSdVTcZQLflZVLKqDrah8M
	 CbZixpSTxM71NIEXR3OTzNXMwzmA18Uc802MbOnANVol3+CGdttRv1Nd+Wmch21cv6
	 oMj0fCgmowtgwfV6LOOgR/0+q1dprmF5MVGpwHiDEp4KzWBJNZolpCBfrx4Mu2XtyA
	 lI3rBrwXXqRb1lYi0cjfYX2NE+GKKXScg6K0uJOkecMpV68ckhZp1vcsTJ+bR7AX3O
	 t2BTtnkUipO+5jiLdtlBqNPaPLksQjwV1X5XDLNdi+m/Y8FZvxRDo+AVDaSb/SZ+On
	 fLmGgwjTaKmXw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hWQss1Pyfz4wBF; Fri, 28 Aug 2026 14:49:53 +1000 (AEST)
Date: Fri, 28 Aug 2026 12:24:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH] libfdt: Find a node's parent in a single pass
Message-ID: <apDxR0tXh_9RFfMc@gractus.seuss>
References: <20260806191321.2476810-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NO7ufo2WvzNPU5KE"
Content-Disposition: inline
In-Reply-To: <20260806191321.2476810-1-sjg@chromium.org>

--NO7ufo2WvzNPU5KE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 01:13:14PM -0600, Simon Glass wrote:
> fdt_parent_offset() walks the whole tree from the root twice: once
> inside fdt_node_depth() to discover the node's depth, then again in
> fdt_supernode_atdepth_offset() to find the ancestor one level up.
> Both walks are O(nodes before the target), so a parent lookup costs
> twice what it needs to.

Right.  Because dtbs typically aren't that large, and the environments
we're targetting, libfdt nearly always prioritizes simplicity and
working memory over runtime.

> Walk the tree once instead, remembering the most recent node seen at
> each depth. On reaching the target node its parent is the last node
> seen one level up. Trees deeper than the tracked limit fall back to
> the existing code.
>=20
> The single pass needs an int per level of depth, so it costs that
> much stack. FDT_PARENT_MAX_DEPTH sets the limit, in the same way as
> FDT_ASSUME_MASK: 32 by default, which no real tree approaches, and
> lower where stack is tight. Setting it to 0 leaves the single-pass
> code out altogether, for callers who would rather have the smaller
> build.

I don't love the extra code complexity this adds, but it looks like
you've thought through the tradeoffs here pretty well with the build
parameter.

It would be interesting to know what the context is where the time
cost of fdt_parent_offset() matters.

Herv=E9 also makes a good point about the test case.

Otherwise, I'm tentatively comfortable with this change.

> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
>  libfdt/fdt_ro.c          | 32 +++++++++++++++-
>  libfdt/libfdt_internal.h | 14 +++++++
>  tests/parent_offset.c    | 79 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 124 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 11f2e2e..b84669a 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -674,7 +674,37 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
> =20
>  int fdt_parent_offset(const void *fdt, int nodeoffset)
>  {
> -	int nodedepth =3D fdt_node_depth(fdt, nodeoffset);
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
> +	for (offset =3D 0, depth =3D 0;
> +	     offset >=3D 0 && offset <=3D nodeoffset;
> +	     offset =3D fdt_next_node(fdt, offset, &depth)) {
> +		if (depth < 0 || depth >=3D FDT_PARENT_MAX_DEPTH)
> +			break;
> +		supernode[depth] =3D offset;
> +		if (offset =3D=3D nodeoffset)
> +			return depth ? supernode[depth - 1] :
> +				-FDT_ERR_NOTFOUND;
> +	}
> +#endif /* FDT_PARENT_MAX_DEPTH */
> +
> +	nodedepth =3D fdt_node_depth(fdt, nodeoffset);
> =20
>  	if (nodedepth < 0)
>  		return nodedepth;
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 0e103ca..eefea2a 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -85,6 +85,20 @@ static inline uint64_t fdt64_ld_(const fdt64_t *p)
>  #define FDT_ASSUME_MASK 0
>  #endif
> =20
> +/*
> + * Maximum node depth for which fdt_parent_offset() finds a node's paren=
t in
> + * a single pass over the tree. Deeper nodes fall back to walking the tr=
ee
> + * twice, which is correct but slower.
> + *
> + * The single pass needs an int for each level, so this costs that much
> + * stack. Reduce it if that matters more than the speed; no real device =
tree
> + * comes close to the default. Set it to 0 to leave out the single-pass =
code
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
> @@ -56,6 +56,82 @@ static void check_path(struct fdt_header *fdt, const c=
har *path)
>  		     parentoffset, parentpathoffset);
>  }
> =20
> +/*
> + * Check that an offset which does not name a node never yields a parent.
> + * Sweep the whole blob, plus a little either side of it
> + */
> +static void check_bad_offsets(struct fdt_header *fdt)
> +{
> +	int offset, size =3D fdt_totalsize(fdt);
> +
> +	for (offset =3D -8; offset < size + 64; offset++) {
> +		int parentoffset;
> +
> +		if (fdt_get_name(fdt, offset, NULL))
> +			continue;	/* a real node, checked elsewhere */
> +
> +		parentoffset =3D fdt_parent_offset(fdt, offset);
> +		if (parentoffset >=3D 0)
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
> +		int err_ =3D (code); \
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
> +	void *fdt =3D malloc(DEEP_SPACE);
> +
> +	if (!fdt)
> +		FAIL("malloc()");
> +
> +	CHECK(fdt_create(fdt, DEEP_SPACE));
> +	CHECK(fdt_finish_reservemap(fdt));
> +	CHECK(fdt_begin_node(fdt, ""));
> +	for (level =3D 0; level < DEEP_LEVELS; level++)
> +		CHECK(fdt_begin_node(fdt, "node"));
> +	for (level =3D 0; level < DEEP_LEVELS; level++)
> +		CHECK(fdt_end_node(fdt));
> +	CHECK(fdt_end_node(fdt));
> +	CHECK(fdt_finish(fdt));
> +
> +	for (offset =3D 0, depth =3D 0; offset >=3D 0;
> +	     offset =3D fdt_next_node(fdt, offset, &depth)) {
> +		int parentoffset;
> +
> +		if (depth < 0)
> +			break;
> +		if (depth > DEEP_LEVELS)
> +			FAIL("tree is %d deep, expected %d", depth,
> +			     DEEP_LEVELS);
> +		seen[depth] =3D offset;
> +		if (!depth)
> +			continue;
> +
> +		parentoffset =3D fdt_parent_offset(fdt, offset);
> +		if (parentoffset !=3D seen[depth - 1])
> +			FAIL("fdt_parent_offset() returns %d instead of %d "
> +			     "at depth %d", parentoffset, seen[depth - 1],
> +			     depth);
> +	}
> +	free(fdt);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	void *fdt;
> @@ -73,5 +149,8 @@ int main(int argc, char *argv[])
>  		FAIL("fdt_parent_offset(/) returns %d instead of "
>  		     "-FDT_ERR_NOTFOUND", err);
> =20
> +	check_bad_offsets(fdt);
> +	check_deep_tree();
> +
>  	PASS();
>  }
> ---
> base-commit: 66e1201c3775716607c28afd2bbb2b3afb08b695
> branch: parent-onepass
>=20
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--NO7ufo2WvzNPU5KE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqQ8UcACgkQzQJF27ox
2Gc3AxAAjN4+QokRpQ/jyFhemrtRiOuw54cX0m54iiVPZOm4A8PeOzeyMeOSLLRt
z1FSQGwlnwSVx1mpGRolwRsm1afT7/lFOQ1duFeujUQe0Y6l4b9LsWn0ayKEHI/H
oDQdR5MkGHu3rsw7RifPfEWhzu7+sV0K0MPwKxPUPpRvKuky1+7k5PL70ZaRLjKI
+19hkmN+9+jQ88k43LFppkRDSJIVIyVYf8KjgGTael7Ax4ZLkEtMU3UXC2BAE8ks
uhcmDhSTImKL5hxDJqhUr48Hg/2PtNFhu7EmymI+qaeAEP5kr9lehNBImfQ08aVi
zhORkw5FcbYotZm6ZiRjFnNX5rHwhMcfhQ0YUOEJhc6UKJ//WStgLMGpVAxKdUNM
a91J26APirEjn/OIzTxP7J5OtVOm8p7xU18dpN7cXL2muEcLs/bvwghIsrHf3Su1
Ge3YsQ8g+3DkS8WZw2s1KKCNnac5W40NLgihIILPyKLoX8MyyQfFsyGN61pVZNkg
MH0QPe1M0iaaQcJh8WnYu//kZNnYyr28fGk6LEeGsIacXzOqTBkEDWNepyurY5T/
JsLknXt7zmQYoJcCfiMsvsVqEEsbUT8pdcIrsm8McbejAZmr9nJ31Yh+0xFJvdNP
UZIbxdl9nXr+eTIxx4JGzMX0zvjmkQhmPE+SSDXjuGHnY3+jY0Q=
=qJrC
-----END PGP SIGNATURE-----

--NO7ufo2WvzNPU5KE--
