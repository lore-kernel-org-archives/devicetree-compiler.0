From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 06/13] libfdt: Add max phandle retrieval function
Date: Wed, 6 Jul 2016 11:13:43 +1000
Message-ID: <20160706011343.GP2251@voom.fritz.box>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
 <20160705082646.25044-7-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHiQ9nAwW5IGN2dL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467771659;
	bh=nkIBxKdKzNKieNvuKgLYhzH8zdMFVnIB+wQBLWcHEDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8vw0zURVFgv0EfywUwPpyVERA9SMfBo26NKvCqSUWZglnVf6I4dSMh042nVoGfg1
	 ychVAnsf4MbvlvwTsB7oS8hnkttmLhaUC59rIe21WzNT8FChjBh1kHmgj2yZSRoX8N
	 UU29mYYX2ANFkQ2/eU8N6otum/NRipq/mQ43/T5Y=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-7-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--hHiQ9nAwW5IGN2dL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:39AM +0200, Maxime Ripard wrote:
> Add a function to retrieve the highest phandle in a given device tree.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  include/libfdt.h    | 13 +++++++++++++
>  lib/libfdt/fdt_ro.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index fbbe58ceb3f1..4643be5adf39 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -283,6 +283,19 @@ int fdt_move(const void *fdt, void *buf, int bufsize=
);
>   */
>  const char *fdt_string(const void *fdt, int stroffset);
> =20
> +/**
> + * fdt_get_max_phandle - retrieves the highest phandle in a tree
> + * @fdt: pointer to the device tree blob
> + *
> + * fdt_get_max_phandle retrieves the highest phandle in the given
> + * device tree
> + *
> + * returns:
> + *      the highest phandle on success
> + *      0, if an error occurred

This will also return 0 if there are no phandles in the entire tree,
which isn't exactly an error.

> + */
> +uint32_t fdt_get_max_phandle(const void *fdt);
> +
>  /**
>   * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
>   * @fdt: pointer to the device tree blob
> diff --git a/lib/libfdt/fdt_ro.c b/lib/libfdt/fdt_ro.c
> index 12214c2dc2b5..503150ef1dc5 100644
> --- a/lib/libfdt/fdt_ro.c
> +++ b/lib/libfdt/fdt_ro.c
> @@ -47,6 +47,32 @@ static int _fdt_string_eq(const void *fdt, int stroffs=
et,
>  	return (strnlen(p, len + 1) =3D=3D len) && (memcmp(p, s, len) =3D=3D 0);
>  }
> =20
> +uint32_t fdt_get_max_phandle(const void *fdt)
> +{
> +	uint32_t max_phandle =3D 0;
> +	int offset;
> +
> +	for (offset =3D fdt_next_node(fdt, -1, NULL);;
> +	     offset =3D fdt_next_node(fdt, offset, NULL)) {
> +		uint32_t phandle;
> +
> +		if (offset =3D=3D -FDT_ERR_NOTFOUND)
> +			return max_phandle;
> +
> +		if (offset < 0)
> +			return 0;
> +
> +		phandle =3D fdt_get_phandle(fdt, offset);
> +		if (phandle =3D=3D (uint32_t)-1)
> +			return 0;

It might be worth pointing out that *any* -1 phandle in the tree
counts as an error.  Since -1 phandles are sometimes used as a
placeholder, ignoring them might be a better option.

> +		if (phandle > max_phandle)
> +			max_phandle =3D phandle;
> +	}
> +
> +	return 0;
> +}
> +
>  int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t =
*size)
>  {
>  	FDT_CHECK_HEADER(fdt);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hHiQ9nAwW5IGN2dL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXfFtHAAoJEGw4ysog2bOSLUoQAIlzKlSclsvpyUU5ReRrZ3ey
y5keukib9quz9q2D9oLhH042VwWXOs9U5a0DTjsP2Kef8HqsYB90h4pg0R5I9PL3
LymbnTLJELjqu0PhMDK4DcT59ejjt3EaGiOjw4gEDNNrYsrCdDA/Om3FFzE+d828
kB/vE4NROqZIUzxTe17GQJfeB4reoIJD7PUu8k73k4LAj53lMODD/f+SNM6cZ7ul
g9N4won/JDkT7MxHFe6z6EwR7PDtcv2bMYKxiguBXz16h915kggPzJPu3RyMOOjh
OdSpFTv5cdYAkO3DyGyUYB1SoNH99n/1NPd4/9v8MOwa9AvHQa/47aNBO31aRiwj
6GPM1sEjdErDWlVYq5Mzs0eMCfMn6B9CS3FQr5ep3MQCfqS2vtg6f1/EOzKPIziX
6VML8t5KD3NcKu2dqeRsDE7tu9UVLQFg7f4Bya541K9ZRNNF6bNeYV7724Zh/3lY
EszZ9vPWC65i3knXlvUyDgBw/n75tIs2Qdj9oFsbysT1FHNPrvxDNpIytTp9pRa6
ALe98wuti9f2buZQB7J4+oiumiiYQCpqVIoTc9NL28xuf3XxqIFIU0aAKcWsoqt7
MUXRPQHfY+zjlWyYs/OZhBXBy3fE3cHPq9TT2044mi/fekjKyWY98GmTk6gWOchB
GsAhcWNfHQ7boWDScbuQ
=JB5E
-----END PGP SIGNATURE-----

--hHiQ9nAwW5IGN2dL--
