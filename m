Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862437;
	b=IDWwA02wOJRIZTGwDeYmJuJpLMbqpDxNd9k/G9y8ylAOfTMQPwNsv2muoyreVRd9djO+
	 b6tzNKlGy/peFid3/ams4VD2Hze26jZgyU0EaHzEITUiGgVbpOIuWiP7uLzupb4t9jmEB
	 tJ78cyDL+bATePAE6MVycVfPA/mgyxiyI3RFWeT/yCtA05G29dp+uRGo9PNE+X0ghBgKG
	 d6B81yIXO9TzZM5BgJjpMH0H1yhOsTdw8BOyPLfAuwCizZn9rbj/1OapORawX1Ya2C5mo
	 vsVKxoNMXSDgsQye6cMDtSmyHjYW5iFGlnaQ8veM4wzghiFO2LVXBROGAMYnLy9Oy4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+QUWqvrIVjaMeuZ4ZqY5JN03z7777uEi3uSGsQGof0=;
	b=wHtS3mgxhEBL1VjFGyCPtkQ689YmhOJjRAeFjk8zjg0fkTrUw3iki4T3RSlcB84XCaHd
	 ASkp6zCSRhHYAwrZJ7YPrRsAwbCS46s+i7ZUhHf2BxPS+ibdeOL298zTnBx4MHAuJ9pXM
	 SKKvtQwFbuqcTAgdf5w71gWapg65fc3C62xygaZG5urA7aG/9fEMLrByWwtOdUpJD80Yz
	 6hD4lPNRA/zWBC0KV2xReamFZdF7ca/nt9t4ZMN8AqMuYTdkHjhCeuAZ9hOcuFkyBqdzJ
	 onCBI14x/+y0DJORcjvKmONm20zK9hdJ1t+EBYVyU/RcSmqLPYmYwIMpjs3iqGZJ7yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kXMg5cD4;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F5D606A330
	for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 20:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F5D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kXMg5cD4
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so10873790eec.0
        for <Devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 12:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862436; x=1795467236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+QUWqvrIVjaMeuZ4ZqY5JN03z7777uEi3uSGsQGof0=;
        b=kXMg5cD4Sq051gT9LulxY577/KtweL/0eUWZ4mxo4oDyslhOpNPedOaxHOLExlgOc4
         +tIVgjSSeLb9sG/ik7q626meW6TmP4eTonhMfy+UlorrF2eFEgAh3jX5CIBIe6XvwGGy
         qO7WuGEUQ7BHl0gnrQl7/eOHoO/q9n+1KIXkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862436; x=1795467236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+QUWqvrIVjaMeuZ4ZqY5JN03z7777uEi3uSGsQGof0=;
        b=EF2uJXL0OcA8CK8ZpCUHTppamLW1vIi/UL4pIsSHkhDPf1a8b7EVzySKh346xIFgxr
         1D3yIpljgwFnsk+zkBHeOnPv4Tw1ChH4+2sZNBBwr4B2ki3v9Nvfq76yahs7+TCgHK6K
         LIZmv9TNnLdTJpPU06kqqjJIX65ip+EGAP0Lsaf28PYJOP+wUXq5IQiP3xjTNfki9paN
         WYB8qOEOzK9vFt/KxLKxi6QPsWe4NIwhsdFAdbEv0xpBxPl2plY79iUcb8WKb6QroMkm
         TRQxBZUHZozwyZMIh+fSA1sH5GqPmRTIFrDjeilFGG9RDyLoI4bVGmf5IdltyfWygdEi
         HBSg==
X-Gm-Message-State: APuU4Z/W2edqDiNcSFIN3yS4dMPFtDuPi5GauoXoUdWUqDAmlCEUMocM
	+y0nGM1cGJ0F/nUzCVw/9wEl03rCdWoaRqUfpXMr9FIr9t1bCDibXCxOgyw6FZUxu1pTSnt4wFC
	a67XW8g==
