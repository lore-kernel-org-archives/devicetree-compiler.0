From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 10/12] libfdt: Add overlay application function
Date: Mon, 27 Jun 2016 13:40:00 +0200
Message-ID: <20160627114000.GV4000@lukather>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-11-maxime.ripard@free-electrons.com>
 <20160627052607.GK4242@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dIV3CY5swYZsO92m"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160627052607.GK4242-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--dIV3CY5swYZsO92m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Jun 27, 2016 at 03:26:07PM +1000, David Gibson wrote:
> > +static uint32_t overlay_get_target_phandle(const void *fdto, int fragm=
ent)
> > +{
> > +	const uint32_t *val;
> > +	int len;
> > +
> > +	val =3D fdt_getprop(fdto, fragment, "target", &len);
> > +	if (!val || (*val =3D=3D 0xffffffff) || (len !=3D sizeof(*val)))
> > +		return 0;
>=20
> This doesn't distinguish between a missing property (which may
> indicate a valid overlay using a target-path or some other method)
> and a badly formatted 'target' property, which is definitely an error
> in the overlay.
>=20
> I think those should be treated differently.

AFAIK, phandles can have any 32 bits values but 0xffffffff. In order
to cover the two cases, we would need to have some error code, but
that doesn't really work with returning a uint32_t.

Or maybe we can simply remove all the checks but the missing property,
and let fdt_node_offset_by_phandle deal with the improper values?

