Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066708;
	b=IIVzNrPp/KvRI7WYLIWKPEhoVXOI0qkuDLTDPxWyerGYThGSXTn+DKcDK3PIpmyR7JHk
	 I25q7nV1w8u9LxPjA4UsH6E0pmS1oK4yidp/YfYA8LXMA8U815Bxx55kTw3AjQJAhUvzC
	 tgCHj+1qpxDv4x6+nsLOvl5GCdjItsNt/I1s7mp3Exa/7vy4tcY9XTRw6ROXUGi1X4WGv
	 PDH5LRjP2YOlcQZRIeynXnohr7IHY9kMcgV6j1B6kmNkNRhakiOf/ShniNptZdBaczJaz
	 O40VGF+66KhUagZf9IUjNIVY3KlF4JsxdBSDa3dXIi9E3wXoDd6WKySiRj9hsJ0Sn3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066708;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ZxpxR1Bx7iHKN350BgxLvONxzz/2GzRcscDrLGBxOng=;
	b=DgiDMqxPE8umMdOxJCHfjGkKukm7DBH8662sxE9VvFBG89FptEorIgKkmYZzwykHo6jU
	 B+S47Coptyd7JNzUe7CWe3G4CElLeO4O3evD6Nlqp/Kymljl8TaefXIMFYrrm9nxfLmpy
	 HzLuGpJupRjHxWjYio4hQ9BH9YBKsACOZQgMy0CRdMjfh9V0J1I+GOBnTcyoB5rn9BKf5
	 L4j0Lv30fHyj5+vpsOAmySkG0Bg9wAXMpLZp7MjLdBLms/xz3hFYFfVH77YEY8bTcb1M8
	 LbC+0nv+Z9XTezuf8h/RdklDppr+1UoePwwVisMj8cQJjuYiiz2DJgc/j008bGiSVXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=MYdSok2H;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B88606A6FF;
	Thu, 19 Nov 2026 05:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B88606A6FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=MYdSok2H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795066699;
	bh=ZxpxR1Bx7iHKN350BgxLvONxzz/2GzRcscDrLGBxOng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYdSok2HQ52nT+YlzMz5Jc4MK2WmWwZ7WxXaCVqo26Zd/ogy1izncGha5ZfZZKiah
	 NtnIai9BYAjH4Dggnh98c8BR1u7vUXEzqbtDcJJaLgDlpi874BcGgfWdM4IQsOQ5dt
	 uln8yiHrB7oBex9bvdtsWujs+gz3gIAkSs6UX5RCeLrfiNmC7wyIrFhxllHqTNi512
	 zGuzttDm+3pwwOqtiiIa2b/adHs+8h5PIGJ31V6C3LYRWa9nU0vx9usu1bdb8kh0zy
	 65mNWkxGE/IswivacJwzg7UWLr2ITVry2TVe5DTdTU0RtvGkpKZci/zq9+yS4N7Iie
	 RxyMuk28Mm/GA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jVS1R0kDHz4wTB; Thu, 19 Nov 2026 16:38:19 +1100 (AEDT)
Date: Thu, 19 Nov 2026 16:38:04 +1100
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
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <av6LPM4Z94FyWlHN@gractus.seuss>
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org>
 <avvRY-nTstFbvTpF@gractus.seuss>
 <avvTEIZQZwra3Zra@gractus.seuss>
 <CAD=FV=V+2wMhc6OALzbHgn8x9AnWUFCay6sGB7sqKqffGLb7ZQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="pFaSfQ7iOIEr/uZi"
Content-Disposition: inline
In-Reply-To: <CAD=FV=V+2wMhc6OALzbHgn8x9AnWUFCay6sGB7sqKqffGLb7ZQ@mail.gmail.com>

