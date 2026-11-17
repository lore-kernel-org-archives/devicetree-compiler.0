Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932739;
	b=jiWWfbVUoZbgdKJJL1qwVd8QYJNriZH1GazVqtqebQQxAFSYYtoebsWbd7bkMKsWglwT
	 ggruL7WMa/KcvcrfWPqiGKP29o7RzbetG3T93gs/a/YZjCPBbSSpe7D9xXK6YnpUGW74u
	 NxBz//KD5Fk0HI7TKlz0PwiYj0xRc5+yVh1y0Oa13m8Pk8t1c/GtRz1Y17T7Kd0R25AeO
	 Zm/VeJg/ORwYvKHqypw/A7WF6giytKAAwiseK+HIgXWHCllYOuQQSfTJJ1DL2WMP7mZ19
	 GLAlpK8qRSzFy2TQyhfxq/5oGT6WSiysZSmSQqORxOU42/CnaWDlgjgwUMUq5KyAsbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=JRkNuO7f+W9Ho8PIBHE7MaDQUw/2iOTiv6p4KY7Nkys=;
	b=YKe0riby1ihuyfyxPhnWSAus8ikYnDqrT9HQff4sVjSzd8HkAPmrdZbzPxlR113lgXpN
	 bIh59+h+W14gVu66TlplpneWDX8kIqLjSKY4czmcxS3iL3lDVUSvSc2NmvhFpEyRBlcWG
	 pbEMPVokpZh89kP2iXmeyfp+5b9PmjGF/kagMaSs4qbg/caq6hiRqYrX4B3+e21WYmQkG
	 Fu6pgfB6ty791M2tgx1iBcvhiCuthYfngkSzlk50Emf7YId8TJa74DiRaQdcT/gi+rq40
	 KNcCQJuJ6xViy2SlvfDw0ScZjMUlRHl4x7e54I5V66+oOjRdPCuIhzTVFQKMWEVWL2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VwKtsoXG;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A8606A31C
	for <Devicetree-compiler@vger.kernel.org>; Tue, 17 Nov 2026 16:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VwKtsoXG
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so1442987a12.1
        for <Devicetree-compiler@vger.kernel.org>; Tue, 17 Nov 2026 08:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794932737; x=1795537537; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRkNuO7f+W9Ho8PIBHE7MaDQUw/2iOTiv6p4KY7Nkys=;
        b=VwKtsoXGA2XGeso7YQ8LhSVp2UFRDi0WDl0arUiyJ2mEktKQVXNvcBrWIBlxL2HNTP
         q+0jW4iftN3bungDrkivdeWNHNAFVsIOocBHTj6BShZtWoTyJMgaewq3IK2R6MoQKCEw
         wP0NNFMYqT/xde0omjTO2smQX5e85814OJjKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932737; x=1795537537;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JRkNuO7f+W9Ho8PIBHE7MaDQUw/2iOTiv6p4KY7Nkys=;
        b=q566vgfX7ZAopxR4I2JY6NWPM29WSdqyooxWxBBJUATq2xzuqJBoOjOBND/HB9omI+
         uEyiEFOimhzdWP6T95rsPK+VfRzgWNuxaDv1FU0avCCNM4CckfaVpUjvj9wXFeC9i5c/
         x/C8ZiV3An4fhyQhU/sAqPftxj8rCjbuHQVGprd7oV2Rh9F68tW59jhCvGCMQYpxDPri
         M740aggjdbi6beUhUxmN12tLLLnzoLa4rtDD3XVOZpTaY/dHHw0RNpSfjsrJM0ohbUjR
         8Xz8PvtmxXeCoJ3F+5JEWoF9HR1LI8DyrjFtgkrCxjm/AOC1xwz1QYpbgXBBh5qGnukI
         pfhQ==
X-Gm-Message-State: APuU4Z+XZaokttsbuhkSo7+1GrbZdVOlcUP/+HgvIflG9Fo5Rm0ucGCb
	tS6iWDt4P7bmG2bhoeOgN6+n5+kKWLmH1xzwg5gr1JPNoG8ekfarH4Z0A+LgQeXoeBp35USo4LK
	RgVPDY7Cx
