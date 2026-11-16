Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803689;
	b=ARnvM4n9+E+2OvB57n6CQXvOf1A5I8GPp9thC/xcKEqCnhRfWi2F8iP0ngQVXgWGyj9n
	 U7aul3X80JA10L72eajj8NkXoI0KSBOCZ5p+n6JiSmFeutV0HNfGuP6fYp77HlTmv7nSA
	 m68P6YxfmFYhuqUL0FonseEm0rz3/uC0w7OzqIuJK8XCGTJNmW1eWNCcoR2wMAYKR58d5
	 fYwP1Vhz07AloAfswYuSZ8Q5xatvYwmjJTNdBw7hozQRxsofWcb/oN3AzrCzOGp53VOwU
	 ozCsv55oXT7a/flZvg8/C4BlPKmRf83CTXCb4q0GMJMZF6x7PdLugvkNZYJkeSxQtQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803689;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=tfXPl4aRXr/vwYUpAUcAtXGBOfrzTY2olnjQpNO4XF8=;
	b=R0U3nYlXLFijVDCHSfWZPUSs693fbmVaarSqdhHqUFt5XzpQuXFzsZxJv1PHoMKthpU2
	 nLT+d19A6G2zBRQal7vPW6B1E5GtYTieF66yE9fFZSOc4+LA4Pu2+9puxO23qaClpeUUG
	 cplPC3maAXJ5gTyj7nJ78BAfMy2i9bXdb/WmCS0Zu0k5RYUOlH2gDR1eG1eJiR+4mHJrp
	 fqf0jlyl2MqLCrRf02zAUPyQn7gD3LnBVZY2/RM6hTiFF4ma/QuSALjC9wfvEOD+gM5Ud
	 BkaKdmilktdl/pSdHgxcXAZqr488np3k3CuWOpJeJQnUXArJa+q3CUoKvuYStdCfTmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=hvUMTzDY;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F15606A31C;
	Mon, 16 Nov 2026 04:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F15606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=hvUMTzDY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794803680;
	bh=tfXPl4aRXr/vwYUpAUcAtXGBOfrzTY2olnjQpNO4XF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvUMTzDYDhULEk3V6XCsgHYIsiPpBfooRjvVWNDxyXiIdXd8e8zWebQAvOaX0FoKs
	 NPKys9bON4uubg7ymGos29mUtQAd5us4eZVtt+Kjw734LBZsKHwPxThvs2DwLp366j
	 XVMW1HCAGFKwc5WkGWsBynKVtxorbhWdjNuaUUDPDQU7lEW5BfMOarfdBfH4LvJS3f
	 DFn0mXhcX17qxW2UD+7Jxjq2RwxPWMXWnQVKwV/RguwM1k6RM0q8JcTSWr43zjmRdj
	 E7mQwyrQ7yjxNbRS2C7GJ/jiUID5r0P2/4f9ZcP9PQb0fyIDPZgVcTEPKqSV30OqMc
	 EjkFF7Ur5XgHQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jSZlN1dmYz4wLq; Mon, 16 Nov 2026 15:34:40 +1100 (AEDT)
Date: Mon, 16 Nov 2026 14:44:50 +1100
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
Subject: Re: [PATCH v3 15/15] fdtfactor: Add compiled FIT factoring support
Message-ID: <avp8MTOt0KtLJPJW@gractus.seuss>
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-16-dianders@chromium.org>
 <avUlA_KSHKmmSz5p@gractus.seuss>
 <CAD=FV=WGTD8FtjPFE5mFSJP343Z9-2HNXHH3g4usqpWPVuwPUg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="eirz1MjsXzTtwp9g"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WGTD8FtjPFE5mFSJP343Z9-2HNXHH3g4usqpWPVuwPUg@mail.gmail.com>

--eirz1MjsXzTtwp9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 09:23:54PM -0800, Doug Anderson wrote:
11;rgb:1c1c/1c1c/1f1f> Hi David,
>=20
> On Wed, Nov 11, 2026 at 6:31 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Sun, Nov 01, 2026 at 02:01:22PM -0800, Douglas Anderson wrote:
> > >  * `-o`, `--outdir`: Output directory for generated `.dtbo` files and
> > >    `--output-base-dtb` (default: alongside each input `.dtb` for `.dt=
bo` files,
> > >    current directory for `--output-base-dtb`).
> >
> > Even though one's a directory and one's a file, using different output
> > options for the FIT/non-FIT cases seems kind of awkward to me.
>=20
> Makes sense. In my draft v4 I've unified both into `-o` / `--output`
> (output directory in standalone `.dtb` mode; output FIT file path in
> `-F` / `--fit` mode, defaulting to updating `--fit` in place) and
> dropped `--outfile`.

