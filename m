Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336277;
	b=FoIqqCmFDXZX1EDPv7mOR2eOVjroMWoHc7BQwV6DQ4ikJoeGYqDxsix9t4EUPItc/2Uz
	 GzKxRjVVHVsezjCUPUSYr1OwICTq2CagWBH6KMbqTvggVkakSXHV70BiGZjgPt+hthqR7
	 WI+OxBcGfmMtqCIG04V7wW1+zotU5ErYE0YENoR+j3fj9szaYZg8Jo4Nlt17H8DeYI/NR
	 JMe3Fw+uNiX9wzgVQaTd5hOSy1b+cGCXAtX9L30jck+Qe0vaqGtZWWw4GCyg5aoskV2VN
	 GIOxFfOP1Hvx4p31qLyoEWfIaHkXUvHnU9YMbUVT9DsYUbbzgxUtb8fK9Zivcjq2X1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336277;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=I0vYCOyTQQMUVnUFD9rJQ97+8KRu7CX84Qn3F1giM14=;
	b=BbvUFCB5JcV1ovrGZGIxpvG3ltFFAihYkFUcYq8FvEyJVkX/4fN10t5aDr/QcBhFrJBr
	 EMW3c1/o01TAoICoGB/h1KfOTBH2rfgeG7SIp/yJsw25v1MOY3Y+vbLU+53Ndxe4F7aAw
	 KYZQk7uWyIhlsecSuZ6cFwZ533tdUAwCNKN2na+hMTPucWlpe+PehnL0JTsG5SZZ+5xdC
	 ujDnTa/TuTdUsFK9fmGTdGcKS9YKvnuQ2c3fILd+IO2U7qAVKLYlXgsf16Q8A6+br8G34
	 R2Td6zy9hduY7qYVH02myYTWV63KxdDKuxR4XmhVE597ND4olMDCL9HZjfdmnIfxB5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0D606A31A;
	Fri, 30 Oct 2026 04:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793336270;
	bh=I0vYCOyTQQMUVnUFD9rJQ97+8KRu7CX84Qn3F1giM14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cb5tPcieJ5ZRSq9FwQWwCItbKq2vGuaPtkauR4ZEFoT2+o9bNUuL3rf6QRQmfnhL1
	 10hKe3nVXnSXIUCvnAlQpGQ3LEw/uaBRv6G64TIHChvv+EgcGX93PaMdOjxFcwmxLO
	 UCOll7FE4K4XMk4ryLSzSp84lE5T9vKH2fjnjxahSsLC0jqC5jsKXUZiMR+qgp9OT9
	 RBDjm/Q7VIUjIEYTVqSekDUVa59Uv/OYHk8pLz6CXKEpb9eKl5Be9dUBBi0vJNC7Pl
	 JXvKeenQ/YjN29CMSjMVCup/JvIfAAi8EqNPiEudqENYNZW0x6UPyagph3HI308HXW
	 TSlZspXbD/8fg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG83y1Zlfz4x0Q; Fri, 30 Oct 2026 15:57:50 +1100 (AEDT)
Date: Fri, 30 Oct 2026 15:04:18 +1100
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
Subject: Re: [PATCH v2 04/10] libfdt: overlay: Factor out fixup and fragment
 path parsing helpers
Message-ID: <auQXQU974oMkWe01@gractus.seuss>
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-5-dianders@chromium.org>
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
	protocol="application/pgp-signature"; boundary="H9tm/YFMABOe7VK9"
Content-Disposition: inline
In-Reply-To: <20261028215600.1713475-5-dianders@chromium.org>

--H9tm/YFMABOe7VK9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 02:46:53PM -0700, Douglas Anderson wrote:
> In preparation for updating the base device tree's `/__local_fixups__`
> node during `fdt_overlay_apply()`, factor out two helper functions in
> `libfdt/fdt_overlay.c`:
>=20
> - Factor out `overlay_parse_fixup_entry()` from
>   `overlay_fixup_phandle()` to parse `"path:name:offset"` entries in
>   `/__fixups__` properties.
> - Factor out `overlay_split_fragment_path()` from
>   `overlay_symbol_update()` to validate and split
>   `"/<fragment>/__overlay__[/<rel>]"` paths into the fragment name and
>   relative subnode path.
>=20
> This commit is pure code movement with no functional change.

Conceptually good, but has a couple of warts.

