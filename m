Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993087;
	b=EgZvPF9hPlggCp0ocJzjC0ZgdBBoBw96EXZIcKsFbKKRNqOVzrEKuNLSRmAu7UuWsOdu
	 HGk7p9E+WK9rFSvpHyKXf/wZybAqopsWwuOWTaC8X77blkCwuxb44Js29s/C9EU66oOU8
	 xc2Gdq5K3iuS85dDwyEWL/viieYB0tANqtHKHEyUSNU1EAs0y4j30p8PMpIXUBe/OqCqR
	 IgZ9N5FfyFtd3RNpo8kiMtzdnYu4Wnzx2Iwn1N0/7nSVdr56/dJLVys9mZcTNo9iAzyJr
	 QHmpMZgxQ2vbQJlFNKpuASrahFJEr4i/C4Mq8q1HJx6kHoNBMyL6NorIqm96395Qozw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993087;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=YC1ADF3hQuB31I1JlVWrDj/qwXlamN6lJb8J8BHy0aQ=;
	b=DVBLjT45IhQQ5+/uOKl4736P12Mkz09wuatdzOHGKn0o8okFhJXlfOECR+MK1ocWMC9o
	 nYJa2+TwA2qo+weiUyoV3xQrtKLFOOqf8IvnpELPWanhnZj8pOoA3s3wmKzp7fi0VF82f
	 0fLS8yo3x974uG//vj2wsoV8pch1RMellqhSSiMF3CGuCIEc58Dha8Uy6sL3x+lvjIIJV
	 /T/dHQPh0lhXbcgPvCv8vo0dA7wZBhIe9YnXYOe9T+3aelkgTZSkvjfkZZ3bK7Oq4tgzP
	 DJVdMfeXinIJQFW/xFCmKhjF6c/YK7V8mk8NP62DnYAYracA4qf7S0WRhQ3HqhuBApQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=oM3E5VLo;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFF3606A32A
	for <devicetree-compiler@vger.kernel.org>; Mon, 26 Oct 2026 05:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBFF3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=oM3E5VLo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792993084;
	bh=YC1ADF3hQuB31I1JlVWrDj/qwXlamN6lJb8J8BHy0aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oM3E5VLo2EsswYS26aArekfoGFPrKeubM5u9pMZfMfu1XFtMruTjt5gCVTeqGLYW6
	 gQ5SVFfnAUteyGOVuquNfHMakvYdQK0JYqmyLdHDketU9ihmWaH/6bwhdT9uylmkmv
	 XFackGelSSoV+1eMZ86m5tD1k7FWt0bWEpFmcomqobUV8e5ZpxcsnLGpFmFLpdE3jO
	 +p8zE64fSKf0u6JxlZzwh9V0+ETGG9zlbhIby7GYlU+vMnqCpyXW7R3CgDXiQOTEkP
	 DddXN71TZx+H5GqN+6I7xkkPu0x1UVV+4pXfJXW9/txCppbk9ONi+zos9L1lOxdc1g
	 QGQfMOxjq9Ijw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jCj8D0LD1z4wHs; Mon, 26 Oct 2026 16:38:04 +1100 (AEDT)
Date: Mon, 26 Oct 2026 16:32:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 1/2] libfdt: Find a node's parent in a single pass
Message-ID: <at7l4Bp3hOjwtBzN@gractus.seuss>
References: <20261025085508.1622340-1-sjg@chromium.org>
 <20261025085508.1622340-2-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z/6mULb2lsxceCy6"
Content-Disposition: inline
In-Reply-To: <20261025085508.1622340-2-sjg@chromium.org>

--z/6mULb2lsxceCy6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 02:55:04AM -0600, Simon Glass wrote:
> fdt_parent_offset() walks the whole tree from the root twice: once
> inside fdt_node_depth() to discover the node's depth, then again in
> fdt_supernode_atdepth_offset() to find the ancestor one level up. Both
> walks are O(nodes before the target), so a parent lookup costs twice
> what it needs to.
>=20
> Walk the tree once instead, remembering the most recent node seen at
> each depth. On reaching the target node its parent is the last node seen
> one level up. A node deeper than the tracked limit falls back to the
> existing code.
>=20
> The single pass needs an int per level of depth, so it costs that much
> stack. FDT_PARENT_MAX_DEPTH sets the limit when libfdt is built: 32 by
> default, which no real tree approaches, and lower where stack is tight.
> Setting it to 0 leaves the single-pass code out altogether, for callers
> who would rather have the smaller build.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
> Changes in v2:
> - Explain in the cover letter where the cost of finding a parent matters

Ah, in the series cover letter.  Sorry, I wasn't clear - I was hoping
for that in this commit message, so that git blame will tell posterity
why we did this.

