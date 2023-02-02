From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] pylibfdt: Work-around SWIG limitations with flexible
 arrays
Date: Thu, 2 Feb 2023 16:35:06 +1100
Message-ID: <Y9tLiu/ozf+t+eVh@yekko>
References: <20230201224441.305757-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cHjCMMcKy20MOXgz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1675316114;
        bh=0pXDe4qQ+7TpNOG2C7NuMsB4iicxN6Qx4rglnRoMuEo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RUvqz89DEvk4amj/Bp5//dfVcatgWfzGVmN1eX+j4eVSF6Ts8t8i5uam0oEKNgyVn
         y/cvIuZvg8dtl+/DCDv9ExK5DuLE4LSydIW7vkeRWd0kDOfKrzQHJ4+Hr1z5NsoSf0
         4uxFHiKZNWGB3XwIV4HiLx4QxBj++6tEGney0XDc=
Content-Disposition: inline
In-Reply-To: <20230201224441.305757-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--cHjCMMcKy20MOXgz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2023 at 04:44:41PM -0600, Rob Herring wrote:
> Commit a41509bea3e7 ("libfdt: Replace deprecated 0-length arrays with
> proper flexible arrays") fails to build pylibfdt:
>=20
> ./pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_node_header_name=
_set=E2=80=99:
> ./pylibfdt/libfdt_wrap.c:4350:18: error: cast specifies array type
>  4350 |     arg1->name =3D (char [])(char *)memcpy(malloc((size)*sizeof(c=
har)), (const char *)(arg2), sizeof(char)*(size));
>       |                  ^
> ./pylibfdt/libfdt_wrap.c:4350:16: error: invalid use of flexible array me=
mber
>  4350 |     arg1->name =3D (char [])(char *)memcpy(malloc((size)*sizeof(c=
har)), (const char *)(arg2), sizeof(char)*(size));
>       |                ^
> ./pylibfdt/libfdt_wrap.c:4352:16: error: invalid use of flexible array me=
mber
>  4352 |     arg1->name =3D 0;
>       |                ^
> ./pylibfdt/libfdt_wrap.c: In function =E2=80=98_wrap_fdt_property_data_se=
t=E2=80=99:
> ./pylibfdt/libfdt_wrap.c:4613:18: error: cast specifies array type
>  4613 |     arg1->data =3D (char [])(char *)memcpy(malloc((size)*sizeof(c=
har)), (const char *)(arg2), sizeof(char)*(size));
>       |                  ^
> ./pylibfdt/libfdt_wrap.c:4613:16: error: invalid use of flexible array me=
mber
>  4613 |     arg1->data =3D (char [])(char *)memcpy(malloc((size)*sizeof(c=
har)), (const char *)(arg2), sizeof(char)*(size));
>       |                ^
> ./pylibfdt/libfdt_wrap.c:4615:16: error: invalid use of flexible array me=
mber
>  4615 |     arg1->data =3D 0;
>       |                ^
>=20
> Turns out this is known issue with SWIG: https://github.com/swig/swig/iss=
ues/1699
>=20
> Implement the work-around to ignore the flexible array member.
>=20
> Fixes: a41509bea3e7 ("libfdt: Replace deprecated 0-length arrays with pro=
per flexible arrays")
> Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.  I can't test what effect this has on the pylibfdt
stuff itself, because that has been broken for months for me.

> ---
>  pylibfdt/libfdt.i | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index f9f7e7e66d13..987f7b9c3339 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -1036,6 +1036,9 @@ class NodeAdder():
> =20
>  %rename(fdt_property) fdt_property_func;
> =20
> +%immutable fdt_property::data;
> +%immutable fdt_node_header::name;
> +
>  /*
>   * fdt32_t is a big-endian 32-bit value defined to uint32_t in libfdt_en=
v.h
>   * so use the same type here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cHjCMMcKy20MOXgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmPbS3MACgkQgypY4gEw
YSIPOQ//Zj9pnd3sezUPxaYHVKLdf+aPaJenEuLkBbWqTaTFaE22htBdpeJq47pR
qklc71JcFwBipNop9loyCJSHdMKRC+wmuRflHrNuDs/t3Tq6X3E5vGJXiOS3efop
jxeUkDJwDVUACr0lXRslqc1XvrkZyFtvNkeIVMxyoWM+z9cyAKzIO8PrIoJWyn9y
/jUW7vWDoq09D4+om4IN0beVI0icWQICdL8beuoKZd+ygpJDvfHDqyxwVochZEzN
NHOmhMzsCmMg5N0Wtv1J/v8xbfP1LtClUe8d+rRqWtXhEi5/up500YHmqF0iKuNt
PuRf59H6L7GTDAdTBoQZ6SYJMQ+Kmryek2tN9Wfiu4t6QVNtJDAmRtxRAr1ok2XI
Ni8JFl967rlAckIBn0wPKOegd7Nr5iR+6nagWRc7qRrHJF5nIsw1vAXq+cv8DuZ7
Mo8PbVKtU8lnTpjEi4m0UFfanGpctnX5A/h2DBvodU7rKaRdVKGDgi6SEWemswE2
UPWnUOD4VYu6r+mIZMi8mTW5Q9XmqbPNmUa6/VFw5ZUQ0SCkzkdKyGgU7fM+ExHu
hThh0s1+kW0Ho23EhtWhQKELQswEWXVmnVu9GheNe5OIn2lRDJBQBCkZivyglhnF
OKqZ4spePwfAse5GWvQOW77y2a44dO7sI5vPNsz5Oa4hafGLtUY=
=2Dn5
-----END PGP SIGNATURE-----

--cHjCMMcKy20MOXgz--
