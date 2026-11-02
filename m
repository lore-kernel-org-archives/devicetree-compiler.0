Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611907;
	b=uGUY9b6dh8WyIx3GRWkqhRkPtN2/DMdiCdWsfQLyCLQ6qD00o2WLJ1TVE2ckWGTOSGLT
	 HRL7rdDqp9yV4L/7gKpnDhaU2Zh366BisGp7dzAvlhNP3IdLl1dnnCMUc3Pw95MwZIzLi
	 v+F5GaWlfsFItUBRjj8dHmxnfRsVFKaIj5Jga1MGxBaU3MoYA7yAt1dm38HFHn5O4u6t0
	 Lo8wXXmziPJT1pklvwH8Ccp0o64N9IJ7i5Hf6p7cUBV1PGOI6UXfFrxpRYmk/n2IaXwO3
	 Vfx7P3ysfOwBIWb5Uk1pqf5NzkIwpkBvkUpAG/jjukpJYxtWU35wFJtmNKd//vcB2lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611907;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=CYKsaXxHu/QNN+kzViduvCf8afFh335dEDxX2veiSOk=;
	b=qzCe/7BaJlmrcz3XBJaiKFT/VPYZvgqZNS1bujABuoADtBNw/sYvDVwQlWZi5vDgrRNQ
	 DLkF815+Pe7zBgCgvpHXllQIOxj0TaKj08rwl5Q+RIBQ9rj3maHXcZ26HMBw+bPKFaioe
	 Alk6yQwgE1/CMFmj+HrQYPrK3HkO4ptsm/5MN0eZ9LI4FWF7OJMeecyYJDaErsYFe37ye
	 TDZN1xaMRkYro4kdk3B1/jJ5pNdeNfas70Fd+oANZ+L7rhsIzXM55nTl14zVyN0MHUCGa
	 XSv4LSamCFRPU4e0ecg0MvKKUUDVhZApE1w/qNgpitd/5WXzKkFIXImwL5iWniZ/d0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=PYUY+4vl;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56C606A326;
	Mon,  2 Nov 2026 09:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA56C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=PYUY+4vl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793611902;
	bh=CYKsaXxHu/QNN+kzViduvCf8afFh335dEDxX2veiSOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYUY+4vlQS5DmHXo8qWDpEkjGgh0fkpNNZWJT7GnnfiCTgiXf34VMRwq4I4QZ6UdE
	 yMTjqMkfTJw3towpBP9TDZRWg/JCN0gWm/9o7j71IFo1OiKVSqjiPjbcaFu95sjwCP
	 U5XxajCDmUVO+3Bj0CI0WHX43IREN42xVaTHbaGF5nxs52qj7fmMDxlk+wapTK8vyt
	 fmRWOEBk+w0I9yHzXfeBJp6q9mDoNPpa7OuzaMx7bkMg4bjzzvwNcybktzONghW6Ri
	 gvNH8S35xD5zonVdCLuQ1o9PfWymY/Mdxk6I/cKDDv0VCN514s6W8heIw41q461K3L
	 O5xXevg4APPsQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ60Z5sKTz4wDk; Mon, 02 Nov 2026 20:31:42 +1100 (AEDT)
Date: Mon, 2 Nov 2026 20:31:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
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
Message-ID: <auhYb6FV2dPrbVxB@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="xuJ0e4XMj0h7KxEy"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-8-dianders@chromium.org>

