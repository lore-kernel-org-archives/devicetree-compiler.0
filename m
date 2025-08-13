Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088EB2C0F8F
	for <devicetree-compiler@vger.kernel.org>; Wed, 13 Aug 2025 01:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755048720; cv=none; b=Us3sCfQj0sQN7EndPnCu0Q7yUTfy7APkNiOUbiPhpOsMJv3uNXLsUCK8EsyicD3A2QBOfm4mGIQmLxnXrhRkbEUtkIQAuXqcJWfQRJ8A0yrDA1Npq16HZRhp5gdgvra1L9pg1B4pMhORlnMnfaN0KolNQY49oBsyRFW78e1z5xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755048720; c=relaxed/simple;
	bh=Up2EYkJhfYWAOkRirZg1fUtJfX3aCn/8fPzN2Q6Zx+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtVI98i8c5XM+HwLkpCSfsIv5jOTmIrSO+M3+qsK0PPnGcOyjaZi01tHxBlz8/5snCTsTgwbCwX8wko340JUZnR9sLse5A1OKYusZ1x+WfFOD5ECHhgAITJqwj1DHWVJUzPZaBij91vaG4zfvnu+wgJ+yqkXl1gUHzPS+VP6z3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=yVX1krYc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="yVX1krYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755048715;
	bh=u+cdapTVcsEf02QXrS8IIHSRDKdZrxokAzTwJpdAx70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yVX1krYcrIW+7nHu4kof1kkj6lhQ312MymCd2Bl9qfUp1wQCHXJPcwpmUiCkkMX3k
	 cWsiARgPc6P2qfQ54f1ZQSFQN/N1GG7ZPQ1vpXudsVlOhNju5OsDiBUKjpL1g8XB7u
	 TwShnPE1hXhIyhcqHw8NBimy5S5Xt5aXDSoZDpzrJb9+FDuhEbc+Nio2S+fugkXfDd
	 3PoRJpB9TxTw8HL3e3ir+GBJTckTzBqz40TQfofqG6gVcY2/eGyMv04rPGyFfLRCV2
	 rwXJypL3RmWPAQ0bW3PWQP/vErKIs8MHpZviw1yEvg8DNeH2xKAEnCmNJmt5aGps3Z
	 IXK2EzzeiiWgg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c1rSq2pF8z4xPG; Wed, 13 Aug 2025 11:31:55 +1000 (AEST)
Date: Wed, 13 Aug 2025 11:29:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree-compiler@vger.kernel.org,
	Ayush Singh <ayush@beagleboard.org>
Subject: Re: [PATCH] libfdt: Drop including string.h from libfdt_internal.h
Message-ID: <aJvqii1Eqpo_nj8z@zatzit>
References: <20250811130416.2653959-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EknoYKxWmbwPgOnK"
Content-Disposition: inline
In-Reply-To: <20250811130416.2653959-1-robh@kernel.org>


--EknoYKxWmbwPgOnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 08:04:16AM -0500, Rob Herring (Arm) wrote:
> Commit 0f69cedc08fc ("libfdt_internal: fdt_find_string_len_()") added a
> string.h include to libfdt_internal.h which introduces a libc dependency
> which cannot be overridden. Environments without libc (e.g. Linux
> kernel) use a custom libfdt_env.h. string.h is already indirectly
> included in libfdt_env.h, so it can be dropped from libfdt_internal.h.
>=20
> Fixes: 0f69cedc08fc ("libfdt_internal: fdt_find_string_len_()")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Ouch, should have spotted that on review, sorry.

Fix merged.

> ---
>  libfdt/libfdt_internal.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 773bba87bc6e..b60b5456f596 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -6,7 +6,6 @@
>   * Copyright (C) 2006 David Gibson, IBM Corporation.
>   */
>  #include <fdt.h>
> -#include <string.h>
> =20
>  #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
>  #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--EknoYKxWmbwPgOnK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmib6oUACgkQzQJF27ox
2GdaHw/+K7Fu0JeJOhCnC/ll78fYy+xZ4bRlWCbOHNZ+UtMxc6KnG3kyV95b2uXq
RyUJBYiNes8itmjSvPdBA7kvfeFHhoduftrZ8UWd1w6z7Vy8WbnlWIm8X72aByRR
OvMggJxIl0kj4pMkkN+XHm+7zZ6cJ4Ba4sz5/7PB8STC0XRguZaCtsZxjFxs3TEw
rfqIUEXOw8rqgtiWdh4l43J05bgg6wm3ATAtk4NBzbSCfOLYptcjsLw9vHlBfcJ/
G0QbMgNt0KBO1UoaOgjhIaPLRGxxmW+1qenay5oda+jL6IQ3rZVE0yXmdO4trgOi
Mg2JO2vc3MzvUGTC3zRCLiXTMtxFclK+oEv9SngYZynD9KZkqhqMof325Fq1NipU
qPfboRNzNtIJ4UusG9bh0GXIYtHztgrTea+xncx8UKv8RA/IndCVjqa91f1c7cLI
bhfWR9TP0A5DJ2+7VAk7iu8UfM/nu+xAtbnMfRVrl1XEAfdwuE4fhLsO3fJ29aq0
+y6PNCvKZzdrsJ5V9qkBt3BFk+uwiOw8ADlWhQGXrBH1+VZG7A4wcDapiXt0eIIh
36i8k9Lbs4bFdMBDkpi1ozj+cFGd0oCdnyeJHGZUlQa0dA4UN6qnGIlFziyjtJmI
68bcs5TrdOxwl3e5AyoeqpcPYj1YAtmVxmVSeO3hzqChn20aT4k=
=U0Bm
-----END PGP SIGNATURE-----

--EknoYKxWmbwPgOnK--
