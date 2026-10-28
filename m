Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152040;
	b=3Z+bAbKzEdJO7CUb47SZ9VSQuXlMBXyJfG8AN3Hphem/lqT/euiyfHh0Pad27cXbT6U+
	 f+psJBqi7mf5JT8p3YQ2YhLoqYEsqLXoBcW4lrXVjWAr9ogmOVxttLmTkutahAfEmIhkl
	 8oKJUCnzmcZS0UUn3+H7rDYREIPtH0SyG14QroH+7ddn/+RplkbGcgvJu70KzZBfD9s0P
	 ufgx2Dci/zK1QQkR+RsrNaMNrQMg3AZz0gOjVtXEO7R7/ktGhLDk/8ITVgjEOseZHkRKT
	 AXQq2MUX6exf+z2bTrT/9XsEka1ZNkrn1f+zvFS/WyaUUU1CGERCzotDlm9xhPVpo3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152040;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MRkt84kB1ZIB98Il+Eh4j6KltW1BgKmzG/xvsEvjfew=;
	b=j9HFzyuVw8yp19nyTxVnnATYPO0IEJGGoOdKu8zQLGSWqZLx96nU31pPMIrDtSaoY/ZT
	 6tmQ+7Uikks7gaZBD7WrbuqYNuIDS673hjbePHEkEdxcfyqcx7UZw28mFRNKJrbtjf4wz
	 Ipi6CW9GZBgTUn4egaaX3nNiaj00niCHfwGVVU2VFTTb4fJqiQ6zArXaaX8PvAV1eZSLt
	 nOKPFhy3CrZJ2Lw0aBHpkR7BoSuoWoZ+qKYmk8DExm9ejuCsC8cfSb+w0Wv+ClUbPSwqP
	 Pd1o2yRbIR4SLMCZAhNe36BiJ44iaEeudoP9han74lHNO3QUTFxp3DU0h41J5rB5EeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=WnYxdinM;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC29606A31D
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 01:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC29606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=WnYxdinM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793152029;
	bh=MRkt84kB1ZIB98Il+Eh4j6KltW1BgKmzG/xvsEvjfew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WnYxdinML5XsJmCmEAGpojgzZsdazVVYOg0uGRLmZ8+7FO86sHeehUNVC0ouq8PeF
	 5SH8Z6jCmJw9n30sAvMpgj7NkneT9ehyWnOsMFgcxTiNEdw7NWJPQR5j3G/SpnuarE
	 02hJvb80kSWfzyBl8PiglatWG/kshr4d+SDFtXkUw5QAx2K5GgVhlZm/qRf4HuSYln
	 +0nkdCGRV80QIDxfQMBhMBiy5wwO7v4NrVnXF9CKLsBjIu8Wk3v//8SHyQ1E3lPCCy
	 CU1Q9MqaF4jr5dHX29Md2tG/8WMWyHnP6+FFQGdzZD8/Mpk54URAmL6KGpyxfjPFFu
	 jQ0uWkYPOTiJA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jDqws0rGgz4wSk; Wed, 28 Oct 2026 12:47:09 +1100 (AEDT)
Date: Wed, 28 Oct 2026 12:34:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 2/5] fdtput: Follow an alias when creating nodes with -p
Message-ID: <auFRAPRBaxrX9gYW@gractus.seuss>
References: <20261027120126.2613353-1-sjg@chromium.org>
 <20261027120126.2613353-3-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="LOtGxl/ivxMwXDO9"
Content-Disposition: inline
In-Reply-To: <20261027120126.2613353-3-sjg@chromium.org>

