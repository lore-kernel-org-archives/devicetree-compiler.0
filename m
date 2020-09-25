From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 12/14] libfdt: fdt_get_string(): Fix sequential write
 comparison warnings
Date: Fri, 25 Sep 2020 14:09:03 +1000
Message-ID: <20200925040903.GX2298@yekko.fritz.box>
References: <20200921165303.9115-1-andre.przywara@arm.com>
 <20200921165303.9115-13-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="95puKF9o0QNvO5PE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601007890;
        bh=COHvkO1k/kn0YP29jl4gYv7e24NaS+QzcQhm9xPLMiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dvdn+nRZsMTrmq/DmBu8KizefviB7oEtu1rzpoxjq5S29C0ZglmDLtwEEjFq6VDGg
         2xqkCc2tEm/UmBQTXcWCb3G/ixz608EcLO6awp0dTk0XaT/oBJw8+/ipfofu3KpoZd
         ZN6/6jjSn1rd6UTCugkvoWfFBmfG/EY4WFnhcVAc=
Content-Disposition: inline
In-Reply-To: <20200921165303.9115-13-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


--95puKF9o0QNvO5PE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:53:01PM +0100, Andre Przywara wrote:
> With -Wsign-compare, compilers warn about a mismatching signedness in
> comparisons in fdt_get_string().
>=20
> The two occassions dealing with the sequential write case are a bit
> tricky, since we deliberately abuse the negative values here.
>=20
> As we have just established that stroffset is negative, we can use
> casts to appease the compiler.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> ---
>  libfdt/fdt_ro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index ddb5a2d..059d302 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -68,9 +68,9 @@ const char *fdt_get_string(const void *fdt, int stroffs=
et, int *lenp)
>  		}
>  	} else if (fdt_magic(fdt) =3D=3D FDT_SW_MAGIC) {
>  		if ((stroffset >=3D 0)
> -		    || (stroffset < -fdt_size_dt_strings(fdt)))
> +		    || (stroffset < -(int)fdt_size_dt_strings(fdt)))

So, I'm pretty sure at this point we've tested that
fdt_size_dt_strings < INT_MAX.  But to make it more obvious that it's
safe, I think it would be preferable to case (-stroffset) to unsigned
rather than casting size_dt_strings to signed.

>  			goto fail;
> -		if ((-stroffset) < len)
> +		if ((unsigned)(-stroffset) < len)
>  			len =3D -stroffset;
>  	} else {
>  		err =3D -FDT_ERR_INTERNAL;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--95puKF9o0QNvO5PE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9tbV8ACgkQbDjKyiDZ
s5KnrhAAiq7XDy1D5WJsLtYE864SqnAiPDjdjYlPhAAkP9Bxc5Ca0qMCkQdr+Gpp
Ep83HDJV+9dJqKz27zOE+ofboVXPm0Etz2vB7LGa/fsds6KWzqRcRfiX3ZAPn85U
yUzSiqqZL7ZsF6Yx+gtZxpnzm3ILCvfuXBgQ8S847S7Rmct7CmmVWfbC3LoO1wx1
vWLJ7aGeHPKefjJWzQ3mF2vYkqoeYu0R/CpkAEWazkA6T8JGlmwxx4hOdCMIXGVn
AfVMTlDNZonvO9YebcZ64YN4+80C/uZk3VOm+znWFs6JVTRiLLGc46xz/NEI341R
eQeiB0xvL7JOiVsQRWheUeJzhu8DTfP1HTClwnyGQ67nRcvoj084kn5cyp9gpOzl
HU6GBcySLGUrGRNPIwrVGWcfEn8dOw1u5m6Iy4VEi0NdEVHDsyzGMmGDXfC6rM11
cIqq9zvolMeEskYcllp0i5ESj7vCiu7EfgFavexnnlPisrzLdMxFgliWaRKGpkLn
8d9L0hq/+mFN5fu9LqKnZKKMYkDh1si3CuKdv/6FOPoeZ4+bkfQt+fNedg6kepAA
lM9l37AzPTDz0F+T2AfJ2GPT+GvbWpUPNb0i7S3mxxc853hg14hIN1aB6rWOBYlT
8taDvNOFeHpgNuBy4V7bQTw0H9B558pa8wg3iCAH4j7+03iD1xE=
=Bs61
-----END PGP SIGNATURE-----

--95puKF9o0QNvO5PE--
