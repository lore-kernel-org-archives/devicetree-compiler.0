From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 09/13] libfdt: Add fdt_getprop_namelen_w
Date: Wed, 6 Jul 2016 11:22:48 +1000
Message-ID: <20160706012248.GS2251@voom.fritz.box>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
 <20160705082646.25044-10-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CRjAHycgiaTQGSqU"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467771659;
	bh=Ah3MnIzN4buybWpLrq1NFbr6d00Bp/LYc0XOqCZgcxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Am09s9ik7jBKIOgH3gmmLfAH/ckkkOMMuhKXpX5qtRh5VX0lXD9yjDZRLM8J93a5b
	 xn25F5m+wbx0oXFyA+w/JqyY+BBTGUX10OrWH0e67TofjetAISkCRdTg0Aj6QrNAbw
	 MdXLBqC6Jzq1lWH6tohOKOlqX2qlcKAta9biF2Bo=
Content-Disposition: inline
In-Reply-To: <20160705082646.25044-10-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--CRjAHycgiaTQGSqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2016 at 10:26:42AM +0200, Maxime Ripard wrote:
> Add a function to retrieve a writeable property only by the first
> characters of its name.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

This shouldn't be exported, so it should go into libfdt_internal.h.

> ---
>  include/libfdt.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/include/libfdt.h b/include/libfdt.h
> index f13b01f08f71..a55d2d0d8c7b 100644
> --- a/include/libfdt.h
> +++ b/include/libfdt.h
> @@ -619,6 +619,13 @@ const void *fdt_getprop_by_offset(const void *fdt, i=
nt offset,
>   */
>  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>  				const char *name, int namelen, int *lenp);
> +static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
> +					  const char *name, int namelen,
> +					  int *lenp)
> +{
> +	return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
> +						      namelen, lenp);

uintptr_t ??

> +}
> =20
>  /**
>   * fdt_getprop - retrieve the value of a given property

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CRjAHycgiaTQGSqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXfF1oAAoJEGw4ysog2bOS8zUP/RX6xi35lpblIhz8LVz+q7R9
wu/mf9cokh2yoHE0iJqW2neZwvBu51Gj2rK4tmxQSvWLSLItKoTpQm54I8HEV6bj
tGWuWVRoofppxNiP7ijG3r/tO3GqR+e0UVSPZrbjGxivkqy52sEozxI0H89uEtp1
SvhsE5ChrBtYEZhPc/zBCZsHcZ9oU4FVyPaVdT8TGC5iNYAZx0vVmcLzYE4rBcX2
baXjrrNWKb3C3teMP2qpU1ftjq1ZiNxfHRizS8XJCr3mqoHAEomDvf167d3JlO6/
6rB/ujEtdjmYdPEVH0Rvo9a29M8/pEBqgJB0qh3fMsoBTR6fSthN4ZaPVv3UmKf6
XvNzZ6+G35AaYi7h0iPZ9tqQ6SnUewGCbsjpTEqmQJ68J5Y+Ywm8iID9FnTJcxzR
k2vRsjkb7MzCQ1yX16s6nXBel45xD5SLAQNBMq9rLoQqlT2wJoaMvCBY5C7kHl+9
KmcRKEm5gxkiyQVrEg2SUyLuDFlfyb1DlO8SlHqBiAmSYdtMJGc5ipROl97MPREr
gFx0sSJi2Y6h2Ec9y9OIz7Bz94bC1xaPtoHdxLCF5jW9i7T9zMhZdjKxgpqsWu0n
woANnEKt/dZcdvi3r90IITjKjMa3xFZtZd+xkwfibGg0LigIfOMDiZpCDIfOeg8e
KNzq/YD68awB2zo4DVCP
=gFL2
-----END PGP SIGNATURE-----

--CRjAHycgiaTQGSqU--
