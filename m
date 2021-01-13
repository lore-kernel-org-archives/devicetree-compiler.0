From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] srcpos: increase MAX_SRCFILE_DEPTH
Date: Wed, 13 Jan 2021 12:06:13 +1100
Message-ID: <20210113010613.GE435587@yekko.fritz.box>
References: <CAJq_QG0BHBQYT4RnVi0QSxM_vFK2K-5k1eTpJnwZQtWbKnCBJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1610500268;
        bh=qGWXnQvWxxoPJk7I6ywmuBJeVPUVjD878oCsyMvsx14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QAJt9VfTnnA6nwgyn1gxsY+sEHjYXzskzvLVCAXg+nhl+4ZItXjNLwos5/Obrp7JW
         mBcRn0DP6Al50/S5QccFMh/wey1dTCKaHmWF6RNYG1T8I/WF62RqRMmNKsKlTQ1h+h
         RtQ8Ep6IFJd0mM4d3iacyTWkslY5q6Ct959Z9QJg=
Content-Disposition: inline
In-Reply-To: <CAJq_QG0BHBQYT4RnVi0QSxM_vFK2K-5k1eTpJnwZQtWbKnCBJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ignacy =?utf-8?Q?Kuchci=C5=84ski?= <ignacykuchcinski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 12:13:23AM +0100, Ignacy Kuchci=C5=84ski wrote:
> Some kernels require the MAX_SRCFILE_DEPTH to be bigger than 100,

Wow...

> and
> since it's just a sanity check to detect infinite recursion it shouldn't
> hurt increasing it to 200.

Fair enough, applied.

>=20
> Signed-off-by: Ignacy Kuchci=C5=84ski <ignacykuchcinski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  srcpos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/srcpos.c b/srcpos.c
> index f5205fb..4fdb22a 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -20,7 +20,7 @@ struct search_path {
>  static struct search_path *search_path_head, **search_path_tail;
>=20
>  /* Detect infinite include recursion. */
> -#define MAX_SRCFILE_DEPTH     (100)
> +#define MAX_SRCFILE_DEPTH     (200)
>  static int srcfile_depth; /* =3D 0 */
>=20
>  static char *get_dirname(const char *path)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/+R4UACgkQbDjKyiDZ
s5Jskg//dmjbOkfQdYWGJWoyZs9Jaau3+r6uV3DG2stPmhwl1+6HJVuWMROyVp9g
hVjy0TXb5gKtGfLqDBsHgMkIfQFKRX4orHEg9l2PHX/n7f3M3GL7a3GYWeTku5Dk
ZSIVwAH03TKDcw3heD7pFl37+DYDGDImNOzokhq5kcpT1GBYufnTVryyzvxuGhrN
BfGzemOtPAmy4g07uvKoFPuQD6msJUIAWIdixGTDk6iUUbVBW4dgY4cIfCjcpvTM
DxqC56qFHk85BYyyrCqK9+H2z3Ekr0sV+Ev9sqm1FBgB9RbugpVXfH+cIMxzqq4e
ZLCAchT/bpv3AM1tlMyiNCSiRyqdFmRZGZL+sjhodtjwmqxUDEKyia02EZRx1yk0
8TjUISssZTE6qDCnkQbxGm8RjKCWauPTuIbY8SSivv61Sf7DpiOZFeY2AWhzHutN
dxul1Upe27UHcTUaZlXDWgQJ4DpJZYDFu9IVhWfTTPN/uDLevNCuS+zMs7kiIjmX
6aor0l2QqNCsHpLSVcgqgaP3kyKndF0xOST/NIQQlL+XCfB0IiEY+TQEIInke+tW
JQq7WZsFnDQaDqF9uXYK9EvJN4D85saiStl5dARdXkJM6u0lQigHQNZds/O50Z0I
qgoVi1LB6mDC6UVbjBc8mL3XeobVyZ6ISVCfx285NzHuTRzjvg8=
=0Iz4
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
