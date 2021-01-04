From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCHv3] Set last_comp_version correctly in new dtb and fix
 potential version issues in fdt_open_into
Date: Mon, 4 Jan 2021 12:26:50 +1100
Message-ID: <20210104012650.GD1915@yekko.fritz.box>
References: <20201229041749.2187-1-jujugoboom@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W5WqUoFLvi1M7tJE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1609724436;
        bh=dNnMiKXg2L/lNTu47p/pguiWx1dQoXGqF2YKqJMGuz8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QmKXQxyT8C0eVGFt46KoaHNzMopEwlxxSJhi/TbXJBab5adlN8iSeAYz8JTKJIXla
         TLw7KcnloicTEMcFrh0V5BgQjohwIKU+Mi97DDKesdUVud3I13lTANNV7l0c6HSB3G
         SC24WvBVEqBXsDUtSJDRsG+R4SB0Fkutj+k9ewYM=
Content-Disposition: inline
In-Reply-To: <20201229041749.2187-1-jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--W5WqUoFLvi1M7tJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 08:17:49PM -0800, Justin Covell wrote:
> Changes in v3:=20
> - Remove noop version sets=20
> - Set version correctly on loaded fdt in fdt_open_into
>=20
> Fixes: f1879e1a50eb ("Add limited read-only support for older (V2 and V3)=
 device tree to libfdt.")
>=20
> Signed-off-by: Justin Covell <jujugoboom-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

>=20
> ---
>  libfdt/fdt_rw.c | 4 +++-
>  libfdt/fdt_sw.c | 2 +-
>  libfdt/libfdt.h | 1 +
>  3 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 68887b9..f13458d 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -428,12 +428,14 @@ int fdt_open_into(const void *fdt, void *buf, int b=
ufsize)
> =20
>  	if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
>  		struct_size =3D fdt_size_dt_struct(fdt);
> -	} else {
> +	} else if (fdt_version(fdt) =3D=3D 16) {
>  		struct_size =3D 0;
>  		while (fdt_next_tag(fdt, struct_size, &struct_size) !=3D FDT_END)
>  			;
>  		if (struct_size < 0)
>  			return struct_size;
> +	} else {
> +		return -FDT_ERR_BADVERSION;
>  	}
> =20
>  	if (can_assume(LIBFDT_ORDER) ||
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 68b543c..4c569ee 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -377,7 +377,7 @@ int fdt_finish(void *fdt)
>  	fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
> =20
>  	/* And fix up fields that were keeping intermediate state. */
> -	fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
> +	fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
>  	fdt_set_magic(fdt, FDT_MAGIC);
> =20
>  	return 0;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 2bc16a8..73467f7 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -14,6 +14,7 @@ extern "C" {
>  #endif
> =20
>  #define FDT_FIRST_SUPPORTED_VERSION	0x02
> +#define FDT_LAST_COMPATIBLE_VERSION 0x10
>  #define FDT_LAST_SUPPORTED_VERSION	0x11
> =20
>  /* Error codes: informative error codes */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--W5WqUoFLvi1M7tJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/ybtgACgkQbDjKyiDZ
s5Jmcw//RZiyK6/nyk65JbYrXV7lXI3b/aHcCyx9b2c2oDX0/WeOxH6CANMh0Lih
yMJxPWAGfVLQ3DP8O3u+BtNoIQlsyup118/F0H5nnUlCB8NhFtsDw+JK8blgLMVp
//B09w5cwZD0oaG/4j1WyGhQuhCvvN5ZkJUcWhUiMqIOkUBlhYrQ/0KNax7p4t/2
jk4yBjm7C9tOLYjlkbg5tBYgxHdL94epkDbA43BZeHzqsgr/YZ8ap6BNvlnB6I5/
KdDNjWS5o+3sSVcIUORFOnM6a/8FcslwIHIKKDYRY0BFQv2nO8WsUU8tPZerP321
EBjeWxTutHmNFMpD6giTznmYBmAQX01lCJeo4IlLYOV3p79wMh8Y2nGb9mv844ZA
Mfrb+ZYiGnL3YEqztNUFNwWmJRTHgZy17d7InYfOSRc5/4mLgl6cBss7VTkJOIDj
ZGGoEWIlXOsXc7mR6SBS3MM15KLONWTB04SYLJTL7Lv8eGEu/IXtIBqlGlrzXqUg
1/+T/BfgkR8F6NNWPLFW/G9TXzW6Gkox3DeiAArLyG9g100Kgrb1bGJwMGqR7BF8
7x4GtIW01PAcnjwbqhKKy/hZhjUhbz51sCIGHM14KVEfaxsp/1YtPcnVUR1lCwyu
RKJt5L94WrPIk2bdUhTP4DAvTBbgIToy9I/mXkwKvSffHpTMa7g=
=yG6O
-----END PGP SIGNATURE-----

--W5WqUoFLvi1M7tJE--
