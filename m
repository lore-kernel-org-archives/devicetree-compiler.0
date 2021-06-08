From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/5] checks: Drop interrupt_cells_is_cell check
Date: Tue, 8 Jun 2021 11:58:51 +1000
Message-ID: <YL7O2/Xo1YdUylji@yekko>
References: <20210526010335.860787-1-robh@kernel.org>
 <20210526010335.860787-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HhbT13f0zzfKCtN+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623119149;
        bh=P9/O/1U7tQb9o8J++PNqkCNuIbQ1wSiDNNAXH4ihKg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iEcwv+jJ+FY4gD8BJQ7kbnbQHljBsXPMq8+KPpzP4t8Zu4ojppVfgYN89DXvcSAGI
         6zYGV84Ad3F3nRbGOSH0Kj6S/ICBq2tAxqw8sdun54w/KMWQiYITV+gI3gF1BKjNzz
         OAQq9ZzgEobMuSgzeHtIiixfkO0AVI4AFTA3atEQ=
Content-Disposition: inline
In-Reply-To: <20210526010335.860787-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--HhbT13f0zzfKCtN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:03:33PM -0500, Rob Herring wrote:
> With the prior commit, this check is now redundant.

Applied, thanks.

>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c           | 3 +--
>  tests/run_tests.sh | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 6a01a2468c42..7ff044df6837 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -672,7 +672,6 @@ ERROR(omit_unused_nodes, fixup_omit_unused_nodes, NUL=
L, &phandle_references, &pa
>   */
>  WARNING_IF_NOT_CELL(address_cells_is_cell, "#address-cells");
>  WARNING_IF_NOT_CELL(size_cells_is_cell, "#size-cells");
> -WARNING_IF_NOT_CELL(interrupt_cells_is_cell, "#interrupt-cells");
> =20
>  WARNING_IF_NOT_STRING(device_type_is_string, "device_type");
>  WARNING_IF_NOT_STRING(model_is_string, "model");
> @@ -1809,7 +1808,7 @@ static struct check *check_table[] =3D {
>  	&phandle_references, &path_references,
>  	&omit_unused_nodes,
> =20
> -	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
> +	&address_cells_is_cell, &size_cells_is_cell,
>  	&device_type_is_string, &model_is_string, &status_is_string,
>  	&label_is_string,
> =20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 0e8ecdb40c2c..0e270feb3e47 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -691,7 +691,7 @@ dtc_tests () {
>      run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb "$SRCDIR/nonexist-n=
ode-ref2.dts"
>      check_tests "$SRCDIR/bad-name-property.dts" name_properties
> =20
> -    check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cell=
s_is_cell interrupt_cells_is_cell
> +    check_tests "$SRCDIR/bad-ncells.dts" address_cells_is_cell size_cell=
s_is_cell interrupts_extended_is_cell
>      check_tests "$SRCDIR/bad-string-props.dts" device_type_is_string mod=
el_is_string status_is_string label_is_string compatible_is_string_list nam=
es_is_string_list
>      check_tests "$SRCDIR/bad-chosen.dts" chosen_node_is_root
>      check_tests "$SRCDIR/bad-chosen.dts" chosen_node_bootargs
> @@ -740,7 +740,7 @@ dtc_tests () {
> =20
> =20
>      # Check warning options
> -    run_sh_test "$SRCDIR/dtc-checkfails.sh" address_cells_is_cell interr=
upt_cells_is_cell -n size_cells_is_cell -- -Wno_size_cells_is_cell -I dts -=
O dtb "$SRCDIR/bad-ncells.dts"
> +    run_sh_test "$SRCDIR/dtc-checkfails.sh" address_cells_is_cell interr=
upts_extended_is_cell -n size_cells_is_cell -- -Wno_size_cells_is_cell -I d=
ts -O dtb "$SRCDIR/bad-ncells.dts"
>      run_sh_test "$SRCDIR/dtc-fails.sh" -n test-warn-output.test.dtb -I d=
ts -O dtb "$SRCDIR/bad-ncells.dts"
>      run_sh_test "$SRCDIR/dtc-fails.sh" test-error-output.test.dtb -I dts=
 -O dtb bad-ncells.dts -Esize_cells_is_cell
>      run_sh_test "$SRCDIR/dtc-checkfails.sh" always_fail -- -Walways_fail=
 -I dts -O dtb "$SRCDIR/test_tree1.dts"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HhbT13f0zzfKCtN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC+ztsACgkQbDjKyiDZ
s5J3WA//asZqqTcj0m6TY42Ep9AM4Uqr3UZ8PPNMT++aEy8z99trWtzScHOyvL5w
ceQQ1DzIjU7oJDv4CJTBdJFbnmtjriiSKUmdi9IyyfsHuw/SqIfn71TNyYNYw+T4
ydDo410YfinbeTCNR5fqPicc12nVQSZm/NmCiPLsmQ1sr7wtTLA2Jhy7VkNzonGD
kKPphANJ/sDp55HovW4O71Gnc0sv6psi3Ox5K70wTcDOqtp8k+bX3rqTSkk2Go6G
5420gE0ZWsJWpceJqkeMInRNqjGUCY4ssu+Da3nPwdcZfB6jvQbAjh+l4IbxL6Yn
lEGN0T2oZvRxBnoCZubv4DGCjFusy1hnC+8gItON9KJp/z7WEl+phYEf6ZpoBhzB
Fe+Zvuvrwp4RnSpxFteGjd5RcT/DgSXoIadKklY7bjxNuUU8/quM2U/hEr+ZMyaa
pwk0DhAojRYQ/pcvm1X81KzJEOLPErs6tXzW3Y3oPjrFnR41v6abZ6kgKw8si0VF
e1615eJ3kYZSgQG6aWHd6WnE7RrlBmbfJnccwRAKVQ4N3a+k7SI7IO6bakI+YTu2
C0KgpWIxbXZF43X/THrLOiIqdGa1tKURO0ygWkmlj50w6Q/ctCTAWo+zrTR6ICQg
meEMAR9JLij2db2kyx7KkggjkFGX1bqAV8jz2rAKchXCmHks1kc=
=Lfvx
-----END PGP SIGNATURE-----

--HhbT13f0zzfKCtN+--
