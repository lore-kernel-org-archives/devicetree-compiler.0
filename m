From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Improve compatibility with other platforms
Date: Wed, 3 Jan 2018 11:13:00 +1100
Message-ID: <20180103001300.GF24581@umbus.fritz.box>
References: <20180101041518.23806-1-kevans@FreeBSD.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Pgaa2uWPnPrfixyx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1514939749;
        bh=x9QmLDw1ItufQULfo/IeBmhblJVknv9UvSgDWPhphHc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QZiwZtexhj4RkBGjgVEC58WEx3p/Z91UfjUMZFNA9U5iVkofTfybxw9mr0uyih/Xz
         Ej6mNJ2I0MbkHSSXW0uCk/+HkpIT6MM9x2UXXquH2rj6bGOMlyVH2OOzU10DObyXew
         8G7Q6fDBLes7iyLJl1mPgnQAWvGBiTxGQlXbkm1c=
Content-Disposition: inline
In-Reply-To: <20180101041518.23806-1-kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2017 at 10:15:18PM -0600, kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org wrote:
> This doesn't make things work out of the box necessarily, but it gets us =
a step
> closer.
>=20
>  - alloca(3) on FreeBSD and OpenBSD, at least, is provided as part of
> <stdlib.h>. I make the change here for FreeBSD only, though, as I cannot =
test it
> on OpenBSD.

TBH, rather than dicking around with #ifdefs and headers, I'd rather
use use malloc() instead of alloca().

>  - stat -c %s's equivalent on FreeBSD is stat -f %Uz; these differ enough=
, allow
> STATSZ in the environment to specify local replacement for a stat that ou=
tputs
> size in bytes of an argument.

Can you split this change out into a separate patch, please.

>=20
> This greatly reduces, but not eliminates, the magnitude of patch needed t=
o run
> the test suite successfully on other platforms. It also helps denote where
> changes may be required.
>=20
> Signed-off-by: Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>


> ---
>  fdtoverlay.c       |  3 +++
>  tests/run_tests.sh | 13 +++++++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/fdtoverlay.c b/fdtoverlay.c
> index 7f124fc..7d60021 100644
> --- a/fdtoverlay.c
> +++ b/fdtoverlay.c
> @@ -26,7 +26,10 @@
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> +/* alloc(3) is provided by stdlib.h on some platforms */
> +#ifndef __FreeBSD__
>  #include <alloca.h>
> +#endif
>  #include <inttypes.h>
> =20
>  #include <libfdt.h>
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

--Pgaa2uWPnPrfixyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpMIAwACgkQbDjKyiDZ
s5JoXhAAvTO/lceqniDoL7MjOwlyYuaf4xhDDNXTeBwUwz3NGfb4vBpDO5nU1TUS
9Q3ek3E8vbEELtlNcdp3bWj8ewH9yIMV5aQehmTbyYSMAYyXugGfT8XJJa9CijUx
H8+ZfmjspdVoPRqDM72hlx7+qrUjzswTxHHSZCOyoehsBxeQxGZ5UkLw4gvlGayM
pw60jg3cw9KGiOef4ORJ6XZ7C17VFgfV3AIc6kV+35xYencCuS689dZjwACqWHIh
3PViphXiVD3/QLa8e6u+iclHEcylid++utfDZGDsdnUhaKlwC0mNcADzzMDbjKP8
4/rr1iYx7J45nIgBrgGT4u9+r70ktAirvTzVot0YYVtYuJX7emysRInM2TDyFooC
83yrlVKKEyIOPj1Ph1cdlvRphZdjPW0VvpWcnbbVGA+oBpw46J4G3T74vOsdXvFB
cSilbDzyolkV1VhpEqMjoHJfpMmaMKvsC1f4beUbgLjqt/xvajlUakYQ4ikBTqv5
D/RN5F1z4it3aCrw/sobllAOzeS/JiOyulYI4ft3daFdVU6VmA4UEYrgebzMD0G7
mzGce2nCj/DWrMQx+RiXGIQL1e1EoLQqdTo6v7eKsTLeBFC6gcyDJkv9r1aOHkli
NZGfLHDPUqfFBoLNSE9FSfI3+jOg+EQgi7Bxt3SqOXFCbj7IuOk=
=0yUt
-----END PGP SIGNATURE-----

--Pgaa2uWPnPrfixyx--
