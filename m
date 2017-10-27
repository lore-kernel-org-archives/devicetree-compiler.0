From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [libfdt][PATCH v4] implement strnlen for systems that need it
Date: Fri, 27 Oct 2017 23:46:33 +0200
Message-ID: <20171027214633.GH7115@umbus>
References: <20171026011346.5758-1-programmingkidx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CNfT9TXqV7nd4cfk"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1509141388;
        bh=+jl2HJXVwMT2wVc/S54xV1aoAdVae4aMhzo6KXqA7rI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X7gbwraY7vw1eX98MfJsj+2s5ovQg/XferhrqYfWeJV6hrbTWjZalrYp8foOmGCuP
         UoZkOcapgiVMbk9eptGf0JAPKLf5dMEKI1jGshh76am++TzyvrYplLt0fFYU3ClyFr
         lIuN8UoFciuL+dDGgt3ppSU5pItLZUM6Bxge6U8Q=
Content-Disposition: inline
In-Reply-To: <20171026011346.5758-1-programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, qemu-ppc-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org


--CNfT9TXqV7nd4cfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2017 at 09:13:46PM -0400, John Arbuckle wrote:
> Prior the Mac OS 10.7, the function strnlen() was not available. This pat=
ch
> implements strnlen() on Mac OS X versions that are below 10.7.
>=20
> Signed-off-by: John Arbuckle <programmingkidx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks.

> ---
> v4 changes:
> - Added check for definition of MAC_OS_X_VERSION_10_7
> - Renamed strnlen to fdt_strnlen
> - Added macro that defines strnlen as fdt_strnlen
>=20
> v3 changes:
> - Replaced loop with memchr()
>=20
> v2 changes:
> - Simplified the code to make it static inline'ed
> - Changed the type of count to size_t
>=20
>  libfdt/libfdt_env.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
> index 952056c..41fac04 100644
> --- a/libfdt/libfdt_env.h
> +++ b/libfdt/libfdt_env.h
> @@ -109,4 +109,31 @@ static inline fdt64_t cpu_to_fdt64(uint64_t x)
>  #undef CPU_TO_FDT16
>  #undef EXTRACT_BYTE
> =20
> +#ifdef __APPLE__
> +#include <AvailabilityMacros.h>
> +
> +/* strnlen() is not available on Mac OS < 10.7 */
> +# if !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLOWED < \
> +                                         MAC_OS_X_VERSION_10_7)
> +
> +#define strnlen fdt_strnlen
> +
> +/*
> + * fdt_strnlen: returns the length of a string or max_count - which ever=
 is
> + * smallest.
> + * Input 1 string: the string whose size is to be determined
> + * Input 2 max_count: the maximum value returned by this function
> + * Output: length of the string or max_count (the smallest of the two)
> + */
> +static inline size_t fdt_strnlen(const char *string, size_t max_count)
> +{
> +    const char *p =3D memchr(string, 0, max_count);
> +    return p ? p - string : max_count;
> +}
> +
> +#endif /* !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLOW=
ED <
> +          MAC_OS_X_VERSION_10_7) */
> +
> +#endif /* __APPLE__ */
> +
>  #endif /* _LIBFDT_ENV_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CNfT9TXqV7nd4cfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnzqTkACgkQbDjKyiDZ
s5KnRQ/8DcR/3t230Rv3539PivJ2Z18wKQAYU0Hr8OL5hBQv2vMx7+UkyK78qzmZ
SEYJRl6fGDrpJJnchMXs71kGrTRJ4/BwiLU7mKYx3gUaQ6zD/qbZX3ow8khvzh8d
A094OeWC3FsLh3evgbgxjLGLpU2bqbIWe9K6taJusbflL2lqNRI2MTH/FIOMDAQd
i1g8DYquPCsKf/I8nvwR+nHye8UffImPAdxvBkZU40DvYZszm/ChBBp5li0l1mrV
adJ9zOQcf3XfonNS0EmO4wX7NPFB0Q5oFOPK8KVGWZku9fRNWGyOJVU/zhcLL6NG
DvklbH88hj1+E0KyPRSvF+V8csTziuLVgtpu6kn0Us6WCEGVWbLY3QoZ6uaym1MY
eVTpfZX5/q1ELAmyb2PnmzuR82A8zxFp9jWcLMhxogcRyCSkBibBcpI3Vbndsqtu
ki7E6H677c09DldI5aOitVw9f/8IYxTC7leXv2AKT6zzMOfcguEjWF4lWrM+UZBs
FI/Oss07Vi/1SZyVT+TL/3S1vQ6mWOiG+JfsjdDAM7HiUgbPBVT1JGCiMFv5B5rp
GfDz7f7YUYGFVyJxYv4Yi7Ble0KJ2tb6kJ+c04OpCOEaDeaGDKSNY853SmG5IguA
BRFiRBwfYvrDk7TC2z8OAanvWloKVKm6f2ft5pAAG3dv+5D4a2I=
=MzBN
-----END PGP SIGNATURE-----

--CNfT9TXqV7nd4cfk--
