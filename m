From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: fix undefined behaviour in fdt_splice_()
Date: Wed, 11 Mar 2020 15:59:14 +1100
Message-ID: <20200311045914.GY660117@umbus.fritz.box>
References: <f2d09e81-7cb8-c5cc-9699-1ac05b0626ff@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RLVVO53zhS75EYih"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1583902759;
        bh=NaxNOqpDwpQRF570GCguuSDU2zlh8zKnV0jAAnvZqAQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QpJ9/Fae6eiQKmYq4RpQBuMjlTr5Doso2ww33vMqMWHa/mIYlJhbaFE3bdF4aKFnd
         C1PzARYI29iUaDo1o31HUCFyJU1WEmp9nO2MXOIa/DGb5lURU6MV5hijX3pTiG3PNp
         OeR5SgkQJFF8z+NDOg4q0mRSi4A0zm9OcL/k6L0A=
Content-Disposition: inline
In-Reply-To: <f2d09e81-7cb8-c5cc-9699-1ac05b0626ff-IBi9RG/b67k@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--RLVVO53zhS75EYih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2020 at 03:04:45PM +0100, Jan Beulich wrote:
> libfdt: fix undefined behaviour in fdt_splice_()
>=20
> Along the lines of commit d0b3ab0a0f46 ("libfdt: Fix undefined behaviour
> in fdt_offset_ptr()"), fdt_splice_() similarly may not use pointer
> arithmetic to do overflow checks. (The left side of the checks added by
> d4c7c25c9ed1 ["libfdt: check for potential overrun in _fdt_splice()"]
> doesn't really lend itself to similar replacement though.)
>=20
> Signed-off-by: Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>

Applied, thanks.

> ---
> The right side of the checks added by d4c7c25c9ed1 looks suspicious,
> which is more noticable after the transformation done here:
>=20
> 	end - oldlen + newlen < (char *)fdt
>=20
> 	end - (char *)fdt + newlen < oldlen
>=20
> 	dsize + newlen < oldlen

Hrm, yeah, I think this is trying to check for overflow of
dsize+newlen, but it's pretty hard to follow.

>=20
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -46,7 +46,7 @@ static int fdt_rw_probe_(void *fdt)
>  			return err_; \
>  	}
> =20
> -static inline int fdt_data_size_(void *fdt)
> +static inline unsigned int fdt_data_size_(void *fdt)
>  {
>  	return fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt);
>  }
> @@ -54,15 +54,16 @@ static inline int fdt_data_size_(void *f
>  static int fdt_splice_(void *fdt, void *splicepoint, int oldlen, int new=
len)
>  {
>  	char *p =3D splicepoint;
> -	char *end =3D (char *)fdt + fdt_data_size_(fdt);
> +	unsigned int dsize =3D fdt_data_size_(fdt);
> +	size_t soff =3D p - (char *)fdt;
> =20
> -	if (((p + oldlen) < p) || ((p + oldlen) > end))
> +	if ((oldlen < 0) || (soff + oldlen < soff) || (soff + oldlen > dsize))
>  		return -FDT_ERR_BADOFFSET;
> -	if ((p < (char *)fdt) || ((end - oldlen + newlen) < (char *)fdt))
> +	if ((p < (char *)fdt) || (dsize + newlen < oldlen))
>  		return -FDT_ERR_BADOFFSET;
> -	if ((end - oldlen + newlen) > ((char *)fdt + fdt_totalsize(fdt)))
> +	if (dsize - oldlen + newlen > fdt_totalsize(fdt))
>  		return -FDT_ERR_NOSPACE;
> -	memmove(p + newlen, p + oldlen, end - p - oldlen);
> +	memmove(p + newlen, p + oldlen, ((char *)fdt + dsize) - (p + oldlen));
>  	return 0;
>  }
> =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RLVVO53zhS75EYih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5ocCIACgkQbDjKyiDZ
s5LPPw//bh/GqBRwFsv8NtSzLFGiIMYcpztzagPBJQwQV8XHU7DIuvUPahu1lWO0
hpgSjdnF+GcsfebWMkmjnZ/5B3kBn7l5NF0ov0exJFrSYnetSRZHjZBkQp3Kwkn+
uBcBBDrUQE+lvnUctUB4KTCA6Q4lwpFIsgUs+++iMDZ4Y5DJp/K7zBG/5qv8jHvW
kRhtwDw/RYgMW/G/fgNH0N+Sjf5VEQHLCASTQTBiaQ8W8FxdmryfsxUd6GFPc2ZA
9jS6nkwuxNHkp9YQUhQddwq1pxAd/+16MG2X/o5SgsU4TXbMHfsNiKrtwOpRXy+C
43QiezGuGBJXRegtkn4K3vR54ZSwu8p9FsJnTyNZLj537zL82ER7kf7NRe5k2Jvt
K86xT3a5SU2e7okQtYYoDDxbo0/EYMFhEgJj5TsxBRonhU1u3RwnAH/w49GID0Bq
qMJNZFhxoxiJ66YntMY/Dn+qgOYE7zk+l3EetRomVjesf7qnVe42UI4SHei6Q84P
kTXxhCeUJ/LntP3VxXGwLxh50dN1AGCLgvI68PwGwN7AAAJpuWb+yVEMRQf0Z3UZ
TBqATFgdvUGk2qvuf/YuUMQ+FFZ7+2xacPXWmTHHiwfY54Pcs3OZk+HA2vrPn7Gg
QEa2WrKBRcpWnGDKtHe346V/z9xA+nWaUchj+ehHGo81FXJKbRc=
=YHV9
-----END PGP SIGNATURE-----

--RLVVO53zhS75EYih--