X-Gm-Gg: AYBFou2JSnwgj/t8OYrAHDuDLMeldN0aw7mj0Hvxj/mGRCxI3ipbzhInBVa3eAAvxQ+
	ZFAa6Y26F7M1myE305Tl50kiEol/0hk0O5K6dDucgvbQZGvTmBDS22Cla7yeXl6AAbkalGTXVWM
	woUE0WyVUOaQHARIbFfMMbJjbH2+9Mkrm99fKUAZ48K6b9+zzLiLHBlPqc4h3PxNYmRFZA3NPpe
	a0rENZn1nafYZCQNaeT1yxQwv+DBdZofy3zDwxf0+lGG1sEaQhK6zBw2DYCNijl2VjErYv6wypy
	DDc9BYNwYdZKH9Z8eqlM18kYq8b9r6J4kvxoDUVmQCA38F1d+Xf7MwM5Yz7xP7fmVw/pvSGGf5F
	JV+vJwepJLZTzBIIcYD4xKaB4SnFBxZiQY+wV8NTRxbrfodpiaonGUeMjpEY1NvkYD6u9t5Fc+d
	VS9nAU+WWl9bTcAb8uyWRj/yhbGNHt67NP4yKmc2r4h+bhyYDrOkBvfk+BSNHvdtcqfvewxYG+m
	rB8/wh2MUoTVPqVVizTAxLfdOQoQHAw54LMuDcVENjsOfTf9sv1EpRPv+kiw8Sz8WeJ0EtKhZWQ
	mkW+qCWp+I28sJSdTgf1lLRjHz9w1IpKRD0R2lgoUtRA0XChksK3z46rmrT4LCr48b95
X-Received: by 2002:a05:6402:5022:b0:6b7:d189:6041 with SMTP id 4fb4d7f45d1cf-6b8595bf062mr2640914a12.2.1794932737161;
        Tue, 17 Nov 2026 08:25:37 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886bcf624sm7298a12.21.2026.11.17.08.25.36
        for <Devicetree-compiler@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:25:36 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso933170a12.0
        for <Devicetree-compiler@vger.kernel.org>; Tue, 17 Nov 2026 08:25:36 -0800 (PST)
X-Received: by 2002:a05:6000:2201:b0:495:728a:5f6f with SMTP id
 ffacd0b85a97d-4a36fc5d49bmr7617593f8f.19.1794932265537; Tue, 17 Nov 2026
 08:17:45 -0800 (PST)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-7-dianders@chromium.org> <avvOUIIn9t00XqY_@gractus.seuss>
