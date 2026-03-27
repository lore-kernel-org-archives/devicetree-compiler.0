Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF6136404B
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Mar 2026 11:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611119; cv=none; b=I/CtCQzq43gNY7a07AnmqgYyhUrdWJ2Bbs4dLgh5cq/GXdNiofIsXkWPr1Rtj9DxgvYIZeNe+AUfLtmiNFEpu7jH4RrE7oDjOjo5sX+RYG3VId5tBIVZY6tE7f2sz/NOaIjU6ydhJ49YouYEkXJlx62H0I6xp9Ot4Dyp+/OfZCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611119; c=relaxed/simple;
	bh=55ry8VmOVM8+YW86+LIC9qz0fNBULdMjU2WXDTptiaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AY9CahHRHZEOawt0QtyifpD2sYl05rfXlgP+yFgX1RTuVk4uOJP4uGxIbAZPUqRETe0RVnpnS/2bTcdIEmBZdXGm8cKzTORiiA8eg6B6z7wAwvpsaBpGB3f1Retx8fj9zWQwwDlAGJFscyTt2CMcUyFEkGeL3AdhsR/9EYhd3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=mzIJClmV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="mzIJClmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1774611106;
	bh=gb+3P3+Q+NGJa5PBbt7Ah0PWLlk3Y7+YUaxdAJh4SaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzIJClmVpghK2jFX1HKlilzTTFkQgTh/GZQcOoSPr18RxWxBRP/KUFM41vJowsvnY
	 iSRNmq6HhxEKmx0fn8daZmNMsMsXT/pSl6N8fsJrgEnQQiCqG3Q9CdwEchKIHp0isf
	 tX3J9Nnuj8kFJmOqLhf0AcKjNn/O8FRhCoXsJvugFLQpfN/Rw3OsKuGSeMcPzYvn0I
	 yX9mAqSskI88TFI4Lmi36rzgmbXJFvEseHu5bULfapKOO+RpO7FUtJC9cGcl4IZhUd
	 WJ0YaktKoysiq5Yfdix1ebORvlEHPwCHTdxVQkYy8AjdzDZ5EoDtXzhOdmEvXNVLi8
	 bE38lSAep6aJA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fhz4f36pxz4wM6; Fri, 27 Mar 2026 22:31:46 +1100 (AEDT)
Date: Fri, 27 Mar 2026 20:27:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nathan Chancellor <nathan@kernel.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] dtc: Remove unused dts_version in dtc-lexer.l
Message-ID: <acZNZHFZ3ajcNNdG@zatzit>
References: <20260325-dtc-lexer-remove-dts_version-v1-1-0b5d64903bbb@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sweyUxxuARB000mp"
Content-Disposition: inline
In-Reply-To: <20260325-dtc-lexer-remove-dts_version-v1-1-0b5d64903bbb@kernel.org>


--sweyUxxuARB000mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 05:13:44PM -0700, Nathan Chancellor wrote:
> A recent strengthening of -Wunused-but-set-variable (enabled with -Wall)
> in clang under a new subwarning, -Wunused-but-set-global, points out an
> unused static global variable in dtc-lexer.l:
>=20
>   ../dtc-lexer.l:42:12: error: variable 'dts_version' set but not used [-=
Werror,-Wunused-but-set-global]
>      42 | static int dts_version =3D 1;
>         |            ^
>=20
> This variable has been unused since commit 4e1a0a0 ("Remove support for
> the legacy DTS source file format."). Remove it to clear up the warning.
>=20
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied, thanks.

> ---
>  dtc-lexer.l | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 15d585c..1b129b1 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -39,8 +39,6 @@ extern bool treesource_error;
>  #define DPRINT(fmt, ...)	do { } while (0)
>  #endif
> =20
> -static int dts_version =3D 1;
> -
>  #define BEGIN_DEFAULT()		DPRINT("<V1>\n"); \
>  				BEGIN(V1); \
> =20
> @@ -101,7 +99,6 @@ static void PRINTF(1, 2) lexical_error(const char *fmt=
, ...);
> =20
>  <*>"/dts-v1/"	{
>  			DPRINT("Keyword: /dts-v1/\n");
> -			dts_version =3D 1;
>  			BEGIN_DEFAULT();
>  			return DT_V1;
>  		}
>=20
> ---
> base-commit: caf7465c5d60a56e00ea8c6b6eeb4e443371f815
> change-id: 20260325-dtc-lexer-remove-dts_version-dbf0fcd4aec4
>=20
> Best regards,
> -- =20
> Nathan Chancellor <nathan@kernel.org>
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--sweyUxxuARB000mp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmnGTVgACgkQzQJF27ox
2GdcSg/8C8OkfTJ9xCDgTzkq/U/fr/2Ge/QPajbGqPXwKpcWq+GAnXYYywPu2Zo+
1K35qsPF1R0gDYvw673wiY/y/PKFsYMWvywPUj5G9QNjckRdRb+CIM2+0eB972OI
yU3HuU0Tdfc2ZuHairqLJoRWrC71kzxaD1/oMd/vMd0PN82LCzfeVgiTGnLHUlYx
PGLVrGCjjLsy6+QdyxgeiPHen3q/EdvhIYXWVeWa/6dVxTRNBV9G4a/JytP3aqT5
MxFv4eWHfVQk31JfAXcnVJb8Pr0adVmltl3PwjREfbHHSintV4lZzEYOgM6RHTpN
B6qp2yE0RVO0sE/IXWTO3B7Ect8tY4GKeDPT+6oPB8qnASjgAizRI7XXenL1Ek25
Q3NriKAZrZdz6NWfJfRdIa2BzW5hj2WtXmQZVOIC0gSI/J/bqiVqgoOiYPOZmqDF
nq1j6rzgEhTnsixKERJnBjDK4IslGZpmCKMgwnsvYq2wl5eNesEBf7/8i5wfxZIp
8CX7xJuVD/wjv/qZ45WamSsyl1P02po15MgZMLw11EiGinM5ENFor2D6uBwQCNGy
1kwbWg8DucR7MJnmeva74Jj77djKVRf3DqrTSTRx1YU358RafBU+xv9lmnbl/GmJ
o1EtlwvYA/DK0f5UuvgXYqb/BAe4v3LJdOt2wIrRBznDqWVb/rE=
=V7bY
-----END PGP SIGNATURE-----

--sweyUxxuARB000mp--
