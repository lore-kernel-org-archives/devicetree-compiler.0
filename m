Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874AB42A91
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Dec 2024 04:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733201207; cv=none; b=VuHjFTvWo0rj7tr9Bszd0x1M13N1fp4ncJjygC26NOoFxVs69V3kh/7rHPCTgMYxOzX4+2YFa79H5P4kzzmc9WRJiEH8tuPjvgGhCwEM7nkV/piPk7mdEfn/pCbqtjMBj8KeHK+fsKCVyiuwUvMwoazWNr+zlSk/LVE5HngZ74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733201207; c=relaxed/simple;
	bh=231IELWK+yabCFCzCYi6rLJq4UfsTrh8v0d8grKVdI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiYpfuumzH6kX76pHKjWcgF0batoLCRXoy5DA5WJCHJ3+9G9MEjVDuz8UjMIG1ThVWv2Uf23zUIPgvw+R314UT3yRuZ7Pc30TVlz7KtAUKpNvBk4Ru3BO4hWrMF6L/sXJFye3dPWpkOd0kdMQqlH79S1tKuktchKRe2861sleX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=JrEEX4gJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="JrEEX4gJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733201192;
	bh=D+ixT1Eeuj4BXfr42I1dT0SQC+qdTdwytXpJFodp7Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrEEX4gJfUU0Pg3V78g5n3Y1+xAbA1DgMSfOcMCzy3R5eIvN2o7qEiJ7u4SF7RXM+
	 Rue9zbxRZYDonYY5+Kd9o6eD2QIecjJqmqqvCI8CbKc9bE/YzCkfL30AfWZMVPXcSs
	 4mLSp9FQvhOArm5cAKQUw9iaf0aSy2KP/zg5DTkC/OWfpglxI2B6EdjkG4tn3LyoE/
	 6ojVE6pvjHMhffe2Rfw0fLFuB43nMseSwIiG6w2krnUfSiZ2s0iGSP5j8GeImuLm8r
	 7MiSFrIvzJPduBuoDAkFalKVcrn4K9hP1bqMGdNNIyVERaF6RP9QWhWgspYHpbMPVK
	 vfmcOtEqbE3hQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2Sm82Xcnz4x6d; Tue,  3 Dec 2024 15:46:32 +1100 (AEDT)
Date: Tue, 3 Dec 2024 15:37:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 3/5] fdtoverlay: Implement resolving path references
Message-ID: <Z06LFy6DZIYl-uph@zatzit>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-3-ac3e121359e9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="078eU+IOLSIAzA9b"
Content-Disposition: inline
In-Reply-To: <20241116-overlay-path-v1-3-ac3e121359e9@beagleboard.org>