Sounds good.

> > > +* `-F`, `--fit`: Factor `/images/fdt-*` blobs inside a compiled FIT
> > ...
> > > +* `--outfile`: Output FIT path when `--fit` is used (default:
> > > +  overwrite `--fit` in place).
> >
> > That's a lot of fiddly detail to fit in the description of a single
> > option.  Maybe move it out into its own doc section.
>=20
> Done in my draft v4 -- split the `README.md` options (and `--help`
> groups) into common options, a `### Standalone DTB Factoring`
> subsection, and a `### FIT Factoring` subsection.
>=20
>=20
> > >          if _is_dtbo_overlay(fdt):
> > > -            raise ValueError(
> > > +            raise OverlayBlobError(
> >
> > This change seems unrelated to the rest.
>=20
> In a FIT `/images` node, both full `.dtb`s and pre-existing `.dtbo`
> overlays use `type =3D "flat_dt"`, so `_extract_fit_fdt_entries()` had
> added `OverlayBlobError` to catch and skip `.dtbo` nodes while letting
> other `ValueError`s propagate. Using an exception for that control flow
> was clunky, though -- in my draft v4 I've dropped `OverlayBlobError` and
> check `_is_dtbo_overlay()` directly in `_extract_fit_fdt_entries()`
> before constructing `ParsedDtb`.

Ok.

> > > +        algo =3D sub_node.get_str('algo')
> > > +        sub_node.props['value'] =3D libfdt.Property(
> > > +            'value', _compute_fit_hash(algo, data_bytes)
> >
> > This assumes the FIT naming of hash algorithms is identical to the
> > hashlib one, which seems a bit risky.
>=20
> Agreed. In my draft v4 I've replaced `hashlib.new(algo_name)` with an
> explicit `FIT_HASH_ALGOS` dispatch table mapping the standard FIT `algo`
> names (`crc32`, `md5`, `sha1`, `sha256`, `sha384`, `sha512`) to their
> `zlib` / `hashlib` implementations and raising `ValueError` on unknown
> names.

Since crc32 is not in hashlib, you could even set up the map to go
direct from the FIT name to a function which computes the hash.

> > > +def group_fit_dtbs(fdt_entries):
> > > +    """Partition FIT `flat_dt` entries into compatible factor groups.
> > > +
> > > +    DTBs are grouped by `(compression, arch, load, entry, boot_cpuid=
_phys,
> >
> > Why should compression play a role in the grouping?  The internal dtb
> > data doesn't depend on that.
> >
> > I'm not sure what the 'load' and 'entry' fields do, so it's not
> > obvious to me whether they make sense here either.
>=20
> * `compression`: Agreed -- in my draft v4 I've removed `compression`
>   from grouping (and from `--single-base-dtb`'s compatibility check),
>   recompressing each overlay `/images/fdt-*` node according to its own
>   `compression` property and `fdt-base-N` according to the group's first
>   entry's `compression` property.

Ok.

> * `entry` and `load`: In the FIT spec, `entry` is the CPU entry-point
>   address for executable images (`kernel`, `standalone`, `firmware`) and
>   isn't meaningful on `flat_dt` nodes, so I've dropped `entry`

Ok.

>   completely. `load` is an optional physical RAM address telling the
>   bootloader (e.g. U-Boot's `boot_get_fdt_fit()`) where to load the base
>   FDT before applying overlays: two `flat_dt` nodes with different
>   `load` addresses can't share a single `fdt-base-N` node (since
>   `fdt-base-N` can only carry one `load` address), and `load` is
>   stripped from the `.dtbo` overlay nodes so a bootloader doesn't copy
>   an overlay directly on top of the base FDT at `load`. I've added a
>   comment explaining `load`.

That makes sense.

> > > +    mem_rsv)` and node-path overlap (>=3D 50%) against the group's c=
ommon node
> >
> > Overlap >=3D 50% seems a very arbitrary condition here.
> >
> > > +            common_nodes =3D grp['common_nodes']
> > > +            union_len =3D len(entry_nodes | common_nodes)
> > > +            overlap =3D (
> > > +                len(entry_nodes & common_nodes) / union_len
> > > +                if union_len
> > > +                else 1.0
> > > +            )
> > > +            if overlap >=3D 0.5:
> > > +                grp['common_nodes'] &=3D entry_nodes
> > > +                grp['entries'].append(entry)
> > > +                placed =3D True
> > > +                break
> >
> > Reimplementing the common path analysis, rather than somehow utilizing
> > the calculations you already implemented in the factoring itself seems
> > unfortunate.
>=20
> The usage model for `group_fit_dtbs()` is a multi-SoC kernel FIT (for
> example, building `arch/arm64`'s `image.fit` across all enabled Qualcomm
> or ARM64 boards, which bundles hundreds of DTBs spanning many distinct
> SoC families).
>=20
> Looking at your two points here, I initially tried dropping the overlap
> percentage altogether by running `create_base_dtb_and_overlays()` on
> each candidate group and merging whenever factoring reduced total size.
> Testing that on a FIT containing all 438 upstream arm64 Qualcomm DTBs
> was much too slow, though: rebuilding `base.dtb` and every member's
> `.dtbo` on each candidate check (`O(N^2)` `.dtbo` builds) took nearly
> 90 minutes.

Ah, right.  I guess I hadn't realised FITs were built containing so
many disparate trees.

> To address both of your points while only building `.dtbo`s once per
> final group, in my draft v4 I've:
> 1. Replaced the unweighted node-path overlap check with byte-weighted
>    overlap over `ParsedDtb`'s already phandle-normalized `(path, name,
>    prop, fixups)` properties, reusing `select_best_candidate()`'s
>    `_prop_byte_cost()` calculation directly and picking whichever
>    compatible group has the highest overlap.
> 2. Added `--min-overlap PERCENT` (default `50`) so the overlap threshold
>    is configurable rather than a hardcoded constant.

Feels like there should be a more elegant way, but this will certainly
do for the time being.

> Testing `fdtfactor -S -F` on the 438-DTB Qualcomm `image.fit` finishes
> in ~12 seconds, grouping 426 of the gzipped DTBs into 41 `fdt-base-*`
> groups (leaving 12 single-board SoCs unfactored). Compared to a
> standard `image.fit` built without `-@ -L`, that shrinks the embedded
> DTBs by 61% (9.27 MB -> 3.59 MB gzipped; overall FIT 22.48 MB ->
> 16.81 MB including the 13.09 MB kernel).
>=20
> -Doug
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--eirz1MjsXzTtwp9g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr6fDEACgkQzQJF27ox
2GfSqg//TLKZmmo90h+0rBlX5IB7fSuxpPuvV+Ncosa+/rmZuNzKoMhQF9gI34TO
1XAJJ3zw3rVOGR+SP4lG1mmiaV1U0OubP1Puz3u1MjljuYxPEeKbIRKp089P/xkK
Lgigoh6Wqz6q3xRprz+cCKlvNSmOzLX/MlmEmxdv9c32zpN/9tr9FF8PqW1XXlYZ
D/vyJpi1GESsvD032sQebz/bN3JeczWPmqsFBGyfp+48DfKCS1Q9PYEsXBfRg5fm
t8L3NSYcUrA3jl1FKko239M3Hl+XYbR4ZnH77tKwS3LO+zX1ejIwpkNAesNI5WuU
JTuKbNXyLe8c5H7o+KX0x5K0jMmVL9uB1Viox7jL21ni/vasIDqupJS7p41rSSR+
yKiiFzdXFq0LOuAaN6OMrSOHFbHgxnolnFUpU/OwrCnflSdG7DfkYA3h5doWhIKb
k0FoSxsEfeTZRthNK5STlDYT6gP6cShyqbeQ/LZMfK5xukC0TUqK6diCN42yKcMl
LEE9nfIzVtuFIlYtgOvi5cK8OqOEvVaaHnqUggD2nV8KwHPe/EN6W4I0iyr8o0l8
kHlxmsC4HgoRrfT9dkEzJRHndcXWgEbbRSilOSJZIkOKtaoGru2x4N2ms8QDsxUI
QoGhO07CCv5U2U0ttwLwvObrkkiwxY8s0JViy6V6j8PaxSYFUlQ=
=Usbv
-----END PGP SIGNATURE-----

--eirz1MjsXzTtwp9g--
