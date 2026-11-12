Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450711;
	b=5O2WQvEQ8ueaW7ePn/UbWnFogWDKRReJGxI2Pa3JMkoOSaSl4I4TsFH6xJUNMpQnr3Ai
	 9q62sBukIbnT82VVhAGP+7ZrrKjG+TbSbaZ9LqAK5gC1qrOKOe2DVsdwFiUjrf50YVOti
	 GJosS4Gz5vFhN+FxvK+GvRB6hF2sszVMKKE1D3IAYJnkJb0wTLrFjo/bwNKU4zvHvk49/
	 j8gtBXXeHr1+pHdcHSrTCwJolascug7va0yv3XzfG+QUD4MmcweVDiBJKj8gunFlFG7RS
	 0RyFgnRDXWZoNnqEOSY2C8lw5h5oLAYvCOXazTdfQ814nZfMOHRTMhkviPGxjWK8/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450711;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qhq5e11hcSKjfRSkX3SGGEYG7qNfFKND0xspPlTN7n4=;
	b=sIIhbeDh8ypo4yHWjQnp4P18MCha+zCO7mKwkyxbPJeIhzuKtaNVfwpa3rvIk+KJCdWR
	 j29YlLI3e3/1Yb5Zqg8RLb1Uom/rVXbtK1e1S1SFPkJH8eAcaTpUnoIp34GbZsLLO6rBb
	 3gB4NwIy1Cc2+Kd+xCcBYStn5WbpOZuZDBFaJV/WoUqmpmAo+PWomdRJhFEQd1rHjsqlh
	 RJDAeT9xXe8T4hp7mMw/pMmEeDxtOcGiqL74hoZ+UCILiaBrikK7jax10Eou8ATjOIPPT
	 2Q0LJXIog59AKZC6OYDREAw4wXlZKvgxVMxEWBFLIGU0BeHVlhlOd9Ze/2aK//qd5lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=HoRitafs;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39D606A323;
	Thu, 12 Nov 2026 02:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D39D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=HoRitafs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794450707;
	bh=qhq5e11hcSKjfRSkX3SGGEYG7qNfFKND0xspPlTN7n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HoRitafsykQ2BD7qF01ehdO/oGdfGmxz6fGSQkek5o+1tVSMAvM/DJCOJ382sFR6g
	 oOKpw9nr1/7hEtmauv4RWDFzRHfmQPJ4HgBhfwdpYXEdchQ8tm/cpurXNobqjfBklz
	 6jCOLgX+ImgIGgL9kIGikLobe/oLWzmf4rLdGYPd55TFkUtqVISVSGEBLKfvasB0lc
	 uWw/qp7sXzXFwwZO7To1+yq4vOFiTKyDKe8JHEHGPggcR4HCLpkPhaRo/rndzz9WXQ
	 sUdTD181EPQajiddQevnJeC+vytYj2L/HEkCDJ6k/icLOrsdO2HfAC7QB9OGPnGzrO
	 0gqASqHbeFYlA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQ4CR2cgBz4wKs; Thu, 12 Nov 2026 13:31:47 +1100 (AEDT)
Date: Thu, 12 Nov 2026 13:10:35 +1100
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
Subject: Re: [PATCH v3 14/15] fdtfactor: Support compressed DTB inputs and
 outputs
Message-ID: <avUgDyB9p0_OSxal@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-15-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="iTfKNL3zfqSi2iBg"
Content-Disposition: inline
In-Reply-To: <20261101220224.1436242-15-dianders@chromium.org>

