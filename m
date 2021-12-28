From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/4] README: Explain how to add a new API function
Date: Tue, 28 Dec 2021 20:14:49 +1100
Message-ID: <YcrVic6pC4wM6oom@yekko>
References: <20211107224346.3181320-1-sjg@chromium.org>
 <20211107224346.3181320-2-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/G/yzD4SAT0/kDlk"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1640683871;
        bh=9ve+Lr3rzDa0DzdYS4FWEhmrIfJhMWBRar7qMTE7aEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nHZ2TUFx+S7QK88I9SNl/01nDEbhjmJPUAs4tmqhFg3cYaILi4F0nk6vwFiKCCtAj
         dbKZrYHEaM1lLWNgaOrCOa74jtp+gAxUnglV5MzXLtd9OfjfBf6xJixomtBvZAqj5n
         BcHDZdqJeB0q6sPdhnbp+7ift6Myz5L6/fFhj5VI=
Content-Disposition: inline
In-Reply-To: <20211107224346.3181320-2-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--/G/yzD4SAT0/kDlk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 07, 2021 at 03:43:43PM -0700, Simon Glass wrote:
> This is not obvious so add a little note about it.
>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This is a good change, regardless of anything else; merged.

> ---
>=20
> (no changes since v1)
>=20
>  README | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/README b/README
> index d9bf850..bac1714 100644
> --- a/README
> +++ b/README
> @@ -71,6 +71,15 @@ More work remains to support all of libfdt, including =
access to numeric
>  values.
> =20
> =20
> +Adding a new function to libfdt.h
> +---------------------------------
> +
> +The shared library uses libfdt/version.lds to list the exported function=
s, so
> +add your new function there. Check that your function works with pylibfd=
t. If
> +it cannot be supported, put the declaration in libfdt.h behind #ifndef S=
WIG so
> +that swig ignores it.
> +
> +
>  Tests
>  -----
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/G/yzD4SAT0/kDlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHK1YMACgkQbDjKyiDZ
s5LkIA/6AxuZ/UGy1bjhahIkCfTDsRdssPAQy/RyvqK4JZF20944XkP74SZtNgjK
VmDt8H2YmNa/FSl4NYr4cXncDhrLPEToF2fDZwLiWmUpmrnmLvtYiv59USMZGoqh
9M8HXopc/xSdf+WwJzSsnSSuOF9Qtpjm1OVMr2H80G33t6sF8qlecvBEEg7xe9cN
l9FunRzk6Y9+dRh8Br9oCr4PqXua3PYXmyfd72dyK40ei9wliMmH6cuHxDVHoy5v
JM7/zrmyL5Hd4K1fGNW/opehqe5diPYjzYPaDrs99t1ETe7AUWQkhJdi08UyEr5h
lgtQMaY23ez0Sa/toZMP+TCK2u2YqJIkfvIVc8Bv/0NupPU29sS68EpI4af9ZAb4
jZx8vIExbG0ICYs29NCi6q0JGuv8/xf4CR3Np/BDI70RfA1C+J/u/aKrbCnIoEEQ
PxFgsXtYNfZbOCpgP6slHbRgyD/tM5fz/+K+37UPTjedPOC7iFXWtR8IIHq+TzcT
Svy8JE32z5iavgHk7lCAH/oGv2HtNxwNuiFs01xjkPP4Im8sGLZ0tLlJRxECgR3E
49NCR9BKRiCDhDQTnxQGROZmdm/LDzhZ3N8IcOQsvs6HiFpPLZdEUQLPjilLSgts
wLF5GhpfQOLb9WKJEJ018poG5k0xRpybbD2L0FmjyznykXpbdhg=
=Bjab
-----END PGP SIGNATURE-----

--/G/yzD4SAT0/kDlk--
