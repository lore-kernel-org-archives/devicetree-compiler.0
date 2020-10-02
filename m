From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/6] libfdt: fdt_create_with_flags(): Fix comparison
 warning
Date: Fri, 2 Oct 2020 10:29:35 +1000
Message-ID: <20201002002935.GD1844@yekko.fritz.box>
References: <20201001164630.4980-1-andre.przywara@arm.com>
 <20201001164630.4980-4-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601602062;
        bh=jHiutxo7UWK0v/n7bHpPr5fpl7Ev3Wf02i+giY6c9+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XGwFDOjKiSQgaaVzu6ke8DCMisNG9Bzc/9YV0PLGJfKhS34XeVELi1Do77G/NlZN2
         Bwd3qoX/1CWreUVtcOUeZEfAlbqlEgmQRuIHbblGB94uxb/pktlHUo3EIfawd0EWm1
         u4evIyFgg8QfJAHZMYKNHiPqNgN+JG4QUPIWicOI=
Content-Disposition: inline
In-Reply-To: <20201001164630.4980-4-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:46:27PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_create_with_flags().
>=20
> By making hdrsize a signed integer (we are sure it's a very small
> number), we avoid all the casts and have matching types.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_sw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 354f466..68b543c 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -108,8 +108,8 @@ static void *fdt_grab_space_(void *fdt, size_t len)
> =20
>  int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags)
>  {
> -	const size_t hdrsize =3D FDT_ALIGN(sizeof(struct fdt_header),
> -					 sizeof(struct fdt_reserve_entry));
> +	const int hdrsize =3D FDT_ALIGN(sizeof(struct fdt_header),
> +				      sizeof(struct fdt_reserve_entry));
>  	void *fdt =3D buf;
> =20
>  	if (bufsize < hdrsize)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92dG8ACgkQbDjKyiDZ
s5KrkRAAvhtozSl3tnXGQEdAbtkpiHv6dzxvYqp9n1HnPR/LNK1xwsXh+21KbvqI
A9OFcGm+kM6kPeAcjA0xCQQO709Ox15UTz8Xw8k8twNHEtkZZ7v1bl5DR2bfO7Gk
fbseobk6BREe8m2daruzQ7qNH4laT+Prs7ZVkdHoUyjJYTFvm0Fd8Yy8rIF9dmEI
+nrfM23vyMXON5BsI0nvrYspq3EvXHV4UL+gRHnI1fq7VXsn7WZBN5HBvnN0dxUs
VG2v+tL5EmdgamcJpC7FkDcTMp2IQoX4jNxhByJIjCTbzhpJVNRj8aVqkixTrwbK
PeUoLczsJpCW/W8eN2imOQfXI+8/IUNn/0WKQsWVm2LJaZ3bRt9lW9V3vKb3JSjs
sLtiObOLEw6SxtPBgVqG7Ehz1LGPwbfuVW3SwUs4m0m/lCIxdCMxu+fr5DeZnxHU
ghkZcIkOL7Riyxdg+hMaTeaXQOuozxoVE3540WjrLK2uD+JFHG3z1SGECbpmcBXi
EojdO0ko4DzzaW0oKKY8tc4RnQxPV4rFjY4dz1+Lkxga4VmQBn791Ith7sXOLBeF
GOILn1pMev/qTOt5eN0xLLlyDHLWtV3QuWojYFsERJdiq0gY2wlzek8AngRGGebH
nvN80oqR6Crv0g/07N6xJmULoyn/bugbx4OD39/oY6JBu7ZhCcA=
=6i5h
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