--iTfKNL3zfqSi2iBg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 02:01:21PM -0800, Douglas Anderson wrote:
> Firmware and FIT build pipelines frequently store device tree blobs
> compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).
>=20
> Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> file extension, transparently decompress them before factoring, and
> compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
>=20
> - Support `.lz4` (including legacy `-l` frames via the `lz4` CLI),
>   `.lzma`/`.xz` (via Python's `lzma` module, using `CHECK_CRC32` for XZ
>   compatibility with kernel/bootloader decompressors), and `.gz` (via
>   Python's `gzip` module).
> - Preserve the input compression format on generated `.dtbo` files and
>   compress `base.dtb` according to `--base-compression` (which defaults
>   to `auto`, auto-detecting from `--output-base-dtb`'s filename
>   extension such as `--output-base-dtb base.dtb.lz4`).
> - Report compressed size savings alongside uncompressed savings when
>   `-s`/`--stats` is specified.
>=20
> On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
> `fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
> (87.5% savings).
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Hmm.  Whenever I see a pretty complex chunk of code dedicated to
auto-detecting and guessing the right thing to do, I worry about it
doing something weird with an unexpected group of inputs.

How much usability would you really lose, if you required that the
compression method be explicitly supplied (I'd envisage a single
option which controls both input and output sides)?

> ---
>=20
> Changes in v3:
> - Update for -b/--base-dtb rename to --output-base-dtb (David Gibson)
>=20
> Changes in v2:
> - Add --base-compression to explicitly control base.dtb compression
>   while documenting auto-detection from --base-dtb's filename suffix
>   (David Gibson)
> - Support legacy LZ4 frames (lz4 -l) and use CRC32 check for XZ outputs
>   (Simon Glass)
>=20
>  README.md            |  17 ++-
>  fdtfactor            | 318 +++++++++++++++++++++++++++++++++++++++----
>  tests/Makefile.tests |   5 +-
>  tests/run_tests.sh   |  82 ++++++++++-
>  4 files changed, 391 insertions(+), 31 deletions(-)
>=20
> diff --git a/README.md b/README.md
> index bb6f041e1e78..a3d1ad8c58f3 100644
> --- a/README.md
> +++ b/README.md
> @@ -115,10 +115,10 @@ values.
>  ## fdtfactor
> =20
>  `fdtfactor` is a Python tool built on `pylibfdt` that takes a set of
> -compiled device tree blobs (`.dtb`) and splits them into a single common
> -`base.dtb` and per-board `.dtbo` overlays so that applying a board's
> -`.dtbo` to `base.dtb` recreates the original board device tree while
> -reducing total storage size.
> +compiled device tree blobs (`.dtb`, or compressed `.dtb.lz4`, `.dtb.xz`,
> +`.dtb.lzma`, `.dtb.gz`) and splits them into a single common `base.dtb` =
and
> +per-board `.dtbo` overlays so that applying a board's `.dtbo` to `base.d=
tb`
> +recreates the original board device tree while reducing total storage si=
ze.
> =20
>  Input `.dtb` files must be compiled with `dtc -@ -L` so that both
>  `/__symbols__` (used to resolve overlay `/__fixups__` against `base.dtb`)
> @@ -135,7 +135,12 @@ Options:
> =20
>  * `--output-base-dtb`: Output filename for the common base `.dtb`
>    (default: `base.dtb`; placed in `--outdir` if specified, or the current
> -  directory otherwise).
> +  directory otherwise). By default (`--base-compression=3Dauto`), `base.=
dtb`
> +  is compressed if its filename carries a `.lz4`, `.xz`, `.lzma`, or `.g=
z`
> +  suffix, whereas each `.dtbo` preserves its input `.dtb`'s compression.
> +* `--base-compression`: Compression format for `--output-base-dtb`: `aut=
o`,
> +  `none`, `lz4`, `lz4_legacy`, `lzma`, `xz`, or `gzip` (default: `auto`,
> +  which auto-detects from the `--output-base-dtb` filename suffix).
>  * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
>    `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` =
files,
>    current directory for `--output-base-dtb`).
> @@ -148,7 +153,7 @@ Options:
>    passed to `dtc` solely to help `fdtfactor` locate phandles at build ti=
me
>    and `/__local_fixups__` is not needed at runtime, passing `-S` strips =
it
>    from `base.dtb` to save space.
> -* `-s`, `--stats`: Print size savings summary.
> +* `-s`, `--stats`: Print uncompressed and compressed size savings.

I don't think this hunk really adds anything useful.

>  ### TODO
> =20
> diff --git a/fdtfactor b/fdtfactor
> index 7442a2597399..9bc8bfde2038 100755
> --- a/fdtfactor
> +++ b/fdtfactor
> @@ -12,14 +12,223 @@ original board DTB.
> =20
>  import argparse
>  from collections import Counter
> +import gzip
> +import lzma
>  import os
>  import struct
> +import subprocess
>  import sys
> =20
>  import devicetree
>  import libfdt
> =20
> =20
> +FDT_MAGIC =3D b'\xd0\x0d\xfe\xed'
> +LZ4_MAGIC =3D b'\x04\x22\x4d\x18'
> +LZ4_LEGACY_MAGIC =3D b'\x02\x21\x4c\x18'
> +GZIP_MAGIC =3D b'\x1f\x8b'
> +XZ_MAGIC =3D b'\xfd7zXZ\x00'
> +# Matches raw LZMA_ALONE headers with default lc=3D3, lp=3D0, pb=3D2 (0x=
5d) and
> +# power-of-two dictionary sizes >=3D 64 KiB; .lzma extension handles any
> +# non-default LZMA headers.
> +LZMA_ALONE_MAGIC =3D b'\x5d\x00\x00'
> +
> +COMP_TO_EXT =3D {
> +    'none': '',
> +    'lz4': '.lz4',
> +    'lz4_legacy': '.lz4',
> +    'lzma': '.lzma',
> +    'xz': '.xz',
> +    'gzip': '.gz',
> +}
> +
> +EXT_TO_COMP =3D {
> +    '.lz4': 'lz4',
> +    '.lzma': 'lzma',
> +    '.xz': 'xz',
> +    '.gz': 'gzip',
> +}
> +
> +
> +def detect_compression(raw_bytes, filename=3D''):
> +    """Detect compression algorithm from magic bytes or filename extensi=
on.
> +
> +    Args:
> +        raw_bytes: Raw file bytes to inspect for magic headers.
> +        filename: Optional filename string used as a fallback if `raw_by=
tes`
> +            does not match a known magic header.
> +
> +    Returns:
> +        Compression format string (`'none'`, `'lz4'`, `'lz4_legacy'`, `'=
lzma'`,
> +        `'xz'`, or `'gzip'`).
> +    """
> +    if raw_bytes.startswith(FDT_MAGIC):
> +        return 'none'
> +    if raw_bytes.startswith(LZ4_MAGIC):
> +        return 'lz4'
> +    if raw_bytes.startswith(LZ4_LEGACY_MAGIC):
> +        return 'lz4_legacy'
> +    if raw_bytes.startswith(GZIP_MAGIC):
> +        return 'gzip'
> +    if raw_bytes.startswith(XZ_MAGIC):
> +        return 'xz'
> +    if raw_bytes.startswith(LZMA_ALONE_MAGIC):
> +        return 'lzma'
> +    _, ext =3D os.path.splitext(filename)
> +    if ext in EXT_TO_COMP:
> +        return EXT_TO_COMP[ext]
> +    return 'none'
> +
> +
> +def _run_lz4(args, input_bytes, action):
> +    """Run the `lz4` CLI with `args` on `input_bytes` and return stdout.
> +
> +    Args:
> +        args: List of command-line arguments to pass to `lz4`.
> +        input_bytes: Bytes to feed to `lz4` standard input.
> +        action: Human-readable action description for error messages.
> +
> +    Returns:
> +        Output `bytes` written to `lz4` standard output.
> +    """
> +    try:
> +        res =3D subprocess.run(
> +            ['lz4', *args],
> +            input=3Dinput_bytes,
> +            capture_output=3DTrue,
> +            check=3DFalse,
> +        )
> +    except FileNotFoundError as exc:
> +        raise RuntimeError(
> +            'lz4 command not found; install lz4 to process .lz4 files'
> +        ) from exc
> +    if res.returncode !=3D 0:
> +        err =3D res.stderr.decode('utf-8', errors=3D'replace').strip()
> +        raise RuntimeError(f'Failed to {action} with lz4: {err}')
> +    return res.stdout
> +
> +
> +def decompress_blob(raw_bytes, filename=3D'', comp=3DNone):
> +    """Decompress a DTB blob if compressed, returning `(raw_bytes, comp)=
`.
> +
> +    Args:
> +        raw_bytes: Input file or property `bytes` (compressed or uncompr=
essed).
> +        filename: Optional filename or node description for error report=
ing and
> +            extension fallback.
> +        comp: Optional explicit compression type (`'none'`, `'lz4'`,
> +            `'lz4_legacy'`, `'lzma'`, `'xz'`, `'gzip'`), or `None` to
> +            auto-detect via `detect_compression()`.
> +
> +    Returns:
> +        Tuple of `(uncompressed_bytes, resolved_compression_type)`.
> +    """
> +    if not comp:
> +        comp =3D detect_compression(raw_bytes, filename)
> +    elif comp =3D=3D 'lz4' and raw_bytes.startswith(LZ4_LEGACY_MAGIC):
> +        comp =3D 'lz4_legacy'
> +    if comp =3D=3D 'none':
> +        return raw_bytes, 'none'
> +    if comp in ('lz4', 'lz4_legacy'):
> +        return _run_lz4(['-d', '-q', '-c'], raw_bytes, f'decompress {fil=
ename}'), comp
> +    if comp =3D=3D 'gzip':
> +        try:
> +            return gzip.decompress(raw_bytes), 'gzip'
> +        except Exception as exc:
> +            raise RuntimeError(
> +                f'Failed to decompress {filename} with gzip: {exc}'
> +            ) from exc
> +    if comp in ('lzma', 'xz'):
> +        try:
> +            return lzma.decompress(raw_bytes), comp
> +        except Exception as exc:
> +            raise RuntimeError(
> +                f'Failed to decompress {filename} with {comp}: {exc}'
> +            ) from exc
> +    prefix =3D f'{filename}: ' if filename else ''
> +    raise ValueError(f'{prefix}Unsupported compression type: {comp}')
> +
> +
> +def compress_blob(raw_bytes, comp, filename=3D''):
> +    """Compress an FDT blob using the specified compression algorithm.
> +
> +    Args:
> +        raw_bytes: Uncompressed FDT `bytes`.
> +        comp: Compression format (`'none'`, `'lz4'`, `'lz4_legacy'`, `'l=
zma'`,
> +            `'xz'`, or `'gzip'`).
> +        filename: Optional filename for error messages.
> +
> +    Returns:
> +        Compressed (or uncompressed if `comp` is `'none'`) `bytes`.
> +    """
> +    if comp in ('none', '', None):
> +        return raw_bytes
> +    target =3D filename or 'blob'
> +    if comp =3D=3D 'lz4':
> +        return _run_lz4(
> +            ['-12', '-z', '-q', '-c'], raw_bytes, f'compress {target}'
> +        )
> +    if comp =3D=3D 'lz4_legacy':
> +        return _run_lz4(
> +            ['-l', '-12', '-q', '-c'], raw_bytes, f'compress {target}'
> +        )
> +    if comp =3D=3D 'gzip':
> +        return gzip.compress(raw_bytes, mtime=3D0)
> +    if comp =3D=3D 'lzma':
> +        return lzma.compress(raw_bytes, format=3Dlzma.FORMAT_ALONE)
> +    if comp =3D=3D 'xz':
> +        return lzma.compress(
> +            raw_bytes, format=3Dlzma.FORMAT_XZ, check=3Dlzma.CHECK_CRC32
> +        )
> +    prefix =3D f'{filename}: ' if filename else ''
> +    raise ValueError(f'{prefix}Unsupported compression type: {comp}')
> +
> +
> +def split_dtb_filename(path):
> +    """Split a DTB path into `(directory, stem, compression_type)`.
> +
> +    Strips a recognized compression suffix (`.lz4`, `.lzma`, `.xz`, `.gz=
`), if
> +    present, followed by a `.dtb` or `.dtbo` suffix, if present. Note th=
at for
> +    input files, `ParsedDtb` detects the actual compression format from =
the
> +    file's magic bytes via `decompress_blob()` rather than relying on the
> +    filename extension; `split_dtb_filename()` is used to derive the out=
put
> +    `.dtbo` filename stem and (when `--base-compression=3Dauto`) to infe=
r the
> +    default compression format for `--output-base-dtb` from its output
> +    filename.
> +
> +    Examples:
> +        >>> split_dtb_filename('/path/to/board.dtb')
> +        ('/path/to', 'board', 'none')
> +        >>> split_dtb_filename('board.dtbo')
> +        ('', 'board', 'none')
> +        >>> split_dtb_filename('/path/to/board.dtb.lz4')
> +        ('/path/to', 'board', 'lz4')
> +        >>> split_dtb_filename('base.dtb.xz')
> +        ('', 'base', 'xz')
> +        >>> split_dtb_filename('/path/to/board.rev2.dtb.gz')
> +        ('/path/to', 'board.rev2', 'gzip')
> +        >>> split_dtb_filename('/path/to/board.custom.lzma')
> +        ('/path/to', 'board.custom', 'lzma')
> +        >>> split_dtb_filename('my_blob')
> +        ('', 'my_blob', 'none')
> +
> +    Args:
> +        path: Input or output DTB file path string.
> +
> +    Returns:
> +        Tuple of `(directory, stem, compression_type)`.
> +    """
> +    directory, filename =3D os.path.split(path)
> +    comp =3D 'none'
> +    prefix, sep, ext =3D filename.rpartition('.')
> +    if prefix and sep and f'.{ext}' in EXT_TO_COMP:
> +        comp =3D EXT_TO_COMP[f'.{ext}']
> +        filename =3D prefix
> +    stem, sep, ext =3D filename.rpartition('.')
> +    if not stem or not sep or ext not in ('dtb', 'dtbo'):
> +        stem =3D filename
> +    return directory, stem, comp
> +
> +
>  def _is_dtbo_overlay(fdt):
>      """Return True if `fdt` is a `.dtbo` overlay rather than a base DTB.
> =20
> @@ -78,11 +287,13 @@ class ParsedDtb:
>          """Parse an input FDT file into a normalized FactoredTree.
> =20
>          Args:
> -            filename: File path of the `.dtb` file to read.
> +            filename: File path of the `.dtb` (or compressed `.dtb.*`) f=
ile.
>          """
>          self.filename =3D filename
>          with open(filename, 'rb') as f:
> -            raw_bytes =3D f.read()
> +            file_bytes =3D f.read()
> +        self.compressed_size =3D len(file_bytes)
> +        raw_bytes, self.compression =3D decompress_blob(file_bytes, file=
name)
>          self.raw_bytes =3D raw_bytes
> =20
>          try:
> @@ -674,21 +885,23 @@ def create_base_dtb_and_overlays(dtbs, strip_local_=
fixups=3DFalse):
>      return base_dtb_blob, dtbo_blobs
> =20
> =20
> -def get_dtbo_output_path(dtb_path, outdir):
> -    """Determine the output `.dtbo` file path for an input `.dtb` path.
> +def get_dtbo_output_path(dtb_path, outdir, comp=3D'none'):
> +    """Determine the output `.dtbo[.comp]` file path for an input `.dtb`=
 path.