X-Gm-Gg: AZFdTZddbJLUzhiPqBX3he1yPVZ1v7F9hQO/mBsDnLJG4j6xus0Akw0baiQFdYBTI27
	X6y7oJbhyG3PScNrxY9+0/iZvRNwqeRlRlJnIchkTmLoCEgpQyyJzKhjezem+wb4oqLH4ceV5QA
	22CAKyDrcbzaWb06Td3OZlowiDWW9aFhWJtqQQIMAX9JZCXHB3+aLwQrNS2topBaaIlK5HOluba
	1ZY9oaMzD7J0YmCqqnwUybDl2nwHJZJow/gJkFeWGPSKIfuO6BQA1SVPF2aO8WJJODgt4F27XKP
	fEzXg3NHHdjku+7Hhn6b754HrXQcxTyAuLNbH9VTBe7qTOJ5JNoBrG6LulL+bVwJu2/WDUZQ6/N
	Jb3q1FTc27e84Dn/NpPe+4mZOy9/w3ezi+r0w8Nj+DWKNwPRBQwr0KsB3xHLej4JlHKEcDJkzQB
	aO5/yCxh1raIzmJ5YuHxWeKdvsBrqNXdb4xJRkt09SQqaPLZys0CJhW+wdxMYcL7TusRb2r1MGR
	V/WbjdzzXiyjTIXC54jfX3v4ZWBYYvAR4OkLxOc0vFKXBeAcldasr/Uc9tIkbOuhwBmyXJPAEop
	fLFtMpcpkQCstuUDeqxVkh/wPxmS81ZvEW0nrX6Kw9bltf4kbAGm/OGdwiWIII/gHqxihnm9BsW
	ul9iCcStopWinBw==
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr13173754eec.25.1794862435662;
        Mon, 16 Nov 2026 12:53:55 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:53 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 07/14] libpydt: Add DeviceTree live tree representation
Date: Mon, 16 Nov 2026 12:53:04 -0800
Message-ID: <20261116205320.1621386-8-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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

`pylibfdt`'s `Fdt` and `FdtRo` classes operate directly on flattened
device tree blobs, where inserting or deleting nodes and properties
shifts subsequent node offsets. That works well for in-place queries and
localized edits, but makes multi-tree comparison, structural diffing,
and bottom-up tree construction (as needed by the upcoming `fdtfactor`
tool) awkward and error-prone.

Add `pylibfdt/libpydt.py` providing `DeviceTree`, an in-memory live tree
representation where each node holds `props` (a dict mapping property
name to `libfdt.Property`) and `children` (a dict mapping child node
name to child `DeviceTree`), along with `unflatten()` and `flatten()` to
convert between `FdtRo`/`Fdt` blobs and live trees, and helpers for path
lookup, node creation, and pre-order traversal.

Add unit tests in `tests/libpydt_tests.py` covering `DeviceTree`
round-tripping, subtree unflattening, duplicate-name and corrupt-tree
rejection, and navigation helpers.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Start the commit message with the motivation for a live tree and
  condense the summary (Simon Glass)
- Rename devicetree.py to libpydt.py (under pylibfdt/) to avoid
  colliding with PyPI's python-devicetree package, and move its unit
  tests into a separate tests/libpydt_tests.py file (Simon Glass, David
  Gibson)
- Unflatten the tree in a single O(n) pass using fdt.next_node() instead
  of recursive O(d * n) fdt.subnodes() traversal, raising FdtException
  on corrupt/truncated trees, and add a unit test (David Gibson, Simon
  Glass)
- Implement DeviceTree.walk() iteratively with an explicit stack instead
  of recursive yield from, and populate node.props directly in
  unflatten()
- Drop redundant fdt.pack() call from DeviceTree.flatten() (David
  Gibson)
- Drop get_*/set_* typed wrapper methods from DeviceTree in favor of
  Property.as_*() and Property.from_*() plus DeviceTree.set_prop()
  (David Gibson)
- Drop unnecessary copy.deepcopy() and compare unordered node/child sets
  instead of ordered lists in round-trip test (David Gibson)

Changes in v3:
- Move NodeTree out of pylibfdt/libfdt.i into a new devicetree.py module
  and rename it to DeviceTree (David Gibson)
- Store libfdt.Property objects in self.props instead of raw bytes
  (David Gibson)
- Return a packed libfdt.Fdt object from flatten() instead of raw bytes
  and use fdt.set_boot_cpuid_phys() (David Gibson, Simon Glass)
- Raise ValueError in unflatten() on duplicate property or sibling
  subnode names (Simon Glass)

Changes in v2:
- Split live tree representation out of fdtfactor (David Gibson)

 pylibfdt/libpydt.py    | 184 +++++++++++++++++++++++++++++++++++++++++
 pylibfdt/meson.build   |   2 +
 tests/libpydt_tests.py | 106 ++++++++++++++++++++++++
 tests/meson.build      |   2 +-
 tests/run_tests.sh     |  13 ++-
 5 files changed, 302 insertions(+), 5 deletions(-)
 create mode 100644 pylibfdt/libpydt.py
 create mode 100644 tests/libpydt_tests.py

