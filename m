From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 10/12] libfdt: Add overlay application function
Date: Tue, 28 Jun 2016 13:12:52 +1000
Message-ID: <20160628031252.GZ4242@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-11-maxime.ripard@free-electrons.com>
 <20160627052607.GK4242@voom.fritz.box>
 <20160627114000.GV4000@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E0GpUEom8qu4+vDz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467085574;
	bh=Mu2iuHrEZQQ7JbycUFjeReIwo+CQgSqPGZHtU3SPcAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOOL+tGSjFgJBZI/KVlcpeejpxAdnyTVU05kEX+Q8UnXNOUtQb0OGWNJs2YmexMo7
	 wjzjGeu5HDV9+RKYSXKIiHHJ1UhwEhLq9E33gjK4JIEOhRFQ0PyWeRbiicmnJcyJdj
	 XS/s3MMfLTS/+IeOnQ20gsICrjooBi93+qU/rM9o=
Content-Disposition: inline
In-Reply-To: <20160627114000.GV4000@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--E0GpUEom8qu4+vDz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 01:40:00PM +0200, Maxime Ripard wrote:
> Hi David,
>=20
> On Mon, Jun 27, 2016 at 03:26:07PM +1000, David Gibson wrote:
> > > +static uint32_t overlay_get_target_phandle(const void *fdto, int fra=
gment)
> > > +{
> > > +	const uint32_t *val;
> > > +	int len;
> > > +
> > > +	val =3D fdt_getprop(fdto, fragment, "target", &len);
> > > +	if (!val || (*val =3D=3D 0xffffffff) || (len !=3D sizeof(*val)))
> > > +		return 0;
> >=20
> > This doesn't distinguish between a missing property (which may
> > indicate a valid overlay using a target-path or some other method)
> > and a badly formatted 'target' property, which is definitely an error
> > in the overlay.
> >=20
> > I think those should be treated differently.
>=20
> AFAIK, phandles can have any 32 bits values but 0xffffffff. In order
> to cover the two cases, we would need to have some error code, but
> that doesn't really work with returning a uint32_t.

Actually phandles can have any value except 0xffffffff *or* 0.  So you
can use 0 for "couldn't find" and -1 for "badly formatted".

