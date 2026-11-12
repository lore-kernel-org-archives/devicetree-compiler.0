Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450711;
	b=qed587aqDam+ghHz0Xdtex7Z//uu6N3kVg2Tn4E4uT/rh20cSgKZXmfv66Ob9tND1IrR
	 9KPweIdsFRk6htRaDuqpm2TyTmnIMT6BB0ZQ5EOk52JZvihD4e6WFOGPJ1nyxtvLxI2vl
	 PyZ3Nts0xbEn68xJ1qvnD1zLoEJAxl4PMxtKUkVruMADi1GbKpVOc9ezZGTvrzWEB62pW
	 ItDYVNsGEWE/W+SqKtsNiGLHmcKJvLF0RoaY5zhcresVGWpTVLsJ62Kg92rbP/Aq9wXeC
	 AI/1wgooxQr4LbI0H+2SfRO5us39dV4HpMolJP389M4/JUSNMarwFvUmRoUgtPFgC5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450711;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=HU3BqzpqOuBvfWgBgsI2oS9CJzZRi1EJAkjWDW9tt3c=;
	b=KSLx+knqHOKbHDpcgKsmTPkrsbliov0R6TltHkgnWMQpyiuTCiVoY09MYpUip9gDmHpa
	 gZZKufnipToXnh1blJGAUjPUy5BxzIMSOQUo3OPKj6103aO2pb0y4VhmKJt0wkn0OI8OL
	 L+us5khgcKU7K9LzIwqFCY4M0+DjIbvxAJxhcDkIhXhV8D+ncKfdsDnbxQlLedLBaCh0z
	 yb52XlyzXDkQ3REgVRUlcrgC8mlX4NULAwI3c2HEUwtmUNn35vZ2GEPkTcABtLhU5Yk3y
	 9txg0/t1tpKF17OoWrnVQTDz+dMyH2dg9mlrC0hZwooUoyfKgz79nxYW7scWTTSVTTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=pu6ZDcyF;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3E8606A324;
	Thu, 12 Nov 2026 02:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D3E8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=pu6ZDcyF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794450707;
	bh=HU3BqzpqOuBvfWgBgsI2oS9CJzZRi1EJAkjWDW9tt3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pu6ZDcyFgc1qEhZ0GsUy5flJUY9AyITM918gAtZStwlkCl5XpDFJVKrA2lAN/yftV
	 SPqNy8TheM+Vh9eXzijYYjExaz6PwAv4JEgvlI5eeBzZR2cb5LLoomsy/s3/uxCr5K
	 4q8JZnSiAioQeEGjOJ0EakcUB6wHbFZQri3jrdbB+5GHHId91WkWZ2u9mt2EZCEALh
	 ULIrwTCcdykLdt6inl9gSn2URXWtRsBJr/J+gSwVEQ8RJL30J1lIqVo+iL8JkRva3a
	 bLRRXGVcnyVT/LYOyv08qIBh69ElnFr06hijL29DTjZ1JNc2JtTrsrVNREvp/dQCmK
	 OS2u60iM5lG4Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQ4CR2kFCz4wMH; Thu, 12 Nov 2026 13:31:47 +1100 (AEDT)
Date: Thu, 12 Nov 2026 13:31:40 +1100
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
Subject: Re: [PATCH v3 15/15] fdtfactor: Add compiled FIT factoring support
Message-ID: <avUlA_KSHKmmSz5p@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-16-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="TDfrExIcPIWRrACo"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-16-dianders@chromium.org>

--TDfrExIcPIWRrACo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:22PM -0800, Douglas Anderson wrote:
> Bootloaders such as depthcharge on Chromebooks and U-Boot use Flattened
> Image Trees (FITs) to bundle a kernel image with multiple board FDT
> blobs (`fdt-1`, `fdt-2`, ...) and per-board configuration nodes.
>=20
> Add `-F`/`--fit`, `--outfile`, and `--single-base-dtb` options to
> `fdtfactor` to factor a compiled FIT directly:
>=20
> - Parse non-overlay `type =3D "flat_dt"` nodes under `/images`,
>   decompressing their `data` blobs according to their `compression`
>   property (`none`, `lz4`, `lzma`, `xz`, `gzip`).
> - Reject FITs containing `signature*` subnodes under `/images/*` or
>   `/configurations/*`, as modifying FDT blobs and configurations would
>   invalidate cryptographic signatures.
> - Partition the `flat_dt` blobs into compatible factor groups (by
>   compression, architecture, FDT header fields, and node-path overlap)
>   so a single FIT containing multiple board/SoC families produces a
>   separate `fdt-base-1`, `fdt-base-2`, etc. for each family.
> - Support `--single-base-dtb` to force all `flat_dt` blobs into a single
>   base DTB regardless of node-path overlap, failing only if their FDT
>   headers, architecture, or compression differ.
> - Insert each `fdt-base-N` node into `/images`, replace each factored
>   `fdt-*` node's `data` with its compressed `.dtbo` overlay, recompute
>   any `hash*` subnode digests, and prepend `fdt-base-N` to each matching
>   configuration's `fdt` string list while preserving all other
>   configuration properties (`description`, `compatible`, etc.,
>   populating `compatible` from the board DTB's root node when omitted)
>   and any pre-existing overlay entries.
>=20
> Add uncompressed, LZ4-compressed multi-family, signed-FIT rejection, and
> `--single-base-dtb` FIT test cases to the `fdtfactor` test suite.
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v3:
> - Use "FIT" instead of "FIT image" in documentation, comments, and
>   commit messages (Simon Glass)
> - Update for DeviceTree and --output-base-dtb (Simon Glass, David
>   Gibson)
>=20
> Changes in v2:
> - Rename -f/--fit and -F/--fit-out to -F/--fit and --outfile and clarify
>   FIT mode in the --help description (David Gibson, Simon Glass)
> - Reject signed FIT images with signature* subnodes (Simon Glass)
> - Use '<base-node-name>.dtb' for FIT base FDT descriptions instead of
>   common-prefix heuristics (Simon Glass)
> - Compare FIT group node overlap against the group's common node set
>   instead of only the first entry (Simon Glass)
> - Document in README.md that U-Boot's boot_get_fdt_fit() currently
>   requires FIT overlays to be uncompressed (Simon Glass)
>=20
>  README.md                  |  17 ++
>  fdtfactor                  | 577 +++++++++++++++++++++++++++++++++++--
>  tests/Makefile.tests       |   2 +-
>  tests/fdtfactor_lz4.its    | 109 +++++++
>  tests/fdtfactor_other1.dts |  33 +++
>  tests/fdtfactor_other2.dts |  33 +++
>  tests/fdtfactor_test.its   | 109 +++++++
>  tests/run_tests.sh         | 158 +++++++++-
>  8 files changed, 1011 insertions(+), 27 deletions(-)
>  create mode 100644 tests/fdtfactor_lz4.its
>  create mode 100644 tests/fdtfactor_other1.dts
>  create mode 100644 tests/fdtfactor_other2.dts
>  create mode 100644 tests/fdtfactor_test.its
>=20
> diff --git a/README.md b/README.md
> index a3d1ad8c58f3..7e2b99818730 100644
> --- a/README.md
> +++ b/README.md
> @@ -129,6 +129,7 @@ Basic usage:
> =20
>  ```
>  $ fdtfactor -o out_dir board1.dtb board2.dtb board3.dtb
> +$ fdtfactor -F image.fit --outfile image.factored.fit
>  ```
> =20
>  Options:
> @@ -144,6 +145,22 @@ Options:
>  * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
>    `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` =
files,
>    current directory for `--output-base-dtb`).

Even though one's a directory and one's a file, using different output
options for the FIT/non-FIT cases seems kind of awkward to me.

