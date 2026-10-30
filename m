Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336276;
	b=QT5O60YXJKIv296/5spAj6f+BEILIEGd8ATJQkro/8C3XNKSXlF9kuxfKfDEzjXSVs87
	 okkNqkEc2QH6qNNmj+oVLm/UA/IBLex8xefGLFwVnywpc482uutU2gcweTMI4zqxuzmq1
	 K5TdyOUh4hOJihMWqwvw+K2sQRwtS54xN9zcb1RW96b+ylWOj0Th7nyr9fXOj6xeOiuSr
	 c91GgY4Rbu6K5GvBihyF1FJMPaJeupN1MapP8R+IVRv7NeJX4ONEad6sEITZePVXZn+2y
	 2LFb5pBlplL6J7EqxIY0IE2CM+/Q8Wr005nPqFkfdprcYUF5GtDIxaOndC/XNA+rS8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336276;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wDudv0rZrAL9ppq3uGqt354wGtsIysDT5fTdFXNaOpY=;
	b=TOTV+eHXaL+e4LywISFuLUG9yD0Wm/1cPd1mgQWQbLRLIbRbztpP0OL7GGHkmLpy+RQr
	 TIvj11vx8TnWE1gS3WJBrsy94mXZUxEXcYH+biPA/Jh/6HlHO/oaVKnYuKhwFB5Ozf3Vp
	 RwM9xsmu7jcLRuDlpQ5pTfWgh2GiGXuhiy1rkLZdm/c2TJ/M132wYFDcJc+ogun+7hgoc
	 kriqUU/u3iqe/tH5BTq+q4BIqIvkuYk+nGv3md5USBTpSYL4z0UWCjgMKzXXsp2cGO7Ri
	 vpLhOdIm/dS8b29ra5QPeuqyuSDm7887Bl2cjYu6UP7gqUNhLW+H5R3dEvKKtigLb8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F43606A31D;
	Fri, 30 Oct 2026 04:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6F43606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793336270;
	bh=wDudv0rZrAL9ppq3uGqt354wGtsIysDT5fTdFXNaOpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Il8bAsc+h5MG7A5wE9f5lyzQ8TyWCkIWvAqcBXRzDQslwyifZvQRIhZUippTVHuAq
	 sB9S9/RWYul+yisT6/i4KEO1Td7qOs2FZFlEPj8q3Aqo1Q5pEcWLj/Wd+izVNoWLuS
	 GYi1UtzuFe/vB7702+mG7zeI7ZnvK++U8excew33vOCdTmuLbcRsu+B1WpUQUGPNAC
	 WPR0qIsEDtnY34ADI6sf0bDarku72eR7MjCWJT+41xqWIKDn1L2aGu5DZr2GBqxA1c
	 QpfviUPNDrwGaJ6XYgaawK3DeMKUbcrAcM+tTFFRfg7E2wwRv05lX7zByOUA6KxETk
	 WfyDh2a4fr/jQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG83y1vfpz4x95; Fri, 30 Oct 2026 15:57:50 +1100 (AEDT)
Date: Fri, 30 Oct 2026 15:24:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment
 path helpers for reuse
Message-ID: <auQcDmZJGQZW7oB7@gractus.seuss>
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-6-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="Jgk/y5Mqu3WDWreC"
Content-Disposition: inline
In-Reply-To: <20261028215600.1713475-6-dianders@chromium.org>

--Jgk/y5Mqu3WDWreC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 02:46:54PM -0700, Douglas Anderson wrote:
> Clean up `overlay_parse_fixup_entry()` and generalize
> `overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` so both can be
> reused when updating `/__local_fixups__`:
>=20
> - Change `poffset` from `int` to `uint32_t` in
>   `overlay_fixup_one_phandle()`, `overlay_parse_fixup_entry()`, and
>   `overlay_fixup_phandle()`, and parse into `unsigned long` before
>   validating the range.
> - Require `*(sep + 1)` to be an ASCII digit (`'0'..'9'`) and bound
>   `poffset` to `INT32_MAX - sizeof(uint32_t)` so negative strings (such
>   as `"-4"`), leading whitespace, or large values cannot silently

Huh, I'd assumed that strtoul() wouldn't accept negative strings, but
according to BUGS in strtoul(1) that might not be the case (at least
for Linux+glibc).  Good catch.

>   truncate or wrap around in `fdt_setprop_inplace_namelen_partial()`.
> - Drop the redundant `*sep !=3D ':'` checks after `memchr(..., ':', ...)`.
> - Generalize `overlay_split_fragment_path()` to accept a length-bounded
>   `path` slice that is not necessarily NUL-terminated (using `memchr()`
>   instead of `strchr()`, and keeping the NUL-terminated property check
>   in `overlay_symbol_update()`) so it can also split `:`-delimited paths
>   from `/__fixups__`.

