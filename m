Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00BF52B1D4
	for <devicetree-compiler@vger.kernel.org>; Tue,  8 Sep 2026 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866527; cv=none; b=Mw6D349yKQ7P47HNF5rSv0LIJ54YtjYMHJjkjRmzXaIvh0/hfBDNYZ+j9HIGDmOzRV7xtn288gCnLqfn8y9r7wtRJEdao6TXGxnAfc9i8FUZKGe8Rt5P6Jvncm80F0CHZIZnu9mzQunCpsypJVu2Aa798zq87SWZBTuUK6uFFgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866527; c=relaxed/simple;
	bh=ytymhWuEKSJa131hfpnK3SveWw/EF6mJ5jcP/cDuRvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCvJjLUeFEBPQ9LdCvA4c+MTyo/Yi8vuMPmIJ16StuDBLUn8pnL6qiZKXy2hh9eeVrd83nkoRJ9To3cWfcZE222NSeHR6zYSpdXliIsc9uCO6Bg4NFnsTHTnajqjyyz3ZIeozQRehO5dQZW7vg1rLmTnj24cFrK5emvHfXnX9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=h4xIfOxn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="h4xIfOxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788866503;
	bh=ssKcpoU5MvvVE+cK80JWR8vse58T5wKK9FHPuq/Acfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4xIfOxnhN2vKqnspTglX9bW7y77hlG5bba1NlqMHG1km9wEGxl/ofnz7vbNvUVQU
	 pqB12Gpowi+mKazetjwwplEkeBkVnU9yb7kTBbkazXEkdfviBcYpXV5AwY9szZegkB
	 69VNnE9VvYE5vGffBoiy5PJXLv7GmuLBQTX5yAdUYX7lgz4/m7c5Dswz9DwHO30w05
	 KlKFAB5VRR/rxlBV55kCNQN5/2YDsUkvmQ6nRsaTiqABGcLjYaZdgqADJ9uxJUS6mh
	 Z+fpzIVRkKmcgZDjATeS5i7amFi6fBnv6wBwEL2Y4Mw/DlJYzRv9QxiGO5CcA6acP1
	 p05+8wiM7v+yQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hfM2v2xCZz4w2b; Tue, 08 Sep 2026 21:21:43 +1000 (AEST)
Date: Tue, 8 Sep 2026 21:21:25 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?H=E9ctor_Or=F3n_Mart=EDnez?= <hector.oron@gmail.com>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH] libfdt: pass sources as keyword argument to library()
Message-ID: <ap_vr-qTfbJsuF10@gractus.seuss>
References: <CAODfWeHQcjGn0CtweT4Q9Em6WC9cTmvfxhuQCgae4gdu5W9hSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ucVSp2M4zJhJFQBA"
Content-Disposition: inline
In-Reply-To: <CAODfWeHQcjGn0CtweT4Q9Em6WC9cTmvfxhuQCgae4gdu5W9hSA@mail.gmail.com>

--ucVSp2M4zJhJFQBA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 12:07:27PM +0200, H=E9ctor Or=F3n Mart=EDnez wrote:
> Meson expects the source list for library() to be passed either as
> positional arguments after the target name or via the 'sources:'
> keyword. Using the implicit positional form can lead to malformed
> linker commands on some toolchains, with spurious arguments such as
> 'libfdt' and '.' being treated as input files.
>=20
> Explicitly pass the source list via 'sources: sources' and declare
> the ABI version with 'soversion: '1'' to match the installed
> libfdt.so.1 soname.
>=20
> This fixes build failures where the linker reported:
>   cannot find libfdt: file format not recognized
>   cannot find .: file format not recognized
>=20
> Signed-off-by: H=E9ctor Or=F3n Mart=EDnez <hector.oron@gmail.com>

Applied, thanks.

>=20
> ---
>  libfdt/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/meson.build b/libfdt/meson.build
> index 68d4c1d..6c41f9f 100644
> --- a/libfdt/meson.build
> +++ b/libfdt/meson.build
> @@ -27,8 +27,10 @@ endif
>=20
>  link_args +=3D version_script
>  libfdt =3D library(
> -  'fdt', sources,
> +  'fdt',
> +  sources: sources,
>    version: meson.project_version(),
> +  soversion: '1',
>    link_args: link_args,
>    link_depends: 'version.lds',
>    install: get_option('default_library') !=3D 'static' or not wheel_only,
> --=20
> 2.55.0
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ucVSp2M4zJhJFQBA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqf768ACgkQzQJF27ox
2GcEYQ//dmW4ufsr/mt0KafN1KHdH7mPjyhfY61tghlhjcSEH6KMwp1BqrJV4JTX
Y3MGNgaRlUYDF8AtIaKSZKFFttoXEZYlPuX56Fg4DpKfryhc+yySH2S//bfxEDei
1SHHB40Qdqv4Ouk/qokz54vTwr7MX7Qg4ov1/3v4kcNByaoO/NrtUtsbA2qsAIO9
DdbSIMjgOdwk8N5ALV9Bq0UC1zs3y6fg25VBw0P5xcquD2NaVe8FJzPFnieI+G1Z
EX7jB9gnLYuo6qyUE19tB1lXti93bsvI/uD36Q1lASiO8p6EMFJdD5binrz6HD4W
zo8OuI3JMIsPRwXL/QcoANrGkfkqayczsY5vNdSGQB2qyqiIWhM3mEcGHHmhwsJk
wxIoSoMCilZIFBGO1afErViPF48G8gj1jPOy4PfiYnQ3QpFoSZ64TvVi60DHDeZv
wkmvwihFOpcX2eckWMW8UbBByoDmPzcY4nSvBC8IejPThi8/kEqax6W8szq7amOu
rSyfTbBY1ZePP8G5i7YGUGt4ij4FG09jqZJA9ohvMf+0jz2Ibz6VW2Jy7hZjdzu8
OWvs22HUrG1GRo/XO/Vgkn/Oye1jIMDsQGqZVSsMz7jxHGyKIXv74cfA6hbWFKob
1KJTNtr+tZZuhIMwnNrrVWQHIOUJU+2w9UMKExYnq04U3h8Ksyc=
=s1J6
-----END PGP SIGNATURE-----

--ucVSp2M4zJhJFQBA--
