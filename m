Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3B41B947
	for <devicetree-compiler@vger.kernel.org>; Mon, 26 Feb 2024 05:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708926845; cv=none; b=T7j3b7mp0IoaBwutWv7BgQd7P5JkADdO0DeHAPWxzxUBJdlqRaCIXcB8cZr5yIXi4IT4D6cpnfdOnsZwK/u2mZxSuLsnhHGguhGg02Np2C1EfHGlvQgJGNsT0IfxUF9XeOEAj3kQ5l8+P0UtA4sVKdwyx+sgXdURmjVFmBbgLag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708926845; c=relaxed/simple;
	bh=la64ErFeuCTjsTbJMw3+ecwvJMP3IAA/MqgwQ3ym0kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRYrpU/bQBwnoxHbJXm2R0Y5mnXAswPQwGVTUzfyR8JrL6rkM5K1SrCzLF489mHnsIHbrUu5R+Jv6fA7agWLfFVJIXlYhqRNF+zhuJvrqDKnKjNoavzA6e0Ca2DV9mka/Xsu23Bqv6qfNxf5uFY/O7emB0AI7UygXqKdnDeZy38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=S1f0b3tb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="S1f0b3tb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1708926837;
	bh=hd/4ZbsWhHshpJAGL2Rh5zS/gdAPGzKZSw7PZsZRQXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1f0b3tbBYc2QGiphZSd+fTPNOjJViqZu4RKgSEi/xLg857z50BcIo2kEZrlCsAmS
	 sVDJYWi/LSCtNKI7NIcANmqRDx4iVaJSnnCV+ME9+Mr+X+ClYu385Op5KKGR1e/cTw
	 kxj6gUiDwxG/7iENzaFDSiNjLl48hjqD8ZbiiQNZR2vOnTCZh6ZL6yyRBX3HXYwo6R
	 d7SNB/52EL77eHngCzAhRQ1QH1moXDpqjktEErnGMJ+A3a5dryK1ySLtWqJJCivOPH
	 E+r3KjsJOSZQX3ciyO+S5vMSrlhLPU99QICxDJ/mehijQ9l2ByXUU5Tw+XOPXC2HSj
	 1m+Bg9TzJ4Tbg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TjqYd4T43z4wcr; Mon, 26 Feb 2024 16:53:57 +1100 (AEDT)
Date: Mon, 26 Feb 2024 16:53:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v3] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <ZdwncYaatDrRBkKU@zatzit>
References: <20240225175422.156393-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BcvGqoI+LbrPfViI"
Content-Disposition: inline
In-Reply-To: <20240225175422.156393-2-u.kleine-koenig@pengutronix.de>


