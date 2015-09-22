From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v2 2/3] dtc: make check test for dtc --annotate
Date: Tue, 22 Sep 2015 20:39:07 +1000
Message-ID: <20150922103907.GP20331@voom.fritz.box>
References: <5600E191.9020903@gmail.com>
 <5600E953.40308@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JF+ytOk7PH04NsRm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5600E953.40308-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--JF+ytOk7PH04NsRm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 10:38:27PM -0700, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Add dtc tests.
>=20
>   - dtc --annotate to create a .dts with annotations
>   - compile the annotated .dts
>   - compare the .dts created from include0.dts to the .dts created
>     by first compiling include0.dts with annotations, then compiling
>     the resulting .dts without --annotations to strip the annotation

My brain hurts trying to follow that.

> Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>  tests/run_tests.sh |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> Index: b/tests/run_tests.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -276,6 +276,16 @@ libfdt_tests () {
>      run_dtc_test -I dts -O dtb -o sourceoutput.test.dts.test.dtb sourceo=
utput.test.dts
>      run_test dtbs_equal_ordered sourceoutput.test.dtb sourceoutput.test.=
dts.test.dtb
> =20
> +    # verify annotated .dts can be compiled
> +    run_dtc_test --annotate -o sourceoutput.test.annotate.dts sourceoutp=
ut.dts

1) Looks like you forgot to git add sourceoutput.dts
2) All your generated files should be named *.test.dts, so that make
clean will get rid of them.

> +    run_dtc_test -o sourceoutput.test.annotate.dts.test.dts sourceoutput=
=2Etest.annotate.dts
> +
> +    # verify annotated .dts can be stripped to match non-annotated
> +    run_dtc_test -o includes.dts include0.dts
> +    run_dtc_test --annotate -o includes.annotate.dts include0.dts
> +    run_dtc_test -o includes.annotate_undo.dts includes.annotate.dts
> +    run_wrap_test cmp includes.dts includes.annotate_undo.dts

So, this checks that annotate doesn't break the semantic parts of the
tree, which is a good test.

But I was suggesting a canned example, including the annotations to
check for regressions in the annotation generation itself.

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

--JF+ytOk7PH04NsRm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWAS/LAAoJEGw4ysog2bOSVDwP/A2VYdqijiQ4W+gLA6WVBOvW
db8ekqb7czGKGuTBsnbyUOmwv9OFlz9y0IoN7wrGpuyBeFZsxJfcoBIZbk8YqujD
m57LLcBg3NKbjVFd7grs5IDnp62kYr/GnZo8eJub3BhXcUmvJgKVCtNDc0lfrlIR
dVowgV1m+1wNnQjys9gLAm07uSI+G2gSsNGxkOyDFGU5cFDqma4Tkjr2UJpMeHP4
RCkiEWDP/NR30MY8rvih1ZI3bRWEZYDb73h3NYF7YmxWVu46jhWRKtYbu0TBVm8M
aSOPaxFgGXAKQJtl7xCc1IbB211YG/EZ5Q/ipTCPwfSG7vG0Hhi+RhmjhQZLZSie
ZyVRKhj1Gx1reg52AhCNamaiUv922mE6H5LXsBeTbB4N7cw/OaChxMjFkderC3p4
IA7c6gO4NQj3Rfe5QGi7YW6RDCJ91o9bmFuAMtRrhn2lBOl195D699JynN8pmbjV
wtQyXWF6hYyvAOhwGMVT5zgdppYMqg1RjUjyP8vcKlLVmOBM/69TST0yGi6uwx0b
hbA1gPb131X7KNMWxtCLXjFKc2n0C9p0PIE+UbJlgqhzUQOK0BNBcUn/0fbNDxzm
bEwC/taEDwUw1ak4FG+7y+AMR3i/P+1+14LBJrt8JF3mSC7aGRU7k/thG9L5HIit
VqpGZuwPVQhzDvCiQwjv
=oY8R
-----END PGP SIGNATURE-----

--JF+ytOk7PH04NsRm--