diff --git a/pylibfdt/libpydt.py b/pylibfdt/libpydt.py
new file mode 100644
index 000000000000..6d8501f432ca
--- /dev/null
+++ b/pylibfdt/libpydt.py
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+"""libpydt - Non-flattened in-memory device tree representation in Python."""
+
+import libfdt
+
+
+class DeviceTree:
+    """In-memory live tree representation of a devicetree node and its subtree.
+
+    `props` and `children` are public dictionaries intended to be accessed and
+    manipulated directly by callers (e.g. `node.props['status'].as_str()`,
+    `node.props.get('reg')`, `node.children.get('soc')`), with `set_prop()`
+    provided as a convenience for inserting a `libfdt.Property` under its own
+    `prop.name`.
+
+    Attributes:
+        props: Dict mapping property name (str) to `libfdt.Property`.
+        children: Dict mapping child node name (str) to child `DeviceTree`.
+    """
+
+    def __init__(self):
+        self.props = {}
+        self.children = {}
+
+    @classmethod
+    def unflatten(cls, fdt, offset=0):
+        """Unflatten an FdtRo subtree starting at `offset` into a DeviceTree.
+
+        Args:
+            fdt: An `FdtRo` (or `Fdt`) instance.
+            offset: Starting node offset (default 0 for the root node).
+
+        Returns:
+            A `DeviceTree` representing the node at `offset` and its
+            descendants.
+
+        Raises:
+            ValueError: If a node contains duplicate property names or
+                duplicate sibling subnode names.
+        """
+        stack = []
+        depth = 0
+        while depth >= 0:
+            node = cls()
+            props = node.props
+            for prop in fdt.properties(offset):
+                name = prop.name
+                if name in props:
+                    raise ValueError(f'Duplicate property {name!r}')
+                props[name] = prop
+            if depth == 0:
+                stack = [node]
+            else:
+                parent = stack[depth - 1]
+                subname = fdt.get_name(offset)
+                if subname in parent.children:
+                    raise ValueError(f'Duplicate subnode {subname!r}')
+                parent.children[subname] = node
+                del stack[depth:]
+                stack.append(node)
+            offset, depth = fdt.next_node(offset, depth)
+            if offset < 0:
+                libfdt.check_err(offset)
+        return stack[0]
+
+    def _flatten_subtree(self, sw, name):
+        """Recursively write this DeviceTree and its children into an FdtSw.
+
+        Args:
+            sw: An `FdtSw` sequential-write instance.
+            name: Node name for this subtree (empty string `''` for root).
+        """
+        with sw.add_node(name):
+            for prop_name, val in self.props.items():
+                sw.property(prop_name, val)
+            for child_name, child_node in self.children.items():
+                child_node._flatten_subtree(sw, child_name)
+
+    def flatten(self, mem_rsv=(), boot_cpuid_phys=0):
+        """Serialize this root DeviceTree into a packed `libfdt.Fdt` object.
+
+        Args:
+            mem_rsv: Iterable of (address, size) tuples for the FDT memory
+                reservation block.
+            boot_cpuid_phys: Physical boot CPU ID for the FDT header.
+
+        Returns:
+            Packed `libfdt.Fdt` instance.
+        """
+        sw = libfdt.FdtSw()
+        for addr, size in mem_rsv:
+            sw.add_reservemap_entry(addr, size)
+        sw.finish_reservemap()
+        self._flatten_subtree(sw, '')
+        fdt = sw.as_fdt()
+        fdt.set_boot_cpuid_phys(boot_cpuid_phys)
+        return fdt
+
+    def set_prop(self, prop):
+        """Insert or replace a `libfdt.Property` in `self.props` under `prop.name`.
+
+        Args:
+            prop: `libfdt.Property` instance to store at `self.props[prop.name]`.
+        """
+        self.props[prop.name] = prop
+
+    def get_node(self, path):
+        """Look up a descendant DeviceTree by path without modifying the tree.
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
+            The `DeviceTree` at `path`, or `None` if not found.
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
+        """Return the descendant DeviceTree at `path`, creating missing nodes.
+
+        Looks up a child or deeper descendant `DeviceTree` by following the
+        slash-separated node names in `path` starting from `self` (leading,
+        trailing, and repeated `'/'` characters are ignored, so
+        `'/soc/i2c@4000'` and `'soc/i2c@4000'` behave identically). If any
+        node along `path` does not exist yet in `children`, a new empty
+        `DeviceTree` is created for it automatically (similar to `mkdir -p`).
+        Passing `''` or `'/'` returns `self`.
+
+        Example:
+            root = DeviceTree()
+            # Automatically creates root.children['soc'] and
+            # root.children['soc'].children['i2c@4000'], and returns the
+            # 'i2c@4000' DeviceTree.
+            i2c = root.create_path('/soc/i2c@4000')
+            i2c.set_prop(libfdt.Property.from_str('status', 'okay'))
+
+        Args:
+            path: Slash-separated node path starting from `self` (e.g.
+                `'/soc/i2c@4000'` or `'soc/i2c@4000'`).
+
+        Returns:
+            The `DeviceTree` instance at `path`.
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
+            Tuple of `(path, node)` for `self` followed in pre-order by each
+            descendant `DeviceTree`.
+        """
+        stack = [(path, self)]
+        while stack:
+            cur_path, node = stack.pop()
+            yield cur_path, node
+            prefix = cur_path.rstrip('/')
+            for name, child in reversed(node.children.items()):
+                stack.append((f'{prefix}/{name}', child))
diff --git a/pylibfdt/meson.build b/pylibfdt/meson.build
index b13d8021497f..ccf6c1bf78a6 100644
--- a/pylibfdt/meson.build
+++ b/pylibfdt/meson.build
@@ -19,3 +19,5 @@ pylibfdt = py.extension_module(
   dependencies: [libfdt_dep, py.dependency()],
   install: true,
 )
+
+py.install_sources('libpydt.py', pure: false)
diff --git a/tests/libpydt_tests.py b/tests/libpydt_tests.py
new file mode 100644
index 000000000000..0f3d8d68945a
--- /dev/null
+++ b/tests/libpydt_tests.py
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+# libpydt - Tests for in-memory DeviceTree representation in Python
+#
+
+import sys
+import unittest
+
+sys.path.insert(0, '../pylibfdt')
+import libfdt
+from libfdt import FdtSw, Property
+import libpydt
+
+
+class DeviceTreeTests(unittest.TestCase):
+    """Test class for libpydt.DeviceTree"""
+
+    def setUp(self):
+        with open('test_tree1.dtb', mode='rb') as f:
+            self.fdt = libfdt.FdtRo(f.read())
+
+    def testRoundTrip(self):
+        """Test unflattening and flattening a tree via DeviceTree"""
+        tree = libpydt.DeviceTree.unflatten(self.fdt)
+        self.assertIsInstance(tree.props['compatible'], Property)
+        rsvmap = self.fdt.get_mem_rsv_list()
+        cpuid = self.fdt.boot_cpuid_phys()
+        fdt2 = tree.flatten(rsvmap, cpuid)
+        self.assertIsInstance(fdt2, libfdt.Fdt)
+        self.assertEqual(rsvmap, fdt2.get_mem_rsv_list())
+        self.assertEqual(cpuid, fdt2.boot_cpuid_phys())
+
+        tree2 = libpydt.DeviceTree.unflatten(fdt2)
+        nodes1 = {
+            path: (n.props, set(n.children.keys()))
+            for path, n in tree.walk()
+        }
+        nodes2 = {
+            path: (n.props, set(n.children.keys()))
+            for path, n in tree2.walk()
+        }
+        self.assertEqual(nodes1, nodes2)
+
+    def testUnflattenSubtree(self):
+        """Test unflattening a non-root subtree offset"""
+        suboff = self.fdt.path_offset('/subnode@1')
+        sub = libpydt.DeviceTree.unflatten(self.fdt, suboff)
+        self.assertEqual('subnode1', sub.props['compatible'].as_str())
+        self.assertEqual({'subsubnode', 'ss1'}, set(sub.children.keys()))
+
+    def testDuplicates(self):
+        """Test that DeviceTree.unflatten() rejects duplicate names"""
+        sw_prop = FdtSw()
+        sw_prop.finish_reservemap()
+        with sw_prop.add_node(''):
+            sw_prop.property_u32('dup', 1)
+            sw_prop.property_u32('dup', 2)
+        with self.assertRaises(ValueError):
+            libpydt.DeviceTree.unflatten(sw_prop.as_fdt())
+
+        sw_node = FdtSw()
+        sw_node.finish_reservemap()
+        with sw_node.add_node(''):
+            with sw_node.add_node('dup'):
+                pass
+            with sw_node.add_node('dup'):
+                pass
+        with self.assertRaises(ValueError):
+            libpydt.DeviceTree.unflatten(sw_node.as_fdt())
+
+    def testCorruptTree(self):
+        """Test that DeviceTree.unflatten() raises FdtException on corrupt trees"""
+        with open('truncated_property.dtb', mode='rb') as f:
+            fdt_trunc = libfdt.FdtRo(f.read())
+        with self.assertRaises(libfdt.FdtException):
+            libpydt.DeviceTree.unflatten(fdt_trunc)
+
+        # Truncate size_dt_struct so the tree ends mid-subnode
+        corrupt = self.fdt.as_bytearray()
+        fdt_corrupt = libfdt.FdtRo(corrupt)
+        fdt_corrupt._fdt[36:40] = (32).to_bytes(4, 'big')
+        with self.assertRaises(libfdt.FdtException):
+            libpydt.DeviceTree.unflatten(fdt_corrupt)
+
+    def testNavigationAndProps(self):
+        """Test DeviceTree navigation and property setting"""
+        root = libpydt.DeviceTree()
+        self.assertIs(root, root.get_node(''))
+        self.assertIs(root, root.get_node('/'))
+        self.assertIsNone(root.get_node('/soc/i2c@4000'))
+
+        i2c = root.create_path('/soc/i2c@4000')
+        self.assertIs(i2c, root.get_node('/soc/i2c@4000'))
+        self.assertIs(i2c, root.get_node('soc/i2c@4000'))
+        self.assertEqual({'', '/soc', '/soc/i2c@4000'},
+                         {path for path, _ in root.walk()})
+        self.assertEqual({'/', '/soc', '/soc/i2c@4000'},
+                         {path for path, _ in root.walk('/')})
+
+        i2c.set_prop(Property.from_str('status', 'okay'))
+        self.assertEqual('okay', i2c.props['status'].as_str())
+        i2c.set_prop(Property.from_uint32('#address-cells', 1))
+        self.assertEqual(1, i2c.props['#address-cells'].as_uint32())
+
+
+if __name__ == '__main__':
+    unittest.main()
diff --git a/tests/meson.build b/tests/meson.build
index c25500606059..e37567864e04 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -119,7 +119,7 @@ if not pylibfdt_enabled
 else
   env += [
     'PYTHON=' + py.full_path(),
-    'PYTHONPATH=' + meson.project_build_root() / 'pylibfdt',
+    'PYTHONPATH=' + meson.project_build_root() / 'pylibfdt' + ':' + meson.project_source_root() / 'pylibfdt',
     'NO_PYTHON=0',
   ]
 endif
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index f750faa1f60a..3cacb68438df 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1149,17 +1149,16 @@ fdtoverlay_tests() {
     run_wrap_test test "$bd" = "$pd"
 }
 
-pylibfdt_tests () {
-    run_dtc_test -I dts -O dtb -o test_props.dtb "$SRCDIR/test_props.dts"
+run_python_tests () {
     TMP=/tmp/tests.stderr.$$
-    $PYTHON "$SRCDIR/pylibfdt_tests.py" -v 2> $TMP
+    $PYTHON "$1" -v 2> $TMP
 
     # Use the 'ok' message meaning the test passed, 'ERROR' meaning it failed
     # and the summary line for total tests (e.g. 'Ran 17 tests in 0.002s').
     # We could add pass + fail to get total tests, but this provides a useful
     # sanity check.
     pass_count=$(grep "ok$" $TMP | wc -l)
-    fail_count=$(grep "^ERROR: " $TMP | wc -l)
+    fail_count=$(grep "^ERROR: \|^FAIL: " $TMP | wc -l)
     total_tests=$(sed -n 's/^Ran \([0-9]*\) tests.*$/\1/p' $TMP)
     cat $TMP
     rm $TMP
@@ -1170,6 +1169,12 @@ pylibfdt_tests () {
     tot_tests=$((tot_tests + $total_tests))
 }
 
+pylibfdt_tests () {
+    run_dtc_test -I dts -O dtb -o test_props.dtb "$SRCDIR/test_props.dts"
+    run_python_tests "$SRCDIR/pylibfdt_tests.py"
+    run_python_tests "$SRCDIR/libpydt_tests.py"
+}
+
 while getopts "vt:me" ARG ; do
     case $ARG in
 	"v")
-- 
2.56.0.679.gc527c65306-goog