> - Only fall back when the node itself is deeper than the limit
> - Drop the comparison with FDT_ASSUME_MASK, which has a build option
> - Give the deep test tree several nodes at each level
> - Take the expected parent from the node's path in the deep test
>=20
>  libfdt/fdt_ro.c          | 38 +++++++++++++++-
>  libfdt/libfdt_internal.h | 14 ++++++
>  tests/parent_offset.c    | 94 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 145 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 11f2e2e..ddfb8b9 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -674,7 +674,43 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
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
> +	 * seen one level up. Nodes deeper than the limit are not remembered,
> +	 * since they never hold a shallower node's parent, so only a target
> +	 * which is itself too deep needs the fallback
> +	 *
> +	 * The depth goes negative once the walk moves past the root, which
> +	 * happens when nodeoffset does not name a node. Fall back in that
> +	 * case, so that the checks below reject it
> +	 */
> +	for (offset =3D 0, depth =3D 0;
> +	     offset >=3D 0 && offset <=3D nodeoffset;
> +	     offset =3D fdt_next_node(fdt, offset, &depth)) {
> +		if (depth < 0)
> +			break;
> +		if (offset =3D=3D nodeoffset) {
> +			if (depth > FDT_PARENT_MAX_DEPTH)
> +				break;
> +			return depth ? supernode[depth - 1] :
> +				-FDT_ERR_NOTFOUND;
> +		}
> +		if (depth < FDT_PARENT_MAX_DEPTH)
> +			supernode[depth] =3D offset;
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
> index a935a53..382d431 100644
> --- a/tests/parent_offset.c
> +++ b/tests/parent_offset.c
> @@ -56,6 +56,97 @@ static void check_path(struct fdt_header *fdt, const c=
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

Nicely thorough, I like it :).

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
> +/* Add a node holding a single subnode, as a side branch of the deep tre=
e */
> +static void add_branch(void *fdt, const char *name, const char *child)
> +{
> +	CHECK(fdt_begin_node(fdt, name));
> +	CHECK(fdt_begin_node(fdt, child));
> +	CHECK(fdt_end_node(fdt));
> +	CHECK(fdt_end_node(fdt));
> +}
> +
> +/*
> + * Check a tree deeper than fdt_parent_offset() may track in one pass, so
> + * that both it and the fallback for deeper nodes are covered
> + *
> + * Each level has three nodes: 'a' and 'c' each hold one subnode and 'b'
> + * holds the next level. So nodes at the same depth have different paren=
ts,
> + * and the walk passes whole subtrees both before and after the node bei=
ng
> + * looked up. The expected parent comes from the node's path, so it does=
 not
> + * depend on walking the tree
> + */
> +static void check_deep_tree(void)
> +{
> +	int offset, depth, level, maxdepth =3D 0;
> +	char path[256];
> +	void *fdt =3D malloc(DEEP_SPACE);
> +
> +	if (!fdt)
> +		FAIL("malloc()");
> +
> +	CHECK(fdt_create(fdt, DEEP_SPACE));
> +	CHECK(fdt_finish_reservemap(fdt));
> +	CHECK(fdt_begin_node(fdt, ""));
> +	for (level =3D 0; level < DEEP_LEVELS; level++) {
> +		add_branch(fdt, "a", "x");
> +		CHECK(fdt_begin_node(fdt, "b"));
> +	}
> +	for (level =3D 0; level < DEEP_LEVELS; level++) {
> +		CHECK(fdt_end_node(fdt));
> +		add_branch(fdt, "c", "y");
> +	}
> +	CHECK(fdt_end_node(fdt));
> +	CHECK(fdt_finish(fdt));
> +
> +	for (offset =3D 0, depth =3D 0; offset >=3D 0;
> +	     offset =3D fdt_next_node(fdt, offset, &depth)) {
> +		if (depth < 0)
> +			break;
> +		if (depth > maxdepth)
> +			maxdepth =3D depth;
> +		if (!depth)
> +			continue;
> +
> +		CHECK(fdt_get_path(fdt, offset, path, sizeof(path)));
> +		check_path(fdt, path);
> +	}
> +	if (maxdepth !=3D DEEP_LEVELS + 1)
> +		FAIL("tree is %d deep, expected %d", maxdepth,
> +		     DEEP_LEVELS + 1);
> +	free(fdt);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	void *fdt;
> @@ -73,5 +164,8 @@ int main(int argc, char *argv[])
>  		FAIL("fdt_parent_offset(/) returns %d instead of "
>  		     "-FDT_ERR_NOTFOUND", err);
> =20
> +	check_bad_offsets(fdt);
> +	check_deep_tree();
> +
>  	PASS();
>  }
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--z/6mULb2lsxceCy6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmre5eAACgkQzQJF27ox
2Gcl6A/+K1efUA6O5zAUBcHc/of/+YLxc9dNv42nlqnSO2XIH9joe9HaTKU4VXlk
gSUAJFWA1ezYslndGOMD21HiGxPI5DmdPdFyNphtjE0eTQfrIv5Pj/qb+n8QOITJ
xZxR4F7hRNlbrm6cPmKVDlX7Bxl3sK7uKt5gPAdHMQGdmVVkNgW+YTsH5daZmd+N
meTAO8vPRMa/90aj/x5MdzXvXVM5tpwc5SujaUANLlP/CBxjc4sNrWWrDz+0rfC0
QaauMw8vxFVGdDRm/Spe/5InysOdfxa47zzyMQX7PLFm+D665/8NB7WbJKQEQnpo
pcgkKSL394c60E6FxXMliHrxPF3MCXkp/USbl6PHDa6LLh14poU1TPbcWCeRonRf
jltDEOkuqUbihiW8Y1/tR/I9lDIQGiTydVftpmnxxchorKB7dn6GN7f2gPFHywpJ
aQeXMnoTrfScgyxHwac9QALVYVXeFKI4j9kyOybAp9/BcgBbstSHvFV4G+ZC7vPm
SHTyZ2eBQfFBrW5hKp0E/HiXr8Mv6ygwXkA5jbvdVhVVa9H/KecZLSnSWP5z38Gv
fmiF3/R8VjZQSnH/800/lyYnOCrlg3H8Kn2XDgEG7d2cwb73EyNnbnYx3jRg5WvK
ClanGH5jBVuDlFdEpTzVjOP6ce3Expl6biT4hnq0JzoVvVt8Zek=
=WG0v
-----END PGP SIGNATURE-----

--z/6mULb2lsxceCy6--
