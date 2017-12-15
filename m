From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] checks: add chosen node checks
Date: Fri, 15 Dec 2017 13:27:54 +1100
Message-ID: <20171215022754.GB7753@umbus.fritz.box>
References: <20171214224001.17298-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513304879;
        bh=RrjU5IeC8+RxHDoK1oqNWrWtFhZ0IkwU/IkmyWOQQAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gpC1wlK99f4qeXjWrWLaHVknS8GpG4Gj6NsKcUXu4pvFa6uYB3LJp0+qB4DM5JB77
         JkbM2yaI0wRh4f3jUTQLhdhAlpsGyuIAl8nW1FaGM83qYm8SLggci5pit2DZ/NpRLc
         qkl/rVqaV5SAMK/2bdxyAKjkUCSaP2l1Ylix3zQA=
Content-Disposition: inline
In-Reply-To: <20171214224001.17298-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 04:40:01PM -0600, Rob Herring wrote:
> Add some checks for /chosen node. These check that chosen is located at
> the root level and that bootargs and stdout-path properties are strings.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

One possible follow-on...

[snip]
> +static void check_chosen_node_stdout_path(struct check *c, struct dt_inf=
o *dti,
> +					  struct node *node)
> +{
> +	struct property *prop;
> +
> +	if (!streq(node->name, "chosen"))
> +		return;
> +
> +	prop =3D get_property(node, "stdout-path");
> +	if (!prop) {
> +		prop =3D get_property(node, "linux,stdout-path");
> +		if (!prop)
> +			return;
> +		FAIL(c, dti, "Use 'stdout-path' instead of 'linux,stdout-path'");
> +	}
> +
> +	c->data =3D prop->name;
> +	check_is_string(c, dti, node);

=2E. you could also check that it's actually a valid path to a node,
couldn't you?

> +}
> +WARNING(chosen_node_stdout_path, check_chosen_node_stdout_path, NULL);
> +
>  struct provider {
>  	const char *prop_name;
>  	const char *cell_name;
> @@ -1354,6 +1404,7 @@ static struct check *check_table[] =3D {
>  	&avoid_default_addr_size,
>  	&avoid_unnecessary_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> +	&chosen_node_is_root, &chosen_node_bootargs, &chosen_node_stdout_path,
> =20
>  	&clocks_property,
>  	&cooling_device_property,
> diff --git a/tests/bad-chosen.dts b/tests/bad-chosen.dts
> new file mode 100644
> index 000000000000..d6f53c68ddd9
> --- /dev/null
> +++ b/tests/bad-chosen.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +
> +/ {
> +	node2 {
> +		chosen {
> +			bootargs =3D <0xdeadbeef>;
> +			stdout-path =3D <1>;
> +		};
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index d36dffbc4ef9..61c95f1fc899 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -547,6 +547,9 @@ dtc_tests () {
> =20
>      check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell =
interrupt_cells_is_cell
>      check_tests bad-string-props.dts device_type_is_string model_is_stri=
ng status_is_string label_is_string compatible_is_string_list names_is_stri=
ng_list
> +    check_tests bad-chosen.dts chosen_node_is_root
> +    check_tests bad-chosen.dts chosen_node_bootargs
> +    check_tests bad-chosen.dts chosen_node_stdout_path
>      check_tests bad-reg-ranges.dts reg_format ranges_format
>      check_tests bad-empty-ranges.dts ranges_format
>      check_tests reg-ranges-root.dts reg_format ranges_format

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlozMyoACgkQbDjKyiDZ
s5Ik+w/+LrZ+rN35nG9oVz477yqfyYyL3dt9m3MKwfRz4zq7ZyoNt6W48R9znXzL
iM2/6k3LOLX5CqKJ8vgI/FqHEE9Ihz+V4b+o6/vzCcm3+/ujG5wOBC6hVSxP8jta
qeAoHTY1AJrLBCpcv4oz9b45pPfwM/sPWBU9Ngp2XpNqaWKid1P4h5hZAEY2U2vg
o+eCNfZ9UXqqF5q59sM3pWPUku1TvIgYKleGYOHPVJ+/nZ2l7uxJi1hddatAERs+
uV5VT4puHB6INjq9pmrq8B1jCmipbM7/FGibTCz+wVfiWc1qF1tpoppumiQghonx
KqKShgbIgFCUbQhXsYXO5MWpX1yygrdKohQSXIZAJqCGRkD2m0K6kY8fnMws1z+H
7kZ6s1l8epVKy41bJ6ImkF4lJTKxZxjULRvgDiLcbFkkcWhoC5arxFaBz13CxACp
+HSS063WrBVdef7EzRZMHFcQpMbYDLxWnKaXrwUJEDAu6pL5AOpuCDSxTY9KOIwu
xtXh8UzdQ/kEwDvjEvFzV1dBZ4TW4pyJY0oDHB60iLZv8dapk443himBeCiyVYgb
uPZbtla8YDWZ9tGS6y+Avv1OM/xDAw5m2YPdMBhmhczhkxYkvnKdAEq2HLPnEYoK
HJ7ByRCBJGjh9ljEtG+CAMzIFly/uqwkWxAu5WaiCCjXIsuYtWE=
=UAnT
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
