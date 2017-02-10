From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 4/5] Adjust libfdt.h to work with swig
Date: Fri, 10 Feb 2017 16:01:32 +1100
Message-ID: <20170210050132.GF25381@umbus>
References: <20170205201323.15411-1-sjg@chromium.org>
 <20170205201323.15411-5-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1486703135;
        bh=wJmfm+14JVmeAtxjkUlgCi+sp/BH5Io1zKl+5RjLa2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fX/r0otAtzb/FR9Ugt2aKEJfkSr2wmyr8Xiq1vuD/1iQFxRPZp/NAncGw2AY0mf0p
         2GOKAX1ftz2XRvOgHRmTz91F2evgzHBrMNDxmx379BKnzQTy/j9eyDuBBx0M5m1DeE
         ZtPeQ6S8qflrD+SJPFzHbMmeEJQn3OZErIg3xqug=
Content-Disposition: inline
In-Reply-To: <20170205201323.15411-5-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 05, 2017 at 01:13:22PM -0700, Simon Glass wrote:
> There are a few places where libfdt.h cannot be used as is with swig:
>=20
> - macros like fdt_totalsize() have to be defined as C declarations
> - fdt_offset_ptr() and fdt_getprop_namelen() need special treatment due to
>     a TODO in the wrapper for fdt_getprop()

fdt_offset_ptr() is a very low-level function which should be rarely
needed outside libfdt internals, even in C.  I think it makes sense to
exclude it from the Python interface.

fdt_getprop_namelen() is primarily to make certain things easier in C
where copying and slicing up strings can be quite painful.  Since
that's trivial in Python, I don't think there's any need to expose the
namelen() functions in Python.

>=20
> The second one can hopefully be resolved by someone with more knowledge of
> SWIG than me.
>=20
> Add #ifdefs to work around this problem.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v4:
> - Add new patch to adjust libfdt.h to work with swig
>=20
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/libfdt.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c69e918..2e78754 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -143,7 +143,9 @@
>  /* Low-level functions (you probably don't need these)                */
>  /**********************************************************************/
> =20
> +#ifndef SWIG /* Use a special rule in libfdt.swig instead */
>  const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int che=
cklen);
> +#endif
>  static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
>  {
>  	return (void *)(uintptr_t)fdt_offset_ptr(fdt, offset, checklen);
> @@ -210,7 +212,7 @@ int fdt_next_subnode(const void *fdt, int offset);
>  /**********************************************************************/
>  /* General functions                                                  */
>  /**********************************************************************/
> -
> +#ifndef SWIG /* Repeated in libfdt.swig (we cannot use macros) */

You need to duplicate them in libfdt.swig, certainly, but why do you
need to explicitly cut them out here?  Isn't swig smart enough to know
it can't do anything with these?

>  #define fdt_get_header(fdt, field) \
>  	(fdt32_to_cpu(((const struct fdt_header *)(fdt))->field))
>  #define fdt_magic(fdt)			(fdt_get_header(fdt, magic))
> @@ -223,6 +225,7 @@ int fdt_next_subnode(const void *fdt, int offset);
>  #define fdt_boot_cpuid_phys(fdt)	(fdt_get_header(fdt, boot_cpuid_phys))
>  #define fdt_size_dt_strings(fdt)	(fdt_get_header(fdt, size_dt_strings))
>  #define fdt_size_dt_struct(fdt)		(fdt_get_header(fdt, size_dt_struct))
> +#endif /* SWIG */
> =20
>  #define __fdt_set_hdr(name) \
>  	static inline void fdt_set_##name(void *fdt, uint32_t val) \
> @@ -638,8 +641,10 @@ const void *fdt_getprop_by_offset(const void *fdt, i=
nt offset,
>   * Identical to fdt_getprop(), but only examine the first namelen
>   * characters of name for matching the property name.
>   */
> +#ifndef SWIG /* Use a special rule in libfdt.swig instead */
>  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>  				const char *name, int namelen, int *lenp);
> +#endif
>  static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
>  					  const char *name, int namelen,
>  					  int *lenp)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYnUksAAoJEGw4ysog2bOSxQMQAI19JRZYmNsldtGyeOtFtQ+H
PgrkBD515hk3lo4TyWA8vV0b/MPdYA3d11+LRgJXcGjCziSTsRDBFaiPkvBcgG/b
4wqrxs6Pb6CLlW4xYZGrTmT7EdMDisIbv02ykHUz9suj3b8/9QtqSrvguWKJH3/J
h5Ep6mdmHBBRhA6L6MrHAEeUyJyP+YZ6LT/zgMc+KZU90Q3mQdVUnYpktpK1g31B
PYnjstn2kLpLBNjAVadSXFH+b16f0CdW2I2bSNuiCy/gFg0G2lXFupEe/QmPSwSs
2AtQrK+Rb5DdYw3y9gxYqmCVee8Wcuu9454P1ITiLuRqGkoRLtNNo4G1rpGszRZE
VYSYFOnjrlkRNZWvAq53wPLI7dHZKZzZKUBulhF9DMUgqrGB5LmlsLdnrzS0dEVN
22+4o4/RoUlgQyZYP08jld68lm2ZXnIJgY1+3coZtwiK4wG8i45EBvIhk7bSQSdD
lsndtTCRXyBPh0UewAHMFwpL1+yKCfWwYg/XNP4kcb9YyRd/lFVJ/VlJ8JIiZ0MH
/VYrJNXpifpPpGgz3fG0OzpvSPk9bbmrJBcgX/Nyw0YBaU2dlFG9aD8WhdnP8Qv8
DHmnK294dObOtjltYHUSfBjUOmtRt06y/rmKyVYO3iNJvj/W7sWSML1BLXta2bLX
X3XNMveH9HmXP1ifPH+g
=uj+n
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