This may need some minor rebasing for the suggestions on the previous
patch, plus some additional minor refinements suggested below.

>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v2:
> - New patch tightening fixup offset parsing and generalizing
>   overlay_split_fragment_path() for non-NUL-terminated paths in
>   libfdt/fdt_overlay.c
>=20
>  libfdt/fdt_overlay.c | 46 +++++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index f9d1a555ed5d..eb87b356145f 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -330,7 +330,7 @@ static int overlay_update_local_references(void *fdto=
, uint32_t delta)
>  static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
>  				     const char *path, uint32_t path_len,
>  				     const char *name, uint32_t name_len,
> -				     int poffset, uint32_t phandle)
> +				     uint32_t poffset, uint32_t phandle)
>  {
>  	fdt32_t phandle_prop;
>  	int fixup_off;
> @@ -368,7 +368,7 @@ static int overlay_fixup_one_phandle(void *fdto, int =
symbols_off,
>  static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
>  				     const char **pathp, uint32_t *path_lenp,
>  				     const char **namep, uint32_t *name_lenp,
> -				     int *poffsetp)
> +				     uint32_t *poffsetp)
>  {
>  	const char *path, *name, *fixup_end;
>  	const char *fixup_str =3D *valuep;
> @@ -376,7 +376,7 @@ static int overlay_parse_fixup_entry(const char **val=
uep, int *lenp,
>  	uint32_t fixup_len;
>  	const char *sep;
>  	char *endptr;
> -	int poffset;
> +	unsigned long poffset;
> =20
>  	fixup_end =3D memchr(*valuep, '\0', *lenp);
>  	if (!fixup_end)
> @@ -388,7 +388,7 @@ static int overlay_parse_fixup_entry(const char **val=
uep, int *lenp,
> =20
>  	path =3D fixup_str;
>  	sep =3D memchr(fixup_str, ':', fixup_len);
> -	if (!sep || *sep !=3D ':')
> +	if (!sep)
>  		return -FDT_ERR_BADOVERLAY;
> =20
>  	path_len =3D sep - path;
> @@ -398,15 +398,17 @@ static int overlay_parse_fixup_entry(const char **v=
aluep, int *lenp,
>  	fixup_len -=3D path_len + 1;
>  	name =3D sep + 1;
>  	sep =3D memchr(name, ':', fixup_len);
> -	if (!sep || *sep !=3D ':')
> +	if (!sep)
>  		return -FDT_ERR_BADOVERLAY;
> =20
>  	name_len =3D sep - name;
>  	if (!name_len)
>  		return -FDT_ERR_BADOVERLAY;
> =20
> +	if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
> +		return -FDT_ERR_BADOVERLAY;

Putting the rationale for this in a comment here would be more useful
than just in the commit message.

>  	poffset =3D strtoul(sep + 1, &endptr, 10);
> -	if ((*endptr !=3D '\0') || (endptr <=3D (sep + 1)))
> +	if ((*endptr !=3D '\0') || (poffset > (INT32_MAX - sizeof(uint32_t))))
>  		return -FDT_ERR_BADOVERLAY;
> =20
>  	*pathp =3D path;
> @@ -470,8 +472,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdt=
o, int symbols_off,
> =20
>  	do {
>  		const char *path, *name;
> -		uint32_t path_len, name_len;
> -		int poffset, ret;
> +		uint32_t path_len, name_len, poffset;
> +		int ret;
> =20
>  		ret =3D overlay_parse_fixup_entry(&value, &len, &path, &path_len,
>  						&name, &name_len, &poffset);
> @@ -925,8 +927,8 @@ static int get_path_len(const void *fdt, int nodeoffs=
et)
> =20
>  /**
>   * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" int=
o parts
> - * @path: Input NUL-terminated path property string
> - * @path_len: Length of @path in bytes (including trailing NUL)
> + * @path: Input path string (need not be NUL-terminated)
> + * @path_len: Length of @path in bytes (excluding any terminator)
>   * @frag_namep: Output pointer to the fragment name
>   * @frag_name_lenp: Output length of @frag_namep in bytes
>   * @rel_pathp: Output pointer to the relative subnode path after __overl=
ay__
> @@ -935,7 +937,7 @@ static int get_path_len(const void *fdt, int nodeoffs=
et)
>   *
>   * returns:
>   *      0 on success
> - *      -FDT_ERR_BADVALUE if @path is not a valid NUL-terminated '/' path
> + *      -FDT_ERR_BADVALUE if @path does not start with '/'
>   */
>  static int overlay_split_fragment_path(const char *path, int path_len,
>  				       const char **frag_namep,
> @@ -951,18 +953,14 @@ static int overlay_split_fragment_path(const char *=
path, int path_len,
> =20
>  	*is_overlayp =3D false;
> =20
> -	/* verify it's a string property (terminated by a single \0) */
> -	if (path_len < 1 || memchr(path, '\0', path_len) !=3D &path[path_len - =
1])
> -		return -FDT_ERR_BADVALUE;
> -
>  	/* keep end marker to avoid strlen() */
>  	e =3D path + path_len;
> =20
> -	if (*path !=3D '/')
> +	if (path_len < 1 || *path !=3D '/')
>  		return -FDT_ERR_BADVALUE;
> =20
>  	/* get fragment name first */
> -	s =3D strchr(path + 1, '/');
> +	s =3D memchr(path + 1, '/', path_len - 1);
>  	if (!s) {
>  		/* Symbol refers to something that won't end
>  		 * up in the target tree */
> @@ -972,13 +970,13 @@ static int overlay_split_fragment_path(const char *=
path, int path_len,
>  	frag_name =3D path + 1;
>  	frag_name_len =3D s - path - 1;
> =20
> -	/* verify format; safe since "s" lies in \0 terminated prop */
> +	/* verify format */
>  	len =3D sizeof("/__overlay__/") - 1;
> -	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) =3D=3D 0)) {
> +	if ((e - s) >=3D len && (memcmp(s, "/__overlay__/", len) =3D=3D 0)) {
>  		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
>  		rel_path =3D s + len;
> -		rel_path_len =3D e - rel_path - 1;
> -	} else if ((e - s) =3D=3D len
> +		rel_path_len =3D e - rel_path;
> +	} else if ((e - s) =3D=3D (len - 1)
>  		   && (memcmp(s, "/__overlay__", len - 1) =3D=3D 0)) {
>  		/* /<fragment-name>/__overlay__ */
>  		rel_path =3D "";
> @@ -1049,7 +1047,11 @@ static int overlay_symbol_update(void *fdt, void *=
fdto)
>  		if (!path)
>  			return path_len;
> =20
> -		ret =3D overlay_split_fragment_path(path, path_len,
> +		/* verify it's a string property (terminated by a single \0) */
> +		if (path_len < 1 || memchr(path, '\0', path_len) !=3D &path[path_len -=
 1])
> +			return -FDT_ERR_BADVALUE;
> +
> +		ret =3D overlay_split_fragment_path(path, path_len - 1,
>  						  &frag_name, &frag_name_len,
>  						  &rel_path, &rel_path_len,
>  						  &is_overlay);
> --=20
> 2.56.0.313.g2479322e68-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Jgk/y5Mqu3WDWreC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkHA4ACgkQzQJF27ox
2GcpkRAAlUVIqrA4/N+GOIJ7TNIAbmoXHX2h34llJGYauE7sLtljMffTiHEu8LvI
xTPWZVua2EQ0hJtLRwUPKXXAp7u7vpcBPDiow6unKTh5R62LKy6hPgSDBPw7uPdt
zxagJjOIcCJ63pJpKOrywKGYrK8Aobzr/8fxN5QRq596zDA+ADMSDZWJwcdFb33I
BfCosJnB0BVX1ivvLX7d41sk4O4yvEV23VFkknX/0t3IoHjmFuarcq6kQiojWyml
jnCxeGcdbReEbJjoBbHFknLWcH5blTtwphAgI5TmIm65TCCjmMEbVpFomKp79PPL
Vbl+bYcjCuYCAogE2bezHyZJU0IBXBAOdUu5Y6IQX69/j77HlVdelEZmnQbkyRx/
2QiL+vaTYrI6ZLuLWQ0GqCXznlHi+fUaSG0j+bPhbeAUV4xI7c/Fn84hT0R+Gc0p
hjJ8aE55PpAx1MeRflPZgLsMi4fTrz7U6B+f2LeoD4jHFcjyI/jZGB9zJd0BI39y
6nEijGOzZHoIIiqvRfiI/cCAsMqtuM5gYYa9dKAYW73pdcFAor97lsYiEqMUtO4X
h2KqxNh4tgqCqgQaKp6v69A80VcYuTjynlq7atUWiOvbI72vE4l9SM3wW8rNYzza
znsVLKHX0LbUhx6nc/Jah67aQCgn+7kRiBeSPIyCeVfkgV4X5kY=
=eXlF
-----END PGP SIGNATURE-----

--Jgk/y5Mqu3WDWreC--
