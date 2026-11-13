Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542959;
	b=mQgDkmtp/2OWVkOqkZAu12KQqVf50AOrjyy00CVgIq5p0E44dk2f03JQsCGJUa24krN6
	 BV5z22TG7/4JKIKEaNB5kzwN6ZiFwXT80lC2f+8D/pR8qGX9+6qfV5dNviM86q7V3XAec
	 UGrQTPezY3fevOik8PmV3e5RjFHwkfkmGknP660ThrBciLXw0Wx5MLq7B7xK29kbgQor8
	 LdiiQNiOtuMmrOaF8PDlwvfn6FmN4LlAzrtljwpsZyl+/EXDKwmsXc4OGgU4iayDBN5Tu
	 iArxoS//oOP1RSiu0ZARt44hYCbaQGa1gxHflK93U8JPeQ+f6zC8xRJDc54Hto8iTWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542959;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bUvJJj635SB8zw9decldY9VYm3Ca8tCGYOzspdhldaE=;
	b=N9ew6im2UDFAAQK9NTaDCeHxEedRf/lv4lvBN0h9KqbVQbEdDtARizrB9W36lzZ5qpiW
	 IuuEdsAVm1KjQnMxceep8GIhZtgH5/gyglgXKKt2yCdVhbdtC1TebCk0oB24JqpSu6WsT
	 b2nITW4GrjwHXoSeIgdZoCaMockERzwgWEktAR9uvv+nA6ZzPqgCinyoLUOXJon0v85bT
	 sIC3K4Jp3BamYyBIt2L/0EbSwVJVT67fi2LfwFveibYw+lJyJJCA7WS+/yaZoyJjRA4mg
	 Vq8cbCWTAsv+KK1gFYxow54WL0s24RpInLc2syUF3mKgItT95GSIGFMq2yjOe0yPQfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=eCXcn3Fi;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149F0606A31C
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 04:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 149F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=eCXcn3Fi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794542956;
	bh=bUvJJj635SB8zw9decldY9VYm3Ca8tCGYOzspdhldaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eCXcn3Fi1avM+up1luLmjRWq7YJcwU6V16BrR6dpwL/JfmKag+fLtivA5vBeCOM9a
	 unST+0mUN2oqwrpXZ0s1URhCd/KLUhD0wxtvRHeHyWYYCCxwcEM2Muudq1HCu1LBcw
	 Xx7RLefRM4dHXzN1zJUME7gsmWy5A5Yiaeh4pR8sIpmbFBsaKh+Pd3DeTe9T8aRxC1
	 CtSAmy6XJwGsHk4SDsZHb26CC0G/Qhkkyh4mdrNAAAx9ixA7r7LJ67Cil8cfwUbcJs
	 uh5wJOqx8eabVQhJI2vhlvRKusitlkl9a1dw9uDD7wV5boHrhCIBT6gpm8/xpKE97K
	 z5LCdRK3sQKpg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkKS0nZrz4wTq; Fri, 13 Nov 2026 15:09:16 +1100 (AEDT)
Date: Fri, 13 Nov 2026 15:01:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 08/18] dtc: Merge &{label} in a plugin as with &label
Message-ID: <avaLqJfQB5tn_6gd@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-9-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="mJQXNmZIFCd5V38I"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-9-sjg@chromium.org>

