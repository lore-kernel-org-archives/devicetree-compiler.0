Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224597;
	b=B3vF8HzWJqv7UKynk7s0Ny4OipzxkhGy8g8uRBR8A/QFJ4mPUISkMC1rTZOlC3tHJEn9
	 8SEKkQoVD//JjfYhkM1N21gGKcG4upFT8B01+KfqjtnEYG7BrMdt1BoHAlAhQE2zNV27p
	 7JRAQYSsuDlHYeBwfy84d+zsVG3OeRXqh7vWDOzlX72F2Qs2VFCoJxEpab2vCX/3tGWev
	 hujoSuP1m+o9JADs76RpY8MhoBuGYsXjk1yumc58CMQ0RRuPRfeSKrMPOp41wX+xDYFII
	 VnVYP/jlNDBQOcUfeMNTFtpLffpoEwnd7HSnxeH6VliFmO48Z2yVc9iQo+AdEhRXZGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wGgB/ijUDwBxHekK4j1T2Y6PnrD7TnIyhzZKvUfUubQ=;
	b=N1LWf4HE6TXzdt0nv/p7WV5FvuDVoRPY0MiXqQMduNGeBmjP8moonyf/pmIAW1Pkib1L
	 Arx8QEKPYxwC6Eqa0s59WFNgQn0Ko2roUOpth61NEVSHR/OmbDhlNWlgFZn3q1saR0k6r
	 2GTZwMEd19p1fmBFBU10sBMzrsoXG9nE2IZEx4tAm9yL/KBxyu7Nj2pphFvql20lziBNi
	 Y1+0D8QZJAj88hLSVBBeBPznmIKndy+yJarrlz1CFo/F8PqkuzLel874L3nA8jc4tWRiJ
	 bPxarwMxxTlvfeTjOacBoopbF2W0BZ8E83Ja9wQ5aWuqWpAEFGCVICm109QWQdUt1Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ivtdJ4rZ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67560A263A
	for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 21:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B67560A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ivtdJ4rZ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1752901eec.1
        for <Devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 14:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224596; x=1793829396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGgB/ijUDwBxHekK4j1T2Y6PnrD7TnIyhzZKvUfUubQ=;
        b=ivtdJ4rZr4dfQ2s9Ibo+4/l8uRFNhFiYrI+7GFNKCeucZXc6S+2AFQpKaZeDvNGPOx
         iKji4CeYJS8aqAlj13P/1IuWko7mlKMIsHXD5Je1d1+ZTKzDru4v43/N/n78WviRWCmA
         LrP8ei//GGqj3zZJT0/UBnp+SeTvKQEbxzp5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224596; x=1793829396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGgB/ijUDwBxHekK4j1T2Y6PnrD7TnIyhzZKvUfUubQ=;
        b=p5BoT+Sv8HJQYdSoIaLO52AJXaFDSUCIjMGkMJ/F8dV9mIvMCyC//fMIUfnBlGYpA6
         1dfCWKmSJOKrJazG6h4/wqrg4ytTf8VtSk8AYH5dJ+Zs4k3T3noIMQuhWN9tKL50at64
         EzTTcmcz05v/Pz8syeQumIjfCO4Lw4JhqkcYw/isBpG6L2uHkaU6LZOFIYFMQhp4Jcnf
         QoMCLk9LtGZ5IM4+nn55wpVY5OCoVMsGuG8K6xkazWkMt1gwqHLex/WYYot0xkKlECzU
         KBuF6JTl7k8ZIp3ROE08pcQ3AXh1+VNVymb+Rp5yL7L9kDi3u02B5FKnKQAZ/H3ctHSI
         ILSQ==
X-Gm-Message-State: AFq9FYJRJ3yz56NARehbd5GwvgeJKuszhHtFJVi8FxBF6vd9c5b6pWuA
	gSsEfhJj2+gSUy2wFe1Yi5eYoq+fv5J7hsErQkRNQYbjYSZMxeIixoRImUX6gPan5MMYmeqzGoP
	1tu3Po+D1
