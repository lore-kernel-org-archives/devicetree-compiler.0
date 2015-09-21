From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 2/3] dtc: make check test for dtc --annotate
Date: Mon, 21 Sep 2015 16:33:36 +1000
Message-ID: <20150921063336.GM20331@voom.fritz.box>
References: <55F8EB35.5010601@gmail.com>
 <55F8EF1B.1040003@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LJm8egi4vkexsie5"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F8EF1B.1040003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--LJm8egi4vkexsie5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 09:24:59PM -0700, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Add dtc tests.
>=20
>   - dtc --annotate to create a .dts with annotations
>   - compile the annotated .dts
>=20
> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

It'd be nice to make this test a bit less trivial by actually
comparing the output against a sample.  Maybe for tests/include0.dts
to give it a real workout.

> ---
>  tests/run_tests.sh |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> Index: b/tests/run_tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -276,6 +276,9 @@ libfdt_tests () {
>      run_dtc_test -I dts -O dtb -o sourceoutput.test.dts.test.dtb sourceo=
utput.test.dts
>      run_test dtbs_equal_ordered sourceoutput.test.dtb sourceoutput.test.=
dts.test.dtb
> =20
> +    run_dtc_test --annotate -o sourceoutput.test.annotate.dts sourceoutp=
ut.dts
> +    run_dtc_test -o sourceoutput.test.annotate.dts.test.dts sourceoutput=
=2Etest.annotate.dts
> +
>      run_dtc_test -I dts -O dtb -o embedded_nul.test.dtb embedded_nul.dts
>      run_dtc_test -I dts -O dtb -o embedded_nul_equiv.test.dtb embedded_n=
ul_equiv.dts
>      run_test dtbs_equal_ordered embedded_nul.test.dtb embedded_nul_equiv=
=2Etest.dtb

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LJm8egi4vkexsie5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV/6TAAAoJEGw4ysog2bOSpPQP/0XYunRspd5sAQMupRrV1M+S
IUsKlRYYrSZXj1sXo3CmHT6KvZ4UV0vOo9glhBKQngWFqxhT6ij2QNIJ8aAE9xAm
dE1zThPDi9REd0emyxmgRwf0jsYncKoo78WwHWeaXRn6A0SkIQg+KuExVUehsfLj
2mWTkLiAW01sM5ez8QgR9ZWhyg/FclCBRW4Dd94bzDesqeeg+oHUo9t9MxnWhPWP
Om6lwUyqtmxCUFmc5BL1E/6C7J5tuSElepNPbaDU4lkgXSt5eW8zTFoBMRTpppxf
rB5aNQc9LnxKDgU17ogCfE/Pa7UfIWED0DegWHRZ5OMJaCtQeZ7XNEOkC/jlP20i
HYqh6SqCk1XdR8UZTd9DaT6iu+q6rrvSVQd3JLtl/VsH4xyMvUoPa0Z5h13z22k+
CrskeZJujPmxJl9pV2TDPVvDA+9OYwg4XGGGmK8l6rmYdN7iBah1vzh1xt7XVOvP
VENv4LcuKtT+jMbgHBeLzL18pPcouyxbrcuGRKFgIgamWNIw6pOdTPE52zeaTLIL
+3VeQ0v2ptjIG8Q0q6z7ck3VzAdW7xqlAogpSLCA6pFmT9PZSM8zoH9b4SdWkL6D
5VOFWYBy4p4yA0AKNaC4VdciLVWTYXjFdhT3+xicA0QPkWPSN7Ubzz8zoa7nXjNI
NfbFG8JAFzHdo0dfNXU/
=y1yG
-----END PGP SIGNATURE-----

--LJm8egi4vkexsie5--
