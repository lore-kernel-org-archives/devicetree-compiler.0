From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] libfdt: Fix a few typos
Date: Tue, 3 Mar 2020 10:01:41 +1100
Message-ID: <20200302230141.GA35885@umbus.fritz.box>
References: <20200302190255.51426-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1583191970;
        bh=T+CBnkhN8rwgSEl2QzoViHIE9g25p7l6UM1czGMsWXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kBYjye4M4BIniAfN6r7Hlg/k2Dw55tGvG0sRxd9gnBzEnoyb714cvn/pcyTDxWGm1
         hMFmbq06FbOwXqxwoAZWIkI8JH8g7tvohzAe4RNb4X3Zr5rb4dkQgTdv6qTiDLSb7p
         Uga62fwzEpqZeipeNq8hNsMydN+977MG45tvdv1U=
Content-Disposition: inline
In-Reply-To: <20200302190255.51426-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2020 at 12:02:52PM -0700, Simon Glass wrote:
> Fix 'saftey' and 'additional' typos noticed in the assumption series.
> Reword the ASSUME_NO_ROLLBACK slightly to improve clarity.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Suggested-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Series applied to master, thanks.

> ---
>=20
>  libfdt/libfdt_internal.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index e9913cd..3201678 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -58,7 +58,7 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(=
void *fdt, int n)
> =20
>  /*
>   * Defines assumptions which can be enabled. Each of these can be enabled
> - * individually. For maximum saftey, don't enable any assumptions!
> + * individually. For maximum safety, don't enable any assumptions!
>   *
>   * For minimal code size and no safety, use ASSUME_PERFECT at your own r=
isk.
>   * You should have another method of validating the device tree, such as=
 a
> @@ -121,8 +121,8 @@ enum {
>  	ASSUME_LATEST		=3D 1 << 2,
> =20
>  	/*
> -	 * This assume that it is OK for a failed additional to the device tree
> -	 * due to lack of space or some other problem can skip any rollback
> +	 * This assumes that it is OK for a failed addition to the device tree,
> +	 * due to lack of space or some other problem, to skip any rollback
>  	 * steps (such as dropping the property name from the string table).
>  	 * This is safe to enable in most circumstances, even though it may
>  	 * leave the tree in a sub-optimal state.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5dkFMACgkQbDjKyiDZ
s5JupQ//QLpIr2THmcrv2weGtbHbane9W/HrBxL9Sh7OqjDXmfBbnlflEt8g8jnr
MxjiFKxqTt/sA4Uf56CQmmrzEERd5LONsiDwxS6phWYbov3tJNWmQkbzX/mbiPuD
AN7Didx9jfK8mqhaQF88zD7uxRy5dS7VwScUuDyPrheo06nc2dsQN2poQSZV5zTH
qyVhyfzyPpAApD01jTC2TLRxkEQPupajblSYSfLgwgqOk/lBBRFLg479KYlCoas1
Voavpkw/4vMdbjpQwCMX+X4TZsbLnFIK3HsvBmeIB4VIKjkPmG89TAbyqwkFpjKd
9TiwpeSnreD6aMjpgK0iPqSy6M4DV9wTQnGKCBQbaWoRyxYRJ7kMxNGYwCx6F4sN
5nFi8CpdvfJL1ssxWRJlmrNKVQoCCmu2+LEl1mgNIkOacfrOXKTSgPvQHDWlFYle
/3SFMe4/XWpy2JnTbvMUZqz50WHKAyuEku6B1EEv9hgZy0elfn0SyGGdutUWsYBQ
zSmTkY/19OaMi/JZuB+kfBwzppZLiUmGguhjuwvXQyM8t4H9J+UQpDiKF9Zq4BjQ
nc5Cc1KSEaCweZ6rmW1YTauHPx+0Ezvq38ZMPC3ycnLjYvgu6fmhJyNYtPKOHPO6
iM1H6WzDKWjLj8xqpAj6gblKSUBOZfTf3an8hR2CP2CtyRheMh8=
=mb83
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
