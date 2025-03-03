Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348F91F0E2C
	for <devicetree-compiler@vger.kernel.org>; Mon,  3 Mar 2025 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996454; cv=none; b=JrPuD1JfHqRpM8h5X1mh/1YQe9xQ8rNy1vsrAS754bi0rg8fng3OxD56a6vzq6oxsA5IMNkm0TAXURoCv2dVvmdcye88X78WlDkfRM8WhJ2tZgkGLCanV9tuMb/QTFuJsb3rFbghp3fYIBlrfuFNA3WRwHlL+sjf0uIFs62qoEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996454; c=relaxed/simple;
	bh=mxn4lpa/cnOlPVo9KoSZ7roQaSUEZ+KNQhz4P+D/KbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RojaHvrJD1CQhHV/vD0VUtoAbESfDe3aoRyjx+fsDM5JKEt4H+rtSXyAXyWzN/AwGzpKJx7jitDXrtsvmqOqhnxU9CAoYIm7xbvbovjuQvn81glbt1YQ6aU6+BY68GriRrMuvnLMi+I18fCeo0eSfMOATq/He4X0LQIMd5fyKTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Cg9y0exh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Cg9y0exh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1740996449;
	bh=b4++NA2SDpuLpHIEyuY0iAGRqymTeoKNmL93sszSG4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cg9y0exhcvnXPrcZ7eQr1Uv+D8OobSXIZFawOKZIaG4n0fgc1WeWSUkQ8KB78O5G6
	 8ir/agmoX+gZ1RD5r7O3jD6H56h3zbgRz5HR0gqaxmBEzXqPQmlFDtgb++PVmK6009
	 NUGQMPhSuYWDaOqtwRtNvGRgM1Hghh2hk4Nd/eWuqjrBahOSIjjpUQtIpoUwQXgTOp
	 1sXiA/ctdtRinB5AVpGaWNooBZ/hluAQfNFBBIvIkx4r59yQ2OJMVTb+aUKPL0RRha
	 cNdNXSW65Cpgual6NXif3470tM8xutgMDliF91DapM2Bun6x0Z0gDkeNeBJv8Br5P4
	 ERhAACi6ouJPw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Z5vcx1whXz4wcd; Mon,  3 Mar 2025 21:07:29 +1100 (AEDT)
Date: Mon, 3 Mar 2025 20:35:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Glass <sjg@chromium.org>, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/3] Add alloc_marker
Message-ID: <Z8V30ae2praqHiPC@zatzit>
References: <20250301-previous-value-v1-0-71d612eb0ea9@beagleboard.org>
 <20250301-previous-value-v1-1-71d612eb0ea9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1v7pPVzu3dyd5wVQ"
Content-Disposition: inline
In-Reply-To: <20250301-previous-value-v1-1-71d612eb0ea9@beagleboard.org>


--1v7pPVzu3dyd5wVQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 01, 2025 at 06:55:02PM +0530, Ayush Singh wrote:
> - Add helper to allocate new marker
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

This patch is a reasonable cleanup, regardless of what happens with
the rest of the series.

> ---
>  data.c | 20 +++++++++++++++-----
>  dtc.h  |  2 ++
>  2 files changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/data.c b/data.c
> index 14734233ad8b7ebd38c3e62442b81aae66601806..913796f2e664d07cdc48e0cbf=
2ab5d6fe9978072 100644
> --- a/data.c
> +++ b/data.c
> @@ -228,11 +228,7 @@ struct data data_add_marker(struct data d, enum mark=
ertype type, char *ref)
>  {
>  	struct marker *m;
> =20
> -	m =3D xmalloc(sizeof(*m));
> -	m->offset =3D d.len;
> -	m->type =3D type;
> -	m->ref =3D ref;
> -	m->next =3D NULL;
> +	m =3D alloc_marker(d.len, type, ref);
> =20
>  	return data_append_markers(d, m);
>  }
> @@ -254,3 +250,17 @@ bool data_is_one_string(struct data d)
> =20
>  	return true;
>  }
> +
> +struct marker *alloc_marker(unsigned int offset, enum markertype type,
> +			    char *ref)
> +{
> +	struct marker *m;
> +
> +	m =3D xmalloc(sizeof(*m));
> +	m->offset =3D offset;
> +	m->type =3D type;
> +	m->ref =3D ref;
> +	m->next =3D NULL;
> +
> +	return m;
> +}
> diff --git a/dtc.h b/dtc.h
> index 4c4aaca1fc417c9d93e904e64b2c40216ee1b093..86928e1eea9764fe5d74d6dbb=
987589d65d54b66 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -183,6 +183,8 @@ struct data data_append_byte(struct data d, uint8_t b=
yte);
>  struct data data_append_zeroes(struct data d, int len);
>  struct data data_append_align(struct data d, int align);
> =20
> +struct marker *alloc_marker(unsigned int offset, enum markertype type,
> +			    char *ref);
>  struct data data_add_marker(struct data d, enum markertype type, char *r=
ef);
> =20
>  bool data_is_one_string(struct data d);
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--1v7pPVzu3dyd5wVQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfFd9AACgkQzQJF27ox
2GfyvQ//ewpTQ5BKFdDow0hTUm/qn9Q954BjRm9QlCVuVFiI+5QKRyE/5LrMATnS
Hw1f5QBUzf+bMvaDUH+8fSNFon1rF0oVfITDflmDvmXuyJU7oCW79NaCMW3rWzkh
nb6e9fNcBsB+6GjjiosCcKqNhJQwVFYTjR5/WDybLKq/vhNQmgrNeShVFEA2D19N
UHZOzaX0XuzjWsWfU0rdlPDF1L1zWsi9+UzRYmhF0LgVmxPYVxvbvsgsmklybKU7
Hcbl6ke2x334VH8Eh6VbiUG79QHfKi+g6/XvNo9rC3/rQnqf/7cNhbBfw5kV8vgO
BGFj9f1r7XNum+UVXa67VsI0tYaXD1G96ujc9siEfZDqU4m9XgGXK7omjMGn29ke
JL4R+1ITUpyo6NzZPciKvLKcauMNH0I21PZ1X/q0W+jaowr06BdZsZc+M+sp6wP1
NN6/+UA4Wl6+G1fFYFq9htIrqF2WfCnHXJIzKrmNzu645v3Rh5fJbb5UcfFzALnb
6l+8HIW/q1NPZfJVKjy6KvxZmxrLU1fjUlMHSsQYDgXPKVqdlMPMGmaNS6falt1J
M9Dlhwf6H1YoU1cn9D891y05fqnbPNxRGL7ITBQmruJjLEq4Mok7PA9k007a4nx1
dU1MD6tevFJ46X2QYZEa8M+waAEMmDQCg/CqqpZpIdPYbbFbrlU=
=bHrx
-----END PGP SIGNATURE-----

--1v7pPVzu3dyd5wVQ--
