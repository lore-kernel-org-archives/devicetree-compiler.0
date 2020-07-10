From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: fix fdt_check_full buffer overrun
Date: Fri, 10 Jul 2020 19:55:46 +1000
Message-ID: <20200710095546.GA2666@umbus.fritz.box>
References: <20200709041451.338548-1-patrick.oppenlander@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1594375946;
        bh=qiefhgiQ6fiK8HnCjbIqjyvXrMO9mB5OfnS0Yl1kdvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LvpHmZoRUmjAOPt8QHCVn1eeu6hAHtLVCsMhFv+HSDQ7OluOHox/R4WpvXi7odEYs
         +7W2HYqPpM6j78hgXBakEqBqs/08i7c0Aa8ML8WSwe2qkOiVrGElyd+YXONnKtnMxz
         MMN99ZJhXvp8Htu7qoG2g8boAil5UOk4z9o1tSSU=
Content-Disposition: inline
In-Reply-To: <20200709041451.338548-1-patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2020 at 02:14:51PM +1000, patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wro=
te:
> From: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> fdt_check_header assumes that its argument points to a complete header
> and can read data beyond the FDT_V1_SIZE bytes which fdt_check_full
> can provide.
>=20
> fdt_header_size can safely return a header size with FDT_V1_SIZE bytes
> available and will return a usable value even for a corrupted header.
>=20
> Signed-off-by: Patrick Oppenlander <patrick.oppenlander-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_check.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index 7f6a96c..9ddfdbf 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -22,6 +22,8 @@ int fdt_check_full(const void *fdt, size_t bufsize)
> =20
>  	if (bufsize < FDT_V1_SIZE)
>  		return -FDT_ERR_TRUNCATED;
> +	if (bufsize < fdt_header_size(fdt))
> +		return -FDT_ERR_TRUNCATED;
>  	err =3D fdt_check_header(fdt);
>  	if (err !=3D 0)
>  		return err;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8IOyAACgkQbDjKyiDZ
s5Isow/+LlHixcPic5cgdkCcVBzjfKuya2Q1F9V6sUHSCYMCC2FeV617CwHRGQ04
GgakGUmNfFt9r5ZO+XzsNoZezEO0He/Ky/2Gmaux4Ci9+ULqIaGiJXmjTySM7yCG
AwDjfNpVQ1si22yNCat8PLVKh2qUnZoDe0FHLIMznplL7fGPk4144UfSKVAFNhvN
6rd1HMyEPaaFC3INrFoJ90genUNcDJw8zibtPng9LQKP9UJ5ONSJXx4POFRTBTAY
DNfstH+0zruUmrx3BwJk7d6cBVvZwM9EtnWbIV6nXoRvbyWfXUZj7LbTYs3jJg4/
XhvnKVjwYwva+sxQeFuhwlJKNIa0+YhLGuKeABkfNgOkt0/yFLuG+DII/PC0jtGy
BmhF4kaYjlZBCydi9WRWMMtaxXciFEoFsXD+MSKwc7dcncCl/oyJE5O9lxTacCgz
zuc8GohK1fUMr7AOUOyvp6aeZNsTI84Dqrw4+2r1lJ32vcHXjvp2Y8uIhblJDY10
Cg3+b9ehAp1XeT3bZCw7equEs/yJe3mPYvnL1mTZS0z9C5gT49ZEDi+Nunc/L1ZH
H9VKAu52qCD6BVWzY/QVef6JxrinXIuzW7kU47n3hYOtxCiEjJNaotWLwj55i0qb
gAIgWKGleh7LI0byo90DxaAK6QxqAAuIQHWUGQRpRTQXRBIbitE=
=fyYy
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