>=20
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v2:
> - New patch factoring out overlay_parse_fixup_entry() and
>   overlay_split_fragment_path() helpers in libfdt/fdt_overlay.c
>=20
>  libfdt/fdt_overlay.c | 226 +++++++++++++++++++++++++++++--------------
>  1 file changed, 154 insertions(+), 72 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 51a3859620a4..f9d1a555ed5d 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -351,6 +351,72 @@ static int overlay_fixup_one_phandle(void *fdto, int=
 symbols_off,
>  						   sizeof(phandle_prop));
>  }
> =20
> +/**
> + * overlay_parse_fixup_entry - Parse one "path:name:offset" entry from /=
__fixups__
> + * @valuep: In/out pointer to the current NUL-terminated fixup string
> + * @lenp: In/out remaining length of the /__fixups__ property value

It would be good to describe how the in/out values are updated.

> + * @pathp: Output pointer to the target node path
> + * @path_lenp: Output length of @pathp in bytes
> + * @namep: Output pointer to the target property name
> + * @name_lenp: Output length of @namep in bytes
> + * @poffsetp: Output byte offset within the target property


[snip]
> +/**
> + * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" int=
o parts
> + * @path: Input NUL-terminated path property string
> + * @path_len: Length of @path in bytes (including trailing NUL)
> + * @frag_namep: Output pointer to the fragment name
> + * @frag_name_lenp: Output length of @frag_namep in bytes
> + * @rel_pathp: Output pointer to the relative subnode path after __overl=
ay__
> + * @rel_path_lenp: Output length of @rel_pathp in bytes
> + * @is_overlayp: Set to true if @path is under an __overlay__ subnode

Returning the bool this way is clunky.  Better to use the return
value.

> + * returns:
> + *      0 on success
> + *      -FDT_ERR_BADVALUE if @path is not a valid NUL-terminated '/' path
> + */
> +static int overlay_split_fragment_path(const char *path, int path_len,
> +				       const char **frag_namep,
> +				       int *frag_name_lenp,
> +				       const char **rel_pathp,
> +				       int *rel_path_lenp,
> +				       bool *is_overlayp)
> +{
> +	int len, frag_name_len, rel_path_len;
> +	const char *s, *e;
> +	const char *frag_name;
> +	const char *rel_path;
> +
> +	*is_overlayp =3D false;
> +
> +	/* verify it's a string property (terminated by a single \0) */
> +	if (path_len < 1 || memchr(path, '\0', path_len) !=3D &path[path_len - =
1])
> +		return -FDT_ERR_BADVALUE;
> +
> +	/* keep end marker to avoid strlen() */
> +	e =3D path + path_len;
> +
> +	if (*path !=3D '/')
> +		return -FDT_ERR_BADVALUE;
> +
> +	/* get fragment name first */
> +	s =3D strchr(path + 1, '/');
> +	if (!s) {
> +		/* Symbol refers to something that won't end
> +		 * up in the target tree */
> +		return 0;
> +	}
> +
> +	frag_name =3D path + 1;
> +	frag_name_len =3D s - path - 1;
> +
> +	/* verify format; safe since "s" lies in \0 terminated prop */
> +	len =3D sizeof("/__overlay__/") - 1;
> +	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) =3D=3D 0)) {
> +		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
> +		rel_path =3D s + len;
> +		rel_path_len =3D e - rel_path - 1;
> +	} else if ((e - s) =3D=3D len
> +		   && (memcmp(s, "/__overlay__", len - 1) =3D=3D 0)) {
> +		/* /<fragment-name>/__overlay__ */
> +		rel_path =3D "";
> +		rel_path_len =3D 0;
> +	} else {
> +		/* Symbol refers to something that won't end
> +		 * up in the target tree */
> +		return 0;
> +	}
> +
> +	*frag_namep =3D frag_name;
> +	*frag_name_lenp =3D frag_name_len;
> +	*rel_pathp =3D rel_path;
> +	*rel_path_lenp =3D rel_path_len;
> +	*is_overlayp =3D true;
> +	return 0;
> +}
> +
>  /**
>   * overlay_symbol_update - Update the symbols of base tree after a merge
>   * @fdt: Base Device Tree blob
> @@ -907,7 +1017,6 @@ static int overlay_symbol_update(void *fdt, void *fd=
to)
>  {
>  	int root_sym, ov_sym, prop, path_len, fragment, target;
>  	int len, frag_name_len, ret, rel_path_len;
> -	const char *s, *e;
>  	const char *path;
>  	const char *name;
>  	const char *frag_name;
> @@ -934,47 +1043,20 @@ static int overlay_symbol_update(void *fdt, void *=
fdto)
> =20
>  	/* iterate over each overlay symbol */
>  	fdt_for_each_property_offset(prop, fdto, ov_sym) {
> +		bool is_overlay;
> +
>  		path =3D fdt_getprop_by_offset(fdto, prop, &name, &path_len);
>  		if (!path)
>  			return path_len;
> =20
> -		/* verify it's a string property (terminated by a single \0) */
> -		if (path_len < 1 || memchr(path, '\0', path_len) !=3D &path[path_len -=
 1])
> -			return -FDT_ERR_BADVALUE;
> -
> -		/* keep end marker to avoid strlen() */
> -		e =3D path + path_len;
> -
> -		if (*path !=3D '/')
> -			return -FDT_ERR_BADVALUE;
> -
> -		/* get fragment name first */
> -		s =3D strchr(path + 1, '/');
> -		if (!s) {
> -			/* Symbol refers to something that won't end
> -			 * up in the target tree */
> -			continue;
> -		}
> -
> -		frag_name =3D path + 1;
> -		frag_name_len =3D s - path - 1;
> -
> -		/* verify format; safe since "s" lies in \0 terminated prop */
> -		len =3D sizeof("/__overlay__/") - 1;
> -		if ((e - s) > len && (memcmp(s, "/__overlay__/", len) =3D=3D 0)) {
> -			/* /<fragment-name>/__overlay__/<relative-subnode-path> */
> -			rel_path =3D s + len;
> -			rel_path_len =3D e - rel_path - 1;
> -		} else if ((e - s) =3D=3D len
> -			   && (memcmp(s, "/__overlay__", len - 1) =3D=3D 0)) {
> -			/* /<fragment-name>/__overlay__ */
> -			rel_path =3D "";
> -			rel_path_len =3D 0;
> -		} else {
> -			/* Symbol refers to something that won't end
> -			 * up in the target tree */
> +		ret =3D overlay_split_fragment_path(path, path_len,
> +						  &frag_name, &frag_name_len,
> +						  &rel_path, &rel_path_len,
> +						  &is_overlay);
> +		if (ret)
> +			return ret;
> +		if (!is_overlay)
>  			continue;
> -		}
> =20
>  		/* find the fragment index in which the symbol lies */
>  		ret =3D fdt_subnode_offset_namelen(fdto, 0, frag_name,
> --=20
> 2.56.0.313.g2479322e68-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--H9tm/YFMABOe7VK9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkF0EACgkQzQJF27ox
2GcB0Q/+O96aeFTN4ZSDDrAY6Nhc30kAIuX3exwO7uF2ukV4bwqDJggRvrKjAD3X
qFluWQvHBB4+RW2Hv2NPuuRPbiRx4y7Na/TuAkWYy9YCPXwb7UlQHm+FsmH9nyb+
DQ2dOqoOfhUj7tV2q8exfAz90oxGiA3JXEC4dhu0sO8uzL9ujuDUkMhPbZvThoEY
rAPtI7nSZ07sncQxQhecxJs1JUveSwxTyiFVbW6hedCDDRfXgTDSsPAaDPDK65aG
QnyGg8atW/zwSj6fe0RHx2QZTDXuW3nNXODGdtiEYMjbt3ooMZ5MGiF6JE53lInt
VoevJnZ/OCXBuQvUfbRcp5WRbNuXvd0h5EMfgeCrFi9ACKPL2+1lXjr7Xxp3wNnf
dxJX+eoFjPA1Hy0d44yJqVI+Ic2mAdkvbrohFbUKFCvIVWAhsfZTlvlXwjVO4D1g
IVcNf25FtCgaN2SYhGkGOMRejV93OHRKAYYo2liRUM3GpMwqMDFv49BN2m3vmW4Y
ODPU5znCdNTa2JlmqLOwRTQwIGtWlj0GLERkHu9gyaOkFuBVpiTloFjSKmtXaS8j
0n4jNG/aBRe+DjIurHF7P4YgrnwujuIDOPF0iSfcZClR/lWacBROIsE/WDKiNI3e
jaSIjLGER830+bWPsmEr07eD/2CDJZi/S8omi7DD2gEgJISJ774=
=UpTg
-----END PGP SIGNATURE-----

--H9tm/YFMABOe7VK9--
