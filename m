From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 08/13] libfdt: Add fdt_path_offset_namelen
Date: Wed, 6 Jul 2016 11:21:42 +1000
Message-ID: <20160706012142.GR2251@voom.fritz.box>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
 <20160705082646.25044-9-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6eUvXotnMb6+obQB"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467771659;
	bh=8BTbCczf6NiMAtz3F6TUVgWqechhSOV+UtioPWzUffI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHGucOQ760L9BcjUU7BpZwFQsQYtjlDp6ngtA0M1NnX7iSWHBcfxxwwycWliv0gsf
	 rnw+AhS1uasB3Cm73vp18YGypmCEzktQ7KufuwgpTMF+sEbeE+wG5YuV6UUu1Tt+H8
	 yp2lPmw3LL7qzFrglgZkXOcywhWHe1xjVW9aLFxQ=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-9-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--6eUvXotnMb6+obQB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:41AM +0200, Maxime Ripard wrote:
> Add a namelen variant of fdt_path_offset to retrieve the node offset using
> only a fixed number of characters.
>=20
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  include/libfdt.h    | 16 +++++++++++++++-
>  lib/libfdt/fdt_ro.c | 18 ++++++++++--------
>  2 files changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index 4643be5adf39..f13b01f08f71 100644
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
> index 6b737b211d2e..9cc98db6e2bf 100644
> --- a/lib/libfdt/fdt_ro.c
> +++ b/lib/libfdt/fdt_ro.c
> @@ -145,10 +145,10 @@ int fdt_subnode_offset(const void *fdt, int parento=
ffset,
>   * "foo/bar:option" and "bar:option/otheroption", both of which happen, =
so
>   * first searching for either ':' or '/' does not work.
>   */
> -static const char *fdt_path_next_separator(const char *path)
> +static const char *fdt_path_next_separator(const char *path, int len)
>  {
> -	const char *sep1 =3D strchr(path, '/');
> -	const char *sep2 =3D strchr(path, ':');
> +	const void *sep1 =3D memchr(path, '/', len);
> +	const void *sep2 =3D memchr(path, ':', len);
> =20
>  	if (sep1 && sep2)
>  		return (sep1 < sep2) ? sep1 : sep2;
> @@ -158,9 +158,9 @@ static const char *fdt_path_next_separator(const char=
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
> -		const char *q =3D fdt_path_next_separator(path);
> +		const char *q =3D fdt_path_next_separator(path, namelen);
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

The *p test should now be redundant.  If you do see a \0 within the
length specified by namelen, you should return FDT_ERR_BADPATH, rather
than just truncating at the \0.

=2E.. and I just realised that path_offset_namelen() is already
upstream, so I should fix that there too.

So what the hell is this downstream fdt_path_next_separator() nonsense for?

>  		const char *q;
> =20
>  		while (*p =3D=3D '/')
>  			p++;
> +
>  		if (*p =3D=3D '\0' || *p =3D=3D ':')
>  			return offset;
> -		q =3D fdt_path_next_separator(p);
> +
> +		q =3D fdt_path_next_separator(p, end - p);
>  		if (!q)
>  			q =3D end;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6eUvXotnMb6+obQB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXfF0mAAoJEGw4ysog2bOSjWEQAJlaD9Ly9dw7Itnm/1Uz5gYZ
D+4ydoac24m8RLUGsjJmBosHV6JnJ/vNztqiEAS98kBsK6quHBUSYm95On3eUX0Z
q1REAw6NPmq5QpK9qb4z6/vWfO4aB1bv+lqcTPdTlwOAaDkIGudJhrWW5My9HQBb
w/lqN/QwGhPHE2wu+0pvmf7nBdlw7Dw9Ya+ZQNEK/Y1mPf14V3hc5iG6h3zT+aNh
X0fTz3+3r5hPVkx3TBOVxCtIo1HP51c1P7HPRCkNSEQaGG64UN7HqXuVTsjJzh9J
mxz9PUBoWr81SLpAXFcU6Dzua2TsFSphpGfE6HhkTjKT9LTIAlnqrPm6holF+oxG
pMV1I3wzaZHrkPGSvifU/zYlTAnsYwepGzJoUW7CoVVIYm5paWBHJ7h7xCd7SfQh
y1XyXBydpSFkPFeec6irsWDXMVVCbZJcZUgVJ2jzLBtAeoDUF5/feU9D3WJV/Ehi
5xRO/Yo9Mrp7f1DcIvFLNXzweeak/SqUoeFraXSZDqs570ZoKLIM7sIGrYJa4ALo
uTNUCWBZjX3nQ0n0nROeQ1MIQbUVF7Fux8kNWkQhUi4IRRhzh8tfRaAym7kJdz0L
RBPA55EUoGJL0f8SthLbNthdmw3EPXLCqaj4h/5IVd/KxJMZ0aio84hJjMOlNXZ4
EF/k9YSCCY73XYocV1bU
=EP52
-----END PGP SIGNATURE-----

--6eUvXotnMb6+obQB--