--mJQXNmZIFCd5V38I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:35PM -0700, Simon Glass wrote:
> In a plugin, &label { ... } is merged into the labelled node if the
> label is in the plugin, as of commit 0fcffda15e9f ("Merge nodes with
> local target label references"). But &{label} { ... } always becomes a
> separate fragment@N node, since anything in braces is lexed as a path
> reference. This adds a fragment which is not needed, which that commit
> aims to avoid, and fails with FDT_ERR_NOTFOUND if the label is not
> within a fragment.
>=20
> Treat a reference as a path only if it starts with '/', so that both
> forms are merged into the node. This changes the output for such a file.
> Applying an overlay which already works gives the same result, apart
> from the order of the properties and that a later &label { ... } now
> overrides an earlier &{label} { ... }, as the source order suggests.
>=20
> Other references are not affected. An absolute path still becomes a
> fragment@N node, as does a label which is not in the plugin, since it
> may be in the base tree.
>=20
> This also means that dtc does not need to record whether a reference is
> written in braces. The merge code, which is about to move out of the
> grammar, can tell a path from a label by looking at the reference.
>=20
> Update the merge-label-braces.dts and merge-label-order.dts tests to
> match.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

LGTM, I think this behavioural change is the correct call.

> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Add new patch for &{label} in a plugin
>=20
>  dtc-parser.y                 | 10 +++++++---
>  tests/merge-label-braces.dts |  2 +-
>  tests/merge-label-order.dts  |  2 +-
>  tests/run_tests.sh           | 10 +++++-----
>  4 files changed, 14 insertions(+), 10 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index c58a66d..3614d71 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -193,6 +193,8 @@ devicetree:
>  		}
>  	| devicetree DT_PATH_REF nodedef
>  		{
> +			struct node *target =3D get_node_by_ref($1, $2);
> +
>  			/*
>  			 * We rely on the rule being always:
>  			 *   versioninfo plugindecl memreserves devicetree
> @@ -201,10 +203,12 @@ devicetree:
>  			if ($<flags>-1 & DTSF_PLUGIN) {
>  				if (is_ref_relative($2))
>  					ERROR(&@2, "Label-relative reference %s not supported in plugin", $=
2);
> -				add_orphan_node($1, $3, $2);
> +				/* A path is in the base tree and a label may be */
> +				if ($2[0] =3D=3D '/' || !target)
> +					add_orphan_node($1, $3, $2);
> +				else
> +					merge_nodes(target, $3);
>  			} else {
> -				struct node *target =3D get_node_by_ref($1, $2);
> -
>  				if (target)
>  					merge_nodes(target, $3);
>  				else
> diff --git a/tests/merge-label-braces.dts b/tests/merge-label-braces.dts
> index d5f8d0f..569e7f8 100644
> --- a/tests/merge-label-braces.dts
> +++ b/tests/merge-label-braces.dts
> @@ -6,7 +6,7 @@
>  	};
>  };
> =20
> -/* This becomes an overlay fragment, even though the label is in the plu=
gin */
> +/* A label in the plugin itself is merged, however it is written */
>  &{label} {
>  	prop;
>  };
> diff --git a/tests/merge-label-order.dts b/tests/merge-label-order.dts
> index f7923a0..40fa668 100644
> --- a/tests/merge-label-order.dts
> +++ b/tests/merge-label-order.dts
> @@ -7,7 +7,7 @@
>  	};
>  };
> =20
> -/* The fragment for &{label} is applied last, so "second" wins */
> +/* The last definition wins */
>  &{label} {
>  	p =3D "second";
>  };
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 2d392e2..0aaa29c 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -812,17 +812,17 @@ dtc_tests () {
>      run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ =
newlabel
>      run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
> =20
> -    # In a plugin, &{label} becomes an overlay fragment, even if it is f=
ound
> +    # In a plugin, &{label} is the same as &label
>      run_dtc_test -I dts -O dtb -o merge-label-braces.test.dtb \
>  	"$SRCDIR/merge-label-braces.dts"
> -    run_fdtget_test "" merge-label-braces.test.dtb /fragment@0/__overlay=
__ prop
> -    run_fdtget_test "node\nfragment@0\n__local_fixups__" merge-label-bra=
ces.test.dtb -l /
> +    run_fdtget_test "" merge-label-braces.test.dtb /node prop
> +    run_fdtget_test "node" merge-label-braces.test.dtb -l /
> =20
> -    # The fragment for &{label} is applied after any local merges
> +    # The last definition wins, with no fragment for &{label}
>      run_dtc_test -I dts -O dtb -o merge-label-order.test.dtb \
>  	"$SRCDIR/merge-label-order.dts"
>      run_fdtget_test "third" merge-label-order.test.dtb /fragment@0/__ove=
rlay__/foo p
> -    run_fdtget_test "second" merge-label-order.test.dtb /fragment@1/__ov=
erlay__ p
> +    run_fdtget_test "fragment@0\n__fixups__" merge-label-order.test.dtb =
-l /
> =20
>      # In a plugin, / { ... } and &{/} { ... } are not the same thing
>      run_dtc_test -I dts -O dtb -o merge-root-plugin.test.dtb \
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--mJQXNmZIFCd5V38I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2i6kACgkQzQJF27ox
2GeueQ//d6bk+odsTUj4iCCL2Osb19CZwRCeG4StC5mYXZXu3dcvTjspnr9eJIRr
90Cc5qH7gxea7jIA5cO0ibpid6ckixe9X/YTizJKK+O+ogBee2tZAt+KhQZYNGPB
czGO3A5x3KwsRpY4Y2/ab7Cxqg+G7rcUT1IO2rfKI9GiV3JJgJHUJxY339s5bbHS
hVxWyLkpYGFQtZv9XVNhD77Ot3dzBdS8aqLl9+6PL0fNsHaa8CdptdahZ5qCJgS5
s8groG/PXCqJ0RwibKi5mLNyPHCnFuiuAx4fCeyB4cWUiVBoJ/51kmmxbBYPSEKd
51owFyoz/nO9nLXkc9FCSTat1NYYGYXGjRak57b5CH4EVahaQgE9Zi+LgswYn3r7
um8n5Nca2cwo5NZxdoVZsBRsTEtIpJdIbWYMlnH2qdXqBKhAmel2M2pKFkEWssR9
yAa1gHl3/ULr2+hRh2YZdlHqLyFVlrp8Is8bhQrfaCflp0RhGqzuOKUNq7qH5izq
LNz7VekjntMzevHUKl+KpV6cI4P21BvwlYp+9ndmoM/gCv14JFTS3WjGDfZtUWJa
PG4TcroKpXjI4LRC8jXZANrbucVlyhO/QEeIit825ze17kNnCuhig7hYvjmySabD
G151RIKKHp6sZPS32uDPu2djyd4odMWY5mzWd2GuCs6e2ICDyFw=
=O5nA
-----END PGP SIGNATURE-----

--mJQXNmZIFCd5V38I--
