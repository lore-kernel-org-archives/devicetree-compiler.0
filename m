From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Fix NULL pointer use in dtlabel + dtref case
Date: Tue, 31 Jan 2017 09:51:17 +1100
Message-ID: <20170130225117.GA14879@umbus.fritz.box>
References: <20170130220617.19128-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1485817549;
        bh=QvxGAxUNreNPFX4afDed4BUCnp8G1US036pu2nFIhYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LYoN7AVyV6xECdWiM6uqGHjh66IUcOCg9TJHtDlh2WaekVVSn6sbSgC4zbEAA8p0Q
         oLBgeyMulSsjHI1buN1yFtfP75bO8Q8XGLfCMhfp8aKyMYkI+kaqlyadWKGHPYJlBs
         AJ/Z8cr5dUh4pGBXaowMyiWJT/a+ct0XFEx2I0jI=
Content-Disposition: inline
In-Reply-To: <20170130220617.19128-1-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 02:06:17PM -0800, Stephen Boyd wrote:
> If we have a construct like this:
>=20
> 	label: &handle {
> 		...
> 	};
>=20
> Running dtc on it will cause a segfault, because we use 'target'
> when it could be NULL. Move the add_label() call into the if
> statement to fix this potentially bad use of a NULL pointer.
>=20
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>=20
> Changes from v1:
>  * Add a test to ensure we flag an error
>=20
>  dtc-parser.y             | 6 +++---
>  tests/run_tests.sh       | 1 +
>  tests/test_label_ref.dts | 9 +++++++++
>  3 files changed, 13 insertions(+), 3 deletions(-)
>  create mode 100644 tests/test_label_ref.dts
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index b2fd4d155839..ca3f5003427c 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -171,10 +171,10 @@ devicetree:
>  		{
>  			struct node *target =3D get_node_by_ref($1, $3);
> =20
> -			add_label(&target->labels, $2);
> -			if (target)
> +			if (target) {
> +				add_label(&target->labels, $2);
>  				merge_nodes(target, $4);
> -			else
> +			} else
>  				ERROR(&@3, "Label or path %s not found", $3);
>  			$$ =3D $1;
>  		}
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 157dbaea7600..ed489dbdd269 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -511,6 +511,7 @@ dtc_tests () {
>      run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.tes=
t.dtb
>      run_dtc_test -I dts -O dtb -o dtc_tree1_merge_path.test.dtb test_tre=
e1_merge_path.dts
>      tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
> +    run_wrap_error_test $DTC -I dts -O dtb -o /dev/null test_label_ref.d=
ts
> =20
>      # Check prop/node delete functionality
>      run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb test_tree1_d=
elete.dts
> diff --git a/tests/test_label_ref.dts b/tests/test_label_ref.dts
> new file mode 100644
> index 000000000000..7009c79531a7
> --- /dev/null
> +++ b/tests/test_label_ref.dts
> @@ -0,0 +1,9 @@
> +/dts-v1/;
> +
> +/ {
> +
> +};
> +
> +label: &handle {
> +
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYj8NjAAoJEGw4ysog2bOSyE4P/0XS+FAoQ+cMYGGBE09wjLNC
lKoti7zlneMZWl2NMThd0XF0AFSIYD6FBACmDF4c+IEcyqof0aicADYsLNI7XhOY
Qxr2OZUkgxgoa6YVscQSMnwug6ph7jy3EXEg47+BE5LTwDSVw+Df4BhC2XUlHV+V
A4yfsrvy72U2OLebmA8SU/kI/c/hwyvy0HAn9ePfjU70yHhPLiQ+g+9NfA6LqD8X
fdkks74Z08nPVcv9ET5BEVbq8fwHKbqziDxzL7nWVctgQnQjcBo5tpDyfLshQeNw
bUALAbXyORcETxsZtMdac/38det2SKjqsYkOZWjWsAcVPVZ3Hpjxw57KNOlL6Nsq
DVkwroX1aGuhXYAXi8qFi5oevOZ4xdgkY+GzH7HXUmEPq48mBtSyiGPclp0TgYGe
R3U7K5QOLb5O4lJyfPXwrMiugZ2sPOW0vqGz+0JPK9/Mh/dBUcFLUUhVSAF6/4KJ
yMZjHrH/xegOzZAxBRkIEQK04k4joo9jKd2QDBYaMkbsIFeMNXlJqXxbaFxQ8WLO
0ClN/rwgvIZwSYigsdDF0ETTvFAEMgfo5/RdQQ5Jnx4w0F8MLXKk1yd7UbA8MXdl
1NdkV7jEpYDeXPgzxrSLakjFfZV5ot+FO3PfgCC96V6f32nK+je6pr/QcD/Xi39w
UO2swcv1HO++aolzpgdj
=z9Jl
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