X-Gm-Gg: AYBFou1dGYFHgeovN6iCWwNkEMLvGrsH3y5qQC74htEkxG9YE3D3Q7nSs8d9W/bQgYm
	exOY2aFJCZym+JzLvhs25jHA7n7eUvaUynE/Dk1fZdL9D7KrqWdp10uWa+H0WjG/XbNnkBZ+B5f
	C3PhlNFeVqir1CFgWVKvq26+F7ZhAroIl4Hj3U5i0r7U2RtwahCcFELe61G53VQvZQXjciiWXsg
	dCE9uoKqKwkJfISlZ94HpirXcS3k0zK3Zwp89ofFsQiq66XjuNjq9rwHRXDH2x5xALL5to2vrEd
	psvQ3abKuMW2DnUNWTTHSDo5k2JAeMTEoIYz9Mb4w2j7RUO8OZ9pmOsO8F5R5wdDJcpi56jp3Od
	kErQPqbTv7k03qq1t0uh08MEiZyk1FlnZ6shjOvS3A/HtwZ3KXWLUP10ZCp+Po4trBNxNMgPecb
	7ImUawE9JxzS1w0EqxLBR2xh6P9HQor7JdvaTEYR58iqa2UQDOP9QdN8ktuOi3rMv6H3n+y+Vaa
	jkqrpqDXDMQDX4ApGk3rRTPGT5RbUa/xWlskVLU/5VnU1ZNztq+3PYWJ/XQnajgfOP7/Cwl6YZF
	9IVf2SvyiAxIh16iPUwgPvrAP709AuXl8/omwWj2jS+LFGQBKu9M51kqCCp3mxT5G8Sv+oMYrfb
	GTBj9rkBQ3Q4Pm1y+sZOlee+WEGT5jwjB5g==
X-Received: by 2002:a05:7300:680e:b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-36a1fd4cbecmr4361952eec.0.1793224595280;
        Wed, 28 Oct 2026 14:56:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
Date: Wed, 28 Oct 2026 14:46:52 -0700
Message-ID: <20261028215600.1713475-4-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
In-Reply-To: <20261028215600.1713475-1-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add `NodeTree`, an in-memory live tree representation of a devicetree
node and its subtree, to `pylibfdt`:

- `NodeTree.unflatten(fdt, offset=0)` builds a `NodeTree` hierarchy from
  an `FdtRo` instance.
- `NodeTree.flatten(mem_rsv=(), boot_cpuid_phys=0)` serializes a root
  `NodeTree` back into a packed FDT blob via `FdtSw`.
- `get_node()`, `create_path()`, and `walk()` provide path lookup,
  intermediate node creation, and pre-order traversal.
- `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
  `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
  provide typed property access and mutation (updating
  `Property.as_str()` and `Property.as_stringlist()` so empty `b''`
  properties raise `ValueError` or return `[]` rather than
  `IndexError`).

Add unit tests in `tests/pylibfdt_tests.py` covering `NodeTree`
unflatten/flatten round-tripping and helper methods.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Split NodeTree live tree representation out of fdtfactor into
  pylibfdt (David Gibson)

 pylibfdt/libfdt.i       | 262 +++++++++++++++++++++++++++++++++++++++-
 tests/pylibfdt_tests.py |  54 +++++++++
 2 files changed, 315 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 0db7110b4a38..f511c61746e3 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -929,7 +929,7 @@ class Property(bytearray):
 
     def as_str(self):
         """Unicode is supported by decoding from UTF-8"""
-        if self[-1] != 0:
+        if not self or self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         if 0 in self[:-1]:
             raise ValueError('Property contains embedded nul characters')
@@ -937,6 +937,8 @@ class Property(bytearray):
 
     def as_stringlist(self):
         """Unicode is supported by decoding from UTF-8"""
+        if not self:
+            return []
         if self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         parts = self[:-1].split(b'\x00')
@@ -1210,6 +1212,264 @@ class NodeAdder():
 
     def __exit__(self, type, value, traceback):
         self._fdt.end_node()
