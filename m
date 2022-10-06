From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/2] libfdt: prevent integer overflow in fdt_next_tag
Date: Thu, 6 Oct 2022 18:52:58 +1100
Message-ID: <Yz6JWi1AcAuiptup@yekko>
References: <20221005232931.3016047-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ScX4dledyUN0t/IN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1665043573;
        bh=MqNwHM6zIlj3PQCrQckpwoa5Ga9YyAt8OHFXWfVOdsU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G1AWwXBAgW9AAPeQKzVbLytEScMRAlGMmKbW3Df2j7iiWh9tmrHXO37m55/NGnYcf
         9ea/eQ+re9EvBPM5oh6RXABrhRWXf8PBTINaUG8wi+0j3Ee9ExFEOhiTFW75J2CIr/
         dNRjpeXZstl4Kfwmw2SEp254nrMtNkQDlk99J60o=
Content-Disposition: inline
In-Reply-To: <20221005232931.3016047-1-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ScX4dledyUN0t/IN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 04:29:30PM -0700, Tadeusz Struk wrote:
> Since fdt_next_tag() in a public API function all input parameters,
> including the fdt blob should not be trusted. It is possible to forge
> a blob with invalid property length that will cause integer overflow
> during offset calculation. To prevent that, validate the property length
> read from the blob before doing calculations.
>=20
> Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
> v2:
> * Use len local variable to avoid multiple calls to fdt32_to_cpu(*lenp)
> * Add can_assume(VALID_DTB) to the new checks
> v3:
> * Use unsigned integer for prop len and offset validation
> ---
>  libfdt/fdt.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 90a39e8..20c6415 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -162,7 +162,7 @@ const void *fdt_offset_ptr(const void *fdt, int offse=
t, unsigned int len)
>  uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>  {
>  	const fdt32_t *tagp, *lenp;
> -	uint32_t tag;
> +	uint32_t tag, len, sum;
>  	int offset =3D startoffset;
>  	const char *p;
> =20
> @@ -188,12 +188,19 @@ uint32_t fdt_next_tag(const void *fdt, int startoff=
set, int *nextoffset)
>  		lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
>  		if (!can_assume(VALID_DTB) && !lenp)
>  			return FDT_END; /* premature end */
> +
> +		len =3D fdt32_to_cpu(*lenp);
> +		sum =3D len + offset;
> +		if (!can_assume(VALID_DTB) &&
> +		    (INT_MAX <=3D sum || sum < (uint32_t) offset))
> +			return FDT_END; /* premature end */
> +
>  		/* skip-name offset, length and value */
> -		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
> -			+ fdt32_to_cpu(*lenp);
> +		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE + len;
> +
>  		if (!can_assume(LATEST) &&
> -		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >=3D 8 &&
> -		    ((offset - fdt32_to_cpu(*lenp)) % 8) !=3D 0)
> +		    fdt_version(fdt) < 0x10 && len >=3D 8 &&
> +		    ((offset - len) % 8) !=3D 0)
>  			offset +=3D 4;
>  		break;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ScX4dledyUN0t/IN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM+iUYACgkQgypY4gEw
YSJkqw//Xd3pDjXSEWknkkhBAbCDS5EGYtdCjw1r0TwIGpWHVD/w9UZHdSRhPs8s
rxc21FTAXVPv6tUPJROAMZPz8zyt6dCF91eCLrsa9/9EV1f7ADsF6qwg0xFFztIu
vn3z/mU3PRCqHuFDJhi0Pwurp1B+7q9CYJz0Q9aM5m5Iwb/ZiK2Wj4+4RQ9X/4uu
przEwL33+6ERcyl3/ZSgwzpEljxlZa1rWZjhR8eKH6rRakZMIOoUeTRKW7XXqiPE
bnbhVIqie8NH63v/wNzXUxfntCEv3yfVprQycmRauy7yWVT1NhuDw8WUxt0unNay
XdZckDMLmQwuuiutl/AGThwus583w5mFm7UkyXQbV9eaJEF1EsH/2sz6E/MiEj+i
KlwuVZ4XLUcpahUDqcdh2/7kE1I5WRvHHCHkao0qMAhIBCwgoFJggZ+xHE8am8fT
vU1kJ/lUcQo8DNP0N6OcA5ECg6TeM6SSdkLBjxmrbixT+Pb7R8kU06UlUCkL2lRN
PGF5/SJPa8jBUf3mpznePZZS8oM2XTD0HWVapyQHvE6tHOc0/fuUGHKT0DF5SWEc
6Wmoen/qx10sKTyZDRHHgekU6RtTllvGlE9rLT3Hm3HI8GIYb4pgw7W01X0JGPGL
ukbNG9GyavljY3YgwzTjGHGXDmqoKVXp9ZF3dO+a1J/Le1G6ZxY=
=E8mo
-----END PGP SIGNATURE-----

--ScX4dledyUN0t/IN--
