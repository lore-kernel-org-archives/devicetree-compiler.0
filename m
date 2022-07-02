From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix test script to run also on dash shell
Date: Sat, 2 Jul 2022 17:49:36 +1000
Message-ID: <Yr/4kDD/X2N+AzAX@yekko>
References: <20220629163210.932198-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uig+N6TmC+IyI+FR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1656753416;
        bh=XtSJvwOAykfJLginNoin0dDNK4x52bGJHYMf8KiXCc8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T4PJBoG4Tk1/LGV0xQTzzENWuH1fpjvSVkXdjaQPL8rUmNmH2NXF0WGYvPJ7ZJ55x
         /HlImezVo5HICnuqx+P3t5x/8/tyhB7JhThUV/VJ6nRNcblGTadCHjhZH04t25mPgF
         hoWmipj3A4slzQOchP94NZOVyy0W6hFj7qFA0Io4=
Content-Disposition: inline
In-Reply-To: <20220629163210.932198-1-tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--uig+N6TmC+IyI+FR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 07:32:10PM +0300, Tero Tervala wrote:
> /bin/sh points to dash instead of bash in some linux distros.
> This fix allows test script to run on both.

It would be helpful to explain here exactly what the dash
incompatibility is.

>=20
> Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
> ---
>  tests/run_tests.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index c78351d..1b16eb8 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -195,7 +195,7 @@ asm_to_so_test () {
>  run_fdtget_test () {
>      expect=3D"$1"
>      shift
> -    printf "fdtget-runtest.sh %s $*:	" "$(echo $expect)"
> +    printf "fdtget-runtest.sh \"%s\" $*:	" "$expect"

Hrm, I'm not entirely sure what these changes are for.  I think
they're just about making the output clearer.  AFAICT adding the \" is
just cosmetic.  IIUC, removing the echo means we'll display the string
with the \ escapes, rather than the version interpreted by echo.
Those changes seem reasonable, but it should be mentioned in the
commit message.

>      base_run_test sh "$SRCDIR/fdtget-runtest.sh" "$expect" "$@"
>  }
> =20
> @@ -862,7 +862,7 @@ fdtget_tests () {
>      run_fdtget_test "61 62 63 0" -tbx $dtb /randomnode tricky1
>      run_fdtget_test "a b c d de ea ad be ef" -tbx $dtb /randomnode blob
>      run_fdtget_test "MyBoardName\0MyBoardFamilyName\0" -tr $dtb / compat=
ible
> -    run_fdtget_test "\x0a\x0b\x0c\x0d\xde\xea\xad\xbe\xef" -tr $dtb /ran=
domnode blob
> +    run_fdtget_test "\012\013\014\015\336\352\255\276\357" -tr $dtb /ran=
domnode blob

AFAICT the actual problem is that dash's version of printf doesn't
understand \x escapes.  I hadn't actually realized that printf was a
builtin, I'd assumed we were using /bin/printf, which does appear to
understand \x escapes.

This change itself looks fine.

> =20
>      # Here the property size is not a multiple of 4 bytes, so it should =
fail
>      run_wrap_error_test $DTGET -tlx $dtb /randomnode mixed

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uig+N6TmC+IyI+FR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmK/+IoACgkQgypY4gEw
YSJGOg//WKRLCN/rKjkLS8UaFIM/mnfvLfjYs9iUKdOkVdzRFQLXkrGCBNAPPhHp
LE+CwcmJcWUcBQB3s4Z5xoJ7PSGEuu7lmnAz1Tm54oVBRDsZ/ZFaJBncHlQStAVy
8+aRB8vNURe9ZTVP3ZXWcfioGkBdBbvj2MdRS5z/7+gO9T3PrYZ4kSG551C/0yjo
0uCkH0TOvziqlSYhjUQO8zqd3rlASFkG1mjklDYgTKj+Sizy1XU2NowG4KNomTtQ
ZLZGdhMZbz+gv26BWvLK3/rf80Iu2Z2za6ggxibudLqYES/80dh3jcKYIFkeCBHt
J08p0tXhMzpshmpxXCfx3Jnu3vmqD42x9fJz4+aDKKslX/vjVjSKe4fGNWd8WDco
LBRbZ2pNLJh7dsLDOsI74ZwMYm4CoYz/hiSOEErEwXLxIEheKgU/R0Z1InoD8fw8
CERFukJ+HpKYmU/wX5Z+Z0DgThXykDOsBL0+9R2gV99UxEFcZWHAF+3V4hsOpJlD
B5T7dYoZbTACvW0S/xLN6TKBcsk3QjKvxyDqexf/WDo8kMcpN18yfwKgYN7hBJep
lZRfH19YbvW+DEFqYSwPw4k3nOxf5VLb9RmbqHOzyq2Cu64objVvSbkTq1+rD2+Y
SzbQ7KDcgpl3sZ0sptX1XhyxhrXFOoIfq+VXZHeFad/GI6Imb68=
=R3pp
-----END PGP SIGNATURE-----

--uig+N6TmC+IyI+FR--
