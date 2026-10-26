Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792990312;
	b=eJcA6r3LwOSmt4rU3NLwTn51bdelh66S+wWElpND4mYVUWh2G6s1t/aoifaqbYLgZPUL
	 70SFW5Sj3rY3pr3kJFf2tdjVNbSebud9kJjAI7zG4J1iDdUT9X3/nerEDVm2ps04nsJQc
	 D05t+RDdIEMiSCD3krcGSicLU0assAZ2ySLNSyko4SjU0cd//mlCocuu/bgpZUCPvodL2
	 pHK60TdmUGGYCwJjkUyF22XxqyIJWWZcv4CelLo6tvRDtw9mJ96upoh0rp/I6oS+1Wlxw
	 zpC/1s4Okj2Qkfun12PIPOoQ4QzZyoAKoezT6jMr4BUCgrk8ZMquhAKVEDpaaMTmlxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990312;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=/FfSjHG3B3ZIpmK+6yVhJfZsrgg1wA4mCrNulQryy18=;
	b=t+uj5Nlff76YXyKfBz25adL5XLmjATE73MT0nxjVa3EI05I9jrEs8TFdVfnItOnsKeK6
	 ZQTZXfx1pnbaOpFkbR0aestFFOt91uBXpyQZkfk1sT5BRlKPZTG06gO0/eWUJmgNx45wT
	 +knN0NIZWbQC1gYCr6JUFwvptGPlVIocL7W81FfHlhk/B1j7vUf5Gax0D7RFfO+WhGiUW
	 6yWjfC8lsGZ6SaiLcGdLS7U2XhIsqchXmgO4QUA52AWNqLW1zrP4f9Ry9E+GjXwm1RFpU
	 MuNwPa6536OwavMkppbPerZFLASDstL5AsWWJCEezo6DbZZPbrTTc4Ld12b6S4whXCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="lmNSAw6/";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286E7606A31E;
	Mon, 26 Oct 2026 04:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 286E7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=lmNSAw6/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792990301;
	bh=/FfSjHG3B3ZIpmK+6yVhJfZsrgg1wA4mCrNulQryy18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lmNSAw6/6VDWgKP8QRikgoYdknf3lGVWS1gjyhpO+rXaroGKieFD2FxmHC8QS3TZF
	 kORr4WLygwgJzsf1mVNpOYUMTjc8jrmbBT+SKVHT/gX6IyDd4Ca+hwPr1P0rfbGQN6
	 w0A4DCur9bEcXCnLy5hQNih+g5lRAu46yHWARD8pBBRdnsnwRWlhBdKkMIhxSO+90I
	 n+uXeYwGKS2KfS9F+hh6XUL62voVT52LjyumOrZVvPXLAESR1zNj1MUOzu09QMsctY
	 R2DxX2rkU/m4H9csIEYXvASqhjhNR2j5uvpMq6Jgs4kkFczK9N+MvOeGN74KDWiAIs
	 boYOrIfbtq/7Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jCh6j3n1Bz4wK3; Mon, 26 Oct 2026 15:51:41 +1100 (AEDT)
Date: Mon, 26 Oct 2026 15:50:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
	Devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 2/4] fdtfactor: Add tool to split DTBs into a base DTB
 and overlays
Message-ID: <at7cBFtlAQOFJ8jG@gractus.seuss>
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-3-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="0GvNcZVVdx3zecoJ"
Content-Disposition: inline
In-Reply-To: <20261015182221.2931742-3-dianders@chromium.org>

--0GvNcZVVdx3zecoJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:21:35AM -0700, Douglas Anderson wrote:
> When shipping a single firmware or kernel image that supports many
> closely related board variants or SKUs, bundling a full compiled .dtb
> for every variant results in substantial duplication.
>=20
> Add `fdtfactor`, a Python tool built on `pylibfdt` that takes a set of
> compiled device tree blobs (.dtb) compiled with `-@ -L` (`/__symbols__`
> and `/__local_fixups__`) and splits them into a single common
> `base.dtb` and per-board `.dtbo` overlays:
>=20
> - Common nodes present across all input DTBs are placed in `base.dtb`,
>   with each common property assigned the value shared by at least two
>   boards that maximizes byte savings across overlays.
> - Using `/__local_fixups__`, phandle references inside property values
>   are normalized to target node paths so common properties referencing
>   common nodes match even when numeric phandles differ across input
>   DTBs.
> - Any common node that carries a phandle in any input DTB receives its
>   phandle in `base.dtb` so overlays only emit `phandle` properties on
>   newly added subnodes, matching the requirements of `libfdt`, Linux's
>   `drivers/of/overlay.c`, and coreboot's `dt_apply_overlay()`.
>=20
> On a set of 47 Qualcomm SC7180 Trogdor Chromebook board DTBs,
> `fdtfactor -S` reduces total uncompressed size from 7.69 MB to 634 KB
> (91.8% savings).
>=20
> Add 3-board test cases covering default mode and `--strip-local-fixups`
> to the `fdtoverlay` test suite.
>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

This patch is very large, which makes it fairly hard to review - a
danger with AI generated code.  However, from the premise there's not
an obvious (to me) logical way of splitting it up.  I'll see what
appears as I go through the implementation.


> ---
>=20
>  Makefile                   |    2 +-
>  README.md                  |   58 ++
>  fdtfactor                  | 1218 ++++++++++++++++++++++++++++++++++++
>  meson.build                |    1 +
>  tests/Makefile.tests       |    2 +-
>  tests/fdtfactor_board1.dts |   69 ++
>  tests/fdtfactor_board2.dts |   73 +++
>  tests/fdtfactor_board3.dts |   96 +++
>  tests/run_tests.sh         |   61 +-
>  tests/testutils.sh         |    1 +
>  10 files changed, 1578 insertions(+), 3 deletions(-)
>  create mode 100755 fdtfactor
>  create mode 100644 tests/fdtfactor_board1.dts
>  create mode 100644 tests/fdtfactor_board2.dts
>  create mode 100644 tests/fdtfactor_board3.dts
>=20
> diff --git a/Makefile b/Makefile
> index 9110d17796b0..4df5bbda9ce2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -165,7 +165,7 @@ BIN +=3D fdtget
>  BIN +=3D fdtput
>  BIN +=3D fdtoverlay
> =20
> -SCRIPTS =3D dtdiff
> +SCRIPTS =3D dtdiff fdtfactor
> =20
>  all: $(BIN) libfdt
> =20
> diff --git a/README.md b/README.md
> index 8f1a5d2a4d67..e2ff2374b01d 100644
> --- a/README.md
> +++ b/README.md
> @@ -91,6 +91,64 @@ $ make NO_PYTHON=3D1
>  More work remains to support all of libfdt, including access to numeric
>  values.
> =20
> +## fdtfactor

Hm, makes me realise we don't have information in the README about
dtdiff.  Oh well.

> +`fdtfactor` is a Python tool built on `pylibfdt` that takes a set of
> +compiled device tree blobs (`.dtb`) and splits them into a single common
> +`base.dtb` and per-board `.dtbo` overlays so that applying a board's
> +`.dtbo` to `base.dtb` recreates the original board device tree while
> +reducing total storage size.
> +
> +Input `.dtb` files must be compiled with `dtc -@ -L` so that both
> +`/__symbols__` (used to resolve overlay `/__fixups__` against `base.dtb`)
> +and `/__local_fixups__` (used to identify phandle references inside
> +property values) are present.
> +
> +Basic usage:
> +
> +```
> +$ fdtfactor -b base.dtb -o out_dir board1.dtb board2.dtb board3.dtb
> +```
> +
> +Options:
> +
> +* `-b`, `--base-dtb`: Output path for the common base `.dtb` (placed in
> +  `--outdir` if specified without a directory component).
> +* `-o`, `--outdir`: Output directory for generated `.dtbo` files (and for
> +  `--base-dtb` when given without a directory component).

Maybe it's just me, but I find it slightly confusing that both -b and
-o are controlling the output names.  I'd be inclined to drop -b and
always send the generated based dtb to <outdir>/base.dtb, at least for
this first patch introducing the tool.  After all, you can always mv
it afterwards.