--xuJ0e4XMj0h7KxEy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:14PM -0800, Douglas Anderson wrote:
> Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> representation of a devicetree node and its subtree:
>=20
> - `DeviceTree.unflatten(fdt, offset=3D0)` builds a `DeviceTree` hierarchy
>   from an `FdtRo` instance, storing `libfdt.Property` instances in
>   `self.props` and raising `ValueError` if duplicate property or sibling
>   subnode names are encountered.
> - `DeviceTree.flatten(mem_rsv=3D(), boot_cpuid_phys=3D0)` serializes a ro=
ot
>   `DeviceTree` back into a packed `libfdt.Fdt` object via `FdtSw`.
> - `get_node()`, `create_path()`, and `walk()` provide path lookup,
>   intermediate node creation, and pre-order traversal.
> - `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
>   `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
>   provide typed property access and mutation.
>=20
> Add unit tests in `tests/pylibfdt_tests.py` covering `DeviceTree`
> unflatten/flatten round-tripping, duplicate name rejection, and helper
> methods.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v3:
> - Move NodeTree out of pylibfdt/libfdt.i into a new devicetree.py module
>   and rename it to DeviceTree (David Gibson)
> - Store libfdt.Property objects in self.props instead of raw bytes
>   (David Gibson)
> - Return a packed libfdt.Fdt object from flatten() instead of raw bytes
>   and use fdt.set_boot_cpuid_phys() (David Gibson, Simon Glass)
> - Raise ValueError in unflatten() on duplicate property or sibling
>   subnode names (Simon Glass)
>=20
> Changes in v2:
> - Split live tree representation out of fdtfactor (David Gibson)
>=20
>  devicetree.py           | 276 ++++++++++++++++++++++++++++++++++++++++
>  meson.build             |   1 +
>  tests/meson.build       |   2 +-
>  tests/pylibfdt_tests.py |  77 +++++++++++
>  4 files changed, 355 insertions(+), 1 deletion(-)
>  create mode 100644 devicetree.py
>=20
> diff --git a/devicetree.py b/devicetree.py
> new file mode 100644
> index 000000000000..198ab73eda88
> --- /dev/null
> +++ b/devicetree.py

This should probably go in a subdir, since it's not part of dtc
proper.  I think putting it in pylibfdt is ok, even though it's not
technically part of pylibfdt either.

> @@ -0,0 +1,276 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +"""devicetree - Non-flattened in-memory device tree representation in Py=
thon."""
> +
> +import struct
> +
> +import libfdt
> +
> +
> +class DeviceTree:
> +    """In-memory live tree representation of a devicetree node and its s=
ubtree.
> +
> +    Attributes:
> +        props: Dict mapping property name (str) to `libfdt.Property`.
> +        children: Dict mapping child node name (str) to child `DeviceTre=
e`.
> +    """
> +
> +    def __init__(self):
> +        self.props =3D {}
> +        self.children =3D {}
> +
> +    @classmethod
> +    def unflatten(cls, fdt, offset=3D0):
> +        """Unflatten an FdtRo subtree starting at `offset` into a Device=
Tree.
> +
> +        Args:
> +            fdt: An `FdtRo` (or `Fdt`) instance.
> +            offset: Starting node offset (default 0 for the root node).
> +
> +        Returns:
> +            A `DeviceTree` representing the node at `offset` and its
> +            descendants.
> +
> +        Raises:
> +            ValueError: If a node contains duplicate property names or
> +                duplicate sibling subnode names.
> +        """
> +        node =3D cls()
> +        for prop in fdt.properties(offset):
> +            if prop.name in node.props:
> +                raise ValueError(f'Duplicate property {prop.name!r}')
> +            node.props[prop.name] =3D prop

This is, technically aliasing the Property returned directly from the
flattened tree, which seems a little risky.  Or at least it does if
Property is mutable, which it appears to be as a subclass of
bytearray.

On consideration, that kind of seems like a pre-existing mistake - the
way we use it, I think it makes more sense for Property to be
immutable (a subclass of 'bytes' instead).  I wonder if making that
change would break things.

> +        for suboff in fdt.subnodes(offset):

So, this can be a later improvement, it doesn't need a respin, but
this is a pretty inefficient way of unflattening the tree.  To get
=66rom one subnode to the next subnodes() needs to traverse everything
in between in the flattened format - which is also what the child
unflatten()s do.   So on at every level making this roughly O(d * n)
where n is the number of nodes, and d is the depth of the tree.  You
can unflatten in a single O(n) pass over the tree.

