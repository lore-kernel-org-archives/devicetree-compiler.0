Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA02A3F
	for <devicetree-compiler@vger.kernel.org>; Thu, 22 Feb 2024 06:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708583592; cv=none; b=iEkLXpSYGEYA2ukpz991kkqTghKKu07Xn9rfnfTqZPzzrrhnHvU9+fiHObor458Rv966kGaV5mbUZLRbUzboO+iPj3AlDKPfJKVGiXBRkFQ3k7o8B5ov6EV9Jc4PFqY4Y4F8OlzJxv3d3Ppc7n8F7683nhtZ67PjQrBZMRIChU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708583592; c=relaxed/simple;
	bh=Anez61TptufGKyY9+P+85fM7VpISBnO3pREauU7iy9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMBbO7M4VI2Ipq6icGy7VcEmDGPIDtsCeiNWE3FMQ7J+mxmpf/EqGXNRARU+tOPMbLqJT7nhIXxfptjZl4hDfEY14x+GWQLmT+q+DAjkV94sjoKQQVc6KQbBlz3bQFeAsJHJGx2QazSgYahLQ+xYy+b85jROiDv0AfQpI0wUYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=OTExYbOu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="OTExYbOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1708583585;
	bh=J+xsUKKObtH5Zyyx0Mohg3ZviEQw7yNzfH+nwNQpH8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTExYbOujLNSoo5Ml9MeN1BXR0KiRo2JsXRUQDBrYUWNYPcX9s+Ib+HYCcVCqtAOR
	 1eVE69EyTI9WK6H4A+CCNUCLpALfqDE1iBioDDhMJkKrnVNpb6D3uxUaqfgODlZIwc
	 xi1BtdtmwJ9HZgO5DfQRE9K4sWbP08WWlSZVC0jlIcRgaEERBU7VUWhc76Z8e97Cs4
	 vMNKS0hp/MbTenuKedM2xsH573CMDp9pe+vUn1R9gyIRnlk2RJKpb9+owvGyI8eks/
	 uixANgfOQzRM4M7Lz9w7gVbEma0+7SpJ7JvXYT+KhMfupdG5tDqhcfVuQzsqSlpCpx
	 cjK5IVIjVJxfg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TgNcd20tyz4wcR; Thu, 22 Feb 2024 17:33:05 +1100 (AEDT)
Date: Thu, 22 Feb 2024 17:32:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Yves-Alexis Perez <corsac@debian.org>,
	devicetree-compiler@vger.kernel.org, entwicklung@pengutronix.de
Subject: Re: [PATCH v2] libfdt: overlay: ensure that existing phandles are
 not overwritten
Message-ID: <ZdbqaoTUfBmSlC98@zatzit>
References: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z6NgtHNHOtOZjozD"
Content-Disposition: inline
In-Reply-To: <20240216181919.1648843-2-u.kleine-koenig@pengutronix.de>


--z6NgtHNHOtOZjozD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 07:19:20PM +0100, Uwe Kleine-K=F6nig wrote:
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
> last year I already tried to address the issue of phandle overwriting in
> overlays. See
> https://lore.kernel.org/all/20230426100231.484497-1-u.kleine-koenig@pengu=
tronix.de
>=20
> The approach I took back then required allocating a mapping. This isn't
> suiteable for libfdt though because it's expected to be embedded in code
> that cannot allocate dynamic memory. So here I implement an algorithm
> that doesn't allocate memory at the cost of a higher run time because it
> iterates over the whole dtbo for each conflict found. But there isn't a
> better way to do it without allocating memory.

Thanks for following this up.  I think I finally got my head around
what's going on here.  I really wish there were a more elegant way of
dealing with it, but I don't think there is.  That said, there are
some smaller improvements that I think can be made, detailed comments
below.

>  libfdt/fdt_overlay.c              | 230 ++++++++++++++++++++++++++++++
>  tests/overlay_base_phandle.dts    |  21 +++
>  tests/overlay_overlay_phandle.dts |  30 ++++
>  tests/run_tests.sh                |  23 +++
>  4 files changed, 304 insertions(+)
>  create mode 100644 tests/overlay_base_phandle.dts
>  create mode 100644 tests/overlay_overlay_phandle.dts
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 5c0c3981b89d..914acc5b14a6 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -520,6 +520,228 @@ static int overlay_fixup_phandles(void *fdt, void *=
fdto)
>  	return 0;
>  }
> =20

All of these new functions could do with descriptive comments saying
what they do (see the existing code for examples).

