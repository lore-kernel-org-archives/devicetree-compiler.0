Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB529B799
	for <devicetree-compiler@vger.kernel.org>; Thu, 18 Jun 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771119; cv=none; b=l1BU1e8y+fIz984CDrjDAQi1+HMqKmg6D8WO/wkvc+Ppp7YKgxLaG14PY/6SkYYtYbEtpK5imwK21V9HVSCzaK7/ufssST8V+ti4KwY4iu8/gfNBSnmSE8B2Lbv+43Tmqxd31db1UeW1FPtuPDb7BYYEPf0ZdAqP4pd4LD0eyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771119; c=relaxed/simple;
	bh=470n4RW3YKwYmsE1bhrMT8rizZgjEE7pDE4SFGvgXWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9cKqapuutGv/DtKLTqeWeFiZka70MourmKI8zByJDtkz6UeAY+czmfUVpS2v78xD1obPWoMWsuPn8mhh2CGsnIx5oBkNKOjr2XVUbHxQ3fYXVoXF4b6ACThVcsgQS+DxtEMdp5FKWncenxxHyaJpKHIkRPKgp+p/vnAXau55Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=WCzzZDpo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="WCzzZDpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202606; t=1781771114;
	bh=SFzficNGzWHcaJJTut9hfRfLFG6EfJ48FH/oJQmJRb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCzzZDpogHOpNCjK0AHrm0vpjvNg3GAJk8YQ9YvUoLbLo3Xqa5ARl1MZp0TRKqlGU
	 FgeCmevgPAPwuNBa+lV40bnLGvk5NlaJYdGa09F00qKtST6b/TVxnsnlwkhA2J1R6T
	 Gtjc0NZpK0RuigxSQ4541ZH39QbjYGSG+5zruHFNwQaleeOtJP3Q0pOFxn+1sgP8y9
	 l8p9sbbNEV/r0NxF4Bv6opjRAIklcHq6nvzWOW4dAMUh055IPx+i7Zyaw89VUBdElG
	 iv8TMdkLgPUxqLAf8o5wiO2UFrNVx+SCUCh+lf6PpOUUayRQEIJj/VVYF7q+BtWOVp
	 o2m6TZpJggWWQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ggv163fDvz58mL; Thu, 18 Jun 2026 18:25:14 +1000 (AEST)
Date: Thu, 18 Jun 2026 18:25:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Brian Norris <briannorris@chromium.org>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Avoid warnings for reg override in __overlay__
Message-ID: <ajOrX76nVn7mN5am@zatzit>
References: <20260617204401.2275738-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QkkMauYhCtgSPzHm"
Content-Disposition: inline
In-Reply-To: <20260617204401.2275738-1-briannorris@chromium.org>


--QkkMauYhCtgSPzHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 01:44:01PM -0700, Brian Norris wrote:
> A simple overlay case can hit a number of false warnings just because it
> provides a 'reg' property [1]:
>=20
>  * avoid_default_addr_size: the generated fragment@0 node is an
>    artificial node, where #address-cells/#size-cells can't exist.
>=20
>  * reg_format: we're assuming the wrong/default #address-cells here, so
>    the analysis is wrong. (We don't know how many cells should be in
>    this 'reg', in isolation.)
>=20
>  * unit_address_vs_reg: we don't know the real node name here. (It's not
>    actually going to be "__overlay__".)
>=20
> All these cannot be checked by the overlay compiler in isolation.
> Suppress them when we identify we're running in plugin mode, and we're
> likely looking at a generated __overlay__ hierarchy that can't be
> analyzed in this way.

Yeah, the check system was designed before runtime overlays and
doesn't work well with them.  Specifically there's not distinction
between checks that can be applied locally (just looking at one node),
checks that can be applied to a subtree (without looking outside the
subtree) and checks which require a full tree including a root node.

Just suppressing checks ad-hoc like this is not a great solution.

I had a loose plan for tackling this, amongst some other problems, by
making the assembly of a complete tree an explicitly separate step in
dtc from parsing each fragment (here referring to compile time dts
fragments).

The idea was that each of the (compile time) overlays would be
separately parsed into a temporary tree, rather than assembling them
together into a single tree as we go.  Then we'd have a pass applying
those checks that make sense for subtrees separately to each
subtree/overlay.

Then there would be a separate assembly stage.  For full trees that
would essentially apply each overlay.  For overlay output it would add
the fragment@XX/__overlay__ encoding.  Afterwards there would be
another checks pass for the assembled tree - that would have a
different set of checks from the individual fragment tests, and
different ones for complete trees versus overlay output.

Unfortunately, I will not realistically ever get to this.

