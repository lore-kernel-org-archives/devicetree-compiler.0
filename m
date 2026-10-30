Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336276;
	b=voN7/SB8ezKouDvbBOQObpJWA9J/+2WU24uIhSV1yEKf4iJcsevzUem80HpMwKur4Oie
	 uIagc+lZoRDxj11YYvfZQFd8MR/z5ROqaHvakZtlxSmHgYFZaQSBysF9Af66FClk7MBmC
	 mc+Lnym4sCeI0XYg4IjbuMbTlJyaP/XsXDB5lFUjXAFSBpOQ+pQ8OQQ+gpKn2frsq788m
	 sJV9aavIfbv4OTuo4dUNsFnE93SyFYuq0x39udtzfRdZyuhtOt2rB7PsCYXlPeb/YCEUl
	 x4W3FtzQP7iEtlHcIA8JYlva/JzzIM9oZNPCKDJ5fsJ94IPvJxyZf3Mi+VaAd6Xjc4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336276;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=g/WNxLvyqcAchDmWuSQpxzCG7I4s0YHB0LcXyEwcBwc=;
	b=b8YNL/xoSc1x46Duw68WBlPqcd7mxaq9uuMry0CtCzn15m9gVGGt4qY477ke/rg36MI6
	 9octtn0w8D/8ac1r1jKyd0+0h/rH409Ul+XHM+p9newwRNlDd4bfIZUacGw4he+o1VTn5
	 oyeQpeQI1YVHTmi3KvRESJyOkr4QWEtmWcwz6gMg6Tj1yJSdq8p2Z0BKxcE32PrGDzsf+
	 rLrbv/02sT4sl18i/1n5mbpd5ZW3ZaP3y01nv2q+CAD4qYqdMDJOoHSF3egSjHNdLzcC3
	 wu0SOGvgsHtdn/N2dvHLHSoAdJ6n4ZhiwF4Fr+/aoSX0E6GOrGveAJls3WVQPzt2w0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=YaHMHUvH;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EAF606A31C;
	Fri, 30 Oct 2026 04:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6EAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=YaHMHUvH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793336270;
	bh=g/WNxLvyqcAchDmWuSQpxzCG7I4s0YHB0LcXyEwcBwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaHMHUvHfN2HJF7FuI54U4bfGC4UkUrBWHHQbQsrk+TYMc1G5qeatJ9fHE/6/jeJ+
	 TqrHRn+jF9mg1m6GWFJm+W+TZ2JWz2UJF/opR/h4e1Yb89Zxxm5e511QhsqkvJR5if
	 AeLkWy53tDy/NHZGZgOCJcFQVuIQgF2PpPpwve7/KMvU9K/21kaIKxzDmcSXg75L7O
	 WmtB7oWezpLQl8jeAcDxQj4QcUZkZruDOfOTXqwK9B5s9TIKJICgON7mkfYWrZmiXv
	 nZRsio6ijM1CkEzMU7e71g2GgAsSIvYiP9Tate/E2ll+3xE+SraQfzMyQYgtjCSmrN
	 srfvqdi0t4Xhw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG83y1mX8z4wDh; Fri, 30 Oct 2026 15:57:50 +1100 (AEDT)
Date: Fri, 30 Oct 2026 15:57:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
Message-ID: <auQjnZ6rd4wqoORz@gractus.seuss>
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-4-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="MEzlFz2COTVcdiL/"
Content-Disposition: inline
In-Reply-To: <20261028215600.1713475-4-dianders@chromium.org>

--MEzlFz2COTVcdiL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 02:46:52PM -0700, Douglas Anderson wrote:
> Add `NodeTree`, an in-memory live tree representation of a devicetree
> node and its subtree, to `pylibfdt`:
>=20
> - `NodeTree.unflatten(fdt, offset=3D0)` builds a `NodeTree` hierarchy from
>   an `FdtRo` instance.
> - `NodeTree.flatten(mem_rsv=3D(), boot_cpuid_phys=3D0)` serializes a root
>   `NodeTree` back into a packed FDT blob via `FdtSw`.
> - `get_node()`, `create_path()`, and `walk()` provide path lookup,
>   intermediate node creation, and pre-order traversal.
> - `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
>   `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
>   provide typed property access and mutation (updating
>   `Property.as_str()` and `Property.as_stringlist()` so empty `b''`
>   properties raise `ValueError` or return `[]` rather than
>   `IndexError`).
>=20
> Add unit tests in `tests/pylibfdt_tests.py` covering `NodeTree`
> unflatten/flatten round-tripping and helper methods.

Thanks for splitting this out as suggested.  However, on
consideration, I don't think it really belongs in pylibfdt: the "f" in
there refers to "flattened" and this is, explicitly, a non-flattened
data structure.

I have sometimes thought about adding a library for handling
non-flattened trees, although I wasn't thinking something Python
specific.

I think for now let's move this to its own Python file / module.

> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v2:
> - Split NodeTree live tree representation out of fdtfactor into
>   pylibfdt (David Gibson)
>=20
>  pylibfdt/libfdt.i       | 262 +++++++++++++++++++++++++++++++++++++++-
>  tests/pylibfdt_tests.py |  54 +++++++++
>  2 files changed, 315 insertions(+), 1 deletion(-)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index 0db7110b4a38..f511c61746e3 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -929,7 +929,7 @@ class Property(bytearray):
> =20
>      def as_str(self):
>          """Unicode is supported by decoding from UTF-8"""
> -        if self[-1] !=3D 0:
> +        if not self or self[-1] !=3D 0:
>              raise ValueError('Property lacks nul termination')
>          if 0 in self[:-1]:
>              raise ValueError('Property contains embedded nul characters')
> @@ -937,6 +937,8 @@ class Property(bytearray):
> =20
>      def as_stringlist(self):
>          """Unicode is supported by decoding from UTF-8"""
> +        if not self:
> +            return []

The two hunks above are good fixes, but unrelated to the bulk of the patch.

>          if self[-1] !=3D 0:
>              raise ValueError('Property lacks nul termination')
>          parts =3D self[:-1].split(b'\x00')
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> =20
>      def __exit__(self, type, value, traceback):
>          self._fdt.end_node()
> +
> +
> +class NodeTree:

Maybe class DeviceTree?  The "node" doesn't really add any useful
information.

> +    """In-memory live tree representation of a devicetree node and its s=
ubtree.
> +
> +    Attributes:
> +        props: Dict mapping property name (str) to raw property value (b=
ytes).
> +        children: Dict mapping child node name (str) to child NodeTree.
> +    """
> +
> +    def __init__(self):
> +        self.props =3D {}
> +        self.children =3D {}
> +
> +    @classmethod
> +    def unflatten(cls, fdt, offset=3D0):
> +        """Unflatten an FdtRo subtree starting at `offset` into a NodeTr=
ee.
> +
> +        Args:
> +            fdt: An `FdtRo` (or `Fdt`) instance.
> +            offset: Starting node offset (default 0 for the root node).
> +
> +        Returns:
> +            A `NodeTree` representing the node at `offset` and its desce=
ndants.
> +        """
> +        node =3D cls()
> +        for prop in fdt.properties(offset):
> +            node.props[prop.name] =3D bytes(prop)

Since we already rely on class Property from libfdt.i, it seems like
it would be a little more natural to have the dictionary values be
class Property instances.  Yes, that technically has some redundant
storage of the property names, but we're not particularly concerned
about optimisation for this Python library.  Plus, Python's
assign-by-reference should mean it's generally just a duplicated
pointer, not a whole duplicated string.