> +* `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the genera=
ted
> +  `base.dtb` and final reconstructed device trees. When `-L` is passed to
> +  `dtc` solely so `fdtfactor` can locate phandle cells at build time, the
> +  original DTB's `/__local_fixups__` subtree is not needed at runtime by
> +  either the overlay loader (`fdt_overlay_apply()`) or the OS kernel;
> +  passing `-S` strips it to reduce the size of both `base.dtb` and the
> +  `.dtbo` overlays. Omit `-S` if downstream tooling or verification
> +  expects applying a board's `.dtbo` to `base.dtb` to reproduce the
> +  original `.dtb`'s `/__local_fixups__` subtree verbatim.

Useful option, could be split to another patch to make this one less
huge.

> +* `--verify`: Verify that applying each generated `.dtbo` to `base.dtb`
> +  with `libfdt` recreates the original `.dtb`.

Seems like something more for the test suite than built into the tool.

> +* `-v`, `--verbose`: Print size savings summary.

Something like --stats might be better for this.  -v tends to be more
for debugging / logging output.

> +
> +### TODO
> +
> +* **Explore omitting `/__fixups__` and `/__symbols__` from overlays by
> +  hardcoding base DT phandles**: Normally a standalone `.dtbo` stores
> +  references to base tree nodes as `0xffffffff` with string entries in
> +  `/__fixups__` that the overlay loader resolves at runtime against
> +  `base.dtb`'s `/__symbols__`. Because `fdtfactor` generates `base.dtb`
> +  and all `.dtbo` overlays together, it already knows the exact numeric
> +  phandle values assigned to every node in `base.dtb`. Neither `libfdt` =
nor
> +  coreboot modifies property cells that are not listed in `/__fixups__` =
or
> +  `/__local_fixups__`. Writing the base phandle integers directly into
> +  overlay properties would allow omitting `/__fixups__` from the `.dtbo`
> +  files (and omitting `/__symbols__` when runtime symbol lookup is not
> +  needed), further reducing overlay size and speeding up boot-time overl=
ay
> +  application.

I really don't like that idea.  You'd essentially be creating not
really valid dtbo files that will work by accident against one
specific base file.

> +* **Multi-level overlays**: Support hierarchical overlay layers (for
> +  example, SoC base -> board family intermediate overlay -> SKU leaf
> +  overlay) when multiple boards share large sub-trees not present across
> +  all boards.

That sounds like a useful extension for the future.  An interim step
would be to extend to instead of taking a bunch of dtbs as input, take
a single (already generated) base dtb and a bunch of dtbos.  You'd
leave the given base alone, but find further common things between the
dtbs, in the context of that base.  The idea is you'd run fdtfactor
once on the raw dtbs, then run it again on a subset of the dtbos
emitted from the first pass to find further commonalities in that
subset.

>  ## Mailing lists
> =20
>  * The [devicetree-compiler](mailto:devicetree-compiler@vger.kernel.org)
> diff --git a/fdtfactor b/fdtfactor
> new file mode 100755
> index 000000000000..377f499bea50
> --- /dev/null
> +++ b/fdtfactor
> @@ -0,0 +1,1218 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +"""Split compiled device tree blobs (.dtb) into a base .dtb and .dtbo ov=
erlays.
> +
> +Given a set of compiled device tree blobs, fdtfactor extracts all common=
 nodes
> +and properties into a single base .dtb file and writes the per-board
> +differences into .dtbo overlay files. Applying an overlay to the base .d=
tb
> +using fdtoverlay or libfdt's fdt_overlay_apply() recreates the correspon=
ding
> +original device tree.
> +"""
> +
> +import argparse
> +from collections import Counter
> +import os
> +import struct
> +import sys
> +
> +import libfdt
> +
> +
> +def split_dtb_filename(path):
> +    """Split a DTB path into its directory and filename stem.
> +
> +    Example:
> +        '/dir/board.dtb' -> ('/dir', 'board')
> +
> +    Args:
> +        path: File path to a .dtb or .dtbo file.
> +
> +    Returns:
> +        Tuple of (directory, stem) where `stem` has any trailing `.dtb` =
or
> +        `.dtbo` suffix removed.
> +    """
> +    directory, filename =3D os.path.split(path)
> +    stem, sep, ext =3D filename.rpartition('.')
> +    if not stem or not sep or ext not in ('dtb', 'dtbo'):
> +        stem =3D filename
> +    return directory, stem

Hm, I'll have to see how this is actually used, but I'm generally a
bit leery (on non-Windows systems) of using the extension as anything
but a hint / default.

> +
> +class NodeTree:
> +    """In-memory tree of nodes and properties for sequential FDT creatio=
n."""

A "live" tree representation is the right data structure for this job.
On the other hand it's a pretty hefty piece of infrastructure to just
inline in this tool.

I'd suggest adding this as a preliminary patch, with a more trivial
test case (say round trip from dtb to dtb via the in-memory
representation).  Then introduce the actual fdtfactor logic to use it.

> +    def __init__(self):
> +        self.props =3D {}
> +        self.children =3D {}
> +
> +    def get_node(self, path):
> +        """Return the descendant NodeTree at `path`, creating missing no=
des.

I gess it's what you need here, but "creating missing nodes" seems
risky for what looks at first glance like a read interface.

> +        Looks up a child or deeper descendant `NodeTree` by following the
> +        slash-separated node names in `path` starting from `self` (leadi=
ng and
> +        trailing `'/'` characters are ignored, so `'/soc/i2c@4000'` and
> +        `'soc/i2c@4000'` behave identically). If any node along `path` d=
oes not
> +        exist yet in `self.children`, a new empty `NodeTree` is created =
for it
> +        automatically (similar to `mkdir -p`). Passing `''` or `'/'` ret=
urns
> +        `self`.
> +
> +        Example:
> +            root =3D NodeTree()
> +            # The following automatically creates root.children['soc'] a=
nd
> +            # root.children['soc'].children['i2c@4000'], and returns the
> +            # 'i2c@4000' NodeTree.
> +            i2c =3D root.get_node('/soc/i2c@4000')
> +            i2c.props['status'] =3D b'okay\\x00'

Should probably be b'status' - property names aren't Unicode.

> +
> +        Args:
> +            path: Slash-separated node path starting from `self` (leadin=
g `'/'`
> +                is optional and ignored, e.g. `'/soc/i2c@4000'` or
> +                `'soc/i2c@4000'`).
> +
> +        Returns:
> +            The `NodeTree` instance at `path`.
> +        """
> +        if path =3D=3D '/' or not path:
> +            return self

Again, path should be treated as a bytestring not a string - node
names are not Unicode.  At least, internally that should be the case.
Accepting a string and converting it to a bytestring would be fine.

> +        curr =3D self
> +        for part in path.strip('/').split('/'):

Hmm.  The strip() here means it will ignore not just one, but any
number of leading or trailing '/'.  However, internal repeated '/'
will result in subnodes named '', which is not desirable.

Simpler and more consistent might be to drop the initial special case
handling of '/' and '' as full paths and instead go with:

	for part in path.split('/'):
	    if not part:
	        continue
	    . . .
	   =20

> +            if part not in curr.children:
> +                curr.children[part] =3D NodeTree()
> +            curr =3D curr.children[part]
> +        return curr
> +
> +    def _write_to_sw(self, sw, name=3D''):

Traditionally the process of converting an in-memory device tree
representation to a dtb is referred to as "flattening".  So I'd
suggest maybe _flatten_subtree() for this.  As an internal function,
I'd also drop the default name=3D'' - it's rarely useful and incorrect
if called on anything except the root node.

> +        """Recursively write this NodeTree and its children into an FdtS=
w.
> +
> +        Args:
> +            sw: A `libfdt.FdtSw` sequential-write instance.
> +            name: Node name for this subtree (empty string for the root =
node).
> +        """
> +        sw.begin_node(name)
> +        for prop_name, val in self.props.items():
> +            sw.property(prop_name, bytes(val))
> +        for child_name, child_node in self.children.items():
> +            child_node._write_to_sw(sw, child_name)
> +        sw.end_node()
> +
> +    def to_fdt_blob(self, mem_rsv=3D(), boot_cpuid_phys=3D0, size_hint=
=3D65536):

flatten()

> +        """Serialize this root NodeTree into a packed FDT byte string.
> +
> +        Args:
> +            mem_rsv: Iterable of (address, size) tuples for the FDT memo=
ry
> +                reservation block.
> +            boot_cpuid_phys: Physical boot CPU ID for the FDT header.
> +            size_hint: Initial buffer size hint in bytes for `libfdt.Fdt=
Sw`.
> +
> +        Returns:
> +            Serialized FDT blob as `bytes`.
> +        """
> +        sw =3D libfdt.FdtSw(size_hint)
> +        for addr, size in mem_rsv:
> +            sw.add_reservemap_entry(addr, size)
> +        sw.finish_reservemap()
> +        self._write_to_sw(sw, '')
> +        # Unlike other FdtSw methods, as_fdt() does not call check_space=
()
> +        # when fdt_finish() appends the 4-byte FDT_END token. If fewer t=
han
> +        # 4 bytes remain in the buffer, resize once and retry.

That seems like a bug in FdtSw.as_fdt().  We should fix that, rather
than working around it here.

> +        try:
> +            fdt =3D sw.as_fdt()
> +        except libfdt.FdtException as exc:
> +            if not sw.check_space(exc.err):
> +                raise
> +            fdt =3D sw.as_fdt()
> +        libfdt.fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> +        fdt.pack()
> +        return bytes(fdt.as_bytearray())
> +
> +
> +def _open_fdt_ro(raw_bytes, filename):
> +    """Validate and wrap an uncompressed FDT blob in `libfdt.FdtRo`.
> +
> +    Args:
> +        raw_bytes: Uncompressed FDT binary contents as `bytes`.
> +        filename: Display name or file path for error reporting.

This is a weird interface.  Why not take just the filename, and read
the bytes from it in here?

> +    Returns:
> +        A validated `libfdt.FdtRo` instance.
> +
> +    Raises:
> +        ValueError: If `raw_bytes` fails FDT header or full-structure ch=
ecks.
> +    """
> +    try:
> +        fdt =3D libfdt.FdtRo(raw_bytes)
> +        libfdt.check_err(libfdt.fdt_check_full(fdt._fdt, len(raw_bytes)))
> +    except libfdt.FdtException as exc:
> +        raise ValueError(f'{filename}: Invalid FDT blob ({exc})') from e=
xc
> +    return fdt
> +
> +
> +def _is_dtbo_overlay(fdt_ro):
> +    """Return True if `fdt_ro` is a `.dtbo` overlay rather than a base D=
TB.
> +
> +    Args:
> +        fdt_ro: A `libfdt.FdtRo` instance wrapping an uncompressed FDT b=
lob.
> +
> +    Returns:
> +        True if the FDT has `/__fixups__` or a top-level fragment node
> +        containing an `__overlay__` subnode.
> +    """
> +    if fdt_ro.subnode_offset(0, '__fixups__', quiet=3Dlibfdt.QUIET_NOTFO=
UND) >=3D 0:
> +        return True
> +    soff =3D fdt_ro.first_subnode(0, quiet=3Dlibfdt.QUIET_NOTFOUND)
> +    while soff >=3D 0:
> +        if fdt_ro.subnode_offset(
> +            soff, '__overlay__', quiet=3Dlibfdt.QUIET_NOTFOUND
> +        ) >=3D 0:
> +            return True
> +        soff =3D fdt_ro.next_subnode(soff, quiet=3Dlibfdt.QUIET_NOTFOUND)
> +    return False

Clumsier than I'd like, but that's the fault of the overlay format,
not this code.

> +
> +
> +class ParsedDtb:
> +    """Parsed representation of an input .dtb blob."""
> +
> +    def __init__(self, filename, raw_bytes):

Again, why take filename and bytes separately?

> +        """Parse an uncompressed FDT blob into nodes, symbols, and fixup=
s.
> +
> +        Args:
> +            filename: Display name or file path for error reporting.
> +            raw_bytes: Uncompressed FDT binary contents as `bytes`.
> +        """
> +        self.filename =3D filename
> +        self.raw_bytes =3D raw_bytes
> +        fdt =3D _open_fdt_ro(raw_bytes, filename)

This is the only caller of _open_fdt_ro(), which itself is not very
long.  Any reason not to just open code it here?

> +        if _is_dtbo_overlay(fdt):
> +            raise ValueError(
> +                f'{filename}: Input is already a DTB overlay (.dtbo)'
> +            )
> +
> +        # Extract FDT header metadata (boot_cpuid_phys and /memreserve/ =
table)
> +        # stored outside the DT node/property tree; see _validate_dtb_he=
aders()
> +        # for why these require special handling.
> +        self.boot_cpuid_phys =3D fdt.boot_cpuid_phys()
> +        self.mem_rsv =3D [
> +            tuple(fdt.get_mem_rsv(i)) for i in range(fdt.num_mem_rsv())
> +        ]

I wonder if "get all mem reserves" would be a useful method to add to FdtRo.

> +
> +        self.has_symbols =3D False
> +        self.symbols =3D {}
> +        self.has_local_fixups =3D False
> +        self.local_fixups =3D {}

What's the reason for the separate has_* fields, rather than encoding
that as an empty self.symbols or self.local_fixups?


> +        self.nodes =3D {}
> +        self.phandles =3D {}
> +        self.has_phandle_prop =3D {}
> +        self.has_linux_phandle_prop =3D {}
> +        self.phandle_to_path =3D {}
> +        self.sym_props =3D {}
> +
> +        self._parse_tree(fdt)
> +
> +    @classmethod
> +    def from_file(cls, path):

Why a class method rather than doing this in __init__()?

> +        """Read and parse a .dtb file from disk.
> +
> +        Args:
> +            path: Path to the input .dtb file.
> +
> +        Returns:
> +            A new `ParsedDtb` instance.
> +        """
> +        with open(path, 'rb') as f:
> +            raw_bytes =3D f.read()
> +        return cls(path, raw_bytes)
> +
> +    def _parse_tree(self, fdt):
> +        """Walk the FDT and extract nodes, properties, symbols, and fixu=
ps.
> +
> +        Args:
> +            fdt: A `libfdt.FdtRo` instance wrapping the input blob.
> +        """
> +        self._walk_regular(fdt, 0, '/')
> +
> +        sym_off =3D fdt.subnode_offset(0, '__symbols__',
> +                                     quiet=3Dlibfdt.QUIET_NOTFOUND)

You already unflattened the tree, but deliberately excluded
__symbols__.  Both clearer and more efficient to *not* exclude it from
the unflattening, then read the symbols from the unflattened version,
rather than re-parsing.

> +        if sym_off >=3D 0:
> +            self.has_symbols =3D True
> +            poff =3D fdt.first_property_offset(sym_off,
> +                                             quiet=3Dlibfdt.QUIET_NOTFOU=
ND)
> +            while poff >=3D 0:
> +                prop =3D fdt.get_property_by_offset(poff)
> +                if prop.name not in ('phandle', 'linux,phandle'):

Huh, __symbols__ typically won't have a phandle, but yeah, we can't
exclude the possibility.  Another ugliness in the overlay format.

> +                    target_path =3D prop.as_str() if prop else ''

As everywhere, I think it would be safer to treat paths and node names
as bytestrings.

> +                    if target_path not in self.nodes:
> +                        raise ValueError(
> +                            f'{self.filename}: symbol {prop.name!r} refe=
rences '
> +                            f'missing node {target_path!r}'
> +                        )
> +                    self.symbols[prop.name] =3D target_path
> +                poff =3D fdt.next_property_offset(poff,
> +                                                quiet=3Dlibfdt.QUIET_NOT=
FOUND)
> +
> +        lf_off =3D fdt.subnode_offset(0, '__local_fixups__',
> +                                    quiet=3Dlibfdt.QUIET_NOTFOUND)
> +        if lf_off >=3D 0:
> +            self.has_local_fixups =3D True
> +            self._walk_local_fixups(fdt, lf_off, '/')
> +
> +    def _walk_regular(self, fdt, nodeoffset, path):
> +        """Recursively collect regular nodes and their properties.

I'd suggest "unflatten" as the name by analogy with similar code in
dtc and the kernel.

> +
> +        Args:
> +            fdt: A `libfdt.FdtRo` instance.
> +            nodeoffset: Offset of the current node in `fdt`.
> +            path: Full device tree path of the current node (e.g. '/soc'=
).
> +        """
> +        props =3D {}
> +        ph_val =3D None
> +        has_ph =3D False
> +        has_linux_ph =3D False
> +
> +        poff =3D fdt.first_property_offset(nodeoffset,
> +                                         quiet=3Dlibfdt.QUIET_NOTFOUND)
> +        while poff >=3D 0:
> +            prop =3D fdt.get_property_by_offset(poff)
> +            raw =3D bytes(prop)
> +            if prop.name in ('phandle', 'linux,phandle'):

It would be slightly less efficient, but I think recording the
phandles as a second pass rather than while you're parsing the
structure might be clearer.

> +                if len(raw) !=3D 4:

You can use len() directly on prop, as a subclass of bytearray.

> +                    raise ValueError(
> +                        f'{self.filename}: {path}: {prop.name} length '
> +                        f'{len(raw)} !=3D 4'
> +                    )
> +                val =3D struct.unpack('>I', raw)[0]

You can use Property.as_uint32() rather than opencoding a
struct.unpack.

> +                if ph_val is not None and ph_val !=3D val:
> +                    raise ValueError(
> +                        f'{self.filename}: {path}: mismatched phandle '
> +                        f'({ph_val:#x} vs {val:#x})'
> +                    )
> +                ph_val =3D val
> +                if prop.name =3D=3D 'phandle':
> +                    has_ph =3D True
> +                else:
> +                    has_linux_ph =3D True
> +            else:
> +                props[prop.name] =3D raw
> +            poff =3D fdt.next_property_offset(poff, quiet=3Dlibfdt.QUIET=
_NOTFOUND)
> +
> +        self.nodes[path] =3D props

Wait... what?  You're not storing this as the NodeTree structure you
established above?  That's weird.

> +        self.phandles[path] =3D ph_val
> +        self.has_phandle_prop[path] =3D has_ph
> +        self.has_linux_phandle_prop[path] =3D has_linux_ph

Why parallel maps for all these, rather than a single Node object?
Or NodeTree, since you have that already.

> +        if ph_val is not None:
> +            if ph_val in (0, 0xffffffff):
> +                raise ValueError(
> +                    f'{self.filename}: invalid phandle {ph_val:#x} on {p=
ath}'
> +                )
> +            if ph_val in self.phandle_to_path:
> +                raise ValueError(
> +                    f'{self.filename}: duplicate phandle {ph_val:#x} on '
> +                    f'{self.phandle_to_path[ph_val]} and {path}'
> +                )
> +            self.phandle_to_path[ph_val] =3D path
> +
> +        soff =3D fdt.first_subnode(nodeoffset, quiet=3Dlibfdt.QUIET_NOTF=
OUND)
> +        while soff >=3D 0:

Hm, node and property iterators would probably be a good addition to
FdtRo (should be fairly easy using generators).

> +            name =3D fdt.get_name(soff)
> +            if path =3D=3D '/' and name in ('__symbols__', '__local_fixu=
ps__'):
> +                soff =3D fdt.next_subnode(soff, quiet=3Dlibfdt.QUIET_NOT=
FOUND)
> +                continue

I'd *definitely* suggest that parsing symbols and fixups be handled in
a later pass rather than linline during parsing.

> +            child_path =3D '/' + name if path =3D=3D '/' else f'{path}/{=
name}'
> +            self._walk_regular(fdt, soff, child_path)
> +            soff =3D fdt.next_subnode(soff, quiet=3Dlibfdt.QUIET_NOTFOUN=
D)
> +
> +    def _walk_local_fixups(self, fdt, nodeoffset, rel_path):
> +        """Recursively collect phandle byte offsets from `/__local_fixup=
s__`.
> +
> +        Args:
> +            fdt: A `libfdt.FdtRo` instance.
> +            nodeoffset: Offset of the current node inside `/__local_fixu=
ps__`.
> +            rel_path: Corresponding target node path in the device tree.

'rel_path' is a bad name, since this is an absolute path in the tree.

> +        Raises:
> +            ValueError: If a fixup property length is not a multiple of =
4.
> +        """
> +        poff =3D fdt.first_property_offset(nodeoffset,
> +                                         quiet=3Dlibfdt.QUIET_NOTFOUND)

Again, this would be qeasier if you used the unflattened __local_fixups__.

> +        while poff >=3D 0:
> +            prop =3D fdt.get_property_by_offset(poff)
> +            raw =3D bytes(prop)
> +            if len(raw) % 4 !=3D 0:

Again, you can use len() directly on prop.

> +                raise ValueError(
> +                    f'{self.filename}: malformed __local_fixups__ proper=
ty '
> +                    f'{rel_path}:{prop.name} (length {len(raw)})'
> +                )
> +            count =3D len(raw) // 4
> +            offsets =3D struct.unpack(f'>{count}I', raw)

and as_uint32_list().

> +            self.local_fixups[(rel_path, prop.name)] =3D offsets
> +            poff =3D fdt.next_property_offset(poff, quiet=3Dlibfdt.QUIET=
_NOTFOUND)
> +
> +        soff =3D fdt.first_subnode(nodeoffset, quiet=3Dlibfdt.QUIET_NOTF=
OUND)
> +        while soff >=3D 0:
> +            name =3D fdt.get_name(soff)
> +            child_path =3D '/' + name if rel_path =3D=3D '/' else f'{rel=
_path}/{name}'
> +            self._walk_local_fixups(fdt, soff, child_path)
> +            soff =3D fdt.next_subnode(soff, quiet=3Dlibfdt.QUIET_NOTFOUN=
D)
> +
> +    def build_symbolic_props(self):
> +        """Build normalized property values for comparison across DTBs.
> +
> +        Populates `self.sym_props[path][prop_name]` with a tuple:
> +            `(masked_bytes, ((offset, target_node_path), ...))`
> +        where phandle cells listed in `self.local_fixups` are zeroed in
> +        `masked_bytes` and recorded symbolically by their target node pa=
th.
> +
> +        Raises:
> +            ValueError: If a fixup references a missing property, its of=
fset is
> +                out of range, or it references an unknown phandle value.
> +        """
> +        for path, prop_name in self.local_fixups:
> +            if path not in self.nodes or prop_name not in self.nodes[pat=
h]:
> +                raise ValueError(
> +                    f'{self.filename}: local fixup references missing pr=
operty '
> +                    f'{path}:{prop_name}'
> +                )

Probably makes more sense for this check to happen while parsing
local_fixups than afterwards here.

> +        for path, props in self.nodes.items():
> +            node_sym_props =3D {}
> +            for prop_name, raw in props.items():
> +                offsets =3D self.local_fixups.get((path, prop_name), ())

Walking the whole tree, then looking up if it is in local_fixups seems
the wrong way around.  Better to walk local_fixups and go to the right
place in the tree to process it.

> +                if not offsets:
> +                    node_sym_props[prop_name] =3D (raw, ())
> +                    continue
> +                masked =3D bytearray(raw)
> +                targets =3D []
> +                for off in offsets:
> +                    if off + 4 > len(raw):
> +                        raise ValueError(
> +                            f'{self.filename}: fixup offset {off} out of=
 range '
> +                            f'on {path}:{prop_name} (len {len(raw)})'
> +                        )
> +                    ph =3D struct.unpack_from('>I', raw, off)[0]
> +                    target_path =3D self.phandle_to_path.get(ph)
> +                    if target_path is None:
> +                        raise ValueError(
> +                            f'{self.filename}: unknown phandle {ph:#x} a=
t '
> +                            f'{path}:{prop_name}+{off}'
> +                        )
> +                    masked[off:off + 4] =3D b'\x00\x00\x00\x00'
> +                    targets.append((off, target_path))
> +                node_sym_props[prop_name] =3D (bytes(masked), tuple(targ=
ets))
> +            self.sym_props[path] =3D node_sym_props

I don't love the name 'sym_props' here, since this is recording fixups
in the property, not symbols.  Also why store the masked property
value here in a tuple, rather than updating self.node[path][prop_name]
with the masked value?

> +
> +
> +def select_best_candidate(candidates, byte_len_fn):
> +    """Choose the value that maximizes space savings across overlays.
> +
> +    Only candidates shared by at least two input DTBs (count > 1) are el=
igible
> +    for inclusion in the base DTB; if every candidate value is unique to=
 a
> +    single DTB, placing one in the base DTB would yield zero net size sa=
vings
> +    (adding one copy to the base DTB to save one overlay copy).

Beware a wrinkle here.  dtbos have no way of deleting a property from
the base tree.  So if *any* of the input trees is missing the
property, it cannot go into the base tree, even if it's present and
identical in all the others.

> +    Args:
> +        candidates: Iterable of candidate values (in input DTB order).
> +        byte_len_fn: Function returning the byte cost of a candidate val=
ue in
> +            an overlay.

AFAICT select_best_candidate() is always passed the same byte_len_fn,
so I'm not sure that it's a useful abstraction not to just it's
behaviour in here.


> +    Returns:
> +        The chosen candidate value, or None if no value appears more tha=
n once.
> +    """
> +    counts =3D Counter(candidates)
> +    best_val =3D None
> +    best_key =3D None
> +    for val, count in counts.items():
> +        if count <=3D 1:
> +            continue
> +        length =3D byte_len_fn(val)
> +        # Maximize total bytes saved across overlays:
> +        # (count - 1) * (length + 12)

Where is the + 12 coming from?

> +        key =3D ((count - 1) * (length + 12), count, length)
> +        if best_key is None or key > best_key:
> +            best_key =3D key
> +            best_val =3D val
> +    return best_val
> +
> +
> +def _validate_dtb_headers(dtbs):
> +    """Verify that FDT header fields and /memreserve/ entries match acro=
ss DTBs.
> +
> +    `boot_cpuid_phys` and `/memreserve/` require special handling becaus=
e:
> +    * Unlike regular DT nodes (including `/reserved-memory`), they are s=
tored
> +      in the FDT binary header and memory reservation block rather than =
the
> +      DT structure block.
> +    * `fdt_overlay_apply()` only merges the `.dtbo` structure block into=
 the
> +      base DTB and ignores the `.dtbo`'s header and `/memreserve/` block.
> +    * Therefore, every reconstructed board DTB inherits `boot_cpuid_phys=
` and
> +      `/memreserve/` directly from the base DTB, so all DTBs sharing a b=
ase
> +      DTB must have identical values.
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` objects to validate.
> +
> +    Raises:
> +        ValueError: If `boot_cpuid_phys` or `mem_rsv` differs between an=
y two
> +            input DTBs.
> +    """
> +    for d in dtbs[1:]:
> +        if d.boot_cpuid_phys !=3D dtbs[0].boot_cpuid_phys:
> +            raise ValueError(
> +                f'boot_cpuid_phys mismatch between {dtbs[0].filename} '
> +                f'({dtbs[0].boot_cpuid_phys}) and {d.filename} '
> +                f'({d.boot_cpuid_phys})'
> +            )
> +        if d.mem_rsv !=3D dtbs[0].mem_rsv:
> +            raise ValueError(
> +                f'/memreserve/ mismatch between {dtbs[0].filename} '
> +                f'({dtbs[0].mem_rsv}) and {d.filename} ({d.mem_rsv})'
> +            )
> +
> +
> +def _find_common_nodes_and_phandles(dtbs):
> +    """Identify common node paths and assign sequential base DTB phandle=
s.
> +
> +    Any common node that carries a phandle in any input DTB is assigned a
> +    phandle in the base DTB so overlays never attempt to add a `phandle`
> +    property to an already-existing base DTB node (which Linux and
> +    coreboot/depthcharge disallow).
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` objects.
> +
> +    Returns:
> +        Tuple of `(base_dtb_nodes, common_node_set, base_dtb_phandles)` =
where:
> +        * `base_dtb_nodes`: Ordered list of node paths common to all `dt=
bs`.

Does the order matter?  If not, I'd just say 'list'.

> +        * `common_node_set`: Set of node paths in `base_dtb_nodes`.


Isn't this the same information as base_dtb_nodes?

> +        * `base_dtb_phandles`: Dict mapping node path to assigned integer
> +          phandle in the base DTB.

And isn't this redundant with the above.  Could we instead return a
single dictionary: All common nodes get an entry, with 'None' as the
value if it doesn't need the phandle, or an actual value if it does
need a phandle.

> +    """
> +    common_node_set =3D set(dtbs[0].nodes.keys())
> +    for d in dtbs[1:]:
> +        common_node_set &=3D set(d.nodes.keys())
> +    base_dtb_nodes =3D [p for p in dtbs[0].nodes.keys() if p in common_n=
ode_set]
> +
> +    base_dtb_phandles =3D {}
> +    next_ph =3D 1
> +    for path in base_dtb_nodes:
> +        if any(d.phandles[path] is not None for d in dtbs):
> +            base_dtb_phandles[path] =3D next_ph
> +            next_ph +=3D 1
> +
> +    return base_dtb_nodes, common_node_set, base_dtb_phandles
> +
> +
> +def _find_common_symbols(dtbs, common_node_set, base_dtb_phandles):
> +    """Find symbols common to all input DTBs that point to the same base=
 node.
> +
> +    Only symbols that exist in all DTBs and resolve to the same common b=
ase
> +    DTB node path are placed in the base DTB's `/__symbols__`, ensuring
> +    overlays only add new symbols and never need to overwrite existing o=
nes
> +    (which coreboot/depthcharge merges with `upd=3D0`).
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` objects.
> +        common_node_set: Set of node paths present in all input DTBs.
> +        base_dtb_phandles: Dict mapping base DTB node paths to their ass=
igned
> +            integer phandles.
> +    Returns:
> +        Tuple of `(base_dtb_symbols, path_to_base_dtb_symbol)` where:
> +        * `base_dtb_symbols`: Dict mapping symbol label to target node p=
ath.
> +        * `path_to_base_dtb_symbol`: Dict mapping target node path to its
> +          primary symbol label in `base_dtb_symbols`.
> +    """
> +    base_dtb_symbols =3D {}
> +    path_to_base_dtb_symbol =3D {}
> +
> +    common_sym_names =3D set(dtbs[0].symbols.keys())
> +    for d in dtbs[1:]:
> +        common_sym_names &=3D set(d.symbols.keys())
> +    for label in dtbs[0].symbols.keys():
> +        if label not in common_sym_names:
> +            continue

for label in common_sym_names:

would suffice and be clearer, no?

> +        target_paths =3D {d.symbols[label] for d in dtbs}
> +        if len(target_paths) =3D=3D 1:

To avoid excessive indentation, I'd prefer if len(target_paths) !=3D 1: con=
tinue

> +            chosen_path =3D dtbs[0].symbols[label]
> +            if chosen_path in common_node_set:

Ditto.

> +                base_dtb_symbols[label] =3D chosen_path
> +                if (chosen_path in base_dtb_phandles and
> +                        chosen_path not in path_to_base_dtb_symbol):
> +                    path_to_base_dtb_symbol[chosen_path] =3D label
> +
> +    return base_dtb_symbols, path_to_base_dtb_symbol
> +
> +
> +def _select_base_dtb_properties(dtbs, base_dtb_nodes, base_dtb_phandles,
> +                                preserve_local_fixups):
> +    """Select the common property values to place on each node in the ba=
se DTB.
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` objects with `sym_props` populated.
> +        base_dtb_nodes: Ordered list of node paths in the base DTB.
> +        base_dtb_phandles: Dict mapping base DTB node paths to their ass=
igned
> +            integer phandles.
> +        preserve_local_fixups: Whether `/__local_fixups__` from the inpu=
t DTBs
> +            must be preserved in the merged output.
> +
> +    Returns:
> +        Tuple of `(base_dtb_props, base_dtb_fixup_offsets)` where:
> +        * `base_dtb_props`: Dict mapping `path -> {prop_name: sym_val}` =
for
> +          properties placed in the base DTB.
> +        * `base_dtb_fixup_offsets`: Dict mapping `(path, prop_name)` to =
a tuple
> +          of byte offsets for the base DTB's `/__local_fixups__`.
> +    """
> +    base_dtb_props =3D {}
> +    base_dtb_fixup_offsets =3D {}
> +
> +    for path in base_dtb_nodes:
> +        common_prop_names =3D set(dtbs[0].nodes[path].keys())
> +        for d in dtbs[1:]:
> +            common_prop_names &=3D set(d.nodes[path].keys())
> +
> +        node_base_props =3D {}
> +        for prop_name in dtbs[0].nodes[path].keys():
> +            if prop_name not in common_prop_names:
> +                continue

Again for prop_name in common_prop_names: should do the job, no?

> +
> +            all_have_prop_fixups =3D all(
> +                bool(d.sym_props[path][prop_name][1]) for d in dtbs
> +            )

I'm not sure why you care that all the copies of the property have
fixups.  AFAICT all you care about is that the set of fixups is
identical for all of them, empty or not.

> +            eligible =3D []
> +            for d in dtbs:
> +                sym_val =3D d.sym_props[path][prop_name]
> +                _, targets =3D sym_val

These two lines could be one with no loss of clarity.

> +                if targets:
> +                    # Overlays cannot delete a property from /__local_fi=
xups__,
> +                    # so a phandle-bearing value can only go into base.d=
tb when
> +                    # every board also has phandle fixups on this proper=
ty.

True, but more generally 1) you can't make *any* property common if it
doesn't exist in all the inputs and 2) the fixups must be identical
for all inputs, empty or otherwise.

> +                    if preserve_local_fixups and not all_have_prop_fixup=
s:
> +                        continue
> +                    if not all(
> +                        t_path in base_dtb_phandles for _, t_path in tar=
gets
> +                    ):
> +                        continue
> +                eligible.append(sym_val)
> +
> +            fixup_entry_cost =3D len(path) + len(prop_name) + 28

These needs an explanation of how you arrived at that formula.

> +            chosen_val =3D select_best_candidate(
> +                eligible,
> +                lambda sv, fc=3Dfixup_entry_cost: (
> +                    len(sv[0]) + len(sv[1]) * fc
> +                ),
> +            )
> +            if chosen_val is not None:
> +                node_base_props[prop_name] =3D chosen_val
> +                if preserve_local_fixups and chosen_val[1]:
> +                    offs =3D tuple(off for off, _ in chosen_val[1])
> +                    base_dtb_fixup_offsets[(path, prop_name)] =3D offs
> +
> +        base_dtb_props[path] =3D node_base_props
> +
> +    return base_dtb_props, base_dtb_fixup_offsets
> +
> +
> +def _build_base_dtb(dtbs, base_dtb_nodes, base_dtb_props, base_dtb_phand=
les,
> +                    base_dtb_symbols, base_dtb_fixup_offsets):
> +    """Construct and serialize the common base DTB blob.
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` objects.
> +        base_dtb_nodes: Ordered list of node paths in the base DTB.
> +        base_dtb_props: Dict mapping `path -> {prop_name: sym_val}`.
> +        base_dtb_phandles: Dict mapping base DTB node paths to their ass=
igned
> +            integer phandles.
> +        base_dtb_symbols: Dict mapping symbol label to target node path =
for the
> +            base DTB's `/__symbols__`.
> +        base_dtb_fixup_offsets: Dict mapping `(path, prop_name)` to phan=
dle
> +            byte offsets for the base DTB's `/__local_fixups__`.
> +
> +    Returns:
> +        Serialized base DTB blob as `bytes`.
> +    """
> +    base_dtb_root =3D NodeTree()

Using the NodeTree() representation only as an interim step to
flattening seems odd to me.  Either use NodeTree (or something like
it) throughout, or go directly from the internal cluster-of-maps
representation into a flattened tree.

> +    for path in base_dtb_nodes:
> +        node =3D base_dtb_root.get_node(path)
> +        for prop_name, (masked_bytes, targets) in base_dtb_props[path].i=
tems():
> +            if not targets:
> +                node.props[prop_name] =3D masked_bytes
> +            else:
> +                val =3D bytearray(masked_bytes)
> +                for off, t_path in targets:
> +                    struct.pack_into('>I', val, off, base_dtb_phandles[t=
_path])
> +                node.props[prop_name] =3D bytes(val)
> +
> +        if path in base_dtb_phandles:
> +            ph_bytes =3D struct.pack('>I', base_dtb_phandles[path])
> +            if any(d.has_phandle_prop[path] for d in dtbs):
> +                node.props['phandle'] =3D ph_bytes
> +            if any(d.has_linux_phandle_prop[path] for d in dtbs):
> +                node.props['linux,phandle'] =3D ph_bytes

I'd suggest always just using 'phandle' since that's the modern form.

> +
> +    if base_dtb_symbols:
> +        sym_node =3D base_dtb_root.get_node('/__symbols__')
> +        for label, target_path in base_dtb_symbols.items():
> +            sym_node.props[label] =3D target_path.encode('utf-8') + b'\x=
00'

Paths are not UTF-8, they're bytestrings to begin with.

> +    if base_dtb_fixup_offsets:
> +        lf_root =3D base_dtb_root.get_node('/__local_fixups__')
> +        for (path, prop_name), offs in base_dtb_fixup_offsets.items():
> +            lf_node =3D lf_root.get_node(path)
> +            lf_node.props[prop_name] =3D struct.pack(f'>{len(offs)}I', *=
offs)
> +
> +    return base_dtb_root.to_fdt_blob(
> +        mem_rsv=3Ddtbs[0].mem_rsv,
> +        boot_cpuid_phys=3Ddtbs[0].boot_cpuid_phys,
> +        size_hint=3Dmax(len(dtbs[0].raw_bytes), 4096),
> +    )
> +
> +
> +def _assign_local_phandles(dtb, base_dtb_phandles):
> +    """Assign sequential overlay-local phandles to board-specific nodes.
> +
> +    Args:
> +        dtb: The board's `ParsedDtb`.
> +        base_dtb_phandles: Dict mapping base DTB node paths to their pha=
ndles.
> +
> +    Returns:
> +        Dict mapping board-specific node path to its overlay-local integ=
er
> +        phandle (`1, 2, ...`).
> +    """
> +    local_phandles =3D {}
> +    next_local_ph =3D 1
> +    for path in dtb.nodes.keys():
> +        if dtb.phandles[path] is not None and path not in base_dtb_phand=
les:
> +            local_phandles[path] =3D next_local_ph
> +            next_local_ph +=3D 1
> +    return local_phandles
> +
> +
> +def _encode_dtbo_property(path, prop_name, sym_val, base_dtb_phandles,
> +                          path_to_base_dtb_symbol, local_phandles, ext_f=
ixups,
> +                          ov_local_fixups):
> +    """Encode a property value for `/fragment@0/__overlay__` and record =
fixups.
> +
> +    Args:
> +        path: Target node path in the device tree (e.g. '/soc/i2c@4000').
> +        prop_name: Property name.
> +        sym_val: Normalized `(masked_bytes, targets)` tuple for the prop=
erty.
> +        base_dtb_phandles: Dict mapping base DTB node paths to their pha=
ndles.
> +        path_to_base_dtb_symbol: Dict mapping base DTB node paths to sym=
bol
> +            names in the base DTB's `/__symbols__`.
> +        local_phandles: Dict mapping board-only node paths to overlay-lo=
cal
> +            phandles.
> +        ext_fixups: Dict of `label -> [fixup_str, ...]` updated in-place=
 for