+
+
+class NodeTree:
+    """In-memory live tree representation of a devicetree node and its subtree.
+
+    Attributes:
+        props: Dict mapping property name (str) to raw property value (bytes).
+        children: Dict mapping child node name (str) to child NodeTree.
+    """
+
+    def __init__(self):
+        self.props = {}
+        self.children = {}
+
+    @classmethod
+    def unflatten(cls, fdt, offset=0):
+        """Unflatten an FdtRo subtree starting at `offset` into a NodeTree.
+
+        Args:
+            fdt: An `FdtRo` (or `Fdt`) instance.
+            offset: Starting node offset (default 0 for the root node).
+
+        Returns:
+            A `NodeTree` representing the node at `offset` and its descendants.
+        """
+        node = cls()
+        for prop in fdt.properties(offset):
+            node.props[prop.name] = bytes(prop)
+        for suboff in fdt.subnodes(offset):
+            node.children[fdt.get_name(suboff)] = cls.unflatten(fdt, suboff)
+        return node
+
+    def _flatten_subtree(self, sw, name):
+        """Recursively write this NodeTree and its children into an FdtSw.
+
+        Args:
+            sw: An `FdtSw` sequential-write instance.
+            name: Node name for this subtree (empty string `''` for root).
+        """
+        with sw.add_node(name):
+            for prop_name, val in self.props.items():
+                sw.property(prop_name, bytes(val))
+            for child_name, child_node in self.children.items():
+                child_node._flatten_subtree(sw, child_name)
+
+    def flatten(self, mem_rsv=(), boot_cpuid_phys=0):
+        """Serialize this root NodeTree into a packed FDT byte string.
+
+        Args:
+            mem_rsv: Iterable of (address, size) tuples for the FDT memory
+                reservation block.
+            boot_cpuid_phys: Physical boot CPU ID for the FDT header.
+
+        Returns:
+            Serialized FDT blob as `bytes`.
+        """
+        sw = FdtSw()
+        for addr, size in mem_rsv:
+            sw.add_reservemap_entry(addr, size)
+        sw.finish_reservemap()
+        self._flatten_subtree(sw, '')
+        fdt = sw.as_fdt()
+        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
+        fdt.pack()
+        return bytes(fdt.as_bytearray())
+
+    def get_node(self, path):
+        """Look up a descendant NodeTree by path without modifying the tree.
+
+        Follows the slash-separated node names in `path` starting from `self`
+        (leading, trailing, and repeated `'/'` characters are ignored, so
+        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically, and `''` or
+        `'/'` returns `self`). If any component along `path` is not present in
+        `children`, returns `None`.
+
+        Args:
+            path: Slash-separated node path starting from `self` (e.g.
+                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
+
+        Returns:
+            The `NodeTree` at `path`, or `None` if not found.
+        """
+        node = self
+        for part in path.split('/'):
+            if not part:
+                continue
+            node = node.children.get(part)
+            if node is None:
+                return None
+        return node
+
+    def create_path(self, path):
+        """Return the descendant NodeTree at `path`, creating missing nodes.
+
+        Looks up a child or deeper descendant `NodeTree` by following the
+        slash-separated node names in `path` starting from `self` (leading,
+        trailing, and repeated `'/'` characters are ignored, so
+        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically). If any
+        node along `path` does not exist yet in `children`, a new empty
+        `NodeTree` is created for it automatically (similar to `mkdir -p`).
+        Passing `''` or `'/'` returns `self`.
+
+        Example:
+            root = NodeTree()
+            # Automatically creates root.children['soc'] and
+            # root.children['soc'].children['i2c@4000'], and returns the
+            # 'i2c@4000' NodeTree.
+            i2c = root.create_path('/soc/i2c@4000')
+            i2c.set_str('status', 'okay')
+
+        Args:
+            path: Slash-separated node path starting from `self` (e.g.
+                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
+
+        Returns:
+            The `NodeTree` instance at `path`.
+        """
+        node = self
+        for part in path.split('/'):
+            if not part:
+                continue
+            if part not in node.children:
+                node.children[part] = type(self)()
+            node = node.children[part]
+        return node
+
+    def walk(self, path=''):
+        """Yield `(path, node)` pairs for this subtree in pre-order.
+
+        Args:
+            path: Path prefix for `self` (defaults to `''` for the root node,
+                producing paths like `''`, `'/soc'`, `'/soc/i2c@4000'`).
+
+        Yields:
+            Tuple of `(path, node)` for `self` followed recursively by each
+            descendant `NodeTree`.
+        """
+        prefix = path.rstrip('/')
+        yield path, self
+        for name, child in self.children.items():
+            yield from child.walk(f'{prefix}/{name}')
+
+    def get_str(self, name):
+        """Return property `name` decoded as a NUL-terminated UTF-8 string.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            Decoded string value (without the trailing NUL byte).
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If the property value is not a single NUL-terminated
+                UTF-8 string.
+        """
+        return Property(name, self.props[name]).as_str()
+
+    def set_str(self, name, val):
+        """Set property `name` to a NUL-terminated UTF-8 string.
+
+        Args:
+            name: Property name to set in `self.props`.
+            val: String value to encode as UTF-8 with a trailing NUL byte.
+
+        Raises:
+            ValueError: If `val` contains embedded NUL characters.
+        """
+        if '\x00' in val:
+            raise ValueError('String value contains embedded nul characters')
+        self.props[name] = val.encode('utf-8') + b'\x00'
+
+    def get_stringlist(self, name):
+        """Return property `name` decoded as a list of NUL-separated strings.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            List of decoded UTF-8 strings (`[]` if the property is empty).
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If a non-empty property lacks NUL termination.
+        """
+        return Property(name, self.props[name]).as_stringlist()
+
+    def set_stringlist(self, name, vals):
+        """Set property `name` to a NUL-separated list of UTF-8 strings.
+
+        Args:
+            name: Property name to set in `self.props`.
+            vals: Iterable of strings to encode as NUL-terminated UTF-8.
+
+        Raises:
+            ValueError: If any string in `vals` contains embedded NUL
+                characters.
+        """
+        vals = list(vals)
+        if any('\x00' in v for v in vals):
+            raise ValueError('String value contains embedded nul characters')
+        self.props[name] = b''.join(v.encode('utf-8') + b'\x00' for v in vals)
+
+    def get_u32(self, name):
+        """Return property `name` decoded as a single big-endian uint32 cell.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            Integer value of the 32-bit cell.
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If the property length is not 4 bytes.
+        """
+        raw = self.props[name]
+        if len(raw) != 4:
+            raise ValueError(f'Property {name!r} length {len(raw)} != 4')
+        return Property(name, raw).as_uint32()
+
+    def set_u32(self, name, val):
+        """Set property `name` to a single big-endian uint32 cell.
+
+        Args:
+            name: Property name to set in `self.props`.
+            val: Unsigned 32-bit integer value.
+        """
+        self.props[name] = struct.pack('>I', val)
+
+    def get_u32_list(self, name):
+        """Return property `name` decoded as a list of big-endian uint32 cells.
+
+        Args:
+            name: Property name to look up in `self.props`.
+
+        Returns:
+            List of 32-bit unsigned integers.
+
+        Raises:
+            KeyError: If `name` is not in `self.props`.
+            ValueError: If the property length is not a multiple of 4 bytes.
+        """
+        raw = self.props[name]
+        if len(raw) % 4 != 0:
+            raise ValueError(
+                f'Property {name!r} length {len(raw)} is not a multiple of 4'
+            )
+        return Property(name, raw).as_uint32_list()
+
+    def set_u32_list(self, name, vals):
+        """Set property `name` to a sequence of big-endian uint32 cells.
+
+        Args:
+            name: Property name to set in `self.props`.
+            vals: Sequence of unsigned 32-bit integer values.
+        """
+        self.props[name] = struct.pack(f'>{len(vals)}I', *vals)
 %}
 
 %rename(fdt_property) fdt_property_func;
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 2a0509c7802e..569eb698a86f 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -697,6 +697,60 @@ class PyLibfdtRoTests(unittest.TestCase):
         self.assertEqual(b'this is a placeholder string\0string2\0',
                          self.fdt.getprop(node, 'placeholder'))
 