--LOtGxl/ivxMwXDO9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 06:01:16AM -0600, Simon Glass wrote:
> A node path can start with an alias, such as serial0/sub, but -p does
> not allow for this. It looks up each part of the path from the root, so
> it creates a top-level node named after the alias:
>=20
>    $ fdtput -cp test.dtb serial0/sub
>=20
> This creates /serial0/sub instead of adding 'sub' to the node which
> serial0 points to, and reports success. When writing a property, the
> stray node is left behind if the alias is the whole path, and fdtput
> fails if the path continues beyond the alias.
>=20
> When the path starts with an alias, create any missing nodes below the
> node which the alias points to. Keep the existing behaviour for other
> paths which do not start with '/', which are created from the root.
>=20
> Fixes: f807af192828 ("fdtput: Add -p option to create subnodes along enti=
re path")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
>  fdtput.c           | 18 ++++++++++++++++--
>  tests/run_tests.sh |  7 +++++++
>  2 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/fdtput.c b/fdtput.c
> index c139de1..4094015 100644
> --- a/fdtput.c
> +++ b/fdtput.c
> @@ -201,8 +201,9 @@ static int store_key_value(char **blob, const char *n=
ode_name,
>  /**
>   * Create paths as needed for all components of a path
>   *
> - * Any components of the path that do not exist are created. Errors are
> - * reported.
> + * Any components of the path that do not exist are created. If the path
> + * starts with an alias, they are created below the node which the alias
> + * points to. Otherwise the path starts at the root. Errors are reported.
>   *
>   * @param blob		FDT blob to write into
>   * @param in_path	Path to process
> @@ -214,6 +215,19 @@ static int create_paths(char **blob, const char *in_=
path)
>  	const char *sep;
>  	int node, offset =3D 0;
> =20
> +	/* a path which starts with an alias is created below its node */
> +	sep =3D strchr(path, '/');
> +	if (!sep)
> +		sep =3D path + strlen(path);
> +	if (sep > path && fdt_get_alias_namelen(*blob, path, sep - path)) {
> +		offset =3D fdt_path_offset_namelen(*blob, path, sep - path);
> +		if (offset < 0) {
> +			report_error(path, sep - path, offset);
> +			return -1;
> +		}
> +		path =3D sep;
> +	}
> +

The previous behaviour was certainly buggy, but I don't think this fix
is quite correct.  If 'foo' is *not* an existing alias, then
	fdtput -cp test.dtb foo/bar/baz
Will still create /foo/bar/baz, which is not how dt paths generally
work.

Instead, we should look for an alias if and only if there's no leading
'/'.  If there's no leading '/' but the first segment is not a valid
alias, then we should error out.

>  	/* skip leading '/' */
>  	while (*path =3D=3D '/')
>  		path++;
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 842b543..77f0a81 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -970,6 +970,13 @@ fdtput_tests () {
>  	"-ts" "fine wine"
>      run_wrap_test $DTPUT $dtb -p /you/are/drunk/sir/winston slurp -ts tw=
ice
> =20
> +    # Automatic node creation below an alias
> +    run_wrap_test $DTPUT $dtb -p /aliases second -ts /blackadder/the-sec=
ond
> +    run_wrap_test $DTPUT $dtb -cp second/carrot
> +    run_fdtput_test "orange" $dtb second/carrot colour -ts "orange"
> +    run_fdtget_test "orange" $dtb /blackadder/the-second/carrot colour
> +    run_wrap_error_test $DTGET $dtb -l /second
> +
>      # Test expansion of the blob when insufficient room for a new node
>      run_wrap_test $DTPUT $dtb -cp "$(cat $text $text)/longish"
> =20
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--LOtGxl/ivxMwXDO9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrhUQAACgkQzQJF27ox
2Gf8MA//fDTdRTj2/JD4REHVEMPASQaDtDWFuxojJk3DqTdr6PhU10DqgNskVCZR
Vp7f15pRg7NYUuSW3cEUcWulAdp8Pmxj3Z8DT0MGVGo7McpDiVZOY5OckytbfN4N
n66FV3c8VxBPA/+Fwe2xz2vLroiYhCqUo6CaCHZBkHsU+JDD7D215789kl9aojBa
0hBR1weVlCCm0bNM6hN9GxWMWt7PkMmnkt8d81802Bsbxw8TpY0BeyCEjEYo+6QI
VxmuC6oU7Sx5UUNDeiCkNG+5Zp2IXLFgc0KOtJ1Vb0oNNjpcveAxscwGM525tnA+
5PLuYZSMB416q6rHetwHYGRzv+EKGJrzNA+4Zuvf1DlDFN6aa4nbLk2Jozsfefrc
B6d9/m0PX5k1GU76uw4ho3Rr5UqNhvBxmYXUxupX0rOOYF2kVjvl3uOPw8XnSyon
dXQ+9tYzAopujti6YXZ4DB6xxiX+N04FXGWYVS+f8LpW0YMtS7eVqmY9G77CLrMb
G7Lb+/XBwc80IyNLyKcKm9Ue6dj+zCYP/uNMHBzMBVWb1tr7jpI6GsigajNhUacx
9AKmLd9c0eAOJG/3bFaWIoZf7cJzIpNjik5KirP2W3jDd4ezS11tKtoyfayC9j30
bP2BFgwBR1Wu1l0FIDx85bXD3e9yrpiPRN9ZZHsILfQRxqLbRfU=
=6K7v
-----END PGP SIGNATURE-----

--LOtGxl/ivxMwXDO9--