> +            references to base DTB symbols.
> +        ov_local_fixups: Dict of `(path, prop_name) -> [offset, ...]` up=
dated
> +            in-place for references to overlay-local phandles.
> +
> +    Returns:
> +        Encoded property value as `bytes`.
> +    """
> +    masked_bytes, targets =3D sym_val
> +    if not targets:
> +        return masked_bytes
> +
> +    val =3D bytearray(masked_bytes)
> +    for off, t_path in targets:
> +        if t_path in base_dtb_phandles:
> +            sym_label =3D path_to_base_dtb_symbol.get(t_path)
> +            if sym_label is not None:
> +                struct.pack_into('>I', val, off, 0xffffffff)
> +                ov_path =3D (
> +                    '/fragment@0/__overlay__'
> +                    if path =3D=3D '/'
> +                    else f'/fragment@0/__overlay__{path}'
> +                )

Putting everything in /fragment@0 is kind of nasty.  It would be
preferable to search for useful places to put fragments across the
input dtbs.  But, I'm fine if that is a later improvement, rather than
the original version.

> +                entry =3D f'{ov_path}:{prop_name}:{off}'
> +                ext_fixups.setdefault(sym_label, []).append(entry)
> +            else:
> +                # Target is a common base DTB node without a symbol shar=
ed by
> +                # all input DTBs (e.g. an anonymous &{/path} reference o=
r a
> +                # board-specific label); use its assigned base DTB phand=
le.
> +                struct.pack_into('>I', val, off, base_dtb_phandles[t_pat=
h])

This creates what's arguably an invalid overlay - it assumes the value
of a phandle in the base tree.  I'd prefer to see this case rejected
outright.

> +        else:
> +            struct.pack_into('>I', val, off, local_phandles[t_path])
> +            ov_local_fixups.setdefault((path, prop_name), []).append(off)
> +    return bytes(val)
> +
> +
> +def _populate_dtbo_overlay_nodes(ov_root, dtb, common_node_set, base_dtb=
_props,
> +                                 base_dtb_phandles, path_to_base_dtb_sym=
bol,
> +                                 local_phandles):
> +    """Populate `/fragment@0/__overlay__` with board-specific nodes and =
props.
> +
> +    Args:
> +        ov_root: The `NodeTree` for `/fragment@0/__overlay__`.
> +        dtb: The board's `ParsedDtb`.
> +        common_node_set: Set of node paths present in the base DTB.
> +        base_dtb_props: Dict mapping `path -> {prop_name: sym_val}` in t=
he
> +            base DTB.
> +        base_dtb_phandles: Dict mapping base DTB node paths to their pha=
ndles.
> +        path_to_base_dtb_symbol: Dict mapping base DTB node paths to sym=
bol
> +            names in the base DTB's `/__symbols__`.
> +        local_phandles: Dict mapping board-only node paths to overlay-lo=
cal
> +            phandles.
> +
> +    Returns:
> +        Tuple of `(ext_fixups, ov_local_fixups)` collected across all ov=
erlay
> +        properties.
> +    """
> +    ext_fixups =3D {}
> +    ov_local_fixups =3D {}
> +
> +    for path, props in dtb.nodes.items():
> +        in_base_dtb =3D path in common_node_set
> +        base_node_props =3D base_dtb_props.get(path, {})
> +
> +        diff_props =3D [
> +            (prop_name, dtb.sym_props[path][prop_name])
> +            for prop_name in props.keys()
> +            if (not in_base_dtb or
> +                base_node_props.get(prop_name) !=3D
> +                dtb.sym_props[path][prop_name])
> +        ]
> +
> +        if not in_base_dtb or diff_props:

diff_props is necessarily empty if not in_base_dtb, so the first term
is redundant.

> +            ov_node =3D ov_root.get_node(path)
> +            for prop_name, sym_val in diff_props:
> +                ov_node.props[prop_name] =3D _encode_dtbo_property(
> +                    path, prop_name, sym_val, base_dtb_phandles,
> +                    path_to_base_dtb_symbol, local_phandles, ext_fixups,
> +                    ov_local_fixups,
> +                )
> +
> +            if path in local_phandles:
> +                ph_bytes =3D struct.pack('>I', local_phandles[path])
> +                if dtb.has_phandle_prop[path]:
> +                    ov_node.props['phandle'] =3D ph_bytes
> +                if dtb.has_linux_phandle_prop[path]:
> +                    ov_node.props['linux,phandle'] =3D ph_bytes

Again, I'd suggest just standardising on the modern 'phandle'.

> +    return ext_fixups, ov_local_fixups
> +
> +
> +def _populate_dtbo_metadata(dtbo_root, ov_root, dtb, base_dtb_symbols,
> +                            base_dtb_fixup_offsets, ext_fixups,
> +                            ov_local_fixups, preserve_local_fixups):
> +    """Populate `/__symbols__`, `/__fixups__`, and `/__local_fixups__` o=
n DTBO.
> +
> +    Args:
> +        dtbo_root: Root `NodeTree` of the `.dtbo` overlay.
> +        ov_root: The `NodeTree` for `/fragment@0/__overlay__`.
> +        dtb: The board's `ParsedDtb`.
> +        base_dtb_symbols: Dict of symbols already present in the base DT=
B.
> +        base_dtb_fixup_offsets: Dict of `/__local_fixups__` offsets alre=
ady
> +            present in the base DTB.
> +        ext_fixups: Dict of `label -> [fixup_str, ...]` referencing base=
 DTB
