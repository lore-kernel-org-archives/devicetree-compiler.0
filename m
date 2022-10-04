From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/2] libfdt: prevent integer overflow in fdt_next_tag
Date: Tue, 4 Oct 2022 18:06:05 +1100
Message-ID: <YzvbXZG5lSfDL/6v@yekko>
References: <20220930152004.674591-1-tadeusz.struk@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4YxftU/A8nnR+Pvg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1664867720;
        bh=BMxKDTCe1rTJ2jnzvpqRCQ/AxM3RNeFXr6jjIgAA1n4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Knp+YYcqdROVot0PhkxC48/UWLh5fxuTazM9H4wle2kJBQRWFhe8dzBNF4ykpXsF3
         hh3pra0pjK5Kj69qP3vourwQIq6RP8+7CXNQMwo4P4ctDFyIleQG3We1OdsnrGBZLd
         pwUoCVLXMm6whVsPWi+weaeXmDOel0ACEy+MOO4A=
Content-Disposition: inline
In-Reply-To: <20220930152004.674591-1-tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--4YxftU/A8nnR+Pvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 08:20:03AM -0700, Tadeusz Struk wrote:
> Since fdt_next_tag() in a public API function all input parameters,
> including the fdt blob should not be trusted. It is possible to forge
> a blob with invalid property length that will cause integer overflow
> during offset calculation. To prevent that, validate the property length
> read from the blob before doing calculations.

So.. yes, there can be an integer overflow here.  I think the actual
damage it can cause is strongly mitigated by the fact that we should
only ever use the result of that overflow via fdt_offset_ptr(), which
will safely reject a bad offset.

> Signed-off-by: Tadeusz Struk <tadeusz.struk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> v2:
> * Use len local variable to avoid multiple calls to fdt32_to_cpu(*lenp)
> * Add can_assume(VALID_DTB) to the new checks

>  libfdt/fdt.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 90a39e8..b7c202a 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -162,7 +162,7 @@ const void *fdt_offset_ptr(const void *fdt, int offse=
t, unsigned int len)
>  uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>  {
>  	const fdt32_t *tagp, *lenp;
> -	uint32_t tag;
> +	uint32_t tag, len;
>  	int offset =3D startoffset;
>  	const char *p;
> =20
> @@ -188,12 +188,20 @@ uint32_t fdt_next_tag(const void *fdt, int startoff=
set, int *nextoffset)
>  		lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
>  		if (!can_assume(VALID_DTB) && !lenp)
>  			return FDT_END; /* premature end */
> +
> +		len =3D fdt32_to_cpu(*lenp);
> +		if (!can_assume(VALID_DTB) && INT_MAX <=3D len)

This check is redundant with the one below, isn't it?

> +			return FDT_END; /* premature end */
> +
>  		/* skip-name offset, length and value */
> -		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
> -			+ fdt32_to_cpu(*lenp);
> +		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE + len;
> +
> +		if (!can_assume(VALID_DTB) && offset < 0)
> +			return FDT_END; /* premature end */

Hmmm.. so, signed integer overflow is actually undefined behaviour in
C, so checking for offset < 0 after the addition isn't actually a safe
way to check for overflow.  To safely check for overflow, I believe
you need to check that the *unsigned* sum of offset and len is greater
than or equal to offset (*unsigned* integer overflow is defined to
wrap as you'd expect for 2s complement arithmetic).  Actually given
the constraints we've put on offsets in general, we need to check that
that unsigned sum is both greater than offset and less than INT_MAX.

>  		if (!can_assume(LATEST) &&
> -		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >=3D 8 &&
> -		    ((offset - fdt32_to_cpu(*lenp)) % 8) !=3D 0)
> +		    fdt_version(fdt) < 0x10 && len >=3D 8 &&
> +		    ((offset - len) % 8) !=3D 0)
>  			offset +=3D 4;
>  		break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4YxftU/A8nnR+Pvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM720gACgkQgypY4gEw
YSLc7xAAzb28EXoIpyqyhmzzrYrzyhOmnpy5v63fQUsf5JHRk+ucejAykQpYdH7n
Il1LvvwdRcIz3rb469p+ymy1tlcW7So+Dj/yNtNX6cZJv02PdxISCXszVOX4P862
0wSbS9TkZKoOQrvRlhKlRwSi1D4F7MJ+UdCid5JEfojY+iWmVXe0CBNRtC22Lyh+
4wCoPd5tZvAvTHoPNGApUdFbU4f3PmhTSrXPAbm+w0yKDsh8uR2iNS42J2GMIdL/
4pjy5Eb+04mtz1/WtjOoXXrn2ngWBBaOymLWnrz4carnPVBX0x9BDc/hhPgMnjgI
3ow8B7wuo5BdbjXcemqJcSvTwUD4VKzLaj7tRgEj0XJLWQJ+5yoQltmZBRptcGmY
DNxS1WnFYOjOUk654fsOK0VZcvvteX8Mb5RAYofAQBmoTFwzmkwCI7DhC0LGNPRH
U3IeTzjICNU9SciRhibI+tTFBKTXXRYh2CG0GYme25s1j6wfFDMe0qR8i2wfTH1q
C08MVqRCceyKunhMfGa8EXcwamU4G0RpNLDu5dtX9u7kir6HXJqXTbwpdwC9uu6c
MQD8TXDRpPu4oP3RNzc2nAYPkL9ihJCUKdFEBXVaa8gwoeLSDRklxy0zDs+KmCCQ
iGMUwUB2aX+ATHp10xys/7CCgOvrgUh4GeKbLLBP8JF3Nw1fCrU=
=33p5
-----END PGP SIGNATURE-----

--4YxftU/A8nnR+Pvg--
