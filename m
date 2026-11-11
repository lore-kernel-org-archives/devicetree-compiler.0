Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370603;
	b=TspdTv1kbvJ9k8R6T9lhWtBPt2WGfTtIgx+Q2SBNCgcjcb5TCe1mVM2m/kNBnIpZZuyI
	 qla9u2V22OhUmdgKn0x12a1FZWNcOa2qjshEfkTG05HWyDezHwd9Y0q/Z/W/gwIvI9o9Q
	 /P2JwodZjFI1x0Ho9G/Flzs6kDN8ycxopWVflIH4N47xiCF0dQgwSGHI8tRlpNc6in6wS
	 ia9ZtU47ns7xCZExomOTVSa/eDRCGidutXdT8HAfDY4M89zlXN87sylvTE+f6VOcRHDfZ
	 TGXDVHQRfRcpCNoLYWjHvWGCMWhXtCNOazTKbxPjy0Hfn8LDTJjd/JEPxnC1HymIKGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370603;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bEb+ycpdkqDUUfA4df0X9G8XlrGQnPkmNPwNE4H8+R0=;
	b=HeoYktVQ/lguYRBJwxPAd6qyvbWCoBNahEKTK+9jUJXHmuAH+0izHp7iK8pCvxAHRK+W
	 uoYMlm+SkD+qaCjKDcOnwZY3MlIAEwbNEeJ5n2iW29R2WnTo0kihUDVcrFdnY8FDmWvzK
	 SRLx5Z78V1AR1yYlrbmGGHC10EYH+4ANCmtSpT8guoiTl4Yr2UkjSGnaUaXK/luRJ1yQK
	 wAHPu4n1Z6ffSl9qT04QVfe/fAuF2AaCXK7z3RnL2fhgbC+Ii6aITKmIrWMgbfdEPG57a
	 zXUIYM2oTJBtF9B6FYuLaND7ou8iIbG1XT98tKwoVwprIAXZdSUhZ+0MSp/AbWnVUtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=AJu7XAEp;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30CD60A2602;
	Wed, 11 Nov 2026 04:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B30CD60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=AJu7XAEp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794370599;
	bh=bEb+ycpdkqDUUfA4df0X9G8XlrGQnPkmNPwNE4H8+R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJu7XAEp45NdLKzeN2ih+vWsPwkJyiJnA2a055BdcybhtaxcykYuC51US5AGH6MRP
	 gU14ELmlWfmF7KVUAdBlS2s+Bbor1s0XwlAByOWl0r1qLAyqyxgi+butAcukKr3zCC
	 n9ZJa35ZDaOjsYeUX4FuYMGEUFmgMb7bWrJeAAAkoZJngvVcsNRXhjY9z7PORy3e58
	 L8PnmpiBUxbx99d0KJKRpDmTtOLlR8/Qrk1+5dL/NU4WPBGH24On943OBy7MmFIS5e
	 N0ZcUZwxhy3zG1vkqmKDcZws+hH4arPjXCKZ5Rvz9uushDBJNAQ6JbB+6ORU2fcYX+
	 ViSdW86rb/G+g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jPVZv5fgcz4wTJ; Wed, 11 Nov 2026 15:16:39 +1100 (AEDT)
Date: Wed, 11 Nov 2026 15:16:33 +1100
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
Subject: Re: [PATCH v3 12/15] fdtfactor: Add tool to split DTBs into a base
 DTB and overlays
Message-ID: <avPsIBLWNrNexcbt@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-13-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="jPK+xiipKLc4/Bf3"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-13-dianders@chromium.org>

--jPK+xiipKLc4/Bf3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:19PM -0800, Douglas Anderson wrote:
> When shipping a single firmware or kernel image that supports many
> closely related board variants or SKUs, bundling a full compiled .dtb
> for every variant results in substantial duplication.
>=20
> Add `fdtfactor`, a Python tool built on `pylibfdt` and `devicetree` that
> takes a set of compiled device tree blobs (.dtb) compiled with `-@ -L`
> (`/__symbols__` and `/__local_fixups__`) and splits them into a single
> common `base.dtb` and per-board `.dtbo` overlays:
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
> Add a `fdtfactor` test suite in `tests/run_tests.sh` verifying that
> applying each generated `.dtbo` to `base.dtb` with `fdtoverlay`
> reconstructs the original DTB (verified via `dtbs_equal_unordered`,
> including across input DTBs with shifted phandle numbers).
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks pretty good to me.  I've made a few notes for minor improvements
below.

> ---
>=20
> Changes in v3:
> - Update fdtfactor to use devicetree.DeviceTree and a FactoredTree
>   subclass initializing self.phandle and self.fixups in __init__()
>   (David Gibson, Simon Glass)
> - Rename -b/--base-dtb to --output-base-dtb to avoid confusion with an
>   input base DTB (David Gibson)
> - Move the test rejecting input DTBs lacking /__local_fixups__ from the
>   -S patch into this base patch (Simon Glass)
>=20
> Changes in v2:
> - Preserve /__local_fixups__ on base.dtb by default (David Gibson)
> - Store parsed trees directly in NodeTree with node.phandle and
>   node.fixups attributes instead of parallel dicts (David Gibson)
> - Extract phandles in a separate pass after unflattening and reject
>   legacy linux,phandle properties (David Gibson)
> - Exclude non-root common phandle nodes lacking a common symbol from
>   base.dtb instead of synthesizing __fdtfactor_ph_* symbols (David
>   Gibson)
> - Drop -q/--quiet, rename -v/--verbose to -s/--stats, and move tests to
>   a dedicated fdtfactor test suite (David Gibson)
>=20
>  Makefile                           |   2 +-
>  README.md                          |  43 ++
>  fdtfactor                          | 842 +++++++++++++++++++++++++++++
>  meson.build                        |   1 +
>  tests/Makefile.tests               |   4 +-
>  tests/fdtfactor_board1.dts         |  38 ++
>  tests/fdtfactor_board2.dts         |  36 ++
>  tests/fdtfactor_board3.dts         |  34 ++
>  tests/fdtfactor_board3_shifted.dts |  34 ++
>  tests/meson.build                  |   2 +-
>  tests/run_tests.sh                 |  72 ++-
>  tests/testutils.sh                 |   1 +
>  12 files changed, 1102 insertions(+), 7 deletions(-)
>  create mode 100755 fdtfactor
>  create mode 100644 tests/fdtfactor_board1.dts
>  create mode 100644 tests/fdtfactor_board2.dts
>  create mode 100644 tests/fdtfactor_board3.dts
>  create mode 100644 tests/fdtfactor_board3_shifted.dts
>=20
> diff --git a/Makefile b/Makefile
> index 1560a5609fea..fc06b0ae16e2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -169,7 +169,7 @@ BIN +=3D fdtget
>  BIN +=3D fdtput
>  BIN +=3D fdtoverlay
> =20
> -SCRIPTS =3D dtdiff
> +SCRIPTS =3D dtdiff fdtfactor
> =20
>  all: $(BIN) libfdt
> =20
> diff --git a/README.md b/README.md
> index fcfc2e55d804..61fefc4424fe 100644
> --- a/README.md
> +++ b/README.md
> @@ -112,6 +112,49 @@ $ meson setup -Dpython=3Ddisabled build
>  More work remains to support all of libfdt, including access to numeric
>  values.
> =20
> +## fdtfactor

