From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 7/9] libfdt: Add overlay application function
Date: Fri, 10 Jun 2016 17:28:11 +0300
Message-ID: <34997AD3-B621-4823-920E-22E4A6F0E0D1@konsulko.com>
References: <1464340402-2249-1-git-send-email-maxime.ripard@free-electrons.com> <1464340402-2249-8-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:mime-version:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ZWEnGfok7rwpirMASxmUNSbaUHeUwNA7og/pMZ0V0CY=;
        b=hp8Egpjjn6u7QqlxhNLsabIfthg/AOfHoJTBl6H7v5Q0uKE9Qb7qTFsnmnoI8VYpT7
         NE8EzDbYOZVnaxgE9xUIwYxTVy1F60HWqW5uq+/9nMv8+16NWXx110TsPtstKk+HuscP
         1s900ijMuQjrfNYpNz9fCY7sN5oj86ye1KMD8=
In-Reply-To: <1464340402-2249-8-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Hi Maxime,

> On May 27, 2016, at 12:13 , Maxime Ripard <maxime.ripard@free-electro=
ns.com> wrote:
>=20
> The device tree overlays are a good way to deal with user-modifyable
> boards or boards with some kind of an expansion mechanism where we ca=
n
> easily plug new board in (like the BBB, the Raspberry Pi or the CHIP)=
=2E
>=20
> Add a new function to merge overlays with a base device tree.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> include/libfdt.h         |  30 ++++
> lib/libfdt/Makefile      |   2 +-
> lib/libfdt/fdt_overlay.c | 414 ++++++++++++++++++++++++++++++++++++++=
+++++++++
> 3 files changed, 445 insertions(+), 1 deletion(-)
> create mode 100644 lib/libfdt/fdt_overlay.c
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index 1e01b2c7ebdf..783067e841a1 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -1698,6 +1698,36 @@ int fdt_add_subnode(void *fdt, int parentoffse=
t, const char *name);
>  */
> int fdt_del_node(void *fdt, int nodeoffset);
>=20
> +/**
> + * fdt_overlay_apply - Applies a DT overlay on a base DT
> + * @fdt: pointer to the base device tree blob
> + * @fdto: pointer to the device tree overlay blob
> + *
> + * fdt_overlay_apply() will apply the given device tree overlay on t=
he
> + * given base device tree.
> + *
> + * Expect the base device tree to be modified, even if the function
> + * returns an error.
> + *

If the base tree has been modified on an error it is unsafe to use it
for booting. A valid strategy would be to scribble over the DT magic
number so that that blob is invalidated.

What are the other people=E2=80=99s opinion on this?

> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there's not enough space in the base device tre=
e
> + *	-FDT_ERR_NOTFOUND, the overlay points to some inexistant nodes or
> + *		properties in the base DT
> + *	-FDT_ERR_BADPHANDLE, the phandles in the overlay do not have the =
right
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
> /********************************************************************=
**/
> /* Debugging / informational functions                               =
 */
> /********************************************************************=
**/
> diff --git a/lib/libfdt/Makefile b/lib/libfdt/Makefile
> index 934d6142c3e9..4935bf012a75 100644
> --- a/lib/libfdt/Makefile
> +++ b/lib/libfdt/Makefile
> @@ -6,4 +6,4 @@
> #
>=20
> obj-y +=3D fdt.o fdt_ro.o fdt_rw.o fdt_strerror.o fdt_sw.o fdt_wip.o =
\
> -	fdt_empty_tree.o fdt_addresses.o fdt_region.o
> +	fdt_empty_tree.o fdt_addresses.o fdt_region.o fdt_overlay.o
> diff --git a/lib/libfdt/fdt_overlay.c b/lib/libfdt/fdt_overlay.c
> new file mode 100644
> index 000000000000..1e68e903c734
> --- /dev/null
> +++ b/lib/libfdt/fdt_overlay.c
> @@ -0,0 +1,414 @@
> +#include "libfdt_env.h"
> +
> +#include <fdt.h>
> +#include <libfdt.h>
> +
> +#include "libfdt_internal.h"
> +
> +static uint32_t fdt_overlay_get_target_phandle(const void *fdto, int=
 node)
