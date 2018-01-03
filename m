From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] tests: Improve compatibility with other platforms
Date: Wed, 3 Jan 2018 14:14:48 +1100
Message-ID: <20180103031448.GM24581@umbus.fritz.box>
References: <20180103025532.43393-1-kevans@FreeBSD.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hdhkc9EpVJoq6PQ6"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1514949975;
        bh=xMfG51/AkqKfgfOs9iGUsQtCmTF1hIH77Bc7hkRrc/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aFXhYAKO8TtzFl66eXUZi6Ox8QM+AEyqbA/+jAup22dCBaauGsz1FYaadt9mbUzSq
         5TQKfd6KZGD3qDR8CSRTcMmP8AzhnHkzsjl3vKTknm961TpAIgXYUxh1LR9nWGia/3
         kpBhNbwoIMUI2ijSdoiqIdlx2dXGrr/5rbFlx7/M=
Content-Disposition: inline
In-Reply-To: <20180103025532.43393-1-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--hdhkc9EpVJoq6PQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2018 at 08:55:32PM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> stat -c %s's equivalent on FreeBSD is stat -f %Uz; these differ enough, a=
llow
> STATSZ in the environment to specify local replacement for a stat that ou=
tputs
> size in bytes of an argument.
>=20
> Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>

Applied, thanks.

I'd also be happy with a follow up change to automatically set STATSZ
to the right thing on BSD.

> ---
>  tests/run_tests.sh | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index d36dffb..13c9f1c 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -6,6 +6,11 @@ if [ -z "$CC" ]; then
>      CC=3Dgcc
>  fi
> =20
> +# stat differs between platforms
> +if [ -z "$STATSZ" ]; then
> +	STATSZ=3D"stat -c %s"
> +fi
> +
>  export QUIET_TEST=3D1
>  STOP_ON_FAIL=3D0
> =20
> @@ -114,7 +119,7 @@ run_wrap_error_test () {
>  # $2: align base
>  check_align () {
>      shorten_echo "check_align $@:	"
> -    local size=3D$(stat -c %s "$1")
> +    local size=3D$($STATSZ "$1")
>      local align=3D"$2"
>      (
>  	if [ $(($size % $align)) -eq 0 ] ;then
> @@ -714,7 +719,7 @@ fdtput_tests () {
>      text=3Dlorem.txt
> =20
>      # Allow just enough space for $text
> -    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> +    run_dtc_test -O dtb -p $($STATSZ $text) -o $dtb $dts
> =20
>      # run_fdtput_test <expected-result> <file> <node> <property> <flags>=
 <value>
>      run_fdtput_test "a_model" $dtb / model -ts "a_model"
> @@ -733,7 +738,7 @@ fdtput_tests () {
>      run_fdtput_test "$(cat $text $text)" $dtb /randomnode blob -ts "$(ca=
t $text $text)"
> =20
>      # Start again with a fresh dtb
> -    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> +    run_dtc_test -O dtb -p $($STATSZ $text) -o $dtb $dts
> =20
>      # Node creation
>      run_wrap_error_test $DTPUT $dtb -c /baldrick sod
> @@ -761,7 +766,7 @@ fdtput_tests () {
>      run_wrap_test $DTPUT $dtb -cp /chosen/son
> =20
>      # Start again with a fresh dtb
> -    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> +    run_dtc_test -O dtb -p $($STATSZ $text) -o $dtb $dts
> =20
>      # Node delete
>      run_wrap_test $DTPUT $dtb -c /chosen/node1 /chosen/node2 /chosen/nod=
e3

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hdhkc9EpVJoq6PQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpMSqYACgkQbDjKyiDZ
s5JPqw//WtPx0p6/crnRIsWLrQ74uWsnfKbUQgsQqLfnMXTJWNwp5JZSpcIceY2K
Yt5Z4NsEQc+KlecNfuLPwRS/7R0bSbqYhxfQsLnry+6B++mkEQEqGnWYjewOOjJO
XrprXGXk58WgLTYhoEa/k+DTX8N2aKIyDRRlpeKRfHUKZ9MgPmVZFLrIAh74z8+c
XGVmOrXs7ClAdJDqyo94amXR+zxkBkdK1kjkLI5O20SGcAUkAl+nhClJ8MBTozHQ
cg6dJiQyxKn7evfXy6Ti53Hpi0gDMu2Gz5qbj8ySz5uTzsP7TtVtL/ut5Fe9+K+y
FMU8Ha7ZhoZWVWidl5EUEYJhFAdQO1tw5Nw6j2HpKk4CuZ+jhN5jBS+wwAhUe+Pq
RpOFj9KHAQLiBVILueUvZTU7qwB5THcI7AQgXzxC6/ULMnIo+mCVIX8yMOCU03rq
us7+JwInPb73cxQabF+phQwOO43DOlPcAtfK36EdnyEoxCs0QVoMIqNXo8OTTl4W
k9P6583d9MkQhIaUx16riiRsQeivUaN9/bpsFSRgpzkRTdPaCf+qi1ZZSkRJYBE5
2jMNVZyJf5y2nNHpC4B22F6R/2tTS2p/M2uoYPnHKutuqPjd3LOSuoe55MJIVMRA
kgHT3rsAGyqjptjMfG/MhT7WBLKXcEREeot8fD0PxZxZIezjp2U=
=Zlxu
-----END PGP SIGNATURE-----

--hdhkc9EpVJoq6PQ6--