> +* `-F`, `--fit`: Factor `/images/fdt-*` blobs inside a compiled FIT
> +  (creating `/images/fdt-base-1`, `/images/fdt-base-2`, ... per compatib=
le
> +  board/SoC family grouped by FDT headers and `>=3D 50%` node-path overl=
ap,
> +  converting each `/images/fdt-N` node into a `.dtbo` overlay, updating
> +  `/configurations/conf-*` `fdt` and `compatible` properties, and
> +  recalculating `/images/*/hash-*` digests). Each factored base DTB and
> +  `.dtbo` overlay preserves the `compression` setting of its `/images/fd=
t-*`
> +  node (note: while bootloaders such as depthcharge decompress compressed
> +  FIT overlays, U-Boot's `boot_get_fdt_fit()` currently only decompresses
> +  the base DTB and requires FIT overlays to be uncompressed). Signed FITs
> +  with `signature*` subnodes are rejected because modifying FDT blobs
> +  and configurations would invalidate cryptographic signatures.
> +* `--outfile`: Output FIT path when `--fit` is used (default:
> +  overwrite `--fit` in place).

That's a lot of fiddly detail to fit in the description of a single
option.  Maybe move it out into its own doc section.

> +* `--single-base-dtb`: Force a single `/images/fdt-base-1` across all FD=
Ts
> +  in `--fit` mode rather than grouping by node-path overlap.
>  * `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the genera=
ted
>    `base.dtb` and final reconstructed device trees. By default, `fdtfacto=
r`
>    preserves `/__local_fixups__` on `base.dtb` so that when `fdt_overlay_=
apply()`
> diff --git a/fdtfactor b/fdtfactor
> index 9bc8bfde2038..379a27da139d 100755
> --- a/fdtfactor
> +++ b/fdtfactor
> @@ -8,16 +8,25 @@ properties shared across the inputs into a single commo=
n `base.dtb` and emits a
>  small per-board `.dtbo` overlay for each input. Applying a board's `.dtb=
o` to
>  `base.dtb` (e.g., via `fdtoverlay` or `fdt_overlay_apply()`) reconstruct=
s the
>  original board DTB.
> +
> +Alternatively, `fdtfactor -F <image.fit>` can rewrite a compiled U-Boot /
> +ChromeOS Flattened Image Tree (FIT) in place (or to `--outfile`), factor=
ing its
> +embedded `/images/fdt-*` blobs into base DTBs (`fdt-base-1`, `fdt-base-2=
`, ...)
> +and overlays while updating `/configurations/conf-*` `fdt` and `compatib=
le`
> +properties and recalculating `/images/*/hash-*` digests.
>  """
> =20
>  import argparse
>  from collections import Counter
> +import copy
>  import gzip
> +import hashlib
>  import lzma
>  import os
>  import struct
>  import subprocess
>  import sys
> +import zlib
> =20
>  import devicetree
>  import libfdt
> @@ -247,6 +256,10 @@ def _is_dtbo_overlay(fdt):
>      )
> =20
> =20
> +class OverlayBlobError(ValueError):
> +    """Raised when an input FDT blob is already a `.dtbo` overlay."""
> +
> +
>  class FactoredTree(devicetree.DeviceTree):
>      """DeviceTree subclass with normalized phandle and fixup attributes.
> =20
> @@ -283,17 +296,24 @@ class ParsedDtb:
>        independent of numeric phandle numbering.
>      """
> =20
> -    def __init__(self, filename):
> -        """Parse an input FDT file into a normalized FactoredTree.
> +    def __init__(self, filename, file_bytes=3DNone, comp=3DNone):
> +        """Parse an input FDT file or blob into a normalized FactoredTre=
e.
> =20
>          Args:
> -            filename: File path of the `.dtb` (or compressed `.dtb.*`) f=
ile.
> +            filename: File path (or display name when `file_bytes` is gi=
ven).
> +            file_bytes: Optional raw (compressed or uncompressed) FDT by=
tes; if
> +                None, read from `filename`.
> +            comp: Optional explicit compression algorithm name, or None =
to
> +                auto-detect via `decompress_blob()`.
>          """
>          self.filename =3D filename
> -        with open(filename, 'rb') as f:
> -            file_bytes =3D f.read()
> +        if file_bytes is None:
> +            with open(filename, 'rb') as f:
> +                file_bytes =3D f.read()
>          self.compressed_size =3D len(file_bytes)
> -        raw_bytes, self.compression =3D decompress_blob(file_bytes, file=
name)
> +        raw_bytes, self.compression =3D decompress_blob(
> +            file_bytes, filename, comp=3Dcomp
> +        )
>          self.raw_bytes =3D raw_bytes
> =20
>          try:
> @@ -303,7 +323,7 @@ class ParsedDtb:
>              raise ValueError(f'{filename}: Invalid FDT blob ({exc})') fr=
om exc
> =20
>          if _is_dtbo_overlay(fdt):
> -            raise ValueError(
> +            raise OverlayBlobError(

This change seems unrelated to the rest.

>                  f'{filename}: Input is already a DTB overlay (.dtbo)'
>              )
> =20
> @@ -885,6 +905,460 @@ def create_base_dtb_and_overlays(dtbs, strip_local_=
fixups=3DFalse):
>      return base_dtb_blob, dtbo_blobs
> =20
> =20
> +# ----------------------------------------------------------------------=
-----
> +# Compiled FIT factoring (targeting depthcharge / coreboot / U-Boot)
> +# ----------------------------------------------------------------------=
-----
> +
> +def _compute_fit_hash(algo_name, data_bytes):
> +    """Compute a binary hash digest for a FIT `hash*` subnode.
> +
> +    Args:
> +        algo_name: Hash algorithm name (e.g., `'crc32'`, `'sha1'`, `'sha=
256'`).
> +        data_bytes: Input `bytes` to hash.
> +
> +    Returns:
> +        Binary hash digest `bytes`.
> +    """
> +    if algo_name =3D=3D 'crc32':
> +        return struct.pack('>I', zlib.crc32(data_bytes) & 0xffffffff)
> +    h =3D hashlib.new(algo_name)
> +    h.update(data_bytes)
> +    return h.digest()
> +
> +
> +def _update_fit_hashes(img_node):
> +    """Recompute `value` properties on any FIT `hash*` subnodes of `img_=
node`.
> +
> +    Args:
> +        img_node: `DeviceTree` for a `/images/*` subnode whose `hash*` c=
hild
> +            nodes should be updated in place from `img_node.props['data'=
]`.
> +    """
> +    data_prop =3D img_node.props.get('data')
> +    if data_prop is None:
> +        return
> +    data_bytes =3D bytes(data_prop)
> +    for sub_name, sub_node in img_node.children.items():
> +        if not sub_name.startswith('hash'):
> +            continue
> +        if 'algo' not in sub_node.props:
> +            raise ValueError(
> +                f'FIT hash subnode {sub_name!r} lacks an algo property'
> +            )
> +        algo =3D sub_node.get_str('algo')
> +        sub_node.props['value'] =3D libfdt.Property(
> +            'value', _compute_fit_hash(algo, data_bytes)

This assumes the FIT naming of hash algorithms is identical to the
hashlib one, which seems a bit risky.

> +        )
> +
> +
> +def _is_dtb_filename_desc(desc):
> +    """Return True if `desc` looks like a `.dtb` filename.
> +
> +    Args:
> +        desc: Description string from a FIT `/images/fdt-*` node.
> +
> +    Returns:
> +        True if `desc` has no spaces and ends with `.dtb` (optionally fo=
llowed
> +        by a recognized compression suffix), False otherwise.
> +    """
> +    if not desc or ' ' in desc:
> +        return False
> +    _, stem, desc_comp =3D split_dtb_filename(desc)
> +    return os.path.basename(desc) =3D=3D f'{stem}.dtb{COMP_TO_EXT[desc_c=
omp]}'
> +
> +
> +def group_fit_dtbs(fdt_entries):
> +    """Partition FIT `flat_dt` entries into compatible factor groups.
> +
> +    DTBs are grouped by `(compression, arch, load, entry, boot_cpuid_phy=
s,

Why should compression play a role in the grouping?  The internal dtb
data doesn't depend on that.

I'm not sure what the 'load' and 'entry' fields do, so it's not
obvious to me whether they make sense here either.

> +    mem_rsv)` and node-path overlap (>=3D 50%) against the group's commo=
n node

Overlap >=3D 50% seems a very arbitrary condition here.

> +    set so that a single FIT containing multiple board/SoC families
> +    produces one base DTB per family.
> +
> +    Args:
> +        fdt_entries: Sequence of FIT `flat_dt` entry dicts from
> +            `_extract_fit_fdt_entries()`.
> +
> +    Returns:
> +        List of entry-dict lists, one per compatible group.
> +    """
> +    groups =3D []
> +    for entry in fdt_entries:
> +        dtb =3D entry['dtb']
> +        header_key =3D (
> +            dtb.compression,
> +            *(entry['node'].props.get(p) for p in ('arch', 'load', 'entr=
y')),
> +            dtb.boot_cpuid_phys,
> +            dtb.mem_rsv,
> +        )
> +        entry_nodes =3D {path for path, _ in dtb.root.walk()}
> +
> +        placed =3D False
> +        for grp in groups:
> +            if grp['key'] !=3D header_key:
> +                continue
> +            common_nodes =3D grp['common_nodes']
> +            union_len =3D len(entry_nodes | common_nodes)
> +            overlap =3D (
> +                len(entry_nodes & common_nodes) / union_len
> +                if union_len
> +                else 1.0
> +            )
> +            if overlap >=3D 0.5:
> +                grp['common_nodes'] &=3D entry_nodes
> +                grp['entries'].append(entry)
> +                placed =3D True
> +                break

Reimplementing the common path analysis, rather than somehow utilizing
the calculations you already implemented in the factoring itself seems
unfortunate.

> +
> +        if not placed:
> +            groups.append({
> +                'key': header_key,
> +                'common_nodes': set(entry_nodes),
> +                'entries': [entry],
> +            })
> +
> +    return [grp['entries'] for grp in groups]
> +
> +
> +def _extract_fit_fdt_entries(fit_in_path, images_node, configs_node):
> +    """Extract and parse non-overlay `flat_dt` entries from `/images`.
> +
> +    Args:
> +        fit_in_path: Input FIT path (for error reporting).
> +        images_node: `DeviceTree` for the FIT `/images` node.
> +        configs_node: `DeviceTree` for the FIT `/configurations` node.
> +
> +    Returns:
> +        List of dicts (`{'name', 'node', 'dtb'}`) for all non-overlay
> +        `flat_dt` image subnodes.
> +    """
> +    if any(name.startswith('fdt-base-') for name in images_node.children=
):
> +        raise ValueError(
> +            f'{fit_in_path}: FIT already contains fdt-base-* node(s)'
> +        )
> +
> +    for conf_name, conf_node in configs_node.children.items():
> +        for sub_name in conf_node.children:
> +            if sub_name.startswith(('signature', 'hash')):
> +                raise ValueError(
> +                    f'{fit_in_path}: /configurations/{conf_name}/{sub_na=
me} '
> +                    f'is not supported; sign the FIT after factoring'
> +                )
> +
> +    fdt_entries =3D []
> +    for img_name, img_node in images_node.children.items():
> +        if ('data-offset' in img_node.props or
> +                'data-position' in img_node.props):
> +            raise ValueError(
> +                f'{fit_in_path}: /images/{img_name} uses external data '
> +                f'(data-offset/data-position), which is not supported'
> +            )
> +        for sub_name in img_node.children:
> +            if sub_name.startswith('signature'):
> +                raise ValueError(
> +                    f'{fit_in_path}: /images/{img_name}/{sub_name} is no=
t '
> +                    f'supported; sign the FIT after factoring'
> +                )
> +        img_type =3D img_node.get_str('type') if 'type' in img_node.prop=
s else ''
> +        if img_type !=3D 'flat_dt':
> +            continue
> +        raw_data =3D img_node.props.get('data')
> +        if raw_data is None:
> +            raise ValueError(
> +                f'{fit_in_path}: /images/{img_name} lacks a data propert=
y'
> +            )
> +        node_label =3D f'{fit_in_path}:/images/{img_name}'
> +        comp_prop =3D (
> +            img_node.get_str('compression')
> +            if 'compression' in img_node.props
> +            else 'none'
> +        ) or 'none'
> +        try:
> +            parsed_dtb =3D ParsedDtb(
> +                node_label, file_bytes=3Dbytes(raw_data), comp=3Dcomp_pr=
op
> +            )
> +        except OverlayBlobError:
> +            continue
> +
> +        fdt_entries.append({
> +            'name': img_name,
> +            'node': img_node,
> +            'dtb': parsed_dtb,
> +        })
> +
> +    if len(fdt_entries) < 2:
> +        raise ValueError(
> +            'FIT must contain at least two non-overlay flat_dt '
> +            'nodes to factor'
> +        )
> +
> +    return fdt_entries
> +
> +
> +def _partition_fit_fdt_entries(fdt_entries, single_base_dtb):
> +    """Partition `fdt_entries` into factorable groups and validate const=
raints.
> +
> +    Args:
> +        fdt_entries: List of FIT `flat_dt` entry dicts from
> +            `_extract_fit_fdt_entries()`.
> +        single_base_dtb: If True, require all `fdt_entries` to share a s=
ingle
> +            base DTB group rather than grouping by node-path overlap.
> +
> +    Returns:
> +        List of factorable entry-dict groups (each containing at least 2
> +        entries).
> +    """
> +    if single_base_dtb:
> +        ref_entry =3D fdt_entries[0]
> +        for entry in fdt_entries[1:]:
> +            if entry['dtb'].compression !=3D ref_entry['dtb'].compressio=
n:
> +                raise ValueError(
> +                    f'--single-base-dtb requires all FIT flat_dt nodes t=
o use '
> +                    f'the same compression: {ref_entry["name"]} has '
> +                    f'{ref_entry["dtb"].compression!r} vs {entry["name"]=
} '
> +                    f'{entry["dtb"].compression!r}'
> +                )
> +            for prop in ('arch', 'load', 'entry'):
> +                if (entry['node'].props.get(prop) !=3D
> +                        ref_entry['node'].props.get(prop)):
> +                    raise ValueError(
> +                        f'--single-base-dtb requires all FIT flat_dt nod=
es to '
> +                        f'use the same {prop} property: {ref_entry["name=
"]} vs '
> +                        f'{entry["name"]}'
> +                    )
> +        return [fdt_entries]
> +
> +    groups =3D group_fit_dtbs(fdt_entries)
> +    factorable_groups =3D [g for g in groups if len(g) >=3D 2]
> +    if not factorable_groups:
> +        raise ValueError(
> +            'FIT must contain at least two compatible '
> +            'flat_dt nodes to factor'
> +        )
> +    for g in groups:
> +        if len(g) =3D=3D 1:
> +            print(
> +                f'Note: FIT flat_dt node {g[0]["name"]} has no '
> +                f'compatible peers and will be left unfactored',
> +                file=3Dsys.stderr,
> +            )
> +    return factorable_groups
> +
> +
> +def _factor_fit_group(entries, base_dtb_node_name, strip_local_fixups):
> +    """Factor one compatible group of FIT `flat_dt` entries.
> +
> +    Args:
> +        entries: List of FIT `flat_dt` entry dicts in this compatible gr=
oup.
> +        base_dtb_node_name: Name for the new `/images/<base_dtb_node_nam=
e>`
> +            node (e.g., `'fdt-base-1'`).
> +        strip_local_fixups: If True, omit `/__local_fixups__` from the
> +            generated base DTB.
> +
> +    Returns:
> +        Tuple of `(base_dtb_node, stat_args)` where `base_dtb_node` is t=
he
> +        constructed `DeviceTree` for `/images/<base_dtb_node_name>` and
> +        `stat_args` is an argument tuple for `_print_dtb_stats()`.
> +    """
> +    group_dtbs =3D [e['dtb'] for e in entries]
> +    comp =3D group_dtbs[0].compression
> +
> +    base_dtb_blob, dtbo_blobs =3D create_base_dtb_and_overlays(
> +        group_dtbs,
> +        strip_local_fixups=3Dstrip_local_fixups,
> +    )
> +
> +    base_dtb_comp_bytes =3D compress_blob(
> +        base_dtb_blob, comp, filename=3Df'/images/{base_dtb_node_name}'
> +    )
> +    base_dtb_node =3D copy.deepcopy(entries[0]['node'])
> +    for prop in ('phandle', 'compatible'):
> +        base_dtb_node.props.pop(prop, None)
> +    base_dtb_node.children =3D {
> +        k: v
> +        for k, v in base_dtb_node.children.items()
> +        if k.startswith('hash')
> +    }
> +    for sub_node in base_dtb_node.children.values():
> +        sub_node.props.pop('phandle', None)
> +    if 'description' in base_dtb_node.props:
> +        base_dtb_node.set_str(
> +            'description',
> +            f'{base_dtb_node_name}.dtb{COMP_TO_EXT[comp]}',
> +        )
> +    base_dtb_node.props['data'] =3D libfdt.Property('data', base_dtb_com=
p_bytes)
> +    if 'compression' in base_dtb_node.props or comp !=3D 'none':
> +        comp_prop =3D 'lz4' if comp =3D=3D 'lz4_legacy' else comp
> +        base_dtb_node.set_str('compression', comp_prop)
> +    _update_fit_hashes(base_dtb_node)
> +
> +    dtbo_comp_sizes =3D []
> +    for entry, dtbo_blob in zip(entries, dtbo_blobs):
> +        img_node =3D entry['node']
> +        dtbo_comp_bytes =3D compress_blob(
> +            dtbo_blob, comp, filename=3Df'/images/{entry["name"]}'
> +        )
> +        dtbo_comp_sizes.append(len(dtbo_comp_bytes))
> +
> +        if 'description' in img_node.props:
> +            old_desc =3D img_node.get_str('description')
> +            if _is_dtb_filename_desc(old_desc):
> +                img_node.set_str(
> +                    'description',
> +                    get_dtbo_output_path(old_desc, None, comp=3Dcomp),
> +                )
> +
> +        # Strip 'load' and 'entry' from overlay image nodes so bootloade=
rs do
> +        # not load overlays at the base FDT address and overwrite the ba=
se FDT.
> +        for prop in ('load', 'entry'):
> +            img_node.props.pop(prop, None)
> +
> +        img_node.props['data'] =3D libfdt.Property('data', dtbo_comp_byt=
es)
> +        _update_fit_hashes(img_node)
> +
> +    stat_args =3D (
> +        group_dtbs,
> +        base_dtb_blob,
> +        dtbo_blobs,
> +        comp,
> +        len(base_dtb_comp_bytes),
> +        dtbo_comp_sizes,
> +        f'[{base_dtb_node_name}] ',
> +    )
> +    return base_dtb_node, stat_args
> +
> +
> +def _update_fit_images_and_configs(images_node, configs_node,
> +                                   insert_before_first, fdt_to_base_dtb):
> +    """Insert `fdt-base-*` nodes into `/images` and update `/configurati=
ons`.
> +
> +    Args:
> +        images_node: `DeviceTree` for `/images` (mutated in place).
> +        configs_node: `DeviceTree` for `/configurations` (mutated in pla=
ce).
> +        insert_before_first: Dict mapping the first `fdt-*` subnode name=
 of
> +            each group to `(base_dtb_node_name, base_dtb_node)`.
> +        fdt_to_base_dtb: Dict mapping each factored `fdt-*` subnode name=
 to
> +            `(base_dtb_node_name, orig_parsed_dtb)`.
> +    """
> +    new_images_children =3D {}
> +    for img_name, img_node in images_node.children.items():
> +        if img_name in insert_before_first:
> +            b_name, b_node =3D insert_before_first[img_name]
> +            new_images_children[b_name] =3D b_node
> +        new_images_children[img_name] =3D img_node
> +    images_node.children =3D new_images_children
> +
> +    for conf_name, conf_node in configs_node.children.items():
> +        if 'fdt' not in conf_node.props:
> +            continue
> +        fdt_list =3D conf_node.get_stringlist('fdt')
> +        if not fdt_list:
> +            continue
> +        primary_fdt =3D fdt_list[0]
> +        for extra_fdt in fdt_list[1:]:
> +            if extra_fdt in fdt_to_base_dtb:
> +                raise ValueError(
> +                    f'/configurations/{conf_name} lists factored flat_dt=
 '
> +                    f'{extra_fdt!r} after the primary FDT'
> +                )
> +        if primary_fdt in fdt_to_base_dtb:
> +            base_dtb_name, orig_dtb =3D fdt_to_base_dtb[primary_fdt]
> +            conf_node.set_stringlist('fdt', [base_dtb_name] + fdt_list)
> +            # If the configuration omitted 'compatible' (relying on the
> +            # bootloader reading root 'compatible' from fdt_list[0]), co=
py the
> +            # board's root 'compatible' property onto the configuration =
node
> +            # now that fdt_list[0] is the shared base DTB.
> +            if 'compatible' not in conf_node.props:
> +                root_compat =3D orig_dtb.root.props.get('compatible')
> +                if root_compat is not None:
> +                    conf_node.props['compatible'] =3D copy.copy(root_com=
pat)
> +
> +
> +def factor_fit(fit_in_path, fit_out_path, strip_local_fixups=3DFalse,
> +               single_base_dtb=3DFalse, stats=3DFalse):
> +    """Factor all `flat_dt` images in a compiled FIT into base + overlay=
s.
> +
> +    Args:
> +        fit_in_path: Path to the input compiled FIT.
> +        fit_out_path: Path where the factored FIT should be written.
> +        strip_local_fixups: If True, omit `/__local_fixups__` from gener=
ated
> +            base DTBs.
> +        single_base_dtb: If True, force all `flat_dt` nodes into a single
> +            `fdt-base-1` base DTB.
> +        stats: If True, print per-group and overall FIT size savings.
> +    """
> +    with open(fit_in_path, 'rb') as f:
> +        orig_fit_bytes =3D f.read()
> +
> +    try:
> +        orig_fit_fdt =3D libfdt.FdtRo(orig_fit_bytes)
> +        libfdt.check_err(
> +            libfdt.fdt_check_full(orig_fit_fdt._fdt, len(orig_fit_bytes))
> +        )
> +    except libfdt.FdtException as exc:
> +        raise ValueError(f'{fit_in_path}: Invalid FDT blob ({exc})') fro=
m exc
> +
> +    fit_root =3D devicetree.DeviceTree.unflatten(orig_fit_fdt)
> +    images_node =3D fit_root.children.get('images')
> +    configs_node =3D fit_root.children.get('configurations')
> +    if images_node is None or configs_node is None:
> +        raise ValueError(
> +            f'{fit_in_path}: FIT must contain /images and '
> +            f'/configurations nodes'
> +        )
> +
> +    fdt_entries =3D _extract_fit_fdt_entries(
> +        fit_in_path, images_node, configs_node
> +    )
> +    factorable_groups =3D _partition_fit_fdt_entries(
> +        fdt_entries, single_base_dtb
> +    )
> +
> +    fdt_to_base_dtb =3D {}
> +    insert_before_first =3D {}
> +    group_stats =3D []
> +
> +    for idx, entries in enumerate(factorable_groups, 1):
> +        base_dtb_node_name =3D f'fdt-base-{idx}'
> +        base_dtb_node, stat_args =3D _factor_fit_group(
> +            entries, base_dtb_node_name, strip_local_fixups
> +        )
> +        insert_before_first[entries[0]['name']] =3D (
> +            base_dtb_node_name, base_dtb_node
> +        )
> +        for entry in entries:
> +            fdt_to_base_dtb[entry['name']] =3D (base_dtb_node_name, entr=
y['dtb'])
> +        group_stats.append(stat_args)
> +
> +    _update_fit_images_and_configs(
> +        images_node, configs_node, insert_before_first, fdt_to_base_dtb
> +    )
> +
> +    new_fit_fdt =3D fit_root.flatten(
> +        mem_rsv=3Dorig_fit_fdt.get_mem_rsv_list(),
> +        boot_cpuid_phys=3Dorig_fit_fdt.boot_cpuid_phys(),
> +    )
> +    new_fit_bytes =3D bytes(new_fit_fdt.as_bytearray())
> +
> +    out_dir =3D os.path.dirname(fit_out_path)
> +    if out_dir:
> +        os.makedirs(out_dir, exist_ok=3DTrue)
> +    with open(fit_out_path, 'wb') as f:
> +        f.write(new_fit_bytes)
> +
> +    if stats:
> +        for stat_args in group_stats:
> +            _print_dtb_stats(*stat_args)
> +        fit_saved =3D len(orig_fit_bytes) - len(new_fit_bytes)
> +        fit_pct =3D (
> +            (fit_saved / len(orig_fit_bytes) * 100.0) if orig_fit_bytes =
else 0.0
> +        )
> +        print(
> +            f'FIT total: {len(orig_fit_bytes):,} B -> '
> +            f'{len(new_fit_bytes):,} B '
> +            f'(saved {fit_saved:,} B / {fit_pct:.1f}%)'
> +        )
> +
> +
>  def get_dtbo_output_path(dtb_path, outdir, comp=3D'none'):
>      """Determine the output `.dtbo[.comp]` file path for an input `.dtb`=
 path.
> =20
> @@ -917,13 +1391,15 @@ def parse_args(argv=3DNone):
>      parser =3D argparse.ArgumentParser(
>          description=3D(
>              'Split a set of compiled device tree blobs (.dtb, or compres=
sed '
> -            '.dtb.lz4/.xz/.lzma/.gz) into a single common base .dtb and '
> -            'per-board overlay blobs (.dtbo).'
> +            '.dtb.lz4/.xz/.lzma/.gz) into a common base .dtb and per-boa=
rd '
> +            'overlay blobs (.dtbo), or update a compiled FIT '
> +            '(-F/--fit) in-place (or to --outfile) by factoring its '
> +            '/images/fdt-* blobs into base DTBs and overlays.'
>          )
>      )
>      parser.add_argument(
>          '--output-base-dtb',
> -        default=3D'base.dtb',
> +        default=3DNone,
>          metavar=3D'FILENAME',
>          help=3D(
>              'Output common base .dtb (or .dtb.lz4/.xz/.lzma/.gz) filenam=
e '
> @@ -950,6 +1426,23 @@ def parse_args(argv=3DNone):
>              'current directory for --output-base-dtb)'
>          ),
>      )
> +    parser.add_argument(
> +        '-F', '--fit',
> +        default=3DNone,
> +        metavar=3D'FIT_FILE',
> +        help=3D(
> +            'Input compiled FIT (.fit / .itb) to factor (updated '
> +            'in-place unless --outfile is specified)'
> +        ),
> +    )
> +    parser.add_argument(
> +        '--outfile',
> +        default=3DNone,
> +        metavar=3D'FIT_OUT',
> +        help=3D(
> +            'Output path for the factored FIT (default: overwrite --fit)'
> +        ),
> +    )
>      parser.add_argument(
>          '-S', '--strip-local-fixups',
>          action=3D'store_true',
> @@ -958,6 +1451,15 @@ def parse_args(argv=3DNone):
>              'reconstructed device trees'
>          ),
>      )
> +    parser.add_argument(
> +        '--single-base-dtb',
> +        action=3D'store_true',
> +        help=3D(
> +            'Force all flat_dt nodes in a FIT (-F/--fit) to be '
> +            'factored into a single fdt-base-1 base DTB, failing only if=
 '
> +            'headers, arch, or compression differ'
> +        ),
> +    )
>      parser.add_argument(
>          '-s', '--stats',
>          action=3D'store_true',
> @@ -965,26 +1467,40 @@ def parse_args(argv=3DNone):
>      )
>      parser.add_argument(
>          'dtbs',
> -        nargs=3D'+',
> +        nargs=3D'*',
>          metavar=3D'DTB',
>          help=3D(
> -            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz) files '
> -            '(at least two required)'
> +            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz) files (wh=
en '
> +            '--fit is not used)'
>          ),
>      )
>      args =3D parser.parse_args(argv)
> -    if os.path.dirname(args.output_base_dtb):
> -        parser.error(
> -            '--output-base-dtb must be a filename without directory '
> -            'components; use -o/--outdir to specify the output directory'
> -        )
> -    if len(args.dtbs) < 2:
> -        parser.error('at least two input .dtb files are required')
> +    if args.outfile and not args.fit:
> +        parser.error('--outfile requires -F/--fit')
> +    if args.single_base_dtb and not args.fit:
> +        parser.error('--single-base-dtb requires -F/--fit')
> +    if args.fit:
> +        if (args.dtbs or args.output_base_dtb or args.outdir or
> +                args.base_compression !=3D 'auto'):
> +            parser.error(
> +                '-F/--fit cannot be combined with --output-base-dtb, '
> +                '--base-compression, -o/--outdir, or positional DTB argu=
ments'
> +            )
> +    else:
> +        if args.output_base_dtb is None:
> +            args.output_base_dtb =3D 'base.dtb'
> +        if os.path.dirname(args.output_base_dtb):
> +            parser.error(
> +                '--output-base-dtb must be a filename without directory '
> +                'components; use -o/--outdir to specify the output direc=
tory'
> +            )
> +        if len(args.dtbs) < 2:
> +            parser.error('at least two input .dtb files are required')
>      return args
> =20
> =20
>  def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, base_dtb_comp=3D'n=
one',
> -                     base_dtb_csize=3DNone, dtbo_csizes=3DNone):
> +                     base_dtb_csize=3DNone, dtbo_csizes=3DNone, prefix=
=3D''):
>      """Print uncompressed and compressed size savings summary.
> =20
>      Args:
> @@ -994,6 +1510,7 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs=
, base_dtb_comp=3D'none',
>          base_dtb_comp: Compression format of the base DTB output.
>          base_dtb_csize: Byte size of the compressed base DTB output.
>          dtbo_csizes: Sequence of byte sizes of the compressed `.dtbo` ou=
tputs.
> +        prefix: Optional line prefix (e.g., `'[fdt-base-1] '`).
>      """
>      orig_uncomp =3D sum(len(d.raw_bytes) for d in dtbs)
>      base_dtb_uncomp =3D len(base_dtb_blob)
> @@ -1002,7 +1519,7 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blob=
s, base_dtb_comp=3D'none',
>      saved_uncomp =3D orig_uncomp - new_uncomp
>      pct_uncomp =3D (saved_uncomp / orig_uncomp * 100.0) if orig_uncomp e=
lse 0.0
>      print(
> -        f'Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} B) -> '
> +        f'{prefix}Uncompressed DTBs: {len(dtbs)} files ({orig_uncomp:,} =
B) -> '
>          f'base {base_dtb_uncomp:,} B + {len(dtbo_blobs)} overlays '
>          f'{dtbo_uncomp:,} B =3D {new_uncomp:,} B '
>          f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
> @@ -1011,9 +1528,9 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blob=
s, base_dtb_comp=3D'none',
>      if any(c !=3D 'none' for c in all_comps):
>          comp_label =3D '/'.join(sorted(all_comps))
>          hdr =3D (
> -            f'Compressed ({comp_label}):'
> +            f'{prefix}Compressed ({comp_label}):'
>              if len(all_comps) =3D=3D 1
> -            else f'On-disk ({comp_label}):   '
> +            else f'{prefix}On-disk ({comp_label}):   '
>          )
>          orig_comp =3D sum(d.compressed_size for d in dtbs)
>          dtbo_csize =3D sum(dtbo_csizes)
> @@ -1122,7 +1639,17 @@ def main(argv=3DNone):
>      """
>      args =3D parse_args(argv)
>      try:
> -        factor_dtb_files(args)
> +        if args.fit:
> +            fit_out =3D args.outfile if args.outfile else args.fit
> +            factor_fit(
> +                args.fit,
> +                fit_out,
> +                strip_local_fixups=3Dargs.strip_local_fixups,
> +                single_base_dtb=3Dargs.single_base_dtb,
> +                stats=3Dargs.stats,
> +            )
> +        else:
> +            factor_dtb_files(args)
>      except (OSError, ValueError, RuntimeError, libfdt.FdtException) as e=
xc:
>          sys.exit(f'Error: {exc}')
>      return 0
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index 300f244f41c5..a89bcde1f038 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -53,7 +53,7 @@ TESTS_DEPFILES =3D $(TESTS:%=3D%.d) \
>  	$(addprefix $(TESTS_PREFIX),testutils.d)
> =20
>  TESTS_CLEANFILES_L =3D $(STD_CLEANFILES) \
> -	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 \
> +	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 *.test.fit \
>  	*.test.dtb.gz *.test.dtbo.gz *.test.dtb.xz *.test.dtbo.xz \
>  	*.test.dtb.lzma *.test.dtbo.lzma *.test.dtb.lz4 *.test.dtbo.lz4 \
>  	tmp.* *.bak \
> diff --git a/tests/fdtfactor_lz4.its b/tests/fdtfactor_lz4.its
> new file mode 100644
> index 000000000000..3f862b19c759
> --- /dev/null
> +++ b/tests/fdtfactor_lz4.its
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/ {
> +	description =3D "Test LZ4 FIT for fdtfactor";
> +	#address-cells =3D <1>;
> +
> +	images {
> +		kernel-1 {
> +			description =3D "Unavailable";
> +			data =3D /incbin/("fdtfactor_board1.test.dtb.lz4");
> +			type =3D "kernel_noload";
> +			arch =3D "arm64";
> +			os =3D "linux";
> +			compression =3D "lz4";
> +			load =3D <0>;
> +			entry =3D <0>;
> +		};
> +		fdt-1 {
> +			description =3D "fdtfactor_board1.test.dtb.lz4";
> +			data =3D /incbin/("fdtfactor_board1.test.dtb.lz4");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "lz4";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-2 {
> +			description =3D "fdtfactor_board2.test.dtb.lz4";
> +			data =3D /incbin/("fdtfactor_board2.test.dtb.lz4");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "lz4";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-3 {
> +			description =3D "fdtfactor_board3.test.dtb.lz4";
> +			data =3D /incbin/("fdtfactor_board3.test.dtb.lz4");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "lz4";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-4 {
> +			description =3D "fdtfactor_other1.test.dtb.lz4";
> +			data =3D /incbin/("fdtfactor_other1.test.dtb.lz4");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "lz4";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-5 {
> +			description =3D "fdtfactor_other2.test.dtb.lz4";
> +			data =3D /incbin/("fdtfactor_other2.test.dtb.lz4");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "lz4";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-ovl-1 {
> +			description =3D "overlay_overlay_phandle.test.dtb.lz4";
> +			data =3D /incbin/("overlay_overlay_phandle.test.dtb.lz4");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "lz4";
> +		};
> +	};
> +	configurations {
> +		default =3D "conf-1";
> +		conf-1 {
> +			description =3D "board-meta-1";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-1";
> +			compatible =3D "vendor,board1", "vendor,common";
> +		};
> +		conf-2 {
> +			description =3D "board-meta-2";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-2";
> +		};
> +		conf-3 {
> +			description =3D "board-meta-3";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-3", "fdt-ovl-1";
> +			compatible =3D "vendor,board3", "vendor,common";
> +		};
> +		conf-4 {
> +			description =3D "board-meta-4";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-4";
> +			compatible =3D "vendor,other1", "vendor,other";
> +		};
> +		conf-5 {
> +			description =3D "board-meta-5";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-5";
> +			compatible =3D "vendor,other2", "vendor,other";
> +		};
> +	};
> +};
> diff --git a/tests/fdtfactor_other1.dts b/tests/fdtfactor_other1.dts
> new file mode 100644
> index 000000000000..d6257d1fd29d
> --- /dev/null
> +++ b/tests/fdtfactor_other1.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/memreserve/ 0xdeadbeef00000000 0x100000;
> +
> +/ {
> +	compatible =3D "vendor,other1", "vendor,other";
> +	model =3D "other1";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	osn1: other-subnode@1 {
> +		compatible =3D "other-subnode1";
> +		reg =3D <1>;
> +		prop-ref =3D <&osn1 0x10 &ossn1 0x20>;
> +
> +		ossn1: other-subsubnode {
> +			compatible =3D "other-subsubnode";
> +			prop-int =3D <0x1111>;
> +		};
> +	};
> +
> +	osn2: other-subnode@2 {
> +		reg =3D <2>;
> +		prop-phandle =3D <&osn2>;
> +	};
> +
> +	o1_node: other1-node {
> +		prop-str =3D "other1";
> +		ref-base =3D <&osn1>;
> +		ref-self =3D <&o1_node>;
> +	};
> +};
> diff --git a/tests/fdtfactor_other2.dts b/tests/fdtfactor_other2.dts
> new file mode 100644
> index 000000000000..2d97f3595e3c
> --- /dev/null
> +++ b/tests/fdtfactor_other2.dts
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/memreserve/ 0xdeadbeef00000000 0x100000;
> +
> +/ {
> +	compatible =3D "vendor,other2", "vendor,other";
> +	model =3D "other2";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	osn1: other-subnode@1 {
> +		compatible =3D "other-subnode1";
> +		reg =3D <1>;
> +		prop-ref =3D <&osn1 0x10 &ossn1 0x20>;
> +
> +		ossn1: other-subsubnode {
> +			compatible =3D "other-subsubnode";
> +			prop-int =3D <0x2222>;
> +		};
> +	};
> +
> +	osn2: other-subnode@2 {
> +		reg =3D <2>;
> +		prop-phandle =3D <&osn2>;
> +	};
> +
> +	o2_node: other2-node {
> +		prop-str =3D "other2";
> +		ref-base =3D <&ossn1>;
> +		ref-self =3D <&o2_node>;
> +	};
> +};
> diff --git a/tests/fdtfactor_test.its b/tests/fdtfactor_test.its
> new file mode 100644
> index 000000000000..dd515e17b66f
> --- /dev/null
> +++ b/tests/fdtfactor_test.its
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/dts-v1/;
> +
> +/ {
> +	description =3D "Test FIT for fdtfactor";
> +	#address-cells =3D <1>;
> +
> +	images {
> +		kernel-1 {
> +			description =3D "Unavailable";
> +			data =3D /incbin/("fdtfactor_board1.test.dtb");
> +			type =3D "kernel_noload";
> +			arch =3D "arm64";
> +			os =3D "linux";
> +			compression =3D "none";
> +			load =3D <0>;
> +			entry =3D <0>;
> +		};
> +		fdt-1 {
> +			description =3D "fdtfactor_board1.test.dtb";
> +			data =3D /incbin/("fdtfactor_board1.test.dtb");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "none";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-2 {
> +			description =3D "fdtfactor_board2.test.dtb";
> +			data =3D /incbin/("fdtfactor_board2.test.dtb");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "none";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-3 {
> +			description =3D "fdtfactor_board3.test.dtb";
> +			data =3D /incbin/("fdtfactor_board3.test.dtb");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "none";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-4 {
> +			description =3D "fdtfactor_other1.test.dtb";
> +			data =3D /incbin/("fdtfactor_other1.test.dtb");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "none";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-5 {
> +			description =3D "fdtfactor_other2.test.dtb";
> +			data =3D /incbin/("fdtfactor_other2.test.dtb");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "none";
> +			hash-1 {
> +				algo =3D "sha1";
> +			};
> +		};
> +		fdt-ovl-1 {
> +			description =3D "overlay_overlay_phandle.test.dtb";
> +			data =3D /incbin/("overlay_overlay_phandle.test.dtb");
> +			type =3D "flat_dt";
> +			arch =3D "arm64";
> +			compression =3D "none";
> +		};
> +	};
> +	configurations {
> +		default =3D "conf-1";
> +		conf-1 {
> +			description =3D "board-meta-1";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-1";
> +			compatible =3D "vendor,board1", "vendor,common";
> +		};
> +		conf-2 {
> +			description =3D "board-meta-2";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-2";
> +		};
> +		conf-3 {
> +			description =3D "board-meta-3";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-3", "fdt-ovl-1";
> +			compatible =3D "vendor,board3", "vendor,common";
> +		};
> +		conf-4 {
> +			description =3D "board-meta-4";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-4";
> +			compatible =3D "vendor,other1", "vendor,other";
> +		};
> +		conf-5 {
> +			description =3D "board-meta-5";
> +			kernel =3D "kernel-1";
> +			fdt =3D "fdt-5";
> +			compatible =3D "vendor,other2", "vendor,other";
> +		};
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index c18d824c7bc7..812574203339 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1339,6 +1339,162 @@ fdtfactor_tests () {
>  	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
>  	    fdtfactor_base_comp.test.dir/merged1.test.dtb
>      fi
> +
> +    # FIT factoring (uncompressed and compressed, multi-group by node
> +    # overlap)
> +    # fdtget -t r appends a trailing newline; strip that last byte.
> +    fdtget_raw () {
> +	$DTGET -t r "$1" "$2" "$3" > "$4.tmp"
> +	head -c $(($($STATSZ "$4.tmp") - 1)) "$4.tmp" > "$4"
> +	rm -f "$4.tmp"
> +    }
> +    run_dtc_test -b 2 -@ -L -I dts -O dtb -o fdtfactor_other1.test.dtb \
> +	"$SRCDIR/fdtfactor_other1.dts"
> +    run_dtc_test -b 2 -@ -L -I dts -O dtb -o fdtfactor_other2.test.dtb \
> +	"$SRCDIR/fdtfactor_other2.dts"
> +    run_dtc_test -@ -I dts -O dtb -o overlay_overlay_phandle.test.dtb \
> +	"$SRCDIR/overlay_overlay_phandle.dts"
> +
> +    run_dtc_test -i . -I dts -O dtb -o fdtfactor.test.fit \
> +	"$SRCDIR/fdtfactor_test.its"
> +    cp fdtfactor.test.fit fdtfactor_orig.test.fit
> +    run_wrap_test $PYTHON $FDTFACTOR -s -F fdtfactor.test.fit
> +    run_fdtget_test "fdt-base-1.dtb" fdtfactor.test.fit \
> +	/images/fdt-base-1 description
> +    run_fdtget_test "fdtfactor_board1.test.dtbo" fdtfactor.test.fit \
> +	/images/fdt-1 description
> +    run_fdtget_test "fdt-base-2.dtb" fdtfactor.test.fit \
> +	/images/fdt-base-2 description
> +    run_fdtget_test "fdtfactor_other1.test.dtbo" fdtfactor.test.fit \
> +	/images/fdt-4 description
> +    run_fdtget_test "fdt-base-1 fdt-1" fdtfactor.test.fit \
> +	/configurations/conf-1 fdt
> +    run_fdtget_test "fdt-base-1 fdt-2" fdtfactor.test.fit \
> +	/configurations/conf-2 fdt
> +    run_fdtget_test "fdt-base-1 fdt-3 fdt-ovl-1" fdtfactor.test.fit \
> +	/configurations/conf-3 fdt
> +    run_fdtget_test "fdt-base-2 fdt-4" fdtfactor.test.fit \
> +	/configurations/conf-4 fdt
> +    run_fdtget_test "fdt-base-2 fdt-5" fdtfactor.test.fit \
> +	/configurations/conf-5 fdt
> +    # conf-1 already had an explicit compatible property; conf-2 did not=
, so
> +    # fdtfactor should populate it from fdt-2's root compatible property.
> +    run_fdtget_test "vendor,board1 vendor,common" fdtfactor.test.fit \
> +	/configurations/conf-1 compatible
> +    run_fdtget_test "test_fdtfactor" fdtfactor.test.fit \
> +	/configurations/conf-2 compatible
> +    run_fdtget_test "vendor,other1 vendor,other" fdtfactor.test.fit \
> +	/configurations/conf-4 compatible
> +    # Verify that hash-1/value was populated for fdt-base-1, fdt-base-2,=
 and
> +    # updated for fdt-1.
> +    base1_hash=3D$($DTGET -t bx fdtfactor.test.fit \
> +	/images/fdt-base-1/hash-1 value)
> +    base2_hash=3D$($DTGET -t bx fdtfactor.test.fit \
> +	/images/fdt-base-2/hash-1 value)
> +    fdt1_hash=3D$($DTGET -t bx fdtfactor.test.fit \
> +	/images/fdt-1/hash-1 value)
> +    if [ -z "$base1_hash" ] || [ -z "$base2_hash" ] || \
> +       [ "$fdt1_hash" =3D "0 0 0 0 0 0 0 0" ]; then
> +	FAIL "FIT hash-1 values were not updated"
> +    fi
> +    # Extract factored base DTBs and overlays from the FIT and verify al=
l 5
> +    # boards with fdtoverlay + dtbs_equal_unordered.
> +    fdtget_raw fdtfactor.test.fit /images/fdt-base-1 data fit_base1.test=
=2Edtb
> +    for i in 1 2 3; do
> +	fdtget_raw fdtfactor.test.fit /images/fdt-${i} data \
> +	    fit_fdt${i}.test.dtbo
> +	run_wrap_test $FDTOVERLAY -i fit_base1.test.dtb \
> +	    -o fit_merged${i}.test.dtb fit_fdt${i}.test.dtbo
> +	run_test dtbs_equal_unordered fdtfactor_board${i}.test.dtb \
> +	    fit_merged${i}.test.dtb
> +    done
> +    fdtget_raw fdtfactor.test.fit /images/fdt-base-2 data fit_base2.test=
=2Edtb
> +    for i in 1 2; do
> +	idx=3D$((i + 3))
> +	fdtget_raw fdtfactor.test.fit /images/fdt-${idx} data \
> +	    fit_fdt${idx}.test.dtbo
> +	run_wrap_test $FDTOVERLAY -i fit_base2.test.dtb \
> +	    -o fit_merged${idx}.test.dtb fit_fdt${idx}.test.dtbo
> +	run_test dtbs_equal_unordered fdtfactor_other${i}.test.dtb \
> +	    fit_merged${idx}.test.dtb
> +    done
> +
> +    # --single-base-dtb forces a single fdt-base-1 across all FDTs
> +    run_wrap_test $PYTHON $FDTFACTOR --single-base-dtb \
> +	-F fdtfactor_orig.test.fit --outfile fdtfactor_single.test.fit
> +    run_fdtget_test "fdt-base-1.dtb" fdtfactor_single.test.fit \
> +	/images/fdt-base-1 description
> +    run_fdtget_test "fdt-base-1 fdt-1" fdtfactor_single.test.fit \
> +	/configurations/conf-1 fdt
> +    run_fdtget_test "fdt-base-1 fdt-4" fdtfactor_single.test.fit \
> +	/configurations/conf-4 fdt
> +    fdtget_raw fdtfactor_single.test.fit /images/fdt-base-1 data \
> +	fit_single_base1.test.dtb
> +    for i in 1 2 3; do
> +	fdtget_raw fdtfactor_single.test.fit /images/fdt-${i} data \
> +	    fit_single_fdt${i}.test.dtbo
> +	run_wrap_test $FDTOVERLAY -i fit_single_base1.test.dtb \
> +	    -o fit_single_merged${i}.test.dtb fit_single_fdt${i}.test.dtbo
> +	run_test dtbs_equal_unordered fdtfactor_board${i}.test.dtb \
> +	    fit_single_merged${i}.test.dtb
> +    done
> +    for i in 1 2; do
> +	idx=3D$((i + 3))
> +	fdtget_raw fdtfactor_single.test.fit /images/fdt-${idx} data \
> +	    fit_single_fdt${idx}.test.dtbo
> +	run_wrap_test $FDTOVERLAY -i fit_single_base1.test.dtb \
> +	    -o fit_single_merged${idx}.test.dtb fit_single_fdt${idx}.test.dtbo
> +	run_test dtbs_equal_unordered fdtfactor_other${i}.test.dtb \
> +	    fit_single_merged${idx}.test.dtb
> +    done
> +
> +    # Verify that conflicting image properties (e.g. arch) in a group fa=
il
> +    cp fdtfactor_orig.test.fit fdtfactor_bad_arch.test.fit
> +    run_wrap_test $DTPUT fdtfactor_bad_arch.test.fit /images/fdt-4 \
> +	arch -ts "arm"
> +    run_wrap_error_test $PYTHON $FDTFACTOR --single-base-dtb \
> +	-F fdtfactor_bad_arch.test.fit
> +
> +    # Verify that signed FITs (with signature* subnodes) and
> +    # already-factored FITs (containing fdt-base-*) are rejected
> +    cp fdtfactor_orig.test.fit fdtfactor_signed.test.fit
> +    run_wrap_test $DTPUT fdtfactor_signed.test.fit -c \
> +	/configurations/conf-1/signature-1
> +    run_wrap_error_test $PYTHON $FDTFACTOR -F fdtfactor_signed.test.fit
> +    run_wrap_error_test $PYTHON $FDTFACTOR -F fdtfactor.test.fit
> +
> +    if command -v lz4 >/dev/null 2>&1; then
> +	run_wrap_test lz4 -12 -q -f -m \
> +	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
> +	    fdtfactor_board3.test.dtb fdtfactor_other1.test.dtb \
> +	    fdtfactor_other2.test.dtb overlay_overlay_phandle.test.dtb
> +	run_dtc_test -i . -I dts -O dtb -o fdtfactor_lz4.test.fit \
> +	    "$SRCDIR/fdtfactor_lz4.its"
> +	run_wrap_test $PYTHON $FDTFACTOR -s \
> +	    -F fdtfactor_lz4.test.fit --outfile fdtfactor_lz4_out.test.fit
> +	run_fdtget_test "fdt-base-1.dtb.lz4" fdtfactor_lz4_out.test.fit \
> +	    /images/fdt-base-1 description
> +	run_fdtget_test "fdtfactor_board1.test.dtbo.lz4" \
> +	    fdtfactor_lz4_out.test.fit /images/fdt-1 description
> +	run_fdtget_test "fdt-base-2.dtb.lz4" fdtfactor_lz4_out.test.fit \
> +	    /images/fdt-base-2 description
> +	run_fdtget_test "fdtfactor_other1.test.dtbo.lz4" \
> +	    fdtfactor_lz4_out.test.fit /images/fdt-4 description
> +	run_fdtget_test "fdt-base-1 fdt-1" fdtfactor_lz4_out.test.fit \
> +	    /configurations/conf-1 fdt
> +	run_fdtget_test "fdt-base-2 fdt-4" fdtfactor_lz4_out.test.fit \
> +	    /configurations/conf-4 fdt
> +	fdtget_raw fdtfactor_lz4_out.test.fit /images/fdt-base-1 data \
> +	    fit_lz4_base1.test.dtb.lz4
> +	fdtget_raw fdtfactor_lz4_out.test.fit /images/fdt-1 data \
> +	    fit_lz4_fdt1.test.dtbo.lz4
> +	run_wrap_test lz4 -d -q -f --rm fit_lz4_base1.test.dtb.lz4
> +	run_wrap_test lz4 -d -q -f --rm fit_lz4_fdt1.test.dtbo.lz4
> +	run_wrap_test $FDTOVERLAY -i fit_lz4_base1.test.dtb \
> +	    -o fit_lz4_merged1.test.dtb fit_lz4_fdt1.test.dtbo
> +	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
> +	    fit_lz4_merged1.test.dtb
> +    fi
>  }
> =20
>  while getopts "vt:me" ARG ; do
> @@ -1368,7 +1524,7 @@ if [ -z "$TESTSETS" ]; then
>  fi
> =20
>  # Make sure we don't have stale blobs lying around
> -rm -f *.test.dtb *.test.dtbo *.test.dts *.test.dtb.gz *.test.dtbo.gz \
> +rm -f *.test.dtb *.test.dtbo *.test.dts *.test.fit *.test.dtb.gz *.test.=
dtbo.gz \
>      *.test.dtb.xz *.test.dtbo.xz *.test.dtb.lzma *.test.dtbo.lzma \
>      *.test.dtb.lz4 *.test.dtbo.lz4
>  rm -rf *.test.dir
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--TDfrExIcPIWRrACo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr1JQMACgkQzQJF27ox
2GeXKg//U+369As+zO5G+FgZASHvSed7xpqgiovJ19QqKcpvsgztVRupj7Pg6qy4
ehNNYaFdgroR1DY4Q3O7k4rPYC82kAO49yGA3FTOMax82oY1v4KIDNTxlfego2+9
1ZbB9BDiBLZcpN/WFz/r9TTxwbnrY/jFEzPmAfED39DWTlBZrSDzm3d5P3SvBW8q
dMuOaVz/BFIYSFYjYZxKfKYpv+fw7OjLbc0FxPq3MxWaCP46gWHNA5eFRSb4alJz
DXsFgIH+jeXbP4rxMWrz0/bcH5AmLksr0heCYTxgKllIU50UtAfAi1KW0bw9gpRy
Pj+HeJBg4DKRE5cqB7sn2pS0x+2d7YL9FCPmLTYpvBpXWHX03cr2eqO3Tl1zED8J
jGh/1Nyif+3AlbZ3twT94cMzNwVoAIezu63x8aPofljdIaS+ZCtbMShKKVQ3VFtS
73jsUFKq02Zc0iE1JChVCUuqyMvAdXVrqIYRDNQz6Hkjv/UXLz3mvDR9kfjuJnih
XY3eOp7hh3vWwtzjLzA7NVrau+kXm/xUX4rkyrcbluyz6/g46VWDG7hB6FWz4WkE
hPIC/w7oAXnfTXEQblwoZ32ujj9uoNE4WBko4g62uATZC3uB8fIcwl/+LHzk5iE6
iyAy7JSp2VjJexoc/77pa+fXfD9IWVMeelzu797b8R1gswSckwM=
=dv3S
-----END PGP SIGNATURE-----

--TDfrExIcPIWRrACo--