In-Reply-To: <avvOUIIn9t00XqY_@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 08:17:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com>
X-Gm-Features: Aa3M54oBu4xzuKNJkEO-tZuQ5G1JdKIa1DFQA984jaIf5jsKQ9Mw1Z6-99t_t0I
Message-ID: <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, Nov 16, 2026 at 7:47 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > On one stress test (walking all ~573k nodes and ~2.06M properties across
> > 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> > ~1.8x.
>
> Hm, optimizing pylibfdt has never been a focus, on the general
> assumption that if speed is really important to you, you shouldn't be
> using Python.  I'm happy enough with patch 4, because it's a speed win
> with a very small and simple change.  This optimization is a much
> larger chunk of code, so I'm not so convinced this is worth the source
> complexity we pay for it.
>
> That's not an outright rejection, but I'd need convincing this is
> worth it.

Right, if we're trying to get the absolute maximum speed then of course
we wouldn't choose Python. For a tool like `fdtfactor`, speed is
certainly not the top priority and Python is the superior choice.
Writing it in C would have been a much bigger pain.

That all being said, just because speed isn't the top priority doesn't
mean it doesn't matter at all. When I started looking at optimizations I
was seeing my 438-DTB run take ~25 seconds, which is just a bit too
much. With all the optimizations I ended up with ~12 seconds. That's
still a lot and it would be nice to make it even better, but it also
starts getting into the realm of acceptable.

`FdtRo.properties()` stood out in profiling because
`DeviceTree.unflatten()` calls it on every node (~573k nodes / ~2.06M
properties across the 438 Qualcomm DTBs). In the pure-Python generator,
each node makes `1 + 2 * num_props` SWIG calls (~4.7M boundary
crossings, each going through Python `check_err` / `check_err_null`
wrappers and generator suspension/resumption) and allocates a fresh
non-interned `str` for repeated property names like `compatible`, `reg`,
`status`, and `phandle`.

Below is a small standalone script (`bench_properties.py`) that builds a
1,300-node (~140 KB) DTB in memory via `FdtSw` and walks it 400 times
(~520k nodes, ~2.08M properties) with patch 06/14 applied. On my
machine:
* Default `meson setup build` (`-O0`):
  - `FdtRo.properties()`: `2.52s -> 1.50s` (1.68x faster)
  - Full tree walk: `3.35s -> 2.25s` (1.49x faster)
* `meson setup --buildtype=release` (`-O3`):
  - `FdtRo.properties()`: `1.76s -> 0.98s` (1.81x faster)
  - Full tree walk: `2.24s -> 1.43s` (1.57x faster)

On the source-complexity side, roughly half of
`fdt_node_properties_stub()` in v4 is repetitive `Py_DECREF`
error-cleanup boilerplate -- using `PyObject_CallFunction(prop_cls,
"Oy#", ...)` and a single `err:` label trims it from 55 lines down to
~30 lines. That said, as noted in the patch notes, ~1 second on a
400-DTB run isn't make-or-break, so if you'd still rather not carry the
C helper in `pylibfdt/libfdt.i` I'm totally fine dropping this patch in
v5 (or trimming it to the ~30-line version if that tips the balance).

---8<---
#!/usr/bin/env python3
# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
# Run from the dtc repo root after applying patch 06/14 and building:
#   meson compile -C build && python3 bench_properties.py
import os
import sys
import time

if os.path.isdir('build/pylibfdt') and 'build/pylibfdt' not in sys.path:
    sys.path.insert(0, 'build/pylibfdt')

import libfdt
from libfdt import QUIET_NOTFOUND


def old_properties(fdt, nodeoffset):
    poff = fdt.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
    while poff >= 0:
        yield fdt.get_property_by_offset(poff)
        poff = fdt.next_property_offset(poff, quiet=QUIET_NOTFOUND)


def unflatten_walk(fdt, props_fn):
    off, depth = 0, 0
    while depth >= 0:
        props = {p.name: p for p in props_fn(fdt, off)}
        if depth > 0:
            fdt.get_name(off)
        off, depth = fdt.next_node(off, depth)
    return props


def make_sample_dtb(num_nodes=1300):
    sw = libfdt.FdtSw()
    sw.finish_reservemap()
    with sw.add_node(''):
        sw.property_string('compatible', 'example,board')
        sw.property_u32('#address-cells', 2)
        sw.property_u32('#size-cells', 2)
        with sw.add_node('soc@0'):
            for i in range(num_nodes):
                with sw.add_node(f'dev@{i:x}'):
                    sw.property_string('compatible', 'vendor,periph')
                    sw.property('reg', b'\x00\x00\x00\x00' * 4)
                    sw.property_string('status', 'okay')
                    sw.property_u32('phandle', i + 1)
    return sw.as_fdt()


def main():
    if not hasattr(libfdt, 'fdt_node_properties_stub'):
        sys.exit('Apply patch 06/14 and rebuild pylibfdt first')

    fdt = make_sample_dtb()
    offsets = []
    off, depth = 0, 0
    while depth >= 0:
        offsets.append(off)
        off, depth = fdt.next_node(off, depth)

    iters = 400  # ~520k nodes, ~2.08M props (similar to 438 arm64 DTBs)

    t0 = time.perf_counter()
    for _ in range(iters):
        for o in offsets:
            for _ in old_properties(fdt, o):
                pass
    dt_old = time.perf_counter() - t0

    t0 = time.perf_counter()
    for _ in range(iters):
        for o in offsets:
            for _ in fdt.properties(o):
                pass
    dt_new = time.perf_counter() - t0

    t0 = time.perf_counter()
    for _ in range(iters):
        unflatten_walk(fdt, old_properties)
    dt_unf_old = time.perf_counter() - t0

    t0 = time.perf_counter()
    for _ in range(iters):
        unflatten_walk(fdt, libfdt.FdtRo.properties)
    dt_unf_new = time.perf_counter() - t0

    sz = fdt.totalsize()
    print(f'{len(offsets)} nodes ({sz:,} B) x {iters} trees:')
    print(f'  FdtRo.properties() old (SWIG loop): {dt_old:.3f} s')
    print(f'  FdtRo.properties() new (C helper):  {dt_new:.3f} s '
          f'({dt_old / dt_new:.2f}x faster)')
    print(f'  Full tree walk     old:             {dt_unf_old:.3f} s')
    print(f'  Full tree walk     new:             {dt_unf_new:.3f} s '
          f'({dt_unf_old / dt_unf_new:.2f}x faster)')


if __name__ == '__main__':
    main()
--->8---

-Doug