> +static int overlay_adjust_node_conflicting_phandle(void *fdto, int node,
> +						   uint32_t fdt_phandle,
> +						   uint32_t fdto_phandle)
> +{
> +	const fdt32_t *php;
> +	int len, ret;
> +	int child;
> +
> +	php =3D fdt_getprop(fdto, node, "phandle", &len);
> +	if (php && len =3D=3D sizeof(*php) && fdt32_to_cpu(*php) =3D=3D fdto_ph=
andle) {
> +		ret =3D fdt_setprop_inplace_u32(fdto, node, "phandle", fdt_phandle);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	php =3D fdt_getprop(fdto, node, "linux,phandle", &len);
> +	if (php && len =3D=3D sizeof(*php) && fdt32_to_cpu(*php) =3D=3D fdto_ph=
andle) {
> +		ret =3D fdt_setprop_inplace_u32(fdto, node, "linux,phandle", fdt_phand=
le);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fdt_for_each_subnode(child, fdto, node) {
> +		ret =3D overlay_adjust_node_conflicting_phandle(fdto, child,
> +							      fdt_phandle, fdto_phandle);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int overlay_adjust_local_conflicting_phandle(void *fdto,
> +						    uint32_t fdt_phandle,
> +						    uint32_t fdto_phandle)
> +{
> +	return overlay_adjust_node_conflicting_phandle(fdto, 0, fdt_phandle,
> +						       fdto_phandle);
> +}

I don't believe you need the above two functions: see further comments
at the call site.

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
> +

Extraneous blank line.

> +		const fdt32_t *fixup_val;
> +                const char *tree_val;

libfdt style is to use tab indents, looks like most of this block has
space indents instead.

> +                const char *name;
> +                int fixup_len;
> +                int tree_len;
> +                int i;
> +
> +                fixup_val =3D fdt_getprop_by_offset(fdto, fixup_prop,
> +                                                  &name, &fixup_len);
> +                if (!fixup_val)
> +                        return fixup_len;
> +
> +                if (fixup_len % sizeof(uint32_t))
> +                        return -FDT_ERR_BADOVERLAY;
> +                fixup_len /=3D sizeof(uint32_t);
> +
> +                tree_val =3D fdt_getprop(fdto, tree_node, name, &tree_le=
n);
> +                if (!tree_val) {
> +                        if (tree_len =3D=3D -FDT_ERR_NOTFOUND)
> +                                return -FDT_ERR_BADOVERLAY;
> +
> +                        return tree_len;
> +                }
> +
> +		for (i =3D 0; i < fixup_len; i++) {
> +			fdt32_t adj_val;
> +			uint32_t poffset;
> +
> +			poffset =3D fdt32_to_cpu(fixup_val[i]);

You can use fdt32_ld_() here to slightly simplify this

> +
> +			/*
> +			 * phandles to fixup can be unaligned.
> +			 *
> +			 * Use a memcpy for the architectures that do
> +			 * not support unaligned accesses.
> +			 */
> +			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));

And here you can use fdt32_ld() which has unaligned access handling
built in.

> +
> +			if (fdt32_to_cpu(adj_val) =3D=3D fdto_phandle) {
> +
> +				adj_val =3D cpu_to_fdt32(fdt_phandle);
> +
> +				ret =3D fdt_setprop_inplace_namelen_partial(fdto,
> +									  tree_node,
> +									  name,
> +									  strlen(name),
> +									  poffset,
> +									  &adj_val,
> +									  sizeof(adj_val));
> +				if (ret =3D=3D -FDT_ERR_NOSPACE)
> +					return -FDT_ERR_BADOVERLAY;
> +
> +				if (ret)
> +					return ret;

And here you can use fdt32_st() on (tree_val + poffset), avoiding
quite some complexity.

> +			}
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
> +                                                      fixup_child,
> +                                                      fdt_phandle,
> +                                                      fdto_phandle);
> +	}
> +
> +	return 0;
> +}
> +
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
> +static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
> +						  void *fdto, int fdtonode)

Maybe "overlay_resolve_phandle_conflict()" for a slightly shorter
function name.

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
> +		ret =3D overlay_adjust_local_conflicting_phandle(fdto,
> +							       fdt_phandle,
> +							       fdto_phandle);
> +		if (ret)
> +			return ret;

So while, as you've seen, there can be conflicting phandles between
the fdt and the fdto, within the fdto a particular phandle should only
appear on a single node.  If a phandle is duplicated across nodes
witin a single fdto, you have bigger problems.  Therefore, having
found a conflict, you're already found the only place you need to
change the phandle property itself - you don't need to scan the full
fdto again.

So I believe you can replace the above call with just setting the
phandle property on fdtonode.

> +
> +		ret =3D overlay_update_local_conflicting_references(fdto,
> +								  fdt_phandle,
> +								  fdto_phandle);
> +		if (ret)
> +			return ret;