Pre-existing, but it would be nice to have blurbs for dtdiff,
fdt{get,put} and the other anciliary tools we already include.

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
> +$ fdtfactor -o out_dir board1.dtb board2.dtb board3.dtb
> +```
> +
> +Options:
> +
> +* `--output-base-dtb`: Output filename for the common base `.dtb`
> +  (default: `base.dtb`; placed in `--outdir` if specified, or the current
> +  directory otherwise).
> +* `-o`, `--outdir`: Output directory for generated `.dtbo` files and
> +  `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` =
files,
> +  current directory for `--output-base-dtb`).
> +* `-s`, `--stats`: Print size savings summary.
> +
> +### TODO
> +
> +* **Targeted overlay fragments**: Add an option to emit fine-grained
> +  `/fragment@N` nodes targeting individual parent subnodes rather than
> +  placing all overlay changes under a single `/fragment@0` targeting `/`.
> +* **Multi-level overlays**: Support hierarchical overlay layers (for
> +  example, SoC base -> board family intermediate overlay -> SKU leaf
> +  overlay) when multiple boards share large sub-trees not present across
> +  all boards. As an interim step, `fdtfactor` could accept an
> +  already-generated `base.dtb` plus a subset of `.dtbo` overlays emitted
> +  by an initial pass, leaving `base.dtb` untouched while factoring out
> +  an intermediate `.dtbo` for the commonalities shared within that
> +  subset.
> +
>  ## Mailing lists
> =20
>  * The [devicetree-compiler](mailto:devicetree-compiler@vger.kernel.org)
> diff --git a/fdtfactor b/fdtfactor
> new file mode 100755
> index 000000000000..f6944e36a0f2
> --- /dev/null
> +++ b/fdtfactor
> @@ -0,0 +1,842 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +"""fdtfactor - Split multiple compiled .dtb files into a base .dtb and .=
dtbo overlays.
> +
> +Given two or more input .dtb files compiled with `dtc -@ -L` (so they in=
clude
> +`/__symbols__` and `/__local_fixups__`), `fdtfactor` extracts all nodes =
and
> +properties shared across the inputs into a single common `base.dtb` and =
emits a
> +small per-board `.dtbo` overlay for each input. Applying a board's `.dtb=
o` to
> +`base.dtb` (e.g., via `fdtoverlay` or `fdt_overlay_apply()`) reconstruct=
s the
> +original board DTB.
> +"""
> +
> +import argparse
> +from collections import Counter
> +import os
> +import struct
> +import sys
> +
> +import devicetree
> +import libfdt
> +
> +
> +def _is_dtbo_overlay(fdt):
> +    """Return True if `fdt` is a `.dtbo` overlay rather than a base DTB.
> +
> +    Args:
> +        fdt: A `libfdt.FdtRo` instance to inspect.
> +
> +    Returns:
> +        True if `fdt` contains `/__fixups__` or a top-level subnode with=
 an
> +        `__overlay__` child, False otherwise.
> +    """
> +    if fdt.subnode_offset(0, '__fixups__', quiet=3Dlibfdt.QUIET_NOTFOUND=
) >=3D 0:
> +        return True
> +    return any(
> +        fdt.subnode_offset(soff, '__overlay__', quiet=3Dlibfdt.QUIET_NOT=
FOUND) >=3D 0
> +        for soff in fdt.subnodes(0)
> +    )
> +
> +
> +class FactoredTree(devicetree.DeviceTree):
> +    """DeviceTree subclass with normalized phandle and fixup attributes.
> +
> +    Attributes:
> +        phandle: Optional integer phandle popped from `props['phandle']`.
> +        fixups: Dict mapping property name (str) to a tuple of
> +            `(byte_offset, target_node_path)` phandle fixup pairs.
> +    """
> +
> +    def __init__(self):
> +        super().__init__()
> +        self.phandle =3D None
> +        self.fixups =3D {}
> +
> +
> +class ParsedDtb:
> +    """Complete input .dtb blob with phandle-normalized tree and FDT met=
adata.
> +
> +    While `devicetree.DeviceTree` is a generic live-tree representation =
of a
> +    node hierarchy (with `libfdt.Property` instances and unprocessed
> +    `/__symbols__`, `/__local_fixups__`, and `phandle` properties), `Par=
sedDtb`
> +    wraps an entire input `.dtb` in a `FactoredTree` (`self.root`) and
> +    normalizes it for cross-board comparison:
> +
> +    - Stores FDT header, memory reservation, and file-level metadata tha=
t live
> +      outside the root node tree (`boot_cpuid_phys`, `mem_rsv`, `filenam=
e`,
> +      `raw_bytes`).
> +    - Pops `/__symbols__` (parsed into `self.symbols`) and `/__local_fix=
ups__`
> +      out of `self.root`.
> +    - Moves each node's `phandle` property out of `node.props` into
> +      `node.phandle`, and uses `/__local_fixups__` to zero out numeric p=
handle
> +      cells in `node.props` while recording canonical `(offset, target_p=
ath)`
> +      tuples in `node.fixups` so properties can be compared across DTBs
> +      independent of numeric phandle numbering.
> +    """
> +
> +    def __init__(self, filename):
> +        """Parse an input FDT file into a normalized FactoredTree.
> +
> +        Args:
> +            filename: File path of the `.dtb` file to read.
> +        """
> +        self.filename =3D filename
> +        with open(filename, 'rb') as f:
> +            raw_bytes =3D f.read()
> +        self.raw_bytes =3D raw_bytes

AFAICT, self.raw_bytes is never used again (unlike the raw_bytes
local).

> +        try:
> +            fdt =3D libfdt.FdtRo(raw_bytes)
> +            libfdt.check_err(libfdt.fdt_check_full(fdt._fdt, len(raw_byt=
es)))
> +        except libfdt.FdtException as exc:
> +            raise ValueError(f'{filename}: Invalid FDT blob ({exc})') fr=
om exc
> +
> +        if _is_dtbo_overlay(fdt):
> +            raise ValueError(
> +                f'{filename}: Input is already a DTB overlay (.dtbo)'
> +            )
> +
> +        self.boot_cpuid_phys =3D fdt.boot_cpuid_phys()
> +        self.mem_rsv =3D tuple(fdt.get_mem_rsv_list())
> +        self.root =3D FactoredTree.unflatten(fdt)
> +
> +        sym_node =3D self.root.children.pop('__symbols__', None)
> +        lf_root =3D self.root.children.pop('__local_fixups__', None)
> +        if sym_node is None or lf_root is None:
> +            raise ValueError(
> +                f'input DTB(s) lack /__symbols__ or /__local_fixups__: '
> +                f'{filename} (compile input DTBs with dtc -@ -L)'
> +            )
> +
> +        phandle_to_path =3D self._extract_phandles()
> +        self.symbols =3D self._parse_symbols(sym_node)
> +        self._apply_local_fixups(lf_root, phandle_to_path)
> +
> +    def _extract_phandles(self):
> +        """Move `phandle` properties out of `node.props`.
> +
> +        Walks `self.root` in pre-order and, for each node:
> +        - Pops `phandle` from `node.props` (so phandle properties are not
> +          compared as ordinary byte properties across DTBs, since `dtc` =
may
> +          assign different integer phandles to the same node in different
> +          boards) and stores the decoded integer in `node.phandle`.
> +        - Validates that `node.phandle` is not `0` or `0xffffffff`, and =
that no
> +          two nodes in the DTB share the same phandle.
> +
> +        Returns:
> +            Dict mapping each integer phandle in this DTB to its node pa=
th
> +            string (`""` for root, `"/soc/..."` for subnodes), used by
> +            `_apply_local_fixups()` to resolve numeric phandle cells to
> +            canonical target node paths.
> +        """
> +        phandle_to_path =3D {}
> +        for path, node in self.root.walk():
> +            if 'linux,phandle' in node.props:
> +                raise ValueError(
> +                    f'{self.filename}: {path or "/"}: legacy linux,phand=
le '
> +                    f'property is not supported (compile with dtc -H epa=
pr)'
> +                )
> +            if 'phandle' in node.props:
> +                node.phandle =3D node.get_u32('phandle')
> +                del node.props['phandle']
> +
> +            if node.phandle is not None:

Changing this to:
	if node.phandle is None:
		continue
reduces nesting and IMO, would make this a little more readable.

> +                if node.phandle in (0, 0xffffffff):
> +                    raise ValueError(
> +                        f'{self.filename}: invalid phandle {node.phandle=
:#x} '
> +                        f'on {path or "/"}'
> +                    )
> +                if node.phandle in phandle_to_path:
> +                    raise ValueError(
> +                        f'{self.filename}: duplicate phandle {node.phand=
le:#x} '
> +                        f'on {phandle_to_path[node.phandle] or "/"} and '
> +                        f'{path or "/"}'
> +                    )
> +                phandle_to_path[node.phandle] =3D path
> +        return phandle_to_path
> +
> +    def _parse_symbols(self, sym_node):
> +        """Parse the popped `/__symbols__` node into a `label -> path` d=
ict.
> +
> +        Each property on `/__symbols__` (ignoring any `phandle` property=
 on the
> +        `/__symbols__` node itself) maps a Devicetree label name to the =
full
> +        path of the target node in the DTB. Root paths (`"/"`) are norma=
lized to
> +        `""` to match `DeviceTree` path conventions, and each target pat=
h is
> +        verified to exist in `self.root`.
> +
> +        Args:
> +            sym_node: The `FactoredTree` for `/__symbols__` popped from
> +                `self.root`.
> +
> +        Returns:
> +            Dict mapping symbol label name (str) to normalized target no=
de path
> +            (str, `""` for root or `"/..."` for subnodes).
> +        """
> +        symbols =3D {}
> +        for label in sym_node.props:
> +            if label =3D=3D 'phandle':
> +                continue
> +            raw_path =3D sym_node.get_str(label)
> +            if not raw_path.startswith('/') or '//' in raw_path:
> +                raise ValueError(
> +                    f'{self.filename}: symbol {label!r} has malformed '
> +                    f'path {raw_path!r}'
> +                )
> +            target_path =3D raw_path.rstrip('/')
> +            if self.root.get_node(target_path) is None:
> +                raise ValueError(
> +                    f'{self.filename}: symbol {label!r} references '
> +                    f'missing node {target_path or "/"!r}'
> +                )
> +            symbols[label] =3D target_path
> +        return symbols
> +
> +    def _apply_local_fixups(self, lf_root, phandle_to_path):
> +        """Normalize phandle references in `self.root` using `/__local_f=
ixups__`.
> +
> +        The `/__local_fixups__` tree mirrors the structure of `self.root=
`: each
> +        property in `/__local_fixups__` contains a list of 32-bit byte o=
ffsets
> +        where the corresponding property in `self.root` holds a phandle =
cell.
> +        For every such offset, this method:
> +        - Reads the 32-bit integer phandle from `target_node.props[prop_=
name]`
> +          and resolves it to a canonical target node path via `phandle_t=
o_path`.
> +        - Zeros out the 4-byte phandle cell in `target_node.props[prop_n=
ame]` so
> +          property values can be compared across DTBs independent of num=
eric
> +          phandle numbering.
> +        - Records `((offset, target_path), ...)` in
> +          `target_node.fixups[prop_name]`.
> +
> +        Args:
> +            lf_root: The `FactoredTree` for `/__local_fixups__` popped f=
rom
> +                `self.root`.
> +            phandle_to_path: Dict mapping integer phandle values to norm=
alized
> +                node paths in `self.root`, as returned by `_extract_phan=
dles()`.
> +        """
> +        for path, lf_node in lf_root.walk():
> +            if not lf_node.props:
> +                continue
> +            target_node =3D self.root.get_node(path)
> +            if target_node is None:
> +                raise ValueError(
> +                    f'{self.filename}: local fixup references missing no=
de '
> +                    f'{path or "/"}'
> +                )
> +            for prop_name in lf_node.props:
> +                if prop_name not in target_node.props:
> +                    raise ValueError(
> +                        f'{self.filename}: local fixup references missin=
g '
> +                        f'property {path or "/"}:{prop_name}'
> +                    )
> +                offsets =3D sorted(set(lf_node.get_u32_list(prop_name)))

I don't think there's any reason to convert the list to a set before sortin=
g.

> +                raw_prop =3D target_node.props[prop_name]
> +                masked =3D bytearray(raw_prop)
> +                targets =3D []
> +                for off in offsets:
> +                    if off + 4 > len(raw_prop):
> +                        raise ValueError(
> +                            f'{self.filename}: fixup offset {off} out of=
 range '
> +                            f'on {path or "/"}:{prop_name} (len {len(raw=
_prop)})'
> +                        )
> +                    if targets and off < targets[-1][0] + 4:
> +                        raise ValueError(
> +                            f'{self.filename}: overlapping fixup offset =
{off} '
> +                            f'on {path or "/"}:{prop_name}'
> +                        )
> +                    ph =3D struct.unpack_from('>I', raw_prop, off)[0]
> +                    target_path =3D phandle_to_path.get(ph)
> +                    if target_path is None:
> +                        raise ValueError(
> +                            f'{self.filename}: unknown phandle {ph:#x} a=
t '
> +                            f'{path or "/"}:{prop_name}+{off}'
> +                        )
> +                    masked[off:off + 4] =3D b'\x00\x00\x00\x00'
> +                    targets.append((off, target_path))
> +                target_node.props[prop_name] =3D libfdt.Property(
> +                    prop_name, bytes(masked)
> +                )
> +                target_node.fixups[prop_name] =3D tuple(targets)
> +
> +
> +def select_best_candidate(candidates, path, prop_name):
> +    """Choose the `(masked_bytes, fixups)` value that maximizes overlay =
savings.
> +
> +    Only candidates shared by at least two input DTBs (`count > 1`) are
> +    eligible for the base DTB; a value that appears in only one DTB woul=
d add
> +    one copy to `base.dtb` to save one overlay copy (zero net savings).
> +
> +    Byte cost model per overlay occurrence:
> +    - Each FDT property carries a 12-byte structure header (`FDT_PROP` 4=
-byte
> +      tag + 4-byte length + 4-byte `nameoff`) plus `len(masked_bytes)` v=
alue
> +      bytes.
> +    - Each phandle fixup in an overlay adds a string entry of the form
> +      `"/fragment@0/__overlay__<path>:<prop_name>:<off>\\0"` to `/__fixu=
ps__`:
> +      22 bytes (`"/fragment@0/__overlay__"`) + `len(path)` + 1 (`":"`) +
> +      `len(prop_name)` + 1 (`":"`) + ~1-2 digits for `<off>` + 1 (`"\\0"=
`) +
> +      ~3 bytes amortized `/__fixups__` property overhead =3D
> +      `len(path) + len(prop_name) + 28` bytes.
> +
> +    Args:
> +        candidates: Sequence of `(masked_bytes, fixups)` tuples observed=
 across
> +            input DTBs for `prop_name` on `path`.
> +        path: Normalized node path (`""` for root or `"/..."` for subnod=
es).
> +        prop_name: Property name string.
> +
> +    Returns:
> +        The `(masked_bytes, fixups)` tuple that yields the largest estim=
ated
> +        byte savings when placed in `base.dtb`, or `None` if no candidate
> +        appears in at least two input DTBs.
> +    """
> +    fixup_entry_cost =3D len(path) + len(prop_name) + 28
> +    counts =3D Counter(candidates)
> +    best_val =3D None
> +    best_key =3D None
> +    for val, count in counts.items():
> +        if count <=3D 1:
> +            continue
> +        masked_bytes, fixups =3D val
> +        length =3D len(masked_bytes) + len(fixups) * fixup_entry_cost
> +        # Placing `val` in base.dtb adds 1 copy and removes `count` over=
lay
> +        # copies, saving `(count - 1) * (length + 12)` bytes across the =
set.
> +        key =3D ((count - 1) * (length + 12), count, length)
> +        if best_key is None or key > best_key:
> +            best_key =3D key
> +            best_val =3D val
> +    return best_val
> +
> +
> +def _validate_dtb_headers(dtbs):
> +    """Verify that FDT header fields and `/memreserve/` entries match ac=
ross DTBs.
> +
> +    `fdt_overlay_apply()` only merges the `.dtbo` structure block into t=
he base
> +    DTB and ignores the `.dtbo` header and `/memreserve/` block, so all =
DTBs
> +    sharing a base DTB must have identical `boot_cpuid_phys` and `mem_rs=
v`.
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` instances to validate.
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
> +    """Build the common `FactoredTree` skeleton and assign base DTB phan=
dles.
> +
> +    Any common node that carries a phandle in any input DTB is assigned a
> +    phandle in the base DTB so overlays never attempt to add a `phandle`
> +    property to an already-existing base DTB node. Non-root nodes that c=
arry a
> +    phandle in some input DTB but lack a common symbol in `/__symbols__`=
 across
> +    all input DTBs (for example, when two boards define the same node pa=
th with
> +    different label names) are excluded from `base.dtb` so overlays can =
create
> +    them with board-local phandles and symbols.
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` instances.
> +
> +    Returns:
> +        A `FactoredTree` containing all common nodes with `node.phandle`=
 set to
> +        their assigned sequential integer phandle (or `None` if the node=
 has no
> +        phandle in any input DTB) and `node.fixups` initialized to `{}`.
> +    """
> +    common_paths =3D {path for path, _ in dtbs[0].root.walk()}
> +    for d in dtbs[1:]:
> +        common_paths &=3D {path for path, _ in d.root.walk()}
> +
> +    common_sym_targets =3D {
> +        path for label, path in dtbs[0].symbols.items()
> +        if all(d.symbols.get(label) =3D=3D path for d in dtbs[1:])
> +    }
> +
> +    base_root =3D FactoredTree()
> +    next_ph =3D 1
> +    for path, _ in dtbs[0].root.walk():
> +        if path not in common_paths:
> +            continue