> +            symbols.
> +        ov_local_fixups: Dict of `(path, prop_name) -> [offset, ...]`
> +            referencing overlay-local phandles.
> +        preserve_local_fixups: Whether to emit differing input
> +            `/__local_fixups__` entries into
> +            `/fragment@0/__overlay__/__local_fixups__`.

That's not right.  The overlay should only have a global
/__local_fixups__, there shouldn't be __local_fixups__ for individual
fragments.

> +    """
> +    # If preserving input /__local_fixups__ in the merged tree, place any
> +    # differing fixup offset lists under
> +    # /fragment@0/__overlay__/__local_fixups__
> +    if preserve_local_fixups:
> +        for (path, prop_name), offs in dtb.local_fixups.items():
> +            if base_dtb_fixup_offsets.get((path, prop_name)) !=3D offs:
> +                merged_lf_root =3D ov_root.get_node('/__local_fixups__')
> +                merged_lf_node =3D merged_lf_root.get_node(path)
> +                merged_lf_node.props[prop_name] =3D struct.pack(
> +                    f'>{len(offs)}I', *offs
> +                )
> +
> +    # Emit overlay root /__symbols__ for new or modified symbols
> +    diff_syms =3D [
> +        (label, t_path)
> +        for label, t_path in dtb.symbols.items()
> +        if base_dtb_symbols.get(label) !=3D t_path
> +    ]
> +    if diff_syms:
> +        sym_node =3D dtbo_root.get_node('/__symbols__')
> +        for label, t_path in diff_syms:
> +            # Ensure target node exists in __overlay__ so dtc -I dtb -O =
dts
> +            # on the standalone .dtbo does not warn about a missing node.
> +            ov_root.get_node(t_path)
> +            ov_target =3D (
> +                '/fragment@0/__overlay__'
> +                if t_path =3D=3D '/'
> +                else f'/fragment@0/__overlay__{t_path}'

These path =3D=3D '/' special cases appear in a bunch of places.  I think
you could avoid them all with some tweaks to your conventions about
paths (e.g. always keep them as relative paths to the root, allowing
'').

> +            )
> +            sym_node.props[label] =3D ov_target.encode('utf-8') + b'\x00'

Neither property names nor property values were every Unicode.

> +    # Emit overlay root /__fixups__ for references to base DTB symbols
> +    if ext_fixups:
> +        fixups_node =3D dtbo_root.get_node('/__fixups__')
> +        for label, entries in ext_fixups.items():
> +            fixups_node.props[label] =3D (
> +                '\x00'.join(entries).encode('utf-8') + b'\x00'
> +            )
> +
> +    # Emit overlay root /__local_fixups__ for overlay-local phandles
> +    if ov_local_fixups:
> +        ov_lf_root =3D dtbo_root.get_node(
> +            '/__local_fixups__/fragment@0/__overlay__'
> +        )
> +        for (path, prop_name), offs in ov_local_fixups.items():
> +            lf_node =3D ov_lf_root.get_node(path)
> +            lf_node.props[prop_name] =3D struct.pack(f'>{len(offs)}I', *=
offs)
> +
> +
> +def _build_board_dtbo(dtb, common_node_set, base_dtb_props, base_dtb_pha=
ndles,
> +                      base_dtb_symbols, path_to_base_dtb_symbol,
> +                      base_dtb_fixup_offsets, preserve_local_fixups):
> +    """Construct and serialize the `.dtbo` overlay blob for a single boa=
rd.
> +
> +    Args:
> +        dtb: The board's `ParsedDtb`.
> +        common_node_set: Set of node paths present in the base DTB.
> +        base_dtb_props: Dict mapping `path -> {prop_name: sym_val}` in t=
he
> +            base DTB.
> +        base_dtb_phandles: Dict mapping base DTB node paths to their pha=
ndles.
> +        base_dtb_symbols: Dict of symbols present in the base DTB.
> +        path_to_base_dtb_symbol: Dict mapping base DTB node paths to sym=
bol
> +            names in the base DTB's `/__symbols__`.
> +        base_dtb_fixup_offsets: Dict of `/__local_fixups__` offsets pres=
ent in
> +            the base DTB.
> +        preserve_local_fixups: Whether to preserve `/__local_fixups__` i=
n the
> +            merged output.
> +
> +    Returns:
> +        Serialized `.dtbo` overlay blob as `bytes`.
> +    """
> +    dtbo_root =3D NodeTree()
> +    frag_node =3D dtbo_root.get_node('/fragment@0')
> +    frag_node.props['target-path'] =3D b'/\x00'
> +    ov_root =3D frag_node.get_node('__overlay__')
> +
> +    local_phandles =3D _assign_local_phandles(dtb, base_dtb_phandles)
> +    ext_fixups, ov_local_fixups =3D _populate_dtbo_overlay_nodes(
> +        ov_root, dtb, common_node_set, base_dtb_props, base_dtb_phandles,
> +        path_to_base_dtb_symbol, local_phandles,
> +    )
> +    _populate_dtbo_metadata(
> +        dtbo_root, ov_root, dtb, base_dtb_symbols, base_dtb_fixup_offset=
s,
> +        ext_fixups, ov_local_fixups, preserve_local_fixups,
> +    )
> +
> +    return dtbo_root.to_fdt_blob(size_hint=3D16384)
> +
> +
> +def create_base_dtb_and_overlays(dtbs, strip_local_fixups=3DFalse):
> +    """Compute the base DTB and per-board DTBO blobs from parsed DTBs.
> +
> +    Args:
> +        dtbs: List of `ParsedDtb` objects (all compiled with `-@ -L`).
> +        strip_local_fixups: If True, omit `/__local_fixups__` from the b=
ase DTB
> +            and from the merged result.
> +
> +    Returns:
> +        Tuple of `(base_dtb_blob, dtbo_blobs)` where `base_dtb_blob` is =
`bytes`
> +        and `dtbo_blobs` is a list of `bytes` corresponding to `dtbs`.
> +    """
> +    missing_meta =3D [
> +        d.filename for d in dtbs if not (d.has_symbols and d.has_local_f=
ixups)
> +    ]
> +    if missing_meta:
> +        raise ValueError(
> +            f'input DTB(s) lack /__symbols__ or /__local_fixups__: '
> +            f'{", ".join(missing_meta)} (compile input DTBs with dtc -@ =
-L)'
> +        )
> +
> +    _validate_dtb_headers(dtbs)
> +
> +    for d in dtbs:
> +        d.build_symbolic_props()
> +
> +    base_dtb_nodes, common_node_set, base_dtb_phandles =3D (
> +        _find_common_nodes_and_phandles(dtbs)
> +    )
> +    base_dtb_symbols, path_to_base_dtb_symbol =3D _find_common_symbols(
> +        dtbs, common_node_set, base_dtb_phandles
> +    )
> +    preserve_local_fixups =3D not strip_local_fixups
> +    base_dtb_props, base_dtb_fixup_offsets =3D _select_base_dtb_properti=
es(
> +        dtbs, base_dtb_nodes, base_dtb_phandles, preserve_local_fixups
> +    )
> +
> +    base_dtb_blob =3D _build_base_dtb(
> +        dtbs, base_dtb_nodes, base_dtb_props, base_dtb_phandles,
> +        base_dtb_symbols, base_dtb_fixup_offsets,
> +    )
> +    dtbo_blobs =3D [
> +        _build_board_dtbo(
> +            d, common_node_set, base_dtb_props, base_dtb_phandles,
> +            base_dtb_symbols, path_to_base_dtb_symbol, base_dtb_fixup_of=
fsets,
> +            preserve_local_fixups,
> +        )
> +        for d in dtbs
> +    ]
> +    return base_dtb_blob, dtbo_blobs
> +
> +
> +def verify_recreated_dtb(orig_dtb, base_dtb_blob, dtbo_blob,
> +                         strip_local_fixups):
> +    """Apply `dtbo_blob` to `base_dtb_blob` and verify it matches `orig_=
dtb`.
> +
> +    Args:
> +        orig_dtb: The original `ParsedDtb` instance for the board.
> +        base_dtb_blob: Uncompressed base DTB binary as `bytes`.
> +        dtbo_blob: Uncompressed board `.dtbo` overlay binary as `bytes`.
> +        strip_local_fixups: Whether `/__local_fixups__` was stripped.
> +
> +    Raises:
> +        RuntimeError: If `fdt_overlay_apply()` fails or any node, proper=
ty,
> +            phandle, symbol, or header field in the merged DTB differs f=
rom
> +            `orig_dtb`.
> +    """
> +    merged_fdt =3D libfdt.Fdt(base_dtb_blob)
> +    merged_fdt.resize(len(base_dtb_blob) + len(dtbo_blob) * 2 + 65536)
> +    fdto =3D bytearray(dtbo_blob)
> +    err =3D libfdt.fdt_overlay_apply(merged_fdt._fdt, fdto)

We should probably make a method wrapper for that in libfdt.Fdt.

> +    if err !=3D 0:
> +        raise RuntimeError(
> +            f'{orig_dtb.filename}: fdt_overlay_apply failed with error {=
err} '
> +            f'({libfdt.strerror(err)})'
> +        )
> +    merged_fdt.pack()
> +    recreated =3D ParsedDtb(
> +        f'{orig_dtb.filename} (recreated)', bytes(merged_fdt.as_bytearra=
y())
> +    )
> +    if strip_local_fixups:
> +        if recreated.has_local_fixups:
> +            raise RuntimeError(
> +                f'{orig_dtb.filename}: /__local_fixups__ present despite=
 '
> +                f'--strip-local-fixups'
> +            )
> +        recreated.local_fixups =3D orig_dtb.local_fixups
> +    else:
> +        if orig_dtb.local_fixups !=3D recreated.local_fixups:
> +            raise RuntimeError(
> +                f'{orig_dtb.filename}: /__local_fixups__ mismatch'
> +            )
> +
> +    recreated.build_symbolic_props()
> +
> +    if set(orig_dtb.nodes.keys()) !=3D set(recreated.nodes.keys()):
> +        missing =3D set(orig_dtb.nodes.keys()) - set(recreated.nodes.key=
s())
> +        extra =3D set(recreated.nodes.keys()) - set(orig_dtb.nodes.keys(=
))
> +        raise RuntimeError(
> +            f'{orig_dtb.filename}: node mismatch (missing=3D{missing}, '
> +            f'extra=3D{extra})'
> +        )
> +
> +    for path in orig_dtb.nodes.keys():
> +        if orig_dtb.sym_props[path] !=3D recreated.sym_props[path]:
> +            for p in (set(orig_dtb.sym_props[path]) |
> +                      set(recreated.sym_props[path])):
> +                if (orig_dtb.sym_props[path].get(p) !=3D
> +                        recreated.sym_props[path].get(p)):
> +                    raise RuntimeError(
> +                        f'{orig_dtb.filename}: property mismatch at {pat=
h}:{p}'
> +                    )
> +        # Common base nodes may gain a phandle if another board referenc=
ed them.
> +        if (orig_dtb.has_phandle_prop[path] and
> +                not recreated.has_phandle_prop[path]):
> +            raise RuntimeError(
> +                f'{orig_dtb.filename}: missing phandle at {path}'
> +            )
> +        if (orig_dtb.has_linux_phandle_prop[path] and
> +                not recreated.has_linux_phandle_prop[path]):
> +            raise RuntimeError(
> +                f'{orig_dtb.filename}: missing linux,phandle at {path}'
> +            )
> +
> +    if orig_dtb.symbols !=3D recreated.symbols:
> +        raise RuntimeError(f'{orig_dtb.filename}: /__symbols__ mismatch')
> +    if orig_dtb.boot_cpuid_phys !=3D recreated.boot_cpuid_phys:
> +        raise RuntimeError(
> +            f'{orig_dtb.filename}: boot_cpuid_phys mismatch '
> +            f'({orig_dtb.boot_cpuid_phys} !=3D {recreated.boot_cpuid_phy=
s})'
> +        )
> +    if orig_dtb.mem_rsv !=3D recreated.mem_rsv:
> +        raise RuntimeError(
> +            f'{orig_dtb.filename}: /memreserve/ mismatch '
> +            f'({orig_dtb.mem_rsv} !=3D {recreated.mem_rsv})'
> +        )

Open coding the tree comparison when we already have
dtbs_equal_unordered is not ideal.

> +
> +
> +def get_dtbo_output_path(dtb_path, outdir):
> +    """Determine the output `.dtbo` file path for an input `.dtb` path.
> +
> +    Args:
> +        dtb_path: Path to the input `.dtb` file.
> +        outdir: Output directory if `--outdir` was specified, else None.
> +
> +    Returns:
> +        Output `.dtbo` file path string.
> +    """
> +    dtb_dir, stem =3D split_dtb_filename(dtb_path)
> +    dtbo_name =3D f'{stem}.dtbo'
> +    target_dir =3D outdir if outdir is not None else dtb_dir
> +    return os.path.join(target_dir, dtbo_name)
> +
> +
> +def parse_args():
> +    """Parse command-line arguments.
> +
> +    Returns:
> +        Parsed `argparse.Namespace` object.
> +    """
> +    parser =3D argparse.ArgumentParser(
> +        description=3D(
> +            'Split a set of compiled device tree blobs (.dtb) into a sin=
gle '
> +            'common base .dtb and per-board overlay blobs (.dtbo).'
> +        )
> +    )
> +    parser.add_argument(
> +        '-b', '--base-dtb',
> +        required=3DTrue,
> +        metavar=3D'BASE_DTB',
> +        help=3D(
> +            'Output common base .dtb file path (placed in --outdir if '
> +            'specified without a directory component)'
> +        ),
> +    )
> +    parser.add_argument(
> +        '-o', '--outdir',
> +        default=3DNone,
> +        metavar=3D'DIR',
> +        help=3D(
> +            'Output directory for generated .dtbo files and bare --base-=
dtb '
> +            'filenames (default: alongside each input .dtb)'
> +        ),
> +    )
> +    parser.add_argument(
> +        '-S', '--strip-local-fixups',
> +        action=3D'store_true',
> +        help=3D(
> +            'Omit /__local_fixups__ from the generated base .dtb and '
> +            'reconstructed device trees'
> +        ),
> +    )
> +    parser.add_argument(
> +        '--verify',
> +        action=3D'store_true',
> +        help=3D(
> +            'Verify that applying each generated .dtbo to the base .dtb '
> +            'recreates the original .dtb'
> +        ),
> +    )
> +    parser.add_argument(
> +        '-v', '--verbose',
> +        action=3D'store_true',
> +        help=3D'Print size statistics summary',
> +    )
> +    parser.add_argument(
> +        'dtbs',
> +        nargs=3D'+',
> +        metavar=3D'DTB',
> +        help=3D'Input .dtb files (at least two required)',
> +    )
> +    args =3D parser.parse_args()
> +    if len(args.dtbs) < 2:
> +        parser.error('at least two input .dtb files are required')
> +    return args
> +
> +
> +def factor_dtb_files(args):
> +    """Factor a list of standalone .dtb files into a base .dtb and .dtbo=
 files.
