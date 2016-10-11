From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] tests: overlay: Rename the device tree blobs to be more
 explicit
Date: Wed, 12 Oct 2016 10:08:29 +1100
Message-ID: <20161011230829.GA17844@umbus.fritz.box>
References: <20161011144407.32125-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1476228112;
        bh=vUm76lEKC6ggoyuUR7UOcPpYH3mU5PKjywxOcN4e5WM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZgFTlie+Sdkx8ZZkRu/nHuQHpCIliNt5sebNHlJ48tx+aFHymXNHYGiNZhZXLYjBW
         JbcQoCWgxW6y6SKa3tarYtZeXBO06GH/3f9F90n5FB77cg5YcDy1t6jGAVnYpEPUc5
         BTt7mO5xAEuZ2MsSK0SWOYMZHbdQXA8kg8XVymq8=
Content-Disposition: inline
In-Reply-To: <20161011144407.32125-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 04:44:07PM +0200, Maxime Ripard wrote:
> Rename the blobs to have a more explicit output that will give us a clear=
er
> idea about whether a DT (and the test) has been compiled using a dtc with
> our without overlays support.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied, thanks.

> ---
>  tests/run_tests.sh | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index b49fa62a74e1..e4139dd035ad 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -171,23 +171,23 @@ BAD_FIXUP_TREES=3D"bad_index \
> =20
>  overlay_tests () {
>      # Overlay tests that don't require overlay support in dtc
> -    run_dtc_test -I dts -O dtb -o overlay_base.test.dtb overlay_base.dts
> -    run_dtc_test -I dts -O dtb -o overlay_overlay.test.dtb overlay_overl=
ay_nodtc.dts
> -    run_test overlay overlay_base.test.dtb overlay_overlay.test.dtb
> +    run_dtc_test -I dts -O dtb -o overlay_base_no_symbols.test.dtb overl=
ay_base.dts
> +    run_dtc_test -I dts -O dtb -o overlay_overlay_no_symbols.test.dtb ov=
erlay_overlay_nodtc.dts
> +    run_test overlay overlay_base_no_symbols.test.dtb overlay_overlay_no=
_symbols.test.dtb
> =20
>      # Overlay tests that requires overlay support in dtc
>      echo "/dts-v1/; / {};" | $DTC -@ > /dev/null 2>&1
>      if [ $? -eq 0 ]; then
> -        run_dtc_test -@ -I dts -O dtb -o overlay_base.test.dtb overlay_b=
ase.dts
> -        run_dtc_test -@ -I dts -O dtb -o overlay_overlay.test.dtb overla=
y_overlay_dtc.dts
> -        run_test overlay overlay_base.test.dtb overlay_overlay.test.dtb
> +        run_dtc_test -@ -I dts -O dtb -o overlay_base_with_symbols.test.=
dtb overlay_base.dts
> +        run_dtc_test -@ -I dts -O dtb -o overlay_overlay_with_symbols.te=
st.dtb overlay_overlay_dtc.dts
> +        run_test overlay overlay_base_with_symbols.test.dtb overlay_over=
lay_with_symbols.test.dtb
>      fi
> =20
>      # Bad fixup tests
>      for test in $BAD_FIXUP_TREES; do
>  	tree=3D"overlay_bad_fixup_$test"
>  	run_dtc_test -I dts -O dtb -o $tree.test.dtb $tree.dts
> -	run_test overlay_bad_fixup overlay_base.test.dtb $tree.test.dtb
> +	run_test overlay_bad_fixup overlay_base_no_symbols.test.dtb $tree.test.=
dtb
>      done
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX/XDqAAoJEGw4ysog2bOSiAkP/R3nIqqVzjo5YXy3WeAUcU79
uNnLh/6g5XxvTAE4qNhCU6/vddqKQg1JCqbuneKa9GMZMHWOC+TTEqgkQGPJKilQ
j6prEVtEinwco0wa7/5cUhrJd3Omo1Yb5r9d5D0iOqkPp4QAgE3aWKoZ/QOJRlNy
kv9M6qGVhkMcmrP20inDUSUi4U7Hagb+6Efzl2xNU0SjBslS3T1Cwf7epr+TM+LU
kb9NmPsS6Q/34JotfzSlXAnC7KxGdRKTbk5m+0qGsvsZ8/RgWBADMr7OC5ze/ppb
pO1kdHNiF6VKH8Eufm+eryD3p6eC8dDNodzuq/7WdQ/h0R9UCov+tnTemws6f4+q
NoZ1BfbhglaP2Thl1bCyXmJFOBDjEOlO19GRi6d+eO5/NtFMRSsReVhj+JkrWJ9D
Du+CDCpsbQsjNcHR83CLXLRTMMTaJPA71mP+prInRJ57T8wBlwXuZ5OivvAjBv3T
f2pEyaVrgcVfBajCSJsfHCofPHiN+rXBXMQmF80j9aiSS1yzpm1AEJG1AsTrZuKB
K4rsgDBClfnZlENBpbigr4Tw1StBT2yCNa6ZRtai08cdcJsZECM5T40zFuXGywt+
fCYSRq9WbK7g3uvJRbITMOcBDZAragm1BqYznGLAr26dtzzPCrbJQNJ9qzVbb/ue
dcA7wUtKVnJKnGzkT40d
=IbFf
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