> +        for suboff in fdt.subnodes(offset):
> +            node.children[fdt.get_name(suboff)] =3D cls.unflatten(fdt, s=
uboff)
> +        return node
> +
> +    def _flatten_subtree(self, sw, name):
> +        """Recursively write this NodeTree and its children into an FdtS=
w.
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
> +        """Serialize this root NodeTree into a packed FDT byte string.
> +
> +        Args:
> +            mem_rsv: Iterable of (address, size) tuples for the FDT memo=
ry
> +                reservation block.
> +            boot_cpuid_phys: Physical boot CPU ID for the FDT header.
> +
> +        Returns:
> +            Serialized FDT blob as `bytes`.
> +        """
> +        sw =3D FdtSw()
> +        for addr, size in mem_rsv:
> +            sw.add_reservemap_entry(addr, size)
> +        sw.finish_reservemap()
> +        self._flatten_subtree(sw, '')
> +        fdt =3D sw.as_fdt()
> +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> +        fdt.pack()

For better symmetry with unflatten(), I'd suggest returning the Fdt
object here, leaving the conversion to a bytearray to the caller.

> +        return bytes(fdt.as_bytearray())
> +
> +    def get_node(self, path):
> +        """Look up a descendant NodeTree by path without modifying the t=
ree.
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
> +            The `NodeTree` at `path`, or `None` if not found.
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
> +        """Return the descendant NodeTree at `path`, creating missing no=
des.
> +
> +        Looks up a child or deeper descendant `NodeTree` by following the
> +        slash-separated node names in `path` starting from `self` (leadi=
ng,
> +        trailing, and repeated `'/'` characters are ignored, so
> +        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically). If a=
ny
> +        node along `path` does not exist yet in `children`, a new empty
> +        `NodeTree` is created for it automatically (similar to `mkdir -p=
`).
> +        Passing `''` or `'/'` returns `self`.

Reference get_path() rather than repeating this useful, but wordy,
description.

> +
> +        Example:
> +            root =3D NodeTree()
> +            # Automatically creates root.children['soc'] and
> +            # root.children['soc'].children['i2c@4000'], and returns the
> +            # 'i2c@4000' NodeTree.
> +            i2c =3D root.create_path('/soc/i2c@4000')
> +            i2c.set_str('status', 'okay')
> +
> +        Args:
> +            path: Slash-separated node path starting from `self` (e.g.
> +                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
> +
> +        Returns:
> +            The `NodeTree` instance at `path`.
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
> +            descendant `NodeTree`.
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
> +        return Property(name, self.props[name]).as_str()
> +
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
> +        self.props[name] =3D val.encode('utf-8') + b'\x00'
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
> +        return Property(name, self.props[name]).as_stringlist()
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
> +        self.props[name] =3D b''.join(v.encode('utf-8') + b'\x00' for v =
in vals)
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
> +        raw =3D self.props[name]
> +        if len(raw) !=3D 4:
> +            raise ValueError(f'Property {name!r} length {len(raw)} !=3D =
4')
> +        return Property(name, raw).as_uint32()
> +
> +    def set_u32(self, name, val):
> +        """Set property `name` to a single big-endian uint32 cell.
> +
> +        Args:
> +            name: Property name to set in `self.props`.
> +            val: Unsigned 32-bit integer value.
> +        """
> +        self.props[name] =3D struct.pack('>I', val)
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
> +        raw =3D self.props[name]
> +        if len(raw) % 4 !=3D 0:
> +            raise ValueError(
> +                f'Property {name!r} length {len(raw)} is not a multiple =
of 4'
> +            )
> +        return Property(name, raw).as_uint32_list()
> +
> +    def set_u32_list(self, name, vals):
> +        """Set property `name` to a sequence of big-endian uint32 cells.
> +
> +        Args:
> +            name: Property name to set in `self.props`.
> +            vals: Sequence of unsigned 32-bit integer values.
> +        """
> +        self.props[name] =3D struct.pack(f'>{len(vals)}I', *vals)
>  %}
> =20
>  %rename(fdt_property) fdt_property_func;
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 2a0509c7802e..569eb698a86f 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -697,6 +697,60 @@ class PyLibfdtRoTests(unittest.TestCase):
>          self.assertEqual(b'this is a placeholder string\0string2\0',
>                           self.fdt.getprop(node, 'placeholder'))
> =20
> +    def testNodeTreeRoundTrip(self):
> +        """Test unflattening and flattening a tree via NodeTree"""
> +        tree =3D libfdt.NodeTree.unflatten(self.fdt)
> +        rsvmap =3D self.fdt.get_mem_rsv_list()
> +        cpuid =3D self.fdt.boot_cpuid_phys()
> +        blob =3D tree.flatten(rsvmap, cpuid)
> +
> +        fdt2 =3D libfdt.FdtRo(blob)
> +        self.assertEqual(rsvmap, fdt2.get_mem_rsv_list())
> +        self.assertEqual(cpuid, fdt2.boot_cpuid_phys())
> +
> +        tree2 =3D libfdt.NodeTree.unflatten(fdt2)
> +        nodes1 =3D [(path, n.props, list(n.children.keys()))
> +                  for path, n in tree.walk()]
> +        nodes2 =3D [(path, n.props, list(n.children.keys()))
> +                  for path, n in tree2.walk()]
> +        self.assertEqual(nodes1, nodes2)
> +
> +    def testNodeTreeHelpers(self):
> +        """Test NodeTree navigation and typed property helpers"""
> +        root =3D libfdt.NodeTree()
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
> 2.56.0.313.g2479322e68-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--MEzlFz2COTVcdiL/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkI50ACgkQzQJF27ox
2GfmEw/3d1pN0BiKxKGy7iealHNxR9rVQ2glq7oAYfTWKguJQ4EVxZN+0tkCvZ+W
FW/5+9PJdY6dVRAptBxi6xE5SReemBSEkp1Pq12005erCsTOjK8yA1f9IaLBcYWi
rEbdDT3XAayg8nqR92vY/rzr8VF3rsbh0GnaRxUXTskYwwJR3EBgp18iPFiUCzrV
pURArgxn5Pmw0FRzm3Fu5nX468U7iN0pXDWs/pcPnusNgt5COLc2JERi3Ysn83k8
iWE65gEpnIUW+8rBI1MKzY18dsslkr653MYmVuylE1eIwur5HYxPfAzVToIeh3fW
b91nauO/8N2+7tvtNeHfeKRazeYYLcUwF+U3d83miHn2jNu8cImzkvydYolhWecq
E0cZ2oBmC9FNsSQ7WFqgl06SYYP7socx9DHEMavlxUjNwaAT+F/njja56WPkGRrH
4a8qbBzApW3YL4norOsnChcRVXfFlK3I/WnPY5Je0w83V5qoVXaot8Y4YnuwKhL+
aIxuTyBtK5kB729mxYu4+D/voHJQKAtBLYB5W8p4e3jf2IEHPZ8mOE5MZfCQTciW
O/GThFw5jxe81EARlRqvMDtTk+t4YHr0G/5eQWzOWyl0vfjbtKJnVyIXBfVBI/pF
l4YOMI3nrUfYiW27tyV8r6w1S4KukUcgEy4h6bt0Tmo4jsS0+A==
=wF1L
-----END PGP SIGNATURE-----

--MEzlFz2COTVcdiL/--
