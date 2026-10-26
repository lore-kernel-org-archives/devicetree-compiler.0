Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792990316;
	b=ANO50EBalGiIcrnqXOSYLbyTp2s+5bpj9EVQmQf9pSrOqJV7dWC/89BznJCWOrypnsE6
	 xOdFTfrIjX9mDANWnYJbCd96wwFUcok+gfYM03GGszLzx63sQyihfWn3zBEk/9n4j5Wzt
	 8jogwmrEM+nfBL8PLNX17aNgli6USdmau17Dz4mZirOwB4Pjmb/hcia/FWo/QpQw6oEo7
	 ISgm9JEktrwQlANos+ITcTqBL75PWdSblfgPJgLHk7Qg6WA6vyhG1csoM0aMzMWcDQ1yn
	 DhsxA/MSLVpASAu7aHLSyHFDviRLA5/l+LBfIOpP+tKJlelVfdXiE1NdAQWGOiPW24Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990316;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ZFQCjGRPnEpctMhsPiQvVsy2C5p+sy2kdDZRdD4o/34=;
	b=JxUJTU0LXng43jiEEmekVSF7wkvdaivZp47pKF/7VAjNAR0bUvmlgoTWpQF6ujZnOQOd
	 klu9lsXTYDyhEj5nRN2mMGntSyRfcPyhjKrtJAn6dwS6DeR1k+pMfAw3IIgO+JdWjdU8A
	 dklYtY+O/sYCDqkd9tc8qYPISZrQdRFFvbSreGcgzvRyhS+mOL26VKplut0o4rJsARvJn
	 Oyac47zVZRNEwP0Kiikyjx2hHx0XXqraBOd5BrFd8+JD0yLjpDdLLQfAvIbHNZ8bnqUu5
	 ivv2C95lolgE39tFwYKsByq4PKDvpsnT7bveocGGimoIgsEF8kaPKSiYKZcjag8Gnbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=OwIQvZ1n;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D3606A321;
	Mon, 26 Oct 2026 04:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287D3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=OwIQvZ1n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792990301;
	bh=ZFQCjGRPnEpctMhsPiQvVsy2C5p+sy2kdDZRdD4o/34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwIQvZ1nqTEJW0hCnUDSFHvjwYQ5hkxkGNc/z42KUeSvcr2n+nyr1ZC9TCUFhrWOD
	 MvdhYSgKDpqE3AfxkjFgLk6p56eK7SC/0fj9znsYopuh+D3zIu83vxgGeST03JkosX
	 hR9qGneImp5fuOKcNa1OaDU8eEp3zNzC7XZaJwcZTbjlCGZL2dn4NeLCJokAwKZA/5
	 8/i365ayHzconAgdLNHVBbXPSObjd9Dg/O/b/6XnZCIum00Mtghc68aFJsK6h9rlx6
	 HDy9uuL5/onq5zfOljq5uUaTlt6YF9pneNoShjDNc8r+D3RbsUI3H8lA+BnQ11OKz8
	 8gTjmWTHmndxA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jCh6j3w6gz4wKs; Mon, 26 Oct 2026 15:51:41 +1100 (AEDT)
Date: Mon, 26 Oct 2026 15:51:34 +1100
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
Subject: Re: [PATCH 3/4] fdtfactor: Support compressed DTB inputs and outputs
Message-ID: <at7cVVyWLbSoK49W@gractus.seuss>
References: <20261015182221.2931742-1-dianders@chromium.org>
 <20261015182221.2931742-4-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="Xagn9SdZwZo03832"
Content-Disposition: inline
In-Reply-To: <20261015182221.2931742-4-dianders@chromium.org>

--Xagn9SdZwZo03832
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:21:36AM -0700, Douglas Anderson wrote:
> Firmware and FIT image build pipelines frequently store device tree
> blobs compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).
>=20
> Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> file extension, transparently decompress them before factoring, and
> compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
>=20
> - Support `.lz4` (via the `lz4` CLI), `.lzma`/`.xz` (via Python's
>   `lzma` module), and `.gz` (via Python's `gzip` module).
> - Preserve the input compression format on generated `.dtbo` files and
>   compress `base.dtb` when its output path carries a compression suffix
>   (e.g., `-b base.dtb.lz4`).
> - Report compressed size savings alongside uncompressed savings when
>   `-v`/`--verbose` is specified.
>=20
> On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
> `fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
> (87.5% savings).

I'm not going to review patches 3 & 4 at this time.  Patch 2 will need
a bunch of rework before it's ready, which will necessarily require
substantial changes to the following patches as well.  So, I'll defer
considering these until (at least) the next spin.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Xagn9SdZwZo03832
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmre3FUACgkQzQJF27ox
2GdEBA//ZRE/LZiilHosGKSwdmAmYvRiWO/ZzwcVZZdlf+kxvoCp5q1iigcmCwaC
RrFtYhca/M+wmnmOulmmyUcUR55bEQd/6nziEHNVf/LuT4I0tfZKaVTONMXlb0v8
FPyHmMbbKBL52YuNKgnvtCme9csUTDrgfqiDAstJaTb1t6fIWxfEkqtvpLdUPoVS
a+gVHYpEPZSi1xu1HVyQm+VxYeAKR/U3UxdPvr84F+fqYqm5vQYoFJZW5tDY9kQA
Y89VZuVUqTYXXtWX57NWRZZoKcycKQ366XOKmmhZsuBn9ZBnUyxsJHYd+z0Rvz11
uTaw1Ox9pQJZXM1YiOU1vJ/ct5MsFsYGiG5wy+X1l5jziRDP/VNVBJ9Hy2v0KKie
iTb/iWuUZrvr5Lz+5+dWzxNbhYWJijxDT7ao+MdBg+xzEJ3Q9+P1VHEK9vF4D3t9
nZEKwbz+p9peLr6k1GOBJYSujB7gbqauQPEHod68S3JfkfSE6kh1uBt0pDK1MmP7
GLta1BGS5Mv9chgZ12lF8whjHWrdtO3oHLoPt1/eTYD9VK8QEbebViLChXDl4n+A
o5I+aGP5e+vvaz1m6/Rime7M7RXey220kxRxm8BwMZgUArq/GgV7rp9ci6Jj8jW9
t9CubHOH5sMO4KorpkkxQbk7CMDETr+WiJcFLOldna4PNvBnZqA=
=YzbD
-----END PGP SIGNATURE-----

--Xagn9SdZwZo03832--
