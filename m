Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F3711CA9
	for <devicetree-compiler@vger.kernel.org>; Mon,  3 Mar 2025 02:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740967649; cv=none; b=bcSj4Zeq2UdCFU7G3BGP+pi6JHXADSM0S1X050jksp920kf966FaZnqyUkaEx1d4eL8K1ZBSC9jhxjHH8ZyYKBuWPObHwwHvffQdByrfqz8HT7MIa/83yu/UYPi8XtiN+LPFitYFAsvmPD7YXvpz3FdNc0mf73RI+DexrnFEgkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740967649; c=relaxed/simple;
	bh=2I1pzs0wIdlwC6k+zjiievniORQ6cSOjAXnXGrLuyzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1VN7YJheb53vUpwK3k3iK6AiXCZOlDMwoe6Tneirl00EPX9WJ1Uuhm9mJewJ1Oj+dkuP/GclsOzQn0Ig76llYDAMVdDtYAqWQuB4YQRKvtqIrGruP43xMT1FgwNBV/8W3J75QOG7S6Gordjh7nNaZZgN7U8wu6H66eFjWEv9is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=hs4nAZwu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="hs4nAZwu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1740967641;
	bh=1gq2rvQ/oD3ac12eJTGGTHPp4pBFY5RnV/z9MGApd5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hs4nAZwuSZYxt8kkGm42U6O4+tKU/r/XjmCZaSbwagsH9YBSeXoauNtr/kfjg7D6s
	 +2unr9zrrD33HiW77Qal7edu1PJ8VmO2cvMoNd1FC9ZNuLvdH6G4OiOUQbGYsloF1y
	 995oO4KNttLbdzDfCY0di4apacfPDaU/V5UACussZhJzVlhwYzw0QPYpoReLLAPQVJ
	 qNmTj3UP///dnkuDhS0YLBXXczwb7Ctnb1Gu65QXDefjdfpAtyFODkujdUVFc0qCil
	 0Dnz2NsqzPmMhz8PlRk9N47tN+QT8yp0t0cD4lE1wQ7fnIrL6EHPbOkMJ/FYZZ7Wdr
	 p27eUkDdiZ4Ig==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Z5hyx6kFBz4wvb; Mon,  3 Mar 2025 13:07:21 +1100 (AEDT)
Date: Mon, 3 Mar 2025 12:56:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eli Schwartz <eschwartz93@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] meson: don't build test programs by default
Message-ID: <Z8UMPUk9h5ieMWr0@zatzit>
References: <20250302222839.2256985-1-eschwartz@gentoo.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gqz7OkoHKmdD4blI"
Content-Disposition: inline
In-Reply-To: <20250302222839.2256985-1-eschwartz@gentoo.org>


--gqz7OkoHKmdD4blI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 02, 2025 at 05:28:26PM -0500, Eli Schwartz wrote:
> They are only used when running tests, and are included as depedencies
> of the test cases themselves already. Marking them to not build by
> default, means that 291 compile edges can be skipped when only running
>=20
> ```
> meson setup builddir/
> ninja -C builddir/
> meson install -C builddir/
> ```
>=20
> resulting in an overall much faster build. Instead they will be compiled
> on-demand by `meson test`, only for users that actually run the tests.
>=20
> Signed-off-by: Eli Schwartz <eschwartz@gentoo.org>

This also matches the behaviour of the legacy Makefiles.

Merged, thanks.

> ---
>  tests/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/meson.build b/tests/meson.build
> index 9cf6e3d..f1044b9 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -1,7 +1,9 @@
>  trees =3D static_library('trees', files('trees.S'), c_args: '-D__ASSEMBL=
Y__',
> +                       build_by_default: false,
>                         include_directories: libfdt_inc)
> =20
>  dumptrees =3D executable('dumptrees', files('dumptrees.c'),
> +                       build_by_default: false,
>                         link_with: trees, dependencies: libfdt_dep)
> =20
>  dumptrees_dtb =3D custom_target(
> @@ -111,7 +113,7 @@ endif
> =20
>  tests_exe =3D []
>  foreach t: tests
> -  tests_exe +=3D executable(t, files(t + '.c'), dependencies: test_deps,=
 link_args: extra_link_args)
> +  tests_exe +=3D executable(t, files(t + '.c'), dependencies: test_deps,=
 link_args: extra_link_args, build_by_default: false)
>  endforeach
> =20
>  run_tests =3D find_program('run_tests.sh')

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--gqz7OkoHKmdD4blI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfFDDgACgkQzQJF27ox
2Ge3fQ/8Dwaft6DtxoDwcQKoIOQ8RVI9lgo5Nx49UBYWNWPuBoQ5JQcQNmVbfU/A
aykf5UUo+3RLd7t/gyTAZHUfSN5d5MAlequPUmbpmLq3BphDjlKdq50Vc7L3iJE3
HjTEcIzrWm+AS8JjmYZAMMGU+FcUfu+HlBJs3Ob1yxdMBERFFpRtMF/tWHYnStXy
JwZdALVr7XLt7r9hc+vTNN5pljnxqv98D11Tkdx9i65Ofk+W+yX1TyEvryeeCf/9
pn22UaVttr8jNYRkTEGDvfyx5wXjHNEPLTGHfB5TwcpBVVbty3mx+aU8q6vYPFKE
8VG9+iiMvT7OJ4qDN/LguAY/x2Ysf1VOGrDKJOh4RuOpS7Gfs2Wpc7+zNqgPBA4M
2Ds/ySGGL+DBMOwrQlgNOsnI4YFFvYr5HG7940trsB1k67obYvB8fAtYWEj8bqH8
Z9I732IKX00Vuxa6//XHRTzwHx0UKERiWIIAtqPFRgA9ecb/Uo/zNuTPF7puD9nb
1GZ/44CA3XTSTMd1ba04ApW/1udeecDhkhDwBeAER6LYwYHv5Qk8a2pkrWCgX4Xa
Ow9zXwvjfnQUj5nPnYU662qFegNvXInzeCTw1FvGAaqDT6HY4ZgZ4iBLff6QiicJ
YWRfTnJzvKnAmuibuL2xct5XpOjRckbP9h4LprzASXDyl9EwRzE=
=BQ0I
-----END PGP SIGNATURE-----

--gqz7OkoHKmdD4blI--
