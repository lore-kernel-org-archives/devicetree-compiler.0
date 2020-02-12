From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 1/8] libfdt: De-inline fdt_header_size()
Date: Wed, 12 Feb 2020 15:15:09 +1100
Message-ID: <20200212041509.GQ22584@umbus.fritz.box>
References: <20200211200945.46606-1-sjg@chromium.org>
 <20200211200945.46606-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MXxcbiX/Q4+iy5U7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1581480941;
        bh=SgpBgntvqhdHiJ9qx3egznTxVrB+jDFCLsjgm/ee5fM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EcjGka7kWCuOk+VQVTq8QnXWv3l5bLouIDjPDxR91fSzkqP1wETsjLGpeOYjYQx/q
         oqUeYvUY91Zb/MpGH9WASgs1cqa+Ay/EJNEAApUj1dc4cZIrNK9gpysJlmc/lNyFiA
         i0GU1Mr4I8Wph4FwIERi1hjTjoNtpJvwUISzNfIs=
Content-Disposition: inline
In-Reply-To: <20200211200945.46606-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--MXxcbiX/Q4+iy5U7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 01:09:38PM -0700, Simon Glass wrote:
> There does not seem to be a strong reason to inline this function. Also
> we are about to add some extra code to it which will increase its size.
>=20
> Move it into fdt.c and use a simple declaration in libfdt.h
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>=20
> Changes in v6: None
> Changes in v5: None
> Changes in v4:
> - Add fdt_header_size to version.lds
>=20
> Changes in v3:
> - Add a new patch to de-inline fdt_header_size()
>=20
> Changes in v2: None
>=20
>  libfdt/fdt.c       | 5 +++++
>  libfdt/libfdt.h    | 9 +++++----
>  libfdt/version.lds | 1 +
>  tests/testutils.c  | 1 -
>  4 files changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index d6ce7c0..3e37a4b 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -70,6 +70,11 @@ size_t fdt_header_size_(uint32_t version)
>  		return FDT_V17_SIZE;
>  }
> =20
> +size_t fdt_header_size(const void *fdt)
> +{
> +	return fdt_header_size_(fdt_version(fdt));
> +}
> +
>  int fdt_check_header(const void *fdt)
>  {
>  	size_t hdrsize;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index fc4c496..48f375c 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -266,11 +266,12 @@ fdt_set_hdr_(size_dt_struct);
>   * fdt_header_size - return the size of the tree's header
>   * @fdt: pointer to a flattened device tree
>   */
> +size_t fdt_header_size(const void *fdt);
> +
> +/**
> + * fdt_header_size_ - internal function which takes a version number
> + */
>  size_t fdt_header_size_(uint32_t version);
> -static inline size_t fdt_header_size(const void *fdt)
> -{
> -	return fdt_header_size_(fdt_version(fdt));
> -}
> =20
>  /**
>   * fdt_check_header - sanity check a device tree header
> diff --git a/libfdt/version.lds b/libfdt/version.lds
> index ae32924..7ab85f1 100644
> --- a/libfdt/version.lds
> +++ b/libfdt/version.lds
> @@ -20,6 +20,7 @@ LIBFDT_1.2 {
>  		fdt_get_alias_namelen;
>  		fdt_get_alias;
>  		fdt_get_path;
> +                fdt_header_size;
>  		fdt_supernode_atdepth_offset;
>  		fdt_node_depth;
>  		fdt_parent_offset;
> diff --git a/tests/testutils.c b/tests/testutils.c
> index 5e494c5..53cb35f 100644
> --- a/tests/testutils.c
> +++ b/tests/testutils.c
> @@ -261,7 +261,6 @@ void vg_prepare_blob(void *fdt, size_t bufsize)
> =20
>  	VALGRIND_MAKE_MEM_UNDEFINED(blob, bufsize);
>  	VALGRIND_MAKE_MEM_DEFINED(blob, FDT_V1_SIZE);
> -	VALGRIND_MAKE_MEM_DEFINED(blob, fdt_header_size(fdt));

Uh.. this doesn't look right..

> =20
>  	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
>  		off_strings =3D fdt_off_dt_strings(fdt);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MXxcbiX/Q4+iy5U7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5De8sACgkQbDjKyiDZ
s5Krdg//and0YnWgZXP9k4c1SF+qnNPT4+BmYJbe1SAfAwuhcbi7nfdzSpgHVoO/
7T26gjzipZ5Ez3sKQhN3/o35/X7PVhq4kWRf69OLrrBBlLZtkRg6YKod5PWhIMcY
IQ4kCLmTE5fllOUYkZVqOZixpOZJgEtcyqASLmSpLtMEhvOdqEuV2UOn9LWGbfKS
ZzeVGG8lyEpWIEOVhXkd+rJv3FtG+gL+oh4TG8YRSOORCX/armgxW0wBM1fxcCIs
z7CBgHXO8Ie0ez2/TP/7RSM1iLMR7WpCBnq9DspAbQYcMZOcBOyQZOaUg6U09t4Z
H3EjjOXOAXvIffsS+0Iwe67gKZSJVpzZ+qBmsMoCTqm9lXRBTGNCK+AH6MULxsDh
djK4eZhjbxszpdc2t/z9VTfihb1t4ZLbDbkVbiuSPiPXudwS4/2EU7XhjLNcETfC
s/hLQ8beneXlFaljC8GjdIK7OcedR4rVgL8djiu4aljnWAeRelnFQ7zUp44+PYvI
P+xG2unuqzpqmUk/nUx+97v5gM6+8DJqiWxvZdSGkmQxqf/+LRbvWKoqS1AwUUj+
wjLPJxxjtSduY2UmhTEC4c9ZOEOvaFWZEYZXBz7qQLo0tDmpJVgNbvUT0fRFvQs1
QqSEOnsa0ycV4YuWhPjGHEgIwFQ5P/yw3fT7JDFmR1C32UxmcK4=
=1//F
-----END PGP SIGNATURE-----

--MXxcbiX/Q4+iy5U7--