> +            subname =3D fdt.get_name(suboff)
> +            if subname in node.children:
> +                raise ValueError(f'Duplicate subnode {subname!r}')
> +            node.children[subname] =3D cls.unflatten(fdt, suboff)
> +        return node
> +
> +    def _flatten_subtree(self, sw, name):
> +        """Recursively write this DeviceTree and its children into an Fd=
tSw.
> +
> +        Args:
> +            sw: An `FdtSw` sequential-write instance.
> +            name: Node name for this subtree (empty string `''` for root=
).
> +        """
> +        with sw.add_node(name):
> +            for prop_name, val in self.props.items():
> +                sw.property(prop_name, bytes(val))
> +            for child_name, child_node in self.children.items():
> +                child_node._flatten_subtree(sw, child_name)
> +
> +    def flatten(self, mem_rsv=3D(), boot_cpuid_phys=3D0):
> +        """Serialize this root DeviceTree into a packed `libfdt.Fdt` obj=
ect.
> +
> +        Args:
> +            mem_rsv: Iterable of (address, size) tuples for the FDT memo=
ry
> +                reservation block.
> +            boot_cpuid_phys: Physical boot CPU ID for the FDT header.
> +
> +        Returns:
> +            Packed `libfdt.Fdt` instance.
> +        """
> +        sw =3D libfdt.FdtSw()
> +        for addr, size in mem_rsv:
> +            sw.add_reservemap_entry(addr, size)
> +        sw.finish_reservemap()
> +        self._flatten_subtree(sw, '')
> +        fdt =3D sw.as_fdt()
> +        fdt.set_boot_cpuid_phys(boot_cpuid_phys)
> +        fdt.pack()

The pack() is harmless, but probably unnecessary - fdt_finish(),
called from as_fdt() leaves an already packed tree.  Unless something
resized after that point, which set_boot_cpuid_phys() shouldn't do, it
should still be packed.

> +        return fdt
> +
> +    def get_node(self, path):
> +        """Look up a descendant DeviceTree by path without modifying the=
 tree.
> +
> +        Follows the slash-separated node names in `path` starting from `=
self`
> +        (leading, trailing, and repeated `'/'` characters are ignored, so
> +        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically, and `=
''` or
> +        `'/'` returns `self`). If any component along `path` is not pres=
ent in
> +        `children`, returns `None`.
> +
> +        Args:
> +            path: Slash-separated node path starting from `self` (e.g.
> +                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
> +
> +        Returns:
> +            The `DeviceTree` at `path`, or `None` if not found.
> +        """
> +        node =3D self
> +        for part in path.split('/'):
> +            if not part:
> +                continue
> +            node =3D node.children.get(part)
> +            if node is None:
> +                return None
> +        return node
> +
> +    def create_path(self, path):
> +        """Return the descendant DeviceTree at `path`, creating missing =
nodes.
> +
> +        Looks up a child or deeper descendant `DeviceTree` by following =
the
> +        slash-separated node names in `path` starting from `self` (leadi=
ng,
> +        trailing, and repeated `'/'` characters are ignored, so
> +        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically). If a=
ny
> +        node along `path` does not exist yet in `children`, a new empty
> +        `DeviceTree` is created for it automatically (similar to `mkdir =
-p`).
> +        Passing `''` or `'/'` returns `self`.
> +
> +        Example:
> +            root =3D DeviceTree()
> +            # Automatically creates root.children['soc'] and
> +            # root.children['soc'].children['i2c@4000'], and returns the
> +            # 'i2c@4000' DeviceTree.
> +            i2c =3D root.create_path('/soc/i2c@4000')
> +            i2c.set_str('status', 'okay')
> +
> +        Args:
> +            path: Slash-separated node path starting from `self` (e.g.
> +                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
> +
> +        Returns:
> +            The `DeviceTree` instance at `path`.
> +        """
> +        node =3D self
> +        for part in path.split('/'):
> +            if not part:
> +                continue
> +            if part not in node.children:
> +                node.children[part] =3D type(self)()
> +            node =3D node.children[part]
> +        return node
> +
> +    def walk(self, path=3D''):
> +        """Yield `(path, node)` pairs for this subtree in pre-order.
> +
> +        Args:
> +            path: Path prefix for `self` (defaults to `''` for the root =
node,
> +                producing paths like `''`, `'/soc'`, `'/soc/i2c@4000'`).
> +
> +        Yields:
> +            Tuple of `(path, node)` for `self` followed recursively by e=
ach
> +            descendant `DeviceTree`.
> +        """
> +        prefix =3D path.rstrip('/')
> +        yield path, self
> +        for name, child in self.children.items():
> +            yield from child.walk(f'{prefix}/{name}')
> +
> +    def get_str(self, name):
> +        """Return property `name` decoded as a NUL-terminated UTF-8 stri=
ng.
> +
> +        Args:
> +            name: Property name to look up in `self.props`.
> +
> +        Returns:
> +            Decoded string value (without the trailing NUL byte).
> +
> +        Raises:
> +            KeyError: If `name` is not in `self.props`.
> +            ValueError: If the property value is not a single NUL-termin=
ated
> +                UTF-8 string.
> +        """
> +        return self.props[name].as_str()

