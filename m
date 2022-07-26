From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] Fix test script to run also on dash shell
Date: Tue, 26 Jul 2022 21:40:54 +1000
Message-ID: <Yt/SxshGCTRLIiTS@yekko>
References: <20220704073722.1075849-1-tero.tervala@unikie.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xlHCSHtPeipQ0B4H"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1658898900;
        bh=5P4k92hfSauFBhyWreP3aJJujQXX7zXRrJEOo7h+TCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kUFDrxEh2ZD/EBGm9Z6agyjJF/AW4RikDcBLtRIY0Nixx9iTpCOWinrS/2xwIFWzp
         tYp4kRCZGruzAyDnQVvnARgpDNlhFURGlp9Wadk9lVNwGlzrTY2thZmvnJUpFc1HMh
         lYwXQTlZBmkzeBeTxzHBHS9SbACF6l0ViO62bhZc=
Content-Disposition: inline
In-Reply-To: <20220704073722.1075849-1-tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--xlHCSHtPeipQ0B4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 04, 2022 at 10:37:22AM +0300, Tero Tervala wrote:
> /bin/sh points to dash instead of bash in some linux distros.
> One test would fail if dash was used, this fix will allow all tests
> to run properly on dash too.
>=20
> dash built-in printf does not support "\xNN" -hex escape format.
> "\NNN" -octal escape format is supported by both bash and dash printf.
>=20
> Replaced "$(echo "$expect")" because this actually runs /bin/echo
> instead of shell internal echo and in some cases causes "\NNN" escapes
> to be printed as the actual characters they represent instead of the
> escape sequence itself.
>=20
> Cosmetic quotes added to make printout a bit clearer.
>=20
> Signed-off-by: Tero Tervala <tero.tervala-ddXEi6N5mqbQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Sorry it took so long.

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
> =20
>      # Here the property size is not a multiple of 4 bytes, so it should =
fail
>      run_wrap_error_test $DTGET -tlx $dtb /randomnode mixed

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xlHCSHtPeipQ0B4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLf0rsACgkQgypY4gEw
YSKo3g/+Md3y0sLbYhAo8MZIuk2lbN8RlSR4nuaJrujni+d36bY04EXEpKk9JK11
1k6Uqxj2sE+LbH7E/qGEYm9h+ELs94J32mB3nJtQdLrpgZKz9IDhZCV/fEuM4SdO
5RJ7DZOQvCoeCAHgCxyTDujYH1f3sr/1XM6+v8mTqRUlDWyftyKmAwwmHtnSlJhZ
UcwIFzdleO0v93f9qhCadqdMt4piX7Z10jgrsR7mC/gtAbotmhifHkjuqqN1VR/V
oi0pU+nt7qUyn4Qevh3ISPz8VvcuoHIe3kBgBc2iMKhWnQWp2qiCYTwZtuzVAip7
yi/4o/1N8p55VK+yQNZaP8r2ZQVPLS+67Zq9NG1ezHeV0SH3oMpS3eNtfGHjS1kb
mwNJQ6bI8qwFAgI4/HP+AYZ2ywX0HyfbPyYGJP/R8c7eFKz2eyQG+qhJxYU/74F5
RVHuTE3lZfTLFUYxBfNQUNoYbNK59onAYfIxlG3ruF8QbHWv80H5npdypBwDLXtB
9UvnvVbCYDfcnK1ABVdi8IM2RPTiNmz/eI6PUfeqFjV1EPCs/wlYuabQVGXnKJ75
2Yu+LuePR19InQdooODIAGuZZByKiKVNatAOqssP3cJk82opDDXAy7+vJFiDZ6vN
0aM4MRFDMP81gHmiaK4SNjdazMEdJQhxzYDbESrIazDKZjFGg7k=
=OvtM
-----END PGP SIGNATURE-----

--xlHCSHtPeipQ0B4H--
