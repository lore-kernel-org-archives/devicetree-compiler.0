From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 10/12] libfdt: Add overlay application function
Date: Mon, 27 Jun 2016 15:26:07 +1000
Message-ID: <20160627052607.GK4242@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-11-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bX/mw5riLlTkt+Gv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467005117;
	bh=YVkqEsPN7P8sYbprm4KbbBJEvvWsauWnH4q0sdyl314=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYlDZmz7fmjKAHEB0R2rSLuBUfGKRAPuQxmPZyGO1PfYLSfvBK1dmp0cY6QSQZF49
	 tp7CialLmYLbtxEzmj6z7Y673GmukvPgUK3KKbjCFr15rBdIwdY32TyjNh2u6eN6mK
	 TGJhTn4Nc+82A5pE6GP1oV3enI6QZJYpFx6uSzTQ=
Content-Disposition: inline
In-Reply-To: <20160624142757.32735-11-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--bX/mw5riLlTkt+Gv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 04:27:55PM +0200, Maxime Ripard wrote:
> The device tree overlays are a good way to deal with user-modifyable
> boards or boards with some kind of an expansion mechanism where we can
> easily plug new board in (like the BBB, the Raspberry Pi or the CHIP).
>=20
> Add a new function to merge overlays with a base device tree.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/libfdt.h         |  30 ++++
>  lib/Kconfig              |   5 +
>  lib/libfdt/Makefile      |   2 +
>  lib/libfdt/fdt_overlay.c | 381 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 418 insertions(+)
>  create mode 100644 lib/libfdt/fdt_overlay.c
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index b8758de3ae54..039ecb0c1ba7 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -1747,6 +1747,36 @@ int fdt_add_subnode(void *fdt, int parentoffset, c=
onst char *name);
>   */
>  int fdt_del_node(void *fdt, int nodeoffset);
> =20
> +/**
> + * fdt_overlay_apply - Applies a DT overlay on a base DT
> + * @fdt: pointer to the base device tree blob
> + * @fdto: pointer to the device tree overlay blob
> + *
> + * fdt_overlay_apply() will apply the given device tree overlay on the
> + * given base device tree.
> + *
> + * Expect the base device tree to be modified, even if the function
> + * returns an error.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there's not enough space in the base device tree
> + *	-FDT_ERR_NOTFOUND, the overlay points to some inexistant nodes or
> + *		properties in the base DT
> + *	-FDT_ERR_BADPHANDLE, the phandles in the overlay do not have the right
> + *		magic
> + *	-FDT_ERR_INTERNAL,
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADOFFSET,
> + *	-FDT_ERR_BADPATH,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTRUCTURE,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_TRUNCATED, standard meanings
> + */
> +int fdt_overlay_apply(void *fdt, void *fdto);
> +
>  /**********************************************************************/
>  /* Debugging / informational functions                                */
>  /**********************************************************************/
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 02ca4058d37e..16ff01a2cd37 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -139,6 +139,11 @@ config OF_LIBFDT
>  	  particular compatible nodes. The library operates on a flattened
>  	  version of the device tree.
> =20
> +config OF_LIBFDT_OVERLAY
> +	bool "Enable the FDT library overlay support"
> +	help
> +	  This enables the FDT library (libfdt) overlay support.
> +
>  config SPL_OF_LIBFDT
>  	bool "Enable the FDT library for SPL"
>  	default y if SPL_OF_CONTROL
> diff --git a/lib/libfdt/Makefile b/lib/libfdt/Makefile
> index 8b86c15904cb..6ef8290f4e09 100644
> --- a/lib/libfdt/Makefile
> +++ b/lib/libfdt/Makefile
> @@ -15,3 +15,5 @@ obj-y +=3D \
>  	fdt_empty_tree.o \
>  	fdt_addresses.o \
>  	fdt_region.o
> +
> +obj-$(CONFIG_OF_LIBFDT_OVERLAY) +=3D fdt_overlay.o
> diff --git a/lib/libfdt/fdt_overlay.c b/lib/libfdt/fdt_overlay.c
> new file mode 100644
> index 000000000000..5835a90afafe
> --- /dev/null
> +++ b/lib/libfdt/fdt_overlay.c
> @@ -0,0 +1,381 @@
> +#include "libfdt_env.h"
> +
> +#include <fdt.h>
> +#include <libfdt.h>
> +
> +#include "libfdt_internal.h"
> +
> +static uint32_t overlay_get_target_phandle(const void *fdto, int fragmen=
t)
> +{
> +	const uint32_t *val;
> +	int len;
> +
> +	val =3D fdt_getprop(fdto, fragment, "target", &len);
> +	if (!val || (*val =3D=3D 0xffffffff) || (len !=3D sizeof(*val)))
> +		return 0;

This doesn't distinguish between a missing property (which may
indicate a valid overlay using a target-path or some other method)
and a badly formatted 'target' property, which is definitely an error
in the overlay.