You do, of course, have to scan the whole fdto to update references.

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
> @@ -824,18 +1046,26 @@ int fdt_overlay_apply(void *fdt, void *fdto)
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

I think this should go above overlay_fixup_phandles(), so that we're
completing all the __local_fixups__ based adjustments before going to
the __fixups__ based adjustments.

> +
>  	ret =3D overlay_merge(fdt, fdto);
>  	if (ret)
>  		goto err;
> diff --git a/tests/overlay_base_phandle.dts b/tests/overlay_base_phandle.=
dts
> new file mode 100644
> index 000000000000..36f013c772a2
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
> +	node_c: c {
> +		b =3D <&node_b>;
> +	};
> +};
> diff --git a/tests/overlay_overlay_phandle.dts b/tests/overlay_overlay_ph=
andle.dts
> new file mode 100644
> index 000000000000..218e5266b992
> --- /dev/null
> +++ b/tests/overlay_overlay_phandle.dts
> @@ -0,0 +1,30 @@
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
> +	/* /a already has a label "node_a" in the base dts */
> +	node_b2: b {
> +		value =3D <42>;
> +		c =3D <&node_c>;
> +	};
> +
> +	c {
> +		a =3D <&node_a>;
> +		d =3D <&node_d>;
> +	};
> +
> +	node_d: d {
> +		value =3D <23>;
> +		b =3D <&node_b2>;
> +	};
> +};
> +
> +&node_a {
> +	value =3D <32>;
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 3225a12bbb06..256472b623a3 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1040,6 +1040,28 @@ fdtoverlay_tests() {
>      run_dtc_test -@ -I dts -O dtb -o $stacked_addlabeldtb $stacked_addla=
bel
> =20
>      run_fdtoverlay_test baz "/foonode/barnode/baznode" "baz-property" "-=
ts" ${stacked_base_nolabeldtb} ${stacked_addlabel_targetdtb} ${stacked_addl=
abeldtb} ${stacked_bardtb} ${stacked_bazdtb}
> +
> +    # verify that labels are not overwritten
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
> +    bc=3D$($DTGET overlay_base_phandleO.test.dtb /b c)
> +    ca=3D$($DTGET overlay_base_phandleO.test.dtb /c a)
> +    cb=3D$($DTGET overlay_base_phandleO.test.dtb /c b)
> +    cd=3D$($DTGET overlay_base_phandleO.test.dtb /c d)
> +    db=3D$($DTGET overlay_base_phandleO.test.dtb /d b)
> +    shorten_echo "check phandle wasn't overwritten:	"
> +    if test "$ba-$bc-$ca-$cb-$cd-$db" =3D "$pa-$pc-$pa-$pb-$pd-$pb"; then

I'd prefer to see each of these pairs as a separate test case.

> +	    PASS
> +    else
> +	    FAIL
> +    fi
>  }
> =20
>  pylibfdt_tests () {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z6NgtHNHOtOZjozD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmXW6moACgkQzQJF27ox
2GcBzw//XANUNXF3n4Jh1GAe9pBpy8uexNErLSmIzUJCZQM8z5hL+BReuqIecJtM
W6zCycviKV02leXYINPzGckt64d6qi+ngrDROjUpB96Xeg3xH6lde/G/oU1MhMU9
byrhCbSUqu7Itey5NMEejh56kE2g3hZqUs9mengjclHVCJO0f0vaXmbgZ4k3Vm+8
LdpIysdyLQsXKaPCXXwvWpb4JYaD6tnPmSqePhwBeHDfy7+/Y2oNN5w6+wsKddlQ
TYBDFXUh9gqaXUocJ6KL+bydQCK4BgnuRAK0p4zufewu8lP57S4sVMOurCe2hXYp
HpoB3uHOgChb9jEI39I99Mvg3Q1DT7oLgxLRwJxFNNXb6nslAiUdAAOjslAtQQRd
2/UaI64XMPDYVtWT/XfeSEvpjCnO98jRc2paQOejUoJ950w5Y+CZ4eoV+JYEXY4h
MUBW9R7RX5m4eCL6kTn0E4M7nHqemol/jTJKUCYtMkd5HbM9ZiZ9QxjZcqqvQT9x
2JyEnrSSee6zPrjrtsoMEP9GC4pRp+ZtJcFHFUEE5p51mslT7RfCD+U5Aill9bL/
n4/tfQAnzUNT5C/jbDgtC12LVMZjdwKOcAREhaWtn0Uy33GPEe/OeJfmFne84f6v
CFwg7A/44eeNrSxeG/diYJUyacniUy6+kS38tGq9NpQojYSpOvQ=
=9Q9M
-----END PGP SIGNATURE-----

--z6NgtHNHOtOZjozD--
