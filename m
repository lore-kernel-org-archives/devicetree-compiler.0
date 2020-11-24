From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Check for 8-byte address alignment in
 fdt_ro_probe_()
Date: Tue, 24 Nov 2020 16:42:59 +1100
Message-ID: <20201124054259.GD521467@yekko.fritz.box>
References: <20201104130605.28874-1-trini@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EH85xkKza2NXtwkF"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1606196597;
        bh=DlSTpcYqPxoq/x4YM/LjdLqtvJdotGXIu0BsrvaHsKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fo99p6r0U1Csc6DME9s8iMXGlRK8boKywIUgqwOyL/FqHOYKr/osHyRzHUGbuXm75
         +VDaqLc8soXD+nlXdDI68O6EJPXRhjNnWdOKgiQn5fKuZ65f0xR3jeL8rmD1dcm2Ml
         N/BFmmNk/On+jOEkjQd0hmHuf8flm5dgBC704HdQ=
Content-Disposition: inline
In-Reply-To: <20201104130605.28874-1-trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>


--EH85xkKza2NXtwkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 08:06:05AM -0500, Tom Rini wrote:
> The device tree must be loaded in to memory at an 8-byte aligned
> address.  Add a check for this condition in fdt_ro_probe_() and a new
> error code to return if we are not.
>=20
> Signed-off-by: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Applied, thanks, sorry it took so long.

A testcase to make sure this fails on an unaligned blob would be a
nice addition

> ---
>  libfdt/fdt.c    | 4 ++++
>  libfdt/libfdt.h | 6 +++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 6cf2fa03b037..3e893073da05 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -22,6 +22,10 @@ int32_t fdt_ro_probe_(const void *fdt)
>  	if (can_assume(VALID_DTB))
>  		return totalsize;
> =20
> +	/* The device tree must be at an 8-byte aligned address */
> +	if ((uintptr_t)fdt & 7)
> +		return -FDT_ERR_ALIGNMENT;
> +
>  	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
>  		/* Complete tree */
>  		if (!can_assume(LATEST)) {
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 544d3efff584..b600c8d6dd41 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -101,7 +101,11 @@ extern "C" {
>  	/* FDT_ERR_BADFLAGS: The function was passed a flags field that
>  	 * contains invalid flags or an invalid combination of flags. */
> =20
> -#define FDT_ERR_MAX		18
> +#define FDT_ERR_ALIGNMENT	19
> +	/* FDT_ERR_ALIGNMENT: The device tree base address is not 8-byte
> +	 * aligned. */
> +
> +#define FDT_ERR_MAX		19
> =20
>  /* constants */
>  #define FDT_MAX_PHANDLE 0xfffffffe

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EH85xkKza2NXtwkF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+8nWMACgkQbDjKyiDZ
s5LiTQ//ZqPKoRow0TlOdssK0L+Odd8m702w8XEOMNrZZ3AQSnNA0awE139jTWvR
FANrqfftUJFBcGQ0fkNMenUYXmix3MUEjEOGcfjj2VVn1v3m3cyMaTcGO0Uz1MdF
0LKgFLx/d+kX8a4/7l4+Ta7cVUp7xCBX3nagOrCuHIGrYXpJZGNHRk8ChtrlIWpt
TKnSruthkTB217kSMjYuanVQfhF4NosRvqVlaqg27UGG7EYOzpQRa/V3xNgDv1gz
86egmFic4GiPej6s+R69yPNdh4OkWJFIzOATeeISlhM+7KA64KLBzN9PbwdTojb2
/iAiHR9q9++SKL5nSMbR69+7ngkvu5omrlDobPjVixNPzAJ5+YdEwivInGQ0LsQ3
amY8S6OKiOwjADC0cS1VrY6OvAvLxVsZzNGGDX/IxJUuH1InxInFmav9iXLbhz5J
fHMIuBhJuNMRbduWC4gIbp2FZ7ErKNbTawAD/yN85JhBXOZtSN5OCtFooZM6JLw6
qo2ejxiqHeGq2aApuYiG3NLbhy+546kO8qLEnqgUEIhGRPszqJiVesFXSJEFGwvq
MyhibXaWQBX/A9+sdevq9demIgxpN6bTDZtICMED/U+pRuVorq5fFj1yjAl2PEm9
LasoJur15djda3rlWnFm66gbbxZ/ZwnTD/UUmtRWfHxFo6ArIPg=
=o1Us
-----END PGP SIGNATURE-----

--EH85xkKza2NXtwkF--
