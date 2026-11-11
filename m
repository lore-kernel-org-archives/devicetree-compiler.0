Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379229;
	b=vB7Cqb6Rq7QXVtNoOARnF2BTW9uvg1Vb0HW/f8pl8WR8m8AfiiimTbBE/6fvM7GeZ1XR
	 YFy3uifObWqLM/yHr+Kfv+p7ojZ38dor06uGFBGOvqodGB851Q+PGD2nyRZKpwUYss5lZ
	 LlGYola9z1/6dFUb9tEB4aSTtNIE2Sex00muz8PCA8YrVrn1Xe/llZk53ux7YBtTG1jmF
	 b5RTvPisUAZDF2Xf2LeIq2yKeOdVVsDgSDNxuRijeQF3khtOrB3UeoEyLQSXJjWDbXln4
	 ptgJPCCOR3FbeWrtmzLdK6sP95VoUf0KlSS8jGhFKz13lTOV98ODXGv33wEAZbFa1fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379229;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=n5jE6jG+iMnzI6prvcgWgEmEMfKa7Mi7e2Wy9nkVp9o=;
	b=MbJ/kUS56+HmZb+JqBf//oal8wmvgB7FcFuM0zcb+aIDyOYBEx+TVahSzoVCThZmselx
	 Wz3ivSeorYlCkzWiKH5nFLxLbnqKglpTFoWMKP9jrIZqdNs1JkO9KYNenjVDyD+v7/fLM
	 hwL0GsMjerYC7LrEIrHgBUSfpkPre8keMoKdkaejanPd7Mt2vPSgcEGpSRjLGLLWzMgw1
	 n9IF3sG/Dy6Uu6dgbDA/Pist7+BUCBkUr5fTcRnftDtZCjC/HhHMNUmHw7n6Sv9AzNVJc
	 GwLUqoUZ8SKqIiJSQJAUQg3Q409hscEAxDnmm2144nNOuYwGRAc3sG2oHfaKrovu07Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=NGTzqqxU;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DA5606A324
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 06:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DA5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=NGTzqqxU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794379225;
	bh=n5jE6jG+iMnzI6prvcgWgEmEMfKa7Mi7e2Wy9nkVp9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGTzqqxUULsCRMIEkHgpVojL+PbjejtoTVFh/gDcfd/UZRW17umzdoj0Rfmguohp3
	 izOeCBvoSUqpex90jABbesfbqSRhTAr09iqWw3XQSo0Q2B/25QDIl66km9rffg+1Qf
	 /HHj17SATwc+vCVVNbyMuGPnpmejiDJjAmwtXRMarYAmT/3N40gZCcdjCUTmZjAqMx
	 5iXNjPEbGxDIdIO/rlMCz47zyOqB/GfAsA6pyV29qtFnBbWWBJ6I0mLiqqQd92JYDq
	 gjZ+G3JSfMlBnD8nhzzLyevP/FL/58JryhfnTL10agwoYCRCAs+7X+nSCgrUvsZ6MM
	 0t9CI7ALI6kKA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jPYmn3VQFz4wTH; Wed, 11 Nov 2026 17:40:25 +1100 (AEDT)
Date: Wed, 11 Nov 2026 15:56:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 02/18] srcpos: Allow srcpos_string() to accept NULL
Message-ID: <avP1ZYexdv8tQwuq@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-3-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="QWyov1ooYtz/Q8KM"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-3-sjg@chromium.org>

--QWyov1ooYtz/Q8KM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:29PM -0700, Simon Glass wrote:
> A position is not always available: a node read from a dtb has none, and
> top-level fragments may eventually come from a dtbo as well as from
> source. At present srcpos_string() crashes if it has no position, so
> each caller which might not have one needs to check, as those in
> checks.c do.
>=20
> Return a placeholder in this case, using the same text as
> srcpos_string_comment() does, so that srcpos_error() can be used whether
> or not there is a position.
>=20
> No caller passes NULL at present, so this has no test yet.
>=20
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Sensible independent of the rest of the series; applied.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--QWyov1ooYtz/Q8KM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrz9WUACgkQzQJF27ox
2GdZlw/+KYtHe3F9ZzOpSM3kjef2NSL9Q/itJZbnhkDWCwlvnTvjB/5t1PkQcIpg
MF5FtOkCgvWS3/ZinRnX07dWvLbEjStKqughTateWImlNNRXpY+NgWjgZz59USjj
xpjleA8aBlJPI6tTuYGcWUTWQyVmAQSq14f6ZdUg8ElMfwrvcf3x6jikUbqyFrhC
q3Cjt61NCr6cptHM2v+LrEGfLR6ZDoFp6XLyHFNZ5DvEqtTiXSxoLLVdhAk7bdYu
d0UyYM3QxB6TCGUxboLZEOo8+F8CsJIGVj4LrjgWOoz+hCvv46GyvlUUCNjBpq9q
5OArhv5Rq2mZeWzRuBQoF3BTWMMoJPP+sdoM2sOw8VxwGyYAHg7mHjq0t2DZ18NA
Tlm31mDqoSssJXLEeRZhO1JsFqt1W/QoDTnatXCivPhjeNKnIxx6wUWHOs1a8DDb
Q3op3zZwntf8AQRisBFHhuSxHijbY/iNBNzQ0KDVBG51eszhsG+deMfAkJCfHoB9
01tuGpB2431TBesPlLJsqfxXF+mrszS/U7ujbyszvHoOFhEVk3W+YmeERXAKhUKQ
/uTkwkWWXuEs9IV7aNS0M3rOZ6VBbpCx+SS1gol/NCdpH+c2uganBZSSpI7ShafC
f4dcsbPwggjOmTqU3br6VmA/jHleMPqsHdUa1GNp5DuFLatBaO0=
=D3eR
-----END PGP SIGNATURE-----

--QWyov1ooYtz/Q8KM--