> Or maybe we can simply remove all the checks but the missing property,
> and let fdt_node_offset_by_phandle deal with the improper values?
>=20
> >=20
> > > +	return fdt32_to_cpu(*val);
> > > +}
> > > +
> > > +static int overlay_get_target(const void *fdt, const void *fdto,
> > > +			      int fragment)
> > > +{
> > > +	uint32_t phandle;
> > > +	const char *path;
> > > +
> > > +	/* Try first to do a phandle based lookup */
> > > +	phandle =3D overlay_get_target_phandle(fdto, fragment);
> > > +	if (phandle)
> > > +		return fdt_node_offset_by_phandle(fdt, phandle);
> > > +
> > > +	/* And then a path based lookup */
> > > +	path =3D fdt_getprop(fdto, fragment, "target-path", NULL);
> > > +	if (!path)
> > > +		return -FDT_ERR_NOTFOUND;
> > > +
> > > +	return fdt_path_offset(fdt, path);
> > > +}
> > > +
> > > +static int overlay_phandle_add_offset(void *fdt, int node,
> > > +				      const char *name, uint32_t delta)
> > > +{
> > > +	const uint32_t *val;
> > > +	uint32_t adj_val;
> > > +	int len;
> > > +
> > > +	val =3D fdt_getprop(fdt, node, name, &len);
> > > +	if (!val)
> > > +		return len;
> > > +
> > > +	if (len !=3D sizeof(*val))
> > > +		return -FDT_ERR_BADSTRUCTURE;
> > > +
> > > +	adj_val =3D fdt32_to_cpu(*val);
> > > +	adj_val +=3D delta;
> >=20
> > You should probably check for overflow here.
> >=20
> > > +
> > > +	return fdt_setprop_inplace_u32(fdt, node, name, adj_val);
> > > +}
> > > +
> > > +static int overlay_adjust_node_phandles(void *fdto, int node,
> > > +					uint32_t delta)
> > > +{
> > > +	bool found =3D false;
> > > +	int child;
> > > +	int ret;
> > > +
> > > +	ret =3D overlay_phandle_add_offset(fdto, node, "phandle", delta);
> > > +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > > +		return ret;
> > > +
> > > +	if (!ret)
> > > +		found =3D true;
> > > +
> > > +	ret =3D overlay_phandle_add_offset(fdto, node, "linux,phandle", del=
ta);
> > > +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > > +		return ret;
> >=20
> > I think the check for phandle vs. linux,phandle should be folded into
> > overlay_phandle_add_offset().
>=20
> I created overlay_phandle_add_offset to avoid duplicating the getprop,
> offset, setprop, pattern which I don't think is a good idea.
>=20
> And we'll have to have that kind of errors construct anyway to know if
> we modified any of the two, which is a success, or none, which is a
> failure.

Hm.. ok, you convinced me.

> > > +	/*
> > > +	 * If neither phandle nor linux,phandle have been found return
> > > +	 * an error.
> > > +	 */
> > > +	if (!found && !ret)
> > > +		return ret;
> > > +
> > > +	fdt_for_each_subnode(fdto, child, node)
> > > +		overlay_adjust_node_phandles(fdto, child, delta);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
> > > +{
> > > +	/*
> > > +	 * Start adjusting the phandles from the overlay root
> > > +	 */
> > > +	return overlay_adjust_node_phandles(fdto, 0, delta);
> > > +}
> > > +
> > > +static int overlay_update_local_node_references(void *fdto,
> > > +						int tree_node,
> > > +						int fixup_node,
> > > +						uint32_t delta)
> > > +{
> > > +	int fixup_prop;
> > > +	int fixup_child;
> > > +	int ret;
> > > +
> > > +	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
> > > +		const uint32_t *val =3D NULL;
> > > +		uint32_t adj_val, index;
> > > +		const char *name;
> > > +		int fixup_len;
> > > +		int tree_len;
> > > +
> > > +		val =3D fdt_getprop_by_offset(fdto, fixup_prop,
> > > +					    &name, &fixup_len);
> > > +		if (!val)
> > > +			return fixup_len;
> > > +		index =3D fdt32_to_cpu(*val);
> >=20
> > This still doesn't handle the case of multiple fixups within the same
> > property.  That would be entirely plausible for something like an
> > interrupt-map property.
>=20
> Good point, I'll fix that and add a test case for it.
>=20
> > > +		val =3D fdt_getprop(fdto, tree_node, name, &tree_len);
> > > +		if (!val)
> > > +			return tree_len;
> > > +
> > > +		adj_val =3D fdt32_to_cpu(*(val + (index / sizeof(uint32_t))));
> >=20
> > phandle values need not be aligned within the property containint them
> > (e.g. properties which mix strings and integer values).  So you're
> > going to need to work directly with a byte offset here.
>=20
> I didn't even know it was something that was valid.

I'm afraid so.  In general, property values are treated as packed
bytestrings and never have internal alignment constraints.

> It would probably require a temporary variable and a memcpy though to
> deal with architectures that cannot do unaligned accesses.

Alas, yes.  Make sure you put a comment there to explain this, because
it will appear unnecessary to people only familiar with archs that
allow unaligned access (which includes both x86 and Power).

>=20
> >=20
> > > +		adj_val +=3D delta;
> > > +		adj_val =3D cpu_to_fdt32(adj_val);
> > > +
> > > +		ret =3D fdt_setprop_inplace_namelen_by_index(fdto, tree_node,
> > > +							   name, strlen(name),
> > > +							   index, &adj_val,
> > > +							   sizeof(adj_val));
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	fdt_for_each_subnode(fdto, fixup_child, fixup_node) {
> > > +		const char *fixup_child_name =3D fdt_get_name(fdto, fixup_child,
> > > +							    NULL);
> > > +		int tree_child;
> > > +
> > > +		tree_child =3D fdt_subnode_offset(fdto, tree_node,
> > > +						fixup_child_name);
> > > +		if (tree_child < 0)
> > > +			return tree_child;
> > > +
> > > +		ret =3D overlay_update_local_node_references(fdto,
> > > +							   tree_child,
> > > +							   fixup_child,
> > > +							   delta);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int overlay_update_local_references(void *dto, uint32_t delta)
> > > +{
> > > +	int fixups;
> > > +
> > > +	fixups =3D fdt_path_offset(dto, "/__local_fixups__");
> > > +	if (fixups < 0) {
> > > +		/*
> > > +		 * There's no local phandles to adjust, bail out
> > > +		 */
> > > +		if (fixups =3D=3D -FDT_ERR_NOTFOUND)
> > > +			return 0;
> > > +
> > > +		return fixups;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Update our local references from the root of the tree
> > > +	 */
> > > +	return overlay_update_local_node_references(dto, 0, fixups,
> > > +						    delta);
> > > +}
> > > +
> > > +static int overlay_fixup_one_phandle(void *fdt, void *fdto,
> > > +				     int symbols_off,
> > > +				     const char *path, uint32_t path_len,
> > > +				     const char *name, uint32_t name_len,
> > > +				     int index, const char *label)
> > > +{
> > > +	const char *symbol_path;
> > > +	uint32_t phandle;
> > > +	int symbol_off, fixup_off;
> > > +	int prop_len;
> > > +
> > > +	symbol_path =3D fdt_getprop(fdt, symbols_off, label,
> > > +				  &prop_len);
> > > +	if (!symbol_path)
> > > +		return -FDT_ERR_NOTFOUND;
> > > +
> > > +	symbol_off =3D fdt_path_offset(fdt, symbol_path);
> > > +	if (symbol_off < 0)
> > > +		return symbol_off;
> > > +
> > > +	phandle =3D fdt_get_phandle(fdt, symbol_off);
> > > +	if (!phandle)
> > > +		return -FDT_ERR_NOTFOUND;
> > > +
> > > +	fixup_off =3D fdt_path_offset_namelen(fdto, path, path_len);
> > > +	if (fixup_off < 0)
> > > +		return fixup_off;
> > > +
> > > +	phandle =3D cpu_to_fdt32(phandle);
> > > +	return fdt_setprop_inplace_namelen_by_index(fdto, fixup_off,
> > > +						    name, name_len, index,
> > > +						    &phandle, sizeof(phandle));
> >=20
> > This will be broken on BE systems because fdt_get_phandle() byteswaps
> > to native order, but setprop_inplace doesn't byteswap back (because
> > it's input is a byte array, not a u32).
>=20
> Hmmmm, so calling cpu_to_fdt32 is not enough? I'm not sure what the
> proper fix for that would be.

Oh, sorry, I just missed the cpu_to_fdt32().

> > > +};
> > > +
> > > +static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_=
off,
> > > +				 int property)
> > > +{
> > > +	const char *value;
> > > +	const char *label;
> > > +	int len;
> > > +
> > > +	value =3D fdt_getprop_by_offset(fdto, property,
> > > +				      &label, &len);
> > > +	if (!value)
> > > +		return len;
> > > +
> > > +	do {
> > > +		const char *prop_string =3D value;
> > > +		const char *path, *name;
> > > +		uint32_t path_len, name_len;
> > > +		char *sep, *endptr;
> > > +		int index;
> > > +		int ret;
> > > +
> > > +		path =3D prop_string;
> > > +		sep =3D strchr(prop_string, ':');
> > > +		path_len =3D sep - path;
> >=20
> > You need to check for strchr() returning NULL (indicating a badly
> > formatted fixup missing a separator).
> >=20
> > Also... strchr() is not safe.  Again, if the fixup string is badly
> > formatted and doesn't have a terminating \0, this could overrun, so
> > you want memchr() instead.
>=20
> Ok
>=20
> > > +		name =3D sep + 1;
> > > +		sep =3D strchr(name, ':');
> > > +		name_len =3D sep - name;
> >=20
> > And again.
> >=20
> > > +		index =3D strtoul(sep + 1, &endptr, 10);
> > > +		if (endptr <=3D (sep + 1))
> > > +			return -FDT_ERR_BADSTRUCTURE;
> >=20
> > IIRC the index value is supposed to go to the end of that portion of
> > the fixup, so you should be able to check for *endptr =3D=3D '\0'.
> >=20
> > Except.. strtoul() could also overrun if the fixup property doesn't
> > contain a \0 like it should.
> >=20
> > So I think you'd be better off using a memchr() (or strnlen()) to
> > search for the \0 before you attempt parsing the innards of a single
> > fixup string.
>=20
> Ok
>=20
> > Ugh.  I hate that we're parsing text numbers in decimal here, but
> > we're pretty much stuck with that format here.  Doubly so that it's a
> > gratuitously different way of encoding the (node, property, offset)
> > tuple from local_fixups.
>=20
> I'm not sure to get what you're saying here. Is that a general remark
> on the format used by the overlays, or an hint that my code should be
> reworked to deal with this differently?

Just a general remark on the format.

>=20
> >=20
> > > +		index =3D strtoul(sep + 1, &endptr, 10);
> > > +		if (endptr <=3D (sep + 1))
> > > +			return -FDT_ERR_BADSTRUCTURE;
> > > +
> > > +		len -=3D strlen(prop_string) + 1;
> > > +		value +=3D strlen(prop_string) + 1;
> >=20
> > Please don't double call strlen() on the same string - remember it's
> > O(n) in C.
>=20
> Ok
>=20
> > > +
> > > +		ret =3D overlay_fixup_one_phandle(fdt, fdto, symbols_off,
> > > +						path, path_len, name, name_len,
> > > +						index, label);
> > > +		if (ret)
> > > +			return ret;
> > > +	} while (len > 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int overlay_fixup_phandles(void *dt, void *dto)
> > > +{
> > > +	int fixups_off, symbols_off;
> > > +	int property;
> > > +
> > > +	symbols_off =3D fdt_path_offset(dt, "/__symbols__");
> > > +	fixups_off =3D fdt_path_offset(dto, "/__fixups__");
> > > +
> > > +	fdt_for_each_property_offset(property, dto, fixups_off)
> > > +		overlay_fixup_phandle(dt, dto, symbols_off, property);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int apply_overlay_node(void *dt, int target,
> > > +			      void *dto, int overlay)
> >=20
> > I think 'overlay' should be 'fragment' here for consistency?
>=20
> Ok.
>=20
> > > +{
> > > +	int property;
> > > +	int node;
> > > +
> > > +	fdt_for_each_property_offset(property, dto, overlay) {
> > > +		const char *name;
> > > +		const void *prop;
> > > +		int prop_len;
> > > +		int ret;
> > > +
> > > +		prop =3D fdt_getprop_by_offset(dto, property, &name,
> > > +					     &prop_len);
> > > +		if (!prop)
> > > +			return -FDT_ERR_INTERNAL;
> >=20
> > Actually, you probably should check the error code returned in
> > prop_len.  Getting a NOTFOUND would indicate an internal error, but
> > you could also get BADSTRUCTURE or similar errors which would indicate
> > an error in input.
>=20
> Ok.
>=20
> > > +int fdt_overlay_apply(void *fdt, void *fdto)
> > > +{
> > > +	uint32_t delta =3D fdt_get_max_phandle(fdt) + 1;
> > > +	int ret;
> > > +
> > > +	FDT_CHECK_HEADER(fdt);
> > > +	FDT_CHECK_HEADER(fdto);
> > > +
> > > +	ret =3D overlay_adjust_local_phandles(fdto, delta);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	ret =3D overlay_update_local_references(fdto, delta);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	ret =3D overlay_fixup_phandles(fdt, fdto);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	ret =3D overlay_merge(fdt, fdto);
> > > +	if (!ret)
> > > +		goto out;
> > > +
> > > +err:
> >=20
> > This is a confusing use of gotos - this looks like it is in the exit
> > path for both success and failure cases, but it's not due to the
> > easy-to-miss goto out above.
>=20
> I know, but I couldn't really come up with something better to avoid
> code duplication.
>=20
> Or maybe it's too small to care?

I think a little duplicated code is the lesser evil here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--E0GpUEom8qu4+vDz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXces0AAoJEGw4ysog2bOSEhkP/iWXwavyQv8MJ3aMUbS353Hg
KV1y6W/B/fbt1siF64Tv3yeRWyEu8KpixPdykbztwvm4lm1FqsqwErrZpzFMu9de
G+6Ye1wkV0w++dRajBYjHJEmjheOfbB16z/qUV6pOvyj4ggtT1OLdbQUWQRqxcPb
ULVUgSIzmpLhezce5Gu7KSVODh2l0homQH3wI2qv/V82flm0a/EqtPc+qYQVRcmO
oNW2KzyrN9MvPUr0OMTBaG42vBjM0j8ZmflZKc3ZA+B4x6McR/UhRd698o/5xn0U
nYJv5OTcVNJdE1jTGfQq0SMZs9IZNn/shHFmlKt8rZpbg1tydDuvVhXKul37icn3
A9iWTbAk44mKw29kyVKt+hhG5upDLpLGzAhcTW0DfzxxDEFiDdZMYk3LQNm/VT7h
stYCBHOGdmzGoaGJL93Jwdj5p+ax/zBI53NcOADlYRoJdun38oWt3+BVCIluj8B9
Xv/23MlzlgL0rG7I7KGFsOnaw1RarUKjhU9sayJOw77tXN+iTWqVc/zamEHSnT24
rptApKR+3hZClkR9fJOBFe4ZPwa0jA92939mQlorA20j31NZ+1kIhLMJ0h87I0Sk
8llxPRsY2sv/2OkRB+0ApHslQ5v179nq+Zt6t+oeyR4Mll/jYHgf/OrToPY0hVzF
/0VuH6NaP0PMO8oQLsFo
=ZKEV
-----END PGP SIGNATURE-----

--E0GpUEom8qu4+vDz--
