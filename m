Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423165;
	b=NAF0ZqQY+lrM/ef3OJUqNk8jey5/aNfOwlhpx9YHKmIMvliA2ygyLSGzBKzKeW+am0OQ
	 TuczDRw7LR6hlgZAPmKe1ZC8KqhlGVMiRhZ8PQKyFzepK01i5k9D7W+cOTt346bA66fmx
	 aEA5dqhsLqHKwBYyFGWFewMeJ8q6Jyn93Z0HI82YI/gDNv0OmyUiueTisTblYS+N05Jh5
	 SNTAHyS4vx1GaZGpUyJEBBpkkvGYchypoRLC8xCL7L3ZZXAeQZALyt5yrCUGDRRsi0+sO
	 DvXgyrji3ll+dNFvbxA0dxtaL7s+APbsoaLSQtSHY9Iz9HZzet89fk+FRRZknrDnrrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423165;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=1X1I2XVsQUjOS3XJ9945Gghc9JqNZPGATrJ5/4kxTvI=;
	b=nQUBEcf8khaa7U+iWlT/+rw1mUNp6eADk4e7SpmHVb6lz914o3Js0ezjhfm7DSHYWnnP
	 telLYvElEAK65MB1fto+FeIc4ew966j4eExceCdOCLen0FeLmQd5O3pe8CiLj7tfKr8Ck
	 Zj3UphCDBAmZpa5qyGPqB6TY7lCDTc9Ju6X8dSh2xPHf1WBomm2jRHlkIOD/b7FluhMwF
	 948kA06K3+vNiP7tB6kO0H3l8LVj8LynimvQKEMuSC8aTB0zwGFK38YULHAcpEJD5kZEL
	 6zg/i2+zUtocEHYmkkihIEpBEtAwZiZ/4qqUP2TGIn2C1vB8TXRXJzinfL5foZgyruw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=rtArZuUr;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622EE606A31A;
	Mon, 23 Nov 2026 08:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 622EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=rtArZuUr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795423161;
	bh=1X1I2XVsQUjOS3XJ9945Gghc9JqNZPGATrJ5/4kxTvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtArZuUr8gkUJrICwMjHcV8tnGmyFu7crAogPvbYqIqzpCrnqNqR6GRQ7YoxHv0MS
	 VrUvVKOM1y4O45tKMxgAiMriHqhSJ8lSPd9L4WA0ExqpHe/xmE9Dyx0T2j+E0z/sVb
	 FoQmuVe06wvHfaJcJ5mT6tThBDjAvJvNqWBDFrojLeRwSuOVxQ7X1vbYNdVF+0FnY8
	 BrsfcYFbkANhXrwncoe7J5TEXHeICtKOQK7rQtyQwAloFfT2XEdTylji/xGR95iuRv
	 XzO1wk6f6EusrYukaIJ51HBbxMxaJeVV99n9VvOmhkczvHDEZ9neO98Rl8McJimgAH
	 zm98cvF4Glhug==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jXzrT46S6z4wJr; Mon, 23 Nov 2026 19:39:21 +1100 (AEDT)
Date: Mon, 23 Nov 2026 14:31:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C
 helper
Message-ID: <awOzcZqcrKwMjE7e@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-7-dianders@chromium.org>
 <avvOUIIn9t00XqY_@gractus.seuss>
 <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="5cBzf0qMvVK0DJuQ"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com>

