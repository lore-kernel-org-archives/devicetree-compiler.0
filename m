From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Handle failed get_name() on BEGIN_NODE
Date: Tue, 26 Jul 2022 21:47:21 +1000
Message-ID: <Yt/USZcIc7FHBQsi@yekko>
References: <20220714083848.958492-1-ptosi@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lB/dWrF+TsSxcphN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1658898900;
        bh=oRgQt7GBfRod+nx9LDWjvxhrXAHK3VbBBxFkhlawuus=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p5MoVFDYRoc2YqNHrjif23RQbbw8eGMfNeT+V6AAVdIstSHIzum5U2yI0VQsJq4Jz
         55Tg9JKocbm58WmTGrMTMyfIJzZU3RpaGeJNfRThb8JmMGuXSvOLtg/ZH14OU5Vbfi
         L6cxmQjOpKp1tvrIFW0sNxCJkDX/UdnBOtZtJIW0=
Content-Disposition: inline
In-Reply-To: <20220714083848.958492-1-ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--lB/dWrF+TsSxcphN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 09:38:48AM +0100, Pierre-Cl=E9ment Tosi wrote:
> Validate the return value of fdt_get_name() as an ill-formed DT, causing
> it to fail, could result in fdt_check_full() dereferencing NULL.
>=20
> fixes: a2def5479950 ("libfdt: Check that the root-node name is empty")
> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Applied, thanks.  Sorry it took me so long to look at this.

> ---
>  libfdt/fdt_check.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index fa410a8..71390ee 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -66,7 +66,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  				int len;
> =20
>  				name =3D fdt_get_name(fdt, offset, &len);
> -				if (*name || len)
> +				if (!name || *name || len)
>  					return -FDT_ERR_BADSTRUCTURE;
>  			}
>  			break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lB/dWrF+TsSxcphN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLf1DMACgkQgypY4gEw
YSJ2uBAArNIv2NpeGyk75l9SQitZ+bdW7hNsmgwkZpcEztXGuuWra1TgX9IFHO6r
1lVX5W6VPPYaip9CU0q1SlSAcKTsICWdQIlUzeDnPTi2f56oxxG7TaVFWYozEj1T
K/TbTex6+C+bzIvDs0oe71qJQGE9LKXN/X17sgGFr7hGucFId+Nx41d3jBL4TrJE
Dlgdq+iiyzlC0pIKcVVQOqT8wHtlA9M4X91Pvh7rtPywKcnBNtgsAgLNtGUGCYxM
1AcTxXNI+RpG0/TyaljyxMrrb9kYRbBUmxSJ/u+VTgkEtx9PHzPQUuGNazUfm/xR
wzoBnc4SmenqOe7zqiScQTBlx8oKJ6FQOUzI3sb6Ikk3y78K7RZN0/6DIceKMSHZ
VLfaMMZBm9Z12x3I2QzZ7zlYYZ/xd9IiPocjj826KLpDIXdZ+8aPAAcBtONu1ZIb
t34gLGgWA7hmIyrLM+LHrzkl0VMwJdV3YW6Ca6mjk1KgHrO3J+oseK5PJKUp3ID1
f5m3jfcLz/TKFHqizDXaGNMUFl1xznIq5/todb7LdSD8ElAuukoWC6ovU2Sw/0VY
0RBJLjb+vF0QZUi9sqhetJxzv8F5BAMvGROLJNQ22UJjyJ7Xsx8CcReitLA0nBEw
pB4CJQQEmue4NxoZzYoBobGoe53VJTGU4TxToW+W9lApoTOPVwg=
=bAzA
-----END PGP SIGNATURE-----

--lB/dWrF+TsSxcphN--