> =20
>      Args:
> -        dtb_path: Path to the input `.dtb` file.
> +        dtb_path: Path to the input `.dtb` (or `.dtb.*`) file.
>          outdir: Output directory path, or `None` to place the `.dtbo` al=
ongside
>              `dtb_path`.
> +        comp: Compression format string for the output `.dtbo` (default:
> +            `'none'`).
> =20
>      Returns:
> -        Output `.dtbo` file path string.
> +        Output `.dtbo` (or compressed `.dtbo.*`) file path string.
>      """
> -    dtb_dir, filename =3D os.path.split(dtb_path)
> -    stem =3D filename[:-4] if filename.endswith('.dtb') else filename
> +    dtb_dir, stem, _ =3D split_dtb_filename(dtb_path)
> +    dtbo_name =3D f'{stem}.dtbo{COMP_TO_EXT[comp]}'
>      target_dir =3D outdir if outdir is not None else dtb_dir
> -    return os.path.join(target_dir, f'{stem}.dtbo')
> +    return os.path.join(target_dir, dtbo_name)
> =20
> =20
>  def parse_args(argv=3DNone):
> @@ -703,8 +916,9 @@ def parse_args(argv=3DNone):
>      """
>      parser =3D argparse.ArgumentParser(
>          description=3D(
> -            'Split a set of compiled device tree blobs (.dtb) into a sin=
gle '
> -            'common base .dtb and per-board overlay blobs (.dtbo).'
> +            'Split a set of compiled device tree blobs (.dtb, or compres=
sed '
> +            '.dtb.lz4/.xz/.lzma/.gz) into a single common base .dtb and '
> +            'per-board overlay blobs (.dtbo).'
>          )
>      )
>      parser.add_argument(
> @@ -712,8 +926,18 @@ def parse_args(argv=3DNone):
>          default=3D'base.dtb',
>          metavar=3D'FILENAME',
>          help=3D(
> -            'Output common base .dtb filename (default: base.dtb; placed=
 in '
> -            '--outdir if specified, or current directory otherwise)'
> +            'Output common base .dtb (or .dtb.lz4/.xz/.lzma/.gz) filenam=
e '
> +            '(default: base.dtb; placed in --outdir if specified, or cur=
rent '
> +            'directory otherwise)'
> +        ),
> +    )
> +    parser.add_argument(
> +        '--base-compression',
> +        choices=3D('auto', 'none', 'lz4', 'lz4_legacy', 'lzma', 'xz', 'g=
zip'),
> +        default=3D'auto',
> +        help=3D(
> +            'Compression format for --output-base-dtb (default: auto, wh=
ich '
> +            'auto-detects from the --output-base-dtb filename extension)'
>          ),
>      )
>      parser.add_argument(
> @@ -737,13 +961,16 @@ def parse_args(argv=3DNone):
>      parser.add_argument(
>          '-s', '--stats',
>          action=3D'store_true',
> -        help=3D'Print size statistics summary',
> +        help=3D'Print size statistics and compression summary',

To, compression fits already in "size statistics".

>      )
>      parser.add_argument(
>          'dtbs',
>          nargs=3D'+',
>          metavar=3D'DTB',
> -        help=3D'Input .dtb files (at least two required)',
> +        help=3D(
> +            'Input .dtb (or compressed .dtb.lz4/.xz/.lzma/.gz) files '
> +            '(at least two required)'
> +        ),
>      )
>      args =3D parser.parse_args(argv)
>      if os.path.dirname(args.output_base_dtb):
> @@ -756,13 +983,17 @@ def parse_args(argv=3DNone):
>      return args
> =20
> =20
> -def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs):
> -    """Print uncompressed size savings summary.
> +def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs, base_dtb_comp=3D'n=
one',
> +                     base_dtb_csize=3DNone, dtbo_csizes=3DNone):
> +    """Print uncompressed and compressed size savings summary.
> =20
>      Args:
>          dtbs: Sequence of input `ParsedDtb` instances.
>          base_dtb_blob: Uncompressed base DTB `bytes`.
>          dtbo_blobs: Sequence of uncompressed `.dtbo` overlay `bytes`.
> +        base_dtb_comp: Compression format of the base DTB output.
> +        base_dtb_csize: Byte size of the compressed base DTB output.
> +        dtbo_csizes: Sequence of byte sizes of the compressed `.dtbo` ou=
tputs.
>      """
>      orig_uncomp =3D sum(len(d.raw_bytes) for d in dtbs)
>      base_dtb_uncomp =3D len(base_dtb_blob)
> @@ -776,6 +1007,25 @@ def _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blob=
s):
>          f'{dtbo_uncomp:,} B =3D {new_uncomp:,} B '
>          f'(saved {saved_uncomp:,} B / {pct_uncomp:.1f}%)'
>      )
> +    all_comps =3D {base_dtb_comp, *(d.compression for d in dtbs)}
> +    if any(c !=3D 'none' for c in all_comps):
> +        comp_label =3D '/'.join(sorted(all_comps))
> +        hdr =3D (
> +            f'Compressed ({comp_label}):'
> +            if len(all_comps) =3D=3D 1
> +            else f'On-disk ({comp_label}):   '
> +        )
> +        orig_comp =3D sum(d.compressed_size for d in dtbs)
> +        dtbo_csize =3D sum(dtbo_csizes)
> +        new_comp =3D base_dtb_csize + dtbo_csize
> +        saved_comp =3D orig_comp - new_comp
> +        pct_comp =3D (saved_comp / orig_comp * 100.0) if orig_comp else =
0.0
> +        print(
> +            f'{hdr} {len(dtbs)} files ({orig_comp:,} B) -> '
> +            f'base {base_dtb_csize:,} B + {len(dtbo_blobs)} overlays '
> +            f'{dtbo_csize:,} B (avg {dtbo_csize // len(dtbo_blobs):,} B)=
 =3D '
> +            f'{new_comp:,} B (saved {saved_comp:,} B / {pct_comp:.1f}%)'
> +        )
> =20
> =20
>  def factor_dtb_files(args):
> @@ -792,6 +1042,13 @@ def factor_dtb_files(args):
>          if args.outdir is not None
>          else args.output_base_dtb
>      )
> +    if args.base_compression =3D=3D 'auto':
> +        _, _, base_dtb_comp =3D split_dtb_filename(base_dtb_path)
> +        if (base_dtb_comp =3D=3D 'lz4' and
> +                all(d.compression =3D=3D 'lz4_legacy' for d in dtbs)):
> +            base_dtb_comp =3D 'lz4_legacy'
> +    else:
> +        base_dtb_comp =3D args.base_compression
> =20
>      input_abs_paths =3D {os.path.abspath(p) for p in input_dtb_paths}
>      base_abs_path =3D os.path.abspath(base_dtb_path)
> @@ -803,8 +1060,10 @@ def factor_dtb_files(args):
> =20
>      dtbo_paths =3D []
>      seen_paths =3D {base_abs_path}
> -    for dtb_path in input_dtb_paths:
> -        out_path =3D get_dtbo_output_path(dtb_path, args.outdir)
> +    for dtb_path, d in zip(input_dtb_paths, dtbs):
> +        out_path =3D get_dtbo_output_path(
> +            dtb_path, args.outdir, comp=3Dd.compression
> +        )
>          abs_out =3D os.path.abspath(out_path)
>          if abs_out in input_abs_paths:
>              raise ValueError(
> @@ -823,20 +1082,33 @@ def factor_dtb_files(args):
>          strip_local_fixups=3Dargs.strip_local_fixups,
>      )
> =20
> +    base_dtb_file_bytes =3D compress_blob(
> +        base_dtb_blob, base_dtb_comp, filename=3Dbase_dtb_path
> +    )
>      if args.outdir:
>          os.makedirs(args.outdir, exist_ok=3DTrue)
>      with open(base_dtb_path, 'wb') as f:
> -        f.write(base_dtb_blob)
> +        f.write(base_dtb_file_bytes)
> =20
> -    for out_path, dtbo_blob in zip(dtbo_paths, dtbo_blobs):
> +    dtbo_file_sizes =3D []
> +    for out_path, dtbo_blob, d in zip(dtbo_paths, dtbo_blobs, dtbs):
>          out_dir =3D os.path.dirname(out_path)
>          if out_dir:
>              os.makedirs(out_dir, exist_ok=3DTrue)
> +        out_bytes =3D compress_blob(
> +            dtbo_blob, d.compression, filename=3Dout_path
> +        )
> +        dtbo_file_sizes.append(len(out_bytes))
>          with open(out_path, 'wb') as f:
> -            f.write(dtbo_blob)
> +            f.write(out_bytes)
> =20
>      if args.stats:
> -        _print_dtb_stats(dtbs, base_dtb_blob, dtbo_blobs)
> +        _print_dtb_stats(
> +            dtbs, base_dtb_blob, dtbo_blobs,
> +            base_dtb_comp=3Dbase_dtb_comp,
> +            base_dtb_csize=3Dlen(base_dtb_file_bytes),
> +            dtbo_csizes=3Ddtbo_file_sizes,
> +        )
> =20
> =20
>  def main(argv=3DNone):
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index ea1d35cd8e4e..300f244f41c5 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -53,7 +53,10 @@ TESTS_DEPFILES =3D $(TESTS:%=3D%.d) \
>  	$(addprefix $(TESTS_PREFIX),testutils.d)
> =20
>  TESTS_CLEANFILES_L =3D $(STD_CLEANFILES) \
> -	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 tmp.* *.bak \
> +	*.dtb *.test.dtbo *.test.dts *.test.dt.yaml *.dtsv1 \
> +	*.test.dtb.gz *.test.dtbo.gz *.test.dtb.xz *.test.dtbo.xz \
> +	*.test.dtb.lzma *.test.dtbo.lzma *.test.dtb.lz4 *.test.dtbo.lz4 \
> +	tmp.* *.bak \
>  	treegen
>  TESTS_CLEANFILES =3D $(TESTS) $(TESTS_CLEANFILES_L:%=3D$(TESTS_PREFIX)%)
>  TESTS_CLEANDIRS_L =3D fs *.test.dir
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index e5ac38dd2bab..c18d824c7bc7 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -1261,6 +1261,84 @@ fdtfactor_tests () {
>  	run_test dtbs_equal_unordered fdtfactor_board${i}.nolf.test.dtb \
>  	    fdtfactor_strip.test.dir/merged${i}.test.dtb
>      done
> +
> +    # Compressed (.dtb.gz / .dtb.xz / .dtb.lzma / .dtb.lz4) modes
> +    for comp_spec in "gz:gzip -9 -k -f:gzip -d -f" \
> +		     "xz:xz -k -f:xz -d -f" \
> +		     "lzma:xz --format=3Dlzma -k -f:xz -d -f" \
> +		     "lz4:lz4 -12 -q -f -m:lz4 -d -q -f --rm" \
> +		     "lz4:lz4 -l -12 -q -f -m:lz4 -d -q -f --rm"; do
> +	ext=3D"${comp_spec%%:*}"

Because we use 4-character indent depth, we should consistently use
spaces to indent in run_tests.sh, not mix tabs and spaces.  Mixing
them here has the side effect of making these lines not look indented
=66rom the for statement in patch format.

> +	rest=3D"${comp_spec#*:}"
> +	comp_cmd=3D"${rest%%:*}"
> +	decomp_cmd=3D"${rest#*:}"
> +	if ! command -v "${comp_cmd%% *}" >/dev/null 2>&1; then
> +	    continue
> +	fi
> +	run_wrap_test $comp_cmd \
> +	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
> +	    fdtfactor_board3.test.dtb
> +	rm -rf fdtfactor_comp.test.dir
> +	run_wrap_test $PYTHON $FDTFACTOR -s \
> +	    --output-base-dtb "base.test.dtb.$ext" \
> +	    -o fdtfactor_comp.test.dir \
> +	    "fdtfactor_board1.test.dtb.$ext" \
> +	    "fdtfactor_board2.test.dtb.$ext" \
> +	    "fdtfactor_board3.test.dtb.$ext"
> +	run_wrap_test $decomp_cmd "fdtfactor_comp.test.dir/base.test.dtb.$ext"
> +	run_wrap_test $decomp_cmd \
> +	    "fdtfactor_comp.test.dir/fdtfactor_board1.test.dtbo.$ext"
> +	run_wrap_test $FDTOVERLAY \
> +	    -i fdtfactor_comp.test.dir/base.test.dtb \
> +	    -o fdtfactor_comp.test.dir/merged1.test.dtb \
> +	    fdtfactor_comp.test.dir/fdtfactor_board1.test.dtbo
> +	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
> +	    fdtfactor_comp.test.dir/merged1.test.dtb
> +    done
> +
> +    # Test magic-byte detection on a compressed blob with a plain .dtb
> +    # extension and an uncompressed --output-base-dtb alongside compress=
ed
> +    # inputs.
> +    if command -v gzip >/dev/null 2>&1; then
> +	run_wrap_test gzip -9 -k -f \
> +	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
> +	    fdtfactor_board3.test.dtb
> +	cp fdtfactor_board1.test.dtb.gz fdtfactor_board1_magic.test.dtb
> +	rm -rf fdtfactor_comp_mixed.test.dir
> +	run_wrap_test $PYTHON $FDTFACTOR -s \
> +	    --output-base-dtb base_uncomp.test.dtb \
> +	    -o fdtfactor_comp_mixed.test.dir \
> +	    fdtfactor_board1_magic.test.dtb \
> +	    fdtfactor_board2.test.dtb.gz \
> +	    fdtfactor_board3.test.dtb.gz
> +	run_wrap_test gzip -d -f \
> +	    fdtfactor_comp_mixed.test.dir/fdtfactor_board1_magic.test.dtbo.gz
> +	run_wrap_test $FDTOVERLAY \
> +	    -i fdtfactor_comp_mixed.test.dir/base_uncomp.test.dtb \
> +	    -o fdtfactor_comp_mixed.test.dir/merged1.test.dtb \
> +	    fdtfactor_comp_mixed.test.dir/fdtfactor_board1_magic.test.dtbo
> +	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
> +	    fdtfactor_comp_mixed.test.dir/merged1.test.dtb
> +
> +	# Explicit --base-compression overriding the --output-base-dtb filename
> +	# extension
> +	rm -rf fdtfactor_base_comp.test.dir
> +	run_wrap_test $PYTHON $FDTFACTOR --base-compression=3Dgzip \
> +	    --output-base-dtb base_custom.test.dtb \
> +	    -o fdtfactor_base_comp.test.dir \
> +	    fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
> +	    fdtfactor_board3.test.dtb
> +	mv fdtfactor_base_comp.test.dir/base_custom.test.dtb \
> +	    fdtfactor_base_comp.test.dir/base_custom.test.dtb.gz
> +	run_wrap_test gzip -d -f \
> +	    fdtfactor_base_comp.test.dir/base_custom.test.dtb.gz
> +	run_wrap_test $FDTOVERLAY \
> +	    -i fdtfactor_base_comp.test.dir/base_custom.test.dtb \
> +	    -o fdtfactor_base_comp.test.dir/merged1.test.dtb \
> +	    fdtfactor_base_comp.test.dir/fdtfactor_board1.test.dtbo
> +	run_test dtbs_equal_unordered fdtfactor_board1.test.dtb \
> +	    fdtfactor_base_comp.test.dir/merged1.test.dtb
> +    fi
>  }
> =20
>  while getopts "vt:me" ARG ; do
> @@ -1290,7 +1368,9 @@ if [ -z "$TESTSETS" ]; then
>  fi
> =20
>  # Make sure we don't have stale blobs lying around
> -rm -f *.test.dtb *.test.dtbo *.test.dts
> +rm -f *.test.dtb *.test.dtbo *.test.dts *.test.dtb.gz *.test.dtbo.gz \
> +    *.test.dtb.xz *.test.dtbo.xz *.test.dtb.lzma *.test.dtbo.lzma \
> +    *.test.dtb.lz4 *.test.dtbo.lz4
>  rm -rf *.test.dir
> =20
>  for set in $TESTSETS; do
> --=20
> 2.56.0.317.g454f8302e1-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--iTfKNL3zfqSi2iBg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr1IA8ACgkQzQJF27ox
2GeTXQ//doYF5tGc/aPLqw9xzx9DNwOmPsny8DNhFfBD3oRcLGiaFn4APSBlqNfx
Ycaj0055HTHP9dRIYplBXyuyCOeTXLdtHJasV5O2VWozpv3M11AT4vpvjYieD67L
n6VhKmsphk8Zyk/tALqU76lCaI7Ts4KNvdrAu2WezUKDI7bcb+0KmegTKtQ/mEwB
z/2poWHL2tXX9KeZAZwVnG+kGwCIvi1o5nqKYmh68GqE3zoUqUI4tBJk2jFZcVZ5
XcA5lktnOrq6d3iDhP3CAExvzc25r66lkTou7WK6tCnWJV8l8qtrDs9CI5YZ+Qgb
LmjvoIgeLX+TdvkO12shps3SdN6+puys+rXfEtiBRiPAlG8mVlsK3JTNLEYyLGEJ
gZDHwhqD99M+y2lMscXxCqRGVC7hRK11ZuzcIMS4BWpO8Q2JiwcvbFa28AJdsFkh
vfgkvE0AsvQezrt6HZYGqYM8RNI6w0eSZjxFtxmCvkE9sO7ZLaPy+xFFka97jmQG
F3ezTVhhYHuS9kYZmgYExiMF91J2muEO6Vkt/rUoTE1Lu5pPs2K2E1sBTXTR6r1A
HHXbjGt1ZSzjqIB/bFkt4EtLTOq5L7FET8l2w5hRs4KeIK7FCAHc04N/ITbn/ajs
57Tj1khRuCJ+m+HcEXOl3m6qXXwo5eF1O5dZ3LflSRtPeKBn4sM=
=y6lV
-----END PGP SIGNATURE-----

--iTfKNL3zfqSi2iBg--
