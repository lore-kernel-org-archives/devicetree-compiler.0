From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: simplify fdt_del_mem_rsv()
Date: Mon, 22 Aug 2016 06:54:39 -0400
Message-ID: <20160822105439.GA16293@littlecatz>
References: <1471859749-1210-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1471863523;
        bh=Z40okbJMaH2dUGc0PLujNZi5b8E+QuL9zPIgrmRIAFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UAuLQvZtD0pTr2N8vQElnIXxWYMv7xG5mg/tRAVyMfKyz6Ag1AQrWPHMr6w6boxPZ
         GkNivIrSV2d5jhzhSvDm5TvKGnQ7kZjRTOsX07pcjGCQPUNFjiPCAV/uUGnItucB3Z
         yFijQ6YewIHmmWRaMpPbo+3qdSRL9KDEQi6E0jNk=
Content-Disposition: inline
In-Reply-To: <1471859749-1210-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 06:55:49PM +0900, Masahiro Yamada wrote:
> The variable "err" is unneeded.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Applied, thanks.

> ---
>  libfdt/fdt_rw.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 8be02b1..2eed4f5 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -191,17 +191,13 @@ int fdt_add_mem_rsv(void *fdt, uint64_t address, ui=
nt64_t size)
>  int fdt_del_mem_rsv(void *fdt, int n)
>  {
>  	struct fdt_reserve_entry *re =3D _fdt_mem_rsv_w(fdt, n);
> -	int err;
> =20
>  	FDT_RW_CHECK_HEADER(fdt);
> =20
>  	if (n >=3D fdt_num_mem_rsv(fdt))
>  		return -FDT_ERR_NOTFOUND;
> =20
> -	err =3D _fdt_splice_mem_rsv(fdt, re, 1, 0);
> -	if (err)
> -		return err;
> -	return 0;
> +	return _fdt_splice_mem_rsv(fdt, re, 1, 0);
>  }
> =20
>  static int _fdt_resize_property(void *fdt, int nodeoffset, const char *n=
ame,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXutnvAAoJEGw4ysog2bOSTAsP/RTEU/dUssWPtrkM95zZiroU
NO07dl/VIMw8XsJ+KQkyIKkru4fj1AZEa+4bjqT6zrRz3VOfrcfA3GGEZSC8YmGT
/2QsTroVv3zy4sRWhogDpj4kmEO2IxnmQuOIZ3GsQyztx3oVqT3DGRaMh8XM+HU6
Y6GA502yGA7kNa2Jl7A05ZKiVQ1TWJyKWIP8zY4ujE16GMRceI00EzUvv6ULxbhU
rpsSP1nY0udblCqy+7W4u+tHXl5XvO1aOnAGUdXENuJ6xL2p1E/ZiaUvMTUxv6z4
BPpUIIwHvByXvCDYrRwE5oDtpNTTITtmFT1SWDeArdEPvP7MD4Z0L+O9ptj6cEtV
GsbOe0pDGwVDTuIxCE5qySAZKMRgLNLSF0rPsaNzXpYfWVVAZrmlPff1Icmx7ctK
qHNginiJE65zj9BIXSWkXUjt5N2KvzA5qE600NfDtNpLtVzjy6AwiGkt1CD9xF3C
FZsVNsQNBy5gJIbfGRUZ2A/t6YgY6/svFlKmSg0OgzYknrUx4KfUJCLW25M4IpHU
R0jkFamt+Et/Td14Lb6Tzb9SQ+Q/iRWm22hZh5kxSZ91x3HKN5ITjAVIEIgQ+vjj
JCeQnVesjIK6ET0S/1+fVnGYOwaa0rfjpu85aZx0iQBrZER8GkJC2yCHiB8pivDh
dg22BmJh8l6YHbXDsPq7
=zssq
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