> +{
> +	const uint32_t *val;
> +	int len;
> +
> +	val =3D fdt_getprop(fdto, node, "target", &len);
> +	if (!val || (len !=3D sizeof(*val)))
> +		return 0;
> +
> +	return fdt32_to_cpu(*val);
> +}
> +
> +static int fdt_overlay_get_target(const void *fdt, const void *fdto,
> +				  int fragment)
> +{
> +	uint32_t phandle;
> +	const char *path;
> +
> +	/* Try first to do a phandle based lookup */
> +	phandle =3D fdt_overlay_get_target_phandle(fdto, fragment);
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

Those targets are fine; beware there are patches with more target optio=
ns.

> +static int fdt_overlay_adjust_node_phandles(void *fdto, int node,
> +					    uint32_t delta)
> +{
> +	int property;
> +	int child;
> +
> +	fdt_for_each_property(fdto, node, property) {
> +		const uint32_t *val;
> +		const char *name;
> +		uint32_t adj_val;
> +		int len;
> +		int ret;
> +
> +		val =3D fdt_getprop_by_offset(fdto, property,
> +					    &name, &len);
> +		if (!val || (len !=3D sizeof(*val)))

Superfluous parentheses.

> +			continue;
> +
> +		if (strcmp(name, "phandle") && strcmp(name, "linux,phandle"))
> +			continue;
> +
> +		adj_val =3D fdt32_to_cpu(*val);
> +		adj_val +=3D delta;
> +		ret =3D fdt_setprop_inplace_u32(fdto, node, name, adj_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fdt_for_each_subnode(fdto, child, node)
> +		fdt_overlay_adjust_node_phandles(fdto, child, delta);
> +
> +	return 0;
> +}
> +
> +static int fdt_overlay_adjust_local_phandles(void *fdto, uint32_t de=
lta)
> +{
> +	int root;
> +
> +	root =3D fdt_path_offset(fdto, "/");
> +	if (root < 0)
> +		return root;
> +
> +	return fdt_overlay_adjust_node_phandles(fdto, root, delta);
> +}
> +
> +static int _fdt_overlay_update_local_references(void *fdto,
> +						int tree_node,
> +						int fixup_node,
> +						uint32_t delta)
> +{
> +	int fixup_prop;
> +	int fixup_child;
> +
> +	fdt_for_each_property(fdto, fixup_node, fixup_prop) {
> +		const char *fixup_name, *tree_name;
> +		const uint32_t *val =3D NULL;
> +		uint32_t adj_val;
> +		int fixup_len;
> +		int tree_prop;
> +		int tree_len;
> +		int ret;
> +
> +		fdt_getprop_by_offset(fdto, fixup_prop,
> +				      &fixup_name, &fixup_len);
> +
> +		if (!strcmp(fixup_name, "phandle") ||
> +		    !strcmp(fixup_name, "linux,phandle"))
> +			continue;
> +
> +		fdt_for_each_property(fdto, tree_node, tree_prop) {
> +			val =3D fdt_getprop_by_offset(fdto, tree_prop,
> +						    &tree_name, &tree_len);
> +
> +			if (!strcmp(tree_name, fixup_name))
> +				break;
> +		}
> +
> +		if (!val || !tree_len)
> +			return -FDT_ERR_NOTFOUND;
> +
> +		if (!tree_name)
> +			return -FDT_ERR_NOTFOUND;
> +
> +		if (tree_len !=3D 4)
> +			return -FDT_ERR_NOTFOUND;
> +
> +		adj_val =3D fdt32_to_cpu(*val);
> +		adj_val +=3D delta;
> +		ret =3D fdt_setprop_inplace_u32(fdto, tree_node, fixup_name,
> +					      adj_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fdt_for_each_subnode(fdto, fixup_child, fixup_node) {
> +		const char *fixup_child_name =3D fdt_get_name(fdto,
> +							    fixup_child, NULL);
> +		int tree_child;
> +
> +		fdt_for_each_subnode(fdto, tree_child, tree_node) {
> +			const char *tree_child_name =3D fdt_get_name(fdto,
> +								   tree_child,
> +								   NULL);
> +
> +			if (!strcmp(fixup_child_name, tree_child_name))
> +				break;
> +		}
> +
> +		_fdt_overlay_update_local_references(fdto,
> +						     tree_child,
> +						     fixup_child,
> +						     delta);
> +	}
> +
> +	return 0;
> +}
> +
> +static int fdt_overlay_update_local_references(void *dto, uint32_t d=
elta)
> +{
> +	int root, fixups;
> +
> +	root =3D fdt_path_offset(dto, "/");
> +	if (root < 0)
> +		return root;
> +
> +	fixups =3D fdt_path_offset(dto, "/__local_fixups__");
> +	if (root < 0)
> +		return root;
> +
> +	return _fdt_overlay_update_local_references(dto, root, fixups,
> +						    delta);
> +}
> +
> +static int _fdt_overlay_fixup_phandle(void *fdt, void *fdto,
> +				      int symbols_off,
> +				      const char *path, const char *name,
> +				      int index, const char *label)
> +{
> +	const uint32_t *prop_val;
> +	const char *symbol_path;
> +	uint32_t *fixup_val;
> +	uint32_t phandle;
> +	int symbol_off, fixup_off;
> +	int prop_len;
> +	int ret;
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
> +	fixup_off =3D fdt_path_offset(fdto, path);
> +	if (fixup_off < 0)
> +		return fixup_off;
> +
> +	prop_val =3D fdt_getprop(fdto, fixup_off, name,
> +			       &prop_len);
> +	if (!prop_val)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	fixup_val =3D malloc(prop_len);
> +	if (!fixup_val)
> +		return -FDT_ERR_INTERNAL;
> +	memcpy(fixup_val, prop_val, prop_len);
> +
> +	if (fdt32_to_cpu(fixup_val[index]) !=3D 0xdeadbeef) {
> +		ret =3D -FDT_ERR_BADPHANDLE;
> +		goto out;
> +	}
> +
> +	fixup_val[index] =3D cpu_to_fdt32(phandle);
> +	ret =3D fdt_setprop_inplace(fdto, fixup_off,
> +				  name, fixup_val,
> +				  prop_len);
> +
> +out:
> +	free(fixup_val);
> +	return ret;
> +};
> +
> +static int fdt_overlay_fixup_phandle(void *fdt, void *fdto, int symb=
ols_off,
> +				     int property)
> +{
> +	const char *value, *tmp_value;
> +	const char *label;
> +	int tmp_len, len, next;
> +	int table =3D 0;
> +	int i;
> +
> +	value =3D fdt_getprop_by_offset(fdto, property,
> +				      &label, &len);
> +	tmp_value =3D value;
> +	tmp_len =3D len;
> +
> +	do {
> +		next =3D strlen(tmp_value) + 1;
> +		tmp_len -=3D next;
> +		tmp_value +=3D next;
> +		table++;
> +	} while (tmp_len > 0);
> +
> +	for (i =3D 0; i < table; i++) {
> +		const char *prop_string =3D value;
> +		const char *path, *name;
> +		char *prop_cpy, *prop_tmp;
> +		int index, stlen;
> +		char *sep;
> +
> +		stlen =3D strlen(prop_string);
> +		prop_cpy =3D malloc(stlen + 1);
> +		if (!prop_cpy)
> +			return -FDT_ERR_INTERNAL;
> +
> +		strncpy(prop_cpy, prop_string, stlen);
> +		prop_cpy[stlen] =3D '\0';
> +
> +		for (prop_tmp =3D prop_cpy; (sep =3D strchr(prop_tmp, ':'));
> +		     prop_tmp +=3D ((sep - prop_tmp) + 1))
> +			*sep =3D '\0';
> +
> +		prop_tmp =3D prop_cpy;
> +		path =3D prop_tmp;
> +		prop_tmp +=3D strlen(prop_tmp) + 1;
> +
> +		name =3D prop_tmp;
> +		prop_tmp +=3D strlen(prop_tmp) + 1;
> +
> +		index =3D strtol(prop_tmp, NULL, 10);
> +		prop_tmp +=3D strlen(prop_tmp) + 1;
> +
> +		value +=3D stlen + 1;
> +		len -=3D stlen + 1;
> +
> +		_fdt_overlay_fixup_phandle(fdt, fdto, symbols_off,
> +					   path, name, index, label);
> +
> +		free(prop_cpy);
> +	}
> +
> +	return 0;
> +}
> +
> +static int fdt_overlay_fixup_phandles(void *dt, void *dto)
> +{
> +	int fixups_off, symbols_off;
> +	int property;
> +
> +	symbols_off =3D fdt_path_offset(dt, "/__symbols__");
> +	fixups_off =3D fdt_path_offset(dto, "/__fixups__");
> +
> +	fdt_for_each_property(dto, fixups_off, property)
> +		fdt_overlay_fixup_phandle(dt, dto, symbols_off, property);
> +
> +	return 0;
> +}
> +
> +static int fdt_apply_overlay_node(void *dt, void *dto,
> +				  int target, int overlay)
> +{
> +	int property;
> +	int node;
> +
> +	fdt_for_each_property(dto, overlay, property) {
> +		const char *name;
> +		const void *prop;
> +		int prop_len;
> +		int ret;
> +
> +		prop =3D fdt_getprop_by_offset(dto, property, &name,
> +					     &prop_len);
> +		if (!prop)
> +			return -FDT_ERR_INTERNAL;
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
> +		if (nnode < 0)
> +			return nnode;
> +
> +		ret =3D fdt_apply_overlay_node(dt, dto, nnode, node);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int fdt_overlay_merge(void *dt, void *dto)
> +{
> +	int root, fragment;
> +
> +	root =3D fdt_path_offset(dto, "/");
> +	if (root < 0)
> +		return root;
> +
> +	fdt_for_each_subnode(dto, fragment, root) {
> +		const char *name =3D fdt_get_name(dto, fragment, NULL);
> +		uint32_t target;
> +		int overlay;
> +		int ret;
> +
> +		if (strncmp(name, "fragment", 8))
> +			continue;
> +

This is incorrect. The use of =E2=80=9Cfragment=E2=80=9D is a conventio=
n only.
The real test whether the node is an overlay fragment is that
it contains a target property.

> +		target =3D fdt_overlay_get_target(dt, dto, fragment);
> +		if (target < 0)
> +			return target;
> +

So you could do =E2=80=98if (target < 0) continue;=E2=80=99 or handle a=
 more complex error code.

> +		overlay =3D fdt_subnode_offset(dto, fragment, "__overlay__");
> +		if (overlay < 0)
> +			return overlay;
> +
> +		ret =3D fdt_apply_overlay_node(dt, dto, target, overlay);
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
> +	void *fdto_copy;
> +	int ret;
> +
> +	FDT_CHECK_HEADER(fdt);
> +	FDT_CHECK_HEADER(fdto);
> +
> +	/*
> +	 * We're going to modify the overlay so that we can apply it.
> +	 *
> +	 * Make sure sure we don't destroy the original
> +	 */
> +	fdto_copy =3D malloc(fdt_totalsize(fdto));
> +	if (!fdto_copy)
> +		return -FDT_ERR_INTERNAL;
> +
> +	ret =3D fdt_move(fdto, fdto_copy, fdt_totalsize(fdto));
> +	if (ret)
> +		goto out;
> +
> +	ret =3D fdt_overlay_adjust_local_phandles(fdto_copy, delta);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D fdt_overlay_update_local_references(fdto_copy, delta);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D fdt_overlay_fixup_phandles(fdt, fdto_copy);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D fdt_overlay_merge(fdt, fdto_copy);
> +
> +out:
> +	free(fdto_copy);
> +	return ret;
> +}
> --=20
> 2.8.2
>=20

I would caution against the liberal use of malloc in libfdt. We=E2=80=99=
re possibly running in a constrained
environment; a custom extents based (non freeing) allocator should be b=
etter.

We need some figures about memory consumption when this is enabled, and=
 a CONFIG option to disable it.

Regards

=E2=80=94 Pantelis