+    def testNodeTreeRoundTrip(self):
+        """Test unflattening and flattening a tree via NodeTree"""
+        tree = libfdt.NodeTree.unflatten(self.fdt)
+        rsvmap = self.fdt.get_mem_rsv_list()
+        cpuid = self.fdt.boot_cpuid_phys()
+        blob = tree.flatten(rsvmap, cpuid)
+
+        fdt2 = libfdt.FdtRo(blob)
+        self.assertEqual(rsvmap, fdt2.get_mem_rsv_list())
+        self.assertEqual(cpuid, fdt2.boot_cpuid_phys())
+
+        tree2 = libfdt.NodeTree.unflatten(fdt2)
+        nodes1 = [(path, n.props, list(n.children.keys()))
+                  for path, n in tree.walk()]
+        nodes2 = [(path, n.props, list(n.children.keys()))
+                  for path, n in tree2.walk()]
+        self.assertEqual(nodes1, nodes2)
+
+    def testNodeTreeHelpers(self):
+        """Test NodeTree navigation and typed property helpers"""
+        root = libfdt.NodeTree()
+        self.assertIs(root, root.get_node(''))
+        self.assertIs(root, root.get_node('/'))
+        self.assertIsNone(root.get_node('/soc/i2c@4000'))
+
+        i2c = root.create_path('/soc/i2c@4000')
+        self.assertIs(i2c, root.get_node('/soc/i2c@4000'))
+        self.assertIs(i2c, root.get_node('soc/i2c@4000'))
+        self.assertEqual(['', '/soc', '/soc/i2c@4000'],
+                         [path for path, _ in root.walk()])
+        self.assertEqual(['/', '/soc', '/soc/i2c@4000'],
+                         [path for path, _ in root.walk('/')])
+
+        i2c.set_str('status', 'okay')
+        self.assertEqual('okay', i2c.get_str('status'))
+        with self.assertRaises(ValueError):
+            i2c.set_str('status', 'ok\x00ay')
+
+        i2c.set_stringlist('compatible', ['vendor,i2c', 'generic,i2c'])
+        self.assertEqual(['vendor,i2c', 'generic,i2c'],
+                         i2c.get_stringlist('compatible'))
+        with self.assertRaises(ValueError):
+            i2c.set_stringlist('compatible', ['vendor\x00,i2c'])
+        i2c.set_stringlist('empty-list', [])
+        self.assertEqual([], i2c.get_stringlist('empty-list'))
+        with self.assertRaises(ValueError):
+            i2c.get_str('empty-list')
+
+        i2c.set_u32('#address-cells', 1)
+        self.assertEqual(1, i2c.get_u32('#address-cells'))
+
+        i2c.set_u32_list('reg', [0x4000, 0x100])
+        self.assertEqual([0x4000, 0x100], i2c.get_u32_list('reg'))
+
 
 if __name__ == "__main__":
     unittest.main()
-- 
2.56.0.313.g2479322e68-goog

