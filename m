Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773701;
	b=JsPA4OVRZ3xXgljxdDBzh97aZ1vqVLCtIxJUZMIUQtCd2SkYrcPaOit9dKd1n6P5Lufj
	 JHx+wMOZvWV1lqG31oNc0CPsPQ9+HCL1zGpq+qQVo9+gVTJ8mUetddD4+00ZCAgCHLyBs
	 JgWu9fAo2uQCqkJrd0aah0o8Bpek5jY21eplpNwbtQekvScRhSfWcyFX/9XVoodi31J/D
	 LDk872i/bd8DAUnbXSu36HAv9kXxj0u53mWMPkd7fYA+yj0vNJOqGPDnLenZb56ES299F
	 xt+CKHueWa2V31CH2pPG1UDBBQF64CSkiGiSu+z2WI8cSHabuxnyjBANciBiNKGs4SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773701;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=y/DotVulc/iWclWwhA+eInaLjqIepNlkZlsNgM9c/fU=;
	b=qgXKkUFoQnHUzAbrSz89y9qQs0em+jh0YkEE9dxm0GjuvjROh6TNWxwE3SGaCEBBFwgw
	 6ihfegrW7O1+gyq0jAYe+S1/s+FSFmNaJApqYp9yDfSo2/fi2e0CK8gPWRfmI63CwKY54
	 pZ98qDq4BlFKl2lE99Rw72N6GIwZVTiBlCa533maygVyhzggT40wlNCNKwRbaj+XmWt7V
	 5r57UErDpDulR9XlbtQBfq8zXFmMXsumI6jG/N1OpEIAKRR+Z4LjbYebUlrr1HJSywiWF
	 ARlj3AtoJMyYzGGnQPbuSifx/DBEDbqYfJNDMALOKTaZJSmPGqugvcNu6G46JIooKeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=foE0mRap;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD53606A326;
	Wed,  4 Nov 2026 06:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=foE0mRap
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793773692;
	bh=y/DotVulc/iWclWwhA+eInaLjqIepNlkZlsNgM9c/fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foE0mRapRy/MTN1iUubN+TTCEeP5y9sUqzJx75OBHVF+vLK8Q5VBOaR1PAUDiSwgC
	 yfV9ex0Pqed/01SRsaDruoRJFMFf5hpVMciuf46LCa/0QI8ZSG4kRqIeafoagS95wY
	 IJ1IMn4xWlufyM9NS+ugvDFY/LD6yjqx6/F7QrEjsMsWDLKlXPQ+tx0mHkYt2MS4gD
	 nw6KRiSYN2qr4cN7PndjgsP6f7LUxa74MIU0TWR9K5bV1+I4s05MJur/5/vg233z+V
	 PJ+lOs6tekjEYyc+PiFyRhRF8knZd3H+eHYFXUoDROiCsqyraIrQU6sWROCnfoP9eQ
	 MHnVlh+A+RDDw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKFqw6nmjz4w91; Wed, 04 Nov 2026 17:28:12 +1100 (AEDT)
Date: Wed, 4 Nov 2026 17:12:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree
 representation
Message-ID: <aurMrnE3vD5eCEAV@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org>
 <auhYb6FV2dPrbVxB@gractus.seuss>
 <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="G9Gvtz0eoPTL2RSP"
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>

--G9Gvtz0eoPTL2RSP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 08:29:06PM -0800, Doug Anderson wrote:
> Hi David,
>=20
> On Mon, Nov 2, 2026 at 1:31=E2=80=AFAM David Gibson <david@gibson.dropbea=
r.id.au> wrote:
> >
> > On Sun, Nov 01, 2026 at 02:01:14PM -0800, Douglas Anderson wrote:
> > > diff --git a/devicetree.py b/devicetree.py
> > > new file mode 100644
> > > index 000000000000..198ab73eda88
> > > --- /dev/null
> > > +++ b/devicetree.py
> >
> > This should probably go in a subdir, since it's not part of dtc
> > proper.  I think putting it in pylibfdt is ok, even though it's not
> > technically part of pylibfdt either.
>=20
> Sounds good. For v4 I'll move `devicetree.py` to `pylibfdt/devicetree.py`
> and update `pylibfdt/meson.build` and `tests/meson.build` accordingly.