>=20
> > +	return fdt32_to_cpu(*val);
> > +}
> > +
> > +static int overlay_get_target(const void *fdt, const void *fdto,
> > +			      int fragment)
> > +{
> > +	uint32_t phandle;
> > +	const char *path;
> > +
> > +	/* Try first to do a phandle based lookup */
> > +	phandle =3D overlay_get_target_phandle(fdto, fragment);
> > +	if (phandle)
> > +		return fdt_node_offset_by_phandle(fdt, phandle);
> > +
> > +	/* And then a path based lookup */
> > +	path =3D fdt_getprop(fdto, fragment, "target-path", NULL);
> > +	if (!path)
> > +		return -FDT_ERR_NOTFOUND;
> > +
> > +	return fdt_path_offset(fdt, path);
> > +}
> > +
> > +static int overlay_phandle_add_offset(void *fdt, int node,
> > +				      const char *name, uint32_t delta)
> > +{
> > +	const uint32_t *val;
> > +	uint32_t adj_val;
> > +	int len;
> > +
> > +	val =3D fdt_getprop(fdt, node, name, &len);
> > +	if (!val)
> > +		return len;
> > +
> > +	if (len !=3D sizeof(*val))
> > +		return -FDT_ERR_BADSTRUCTURE;
> > +
> > +	adj_val =3D fdt32_to_cpu(*val);
> > +	adj_val +=3D delta;
>=20
> You should probably check for overflow here.
>=20
> > +
> > +	return fdt_setprop_inplace_u32(fdt, node, name, adj_val);
> > +}
> > +
> > +static int overlay_adjust_node_phandles(void *fdto, int node,
> > +					uint32_t delta)
> > +{
> > +	bool found =3D false;
> > +	int child;
> > +	int ret;
> > +
> > +	ret =3D overlay_phandle_add_offset(fdto, node, "phandle", delta);
> > +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > +		return ret;
> > +
> > +	if (!ret)
> > +		found =3D true;
> > +
> > +	ret =3D overlay_phandle_add_offset(fdto, node, "linux,phandle", delta=
);
> > +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > +		return ret;
>=20
> I think the check for phandle vs. linux,phandle should be folded into
> overlay_phandle_add_offset().

I created overlay_phandle_add_offset to avoid duplicating the getprop,
offset, setprop, pattern which I don't think is a good idea.

And we'll have to have that kind of errors construct anyway to know if
we modified any of the two, which is a success, or none, which is a
failure.

> > +	/*
> > +	 * If neither phandle nor linux,phandle have been found return
> > +	 * an error.
> > +	 */
> > +	if (!found && !ret)
> > +		return ret;
> > +
> > +	fdt_for_each_subnode(fdto, child, node)
> > +		overlay_adjust_node_phandles(fdto, child, delta);
> > +
> > +	return 0;
> > +}
> > +
> > +static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
> > +{
> > +	/*
> > +	 * Start adjusting the phandles from the overlay root
> > +	 */
> > +	return overlay_adjust_node_phandles(fdto, 0, delta);
> > +}
> > +
> > +static int overlay_update_local_node_references(void *fdto,
> > +						int tree_node,
> > +						int fixup_node,
> > +						uint32_t delta)
> > +{
> > +	int fixup_prop;
> > +	int fixup_child;
> > +	int ret;
> > +
> > +	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
> > +		const uint32_t *val =3D NULL;
> > +		uint32_t adj_val, index;
> > +		const char *name;
> > +		int fixup_len;
> > +		int tree_len;
> > +
> > +		val =3D fdt_getprop_by_offset(fdto, fixup_prop,
> > +					    &name, &fixup_len);
> > +		if (!val)
> > +			return fixup_len;
> > +		index =3D fdt32_to_cpu(*val);
>=20
> This still doesn't handle the case of multiple fixups within the same
> property.  That would be entirely plausible for something like an
> interrupt-map property.

Good point, I'll fix that and add a test case for it.

> > +		val =3D fdt_getprop(fdto, tree_node, name, &tree_len);
> > +		if (!val)
> > +			return tree_len;
> > +
> > +		adj_val =3D fdt32_to_cpu(*(val + (index / sizeof(uint32_t))));
>=20
> phandle values need not be aligned within the property containint them
> (e.g. properties which mix strings and integer values).  So you're
> going to need to work directly with a byte offset here.

I didn't even know it was something that was valid.

It would probably require a temporary variable and a memcpy though to
deal with architectures that cannot do unaligned accesses.

>=20
> > +		adj_val +=3D delta;
> > +		adj_val =3D cpu_to_fdt32(adj_val);
> > +
> > +		ret =3D fdt_setprop_inplace_namelen_by_index(fdto, tree_node,
> > +							   name, strlen(name),
> > +							   index, &adj_val,
> > +							   sizeof(adj_val));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	fdt_for_each_subnode(fdto, fixup_child, fixup_node) {
> > +		const char *fixup_child_name =3D fdt_get_name(fdto, fixup_child,
> > +							    NULL);
> > +		int tree_child;
> > +
> > +		tree_child =3D fdt_subnode_offset(fdto, tree_node,
> > +						fixup_child_name);
> > +		if (tree_child < 0)
> > +			return tree_child;
> > +
> > +		ret =3D overlay_update_local_node_references(fdto,
> > +							   tree_child,
> > +							   fixup_child,
> > +							   delta);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int overlay_update_local_references(void *dto, uint32_t delta)
> > +{
> > +	int fixups;
> > +
> > +	fixups =3D fdt_path_offset(dto, "/__local_fixups__");
> > +	if (fixups < 0) {
> > +		/*
> > +		 * There's no local phandles to adjust, bail out
> > +		 */
> > +		if (fixups =3D=3D -FDT_ERR_NOTFOUND)
> > +			return 0;
> > +
> > +		return fixups;
> > +	}
> > +
> > +	/*
> > +	 * Update our local references from the root of the tree
> > +	 */
> > +	return overlay_update_local_node_references(dto, 0, fixups,
> > +						    delta);
> > +}
> > +
> > +static int overlay_fixup_one_phandle(void *fdt, void *fdto,
> > +				     int symbols_off,
> > +				     const char *path, uint32_t path_len,
> > +				     const char *name, uint32_t name_len,
> > +				     int index, const char *label)
> > +{
> > +	const char *symbol_path;
> > +	uint32_t phandle;
> > +	int symbol_off, fixup_off;
> > +	int prop_len;
> > +
> > +	symbol_path =3D fdt_getprop(fdt, symbols_off, label,
> > +				  &prop_len);
> > +	if (!symbol_path)
> > +		return -FDT_ERR_NOTFOUND;
> > +
> > +	symbol_off =3D fdt_path_offset(fdt, symbol_path);
> > +	if (symbol_off < 0)
> > +		return symbol_off;
> > +
> > +	phandle =3D fdt_get_phandle(fdt, symbol_off);
> > +	if (!phandle)
> > +		return -FDT_ERR_NOTFOUND;
> > +
> > +	fixup_off =3D fdt_path_offset_namelen(fdto, path, path_len);
> > +	if (fixup_off < 0)
> > +		return fixup_off;
> > +
> > +	phandle =3D cpu_to_fdt32(phandle);
> > +	return fdt_setprop_inplace_namelen_by_index(fdto, fixup_off,
> > +						    name, name_len, index,
> > +						    &phandle, sizeof(phandle));
>=20
> This will be broken on BE systems because fdt_get_phandle() byteswaps
> to native order, but setprop_inplace doesn't byteswap back (because
> it's input is a byte array, not a u32).

Hmmmm, so calling cpu_to_fdt32 is not enough? I'm not sure what the
proper fix for that would be.

> > +};
> > +
> > +static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_of=
f,
> > +				 int property)
> > +{
> > +	const char *value;
> > +	const char *label;
> > +	int len;
> > +
> > +	value =3D fdt_getprop_by_offset(fdto, property,
> > +				      &label, &len);
> > +	if (!value)
> > +		return len;
> > +
> > +	do {
> > +		const char *prop_string =3D value;
> > +		const char *path, *name;
> > +		uint32_t path_len, name_len;
> > +		char *sep, *endptr;
> > +		int index;
> > +		int ret;
> > +
> > +		path =3D prop_string;
> > +		sep =3D strchr(prop_string, ':');
> > +		path_len =3D sep - path;
>=20
> You need to check for strchr() returning NULL (indicating a badly
> formatted fixup missing a separator).
>=20
> Also... strchr() is not safe.  Again, if the fixup string is badly
> formatted and doesn't have a terminating \0, this could overrun, so
> you want memchr() instead.

Ok

> > +		name =3D sep + 1;
> > +		sep =3D strchr(name, ':');
> > +		name_len =3D sep - name;
>=20
> And again.
>=20
> > +		index =3D strtoul(sep + 1, &endptr, 10);
> > +		if (endptr <=3D (sep + 1))
> > +			return -FDT_ERR_BADSTRUCTURE;
>=20
> IIRC the index value is supposed to go to the end of that portion of
> the fixup, so you should be able to check for *endptr =3D=3D '\0'.
>=20
> Except.. strtoul() could also overrun if the fixup property doesn't
> contain a \0 like it should.
>=20
> So I think you'd be better off using a memchr() (or strnlen()) to
> search for the \0 before you attempt parsing the innards of a single
> fixup string.

Ok

> Ugh.  I hate that we're parsing text numbers in decimal here, but
> we're pretty much stuck with that format here.  Doubly so that it's a
> gratuitously different way of encoding the (node, property, offset)
> tuple from local_fixups.

I'm not sure to get what you're saying here. Is that a general remark
on the format used by the overlays, or an hint that my code should be
reworked to deal with this differently?

>=20
> > +		index =3D strtoul(sep + 1, &endptr, 10);
> > +		if (endptr <=3D (sep + 1))
> > +			return -FDT_ERR_BADSTRUCTURE;
> > +
> > +		len -=3D strlen(prop_string) + 1;
> > +		value +=3D strlen(prop_string) + 1;
>=20
> Please don't double call strlen() on the same string - remember it's
> O(n) in C.

Ok

> > +
> > +		ret =3D overlay_fixup_one_phandle(fdt, fdto, symbols_off,
> > +						path, path_len, name, name_len,
> > +						index, label);
> > +		if (ret)
> > +			return ret;
> > +	} while (len > 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int overlay_fixup_phandles(void *dt, void *dto)
> > +{
> > +	int fixups_off, symbols_off;
> > +	int property;
> > +
> > +	symbols_off =3D fdt_path_offset(dt, "/__symbols__");
> > +	fixups_off =3D fdt_path_offset(dto, "/__fixups__");
> > +
> > +	fdt_for_each_property_offset(property, dto, fixups_off)
> > +		overlay_fixup_phandle(dt, dto, symbols_off, property);
> > +
> > +	return 0;
> > +}
> > +
> > +static int apply_overlay_node(void *dt, int target,
> > +			      void *dto, int overlay)
>=20
> I think 'overlay' should be 'fragment' here for consistency?

Ok.

> > +{
> > +	int property;
> > +	int node;
> > +
> > +	fdt_for_each_property_offset(property, dto, overlay) {
> > +		const char *name;
> > +		const void *prop;
> > +		int prop_len;
> > +		int ret;
> > +
> > +		prop =3D fdt_getprop_by_offset(dto, property, &name,
> > +					     &prop_len);
> > +		if (!prop)
> > +			return -FDT_ERR_INTERNAL;
>=20
> Actually, you probably should check the error code returned in
> prop_len.  Getting a NOTFOUND would indicate an internal error, but
> you could also get BADSTRUCTURE or similar errors which would indicate
> an error in input.

Ok.

> > +int fdt_overlay_apply(void *fdt, void *fdto)
> > +{
> > +	uint32_t delta =3D fdt_get_max_phandle(fdt) + 1;
> > +	int ret;
> > +
> > +	FDT_CHECK_HEADER(fdt);
> > +	FDT_CHECK_HEADER(fdto);
> > +
> > +	ret =3D overlay_adjust_local_phandles(fdto, delta);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D overlay_update_local_references(fdto, delta);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D overlay_fixup_phandles(fdt, fdto);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D overlay_merge(fdt, fdto);
> > +	if (!ret)
> > +		goto out;
> > +
> > +err:
>=20
> This is a confusing use of gotos - this looks like it is in the exit
> path for both success and failure cases, but it's not due to the
> easy-to-miss goto out above.

I know, but I couldn't really come up with something better to avoid
code duplication.

Or maybe it's too small to care?

Thanks a lot for your review,
Maxime



--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--dIV3CY5swYZsO92m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcRCQAAoJEBx+YmzsjxAgpZIP/1IQ7lpD2us/mSZ8QHAhNp42
sBgt7EltSj3w+GqxqNItyIaHlJ6yXgKGbKIldRhMv5KQ3VZB0Puri02dCo5n91cb
AXsQa1pyMF6xZTU7MB0WqesifNJhgKXezEgB9NwST60ilamnd7VxaEBBu4d0rGdB
Dr9BaiizQkgNJzc3j21IFLA7GzdU9mOLgjvKQz+ecc7OAKHeEoyYpT1DDJN19SvE
zyRYTWxQCaoFWEMqr1OliXHYlk7pAqgJGYHTs+QDkf0TMBY1IBLu1qrqKmapapGa
8s/NAiy1zGXWw0ddo6Wq9MO0r/liyTtCcFx57eIbtTplbNk7HWEjjmoP87tnHViB
ppE+HNB1ME3WP7fr0DHOsCFtTN0bHth3ptTE/ZzuaSvTMewvYN8TIQ+wS7M3ASNo
rM15cF1lgZsznTsDg+Gu9tXqNMpvF9qjkvkkwB3DRDKdShjPYb5a5SeeVBhe5vyI
Am9v3HI2G+dUC2aWniX96SdUyPYQRUkz+RiMlRdr0+2oM4ib5qdUr7oLVEq+HhOS
sTzF2LyEUpaVLQ/40kl2p6Zl2eQIkJ4y34eSfaN2oA+p6Id09NnxkU7OVBsrCi11
nroQozOu+6GXqDcxRIy+o3RyAoJ2rRp8+vYxnpfUQZwDI9DOy1kJs+V3icJ8tpkv
ouz//xP9OqRjwrlLvAI8
=tWqz
-----END PGP SIGNATURE-----

--dIV3CY5swYZsO92m--
