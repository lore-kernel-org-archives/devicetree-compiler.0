From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/4] tests: Enhance truncated_memrsv to test
 fdt_open_into()
Date: Sat, 12 Jun 2021 12:26:20 +1000
Message-ID: <YMQbTJfZsOW+wLO4@yekko>
References: <20210611115823.31583-1-andre.przywara@arm.com>
 <20210611115823.31583-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="slhQebwjP8CokLPD"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623470335;
        bh=TBRBlpd35N3NOpkWEqCHARVxT1pSwHj/NjmXJI4fzM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ciOt/5SHEIizGAolI5Sclv6KN8Kaw/hOZ0WBqw+nJ667WVf9WvwLXRMztcmXq7umO
         vyIwz7j9pIB8tYPfYuTF8V5Jh7Osfkng2jQrB22EQj7rxLGtGs9YQAOP/SMdusQBlh
         nBHXeXoleStJvtLkV10sMp1NiVuJqHZ5vzijucoI=
Content-Disposition: inline
In-Reply-To: <20210611115823.31583-3-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--slhQebwjP8CokLPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 12:58:21PM +0100, Andre Przywara wrote:
> We already check that libfdt's r/o functions can deal properly with
> malformed blobs, where the memreserve block is not correct.
>=20
> Add a test for fdt_open_into(), which also queries the memreserve block,
> and uses the return value as an offset into a buffer.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
>  tests/truncated_memrsv.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/truncated_memrsv.c b/tests/truncated_memrsv.c
> index d78036c..9defef3 100644
> --- a/tests/truncated_memrsv.c
> +++ b/tests/truncated_memrsv.c
> @@ -18,7 +18,8 @@
>  int main(int argc, char *argv[])
>  {
>  	void *fdt =3D &truncated_memrsv;
> -	int err;
> +	char *buf;
> +	int err, bufsize;
>  	uint64_t addr, size;
> =20
>  	test_init(argc, argv);
> @@ -46,5 +47,12 @@ int main(int argc, char *argv[])
>  		FAIL("fdt_get_mem_rsv(1) returned %d instead of -FDT_ERR_BADOFFSET",
>  		     err);
> =20
> +	bufsize =3D fdt_totalsize(fdt);
> +	buf =3D xmalloc(bufsize);
> +	err =3D fdt_open_into(fdt, buf, bufsize);
> +	if (err !=3D -FDT_ERR_TRUNCATED)
> +		FAIL("fdt_open_into() returned %d instead of -FDT_ERR_TRUNCATED",
> +		     err);
> +
>  	PASS();
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--slhQebwjP8CokLPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDEG0wACgkQbDjKyiDZ
s5IqqxAAshFUD5kHSbkkfxMxa9wJEzc1+saGb4Zznd3xZRCGXxUb4yiLsPjj/OBS
XtF+/kbBS9O/sjcR0ah0iiE0CwRRvBNpx6cKIanbTg97Jz5G2yU9XFh6vt59IqAg
7sM5efHV1PKxFQwVkjKwP5ip9DfrX8nmjzjA8gPYmJcYnQxmtzXW6XXn46i8JyrN
8s4ETL9aroBpZVVHVkqBCJBLa7WpDwcMigBaseoKyFP82zkL1636aOZcK+66R2nw
HsUx1PBKF5oG3/md3MSOYG2HYJNbAqfjNMbHMDGhpBgEfxj/yKj0qd7ZRRYkcbmD
cGTJhJ0wEIk/JpwHDf7aCYpOens8HgarBSHS+Lidqh6Un2wvvRMkl1HVUw5omhfM
WlbydOQD52KT03qB4lddC+ja7r1ncJC/Z651Jo5e9MVKBaTLMeIk3QIdJ46zIbQ7
NAM3dGrd4CCivfL6k2vfj1eDJXuHIg+khn71lri4xw0dKwgeGd3uuNCeMNMHYSf7
uGsTe2TaUkodUsRZ1rI++jdIsR5jfs/QnkIxzDUV+e6w9kzVn/afsB3VNcd+ICCK
HUQ0jzeU0R75EO9l8jo+a2+rI0Qh7/wbp8q/NUOO0XiXyzyzmPSMNWQg0s1oG2/M
TRKGFme2pGjDtBvSujseuRtK0UcPlVzscLReBHbKRymvxTkj+8I=
=s7m1
-----END PGP SIGNATURE-----

--slhQebwjP8CokLPD--