Rather than having wrappers around all the class Property acccessors,
would it be simpler (and only slightly more verbose) to just have a
property() method, returning a Property instance and use its accessors
in the caller?  Looking up properties with __getitem__ could also
work, although maybe the fact that doesn't get subnodes would be
confusing?

I guess that would also require a bunch of new class methods on
Property for the set* side.

> +    def set_str(self, name, val):
> +        """Set property `name` to a NUL-terminated UTF-8 string.
> +
> +        Args:
> +            name: Property name to set in `self.props`.
> +            val: String value to encode as UTF-8 with a trailing NUL byt=
e.
> +
> +        Raises:
> +            ValueError: If `val` contains embedded NUL characters.
> +        """
> +        if '\x00' in val:
> +            raise ValueError('String value contains embedded nul charact=
ers')
> +        self.props[name] =3D libfdt.Property(name, val.encode('utf-8') +=
 b'\x00')
> +
> +    def get_stringlist(self, name):
> +        """Return property `name` decoded as a list of NUL-separated str=
ings.
> +
> +        Args:
> +            name: Property name to look up in `self.props`.
> +
> +        Returns:
> +            List of decoded UTF-8 strings (`[]` if the property is empty=
).
> +
> +        Raises:
> +            KeyError: If `name` is not in `self.props`.
> +            ValueError: If a non-empty property lacks NUL termination.
> +        """
> +        return self.props[name].as_stringlist()
> +
> +    def set_stringlist(self, name, vals):
> +        """Set property `name` to a NUL-separated list of UTF-8 strings.
> +
> +        Args:
> +            name: Property name to set in `self.props`.
> +            vals: Iterable of strings to encode as NUL-terminated UTF-8.
> +
> +        Raises:
> +            ValueError: If any string in `vals` contains embedded NUL
> +                characters.
> +        """
> +        vals =3D list(vals)
> +        if any('\x00' in v for v in vals):
> +            raise ValueError('String value contains embedded nul charact=
ers')
> +        raw =3D b''.join(v.encode('utf-8') + b'\x00' for v in vals)
> +        self.props[name] =3D libfdt.Property(name, raw)
> +
> +    def get_u32(self, name):
> +        """Return property `name` decoded as a single big-endian uint32 =
cell.
> +
> +        Args:
> +            name: Property name to look up in `self.props`.
> +
> +        Returns:
> +            Integer value of the 32-bit cell.
> +
> +        Raises:
> +            KeyError: If `name` is not in `self.props`.
> +            ValueError: If the property length is not 4 bytes.
> +        """
> +        prop =3D self.props[name]
> +        if len(prop) !=3D 4:
> +            raise ValueError(f'Property {name!r} length {len(prop)} !=3D=
 4')
> +        return prop.as_uint32()
> +
> +    def set_u32(self, name, val):
> +        """Set property `name` to a single big-endian uint32 cell.
> +
> +        Args:
> +            name: Property name to set in `self.props`.
> +            val: Unsigned 32-bit integer value.
> +        """
> +        self.props[name] =3D libfdt.Property(name, struct.pack('>I', val=
))
> +
> +    def get_u32_list(self, name):
> +        """Return property `name` decoded as a list of big-endian uint32=
 cells.
> +
> +        Args:
> +            name: Property name to look up in `self.props`.
> +
> +        Returns:
> +            List of 32-bit unsigned integers.
> +
> +        Raises:
> +            KeyError: If `name` is not in `self.props`.
> +            ValueError: If the property length is not a multiple of 4 by=
tes.
> +        """
> +        prop =3D self.props[name]
> +        if len(prop) % 4 !=3D 0:
> +            raise ValueError(
> +                f'Property {name!r} length {len(prop)} is not a multiple=
 of 4'
> +            )
> +        return prop.as_uint32_list()
> +
> +    def set_u32_list(self, name, vals):
> +        """Set property `name` to a sequence of big-endian uint32 cells.
> +
> +        Args:
> +            name: Property name to set in `self.props`.
> +            vals: Sequence of unsigned 32-bit integer values.
> +        """
> +        raw =3D struct.pack(f'>{len(vals)}I', *vals)
> +        self.props[name] =3D libfdt.Property(name, raw)
> diff --git a/meson.build b/meson.build
> index 520cd35f9075..963d8f59b209 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -125,6 +125,7 @@ endforeach
> =20
>  if pylibfdt_enabled
>    subdir('pylibfdt')
> +  py.install_sources('devicetree.py')
>  endif
> =20
>  if get_option('tests')
> diff --git a/tests/meson.build b/tests/meson.build
> index c25500606059..8dbfc3f9e8e2 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -119,7 +119,7 @@ if not pylibfdt_enabled
>  else
>    env +=3D [
>      'PYTHON=3D' + py.full_path(),
> -    'PYTHONPATH=3D' + meson.project_build_root() / 'pylibfdt',
> +    'PYTHONPATH=3D' + meson.project_build_root() / 'pylibfdt' + ':' + me=
son.project_source_root(),
>      'NO_PYTHON=3D0',
>    ]
>  endif
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index ae46b29a8f5c..cfdb8f5749b6 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -11,6 +11,8 @@ import types
>  import unittest
> =20
>  sys.path.insert(0, '../pylibfdt')
> +sys.path.insert(0, '..')

See above about location of devicetree.py.  But.. for that matter,
with the code in a separate module, it probably makes sense to have
its tests in a separate file, too.

> +import devicetree
>  import libfdt
>  from libfdt import Fdt, FdtSw, FdtException, QUIET_NOTFOUND, QUIET_ALL
> =20
> @@ -717,6 +719,81 @@ class PyLibfdtRoTests(unittest.TestCase):
>          self.assertEqual(b'this is a placeholder string\0string2\0',
>                           self.fdt.getprop(node, 'placeholder'))
> =20
> +    def testDeviceTreeRoundTrip(self):
> +        """Test unflattening and flattening a tree via DeviceTree"""
> +        tree =3D copy.deepcopy(devicetree.DeviceTree.unflatten(self.fdt))

What's the deepcopy for?  You're not retaining the original
unflattened copy.

> +        self.assertIsInstance(tree.props['compatible'], libfdt.Property)

I don't know if directly accessing the tree's internal dictionary from
outside is a good idea.

> +        rsvmap =3D self.fdt.get_mem_rsv_list()
> +        cpuid =3D self.fdt.boot_cpuid_phys()
> +        fdt2 =3D tree.flatten(rsvmap, cpuid)
> +        self.assertIsInstance(fdt2, libfdt.Fdt)
> +        self.assertEqual(rsvmap, fdt2.get_mem_rsv_list())
> +        self.assertEqual(cpuid, fdt2.boot_cpuid_phys())
> +
> +        tree2 =3D devicetree.DeviceTree.unflatten(fdt2)
> +        nodes1 =3D [(path, n.props, list(n.children.keys()))
> +                  for path, n in tree.walk()]
> +        nodes2 =3D [(path, n.props, list(n.children.keys()))
> +                  for path, n in tree2.walk()]
> +        self.assertEqual(nodes1, nodes2)

I don't think it's guaranteed that walk() will get the nodes in the
same order each time, so you probably want sets instead of lists here.

> +
> +    def testDeviceTreeDuplicates(self):
> +        """Test that DeviceTree.unflatten() rejects duplicate names"""
> +        sw_prop =3D FdtSw()
> +        sw_prop.finish_reservemap()
> +        with sw_prop.add_node(''):
> +            sw_prop.property_u32('dup', 1)
> +            sw_prop.property_u32('dup', 2)
> +        with self.assertRaises(ValueError):
> +            devicetree.DeviceTree.unflatten(sw_prop.as_fdt())
> +
> +        sw_node =3D FdtSw()
> +        sw_node.finish_reservemap()
> +        with sw_node.add_node(''):
> +            with sw_node.add_node('dup'):
> +                pass
> +            with sw_node.add_node('dup'):
> +                pass
> +        with self.assertRaises(ValueError):
> +            devicetree.DeviceTree.unflatten(sw_node.as_fdt())
> +
> +    def testDeviceTreeHelpers(self):
> +        """Test DeviceTree navigation and typed property helpers"""
> +        root =3D devicetree.DeviceTree()
> +        self.assertIs(root, root.get_node(''))
> +        self.assertIs(root, root.get_node('/'))
> +        self.assertIsNone(root.get_node('/soc/i2c@4000'))
> +
> +        i2c =3D root.create_path('/soc/i2c@4000')
> +        self.assertIs(i2c, root.get_node('/soc/i2c@4000'))
> +        self.assertIs(i2c, root.get_node('soc/i2c@4000'))
> +        self.assertEqual(['', '/soc', '/soc/i2c@4000'],
> +                         [path for path, _ in root.walk()])
> +        self.assertEqual(['/', '/soc', '/soc/i2c@4000'],
> +                         [path for path, _ in root.walk('/')])
> +
> +        i2c.set_str('status', 'okay')
> +        self.assertIsInstance(i2c.props['status'], libfdt.Property)
> +        self.assertEqual('okay', i2c.get_str('status'))
> +        with self.assertRaises(ValueError):
> +            i2c.set_str('status', 'ok\x00ay')
> +
> +        i2c.set_stringlist('compatible', ['vendor,i2c', 'generic,i2c'])
> +        self.assertEqual(['vendor,i2c', 'generic,i2c'],
> +                         i2c.get_stringlist('compatible'))
> +        with self.assertRaises(ValueError):
> +            i2c.set_stringlist('compatible', ['vendor\x00,i2c'])
> +        i2c.set_stringlist('empty-list', [])
> +        self.assertEqual([], i2c.get_stringlist('empty-list'))
> +        with self.assertRaises(ValueError):
> +            i2c.get_str('empty-list')
> +
> +        i2c.set_u32('#address-cells', 1)
> +        self.assertEqual(1, i2c.get_u32('#address-cells'))
> +
> +        i2c.set_u32_list('reg', [0x4000, 0x100])
> +        self.assertEqual([0x4000, 0x100], i2c.get_u32_list('reg'))
> +
> =20
>  if __name__ =3D=3D "__main__":
>      unittest.main()
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--xuJ0e4XMj0h7KxEy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroWG8ACgkQzQJF27ox
2GfO6Q/+KLfU+IxIMplahcnGmMpwaC/Se6HStl+GD0TmdlpUC/xZrQeqNovKc2eK
VIbHY6deuupDEpoKeW4TywJK8Tz7a9EWJgdeHBr5viEqviYAs4TtCRm2+yXzS3mH
lnytmuXSqxseUvp1VkJWTNWEy4mf3yEOBv3MwRxZyyEMIzYe67ps71d09IwobXGQ
Tx4+Ygo9LLN1Y69jKeHxRhJaVYX73WwdEzNDesLz+pDBzgshuXtZuQw2osS/aQjI
hJTnLbPHW+1eY0SK7QJyBir2yIb5L0Z54eOCSTy/md1zOWXAlGvP+wETChmRo4ok
v3FWq8Z/SRl8NPkJ73XoeLd+zi21cV5Cn7OYxvw2P5+6QhOB2xaTEXwfepurVgDf
Mc0nhX+CH2iRB8EQMDKuTNsn+vaRzM1UpYqr8kEd5YiAnDdHywA0bhm1zwBb/ZKQ
bvgioOqxgghhm4pNRWfVS9+cduRVjniKgh7TSOZmjNzdqI3p0MSSx2hHk6B+crLV
x7VV7O72T78+OGsdk5cy/3o2ePzRDqIly9HzgIooG9scTJY7nwGy/85XbfWSVn/A
nstcAFHPtpPefuPck0xOcDiBnzvbilLjFh7AvWwjGPuvSDcK4Urn3XsQbAUP6wR9
U+QDHvqd6GZ6ekJqhTCcF5zmnK0gwfZA62brENyqPxK/lZgctME=
=/o56
-----END PGP SIGNATURE-----

--xuJ0e4XMj0h7KxEy--
