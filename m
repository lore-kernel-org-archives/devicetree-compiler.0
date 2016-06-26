From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 08/12] libfdt: Add fdt_path_offset_namelen
Date: Mon, 27 Jun 2016 01:47:37 +1000
Message-ID: <20160626154737.GS15625@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-9-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nccO0ldXW0cuDU6a"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1466956117;
	bh=DOAQWqNL2YyzZ6FqgBzreTNWGt+CSsqa/L8ZMPTzoZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQ95KIuoPHb9CzA19PL966duZ9mgjazS3VMKXaFkUyC80tTsaDfhAOy3G1zJ9QHKT
	 fcl1jfAorDR57l+nA8azpzDJwX9ppmhw7RgbASna+ATdmhqbtl+YA+DNOKSDS3gw6H
	 Xn9irESPMnkI6llLlGxHBnyu04qe1c/ttuMWVx7k=
Content-Disposition: inline
In-Reply-To: <20160624142757.32735-9-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--nccO0ldXW0cuDU6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 04:27:53PM +0200, Maxime Ripard wrote:
> Add a namelen variant of fdt_path_offset to retrieve the node offset using
> only a fixed number of characters.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Looks good for upstream.

> ---
>  include/libfdt.h    | 16 +++++++++++++++-
>  lib/libfdt/fdt_ro.c | 18 ++++++++++--------
>  2 files changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index 2c8a42bcb667..dbe8a0efca87 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -365,6 +365,17 @@ int fdt_subnode_offset_namelen(const void *fdt, int =
parentoffset,
>   */
>  int fdt_subnode_offset(const void *fdt, int parentoffset, const char *na=
me);
> =20
> +/**
> + * fdt_path_offset_namelen - find a tree node based on substring
> + * @fdt: pointer to the device tree blob
> + * @path: full path of the node to locate
> + * @namelen: number of characters of name to consider
> + *
> + * Identical to fdt_path_offset(), but only examine the first
> + * namelen characters of path for matching the node path.
> + */
> +int fdt_path_offset_namelen(const void *fdt, const char *path, int namel=
en);
> +
>  /**
>   * fdt_path_offset - find a tree node by its full path
>   * @fdt: pointer to the device tree blob
> @@ -387,7 +398,10 @@ int fdt_subnode_offset(const void *fdt, int parentof=
fset, const char *name);
>   *	-FDT_ERR_BADSTRUCTURE,
>   *	-FDT_ERR_TRUNCATED, standard meanings.
>   */
> -int fdt_path_offset(const void *fdt, const char *path);
> +static inline int fdt_path_offset(const void *fdt, const char *path)
> +{
> +	return fdt_path_offset_namelen(fdt, path, strlen(path));
> +}
> =20
>  /**
>   * fdt_get_name - retrieve the name of a given node
> diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
> index 503150ef1dc5..05344d3eebfe 100644
> --- a/lib/libfdt/fdt_ro.c
> +++ b/lib/libfdt/fdt_ro.c
> @@ -145,10 +145,10 @@ int fdt_subnode_offset(const void *fdt, int parento=
ffset,
>   * "foo/bar:option" and "bar:option/otheroption", both of which happen, =
so
>   * first searching for either ':' or '/' does not work.
>   */
> -static const char *fdt_path_next_seperator(const char *path)
> +static const char *fdt_path_next_seperator(const void *path, int len)

Not in scope for this patch, but I should fix that mispelling of 'separator=
'.

>  {
> -	const char *sep1 =3D strchr(path, '/');
> -	const char *sep2 =3D strchr(path, ':');
> +	const void *sep1 =3D memchr(path, '/', len);
> +	const void *sep2 =3D memchr(path, ':', len);
> =20
>  	if (sep1 && sep2)
>  		return (sep1 < sep2) ? sep1 : sep2;
> @@ -158,9 +158,9 @@ static const char *fdt_path_next_seperator(const char=
 *path)
>  		return sep2;
>  }
> =20
> -int fdt_path_offset(const void *fdt, const char *path)
> +int fdt_path_offset_namelen(const void *fdt, const char *path, int namel=
en)
>  {
> -	const char *end =3D path + strlen(path);
> +	const char *end =3D path + namelen;
>  	const char *p =3D path;
>  	int offset =3D 0;
> =20
> @@ -168,7 +168,7 @@ int fdt_path_offset(const void *fdt, const char *path)
> =20
>  	/* see if we have an alias */
>  	if (*path !=3D '/') {
> -		const char *q =3D fdt_path_next_seperator(path);
> +		const char *q =3D fdt_path_next_seperator(path, namelen);
> =20
>  		if (!q)
>  			q =3D end;
> @@ -181,14 +181,16 @@ int fdt_path_offset(const void *fdt, const char *pa=
th)
>  		p =3D q;
>  	}
> =20
> -	while (*p) {
> +	while (*p && (p < end)) {
>  		const char *q;
> =20
>  		while (*p =3D=3D '/')
>  			p++;
> +
>  		if (*p =3D=3D '\0' || *p =3D=3D ':')
>  			return offset;
> -		q =3D fdt_path_next_seperator(p);
> +
> +		q =3D fdt_path_next_seperator(p, end - p);
>  		if (!q)
>  			q =3D end;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nccO0ldXW0cuDU6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb/kZAAoJEGw4ysog2bOSO2MQAJMzykUZWFRpFvUOY4OWqWVa
3BzJtrCsDkDx+C5oOvCUYQnjbV92ZJvDBOWTMm71JMFWDgsqsLwiarccApxTmok8
qQonwt5AiopIgVqJroWhc52rvqPwYs0cntbBd2XNWRCltdwC8fBCBsNBylhU05ck
VlGVKKvKyWZ6Y0drzANyW84iKILdbvdIF4W7D4eVvViXO3HyObCRtUuzYZsYZla9
NZ9OYUuczHwIaibv1pnC4ywkeyX70/Co0wtUQhW6OiMjSaw0g4zwLS54CI+g5xNd
I3WxCzDym02I3UiG15HsQUK0VYUH1MLIiLoIurjh9hXKUZydPQUGAsSYLS1648Bp
yBfvsvNPYQILfg9ixu3h8QWAV9b3XpN4RQVkka67rWN9TZ1eXJnsMOz3aa3H5ung
fjMNciKhCxzn+BRaBL9FOW5ZucmM8emwMspVoirRxgOkafUcI1MDUdJdJA8NJUfX
0zY05ucPpLHMxRy0dilsh0mYJseOnv1PiPtu5Frfpw/jZOrVjN61XiGth3TV4FXk
uYyDxTYKvWT5g4GFHyJZkCg/apVM3d3WMVIb/BNhdmAvlfw+plXy+8OYiSxUi0kf
o1sAf95BLyTCze6bqU+7oi15yn1vVWAc7CNOcWPmuc6WMGReggEz9PkSLnpQThrj
5slD8Laqta/d9oefkxzi
=pn8X
-----END PGP SIGNATURE-----

--nccO0ldXW0cuDU6a--