Great.

> > > +        node =3D cls()
> > > +        for prop in fdt.properties(offset):
> > > +            if prop.name in node.props:
> > > +                raise ValueError(f'Duplicate property {prop.name!r}')
> > > +            node.props[prop.name] =3D prop
> >
> > This is, technically aliasing the Property returned directly from the
> > flattened tree, which seems a little risky.  Or at least it does if
> > Property is mutable, which it appears to be as a subclass of
> > bytearray.
> >
> > On consideration, that kind of seems like a pre-existing mistake - the
> > way we use it, I think it makes more sense for Property to be
> > immutable (a subclass of 'bytes' instead).  I wonder if making that
> > change would break things.
>=20
> Note that `fdt.properties(offset)` (via `get_property_by_offset()`)
> already allocates a fresh `Property` object with copied bytes on each
> call rather than aliasing the underlying `Fdt` buffer. Even so, having
> `Property` be mutable is definitely footgun-prone when `Property`
> instances are stored in `DeviceTree` or shared across nodes, and making
> `Property` subclass `bytes` instead of `bytearray` has some nice extra
> benefits:
> - `Property` becomes hashable (can be used in sets/dict keys) and its
>   byte value is immutable.
> - `fdt.setprop()` and `sw.property()` C SWIG typemaps require
>   `PyBytes_Check()`, so previously passing a `Property` directly to
>   `fdt.setprop()` raised a `TypeError` unless wrapped in `bytes(prop)`.
>   With `Property(bytes)`, a `Property` can be passed directly.

Ah, nice.

> Looking into compatibility for external `pylibfdt` callers if we switch
> `Property` from `bytearray` to `bytes`:
> - All existing tests in `dtc` pass without modification, and U-Boot's
>   `dtoc` (`tools/dtoc/fdt.py`) immediately converts the `Property` from
>   `get_property_by_offset()` to `bytes(p)` anyway.
> - Indexing, slicing, `len()`, iteration, `struct.unpack()`, the buffer
>   protocol, and all read-only bytes/string methods work identically.
> - Equality comparisons (`=3D=3D`) against `bytearray` still work, since
>   `b'abc' =3D=3D bytearray(b'abc')` is `True` in Python.
> - One subtle difference is that `bytearray` has a `.copy()` method
>   (`prop.copy()`) whereas `bytes` does not (`b''.copy()` raises
>   `AttributeError`), though we could easily keep `prop.copy()` working
>   by aliasing `copy =3D __copy__` on `Property` if needed.
> - The only things that would break in external callers (and can't be
>   shimmed on a `bytes` subclass in CPython) are:
>   1. Mutating a `Property` in place (`prop[0] =3D x`, `prop.extend(...)`),
>      which seems unlikely since `Property` is a disconnected snapshot and
>      mutating it never updated the `Fdt` blob anyway.
>   2. Explicit `isinstance(prop, bytearray)` checks.

Thanks for looking into this.  That looks like an acceptable danger of
breakage to me.

> In my draft v4 branch I've queued up a preparatory patch ("pylibfdt:
> Make Property a subclass of bytes instead of bytearray") that changes
> `Property` to subclass `bytes` via `__new__(cls, name, value)`, updates
> the `fdt_get_property_by_offset` SWIG typemap to return
> `PyBytes_FromStringAndSize()`, and drops the redundant `bytearray()`
> wrapper in `FdtRo.getprop()`. Let me know if that sounds good to you or
> if you're worried enough about compatibility with external callers that
> we should keep `Property(bytearray)`.

Thanks!  I do wonder if we're doing this if we should update __eq_ and
__hash__ methods to take into account the property name.

> > > +        for suboff in fdt.subnodes(offset):
> >
> > So, this can be a later improvement, it doesn't need a respin, but
> > this is a pretty inefficient way of unflattening the tree.  To get
> > from one subnode to the next subnodes() needs to traverse everything
> > in between in the flattened format - which is also what the child
> > unflatten()s do.   So on at every level making this roughly O(d * n)
> > where n is the number of nodes, and d is the depth of the tree.  You
> > can unflatten in a single O(n) pass over the tree.
>=20
> Since I'll be spinning v4 anyway, I've updated `DeviceTree.unflatten()`
> in my draft v4 to unflatten in a single O(n) pass using
> `fdt.next_node(offset, depth)` and a node stack.