--pFaSfQ7iOIEr/uZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 08:21:26AM -0800, Doug Anderson wrote:
> Hi David,
>=20
> On Mon, Nov 16, 2026 at 8:07 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > > > On one stress test (running the fdtfactor tool across 438 arm64 Qua=
lcomm
> > > > DTBs) this reduced `fdt_property()` time by ~5.6x.
> > >
> > > What we really want is memmem(), which would presumably have a similar
> > > optimization (and likely more) built in.  However, we avoid that to
> > > make this easier to environments which lack it.
> > >
> > > Complexity isn't too great, so this looks reasonable to me
> >
> > Hmm... actually, thinking about this again, I'm kind of baffled that
> > the speedup is so large.  In the old version, if p is at a character
> > that doesn't match the start of the string we're looking for, memcmp()
> > should return almost immediately (after a single byte comparison), so
> > I'd expect both versions to be - roughly speaking - a single scan
> > through each byte of the strings block.  At least with gcc builtin and
> > inlined mem*() implementations, I'd expect the performance difference
> > to be pretty modest between that and the new version.
> >
> > What was the environment (host CPU, libc, compiler options) you used
> > for the benchmark?
>=20
> Environment details:
> * CPU: AMD Ryzen Threadripper PRO 5995WX (x86_64, AVX2)
> * libc: Debian glibc 2.43
> * Compiler: gcc (Debian 15.2.0-14) 15.2.0
> * Flags: default `meson setup build` (`buildtype=3Ddebug`, so `-O0 -g
>   -fPIC`), though testing at `-Os`, `-O2`, and `-O3` gives the same
>   ~16-17x speedup on the string-table scan itself.
>=20
> There are two things going on even at `-O2` / `-O3`:
>=20
> 1. **GCC can't inline `memcmp(p, s, slen)` when `slen` isn't a
>    compile-time constant**: Because `slen` is a runtime variable (and
>    GCC also can't synthesize a `*p =3D=3D *s` pre-check on its own since
>    `slen` could be `0`), GCC at `-O2` / `-O3` emits a full PLT call to
>    `memcmp()` on every single byte `p` of `strtab`:
>=20
>        .L10:
>            movq    %rbx, %rdx
>            movq    %rbp, %rsi
>            movq    %r15, %rdi
>            call    memcmp@PLT
>            ...
>            addq    $1, %r15
>            cmpq    %r15, %r12
>            jnb     .L10
>=20
>    Even though glibc's `__memcmp_avx2_movbe` returns quickly on a
>    first-byte mismatch, paying a PLT call/return and function prologue
>    on every byte of a ~14 KB `/__symbols__` string table (~5.8M
>    `memcmp()` calls per 800-symbol DTB) dominates runtime. Just adding a
>    scalar `*p =3D=3D *s` guard ahead of `memcmp()` already speeds up the
>    test below by ~8x at `-O2`.
>=20
> 2. **SIMD scanning inside `memchr()` (~2x faster than a scalar byte loop
>    at `-O2`)**: Instead of stepping one byte per scalar loop iteration,
>    glibc's `memchr()` (`__memchr_avx2` on x86_64) broadcasts `s[0]`
>    across a 32-byte YMM register (`vpbroadcastb` + `vpcmpeqb`) and scans
>    32 bytes per iteration inside a single call, only returning on the
>    ~4-6% of offsets where `p[0] =3D=3D s[0]`.

Ah, right, thanks for the analysis.

> (In the commit message, overall `fdt_property()` time dropped by ~5.6x
> rather than ~16x because ordinary repeated property names like
> `compatible`, `reg`, and `phandle` hit near the beginning of `strtab`
> right away, and `fdt_property()` also includes copying the property
> value and header bookkeeping.)
>=20
> Here is a small standalone C program (`bench_find_string.c`) that models
> building an 800-symbol string table 200 times (~4.2s -> ~0.25s at `-O2`
> on my machine):

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--pFaSfQ7iOIEr/uZi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr+izwACgkQzQJF27ox
2GdxcA/+LXjRpvwTU8nA9pBs1dxIX7cyIz423wIDqg3RYSmtQozm0oL137XMUwOJ
K1oFNKAT5FU0h3u0dZWyTABtfisSfwp9gZRwgVIvP2XQKroqv94gd4ownfjhhm2S
/yy0wx7VXGNZ6ELFhag2KSd0+WMPjEh7YyBz/8cvrhJ6tStMoECA8VvqwSnF+h3N
/DxTOETILduCeckFts5Zph4/lhYTqwWYsqA37pW3tDtTuLP6gcSeYUuJdZsSNAEG
WYsbSYF7ITemdF97V7Aj31XQWVGobmXWyuOfghGDdnP64iE3Fupn9vwqKrMjmZXz
kVV5zBIb/YHrmorM9LODtYRDPB4qzGXs7bd4xfd3zqm2lAITZiNW3ZNlRzUSKUZK
h5fgh09Wz1sz8Dvpy8NWqZey1VnaILLvtKguITcyNHjmN/oKOvSvSmkPqzksY786
8mfnitC8UESZvKFxt2qbwZVz/qsancxlS3RBx9meOdVQKj/xKcD5+/59vdF2S367
GTliv2CtJMAGf3T5mufGy7um2zD/ICFdkco3TWWgNp8nINFz81zuA4si/Rq0P/wW
rAhyKWBelTV9R1G43pXXg4xuoB+c4y9xj5yk2XD8AAZQcgbd7C5hQxyQSH0dV69n
syoNrNov7YrKGZrJQaEuw3hk79sPf74eXHEUrGeVejWghtFT2fA=
=pLls
-----END PGP SIGNATURE-----

--pFaSfQ7iOIEr/uZi--