--078eU+IOLSIAzA9b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 08:30:21PM +0530, Ayush Singh wrote:
> dts allows references both in integer context:
> 	foo =3D <&bar>;
> in which case it resolves to a phandle, but also in string/bytestring
> context:
> 	foo =3D &bar;
> In which case it resolves to a path.
>=20
> Runtime overlays, only support the former, but not the latter.
>=20
> This patch implements resolving path references when applying overlays.
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  fdtoverlay.c         |  34 +++++++---
>  libfdt/fdt_overlay.c | 174 ++++++++++++++++++++++++++++++---------------=
------
>  libfdt/libfdt.h      |  30 ++++++++-
>  libfdt/version.lds   |   1 +
>  4 files changed, 160 insertions(+), 79 deletions(-)
>=20
> diff --git a/fdtoverlay.c b/fdtoverlay.c
> index ee1eb8f3ad28b14762aca9ab5c8a4e36aac967d8..3b6e666212f7c6742ab1e7897=
c5a0288ff4049ac 100644
> --- a/fdtoverlay.c
> +++ b/fdtoverlay.c
> @@ -44,16 +44,36 @@ static void *apply_one(char *base, const char *overla=
y, size_t *buf_len,
>  		       const char *name)
>  {
>  	char *tmp =3D NULL;
> -	char *tmpo;
> +	char *tmpo =3D NULL;
>  	int ret;
>  	bool has_symbols;
> +	size_t tmpo_len =3D fdt_totalsize(overlay);
> =20
> -	/*
> -	 * We take copies first, because a failed apply can trash
> -	 * both the base blob and the overlay
> -	 */
> -	tmpo =3D xmalloc(fdt_totalsize(overlay));

Changing the comment and allocation logic seems like an unrelated
change to what you're actually trying to accomplish here.

> +	/* Prepare DT overlay */
> +	do {
> +		tmpo =3D xrealloc(tmpo, tmpo_len);
> +
> +		ret =3D fdt_open_into(overlay, tmpo, tmpo_len);
> +		if (ret) {
> +			fprintf(stderr,
> +				"\nFailed to make temporary copy of overlay: %s\n",
> +				fdt_strerror(ret));
> +			goto fail;
> +		}
> +
> +		ret =3D fdt_overlay_prepare(base, tmpo);
> +		if (ret =3D=3D -FDT_ERR_NOSPACE) {
> +			tmpo_len +=3D BUF_INCREMENT;
> +		}
> +	} while (ret =3D=3D -FDT_ERR_NOSPACE);
> +
> +	if (ret) {
> +		fprintf(stderr, "\nFailed to prepare overlay '%s': %s\n", name,
> +			fdt_strerror(ret));
> +		goto fail;
> +	}
> =20
> +	/* Apply DT overlay to base tree */
>  	do {
>  		tmp =3D xrealloc(tmp, *buf_len);
>  		ret =3D fdt_open_into(base, tmp, *buf_len);
> @@ -66,8 +86,6 @@ static void *apply_one(char *base, const char *overlay,=
 size_t *buf_len,
>  		ret =3D fdt_path_offset(tmp, "/__symbols__");
>  		has_symbols =3D ret >=3D 0;
> =20
> -		memcpy(tmpo, overlay, fdt_totalsize(overlay));
> -
>  		ret =3D fdt_overlay_apply(tmp, tmpo);
>  		if (ret =3D=3D -FDT_ERR_NOSPACE) {
>  			*buf_len +=3D BUF_INCREMENT;
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 28b667ffc490e5a24a2b116714eb218d8d16a995..a912bfc580363b5a1376a2b89=
397db0e7e93a7df 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -10,6 +10,7 @@
>  #include <libfdt.h>
> =20
>  #include "libfdt_internal.h"
> +#include "../util.h"

As noted elsewhere including ../util.h (and specifically all the
things it includes indirectly) in libfdt is not permitted.

>  /**
>   * overlay_get_target_phandle - retrieves the target phandle of a fragme=
nt
> @@ -306,7 +307,7 @@ static int overlay_update_local_references(void *fdto=
, uint32_t delta)
>  }
> =20
>  /**
> - * overlay_fixup_one_phandle - Set an overlay phandle to the base one
> + * overlay_fixup_one_path_or_phandle - Set an overlay path/phandle to th=
e base one
>   * @fdt: Base Device Tree blob
>   * @fdto: Device tree overlay blob
>   * @symbols_off: Node offset of the symbols node in the base device tree
> @@ -315,27 +316,30 @@ static int overlay_update_local_references(void *fd=
to, uint32_t delta)
>   * @name: Name of the property holding the phandle reference in the over=
lay
>   * @name_len: number of name characters to consider
>   * @poffset: Offset within the overlay property where the phandle is sto=
red
> - * @phandle: Phandle referencing the node
> + * @symbol_path: path of the pointed node
>   *
> - * overlay_fixup_one_phandle() resolves an overlay phandle pointing to
> - * a node in the base device tree.
> + * overlay_fixup_one_path_or_phandle() resolves an overlay path/phandle =
pointing=20
> + * to a node in the base device tree.
>   *
>   * This is part of the device tree overlay application process, when
> - * you want all the phandles in the overlay to point to the actual
> + * you want all the paths/phandles in the overlay to point to the actual
>   * base dt nodes.
>   *
>   * returns:
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_fixup_one_phandle(void *fdt, void *fdto,
> -				     int symbols_off,
> -				     const char *path, uint32_t path_len,
> -				     const char *name, uint32_t name_len,
> -				     int poffset, uint32_t phandle)
> +static int overlay_fixup_one_path_or_phandle(const void *fdt, void *fdto,
> +					     int symbols_off, const char *path,
> +					     uint32_t path_len,
> +					     const char *name,
> +					     uint32_t name_len, int poffset,
> +					     const char *symbol_path)
>  {
> +	const void *prop;
> +	int fixup_off, prop_len, symbol_off;
> +	uint32_t phandle;
>  	fdt32_t phandle_prop;
> -	int fixup_off;
> =20
>  	if (symbols_off < 0)
>  		return symbols_off;
> @@ -346,45 +350,60 @@ static int overlay_fixup_one_phandle(void *fdt, voi=
d *fdto,
>  	if (fixup_off < 0)
>  		return fixup_off;
> =20
> -	phandle_prop =3D cpu_to_fdt32(phandle);
> -	return fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
> -						   name, name_len, poffset,
> -						   &phandle_prop,
> -						   sizeof(phandle_prop));
> +	prop =3D fdt_getprop_namelen(fdto, fixup_off, name, name_len, &prop_len=
);
> +	if (!prop)
> +		return -FDT_ERR_BADOVERLAY;
> +
> +	/* path references are empty dt properties in overlay */

Oh.. nope, this is wrong.  Path references need not be a whole
property, they can be combined with other things just like phandle
references.  You need to distinguish the two fixup types in the
overlay blob so you know which one to apply.

> +	if (prop_len =3D=3D 0) {
> +		return fdt_setprop_namelen_string(fdto, fixup_off, name,
> +						  name_len, symbol_path);

=2E. and you need to splice the path into the existing property if there
is one.

> +	} else {
> +		symbol_off =3D fdt_path_offset(fdt, symbol_path);
> +		if (symbol_off < 0)
> +			return symbol_off;
> +
> +		phandle =3D fdt_get_phandle(fdt, symbol_off);
> +		if (!phandle)
> +			return -FDT_ERR_NOTFOUND;
> +		phandle_prop =3D cpu_to_fdt32(phandle);
> +		return fdt_setprop_inplace_namelen_partial(
> +			fdto, fixup_off, name, name_len, poffset, &phandle_prop,
> +			sizeof(phandle_prop));
> +	}
>  };
> =20
>  /**
> - * overlay_fixup_phandle - Set an overlay phandle to the base one
> + * overlay_fixup_path_or_phandle - Set an overlay path/phandle to the ba=
se one
>   * @fdt: Base Device Tree blob
>   * @fdto: Device tree overlay blob
> + * @fixups: Device tree overlay ro copy
>   * @symbols_off: Node offset of the symbols node in the base device tree
>   * @property: Property offset in the overlay holding the list of fixups
>   *
> - * overlay_fixup_phandle() resolves all the overlay phandles pointed
> - * to in a __fixups__ property, and updates them to match the phandles
> - * in use in the base device tree.
> + * overlay_fixup_path_or_phandle() resolves all the overlay paths/phandl=
es
> + * pointed to in a __fixups__ property, and updates them to match the
> + * paths/phandles in use in the base device tree.
>   *
>   * This is part of the device tree overlay application process, when
> - * you want all the phandles in the overlay to point to the actual
> + * you want all the paths/phandles in the overlay to point to the actual
>   * base dt nodes.
>   *
>   * returns:
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
> -				 int property)
> +static int overlay_fixup_path_or_phandle(const void *fdt, void *fdto,
> +					 const void *fixups, int symbols_off,
> +					 int property)
>  {
>  	const char *value;
>  	const char *label;
>  	int len;
>  	const char *symbol_path;
>  	int prop_len;
> -	int symbol_off;
> -	uint32_t phandle;
> =20
> -	value =3D fdt_getprop_by_offset(fdto, property,
> -				      &label, &len);
> +	value =3D fdt_getprop_by_offset(fixups, property, &label, &len);
>  	if (!value) {
>  		if (len =3D=3D -FDT_ERR_NOTFOUND)
>  			return -FDT_ERR_INTERNAL;
> @@ -395,14 +414,6 @@ static int overlay_fixup_phandle(void *fdt, void *fd=
to, int symbols_off,
>  	symbol_path =3D fdt_getprop(fdt, symbols_off, label, &prop_len);
>  	if (!symbol_path)
>  		return prop_len;
> -=09
> -	symbol_off =3D fdt_path_offset(fdt, symbol_path);
> -	if (symbol_off < 0)
> -		return symbol_off;
> -=09
> -	phandle =3D fdt_get_phandle(fdt, symbol_off);
> -	if (!phandle)
> -		return -FDT_ERR_NOTFOUND;
> =20
>  	do {
>  		const char *path, *name, *fixup_end;
> @@ -415,6 +426,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdt=
o, int symbols_off,
>  		fixup_end =3D memchr(value, '\0', len);
>  		if (!fixup_end)
>  			return -FDT_ERR_BADOVERLAY;
> +
>  		fixup_len =3D fixup_end - fixup_str;
> =20
>  		len -=3D fixup_len + 1;
> @@ -443,9 +455,10 @@ static int overlay_fixup_phandle(void *fdt, void *fd=
to, int symbols_off,
>  		if ((*endptr !=3D '\0') || (endptr <=3D (sep + 1)))
>  			return -FDT_ERR_BADOVERLAY;
> =20
> -		ret =3D overlay_fixup_one_phandle(fdt, fdto, symbols_off,
> -						path, path_len, name, name_len,
> -						poffset, phandle);
> +		ret =3D overlay_fixup_one_path_or_phandle(fdt, fdto, symbols_off,
> +							path, path_len, name,
> +							name_len, poffset,
> +							symbol_path);
>  		if (ret)
>  			return ret;
>  	} while (len > 0);
> @@ -454,26 +467,26 @@ static int overlay_fixup_phandle(void *fdt, void *f=
dto, int symbols_off,
>  }
> =20
>  /**
> - * overlay_fixup_phandles - Resolve the overlay phandles to the base
> - *                          device tree
> + * overlay_fixup_paths_or_phandles - Resolve the overlay paths/phandles =
to the
> + *                                   base device tree
>   * @fdt: Base Device Tree blob
>   * @fdto: Device tree overlay blob
>   *
> - * overlay_fixup_phandles() resolves all the overlay phandles pointing
> - * to nodes in the base device tree.
> + * overlay_fixup_paths_or_phandles() resolves all the overlay paths/phan=
dles
> + * pointing to nodes in the base device tree.
>   *
>   * This is one of the steps of the device tree overlay application
> - * process, when you want all the phandles in the overlay to point to
> + * process, when you want all the paths/phandles in the overlay to point=
 to
>   * the actual base dt nodes.
>   *
>   * returns:
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_fixup_phandles(void *fdt, void *fdto)
> +static int overlay_fixup_paths_or_phandles(const void *fdt, void *fdto)
>  {
> -	int fixups_off, symbols_off;
> -	int property;
> +	void *tmp =3D NULL;
> +	int fixups_off, symbols_off, property, depth =3D 0, ret;
> =20
>  	/* We can have overlays without any fixups */
>  	fixups_off =3D fdt_path_offset(fdto, "/__fixups__");
> @@ -487,15 +500,30 @@ static int overlay_fixup_phandles(void *fdt, void *=
fdto)
>  	if ((symbols_off < 0 && (symbols_off !=3D -FDT_ERR_NOTFOUND)))
>  		return symbols_off;
> =20
> -	fdt_for_each_property_offset(property, fdto, fixups_off) {
> -		int ret;
> +	ret =3D fdt_next_node(fdto, fixups_off, &depth);
> +	if (ret < 0)
> +		return ret;
> =20
> -		ret =3D overlay_fixup_phandle(fdt, fdto, symbols_off, property);
> +	/* resolving path references will resize the overlay and make fixup ref=
erences
> +	 * invalid. So use a ro copy for reading fixups.
> +	 */
> +	tmp =3D xmalloc(fdt_totalsize(fdto));
> +	memcpy(tmp, fdto, fdt_totalsize(fdto));

No allocator, sorry.  You're going to have to do this the hard way.

> +
> +	fdt_for_each_property_offset(property, tmp, fixups_off)
> +	{
> +		ret =3D overlay_fixup_path_or_phandle(fdt, fdto, tmp, symbols_off,
> +						    property);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>  	}
> =20
> -	return 0;
> +	ret =3D 0;
> +
> +cleanup:
> +	free(tmp);
> +
> +	return ret;
>  }
> =20
>  /**
> @@ -653,7 +681,7 @@ static int overlay_update_local_conflicting_reference=
s(void *fdto,
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_prevent_phandle_overwrite_node(void *fdt, int fdtnode,
> +static int overlay_prevent_phandle_overwrite_node(const void *fdt, int f=
dtnode,
>  						  void *fdto, int fdtonode)
>  {
>  	uint32_t fdt_phandle, fdto_phandle;
> @@ -712,7 +740,7 @@ static int overlay_prevent_phandle_overwrite_node(voi=
d *fdt, int fdtnode,
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
> +static int overlay_prevent_phandle_overwrite(const void *fdt, void *fdto)
>  {
>  	int fragment;
> =20
> @@ -766,8 +794,7 @@ static int overlay_prevent_phandle_overwrite(void *fd=
t, void *fdto)
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_apply_node(void *fdt, int target,
> -			      void *fdto, int node)
> +static int overlay_apply_node(void *fdt, int target, const void *fdto, i=
nt node)
>  {
>  	int property;
>  	int subnode;
> @@ -828,7 +855,7 @@ static int overlay_apply_node(void *fdt, int target,
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_merge(void *fdt, void *fdto)
> +static int overlay_merge(void *fdt, const void *fdto)
>  {
>  	int fragment;
> =20
> @@ -904,7 +931,7 @@ static int get_path_len(const void *fdt, int nodeoffs=
et)
>   *      0 on success
>   *      Negative error code on failure
>   */
> -static int overlay_symbol_update(void *fdt, void *fdto)
> +static int overlay_symbol_update(void *fdt, const void *fdto)
>  {
>  	int root_sym, ov_sym, prop, path_len, fragment, target;
>  	int len, frag_name_len, ret, rel_path_len;
> @@ -1039,7 +1066,7 @@ static int overlay_symbol_update(void *fdt, void *f=
dto)
>  	return 0;
>  }
> =20
> -int fdt_overlay_apply(void *fdt, void *fdto)
> +int fdt_overlay_prepare(const void *fdt, void *fdto)
>  {
>  	uint32_t delta;
>  	int ret;
> @@ -1061,8 +1088,8 @@ int fdt_overlay_apply(void *fdt, void *fdto)
>  	if (ret)
>  		goto err;
> =20
> -	/* Update fdto's phandles using symbols from fdt */
> -	ret =3D overlay_fixup_phandles(fdt, fdto);
> +	/* Update fdto's paths and phandles using symbols from fdt */
> +	ret =3D overlay_fixup_paths_or_phandles(fdt, fdto);
>  	if (ret)
>  		goto err;
> =20
> @@ -1071,6 +1098,23 @@ int fdt_overlay_apply(void *fdt, void *fdto)
>  	if (ret)
>  		goto err;
> =20
> +	return 0;
> +err:
> +	/*
> +	 * The overlay might have been damaged, erase its magic.
> +	 */
> +	fdt_set_magic(fdto, ~0);
> +
> +	return ret;
> +}
> +
> +int fdt_overlay_apply(void *fdt, const void *fdto)
> +{
> +	int ret =3D 0;
> +
> +	FDT_RO_PROBE(fdt);
> +	FDT_RO_PROBE(fdto);
> +
>  	ret =3D overlay_merge(fdt, fdto);
>  	if (ret)
>  		goto err;
> @@ -1079,19 +1123,9 @@ int fdt_overlay_apply(void *fdt, void *fdto)
>  	if (ret)
>  		goto err;
> =20
> -	/*
> -	 * The overlay has been damaged, erase its magic.
> -	 */
> -	fdt_set_magic(fdto, ~0);
> -
>  	return 0;
> =20
>  err:
> -	/*
> -	 * The overlay might have been damaged, erase its magic.
> -	 */
> -	fdt_set_magic(fdto, ~0);
> -
>  	/*
>  	 * The base device tree might have been damaged, erase its
>  	 * magic.
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 999b3800dff5c001b9c1babf370d45024c81a9aa..c14b778108427d0d578b86bc7=
9f18dc88be05524 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -2215,6 +2215,34 @@ int fdt_add_subnode(void *fdt, int parentoffset, c=
onst char *name);
>   */
>  int fdt_del_node(void *fdt, int nodeoffset);
> =20
> +/**
> + * fdt_overlay_prepare - Prepares DT overlay for merging with base DT
> + * @fdt: const pointer to the base device tree blob
> + * @fdto: pointer to the device tree overlay blob
> + *
> + * fdt_overlay_prepare() will take care of any resizing/prepartion of the
> + * given device tree overlay.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there's not enough space in the device tree overlay
> + *	-FDT_ERR_NOTFOUND, the overlay points to some nonexistent nodes or
> + *		properties in the base DT
> + *	-FDT_ERR_BADPHANDLE,
> + *	-FDT_ERR_BADOVERLAY,
> + *	-FDT_ERR_NOPHANDLES,
> + *	-FDT_ERR_INTERNAL,
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADOFFSET,
> + *	-FDT_ERR_BADPATH,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTRUCTURE,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_TRUNCATED, standard meanings
> + */
> +int fdt_overlay_prepare(const void *fdt, void *fdto);
> +
>  /**
>   * fdt_overlay_apply - Applies a DT overlay on a base DT
>   * @fdt: pointer to the base device tree blob
> @@ -2244,7 +2272,7 @@ int fdt_del_node(void *fdt, int nodeoffset);
>   *	-FDT_ERR_BADSTATE,
>   *	-FDT_ERR_TRUNCATED, standard meanings
>   */
> -int fdt_overlay_apply(void *fdt, void *fdto);
> +int fdt_overlay_apply(void *fdt, const void *fdto);
> =20
>  /**
>   * fdt_overlay_target_offset - retrieves the offset of a fragment's targ=
et
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index 989cd89f1051ce59255a3b3e60493be4e5e985cc..88ef44bb19ec69aabac61a125=
4264966e0a9d668 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -66,6 +66,7 @@ LIBFDT_1.2 {
>  		fdt_stringlist_search;
>  		fdt_stringlist_get;
>  		fdt_resize;
> +		fdt_overlay_prepare;
>  		fdt_overlay_apply;
>  		fdt_get_string;
>  		fdt_find_max_phandle;
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--078eU+IOLSIAzA9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdOixMACgkQzQJF27ox
2Gc/Yg/+L2K81zu16NL9e4A8BpMoSxzxEAXfNxx52msjN8gwR8c8FrsaS3+bKbzR
zIAx6s9O/G3K3A52CX2YeoQm3trENj1Y3M8zNMvpcvM2RbzY/DO5mr7ejvdVfRJv
E5RmbX7rUn1zDL8XYhChIsfU9w/Osz9Gh3OEnqFpuk4maJThje4GPh7TMXEjkDIe
eg2+uyf9dY0UBQ9UGivKn9/hDuKEAtsA+XwsECdeSABXS/MwYnN5kgBAAD+bMEg5
0sEJmw96hEK7SlQEq4rhs66SerwuOLPr8KCOTXlFHMrG2Q+oYPWj1mors+QSEHmF
AYGJ/pzDN4hmF0pSkkaFMxfjjqKWdyRETPvAx+u2UnWH0TX7FlRH3dvSNDAsOOZW
ifTII+N5RwjX2A7F4D7cy2lEhV2UWiQC2bMjL4xzbEk8z4TP8exjrKcaqer/UayC
06cl+/YbvX5ayUHLNu8VpFBU5Vg0wK2CAOFxFtDNJIRgDDk1eRl51ChioM9SZMSx
TrBpe4msAuoGw+9JBQjfqtzAbYseZMjgbaprkPuwDSVIx3sOjtf4ycyBN0PULsmJ
EfjvucMdEp5EDobGAPDkz6iT/5up1Ou4Gg60xx8oCOPjXpSwuvfiaaEhGl1Swn1D
lyP1AXX9hBK/jrN9wsO7mrunqbyAlSJ1vdI3Rb7qSek3azFfUvA=
=0SxO
-----END PGP SIGNATURE-----

--078eU+IOLSIAzA9b--