Lovely, thanks.

> > > +        fdt =3D sw.as_fdt()
> > > +        fdt.set_boot_cpuid_phys(boot_cpuid_phys)
> > > +        fdt.pack()
> >
> > The pack() is harmless, but probably unnecessary - fdt_finish(),
> > called from as_fdt() leaves an already packed tree.  Unless something
> > resized after that point, which set_boot_cpuid_phys() shouldn't do, it
> > should still be packed.
>=20
> Good catch. Looking at `FdtSw.as_fdt()`, while `fdt_finish()` packs the
> FDT header's `totalsize`, `FdtSw.as_fdt()` currently doesn't trim the
> backing Python `bytearray` to `fdt_totalsize()` (unlike `Fdt.pack()`,
> which runs `del self._fdt[self.totalsize():]`), leaving trailing buffer
> slack in `fdt.as_bytearray()`. For v4 I plan to add a small preparatory
> patch ("pylibfdt: Trim Fdt bytearray to totalsize() in FdtSw.as_fdt()")
> so `FdtSw.as_fdt()` trims the `bytearray` to `fdt_totalsize()`, and drop
> `fdt.pack()` from `DeviceTree.flatten()`.

Ok.

> > > +    def get_str(self, name):
> > > +        """Return property `name` decoded as a NUL-terminated UTF-8 =
string.
> > > +
> > > +        Args:
> > > +            name: Property name to look up in `self.props`.
> > > +
> > > +        Returns:
> > > +            Decoded string value (without the trailing NUL byte).
> > > +
> > > +        Raises:
> > > +            KeyError: If `name` is not in `self.props`.
> > > +            ValueError: If the property value is not a single NUL-te=
rminated
> > > +                UTF-8 string.
> > > +        """
> > > +        return self.props[name].as_str()
> >
> > Rather than having wrappers around all the class Property acccessors,
> > would it be simpler (and only slightly more verbose) to just have a
> > property() method, returning a Property instance and use its accessors
> > in the caller?  Looking up properties with __getitem__ could also
> > work, although maybe the fact that doesn't get subnodes would be
> > confusing?
> >
> > I guess that would also require a bunch of new class methods on
> > Property for the set* side.
>=20
> Yeah, that works out nicely. For v4 I've queued up a preparatory patch
> ("pylibfdt: Add Property.from_*() creation methods") adding
> `from_cell()`, `from_uint32()`, `from_int32()`, `from_uint64()`,
> `from_int64()`, `from_list()`, `from_uint32_list()`, `from_int32_list()`,
> `from_uint64_list()`, `from_int64_list()`, `from_str()`, and
> `from_stringlist()` classmethods to `libfdt.Property` as the
> counterparts to `Property.as_*()`. Then in `DeviceTree` I've dropped all
> the `get_*()` and `set_*()` wrapper methods and replaced them with a
> single `DeviceTree.set_prop(prop)` helper (which stores
> `self.props[prop.name] =3D prop` so callers don't have to repeat the
> property name when setting a `Property`).

Great.

> > > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > > index ae46b29a8f5c..cfdb8f5749b6 100644
> > > --- a/tests/pylibfdt_tests.py
> > > +++ b/tests/pylibfdt_tests.py
> > > @@ -11,6 +11,8 @@ import types
> > >  import unittest
> > >
> > >  sys.path.insert(0, '../pylibfdt')
> > > +sys.path.insert(0, '..')
> >
> > See above about location of devicetree.py.  But.. for that matter,
> > with the code in a separate module, it probably makes sense to have
> > its tests in a separate file, too.
>=20
> Makes sense. For v4 I'll move the `DeviceTree` unit tests into a new
> `tests/devicetree_tests.py` file and run it alongside `pylibfdt_tests.py`
> in `tests/run_tests.sh`.
>=20
>=20
> > > +    def testDeviceTreeRoundTrip(self):
> > > +        """Test unflattening and flattening a tree via DeviceTree"""
> > > +        tree =3D copy.deepcopy(devicetree.DeviceTree.unflatten(self.=
fdt))
> >
> > What's the deepcopy for?  You're not retaining the original
> > unflattened copy.
>=20
> I'll drop that in v4. (It was a leftover from testing
> `Property.__deepcopy__()` before that was split out into its own test in
> `pylibfdt_tests.py`.)
>=20
>=20
> > > +        self.assertIsInstance(tree.props['compatible'], libfdt.Prope=
rty)
> >
> > I don't know if directly accessing the tree's internal dictionary from
> > outside is a good idea.
>=20
> My intent was for `props` and `children` to be the primary public `dict`
> attributes of `DeviceTree` (rather than internal/private state), which
> keeps property and child-node lookups, iteration, and deletion
> (e.g. `node.props['compatible'].as_stringlist()`, `node.props.get(...)`,
> `del node.props[...]`) idiomatic in Python without needing a parallel
> set of dict-wrapper methods. Dropping the competing `get_*()`/`set_*()`
> wrappers on `DeviceTree` and adding `node.set_prop(prop)` makes that
> model much more consistent; for v4 I'll also update the `DeviceTree`
> class docstring to explicitly document `props` and `children` as public
> attributes for callers.

