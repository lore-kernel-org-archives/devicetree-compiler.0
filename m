From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 4/5] Adjust libfdt.h to work with swig
Date: Fri, 24 Feb 2017 13:55:00 +1100
Message-ID: <20170224025500.GL17615@umbus.fritz.box>
References: <20170222043340.17008-1-sjg@chromium.org>
 <20170222043340.17008-5-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pFej7zHSL6C5fFIz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487904959;
        bh=2S/lJXFTLvBr6cYXwSrtAd9QGS6Myx+B5IOnCWDTmfw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UhQn+SeYjvvO+ycArLNGOZZUbj2gOD4VN7NqubPnkG/hiDLMjoV9G9uNa7WDpnw7b
         EUe7oDXjhFXcpzd2LvOdSjo6qcB+3/nbjDMZATm8BcKiTWGWxLqhAvgIz6HQEY4t4v
         ZYV0/dYQ66fXL8ybKqf3ZOXKwKYQ1brtkQji3yp0=
Content-Disposition: inline
In-Reply-To: <20170222043340.17008-5-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Bimmermann <b.bimmermann-LWAfsSFWpa4@public.gmane.org>, Ulrich Langenbach <ulrich.langenbach-srmvecZYGfHobmly5n/iKBvVK+yQ3ZXh@public.gmane.org>


--pFej7zHSL6C5fFIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 09:33:39PM -0700, Simon Glass wrote:
> There are a few places where libfdt.h cannot be used as is with swig:
>=20
> - macros like fdt_totalsize() have to be defined as C declarations
> - fdt_offset_ptr() and fdt_getprop_namelen() need special treatment due to
>     a TODO in the wrapper for fdt_getprop(). However they are not useful =
to
>     Python so can be removed
>=20
> Add #ifdefs to work around these problem.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v7: None
> Changes in v6: None
> Changes in v5:
> - Update commit message
> - Drop #ifdef around fdt_get_header() macros
>=20
> Changes in v4:
> - Add new patch to adjust libfdt.h to work with swig
>=20
> Changes in v3: None
> Changes in v2: None
>=20
>  libfdt/libfdt.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c69e918..2aa8ff6 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -143,7 +143,9 @@
>  /* Low-level functions (you probably don't need these)                */
>  /**********************************************************************/
> =20
> +#ifndef SWIG /* This functions are not useful in Python */
>  const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int che=
cklen);
> +#endif
>  static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
>  {
>  	return (void *)(uintptr_t)fdt_offset_ptr(fdt, offset, checklen);
> @@ -210,7 +212,6 @@ int fdt_next_subnode(const void *fdt, int offset);
>  /**********************************************************************/
>  /* General functions                                                  */
>  /**********************************************************************/
> -

This looks to be an unrelated change.

>  #define fdt_get_header(fdt, field) \
>  	(fdt32_to_cpu(((const struct fdt_header *)(fdt))->field))
>  #define fdt_magic(fdt)			(fdt_get_header(fdt, magic))
> @@ -638,8 +639,10 @@ const void *fdt_getprop_by_offset(const void *fdt, i=
nt offset,
>   * Identical to fdt_getprop(), but only examine the first namelen
>   * characters of name for matching the property name.
>   */
> +#ifndef SWIG /* Not available in Python */
>  const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
>  				const char *name, int namelen, int *lenp);
> +#endif
>  static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
>  					  const char *name, int namelen,
>  					  int *lenp)

You might as well exclude all the rest of the 'namelen' functions
while you're at it.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pFej7zHSL6C5fFIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYr6CEAAoJEGw4ysog2bOSW50P/2MSjhUSsfwTYVVCxsC6nk7I
lp/4MP9GnUjUdkuL9Qfes33H6+BH5WBX1242rP79qHY0QHT6kB2Mfv40znxskGQS
A29B0Q1QchCVUtHjPBe6t3+GabDUMq2FH2+DtMhPUwgW9SRbM3dUKQANiapNZKEH
MIpuUjk67FABwVo1L0lZUZfhKle9W9ZXOKnL7jJVj5re/fjXcb74ScQOT2NCKUGI
gboCctUm/HdoKRNPRzTeGR0IOSjijF1YjHzZ8cR402diTMFYW2c0XeIZaPMQElz8
etXlVQFbaMAHkH0jHdPpts1oiYJZrGvgPJUoy5jUkQJQO1sTV4AV5CYc45Xhtt/m
D58eqo/uYugZifYyjVUrXoOYHujA2F5Z3Z78Nwh1Ya8ZoefdUj6q88nbFRMBbzDK
gxklMzWu54HD5kWQtv4CBojg233TYlnVLDEZPBjLCS0XWEEsbwcDFQ7Dzn9sd1Rt
GejWN+newxrV1it0g4S0c2E5qoRhg3j9E8dvJFk6SBYAJ/dd+JCYzJSJpuBmBplv
tbLcfpFqgodid+OR43e+AmYaSBWl6vaaJ2DMPHQx0ykVehu0yNUHkvjrucfTMpxJ
Of1r/h1Q9F8PWK8FF7cxND5VFpJ7Tw4CW5RKyr0WNti3lOSK6eCS8k8PT3u0MDJJ
0mOGl4SdMF0Z4oRIGaw9
=IBzb
-----END PGP SIGNATURE-----

--pFej7zHSL6C5fFIz--