>=20
> [1]
> $ dtc -I dts -O dts tests/overlay-reg-override.dtso
> tests/overlay-reg-override.dtso:5.2-14: Warning (reg_format): /fragment@0=
/__overlay__:reg: property has invalid length (4 bytes) (#address-cells =3D=
=3D 2, #size-cells =3D=3D 1)
> tests/overlay-reg-override.dtso:4.6-6.3: Warning (unit_address_vs_reg): /=
fragment@0/__overlay__: node has a reg or ranges property, but no unit name
> <stdout>: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> <stdout>: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> <stdout>: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> <stdout>: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> <stdout>: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size=
): /fragment@0/__overlay__: Relying on default #address-cells value
> tests/overlay-reg-override.dtso:4.6-6.3: Warning (avoid_default_addr_size=
): /fragment@0/__overlay__: Relying on default #size-cells value
> <stdout>: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avo=
id_default_addr_size'
> <stdout>: Warning (unique_unit_address): Failed prerequisite 'avoid_defau=
lt_addr_size'
> /dts-v1/;
>=20
> / {
>=20
> 	fragment@0 {
> 		target =3D <&foo>;
>=20
> 		__overlay__ {
> 			reg =3D <0x00>;
> 		};
> 	};
>=20
> 	__fixups__ {
> 		foo =3D "/fragment@0:target:0";
> 	};
> };
>=20
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  checks.c                        | 17 ++++++++++++++---
>  tests/overlay-reg-override.dtso |  6 ++++++
>  tests/run_tests.sh              |  1 +
>  3 files changed, 21 insertions(+), 3 deletions(-)
>  create mode 100644 tests/overlay-reg-override.dtso
>=20
> diff --git a/checks.c b/checks.c
> index a6037ed08000..dd6824dce6ea 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -368,9 +368,12 @@ static void check_unit_address_vs_reg(struct check *=
c, struct dt_info *dti,
>  	const char *unitname =3D get_unitname(node);
>  	struct property *prop =3D get_property(node, "reg");
> =20
> -	if (get_subnode(node, "__overlay__")) {
> -		/* HACK: Overlay fragments are a special case */
> -		return;
> +	/* HACK: Overlay fragments are a special case */

Yeah... it's definitely a hack.

> +	if (dti->dtsflags & DTSF_PLUGIN) {
> +		if (get_subnode(node, "__overlay__"))
> +			return;
> +		if (streq(node->name, "__overlay__"))
> +			return;
>  	}
> =20
>  	if (!prop) {
> @@ -774,6 +777,10 @@ static void check_reg_format(struct check *c, struct=
 dt_info *dti,
>  	if (!prop)
>  		return; /* No "reg", that's fine */
> =20
> +	/* Overlay nodes are special */
> +	if ((dti->dtsflags & DTSF_PLUGIN) && streq(node->name, "__overlay__"))
> +		return;
> +
>  	if (!node->parent) {
>  		FAIL(c, dti, node, "Root node has a \"reg\" property");
>  		return;
> @@ -1210,6 +1217,10 @@ static void check_avoid_default_addr_size(struct c=
heck *c, struct dt_info *dti,
>  	if (!node->parent)
>  		return; /* Ignore root node */
> =20
> +	/* Overlay nodes are special */
> +	if ((dti->dtsflags & DTSF_PLUGIN) && streq(node->name, "__overlay__"))
> +		return;
> +
>  	reg =3D get_property(node, "reg");
>  	ranges =3D get_property(node, "ranges");
> =20
> diff --git a/tests/overlay-reg-override.dtso b/tests/overlay-reg-override=
=2Edtso
> new file mode 100644
> index 000000000000..7e5e13883b51
> --- /dev/null
> +++ b/tests/overlay-reg-override.dtso
> @@ -0,0 +1,6 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&foo {
> +	reg =3D <0x0>;
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 842b543059bb..8f3265afa5cc 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -752,6 +752,7 @@ dtc_tests () {
>      check_tests "$SRCDIR/unit-addr-leading-0x.dts" unit_address_format
>      check_tests "$SRCDIR/unit-addr-leading-0s.dts" unit_address_format
>      check_tests "$SRCDIR/unit-addr-unique.dts" unique_unit_address
> +    check_tests "$SRCDIR/overlay-reg-override.dtso" -n reg_format unit_a=
ddress_vs_reg avoid_default_addr_size
>      check_tests "$SRCDIR/bad-phandle-cells.dts" interrupts_extended_prop=
erty
>      check_tests "$SRCDIR/bad-gpio.dts" gpios_property
>      check_tests "$SRCDIR/good-gpio.dts" -n gpios_property
> --=20
> 2.54.0.1189.g8c84645362-goog
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--QkkMauYhCtgSPzHm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmozq1oACgkQzQJF27ox
2GdjsA/+OFtTiV9v2s9X2mzTfnucwRD70jRiZQBnK0FVKOLmvryV4KPQHzi7JEr4
3P88ZZ/THmTiDCCO9k7DRJU3a0CL3US3wVkOL/s4kCWQzOADn9z4KoOy7oPsKe91
9oAHHrq4Gpoqr44LTKfd4vO1swReQ82B7+BEwG7b3rqlCnOZdLQcUj4bvnTGGV/B
YGVe5dPr/ZfrJKcdBs9kqJAs+yZE+MGJqdYpQyDR0XivzyGXKxi5ZlCDP4mD+aIh
qaF1t3+Brjo8flkkmAAnCTHr00ZIcrADGzZCQc9cZ5fhsNOwJDsR7wB3bikW+RBN
zoCC1MHuvDzOMECipV8v8+zo3kMMnb7Bqgw8QX6oH5xdCkSmN/pqJPB//x7oQuh4
tY2Zf6O/lPMB2fv+De3lBJZKemAeszTup2eSAzIrGEX16jcBv+svNyzpSfzKOXNX
oLqD2GvvqjdV3+O6JYsK+4xnijeZ6wQdEOxJ/CC+/RKwXQbXGWN2YrZMRurLDP5u
+mrV/vy2VMlXht2untKDxBnWQ/NC/FYL4l17pMnd03mo9lTRHlLusyue6S0ZIaAX
fYsuw9lke9X4AkoDfCxRT1wFZKIvZ6HS+IsGvW1IjPwT3TLncBRGDU/TlVDf0fsL
hoOHfe1oLvsF8yiUE2hGvq+fclobikuFMOJV/g0LxYdK4XuKNAs=
=Iej8
-----END PGP SIGNATURE-----

--QkkMauYhCtgSPzHm--
