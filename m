Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A4171D2
	for <devicetree-compiler@vger.kernel.org>; Fri, 18 Apr 2025 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963107; cv=none; b=oOpW3a41V1hoe8z1N35P84zBDHa2cW5ArgZ0yY7JtPVAr774Q3obvYTunsfImeEultIntd2anqw+GMBCRDoV5e3Oq6fnQc5+gt+JPKg9wkSVVZSk18x56eq/rN1AM6RjI7eAJwbt8zguj3ejKA/VDBosxrB6EgLrSGPXLv1rSxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963107; c=relaxed/simple;
	bh=Ezo6o7bEnfdk8t23KTg9l+VhMYlyIcqJHP9uYtshcGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWqUyjKnrGKH+d5WHQ20mxv0gM60drOOrnLMoGLRkN4JIXMehYyZXr0YezbzymWoPcfTQC2F3z/MvoW+x/tP+7anvZPzH0QyBkbjQ/Zkso2mLe/D7uW0L7p5LHMh69cl9LVd0soILsP2jOaIoRTRunfTv3pj4e9uXkj3t9mJ1ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=o57u6FiB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="o57u6FiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1744963093;
	bh=LW2dJDiEmlNb73yaLEfvm08frpn7OfmwM/uRyZFBHwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o57u6FiBQBvbM9mJYBtDURR8dc6QwPf2KswpI1q7tZZsiwKH8jlD1eGLvxRakUJUw
	 T/zpqAK78d/Lkhr1JkGkda6A2GUUH0uwHGPtVbo9ZJXeJ0ko+MaejTGIc6WcrC9aMr
	 hUIQZhyp56/KV7HadqDRyndk9kYkxN/h8GiutZgk9EnKPBFP++pNV5uHCgO2djtF3+
	 4N54G/vGojefaGtuoTA58guqbbS5OL6JBhRqJtEF/ThZgFkTnpIg4Hxmm+HiNqkZk/
	 x3Nl4h0sfpQ/w4Pmd5Uqn63tqau7DH5GlC9xk1IBQu2i2LXtnRol9gSwPkjzbGIFMT
	 CniShBeb9b0/g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Zf6ZY42mqz4x8W; Fri, 18 Apr 2025 17:58:13 +1000 (AEST)
Date: Fri, 18 Apr 2025 17:58:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yao Zi <ziyao@disroot.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2] flattree: Optimize stringtable_insert() with memmem()
Message-ID: <aAIGDn9G8CSp5Gnz@zatzit>
References: <20250417085900.1134-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fa9hcV/jfkRvEpyw"
Content-Disposition: inline
In-Reply-To: <20250417085900.1134-1-ziyao@disroot.org>


--fa9hcV/jfkRvEpyw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 08:59:00AM +0000, Yao Zi wrote:
> According to perf result, stringtable_insert() is one of the five hotest
> functions, which is obvious since it depends on a brute-force,
> quadratic-complexity method to deduplicate the string block and is
> called at creation of every property.
>=20
> This patch replaces the brute-force deduplication with libc-provided
> memmem(), which is guaranteed to be in linear complexity on both glibc
> and musl libc.
>=20
> On an i7-7200U Linux system with musl-libc, building the "dtbs" target
> in Linux 6.11's arm64 port takes 19.1s less in average, achieving 25.1%
> speed up.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

This looks great, except for one detail.  I went to apply this, but it
failed the github tests on Windows.  Looks like the Windows libc
doesn't include memmem(), so we'll need to have a fallback
implementation.  Trickiest part will be working out when to use the
alternative.

> ---
>=20
> Changed from v1
> - Drop the hashtable for simplicity and update the commit message
> - Add a comment to explain restrictions on deduplication
> - Link to v1: https://lore.kernel.org/devicetree-compiler/20250412100351.=
9009-2-ziyao@disroot.org/
>=20
>  flattree.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/flattree.c b/flattree.c
> index 30e6de2044b2..d7328690e008 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -220,17 +220,24 @@ static struct emitter asm_emitter =3D {
> =20
>  static int stringtable_insert(struct data *d, const char *str)
>  {
> -	unsigned int i;
> +	const char *dup;
> +	size_t size;
> =20
> -	/* FIXME: do this more efficiently? */
> +	/*
> +	 * Reuse (subsequence of) existing string if possible. E.g.
> +	 * "enable-method" could be reused when inserting "method".
> +	 *
> +	 * The terminating '\0' must be taken into account, or "foo\0" may be
> +	 * wrongly recognized as subsequence of "foobar\0".
> +	 */
> +	size =3D strlen(str) + 1;
> +	dup =3D memmem(d->val, d->len, str, size);
> +	if (dup)
> +		return dup - d->val;
> =20
> -	for (i =3D 0; i < d->len; i++) {
> -		if (streq(str, d->val + i))
> -			return i;
> -	}
> +	*d =3D data_append_data(*d, str, size);
> =20
> -	*d =3D data_append_data(*d, str, strlen(str)+1);
> -	return i;
> +	return d->len - size;
>  }
> =20
>  static void flatten_tree(struct node *tree, struct emitter *emit,

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--fa9hcV/jfkRvEpyw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmgCBfsACgkQzQJF27ox
2GfKaQ/+OpS9DhGdjCFv9+jLpCNmViNL5WSJ4OfmXulsP47JtByq2/HuIu90H0kA
9ZvGLZlsQxCAC3NUBJBT9k+gGaLI7Cwgig8DV6+hKk90BDpPODbSz1gQgO/J0dBL
V5z49j0/ufrYpKl8qMc9s8wqyDQdEWkZFNKvx3zLAP3Kf/zZOTWBwqNEtExSWwjV
GaWsGXNuWYjmyHNZ3oP/H+FF/omHjhrvTWTsjc8stbcI7qpsuxfsHwdT7hvHSLS2
StbkksstOX3aqbS710Z1HtUhKkAScKkZ5lzXmX7HOMdh2Z9nfSyIOSxm/85OABVO
KLTu/6erMaku6IhDIfPjA1GhIpBBjyKzRjpA/bRsQiTBaDGs8NvHW1io8FVtvWRB
IRaXOwPADPn880jXVZ5iJHAlWjLLtHrdYOv7V6lMGVaTIG6wCa0kYhq8SHSH/yd+
o3bwn3prZ6vY570174nLsuCGF7MnppliCFXpNxU9E5Uay4yY7kUtQkAWeGswhmgA
MY0vsrIWcH4hJuHVdDCh7kqhRb78iNEmLkarqBVIXmlNrIDchG6zJd5BPcOG5gKy
21fBu3gFVl1cG/0iQDf26RFeazOkyurpQZvXA1q6lqwo6VkowdaVFLXHsG60lEck
mbDcUlUMlU0zryZ3siu0Dof39jNKyQXGGC1b6X21PH09O7upAH8=
=aUUl
-----END PGP SIGNATURE-----

--fa9hcV/jfkRvEpyw--
