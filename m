Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600483;
	b=hObgDXdrv0YikbJHSjE1TZLegHiAtJSDauGTJHcYCBBClMi7P52p2YIo0X3ZarnWl5Lr
	 mUpIelGCK00B1Pv/TqLgFmhzn9yTyOKTKOb3M4KZoLhhdKLKpEka0Nslnqe5GZ1dK6EYV
	 mgX3lRF80ogEOSN6fzl/32P6coXicXz77/C/yUBLcnveAdkgXtgmTwRe7hWTt1A36XEsE
	 BEVtDjhFzBDik7BNdZfo4+vgEILNoQhC2S/hkpEpLV4M+AjUkPADhaAmD0LjPse3vxqZ4
	 KP+BzCU6zLmR6/lIFNsi/Wcijp9Lr7ilBNxnbw5h0C3ZakQNZSU+pfWkMorlDmA3sxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600483;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=E2yh4HxNpDPDReLjrZcFcwObIsSlG3PLbszsbVewFow=;
	b=YGn6l9piEzw0TxedRfOmoVVuEqvFJd/wPd03VNBr5HJrqTW/Qt4foZHp/MwDQIZmKyAf
	 ImVhC2W6aYW8+2qnVeNb7jqd5qpLImsJBTeYYSF3C16S9Tg45aQZO8jDIr9y22ynuqfeA
	 wAdqx13CF/s8+FJXl6mF58GGKXm40qMct3+yMudBll9e+zllN9cKWutXvPrWMcOYJlLXY
	 vUQkovSvx/7fuvNKP33lyM9QedHN5ZC1CkWJjcC4VIJB3/+GwgifYiEZviAy3Jik1Lrdl
	 ECY/N/R/CQ8enWhchCeMF5wDo/6Y9FFHn90cvNux91mogDsp1KAhAPJ0Xn8l8CkDW9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=dscJ43hf;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9AD606A326
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 06:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9AD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=dscJ43hf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793600480;
	bh=E2yh4HxNpDPDReLjrZcFcwObIsSlG3PLbszsbVewFow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dscJ43hfjpAbHv4m3gBynqDkaNisVjsf/pGl9Zecmx/x1a9zZK8LYCsl9dOPCo8rK
	 W9nKmEu0NLToSkAtwQv2tj84yIYZ8P1AcunNEtTRvh1//wm/2lkEhBYz8ncRmLuj5A
	 HnRA8aufidF6BphJVW54jljYuxj4whw/N3H2Lc2G/LZ2tqwT74b1RJzSK4lKAChJdi
	 cPe5z/8sHDwQ2u/Vr7j5PN5e1LTTP0r1mUx1ZsayFlb1oWdDufSk39ls0EHdbc3H9p
	 mRZtodqd17qU/n8GbvKZJIufj/D9GDaYUqLqCNdesJ8Q3nX9cozVh5KIicXWkFBabv
	 gX56XLBPElehQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ1mw6MwDz4wC8; Mon, 02 Nov 2026 17:21:20 +1100 (AEDT)
Date: Mon, 2 Nov 2026 17:20:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Kelvin Zhang <zhangkelvin@google.com>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2] libfdt: Don't search for the terminator in
 fdt_get_string()
Message-ID: <augrvGDJghayJVMv@gractus.seuss>
References: <CAOSmRzixCf479QyhmGuwBBZrRLTYqoaSUw88HKZnkPyEh6=gcw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="ND1F96EhpWtM/QBu"
Content-Disposition: inline
In-Reply-To: <CAOSmRzixCf479QyhmGuwBBZrRLTYqoaSUw88HKZnkPyEh6=gcw@mail.gmail.com>

--ND1F96EhpWtM/QBu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 08:50:05PM -0800, Kelvin Zhang wrote:
> Unless FDT_ASSUME_MASK includes ASSUME_VALID_INPUT, fdt_get_string()
> finds the end of the string with memchr(), bounded by the end of the
> string block, which also checks that the string is terminated. A
> string block normally ends with a NUL, and then every string in it is
> terminated. When the caller does not ask for the string's length,
> check that byte instead, so that fdt_string() doesn't scan the string
> at all.
>=20
> This helps callers that look up many property names. With a 612 KiB
> tree on x86-64, built with gcc -O2 and the default FDT_ASSUME_MASK,
> calling fdt_string() for the name of each of its 17,899 properties
> takes 108 us instead of 160 us, not counting the walk that finds
> them. libufdt, which Android bootloaders use to apply overlays, calls
> fdt_string() at least once for every property it reads: tens of
> thousands of times to apply one overlay to a 445 KiB tree.
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Kelvin Zhang <zhangkelvin@google.com>

Merged, thanks.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ND1F96EhpWtM/QBu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroK7wACgkQzQJF27ox
2Gfedg/9Epqr9+rQAwMylKY/TfUQYkGILHGu7L7VG07spqSwX6AW6zSa0ppfK7oo
4qsHn3dXdpdKjxUKTCjsVDXeLuw68gnxWBvceR2LUBkUTZBc8T2X31f1Ouxt8PiT
pE9vRqvmbFko8SxatmXa3aKHfkQ7IVD+sx03MefWz1SsJfMWzuDsd8cDZVdQG8hZ
UsN7sVgA9JPjnMo4MH1xmJK/Ef8bWamLHlS4DCSjB9tFIVDgACBb/agh/kECOpuA
ierIzIu9ilWz+/DPEslwo+VtFazfnX0n//CDqQ9Vi2o6tHFBx3TC5RgXHJxpFPW4
JmUFT9T4HOK5ULbMfuJqz9yXy4y1iJ7lAZ5JapjSzTdZlM6O0QwfYXYz33h2aJOf
MoCPCD/zJVD+4M0ynxf3x4uBXVMKV5fd9sstSG2kCtGrzFzRV2erGZJUYouucD1q
tX2m8ez7mBGMsz1tApVzz3sF5cKu4iTRmXTuc1CLe1Pw1GC/c/nNm+JadddrsMBA
2OQQyZALIgBJH6UojSO2YgnXD0KU3z80Nc8pa7mdXljxZRXYcsksaW0oVWcHjkQh
/y44ABo+JSA7XLsWmRbbvug6SNurWuJKygzQ016B8Hol4QBHMR3IHXanoMGp1e99
cyav/d4nC+b3ZAxS/vwLoMY4+TSaWEG5wLV8Z1CfGTMplGoE5aI=
=FEHY
-----END PGP SIGNATURE-----

--ND1F96EhpWtM/QBu--
