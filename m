From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] tests: add -a option cases
Date: Thu, 14 Jul 2016 19:27:21 +1000
Message-ID: <20160714092721.GP14615@voom.fritz.box>
References: <1468409701-3310-1-git-send-email-timwang@asrmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3WNCzIuUImKerqE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1468488864;
	bh=M3qxNzR6aop+MaiVmauBphXeQa5VWvjXpffy4kfjowQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKIXyZpMQIFZ+Fi+d5TDwnaalNDCFJV5TEAwWiPeMxGcbbLplGjXCUMgwvW4EU0+/
	 CsIwNFAsUhTWlUNV9k/4AleWwygKTD4SIOCFhnQHTdREjj8uxRKp+bkrLtm9EsYM5t
	 xgffTEqSlwms/j3mzHN/Z7uo5XsS4TSFYl3yb5QY=
Content-Disposition: inline
In-Reply-To: <1468409701-3310-1-git-send-email-timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wtt_usst-9Onoh4P/yGk@public.gmane.org


--O3WNCzIuUImKerqE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 07:35:01PM +0800, Tim Wang wrote:
> Signed-off-by: Tim Wang <timwang-XOWFcpiLszpWk0Htik3J/w@public.gmane.org>

This is a good start.  However it needs some more.

First, you should have some tests which actually check that the
generated blobs have the correct alignment.

Second, you should check more than just one alignment.

> ---
>  tests/run_tests.sh | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 7eb9b3d..6aed6d6 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -579,9 +579,10 @@ fdtput_tests () {
>      dts=3Dlabel01.dts
>      dtb=3D$dts.fdtput.test.dtb
>      text=3Dlorem.txt
> +    align=3D64
> =20
>      # Allow just enough space for $text
> -    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> +    run_dtc_test -O dtb -p $(stat -c %s $text) -a $align -o $dtb $dts
> =20
>      # run_fdtput_test <expected-result> <file> <node> <property> <flags>=
 <value>
>      run_fdtput_test "a_model" $dtb / model -ts "a_model"
> @@ -600,7 +601,7 @@ fdtput_tests () {
>      run_fdtput_test "$(cat $text $text)" $dtb /randomnode blob -ts "$(ca=
t $text $text)"
> =20
>      # Start again with a fresh dtb
> -    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> +    run_dtc_test -O dtb -p $(stat -c %s $text) -a $align -o $dtb $dts
> =20
>      # Node creation
>      run_wrap_error_test $DTPUT $dtb -c /baldrick sod
> @@ -628,7 +629,7 @@ fdtput_tests () {
>      run_wrap_test $DTPUT $dtb -cp /chosen/son
> =20
>      # Start again with a fresh dtb
> -    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
> +    run_dtc_test -O dtb -p $(stat -c %s $text) -a $align -o $dtb $dts
> =20
>      # Node delete
>      run_wrap_test $DTPUT $dtb -c /chosen/node1 /chosen/node2 /chosen/nod=
e3

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O3WNCzIuUImKerqE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXh1r5AAoJEGw4ysog2bOS4roQANerJbqwpssOsjw8LvlcqKtr
QRd+PSjWS/8M/hHlL5nRkBWkNR6InUpH78D2yReYMC9Kn5nF0DPRpkbeD5RDt1kM
E8LqRneKXPGvUmtF0B5im3x5jL/JfglfxjQ6xtKDo5VAP4/XRMpNgFn6zphNajYy
n2WhiXa0njPV+Ez6HdnwBaFfI7ufH88yKWo9lah5NTyuqETlUfvXGitdU0+gFa6Q
ilnKGb7t/++QdPVjSmjBZ0fz2jwnfFr4WtbAYTIlQNQGGcROVF9na7shtAsH77X8
fBhvrTKT6gdRqjGH5eBo0fNJcDzoLg7kXflNnqKVYvaz2HtMAhyTRU8lcq1uFY3d
QBBxsf21ubOWI0bWTEZbmSWm8oQSiQCVJjZBnLk3PGXqFaGEFvpIOFhW3WsN2uyV
YUCt+QE6HTjYrBgWzEpp+IBZiLvpGkVxlzMFw5QWxTeqjEU82NzkKNS0gOudoKMZ
mepb+y2oB9gtuvyLurQyNh/4s9hlT9H3Nzy3MboN5rV4/kxXdoXMsd2HHZMDNknX
bqiSrxNtHZylgFf8rQnIb380XGERwS2xOQ0UkqbmKPLt/IPq/x+LjsXaLcTzSUzo
Pjo0rXrjOUDIHwTzD4DH4wbN5y1MROrSS+MDjOgUSWmNIqCgT+UOiP8RjiWg0ElA
5BSi2ArWfe7Wg8M5AdCT
=3+BB
-----END PGP SIGNATURE-----

--O3WNCzIuUImKerqE--