> +
> +    Args:
> +        args: Parsed `argparse.Namespace` object.
> +    """
> +    input_dtb_paths =3D args.dtbs
> +
> +    dtbs =3D [ParsedDtb.from_file(p) for p in input_dtb_paths]
> +
> +    base_dtb_path =3D (
> +        os.path.join(args.outdir, args.base_dtb)
> +        if args.outdir is not None and not os.path.dirname(args.base_dtb)
> +        else args.base_dtb
> +    )
> +
> +    input_abs_paths =3D {os.path.abspath(p) for p in input_dtb_paths}
> +    base_abs_path =3D os.path.abspath(base_dtb_path)
> +    if base_abs_path in input_abs_paths:
> +        raise ValueError(
> +            f'base DTB output path {base_dtb_path!r} collides with '
> +            f'an input DTB file'
> +        )
> +
> +    dtbo_paths =3D []
> +    seen_paths =3D {base_abs_path}
> +    for dtb_path in input_dtb_paths:
> +        out_path =3D get_dtbo_output_path(dtb_path, args.outdir)
> +        abs_out =3D os.path.abspath(out_path)
> +        if abs_out in input_abs_paths:
> +            raise ValueError(
> +                f'output path {out_path!r} collides with an input DTB fi=
le'
> +            )
> +        if abs_out in seen_paths:
> +            raise ValueError(
> +                f'output path collision on {out_path!r}; ensure input '
> +                f'files have distinct names'
> +            )
> +        seen_paths.add(abs_out)
> +        dtbo_paths.append(out_path)
> +
> +    base_dtb_blob, dtbo_blobs =3D create_base_dtb_and_overlays(
> +        dtbs,
> +        strip_local_fixups=3Dargs.strip_local_fixups,
> +    )
> +
> +    if args.verify:
> +        for d, dtbo_blob in zip(dtbs, dtbo_blobs):
> +            verify_recreated_dtb(
> +                d, base_dtb_blob, dtbo_blob, args.strip_local_fixups
> +            )
> +
> +    base_dtb_dir =3D os.path.dirname(base_dtb_path)
> +    if base_dtb_dir:
> +        os.makedirs(base_dtb_dir, exist_ok=3DTrue)
> +    with open(base_dtb_path, 'wb') as f:
> +        f.write(base_dtb_blob)
> +
> +    if args.outdir:
> +        os.makedirs(args.outdir, exist_ok=3DTrue)
> +    for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
> +        out_dir =3D os.path.dirname(out_path)
> +        if out_dir:
> +            os.makedirs(out_dir, exist_ok=3DTrue)
> +        with open(out_path, 'wb') as f:
> +            f.write(dtbo_blob)
> +
> +    if args.verbose:
> +        orig_uncomp =3D sum(len(d.raw_bytes) for d in dtbs)
> +        base_dtb_uncomp =3D len(base_dtb_blob)
> +        dtbo_uncomp =3D sum(len(b) for b in dtbo_blobs)
> +        new_uncomp =3D base_dtb_uncomp + dtbo_uncomp
> +        saved_uncomp =3D orig_uncomp - new_uncomp
> +        pct_uncomp =3D (
> +            (saved_uncomp / orig_uncomp * 100.0) if orig_uncomp else 0.0
> +        )
> +
> +        print(
> +            f'Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} byte=
s) -> '
> +            f'base {base_dtb_uncomp:,} B + {len(dtbo_blobs)} overlays '
> +            f'{dtbo_uncomp:,} B =3D {new_uncomp:,} bytes '
> +            f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
> +        )
> +
> +
> +def main():
> +    """Run the fdtfactor command-line tool.
> +
> +    Returns:
> +        Process exit code (0 on success).
> +    """
> +    args =3D parse_args()
> +    try:
> +        factor_dtb_files(args)
> +    except (OSError, ValueError, RuntimeError, libfdt.FdtException) as e=
xc:
> +        sys.exit(f'Error: {exc}')
> +    return 0
> +
> +
> +if __name__ =3D=3D '__main__':
> +    sys.exit(main())
> diff --git a/meson.build b/meson.build
> index 520cd35f9075..73b4687a2852 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -114,6 +114,7 @@ if get_option('tools') and not wheel_only
> =20
>    install_data(
>      'dtdiff',
> +    'fdtfactor',
>      install_dir: get_option('bindir'),
>      install_mode: 'rwxr-xr-x',
>    )
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index af5d309cf8a9..9f8a2896d597 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -53,7 +53,7 @@ TESTS_DEPFILES =3D $(TESTS:%=3D%.d) \
>  	$(addprefix $(TESTS_PREFIX),testutils.d)
> =20
>  TESTS_CLEANFILES_L =3D $(STD_CLEANFILES) \
> -	*.dtb *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
> +	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
>  	treegen
>  TESTS_CLEANFILES =3D $(TESTS) $(TESTS_CLEANFILES_L:%=3D$(TESTS_PREFIX)%)
>  TESTS_CLEANDIRS_L =3D fs
> diff --git a/tests/fdtfactor_board1.dts b/tests/fdtfactor_board1.dts
> new file mode 100644
> index 000000000000..cab6b3a4a3cd
> --- /dev/null
> +++ b/tests/fdtfactor_board1.dts
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;

fdt testcases generally try to be minimal.  So, I'd suggest using a
contrived tree along the lines of test_tree1.dts, rather than a
realistic board tree like this one.  It does need an example of all
the cases that should be fixed up, of course.


> +
> +/ {
> +	model =3D "Test Board 1";
> +	compatible =3D "vendor,board1", "vendor,common";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	intc: interrupt-controller@1000 {
> +		compatible =3D "vendor,intc";
> +		reg =3D <0x1000 0x100>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +	};
> +
> +	clk: clock-controller@2000 {
> +		compatible =3D "vendor,clk";
> +		reg =3D <0x2000 0x100>;
> +		#clock-cells =3D <1>;
> +	};
> +
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +		interrupt-parent =3D <&intc>;
> +
> +		uart0: serial@3000 {
> +			compatible =3D "vendor,uart";
> +			reg =3D <0x3000 0x100>;
> +			interrupts =3D <1 0>;
> +			clocks =3D <&clk 1>;
> +			status =3D "okay";
> +		};
> +
> +		i2c0: i2c@4000 {
> +			compatible =3D "vendor,i2c";
> +			reg =3D <0x4000 0x100>;
> +			interrupts =3D <2 0>;
> +			clocks =3D <&clk 2>;
> +			status =3D "okay";
> +
> +			pmic: pmic@40 {
> +				compatible =3D "vendor,pmic";
> +				reg =3D <0x40>;
> +
> +				reg_vdd: vdd {
> +					regulator-min-microvolt =3D <1800000>;
> +					regulator-max-microvolt =3D <1800000>;
> +				};
> +			};
> +		};
> +
> +		spi0: spi@5000 {
> +			compatible =3D "vendor,spi";
> +			reg =3D <0x5000 0x100>;
> +			clocks =3D <&clk 3>;
> +			vdd-supply =3D <&reg_vdd>;
> +			cs-supply =3D <&board1_reg>;
> +		};
> +	};
> +
> +	board1_reg: regulator-board1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "board1-cs";
> +	};
> +};
> diff --git a/tests/fdtfactor_board2.dts b/tests/fdtfactor_board2.dts
> new file mode 100644
> index 000000000000..8d3322e5ce74
> --- /dev/null
> +++ b/tests/fdtfactor_board2.dts
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/ {
> +	model =3D "Test Board 2";
> +	compatible =3D "vendor,board2", "vendor,common";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	/*
> +	 * Extra phandle-bearing node before intc/clk shifts all subsequent
> +	 * phandle numbers in board2.dtb relative to board1.dtb.
> +	 */
> +	board2_early_reg: regulator-early {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "board2-early";
> +	};
> +
> +	intc: interrupt-controller@1000 {
> +		compatible =3D "vendor,intc";
> +		reg =3D <0x1000 0x100>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +	};
> +
> +	clk: clock-controller@2000 {
> +		compatible =3D "vendor,clk";
> +		reg =3D <0x2000 0x100>;
> +		#clock-cells =3D <1>;
> +	};
> +
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +		interrupt-parent =3D <&intc>;
> +
> +		uart0: serial@3000 {
> +			compatible =3D "vendor,uart";
> +			reg =3D <0x3000 0x100>;
> +			interrupts =3D <1 0>;
> +			clocks =3D <&clk 1>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c0: i2c@4000 {
> +			compatible =3D "vendor,i2c";
> +			reg =3D <0x4000 0x100>;
> +			interrupts =3D <2 0>;
> +			clocks =3D <&clk 2>;
> +			status =3D "okay";
> +
> +			pmic: pmic@40 {
> +				compatible =3D "vendor,pmic";
> +				reg =3D <0x40>;
> +
> +				reg_vdd: vdd {
> +					regulator-min-microvolt =3D <1800000>;
> +					regulator-max-microvolt =3D <3300000>;
> +				};
> +			};
> +		};
> +
> +		mmc0: mmc@6000 {
> +			compatible =3D "vendor,mmc";
> +			reg =3D <0x6000 0x100>;
> +			clocks =3D <&clk 4>;
> +			vmmc-supply =3D <&reg_vdd>;
> +			vqmmc-supply =3D <&board2_early_reg>;
> +		};
> +	};
> +};
> diff --git a/tests/fdtfactor_board3.dts b/tests/fdtfactor_board3.dts
> new file mode 100644
> index 000000000000..1a0fb1641241
> --- /dev/null
> +++ b/tests/fdtfactor_board3.dts
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/ {
> +	model =3D "Test Board 3";
> +	compatible =3D "vendor,board3", "vendor,common";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	/*
> +	 * Two extra phandle-bearing nodes before intc/clk shift all subsequent
> +	 * phandle numbers in board3.dtb relative to both board1.dtb and
> +	 * board2.dtb.
> +	 */
> +	board3_early_reg1: regulator-early1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "board3-early1";
> +	};
> +
> +	board3_early_reg2: regulator-early2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "board3-early2";
> +		vin-supply =3D <&board3_early_reg1>;
> +	};
> +
> +	intc: interrupt-controller@1000 {
> +		compatible =3D "vendor,intc";
> +		reg =3D <0x1000 0x100>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +	};
> +
> +	clk: clock-controller@2000 {
> +		compatible =3D "vendor,clk";
> +		reg =3D <0x2000 0x100>;
> +		#clock-cells =3D <1>;
> +	};
> +
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +		interrupt-parent =3D <&intc>;
> +
> +		uart0: serial@3000 {
> +			compatible =3D "vendor,uart";
> +			reg =3D <0x3000 0x100>;
> +			interrupts =3D <1 0>;
> +			clocks =3D <&clk 1>;
> +			status =3D "okay";
> +		};
> +
> +		i2c0: i2c@4000 {
> +			compatible =3D "vendor,i2c";
> +			reg =3D <0x4000 0x100>;
> +			interrupts =3D <2 0>;
> +			clocks =3D <&clk 2>;
> +			status =3D "okay";
> +
> +			pmic: pmic@40 {
> +				compatible =3D "vendor,pmic";
> +				reg =3D <0x40>;
> +
> +				reg_vdd: vdd {
> +					regulator-min-microvolt =3D <1800000>;
> +					regulator-max-microvolt =3D <3300000>;
> +				};
> +			};
> +		};
> +
> +		spi0: spi@5000 {
> +			compatible =3D "vendor,spi";
> +			reg =3D <0x5000 0x100>;
> +			clocks =3D <&clk 3>;
> +			vdd-supply =3D <&reg_vdd>;
> +			cs-supply =3D <&board3_early_reg2>;
> +		};
> +
> +		mmc0: mmc@6000 {
> +			compatible =3D "vendor,mmc";
> +			reg =3D <0x6000 0x100>;
> +			clocks =3D <&clk 4>;
> +			vmmc-supply =3D <&reg_vdd>;
> +			vqmmc-supply =3D <&board3_early_reg1>;
> +		};
> +
> +		usb0: usb@7000 {
> +			compatible =3D "vendor,usb";
> +			reg =3D <0x7000 0x100>;
> +			interrupts =3D <5 0>;
> +			clocks =3D <&clk 5>;
> +			vbus-supply =3D <&board3_early_reg2>;
> +		};
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 842b543059bb..92fa417d3457 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -239,6 +239,21 @@ run_fdtoverlay_test() {
>      base_run_test sh "$SRCDIR/fdtoverlay-runtest.sh" "$expect" "$@"
>  }
> =20
> +# Compare an original .dtb and a recreated .dtb by decompiling and sorti=
ng both
> +# with dtc -I dtb -O dts -qq -f -s (like dtdiff) and normalizing the num=
eric
> +# phandle properties assigned to target nodes. Because both blobs contain
> +# /__symbols__ and /__local_fixups__, dtc restores all node labels and c=
onverts
> +# all phandle references in properties back into symbolic <&label> refer=
ences.
> +check_dtb_recreated () {
> +    orig=3D"$1"
> +    recreated=3D"$2"
> +    $DTC -I dtb -O dts -qq -f -s -o "$orig.raw.test.dts" "$orig" || retu=
rn 1
> +    $DTC -I dtb -O dts -qq -f -s -o "$recreated.raw.test.dts" "$recreate=
d" || return 1
> +    sed 's/phandle =3D <0x[0-9a-f]*>;/phandle =3D <0xffffffff>;/' "$orig=
=2Eraw.test.dts" > "$orig.cmp.test.dts" || return 1
> +    sed 's/phandle =3D <0x[0-9a-f]*>;/phandle =3D <0xffffffff>;/' "$recr=
eated.raw.test.dts" > "$recreated.cmp.test.dts" || return 1
> +    diff -u "$orig.cmp.test.dts" "$recreated.cmp.test.dts"

I dislike tests comparing dts in general, since it's a highly
non-unique representation.  I much prefer to use the
dtbs_equal_ordered and dtbs_equal_unordered helpers.

> +}
> +
>  BAD_FIXUP_TREES=3D"bad_index \
>  		empty \
>  		empty_index \
> @@ -1089,6 +1104,50 @@ fdtoverlay_tests() {
> =20
>      shorten_echo "check phandle to noda d wasn't overwritten:	"
>      run_wrap_test test "$bd" =3D "$pd"

I think it would be preferable to create a new group of tests for
fdtdactor, rather than lumping them in with fdtoverlay.

> +    if ! $no_python; then
> +	run_dtc_test -@ -L -I dts -O dtb -o fdtfactor_board1.test.dtb "$SRCDIR/=
fdtfactor_board1.dts"
> +	run_dtc_test -@ -L -I dts -O dtb -o fdtfactor_board2.test.dtb "$SRCDIR/=
fdtfactor_board2.dts"
> +	run_dtc_test -@ -L -I dts -O dtb -o fdtfactor_board3.test.dtb "$SRCDIR/=
fdtfactor_board3.dts"
> +
> +	# Symbolic phandle deduplication mode (3 boards)
> +	run_wrap_test $PYTHON "$FDTFACTOR" -v --verify \
> +	    -b fdtfactor_base.test.dtb \
> +	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb fdtfactor_board=
3.test.dtb
> +	run_wrap_test $FDTOVERLAY -i fdtfactor_base.test.dtb \
> +	    -o fdtfactor_board1.recreated.test.dtb fdtfactor_board1.test.dtbo
> +	run_wrap_test $FDTOVERLAY -i fdtfactor_base.test.dtb \
> +	    -o fdtfactor_board2.recreated.test.dtb fdtfactor_board2.test.dtbo
> +	run_wrap_test $FDTOVERLAY -i fdtfactor_base.test.dtb \
> +	    -o fdtfactor_board3.recreated.test.dtb fdtfactor_board3.test.dtbo
> +	run_wrap_test check_dtb_recreated fdtfactor_board1.test.dtb fdtfactor_b=
oard1.recreated.test.dtb
> +	run_wrap_test check_dtb_recreated fdtfactor_board2.test.dtb fdtfactor_b=
oard2.recreated.test.dtb
> +	run_wrap_test check_dtb_recreated fdtfactor_board3.test.dtb fdtfactor_b=
oard3.recreated.test.dtb
> +	# Majority value ("okay" in boards 1 & 3) should be in base.dtb
> +	run_fdtget_test "okay" fdtfactor_base.test.dtb /soc/serial@3000 status =
-ts
> +
> +	# Strip local fixups mode (3 boards)
> +	run_wrap_test $PYTHON "$FDTFACTOR" --verify -S \
> +	    --base-dtb fdtfactor_base_stripped.test.dtb -o . \
> +	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb fdtfactor_board=
3.test.dtb
> +	run_wrap_test $FDTOVERLAY -i fdtfactor_base_stripped.test.dtb \
> +	    -o fdtfactor_board1.stripped.test.dtb fdtfactor_board1.test.dtbo
> +	run_wrap_test $FDTOVERLAY -i fdtfactor_base_stripped.test.dtb \
> +	    -o fdtfactor_board2.stripped.test.dtb fdtfactor_board2.test.dtbo
> +	run_wrap_test $FDTOVERLAY -i fdtfactor_base_stripped.test.dtb \
> +	    -o fdtfactor_board3.stripped.test.dtb fdtfactor_board3.test.dtbo
> +	run_test check_path fdtfactor_board1.stripped.test.dtb not-exists "/__l=
ocal_fixups__"
> +	# Without /__local_fixups__, dtc -I dtb -O dts cannot turn phandle cells
> +	# inside properties back into <&label> references, so compare stripped
> +	# against recreated (after removing /__local_fixups__), which shares
> +	# fdtfactor's phandle numbering and was already verified against orig.
> +	run_wrap_test $DTPUT -r fdtfactor_board1.recreated.test.dtb /__local_fi=
xups__
> +	run_wrap_test $DTPUT -r fdtfactor_board2.recreated.test.dtb /__local_fi=
xups__
> +	run_wrap_test $DTPUT -r fdtfactor_board3.recreated.test.dtb /__local_fi=
xups__
> +	run_wrap_test check_dtb_recreated fdtfactor_board1.recreated.test.dtb f=
dtfactor_board1.stripped.test.dtb
> +	run_wrap_test check_dtb_recreated fdtfactor_board2.recreated.test.dtb f=
dtfactor_board2.stripped.test.dtb
> +	run_wrap_test check_dtb_recreated fdtfactor_board3.recreated.test.dtb f=
dtfactor_board3.stripped.test.dtb
> +    fi
>  }
> =20
>  pylibfdt_tests () {
> @@ -1139,7 +1198,7 @@ if [ -z "$TESTSETS" ]; then
>  fi
> =20
>  # Make sure we don't have stale blobs lying around
> -rm -f *.test.dtb *.test.dts
> +rm -f *.test.dtb *.test.dtbo *.test.dts
> =20
>  for set in $TESTSETS; do
>      case $set in
> diff --git a/tests/testutils.sh b/tests/testutils.sh
> index 6b2f0d14e3e5..7f35ba8e4158 100644
> --- a/tests/testutils.sh
> +++ b/tests/testutils.sh
> @@ -27,6 +27,7 @@ DTGET=3D${TEST_BINDIR}/fdtget
>  DTPUT=3D${TEST_BINDIR}/fdtput
>  FDTDUMP=3D${TEST_BINDIR}/fdtdump
>  FDTOVERLAY=3D${TEST_BINDIR}/fdtoverlay
> +FDTFACTOR=3D${SRCDIR}/../fdtfactor
> =20
>  verbose_run () {
>      if [ -z "$QUIET_TEST" ]; then
> --=20
> 2.56.0.176.g3575e65682-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--0GvNcZVVdx3zecoJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmre3AQACgkQzQJF27ox
2GdWUg//aY+tK5uxpUcT/JyxfXYSVmA+StgZG6mrYWkcAriepW9loNH48lR1TUwL
KhHvdxOlvuDl2RQJV7YEiaA/gRC3w7sp+qEunQ0YSiJ7mfuheWnRWqVvno75c5sa
OwrEq30jgc6X6a+A9V+IyVKa9vLYW7DS+QHJmhP3qypJOOviFwXAy6v6gGQwOKj+
/dKJkWEjSQSPQixzyTkoCJ+YCLrn5UQ98oqPBf/8a3c++yqJfmveWp8RVb+8pxQL
aDDrh0IB0a75wJXFBT1q+YrobH6F9/9/oV56pFpxPZ2/bJnlzE1PSascs/6rDU7G
e3y2+8Rvb0eTHNg5bQUzgGOIjB7u3Ga/JPSwh3On+b+EisTu94SHoT2k5+Jku4jL
HZ2l9rIIThjot0/JUNDwu0oalQJzN+mZnKMbRHVJP6wDAaCTtO9WqBEPkqXy3vHp
PMiK1+VcFxeiPFf4/1yjyAnYoIMv9PwrrwjsJo90lF19sdqGmJHKhK6wpeQ7q8jh
Pl1vScWcmTAMmnUiSfCU8+7SAsHP+aF6mJDrlUL/JlGM/txomvlEkdvkpexTHVaA
Kz5YINR0smaJr5xXeMOPBUoPBUGP9sZ2I4k/tFrLkv/bDFXKOp9noQSTAd0qvnkg
Y2dq81xXw0IaY8IqkMnZkXywxtp9E1Ox/A+e/Bri3AV8VeWFtrw=
=hCef
-----END PGP SIGNATURE-----

--0GvNcZVVdx3zecoJ--