--5cBzf0qMvVK0DJuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 08:17:33AM -0800, Doug Anderson wrote:
> Hi David,
>=20
> On Mon, Nov 16, 2026 at 7:47 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > > On one stress test (walking all ~573k nodes and ~2.06M properties acr=
oss
> > > 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> > > ~1.8x.
> >
> > Hm, optimizing pylibfdt has never been a focus, on the general
> > assumption that if speed is really important to you, you shouldn't be
> > using Python.  I'm happy enough with patch 4, because it's a speed win
> > with a very small and simple change.  This optimization is a much
> > larger chunk of code, so I'm not so convinced this is worth the source
> > complexity we pay for it.
> >
> > That's not an outright rejection, but I'd need convincing this is
> > worth it.
>=20
> Right, if we're trying to get the absolute maximum speed then of course
> we wouldn't choose Python. For a tool like `fdtfactor`, speed is
> certainly not the top priority and Python is the superior choice.
> Writing it in C would have been a much bigger pain.
>=20
> That all being said, just because speed isn't the top priority doesn't
> mean it doesn't matter at all. When I started looking at optimizations I
> was seeing my 438-DTB run take ~25 seconds, which is just a bit too
> much. With all the optimizations I ended up with ~12 seconds. That's
> still a lot and it would be nice to make it even better, but it also
> starts getting into the realm of acceptable.
>=20
> `FdtRo.properties()` stood out in profiling because
> `DeviceTree.unflatten()` calls it on every node (~573k nodes / ~2.06M
> properties across the 438 Qualcomm DTBs). In the pure-Python generator,
> each node makes `1 + 2 * num_props` SWIG calls (~4.7M boundary
> crossings, each going through Python `check_err` / `check_err_null`
> wrappers and generator suspension/resumption) and allocates a fresh
> non-interned `str` for repeated property names like `compatible`, `reg`,
> `status`, and `phandle`.
>=20
> Below is a small standalone script (`bench_properties.py`) that builds a
> 1,300-node (~140 KB) DTB in memory via `FdtSw` and walks it 400 times
> (~520k nodes, ~2.08M properties) with patch 06/14 applied. On my
> machine:
> * Default `meson setup build` (`-O0`):
>   - `FdtRo.properties()`: `2.52s -> 1.50s` (1.68x faster)
>   - Full tree walk: `3.35s -> 2.25s` (1.49x faster)
> * `meson setup --buildtype=3Drelease` (`-O3`):
>   - `FdtRo.properties()`: `1.76s -> 0.98s` (1.81x faster)
>   - Full tree walk: `2.24s -> 1.43s` (1.57x faster)
>=20
> On the source-complexity side, roughly half of
> `fdt_node_properties_stub()` in v4 is repetitive `Py_DECREF`
> error-cleanup boilerplate -- using `PyObject_CallFunction(prop_cls,
> "Oy#", ...)` and a single `err:` label trims it from 55 lines down to
> ~30 lines. That said, as noted in the patch notes, ~1 second on a
> 400-DTB run isn't make-or-break, so if you'd still rather not carry the
> C helper in `pylibfdt/libfdt.i` I'm totally fine dropping this patch in
> v5 (or trimming it to the ~30-line version if that tips the
> balance).

Let's leave it out for this series.  I'm ok with revisiting this
later.  Fwiw, gotos for error handling are generally acceptable (along
the lines commonly used in the kernel, if that helps).
>=20
> ---8<---
> #!/usr/bin/env python3
> # SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> # Run from the dtc repo root after applying patch 06/14 and building:
> #   meson compile -C build && python3 bench_properties.py
> import os
> import sys
> import time
>=20
> if os.path.isdir('build/pylibfdt') and 'build/pylibfdt' not in sys.path:
>     sys.path.insert(0, 'build/pylibfdt')
>=20
> import libfdt
> from libfdt import QUIET_NOTFOUND
>=20
>=20
> def old_properties(fdt, nodeoffset):
>     poff =3D fdt.first_property_offset(nodeoffset, quiet=3DQUIET_NOTFOUND)
>     while poff >=3D 0:
>         yield fdt.get_property_by_offset(poff)
>         poff =3D fdt.next_property_offset(poff, quiet=3DQUIET_NOTFOUND)
>=20
>=20
> def unflatten_walk(fdt, props_fn):
>     off, depth =3D 0, 0
>     while depth >=3D 0:
>         props =3D {p.name: p for p in props_fn(fdt, off)}
>         if depth > 0:
>             fdt.get_name(off)
>         off, depth =3D fdt.next_node(off, depth)
>     return props
>=20
>=20
> def make_sample_dtb(num_nodes=3D1300):
>     sw =3D libfdt.FdtSw()
>     sw.finish_reservemap()
>     with sw.add_node(''):
>         sw.property_string('compatible', 'example,board')
>         sw.property_u32('#address-cells', 2)
>         sw.property_u32('#size-cells', 2)
>         with sw.add_node('soc@0'):
>             for i in range(num_nodes):
>                 with sw.add_node(f'dev@{i:x}'):
>                     sw.property_string('compatible', 'vendor,periph')
>                     sw.property('reg', b'\x00\x00\x00\x00' * 4)
>                     sw.property_string('status', 'okay')
>                     sw.property_u32('phandle', i + 1)
>     return sw.as_fdt()
>=20
>=20
> def main():
>     if not hasattr(libfdt, 'fdt_node_properties_stub'):
>         sys.exit('Apply patch 06/14 and rebuild pylibfdt first')
>=20
>     fdt =3D make_sample_dtb()
>     offsets =3D []
>     off, depth =3D 0, 0
>     while depth >=3D 0:
>         offsets.append(off)
>         off, depth =3D fdt.next_node(off, depth)
>=20
>     iters =3D 400  # ~520k nodes, ~2.08M props (similar to 438 arm64 DTBs)
>=20
>     t0 =3D time.perf_counter()
>     for _ in range(iters):
>         for o in offsets:
>             for _ in old_properties(fdt, o):
>                 pass
>     dt_old =3D time.perf_counter() - t0
>=20
>     t0 =3D time.perf_counter()
>     for _ in range(iters):
>         for o in offsets:
>             for _ in fdt.properties(o):
>                 pass
>     dt_new =3D time.perf_counter() - t0
>=20
>     t0 =3D time.perf_counter()
>     for _ in range(iters):
>         unflatten_walk(fdt, old_properties)
>     dt_unf_old =3D time.perf_counter() - t0
>=20
>     t0 =3D time.perf_counter()
>     for _ in range(iters):
>         unflatten_walk(fdt, libfdt.FdtRo.properties)
>     dt_unf_new =3D time.perf_counter() - t0
>=20
>     sz =3D fdt.totalsize()
>     print(f'{len(offsets)} nodes ({sz:,} B) x {iters} trees:')
>     print(f'  FdtRo.properties() old (SWIG loop): {dt_old:.3f} s')
>     print(f'  FdtRo.properties() new (C helper):  {dt_new:.3f} s '
>           f'({dt_old / dt_new:.2f}x faster)')
>     print(f'  Full tree walk     old:             {dt_unf_old:.3f} s')
>     print(f'  Full tree walk     new:             {dt_unf_new:.3f} s '
>           f'({dt_unf_old / dt_unf_new:.2f}x faster)')
>=20
>=20
> if __name__ =3D=3D '__main__':
>     main()
> --->8---
>=20
> -Doug
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--5cBzf0qMvVK0DJuQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsDs3EACgkQzQJF27ox
2GdEFQ//bi4TDqTXcQQeaZgNl5CwJCosGHHb7hbnAzZ505qfISKnAUwWi+HDIdL9
duVQWDcI+4SeGC9Vf3Y4cj7jNe2o6K/WFdzMbQJ33M808s+8GUaLLzETK2zRO7VN
nF79Ka3uOtRUwNovTyBcpuRtr2R90pHx6zG25Z3nAdMhJ2+fEJ03RZFXP+6UTL3I
O09mCir0xx9PGl8tehbp8lHKbL2pCDHUhi9Wd4n1mwpQRqkMiNbbFlQSDr3x2M6z
cgmAy8L5dzGclv2N9LColdTQhn2M7QUwAjBdfDPUBv8QTj9EDh7VY7PWy/LQkQzi
0ytMI0gy8MUb9IgeNHVona5DXHNVoN6MipbigJnEFmCfdV1HswxVUg1rqYjxpm4l
quc/kG3VCe8a4ftx1rDfnyMMcQoAL1ta74owr/q6ORTbjBq6hPMRjf266ZJRLgHt
lKmheqsUyj/8wcNCc4qK81x7mk6WETbN/PziamF97LsYp6Q57RfxuSUv5lsNnlTl
kOcskCyYCrx9NWPu9/C/8tDLMk4QFyRM6a0m1yzkAg5hhJNIyjw0maKxZMJ9Q9/j
n49LDIHyvfV08QWeQIG6TYG2+nRO88q84AdIoQ54CnkVpnuDmnMe4kEuqumvFRlP
PbGGf8ofxVek9i6iE5QLVjCKgI3HezMDcm8XDR7RWwuCAJWQlHk=
=JbwF
-----END PGP SIGNATURE-----

--5cBzf0qMvVK0DJuQ--