I think this makes the loop equivalent to:
	for path in common_paths:
	    ....

> +        if path and base_root.get_node(path.rpartition('/')[0]) is None:
> +            continue
> +        has_phandle =3D any(
> +            d.root.get_node(path).phandle is not None for d in dtbs
> +        )

I expect this will work in practice, but arguably the condition you
really need here is whether the node is referred to by any fixup in
any non-common property.

> +        if has_phandle and path and path not in common_sym_targets:
> +            continue
> +        base_node =3D base_root.create_path(path)
> +        if has_phandle:
> +            base_node.phandle =3D next_ph
> +            next_ph +=3D 1
> +    return base_root
> +
> +
> +def _find_common_symbols(dtbs, base_root):
> +    """Find symbols common to all input DTBs that point to the same base=
 node.
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` instances.
> +        base_root: `FactoredTree` containing the common nodes for `base.=
dtb`.
> +
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
> +    for label, chosen_path in dtbs[0].symbols.items():
> +        if not all(d.symbols.get(label) =3D=3D chosen_path for d in dtbs=
[1:]):
> +            continue
> +        base_node =3D base_root.get_node(chosen_path)
> +        if base_node is None:
> +            continue
> +        base_dtb_symbols[label] =3D chosen_path
> +        if (base_node.phandle is not None and
> +                chosen_path not in path_to_base_dtb_symbol):
> +            path_to_base_dtb_symbol[chosen_path] =3D label
> +
> +    return base_dtb_symbols, path_to_base_dtb_symbol
> +
> +
> +def _build_base_tree(dtbs):
> +    """Construct the normalized `FactoredTree` for the common base DTB.
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` instances.
> +
> +    Returns:
> +        A `FactoredTree` containing all common nodes, their assigned `ph=
andle`
> +        attributes, and their best shared `(masked_bytes, fixups)` prope=
rties.
> +    """
> +    base_root =3D _find_common_nodes_and_phandles(dtbs)
> +    for path, base_node in base_root.walk():
> +        dtb_nodes =3D [d.root.get_node(path) for d in dtbs]
> +        common_prop_names =3D [
> +            k for k in dtb_nodes[0].props
> +            if all(k in n.props for n in dtb_nodes[1:])
> +        ]
> +        for prop_name in common_prop_names:
> +            eligible =3D []
> +            for n in dtb_nodes:
> +                fixups =3D n.fixups.get(prop_name, ())
> +                if not all(base_root.get_node(t_path) is not None
> +                           for _, t_path in fixups):
> +                    continue
> +                eligible.append((bytes(n.props[prop_name]), fixups))
> +
> +            chosen =3D select_best_candidate(eligible, path, prop_name)
> +            if chosen is not None:
> +                masked_bytes, fixups =3D chosen
> +                base_node.props[prop_name] =3D libfdt.Property(
> +                    prop_name, masked_bytes
> +                )
> +                base_node.fixups[prop_name] =3D fixups
> +
> +    return base_root
> +
> +
> +def _serialize_base_dtb(base_root, base_dtb_symbols, rsvmap, boot_cpuid_=
phys):
> +    """Materialize phandles, `/__symbols__`, and `/__local_fixups__` and=
 flatten.
> +
> +    Args:
> +        base_root: Normalized `FactoredTree` for the base DTB from
> +            `_build_base_tree()`.
> +        base_dtb_symbols: Dict mapping common symbol labels to target pa=
ths.
> +        rsvmap: Sequence of `(address, size)` memory reservation tuples.
> +        boot_cpuid_phys: Physical boot CPU ID for the FDT header.
> +
> +    Returns:
> +        Serialized `.dtb` `bytes` for the common base DTB.
> +    """
> +    out_root =3D devicetree.DeviceTree()
> +    lf_entries =3D []
> +
> +    for path, base_node in base_root.walk():
> +        out_node =3D out_root.create_path(path)
> +        for prop_name, prop in base_node.props.items():
> +            masked_bytes =3D bytes(prop)
> +            fixups =3D base_node.fixups.get(prop_name, ())
> +            if not fixups:
> +                out_node.props[prop_name] =3D libfdt.Property(
> +                    prop_name, masked_bytes
> +                )
> +            else:
> +                val =3D bytearray(masked_bytes)
> +                for off, t_path in fixups:
> +                    target_ph =3D base_root.get_node(t_path).phandle
> +                    struct.pack_into('>I', val, off, target_ph)
> +                out_node.props[prop_name] =3D libfdt.Property(
> +                    prop_name, bytes(val)
> +                )
> +                lf_entries.append((path, prop_name, [off for off, _ in f=
ixups]))
> +
> +        if base_node.phandle is not None:
> +            out_node.set_u32('phandle', base_node.phandle)
> +
> +    if base_dtb_symbols:
> +        sym_node =3D out_root.create_path('/__symbols__')
> +        for label, target_path in base_dtb_symbols.items():
> +            sym_node.set_str(label, target_path or '/')
> +
> +    # Create `/__local_fixups__` on the base DTB so `fdt_overlay_apply()`
> +    # updates it with the overlay's phandle fixups when merging.
> +    lf_root =3D out_root.create_path('/__local_fixups__')
> +    for path, prop_name, offs in lf_entries:
> +        lf_root.create_path(path).set_u32_list(prop_name, offs)
> +
> +    fdt =3D out_root.flatten(mem_rsv=3Drsvmap, boot_cpuid_phys=3Dboot_cp=
uid_phys)
> +    return bytes(fdt.as_bytearray())
> +
> +
> +def _assign_local_phandles(dtb, base_root):
> +    """Assign sequential overlay-local phandles (`1, 2, ...`) to board-o=
nly nodes.
> +
> +    Args:
> +        dtb: `ParsedDtb` instance for the board.
> +        base_root: `FactoredTree` containing the common nodes in `base.d=
tb`.
> +
> +    Returns:
> +        Dict mapping each board-only node path that has a phandle in `dt=
b` to
> +        its sequential overlay-local integer phandle (`1, 2, ...`).
> +    """
> +    local_phandles =3D {}
> +    next_local_ph =3D 1
> +    for path, node in dtb.root.walk():
> +        if node.phandle is not None and base_root.get_node(path) is None:
> +            local_phandles[path] =3D next_local_ph
> +            next_local_ph +=3D 1
> +    return local_phandles
> +
> +
> +def _encode_dtbo_property(dtb_filename, path, prop_name, masked_bytes, f=
ixups,
> +                          base_root, path_to_base_dtb_symbol, local_phan=
dles,
> +                          ext_fixups, ov_local_fixups):
> +    """Encode a property value for `/fragment@0/__overlay__` and record =
fixups.
> +
> +    Args:
> +        dtb_filename: Input DTB filename (for error reporting).
> +        path: Normalized node path (`""` for root or `"/..."` for subnod=
es).
> +        prop_name: Property name string.
> +        masked_bytes: Normalized property bytes (with zeroed phandle cel=
ls).
> +        fixups: Tuple of `(offset, target_path)` phandle fixups for this
> +            property.
> +        base_root: `FactoredTree` containing the common nodes in `base.d=
tb`.
> +        path_to_base_dtb_symbol: Dict mapping common node paths to their=
 symbol
> +            labels in `base.dtb`.
> +        local_phandles: Dict mapping board-only node paths to overlay-lo=
cal
> +            phandles.
> +        ext_fixups: Dict mapping target base symbol labels to lists of
> +            `/__fixups__` entry strings (mutated in place).
> +        ov_local_fixups: Dict mapping `(path, prop_name)` to lists of by=
te
> +            offsets for `/__local_fixups__` (mutated in place).
> +
> +    Returns:
> +        Encoded property value `bytes` with `0xffffffff` placeholders for
> +        external base references and local phandle integers for overlay-=
local
> +        references.
> +    """
> +    if not fixups:
> +        return masked_bytes
> +
> +    val =3D bytearray(masked_bytes)
> +    for off, t_path in fixups:
> +        if base_root.get_node(t_path) is not None:
> +            sym_label =3D path_to_base_dtb_symbol.get(t_path)
> +            if sym_label is None:
> +                raise ValueError(
> +                    f'{dtb_filename}: property {path or "/"}:{prop_name}=
 '
> +                    f'references common base node {t_path or "/"} which =
lacks '
> +                    f'a common symbol in /__symbols__'
> +                )
> +            struct.pack_into('>I', val, off, 0xffffffff)
> +            entry =3D f'/fragment@0/__overlay__{path}:{prop_name}:{off}'
> +            ext_fixups.setdefault(sym_label, []).append(entry)
> +        else:
> +            struct.pack_into('>I', val, off, local_phandles[t_path])
> +            ov_local_fixups.setdefault((path, prop_name), []).append(off)
> +    return bytes(val)
> +
> +
> +def _build_board_dtbo(dtb, base_root, base_dtb_symbols,
> +                      path_to_base_dtb_symbol):
> +    """Construct and flatten the `.dtbo` overlay blob for a single board.
> +
> +    Args:
> +        dtb: `ParsedDtb` instance for the board.
> +        base_root: Normalized `FactoredTree` for `base.dtb`.
> +        base_dtb_symbols: Dict mapping common symbol labels to target pa=
ths.
> +        path_to_base_dtb_symbol: Dict mapping common node paths to their=
 symbol
> +            labels in `base.dtb`.
> +
> +    Returns:
> +        Serialized `.dtbo` overlay `bytes` for `dtb`.
> +    """
> +    dtbo_root =3D devicetree.DeviceTree()
> +    frag_node =3D dtbo_root.create_path('/fragment@0')
> +    frag_node.set_str('target-path', '/')
> +    ov_root =3D frag_node.create_path('__overlay__')
> +
> +    local_phandles =3D _assign_local_phandles(dtb, base_root)
> +    ext_fixups =3D {}
> +    ov_local_fixups =3D {}
> +
> +    for path, node in dtb.root.walk():
> +        base_node =3D base_root.get_node(path)
> +        diff_props =3D [
> +            prop_name for prop_name, raw_val in node.props.items()
> +            if (base_node is None or
> +                base_node.props.get(prop_name) !=3D raw_val or
> +                base_node.fixups.get(prop_name, ()) !=3D
> +                node.fixups.get(prop_name, ()))
> +        ]
> +        if base_node is None or diff_props:
> +            ov_node =3D ov_root.create_path(path)
> +            for prop_name in diff_props:
> +                ov_node.props[prop_name] =3D libfdt.Property(
> +                    prop_name,
> +                    _encode_dtbo_property(
> +                        dtb.filename, path, prop_name,
> +                        bytes(node.props[prop_name]),
> +                        node.fixups.get(prop_name, ()), base_root,
> +                        path_to_base_dtb_symbol, local_phandles, ext_fix=
ups,
> +                        ov_local_fixups,
> +                    ),
> +                )
> +            if path in local_phandles:
> +                ov_node.set_u32('phandle', local_phandles[path])
> +
> +    diff_syms =3D [
> +        (label, t_path)
> +        for label, t_path in dtb.symbols.items()
> +        if base_dtb_symbols.get(label) !=3D t_path
> +    ]
> +    if diff_syms:
> +        sym_node =3D dtbo_root.create_path('/__symbols__')
> +        for label, t_path in diff_syms:
> +            ov_root.create_path(t_path)
> +            sym_node.set_str(label, f'/fragment@0/__overlay__{t_path}')
> +
> +    if ext_fixups:
> +        fixups_node =3D dtbo_root.create_path('/__fixups__')
> +        for label, entries in ext_fixups.items():
> +            fixups_node.set_stringlist(label, entries)
> +
> +    if ov_local_fixups:
> +        ov_lf_root =3D dtbo_root.create_path(
> +            '/__local_fixups__/fragment@0/__overlay__'
> +        )
> +        for (path, prop_name), offs in ov_local_fixups.items():
> +            ov_lf_root.create_path(path).set_u32_list(prop_name, offs)
> +
> +    return bytes(dtbo_root.flatten().as_bytearray())
> +
> +
> +def create_base_dtb_and_overlays(dtbs):
> +    """Compute the base DTB and per-board DTBO blobs from parsed DTBs.
> +
> +    Args:
> +        dtbs: Sequence of `ParsedDtb` instances (at least two).
> +
> +    Returns:
> +        Tuple of `(base_dtb_blob, dtbo_blobs)` where `base_dtb_blob` is =
the
> +        serialized `base.dtb` `bytes` and `dtbo_blobs` is a list of seri=
alized
> +        `.dtbo` `bytes` corresponding 1:1 with `dtbs`.
> +    """
> +    _validate_dtb_headers(dtbs)
> +    base_root =3D _build_base_tree(dtbs)
> +    base_dtb_symbols, path_to_base_dtb_symbol =3D _find_common_symbols(
> +        dtbs, base_root
> +    )
> +    base_dtb_blob =3D _serialize_base_dtb(
> +        base_root, base_dtb_symbols,
> +        dtbs[0].mem_rsv, dtbs[0].boot_cpuid_phys,
> +    )
> +    dtbo_blobs =3D [
> +        _build_board_dtbo(
> +            d, base_root, base_dtb_symbols, path_to_base_dtb_symbol,
> +        )
> +        for d in dtbs
> +    ]
> +    return base_dtb_blob, dtbo_blobs
> +
> +
> +def get_dtbo_output_path(dtb_path, outdir):
> +    """Determine the output `.dtbo` file path for an input `.dtb` path.
> +
> +    Args:
> +        dtb_path: Path to the input `.dtb` file.
> +        outdir: Output directory path, or `None` to place the `.dtbo` al=
ongside
> +            `dtb_path`.
> +
> +    Returns:
> +        Output `.dtbo` file path string.
> +    """
> +    dtb_dir, filename =3D os.path.split(dtb_path)
> +    stem =3D filename[:-4] if filename.endswith('.dtb') else filename
> +    target_dir =3D outdir if outdir is not None else dtb_dir
> +    return os.path.join(target_dir, f'{stem}.dtbo')
> +
> +
> +def parse_args(argv=3DNone):
> +    """Parse command-line arguments.
> +
> +    Args:
> +        argv: Optional list of command-line argument strings (defaults to
> +            `sys.argv[1:]`).
> +
> +    Returns:
> +        Parsed `argparse.Namespace` instance.
> +    """
> +    parser =3D argparse.ArgumentParser(
> +        description=3D(
> +            'Split a set of compiled device tree blobs (.dtb) into a sin=
gle '
> +            'common base .dtb and per-board overlay blobs (.dtbo).'
> +        )
> +    )
> +    parser.add_argument(
> +        '--output-base-dtb',
> +        default=3D'base.dtb',
> +        metavar=3D'FILENAME',
> +        help=3D(
> +            'Output common base .dtb filename (default: base.dtb; placed=
 in '
> +            '--outdir if specified, or current directory otherwise)'
> +        ),
> +    )
> +    parser.add_argument(
> +        '-o', '--outdir',
> +        default=3DNone,
> +        metavar=3D'DIR',
> +        help=3D(
> +            'Output directory for generated .dtbo files and '
> +            '--output-base-dtb (default: alongside each input .dtb for .=
dtbo, '
> +            'current directory for --output-base-dtb)'
> +        ),
> +    )
> +    parser.add_argument(
> +        '-s', '--stats',
> +        action=3D'store_true',
> +        help=3D'Print size statistics summary',
> +    )
> +    parser.add_argument(
> +        'dtbs',
> +        nargs=3D'+',
> +        metavar=3D'DTB',
> +        help=3D'Input .dtb files (at least two required)',
> +    )
> +    args =3D parser.parse_args(argv)
> +    if os.path.dirname(args.output_base_dtb):
> +        parser.error(
> +            '--output-base-dtb must be a filename without directory '
> +            'components; use -o/--outdir to specify the output directory'
> +        )
> +    if len(args.dtbs) < 2:
> +        parser.error('at least two input .dtb files are required')
> +    return args
> +
> +
> +def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs):
> +    """Print uncompressed size savings summary.
> +
> +    Args:
> +        dtbs: Sequence of input `ParsedDtb` instances.
> +        base_dtb_blob: Uncompressed base DTB `bytes`.
> +        dtbo_blobs: Sequence of uncompressed `.dtbo` overlay `bytes`.
> +    """
> +    orig_uncomp =3D sum(len(d.raw_bytes) for d in dtbs)
> +    base_dtb_uncomp =3D len(base_dtb_blob)
> +    dtbo_uncomp =3D sum(len(b) for b in dtbo_blobs)
> +    new_uncomp =3D base_dtb_uncomp + dtbo_uncomp
> +    saved_uncomp =3D orig_uncomp - new_uncomp
> +    pct_uncomp =3D (saved_uncomp / orig_uncomp * 100.0) if orig_uncomp e=
lse 0.0
> +    print(
> +        f'Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} B) -> '
> +        f'base {base_dtb_uncomp:,} B + {len(dtbo_blobs)} overlays '
> +        f'{dtbo_uncomp:,} B =3D {new_uncomp:,} B '
> +        f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
> +    )
> +
> +
> +def factor_dtb_files(args):
> +    """Factor a list of standalone .dtb files into a base .dtb and .dtbo=
 files.
> +
> +    Args:
> +        args: Parsed `argparse.Namespace` from `parse_args()`.
> +    """
> +    input_dtb_paths =3D args.dtbs
> +    dtbs =3D [ParsedDtb(p) for p in input_dtb_paths]
> +
> +    base_dtb_path =3D (
> +        os.path.join(args.outdir, args.output_base_dtb)
> +        if args.outdir is not None
> +        else args.output_base_dtb
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
> +    base_dtb_blob, dtbo_blobs =3D create_base_dtb_and_overlays(dtbs)
> +
> +    if args.outdir:
> +        os.makedirs(args.outdir, exist_ok=3DTrue)
> +    with open(base_dtb_path, 'wb') as f:
> +        f.write(base_dtb_blob)
> +
> +    for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
> +        out_dir =3D os.path.dirname(out_path)
> +        if out_dir:
> +            os.makedirs(out_dir, exist_ok=3DTrue)
> +        with open(out_path, 'wb') as f:
> +            f.write(dtbo_blob)
> +
> +    if args.stats:
> +        _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs)
> +
> +
> +def main(argv=3DNone):
> +    """Run the fdtfactor command-line tool.
> +
> +    Args:
> +        argv: Optional list of command-line argument strings.
> +
> +    Returns:
> +        Integer exit status (`0` on success).
> +    """
> +    args =3D parse_args(argv)
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
> index 15a421e1296a..ed4cd269cec6 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -119,6 +119,7 @@ if get_option('tools') and not wheel_only
> =20
>    install_data(
>      'dtdiff',
> +    'fdtfactor',
>      install_dir: get_option('bindir'),
>      install_mode: 'rwxr-xr-x',
>    )
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index af5d309cf8a9..ea1d35cd8e4e 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -53,10 +53,10 @@ TESTS_DEPFILES =3D $(TESTS:%=3D%.d) \
>  	$(addprefix $(TESTS_PREFIX),testutils.d)
> =20
>  TESTS_CLEANFILES_L =3D $(STD_CLEANFILES) \
> -	*.dtb *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
> +	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
>  	treegen
>  TESTS_CLEANFILES =3D $(TESTS) $(TESTS_CLEANFILES_L:%=3D$(TESTS_PREFIX)%)
> -TESTS_CLEANDIRS_L =3D fs
> +TESTS_CLEANDIRS_L =3D fs *.test.dir
>  TESTS_CLEANDIRS =3D $(TESTS_CLEANDIRS_L:%=3D$(TESTS_PREFIX)%)
> =20
>  .PHONY: tests
> diff --git a/tests/fdtfactor_board1.dts b/tests/fdtfactor_board1.dts
> new file mode 100644
> index 000000000000..c5f4e1672d98
> --- /dev/null
> +++ b/tests/fdtfactor_board1.dts
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/memreserve/ 0xdeadbeef00000000 0x100000;
> +
> +/ {
> +	compatible =3D "test_fdtfactor";
> +	model =3D "board1";
> +	prop-int =3D <0xdeadbeef>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	sn1: subnode@1 {
> +		compatible =3D "subnode1";
> +		reg =3D <1>;
> +		prop-ref =3D <&sn1 0x10 &ssn1 0x20>;
> +
> +		ssn1: subsubnode {
> +			compatible =3D "subsubnode1", "subsubnode";
> +			prop-phandle =3D <&sn1>;
> +		};
> +	};
> +
> +	sn2: subnode@2 {
> +		reg =3D <2>;
> +		prop-maybe-phandle =3D <&sn2>;
> +	};
> +
> +	b1_node: board1-node {
> +		prop-str =3D "board1";
> +		ref-base =3D <&sn1>;
> +		ref-local =3D <&b1_node &b1_child>;
> +
> +		b1_child: child {
> +			reg =3D <1>;
> +		};
> +	};
> +};
> diff --git a/tests/fdtfactor_board2.dts b/tests/fdtfactor_board2.dts
> new file mode 100644
> index 000000000000..32172f755321
> --- /dev/null
> +++ b/tests/fdtfactor_board2.dts
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/memreserve/ 0xdeadbeef00000000 0x100000;
> +
> +/ {
> +	compatible =3D "test_fdtfactor";
> +	model =3D "board2";
> +	prop-int =3D <0xdeadbeef>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	sn1: subnode@1 {
> +		compatible =3D "subnode1";
> +		reg =3D <1>;
> +		prop-ref =3D <&sn1 0x10 &ssn1 0x20>;
> +
> +		ssn1: subsubnode {
> +			compatible =3D "subsubnode1", "subsubnode";
> +			prop-phandle =3D <&sn1>;
> +		};
> +	};
> +
> +	sn2: subnode@2 {
> +		reg =3D <2>;
> +		prop-maybe-phandle =3D <&sn2>;
> +		board2-only-prop =3D "only-on-board2";
> +		board2-ref =3D <&b2_node>;
> +	};
> +
> +	b2_node: board2-node {
> +		prop-str =3D "board2";
> +		ref-base =3D <&ssn1>;
> +		ref-self =3D <&b2_node>;
> +	};
> +};
> diff --git a/tests/fdtfactor_board3.dts b/tests/fdtfactor_board3.dts
> new file mode 100644
> index 000000000000..b93dd2545a0f
> --- /dev/null
> +++ b/tests/fdtfactor_board3.dts
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/memreserve/ 0xdeadbeef00000000 0x100000;
> +
> +/ {
> +	compatible =3D "test_fdtfactor";
> +	model =3D "board3";
> +	prop-int =3D <0x12345678>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	sn1: subnode@1 {
> +		compatible =3D "subnode1";
> +		reg =3D <1>;
> +		prop-ref =3D <&sn1 0x10 &ssn1 0x20>;
> +
> +		ssn1: subsubnode {
> +			compatible =3D "subsubnode1", "subsubnode";
> +			prop-phandle =3D <&sn2>;
> +		};
> +	};
> +
> +	sn2: subnode@2 {
> +		reg =3D <2>;
> +		prop-maybe-phandle =3D <0>;
> +	};
> +
> +	b3_node: board3-node {
> +		prop-str =3D "board3";
> +		ref-base =3D <&sn2>;
> +		ref-self =3D <&b3_node>;
> +	};
> +};
> diff --git a/tests/fdtfactor_board3_shifted.dts b/tests/fdtfactor_board3_=
shifted.dts
> new file mode 100644
> index 000000000000..3ada7bda4545
> --- /dev/null
> +++ b/tests/fdtfactor_board3_shifted.dts
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/memreserve/ 0xdeadbeef00000000 0x100000;
> +
> +/ {
> +	compatible =3D "test_fdtfactor";
> +	model =3D "board3";
> +	prop-int =3D <0x12345678>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	b3_node: board3-node {
> +		prop-str =3D "board3";
> +		ref-self =3D <&b3_node>;
> +		ref-base =3D <&sn2>;
> +	};
> +
> +	sn1: subnode@1 {
> +		compatible =3D "subnode1";
> +		reg =3D <1>;
> +		prop-ref =3D <&sn1 0x10 &ssn1 0x20>;
> +
> +		ssn1: subsubnode {
> +			compatible =3D "subsubnode1", "subsubnode";
> +			prop-phandle =3D <&sn2>;
> +		};
> +	};
> +
> +	sn2: subnode@2 {
> +		reg =3D <2>;
> +		prop-maybe-phandle =3D <0>;
> +	};
> +};
> diff --git a/tests/meson.build b/tests/meson.build
> index 8dbfc3f9e8e2..44497da6cec1 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -143,7 +143,7 @@ run_test_deps =3D [
>    dtc_tools, treegen_dtb, tests_exe,
>  ]
>  if pylibfdt_enabled
> -  run_test_types +=3D 'pylibfdt'
> +  run_test_types +=3D ['pylibfdt', 'fdtfactor']
>    run_test_deps +=3D pylibfdt
>  endif
>  foreach test_type : run_test_types
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index d51a111c7819..166a662708a5 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1183,6 +1183,68 @@ pylibfdt_tests () {
>      tot_tests=3D$((tot_tests + $total_tests))
>  }
> =20
> +fdtfactor_tests () {
> +    for i in 1 2 3; do
> +	run_dtc_test -b 2 -@ -L -I dts -O dtb -o fdtfactor_board${i}.test.dtb \
> +	    "$SRCDIR/fdtfactor_board${i}.dts"
> +    done
> +
> +    # Default mode: factor 3 boards into base.dtb + .dtbo overlays and v=
erify
> +    # that majority properties land in base.dtb and fdtoverlay reconstru=
cts
> +    # each original DTB (including /__local_fixups__, /memreserve/, and
> +    # boot_cpuid_phys).
> +    rm -rf fdtfactor_out.test.dir
> +    run_wrap_test $PYTHON $FDTFACTOR -s --output-base-dtb base.test.dtb \
> +	-o fdtfactor_out.test.dir \
> +	fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb fdtfactor_board3.te=
st.dtb
> +    run_fdtget_test "deadbeef" -tx fdtfactor_out.test.dir/base.test.dtb \
> +	/ prop-int
> +    run_wrap_error_test $DTGET \
> +	fdtfactor_out.test.dir/fdtfactor_board1.test.dtbo \
> +	/fragment@0/__overlay__ prop-int
> +    for i in 1 2 3; do
> +	run_wrap_test $FDTOVERLAY -i fdtfactor_out.test.dir/base.test.dtb \
> +	    -o fdtfactor_out.test.dir/merged${i}.test.dtb \
> +	    fdtfactor_out.test.dir/fdtfactor_board${i}.test.dtbo
> +	run_test dtbs_equal_unordered fdtfactor_board${i}.test.dtb \
> +	    fdtfactor_out.test.dir/merged${i}.test.dtb
> +    done
> +
> +    # Shifted phandles: fdtfactor_board3_shifted.dts defines board3-node=
 before
> +    # subnode@1 so all phandle numbers differ from board1 and board2; ve=
rify
> +    # that fdtfactor normalizes them via /__local_fixups__.
> +    run_dtc_test -b 2 -@ -L -I dts -O dtb -o fdtfactor_board3_shifted.te=
st.dtb \
> +	"$SRCDIR/fdtfactor_board3_shifted.dts"
> +    rm -rf fdtfactor_shift.test.dir
> +    run_wrap_test $PYTHON $FDTFACTOR -o fdtfactor_shift.test.dir \
> +	fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
> +	fdtfactor_board3_shifted.test.dtb
> +    run_wrap_error_test $DTGET \
> +	fdtfactor_shift.test.dir/fdtfactor_board3_shifted.test.dtbo \
> +	/fragment@0/__overlay__/subnode@1 prop-ref
> +    run_wrap_test $FDTOVERLAY -i fdtfactor_shift.test.dir/base.dtb \
> +	-o fdtfactor_shift.test.dir/merged3.test.dtb \
> +	fdtfactor_shift.test.dir/fdtfactor_board3_shifted.test.dtbo
> +    run_test dtbs_equal_unordered fdtfactor_board3.test.dtb \
> +	fdtfactor_shift.test.dir/merged3.test.dtb
> +
> +    # Legacy linux,phandle properties (dtc -H both / -H legacy), overlay=
 .dtbo
> +    # inputs, and inputs lacking /__local_fixups__ are rejected.
> +    run_dtc_test -H both -@ -L -I dts -O dtb \
> +	-o fdtfactor_legacy_ph.test.dtb "$SRCDIR/fdtfactor_board1.dts"
> +    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_legacy.test.dir \
> +	fdtfactor_legacy_ph.test.dtb fdtfactor_board2.test.dtb
> +    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_legacy.test.dir \
> +	fdtfactor_out.test.dir/fdtfactor_board1.test.dtbo \
> +	fdtfactor_board2.test.dtb
> +    for i in 1 2 3; do
> +	run_dtc_test -b 2 -@ -I dts -O dtb -o fdtfactor_board${i}.nolf.test.dtb=
 \
> +	    "$SRCDIR/fdtfactor_board${i}.dts"
> +    done
> +    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_legacy.test.dir \
> +	fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
> +}
> +
>  while getopts "vt:me" ARG ; do
>      case $ARG in
>  	"v")
> @@ -1203,14 +1265,15 @@ done
>  if [ -z "$TESTSETS" ]; then
>      TESTSETS=3D"libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtdump fdto=
verlay"
> =20
> -    # Test pylibfdt if the libfdt Python module is available.
> +    # Test pylibfdt and fdtfactor if the libfdt Python module is availab=
le.
>      if ! $no_python; then
> -        TESTSETS=3D"$TESTSETS pylibfdt"
> +        TESTSETS=3D"$TESTSETS pylibfdt fdtfactor"
>      fi
>  fi
> =20
>  # Make sure we don't have stale blobs lying around
> -rm -f *.test.dtb *.test.dts
> +rm -f *.test.dtb *.test.dtbo *.test.dts
> +rm -rf *.test.dir
> =20
>  for set in $TESTSETS; do
>      case $set in
> @@ -1241,6 +1304,9 @@ for set in $TESTSETS; do
>          "fdtoverlay")
>  	    fdtoverlay_tests
>  	    ;;
> +	"fdtfactor")
> +	    fdtfactor_tests
> +	    ;;
>      esac
>  done
> =20
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
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--jPK+xiipKLc4/Bf3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrz7CAACgkQzQJF27ox
2GcdlA//d+neIcaBsNBJh+arewpXJXIx3XWutxGCMaT+2G7WlpdxxbSlsVRECtKT
eO8cqpfHQ5BXQPY+R2xeVLNjV9wO2JI3/E+ZG16U4vhvNqkd/cmwoym/ZfXR/ea0
i+T8e+j1Uvv+YbaMB/S+gKj/4YxJC9qNu2gsey8JBTERzczI+WQqJPuNbgY1Ewus
PcOsJbs1tqbGLZqUYlU6u26ijPYHYGRaW4UK71U1hF6hvq4Qpaqf7h/zCPpuNU6r
48x4PYHdk+K9u/gZ/xHb0NanoikA4QhlsMRVi2YsHsu21cXEeEADVgWSTiqzz+LF
/alUbWRpqfWmhrnVZ0rxxZBRyn80IPMKJtQV1NhNbbfUtWjNQTIOUmmpVqAKxBgb
FjryIeQUbehT+bhazTfNsYK2ytFKLligecW4qpu6FbSoNK13B28CNvVHPI5meHHm
/0o6IufwSrDY3IDw7gT7Z+0wRgaw35zBQxejX2AB7hkePXs7b4DfljJ3EzJqxUoc
y9W7skmiaY6J7Zgw+9k0EZgqs1YGuzu6CextV/y8isCGxUj7hTn8sxS7IJorI0oq
foNLQAbHi3nf2iBXl+KK6zua1ykLhfjcYv6qT8grthqrBbrbdPc3ZHRuiWP1D7Wo
PatXwe2toA8suNE3rHJ/2feqpPhAa2GUkMOeuQQEVwSxqn/s6XY=
=IwgP
-----END PGP SIGNATURE-----

--jPK+xiipKLc4/Bf3--
