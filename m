From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] util: limit gnu_printf format attribute to gcc >= 4.4.0
Date: Sun, 7 Feb 2021 14:23:35 +1100
Message-ID: <20210207032335.GA6951@yekko.fritz.box>
References: <20210206100110.75228-1-jsg@jsg.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612674584;
        bh=i7LMtIFuFzxNfGVjdhDPk2a3TH16gMsW5tqmJXaN2xA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XtVIY7dqaIHL/bs3CIigSwDWMil8iRFRYnx1/2nZp81jrk4QznMHJECX/DZAx/mqm
         xpDcMw4TxXWlgaK4m5EpaNHdW1Em48jYwca876PKs6AUcolP36l6MJYJqNbdmnEn6m
         4qk1flEDmJtMpaiZJvi0cyJYWopZouvRBLm7d+8o=
Content-Disposition: inline
In-Reply-To: <20210206100110.75228-1-jsg-pTb1tGJk1dCHXe+LvDLADg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jonathan Gray <jsg-pTb1tGJk1dCHXe+LvDLADg@public.gmane.org>
Cc: loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 06, 2021 at 09:01:10PM +1100, Jonathan Gray wrote:
> The gnu_printf format attribute was introduced in gcc 4.4.0
> https://gcc.gnu.org/legacy-ml/gcc-help/2012-02/msg00225.html.
>=20
> Use the printf format attribute on earlier versions of gcc and clang
> (which claims to be gcc 4.2.1 in builtin defines) to fix the build with
> gcc 4.2.1.
>=20
> Fixes: 588a29f ("util: use gnu_printf format attribute")
> Signed-off-by: Jonathan Gray <jsg-pTb1tGJk1dCHXe+LvDLADg@public.gmane.org>

Applied, thanks.


> ---
>  util.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/util.h b/util.h
> index a771b46..c45b2c2 100644
> --- a/util.h
> +++ b/util.h
> @@ -13,10 +13,10 @@
>   */
> =20
>  #ifdef __GNUC__
> -#ifdef __clang__
> -#define PRINTF(i, j)	__attribute__((format (printf, i, j)))
> -#else
> +#if __GNUC__ >=3D 5 || (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 4)
>  #define PRINTF(i, j)	__attribute__((format (gnu_printf, i, j)))
> +#else
> +#define PRINTF(i, j)	__attribute__((format (printf, i, j)))
>  #endif
>  #define NORETURN	__attribute__((noreturn))
>  #else

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAfXTUACgkQbDjKyiDZ
s5LfNBAAr+mXq3epowqv2TEA7wHm2cX5vYTsAa8FguQKbXpR0lVPibLRqyMvw3qy
N5neywuIDPM41otng7lnNVfYP19n7dJTei1VMn0UPTs6ibHv9nrBVdgPVsDaByoj
f3NEEGfkIIP0Wm0chE7QPvXJM6lMFuRowiLdNluUzdRc052IrIjUwSl6xUYP2izH
UNoR/kybrnwWBXuIY+7NStvS0I3FN5OkjBgEPaVPVMJ+FUH2bVDvHQ1krSjlCcgq
4Ciaqk316nphPAsz6WFiYxhX0cUYSjCi/uyWtHJt8h0p5uW3+RFAMp9Ot8UoHFCA
MAHdagoR8gY6/ydGntRaqszTusyjdtdxiJNPduCZrenQe6Z0IXB+3EUSvs312iKp
s8q7E6P5AxmzTziYvSb3dRWagIy8udKKqr4sSr2hWEg29EFSEuEftxJ1f3tMFMTB
civmuKGuBKambuVvdxd5XuO3QcQbaqQ77HWpN+aQea77NEVL9iINjs4dlXYEm5Sh
cACejmex80hTdmocYnY9HRnPbl4S871pmn/c1j3tixtS3/R5mRHyUb7E1phAjIz/
HiwvwZjJWWda9jzAdIZql3e4cldCT7Ovy1kxJkYOikhxlb1rXGgwH581pyHoFCXz
ZO2wbduHXVNgO92GVqZmn2wIrMwIr0Ihlx+fQdKT1MASoVaKiEg=
=uvd5
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
