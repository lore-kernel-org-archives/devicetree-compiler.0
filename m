From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: Add stdint include to fix uint32_t
Date: Tue, 15 Aug 2017 13:47:54 +1000
Message-ID: <20170815034754.GM3452@umbus.fritz.box>
References: <20170814190728.151775-1-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8c07nsHwQobhlezh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1502773025;
        bh=1d+RRX178hW60qS3+GgihZ2/bzrZ2nFug7Nh/iLwu2U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GGJacgKv+A5YsEdUyGYCBNZZ8FbWrUXzDvAKszhasEgLSmUv1ZrKBSd0y1nt0yw5v
         2e5FDdIFBDOtqD7x+HT0deeDBROBtehz73QiFMsR+emLUlR9I4f6IGa4g4txFsPsPu
         W67Vm7x8aXEHdb+mBE6RTcPTzSwwpbbBJk0NfFQE=
Content-Disposition: inline
In-Reply-To: <20170814190728.151775-1-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--8c07nsHwQobhlezh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2017 at 01:07:28PM -0600, Simon Glass wrote:
> Some types used by libfdt.h are not understood the Python module since
> they are defined outside it. An example is an attempt to do this:
>=20
>    import libfdt
>    result =3D libfdt.fdt_node_offset_by_phandle(fdt, phandle)
>=20
> This results in:
>=20
> TypeError: in method 'fdt_node_offset_by_phandle', argument 2 of
> 	type 'uint32_t'
>=20
> Include the standard integer header file to fix this.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Applied, but it would be nice to add a testcase for this.

> ---
>=20
>  pylibfdt/libfdt.i | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index cd1c6a9..c7b79ec 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -52,6 +52,8 @@
> =20
>  %module libfdt
> =20
> +%include <stdint.i>
> +
>  %{
>  #define SWIG_FILE_WITH_INIT
>  #include "libfdt.h"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8c07nsHwQobhlezh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmSbugACgkQbDjKyiDZ
s5J/wA/+Ix7HqM45Ekw7nZlmbTl5XLlw9GYu7L1MItvq8GJAkbqiR64Buu8MXSRp
3u4omzv6751ZBshDcz7TWrNUpH/SC7SPi2JedjDICqAhK9H2XfE/2FiPocQhnjW0
XohsZ104HL5NSZ/EQeJnpc2chlzCcaJ2eor/DsTFQOUh5EazNIGHmoxb7SbMIeaD
AXM1p8o9/4NJYhTaRII5MsQ0GdhAPo4AI57m2Xtr6xnsIXUOSMNljPXe0plwLAR8
Ko5ngdcKgj2V+kMLNs5015upvryvCz+7dmn7HJc/1Q85Ov/4yVqn99MHlCaHFq8S
mhAWA7olokvbZ+H3o6uqsRhrv0hf0x+9s7Y9bmmv9C6O7+UL0OqbgbImVWSJt26a
0HNFoRXtWZlcdxU7uLcklSBTZaXmPuppghPYZ4jAjzaNhQFAqX+KaVLun4guHM+9
o2P/Uh0h8bGlfTE9TOHVlVwaJ8T2D8Pu/xaQlkoovWrMpFr91sOjcy0O7AaHPUal
7plfFqL3/vWnEFGldBjanL4wyNfAoucHr8WW+0I6b8JKkobCVg/VSYVh799HjNMZ
nMwYA7MBX7bmTDSUsGKSIM9lrxuQqM+CSp+3EZLAzdJzqJVR3gQb3ZOdtxgSrQ53
q8wqPVVXBRjJ/3+cl5vrr3S/jGoL2yXmf1TLCyP9aW8PlgTHRuc=
=YkAK
-----END PGP SIGNATURE-----

--8c07nsHwQobhlezh--
