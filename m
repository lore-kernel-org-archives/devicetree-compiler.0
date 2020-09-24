From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 07/14] libfdt: fdt_splice_(): Fix comparison warning
Date: Thu, 24 Sep 2020 11:07:33 +1000
Message-ID: <20200924010733.GM2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-8-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9Jdw4pA1x1k2W7MG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1600911797;
        bh=2+S8Ch/WiLjg5tjkzrDIXS0QR91tMG7TJg3t4tzdo+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kwIzU9tV84oQQwfAiZYxTIAkQGnRIEauRTkUL3WKA7Xr9NVkPtJIYL+ibKNuc+sfS
         NwlRax/y5Gt/zHVZXGmXSEqRzOj9ycCInLWFzjUgKAyaEvCJMHoSMJW9lt29LJKvMo
         r0BcZcpu8S3Vl2KeaNO2+Vlvyc4K9bJ0Fnik0bfo=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-8-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--9Jdw4pA1x1k2W7MG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:52:56PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness
> in a comparison in fdt_splice_().
>=20
> Since we just established that oldlen is not negative, we can safely
> cast it to an unsigned type.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_rw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 93e4a2b..68887b9 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -59,7 +59,7 @@ static int fdt_splice_(void *fdt, void *splicepoint, in=
t oldlen, int newlen)
> =20
>  	if ((oldlen < 0) || (soff + oldlen < soff) || (soff + oldlen > dsize))
>  		return -FDT_ERR_BADOFFSET;
> -	if ((p < (char *)fdt) || (dsize + newlen < oldlen))
> +	if ((p < (char *)fdt) || (dsize + newlen < (unsigned)oldlen))
>  		return -FDT_ERR_BADOFFSET;
>  	if (dsize - oldlen + newlen > fdt_totalsize(fdt))
>  		return -FDT_ERR_NOSPACE;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9Jdw4pA1x1k2W7MG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9r8VUACgkQbDjKyiDZ
s5J2TA/+PXP6gMzUccGbBikv0Z0DhovMj/w5Xw15pxgyiOMX4Hpfey8fRzolr7cN
EnKmeZukqa+xz03MbTBI2+8uyCm6JuHMkkjZ9Lyonl+5RMz3GJ1J1/xF3c6og2pn
ueyXP2uTKAVvlLNilqpeLO08gBPjJjFmAnZHydjTCxyvRbpnXG1l9+9hKYrCUod/
0BuOJZYn4IR4/uX2buVHRMevv915+pVaiEXacjzd8hkvXZFJX3lkwBqxwrO9xqtx
/Te+CnNrSF/gOW/ZvPn7xsen0687XWzYqnxVKYk2v2dSPUMR9srFn5sqrqbCzHxj
Hso/bKPHcYJy/PnK3uX37U/A1nCWkYLHnOTyaccrAItpdsdD9pNatc6Lr0gPP3wB
bui1Mrs5qJiDvigfMRyYRgaqv9UPK3HfnMf+sFqPTLRe/z3C1otEQBaeWNY0pYiO
1puoWWWK16atrnN6TzVzfMA01IabYd3qRlAYw2XVgZKYFDJCX+ohIYlg2g7JVj5Z
Znse/ckzc5xpBQ9RP/n/u+P5TWDITPXwCX0lPNCv3O2FzZVHY9g3PmWDtg81wfvy
YRGH81c0udRs4MAIVKrm+b2vdHf4BBExZMnSKqqx7P+AWXjYmgWoUlQSAMMLgEJN
EH4uCnBDkEIgqCaEUxN1dVglR+eHiXnkwFCbDmak74JB5VNS86I=
=vI9p
-----END PGP SIGNATURE-----

--9Jdw4pA1x1k2W7MG--