--BcvGqoI+LbrPfViI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 06:54:23PM +0100, Uwe Kleine-K=F6nig wrote:
> A phandle in an overlay is not supposed to overwrite a phandle that
> already exists in the base dtb as this breaks references to the
> respective node in the base.
>=20
> So add another iteration over the fdto that checks for such overwrites
> and fixes the fdto phandle's value to match the fdt's.
>=20
> A test is added that checks that newly added phandles and existing
> phandles work as expected.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> here comes the next iteration of the patch that fixes overlay
> application to not overwrite existing phandles.
>=20
> It is rebased to current main branch. The changes since v2 are:
>=20
>  - Add documentation
>  - Apply the simplification from 24f60011fd43 ("libfdt: Simplify
>    adjustment of values for local fixups") in the functions added here.
>  - Rename functions using shorter and better names
>  - Changed the test device trees to yield a hole in the phandle space
>  - Checked each phandle value not being overwritten separately
>=20
> Note I didn't switch the order of overlay_prevent_phandle_overwrite() and
> overlay_fixup_phandles() because the overlay's phandles must be resolved
> before I can do the recursion needed in
> overlay_prevent_phandle_overwrite().

I'm not following what you mean here.  IIUC, conflicts of the sort
you're handling can only arise when the overlay describes a phandle
for the target node of the reference - and therefore that target is in
the overlay.  In that case all references to it in the overlay should
be encoded in __local_fixups__ rather than __fixups__.  __fixups__, in
contrast describes references to nodes that aren't in the overlay, and
so can't be filled in - even with a tentative value - until the
overlay is applied.

So, I'm not seeing how fixing these conflicts depends on resolution of
those "external" fixups, rather than just the "local" fixups.  Am I
missing something?

>=20
> Best regards
> Uwe
>=20
>  libfdt/fdt_overlay.c              | 251 ++++++++++++++++++++++++++++++
>  tests/overlay_base_phandle.dts    |  21 +++
>  tests/overlay_overlay_phandle.dts |  34 ++++
>  tests/run_tests.sh                |  28 ++++
>  4 files changed, 334 insertions(+)
>  create mode 100644 tests/overlay_base_phandle.dts
>  create mode 100644 tests/overlay_overlay_phandle.dts
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 7ec839ae7118..f500f2d07030 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -498,6 +498,249 @@ static int overlay_fixup_phandles(void *fdt, void *=
fdto)
>  	return 0;
>  }
> =20
> +/**
> + * overlay_adjust_local_conflicting_phandle: Changes a phandle value

Nothing about this function's behaviour is really specific to
conflicts or local fixups: it just changes the phandle value.  So
maybe simply 'change_phandle()'.  It's a static function, so it
doesn't need to have a prefix to namespace it.

> + * @fdto: Device tree overlay

No reason this has to be an overlay, any tree will do.

> + * @node: The node the phandle is set for
> + * @fdt_phandle: The new value for the phandle

No reason this value has to come from an fdt.

> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_adjust_local_conflicting_phandle(void *fdto, int node,
> +						    uint32_t fdt_phandle)
> +{
> +	const fdt32_t *php;
> +	int len, ret;
> +
> +	php =3D fdt_getprop(fdto, node, "phandle", &len);
> +	if (php && len =3D=3D sizeof(*php)) {
> +		ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt_phandle);
> +		if (ret)
> +			return ret;
> +	}

This can also be simplified using fdt_getprop_w() and fdt_st_():

	php =3D fdt_getprop_w(fdt, node, "phandle", &len);
	if (php && len =3D=3D sizeof(*php))
		fdt32_st_(php, phandle);


> +
> +	php =3D fdt_getprop(fdto, node, "linux,phandle", &len);
> +	if (php && len =3D=3D sizeof(*php)) {
> +		ret =3D fdt_setprop_inplace_u32(fdto, node, "linux,phandle", fdt_phand=
le);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * overlay_update_node_conflicting_references - Recursively replace phan=
dle values

This name is still pretty long, and it describes the use case rather
than what it does.  How about: update_one_phandle_refs(), and describe
it in terms of making the necessary ref changes for a single phandle
value changing.

> + * @fdto: Device tree overlay blob
> + * @tree_node: Node to recurse into
> + * @fixup_node: Node offset of the matching local fixups node
> + * @fdt_phandle: Value to replace phandles with
> + * @fdto_phandle: Value to be replaced
> + *
> + * Replaces all phandles with value @fdto_phandle by @fdt_phandle.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_update_node_conflicting_references(void *fdto, int tr=
ee_node,
> +						      int fixup_node,
> +						      uint32_t fdt_phandle,
> +						      uint32_t fdto_phandle)
> +{
> +	int fixup_prop;
> +	int fixup_child;
> +	int ret;
> +
> +	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
> +		const fdt32_t *fixup_val;
> +		const char *name;
> +		char *tree_val;
> +		int fixup_len;
> +		int tree_len;
> +		int i;
> +
> +		fixup_val =3D fdt_getprop_by_offset(fdto, fixup_prop,
> +						  &name, &fixup_len);
> +		if (!fixup_val)
> +			return fixup_len;
> +
> +		if (fixup_len % sizeof(uint32_t))
> +			return -FDT_ERR_BADOVERLAY;
> +		fixup_len /=3D sizeof(uint32_t);
> +
> +		tree_val =3D fdt_getprop_w(fdto, tree_node, name, &tree_len);
> +		if (!tree_val) {
> +			if (tree_len =3D=3D -FDT_ERR_NOTFOUND)
> +				return -FDT_ERR_BADOVERLAY;
> +
> +			return tree_len;
> +		}
> +
> +		for (i =3D 0; i < fixup_len; i++) {
> +			fdt32_t *refp;
> +			uint32_t valp;

The "p" in "refp" is referring to the fact it's a pointer (in the C
sense) to a reference (in the fdt sense).  So "valp" isn't a good name
for the value when you dereference it - that suggests a pointer (in
the C sense) to a value (in ?? sense).  Just 'ref' or 'refval' would
be better.

Or just inline the fdt32_ld() into the if, since you only use it once.

> +
> +			refp =3D (fdt32_t *)(tree_val + fdt32_ld_(fixup_val + i));
> +			valp =3D fdt32_ld(refp);
> +
> +			if (valp =3D=3D fdto_phandle)
> +				fdt32_st(refp, fdt_phandle);
> +		}
> +	}
> +
> +	fdt_for_each_subnode(fixup_child, fdto, fixup_node) {
> +		const char *fixup_child_name =3D fdt_get_name(fdto, fixup_child, NULL);
> +		int tree_child;
> +
> +		tree_child =3D fdt_subnode_offset(fdto, tree_node, fixup_child_name);
> +
> +		if (tree_child =3D=3D -FDT_ERR_NOTFOUND)
> +			return -FDT_ERR_BADOVERLAY;
> +		if (tree_child < 0)
> +			return tree_child;
> +
> +		ret =3D overlay_update_node_conflicting_references(fdto, tree_child,
> +								 fixup_child,
> +								 fdt_phandle,
> +								 fdto_phandle);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * overlay_update_local_conflicting_references - Recursively replace pha=
ndle values
> + * @fdto: Device tree overlay blob
> + * @fdt_phandle: Value to replace phandles with
> + * @fdto_phandle: Value to be replaced
> + *
> + * Replaces all phandles with value @fdto_phandle by @fdt_phandle.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_update_local_conflicting_references(void *fdto,
> +						       uint32_t fdt_phandle,
> +						       uint32_t fdto_phandle)
> +{
> +	int fixups;
> +
> +	fixups =3D fdt_path_offset(fdto, "/__local_fixups__");
> +	if (fixups =3D=3D -FDT_ERR_NOTFOUND)
> +		return 0;
> +	if (fixups < 0)
> +		return fixups;
> +
> +	return overlay_update_node_conflicting_references(fdto, 0, fixups,
> +							  fdt_phandle,
> +							  fdto_phandle);
> +}
> +
> +/**
> + * overlay_prevent_phandle_overwrite_node - Helper function for overlay_=
prevent_phandle_overwrite
> + * @fdt: Base Device tree blob
> + * @fdtnode: Node in fdt that is checked for an overwrite
> + * @fdto: Device tree overlay blob
> + * @fdtonode: Node in fdto matching @fdtnode
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
> +						  void *fdto, int fdtonode)
> +{
> +	uint32_t fdt_phandle, fdto_phandle;
> +	int fdtochild;
> +
> +	fdt_phandle =3D fdt_get_phandle(fdt, fdtnode);
> +	fdto_phandle =3D fdt_get_phandle(fdto, fdtonode);
> +
> +	if (fdt_phandle && fdto_phandle) {
> +		int ret;
> +
> +		ret =3D overlay_adjust_local_conflicting_phandle(fdto, fdtonode,
> +							       fdt_phandle);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D overlay_update_local_conflicting_references(fdto,
> +								  fdt_phandle,
> +								  fdto_phandle);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fdt_for_each_subnode(fdtochild, fdto, fdtonode) {
> +		const char *name =3D fdt_get_name(fdto, fdtochild, NULL);
> +		int fdtchild;
> +		int ret;
> +
> +		fdtchild =3D fdt_subnode_offset(fdt, fdtnode, name);
> +		if (fdtchild =3D=3D -FDT_ERR_NOTFOUND)
> +			/*
> +			 * no further overwrites possible here as this node is
> +			 * new
> +			 */
> +			continue;
> +
> +		ret =3D overlay_prevent_phandle_overwrite_node(fdt, fdtchild,
> +							     fdto, fdtochild);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * overlay_prevent_phandle_overwrite - Fixes overlay phandles to not ove=
rwrite base phandles
> + * @fdt: Base Device Tree blob
> + * @fdto: Device tree overlay blob
> + *
> + * Checks recursively if applying fdto overwrites phandle values in the =
base
> + * dtb. When such a phandle is found, the fdto is changed to use the fdt=
's
> + * phandle value to not break references in the base.
> + *
> + * returns:
> + *      0 on success
> + *      Negative error code on failure
> + */
> +static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
> +{
> +	int fragment;
> +
> +	fdt_for_each_subnode(fragment, fdto, 0) {
> +		int overlay;
> +		int target;
> +		int ret;
> +
> +		overlay =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
> +		if (overlay =3D=3D -FDT_ERR_NOTFOUND)
> +			continue;
> +
> +		if (overlay < 0)
> +			return overlay;
> +
> +		target =3D fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
> +		if (target < 0)
> +			return target;
> +
> +		ret =3D overlay_prevent_phandle_overwrite_node(fdt, target,
> +							     fdto, overlay);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * overlay_apply_node - Merges a node into the base device tree
>   * @fdt: Base Device Tree blob
> @@ -802,18 +1045,26 @@ int fdt_overlay_apply(void *fdt, void *fdto)
>  	if (ret)
>  		goto err;
> =20
> +	/* Increase all phandles in the fdto by delta */
>  	ret =3D overlay_adjust_local_phandles(fdto, delta);
>  	if (ret)
>  		goto err;
> =20
> +	/* Adapt the phandle values in fdto to the above increase */
>  	ret =3D overlay_update_local_references(fdto, delta);
>  	if (ret)
>  		goto err;
> =20
> +	/* Update fdto's phandles using symbols from fdt */
>  	ret =3D overlay_fixup_phandles(fdt, fdto);
>  	if (ret)
>  		goto err;
> =20
> +	/* Don't overwrite phandles in fdt */
> +	ret =3D overlay_prevent_phandle_overwrite(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
>  	ret =3D overlay_merge(fdt, fdto);
>  	if (ret)
>  		goto err;
> diff --git a/tests/overlay_base_phandle.dts b/tests/overlay_base_phandle.=
dts
> new file mode 100644
> index 000000000000..20639a7f4026
> --- /dev/null
> +++ b/tests/overlay_base_phandle.dts
> @@ -0,0 +1,21 @@
> +/*
> + * Copyright (c) 2024 Uwe Kleine-K=F6nig
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	node_a: a {
> +		value =3D <17>;
> +	};
> +
> +	node_b: b {
> +		a =3D <&node_a>;
> +	};
> +
> +	node_d: d {
> +		b =3D <&node_b>;
> +	};
> +};
> diff --git a/tests/overlay_overlay_phandle.dts b/tests/overlay_overlay_ph=
andle.dts
> new file mode 100644
> index 000000000000..a0fa668faa5c
> --- /dev/null
> +++ b/tests/overlay_overlay_phandle.dts
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright (c) 2024 Uwe Kleine-K=F6nig
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	/*
> +	 * /b already has a label "node_b" in the base dts, also b is already
> +	 * referenced in the base, so both the base's b and this b have a
> +	 * phandle value.
> +	 */
> +	node_b2: b {
> +		value =3D <42>;
> +		d =3D <&node_d>;
> +	};
> +
> +	node_c: c {
> +		value =3D <23>;
> +		b =3D <&node_b2>;
> +	};
> +
> +	d {
> +		a =3D <&node_a>;
> +		c =3D <&node_c>;
> +	};
> +};
> +
> +&node_a {
> +	value =3D <32>;
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 3225a12bbb06..f13cdb216d2b 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1040,6 +1040,34 @@ fdtoverlay_tests() {
>      run_dtc_test -@ -I dts -O dtb -o $stacked_addlabeldtb $stacked_addla=
bel
> =20
>      run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-=
ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addl=
abeldtb} ${stacked_bardtb} ${stacked_bazdtb}
> +
> +    # verify that phandles are not overwritten
> +    run_dtc_test -@ -I dts -O dtb -o overlay_base_phandle.test.dtb "$SRC=
DIR/overlay_base_phandle.dts"
> +    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb "$=
SRCDIR/overlay_overlay_phandle.dts"
> +    run_wrap_test $FDTOVERLAY -i overlay_base_phandle.test.dtb -o overla=
y_base_phandleO.test.dtb overlay_overlay_phandle.test.dtb
> +
> +    pa=3D$($DTGET overlay_base_phandleO.test.dtb /a phandle)
> +    pb=3D$($DTGET overlay_base_phandleO.test.dtb /b phandle)
> +    pc=3D$($DTGET overlay_base_phandleO.test.dtb /c phandle)
> +    pd=3D$($DTGET overlay_base_phandleO.test.dtb /d phandle)
> +    ba=3D$($DTGET overlay_base_phandleO.test.dtb /b a)
> +    bd=3D$($DTGET overlay_base_phandleO.test.dtb /b d)
> +    cb=3D$($DTGET overlay_base_phandleO.test.dtb /c b)
> +    da=3D$($DTGET overlay_base_phandleO.test.dtb /d a)
> +    db=3D$($DTGET overlay_base_phandleO.test.dtb /d b)
> +    dc=3D$($DTGET overlay_base_phandleO.test.dtb /d c)
> +
> +    shorten_echo "check phandle to noda a wasn't overwritten:	"
> +    run_wrap_test test "$ba-$da" =3D "$pa-$pa"
> +
> +    shorten_echo "check phandle to noda b wasn't overwritten:	"
> +    run_wrap_test test "$cb-$db" =3D "$pb-$pb"
> +
> +    shorten_echo "check phandle to noda c wasn't overwritten:	"
> +    run_wrap_test test "$dc" =3D "$pc"
> +
> +    shorten_echo "check phandle to noda d wasn't overwritten:	"
> +    run_wrap_test test "$bd" =3D "$pd"
>  }
> =20
>  pylibfdt_tests () {
>=20
> base-commit: 24f60011fd43683d8e3916435c4c726e9baac9c9

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BcvGqoI+LbrPfViI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmXcJ3AACgkQzQJF27ox
2Gd4NxAAgLSbFwDnBgNh/v+r9D5NLdEknM3WbhBUgVpjr5OGOiIuoSCE7+H777/K
5JW1zSUH/ljEYNDZ5XcJOfmAU2T0RxM2ad/cpsqsxk312edZc/Z2e48bDk5osuhX
QewnMgKE1WMZgYtvAHi7VAdHazuaFKaCm4gnXWMVKNp+ZP0F0x0GvJMFo8Ra44sM
Ftaha/VHz4cX2J2FKsKVCVAion1nAWxPliqVQf9KgufTOQlVk+4r9zNY2OLFOMpB
KeMHEZpZJ7BD5a9Wy+M1TQ0Nl6JuK5ANxGUpS9M4bZMgbWrg+pZxwKH6syR2Y8Tv
jFraNtN4NQHIlKnacgYGFktOEGTYoCpnjju+jF2Y8+QGqOU9JRCIk6drcNBA0Dlk
SyvoKH8x0a1//0P/r/wt1GuI6OduwvzakdOsg7eroifwr+6dSSwaDGJOLCO4f+ax
80QNCVLUMO9T4gePChp7Gkb0ATHn5hRZV8s3UMF/NQGAGwihnoMWJcsLVUVq0F+n
m9CdXNE4lvkEvn7u+IlopU84rHrRrneMvLB8yzT0HWNJQMAK5QzyXCbe2IocGrBb
QOI0sodScli0JtscHpK3y3sRZkQcUHKBwl22CmLjRgH2Jzz89VLn8GY3D8T7H5X/
8SXeOEq0UgH5phQv1eCLaAp54I0Iflzbg0I8Hqr6FbNG1ohQd0k=
=IOQH
-----END PGP SIGNATURE-----

--BcvGqoI+LbrPfViI--