I think those should be treated differently.

> +	return fdt32_to_cpu(*val);
> +}
> +
> +static int overlay_get_target(const void *fdt, const void *fdto,
> +			      int fragment)
> +{
> +	uint32_t phandle;
> +	const char *path;
> +
> +	/* Try first to do a phandle based lookup */
> +	phandle =3D overlay_get_target_phandle(fdto, fragment);
> +	if (phandle)
> +		return fdt_node_offset_by_phandle(fdt, phandle);
> +
> +	/* And then a path based lookup */
> +	path =3D fdt_getprop(fdto, fragment, "target-path", NULL);
> +	if (!path)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	return fdt_path_offset(fdt, path);
> +}
> +
> +static int overlay_phandle_add_offset(void *fdt, int node,
> +				      const char *name, uint32_t delta)
> +{
> +	const uint32_t *val;
> +	uint32_t adj_val;
> +	int len;
> +
> +	val =3D fdt_getprop(fdt, node, name, &len);
> +	if (!val)
> +		return len;
> +
> +	if (len !=3D sizeof(*val))
> +		return -FDT_ERR_BADSTRUCTURE;
> +
> +	adj_val =3D fdt32_to_cpu(*val);
> +	adj_val +=3D delta;

You should probably check for overflow here.

> +
> +	return fdt_setprop_inplace_u32(fdt, node, name, adj_val);
> +}
> +
> +static int overlay_adjust_node_phandles(void *fdto, int node,
> +					uint32_t delta)
> +{
> +	bool found =3D false;
> +	int child;
> +	int ret;
> +
> +	ret =3D overlay_phandle_add_offset(fdto, node, "phandle", delta);
> +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> +		return ret;
> +
> +	if (!ret)
> +		found =3D true;
> +
> +	ret =3D overlay_phandle_add_offset(fdto, node, "linux,phandle", delta);
> +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> +		return ret;

I think the check for phandle vs. linux,phandle should be folded into
overlay_phandle_add_offset().

> +	/*
> +	 * If neither phandle nor linux,phandle have been found return
> +	 * an error.
> +	 */
> +	if (!found && !ret)
> +		return ret;
> +
> +	fdt_for_each_subnode(fdto, child, node)
> +		overlay_adjust_node_phandles(fdto, child, delta);
> +
> +	return 0;
> +}
> +
> +static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
> +{
> +	/*
> +	 * Start adjusting the phandles from the overlay root
> +	 */
> +	return overlay_adjust_node_phandles(fdto, 0, delta);
> +}
> +
> +static int overlay_update_local_node_references(void *fdto,
> +						int tree_node,
> +						int fixup_node,
> +						uint32_t delta)
> +{
> +	int fixup_prop;
> +	int fixup_child;
> +	int ret;
> +
> +	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
> +		const uint32_t *val =3D NULL;
> +		uint32_t adj_val, index;
> +		const char *name;
> +		int fixup_len;
> +		int tree_len;
> +
> +		val =3D fdt_getprop_by_offset(fdto, fixup_prop,
> +					    &name, &fixup_len);
> +		if (!val)
> +			return fixup_len;
> +		index =3D fdt32_to_cpu(*val);

This still doesn't handle the case of multiple fixups within the same
property.  That would be entirely plausible for something like an
interrupt-map property.

> +		val =3D fdt_getprop(fdto, tree_node, name, &tree_len);
> +		if (!val)
> +			return tree_len;
> +
> +		adj_val =3D fdt32_to_cpu(*(val + (index / sizeof(uint32_t))));

phandle values need not be aligned within the property containint them
(e.g. properties which mix strings and integer values).  So you're
going to need to work directly with a byte offset here.

> +		adj_val +=3D delta;
> +		adj_val =3D cpu_to_fdt32(adj_val);
> +
> +		ret =3D fdt_setprop_inplace_namelen_by_index(fdto, tree_node,
> +							   name, strlen(name),
> +							   index, &adj_val,
> +							   sizeof(adj_val));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fdt_for_each_subnode(fdto, fixup_child, fixup_node) {
> +		const char *fixup_child_name =3D fdt_get_name(fdto, fixup_child,
> +							    NULL);
> +		int tree_child;
> +
> +		tree_child =3D fdt_subnode_offset(fdto, tree_node,
> +						fixup_child_name);
> +		if (tree_child < 0)
> +			return tree_child;
> +
> +		ret =3D overlay_update_local_node_references(fdto,
> +							   tree_child,
> +							   fixup_child,
> +							   delta);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int overlay_update_local_references(void *dto, uint32_t delta)
> +{
> +	int fixups;
> +
> +	fixups =3D fdt_path_offset(dto, "/__local_fixups__");
> +	if (fixups < 0) {
> +		/*
> +		 * There's no local phandles to adjust, bail out
> +		 */
> +		if (fixups =3D=3D -FDT_ERR_NOTFOUND)
> +			return 0;
> +
> +		return fixups;
> +	}
> +
> +	/*
> +	 * Update our local references from the root of the tree
> +	 */
> +	return overlay_update_local_node_references(dto, 0, fixups,
> +						    delta);
> +}
> +
> +static int overlay_fixup_one_phandle(void *fdt, void *fdto,
> +				     int symbols_off,
> +				     const char *path, uint32_t path_len,
> +				     const char *name, uint32_t name_len,
> +				     int index, const char *label)
> +{
> +	const char *symbol_path;
> +	uint32_t phandle;
> +	int symbol_off, fixup_off;
> +	int prop_len;
> +
> +	symbol_path =3D fdt_getprop(fdt, symbols_off, label,
> +				  &prop_len);
> +	if (!symbol_path)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	symbol_off =3D fdt_path_offset(fdt, symbol_path);
> +	if (symbol_off < 0)
> +		return symbol_off;
> +
> +	phandle =3D fdt_get_phandle(fdt, symbol_off);
> +	if (!phandle)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	fixup_off =3D fdt_path_offset_namelen(fdto, path, path_len);
> +	if (fixup_off < 0)
> +		return fixup_off;
> +
> +	phandle =3D cpu_to_fdt32(phandle);
> +	return fdt_setprop_inplace_namelen_by_index(fdto, fixup_off,
> +						    name, name_len, index,
> +						    &phandle, sizeof(phandle));

This will be broken on BE systems because fdt_get_phandle() byteswaps
to native order, but setprop_inplace doesn't byteswap back (because
it's input is a byte array, not a u32).

> +};
> +
> +static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
> +				 int property)
> +{
> +	const char *value;
> +	const char *label;
> +	int len;
> +
> +	value =3D fdt_getprop_by_offset(fdto, property,
> +				      &label, &len);
> +	if (!value)
> +		return len;
> +
> +	do {
> +		const char *prop_string =3D value;
> +		const char *path, *name;
> +		uint32_t path_len, name_len;
> +		char *sep, *endptr;
> +		int index;
> +		int ret;
> +
> +		path =3D prop_string;
> +		sep =3D strchr(prop_string, ':');
> +		path_len =3D sep - path;

You need to check for strchr() returning NULL (indicating a badly
formatted fixup missing a separator).

Also... strchr() is not safe.  Again, if the fixup string is badly
formatted and doesn't have a terminating \0, this could overrun, so
you want memchr() instead.

> +		name =3D sep + 1;
> +		sep =3D strchr(name, ':');
> +		name_len =3D sep - name;

And again.

> +		index =3D strtoul(sep + 1, &endptr, 10);
> +		if (endptr <=3D (sep + 1))
> +			return -FDT_ERR_BADSTRUCTURE;

IIRC the index value is supposed to go to the end of that portion of
the fixup, so you should be able to check for *endptr =3D=3D '\0'.

Except.. strtoul() could also overrun if the fixup property doesn't
contain a \0 like it should.

So I think you'd be better off using a memchr() (or strnlen()) to
search for the \0 before you attempt parsing the innards of a single
fixup string.

Ugh.  I hate that we're parsing text numbers in decimal here, but
we're pretty much stuck with that format here.  Doubly so that it's a
gratuitously different way of encoding the (node, property, offset)
tuple from local_fixups.

> +		index =3D strtoul(sep + 1, &endptr, 10);
> +		if (endptr <=3D (sep + 1))
> +			return -FDT_ERR_BADSTRUCTURE;
> +
> +		len -=3D strlen(prop_string) + 1;
> +		value +=3D strlen(prop_string) + 1;

Please don't double call strlen() on the same string - remember it's
O(n) in C.

> +
> +		ret =3D overlay_fixup_one_phandle(fdt, fdto, symbols_off,
> +						path, path_len, name, name_len,
> +						index, label);
> +		if (ret)
> +			return ret;
> +	} while (len > 0);
> +
> +	return 0;
> +}
> +
> +static int overlay_fixup_phandles(void *dt, void *dto)
> +{
> +	int fixups_off, symbols_off;
> +	int property;
> +
> +	symbols_off =3D fdt_path_offset(dt, "/__symbols__");
> +	fixups_off =3D fdt_path_offset(dto, "/__fixups__");
> +
> +	fdt_for_each_property_offset(property, dto, fixups_off)
> +		overlay_fixup_phandle(dt, dto, symbols_off, property);
> +
> +	return 0;
> +}
> +
> +static int apply_overlay_node(void *dt, int target,
> +			      void *dto, int overlay)

I think 'overlay' should be 'fragment' here for consistency?

> +{
> +	int property;
> +	int node;
> +
> +	fdt_for_each_property_offset(property, dto, overlay) {
> +		const char *name;
> +		const void *prop;
> +		int prop_len;
> +		int ret;
> +
> +		prop =3D fdt_getprop_by_offset(dto, property, &name,
> +					     &prop_len);
> +		if (!prop)
> +			return -FDT_ERR_INTERNAL;

Actually, you probably should check the error code returned in
prop_len.  Getting a NOTFOUND would indicate an internal error, but
you could also get BADSTRUCTURE or similar errors which would indicate
an error in input.

> +
> +		ret =3D fdt_setprop(dt, target, name, prop, prop_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fdt_for_each_subnode(dto, node, overlay) {
> +		const char *name =3D fdt_get_name(dto, node, NULL);
> +		int nnode;
> +		int ret;
> +
> +		nnode =3D fdt_add_subnode(dt, target, name);
> +		if (nnode =3D=3D -FDT_ERR_EXISTS)
> +			nnode =3D fdt_subnode_offset(dt, target, name);
> +
> +		if (nnode < 0)
> +			return nnode;
> +
> +		ret =3D apply_overlay_node(dt, nnode, dto, node);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int overlay_merge(void *dt, void *dto)
> +{
> +	int fragment;
> +
> +	fdt_for_each_subnode(dto, fragment, 0) {
> +		int overlay;
> +		int target;
> +		int ret;
> +
> +		target =3D overlay_get_target(dt, dto, fragment);
> +		if (target < 0)
> +			continue;
> +
> +		overlay =3D fdt_subnode_offset(dto, fragment, "__overlay__");
> +		if (overlay < 0)
> +			return overlay;
> +
> +		ret =3D apply_overlay_node(dt, target, dto, overlay);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int fdt_overlay_apply(void *fdt, void *fdto)
> +{
> +	uint32_t delta =3D fdt_get_max_phandle(fdt) + 1;
> +	int ret;
> +
> +	FDT_CHECK_HEADER(fdt);
> +	FDT_CHECK_HEADER(fdto);
> +
> +	ret =3D overlay_adjust_local_phandles(fdto, delta);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D overlay_update_local_references(fdto, delta);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D overlay_fixup_phandles(fdt, fdto);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D overlay_merge(fdt, fdto);
> +	if (!ret)
> +		goto out;
> +
> +err:

This is a confusing use of gotos - this looks like it is in the exit
path for both success and failure cases, but it's not due to the
easy-to-miss goto out above.

> +	/*
> +	 * The base device tree might have been damaged, erase its
> +	 * magic.
> +	 */
> +	fdt_set_magic(fdt, ~0);
> +
> +out:
> +	/*
> +	 * The overlay has been damaged, erase its magic.
> +	 */
> +	fdt_set_magic(fdto, ~0);
> +
> +	return ret;
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bX/mw5riLlTkt+Gv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcLjvAAoJEGw4ysog2bOSxH0QAJVSDGBQhwniN9uaoHzUAfrG
OTlnTgKmI7RFOIMVnam7Lm77LBYe873wDVyz5N3pAQhZeXLXmR+HfEOR4AtsitEM
53pxM0CoQvhKSIFE/sNH6dPMAjV/7lTYjIC7i6wRREXM7DFCjrAqxCw+Yf/ssFl+
wt6WA8p7hj5kvSLBOUd3Mb2e44d2vEwCfkHxl597yZyx/lTxvH6W8tEJMQ+7FBwP
8q4PznlKnjd7Xon0umbWrG/n1g1PxBZ8CLmkCgqYt+J+rL5y+CYfImtE/P5axHEw
1oIya2K20HKxPCUcbCMsvLXvXTcqHQ3Q+KzU+6p8jvhsr1CPaiKR+sDfVtHYnZEI
1iKkWxYLpBDgXMnjCNYMOnZDPP/x6kUx8bbFhUbQq5xNPkb3jBXyZL26TkXkwK/d
npDsHuv+bHmDBJEOga/HCBQUJTrhFvbheptXMftQGDugxhLs8xOYYiG4vP96o0RS
5Sr+hCoEEW5Oa4mHlk2QbHXeIC0uRLQUJQBDLnQCe/ZPbH8jE8ytgAirnQI7v3p6
p280VVFvPDIVXqjGqY/MhETJ2xZtQC/kW8G97t+DeYCenw6IOJvjjo3tgs30ZWFy
FK/cnz7ZP7sLRxF20VQS9Vf/APzkq9Y6fuqCsvEowWPjOV1QgrmYTXO8pe6B9yhO
TUFTa3CmvrpS36WlPjfQ
=1vEU
-----END PGP SIGNATURE-----

--bX/mw5riLlTkt+Gv--