Ok, makes sense.

> > > +        tree2 =3D devicetree.DeviceTree.unflatten(fdt2)
> > > +        nodes1 =3D [(path, n.props, list(n.children.keys()))
> > > +                  for path, n in tree.walk()]
> > > +        nodes2 =3D [(path, n.props, list(n.children.keys()))
> > > +                  for path, n in tree2.walk()]
> > > +        self.assertEqual(nodes1, nodes2)
> >
> > I don't think it's guaranteed that walk() will get the nodes in the
> > same order each time, so you probably want sets instead of lists here.
>=20
> Will fix in v4 by comparing
> `{path: (n.props, set(n.children.keys())) for path, n in tree.walk()}`
> (and using sets of paths in the other `walk()` test assertions).
>=20
>=20
> For now I'll hold these draft v4 changes in my local tree. If you have
> any feedback on the responses above (or any other patches in the
> series) I can make further changes before actually sending out a v4.
> If you'd prefer me to send out what I have now so you can review the
> latest-and-greatest, I'm happy to do that too. If nothing else, some
> of the changes we've made to how DeviceTree works here bleed into the
> other patches a little, so sending a v4 before you review further
> could be nice. ...but I also don't want to churn the series faster
> than you're ready for it. ;-)

Thanks.  And, yes, it's probably best to wait until I've reviewed the
rest of the series.  Which might take a while, sorry.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--G9Gvtz0eoPTL2RSP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrqzK4ACgkQzQJF27ox
2GdPiRAAnl941YgUt1m/r4XkN6rWS6Fk2m1OMHO0qI/7btYJmen2YUGwlnGJbFkb
KLrddZ8bEsnofvUMcUPUKaKiAvpZ5xY+HzHyerKNdPfLLiImx4F+16HeDAvuLpXi
BmJ30FeSM/94xYrRvBkudDeHWrzAxR/FKZaY3M928yrXOtzmSWL29gTzYDUcMnhh
WshdkMkRDuSMvyM7RUI/PCZlZJ2ot7ItWRXfhb2P5fEihD7yBI5sWilzolmxGQDi
RTqonn2KQW/tcwzaXqvXwYTD9i0i8A4RID0wJTosVuAzHd7x4XtgeEB5H5DaZnXj
LxoD32QXrKX46GIMkQcUiMifbZByqa13/3wgzc3bOtmud2yXvPeEI4iYA240IC0f
kY3bZfBBZSIiNTs2UAczd2+FVhkK/iiHxFPpmL1qeucUY/bxQ2Lb9/Ep7QwqPuZ3
Sl6L7QIGVm3RdwyKVt/LVqAh0JGmik7xrWKkV0FHR+AjsPzgPe0IREt1KUfsVET8
8LpymMecLrs+X1R9yH6sSgAgnUdWaE72ODAFR2I5410AhgXJUHYwM9ax7WnVkcIj
w0IHXiwhvyA3c6tXyctJucXJbRr6gFtOwwhxU9QfHJnUmVgfJIYHEKt9OgT2wOaB
fRpmvEbkG9GKi7f2RlVKO2PTfZNGpAWqejqtZy5XJwY/Xyy6u3w=
=r6Dq
-----END PGP SIGNATURE-----

--G9Gvtz0eoPTL2RSP--
