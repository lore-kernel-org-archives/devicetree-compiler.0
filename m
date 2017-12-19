From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] checks: add graph binding checks
Date: Tue, 19 Dec 2017 16:04:00 +1100
Message-ID: <20171219050400.GN4786@umbus.fritz.box>
References: <20171215031853.8229-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8MZM6zh5Bb05FW+3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513659855;
        bh=34zXfS79DlbSY1DaSYCbH7k2up1BbRp961al5/59JU8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iJ0/c/N1nyocDLx5pY63q0+RZ1qqR6rIKXKla4vb5BnnAfF0ZO2c9Ov5YAHdiVAhS
         hx6pdFTfoqlBOKsKxc5oborl6D5Jt3LTJv8OHh2zdL1dU6eSFc+xt6OWA9fcdMmyvc
         2ow44F3BHLup+bHmRRBqvWioPCeWb9G9Kl0ZeBDQ=
Content-Disposition: inline
In-Reply-To: <20171215031853.8229-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--8MZM6zh5Bb05FW+3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 09:18:53PM -0600, Rob Herring wrote:
> Add checks for DT graph bindings. These checks check node names,
> unit-addresses and link connections on ports, port, and endpoint nodes.
>=20
> The graph nodes are matched by finding nodes named 'endpoint' or with a
> 'remote-endpoint' property. We can't match on 'ports' or 'port' nodes
> because those names are used for non-graph nodes. While the graph nodes
> aren't really buses, using the bus pointer to tag matched nodes is
> convenient.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Could you give me a reference to somewhere these graph nodes are
described?  It' a type I wasn't even vaguely aware of up until now.

> ---
> v2:
> - add test case
> - fix unused variable error
>=20
>  checks.c            | 139 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/bad-graph.dts |  24 +++++++++
>  tests/run_tests.sh  |   3 ++
>  3 files changed, 166 insertions(+)
>  create mode 100644 tests/bad-graph.dts
>=20
> diff --git a/checks.c b/checks.c
> index 1cded3658491..9fce9116ce11 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1370,6 +1370,143 @@ static void check_interrupts_property(struct chec=
k *c,
>  }
>  WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);
> =20
> +static const struct bus_type graph_port_bus =3D {
> +	.name =3D "graph-port",
> +};
> +
> +static const struct bus_type graph_ports_bus =3D {
> +	.name =3D "graph-ports",
> +};
> +
> +static void check_graph_nodes(struct check *c, struct dt_info *dti,
> +			      struct node *node)
> +{
> +	struct node *child;
> +
> +	for_each_child(node, child) {
> +		if (!(strprefixeq(child->name, child->basenamelen, "endpoint") ||
> +		      get_property(child, "remote-endpoint")))
> +			continue;
> +
> +		node->bus =3D &graph_port_bus;
> +	}
> +
> +	/* The parent of 'port' nodes can be either 'ports' or a device */
> +	if (node->bus && !node->parent->bus &&
> +	    (streq(node->parent->name, "ports") || get_property(node, "reg")))
> +		node->parent->bus =3D &graph_ports_bus;
> +}
> +WARNING(graph_nodes, check_graph_nodes, NULL);
> +
> +static void check_graph_child_address(struct check *c, struct dt_info *d=
ti,
> +				      struct node *node)
> +{
> +	int cnt =3D 0;
> +	struct node *child;
> +
> +	if (node->bus !=3D &graph_ports_bus && node->bus !=3D &graph_port_bus)
> +		return;
> +
> +	for_each_child(node, child)
> +		cnt++;
> +
> +	if (cnt =3D=3D 1 && node->addr_cells !=3D -1)
> +		FAIL(c, dti, "graph node '%s' has single child node, unit address is n=
ot necessary",
> +		     node->fullpath);
> +}
> +WARNING(graph_child_address, check_graph_child_address, NULL, &graph_nod=
es);
> +
> +static void check_graph_reg(struct check *c, struct dt_info *dti,
> +			    struct node *node)
> +{
> +	char unit_addr[9];
> +	const char *unitname =3D get_unitname(node);
> +	struct property *prop;
> +
> +	prop =3D get_property(node, "reg");
> +	if (!prop || !unitname)
> +		return;
> +
> +	if (!(prop->val.val && prop->val.len =3D=3D sizeof(cell_t))) {
> +		FAIL(c, dti, "graph node '%s' malformed 'reg' property", node->fullpat=
h);
> +		return;
> +	}
> +
> +	snprintf(unit_addr, sizeof(unit_addr), "%x", propval_cell(prop));
> +	if (!streq(unitname, unit_addr))
> +		FAIL(c, dti, "graph node '%s' unit address error, expected \"%s\"",
> +		     node->fullpath, unit_addr);
> +
> +	if (node->parent->addr_cells !=3D 1)
> +		FAIL(c, dti, "'#address-cells' is %d, must be 1 in graph node '%s'",
> +		     node->parent->addr_cells, node->fullpath);
> +	if (node->parent->size_cells !=3D 0)
> +		FAIL(c, dti, "'#size-cells' is %d, must be 0 in graph node '%s'",
> +		     node->parent->size_cells, node->fullpath);
> +}
> +
> +static void check_graph_port(struct check *c, struct dt_info *dti,
> +			     struct node *node)
> +{
> +	if (node->bus !=3D &graph_port_bus)
> +		return;
> +
> +	if (!strprefixeq(node->name, node->basenamelen, "port"))
> +		FAIL(c, dti, "graph port node '%s' name should be 'port'",
> +		     node->fullpath);
> +
> +	check_graph_reg(c, dti, node);
> +}
> +WARNING(graph_port, check_graph_port, NULL, &graph_nodes);
> +
> +static struct node *get_remote_endpoint(struct check *c, struct dt_info =
*dti,
> +					struct node *endpoint)
> +{
> +	int phandle;
> +	struct node *node;
> +	struct property *prop;
> +
> +	prop =3D get_property(endpoint, "remote-endpoint");
> +	if (!prop)
> +		return NULL;
> +
> +	phandle =3D propval_cell(prop);
> +	/* Give up if this is an overlay with external references */
> +	if (phandle =3D=3D 0 || phandle =3D=3D -1)
> +		return NULL;
> +
> +	node =3D get_node_by_phandle(dti->dt, phandle);
> +	if (!node)
> +		FAIL(c, dti, "graph endpoint node '%s' 'remote-endpoint' phandle is no=
t valid",
> +		     endpoint->fullpath);
> +
> +	return node;
> +}
> +
> +static void check_graph_endpoint(struct check *c, struct dt_info *dti,
> +				 struct node *node)
> +{
> +	struct node *remote_node;
> +
> +	if (!node->parent || node->parent->bus !=3D &graph_port_bus)
> +		return;
> +
> +	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
> +		FAIL(c, dti, "graph endpont node '%s' name should be 'endpoint'",
> +		     node->fullpath);
> +
> +	check_graph_reg(c, dti, node);
> +
> +	remote_node =3D get_remote_endpoint(c, dti, node);
> +	if (!remote_node)
> +		return;
> +
> +	if (get_remote_endpoint(c, dti, remote_node) !=3D node)
> +		FAIL(c, dti, "graph endpoint node '%s' connection to '%s' is not bidir=
ectional",
> +		     node->fullpath, remote_node->fullpath);
> +}
> +WARNING(graph_endpoint, check_graph_endpoint, NULL, &graph_nodes);
> +
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -1429,6 +1566,8 @@ static struct check *check_table[] =3D {
> =20
>  	&alias_paths,
> =20
> +	&graph_nodes, &graph_child_address, &graph_port, &graph_endpoint,
> +
>  	&always_fail,
>  };
> =20
> diff --git a/tests/bad-graph.dts b/tests/bad-graph.dts
> new file mode 100644
> index 000000000000..522da0edbbc8
> --- /dev/null
> +++ b/tests/bad-graph.dts
> @@ -0,0 +1,24 @@
> +/dts-v1/;
> +
> +/ {
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		bad_endpoint: port-a@0 {
> +			reg =3D <0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			endpoint@d0 {
> +				reg =3D <0>;
> +				remote-endpoint =3D <0xdeadbeef>;
> +			};
> +
> +		};
> +
> +		port@1 {
> +			reg =3D <0>;
> +		};
> +	};
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 61c95f1fc899..87915ef4c9f9 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -561,6 +561,9 @@ dtc_tests () {
>      check_tests unit-addr-leading-0s.dts unit_address_format
>      check_tests bad-phandle-cells.dts interrupts_extended_property
>      check_tests bad-gpio.dts gpios_property
> +    check_tests bad-graph.dts graph_child_address
> +    check_tests bad-graph.dts graph_port
> +    check_tests bad-graph.dts graph_endpoint
>      run_sh_test dtc-checkfails.sh deprecated_gpio_property -- -Wdeprecat=
ed_gpio_property -I dts -O dtb bad-gpio.dts
>      check_tests bad-interrupt-cells.dts interrupts_property
>      run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_n=
ode_char.dtb

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8MZM6zh5Bb05FW+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlo4ncAACgkQbDjKyiDZ
s5KwDw//cBnIFY220RVUD2PYqYQ7+JdM/KqBSwQ9C2FZwrw+hYnfXTgdCnJaDFHY
cVF20/ZLPDl99TBWoCxhlrlp3Vc8HiQ43GhbZ6tl87251MMFyywczFDLQMZoYh+N
llxcHBD7MnaZLtnUor3vNE3yb6unmjNUeUOhsxzu9FyxtWwJmqLV+QF0hazqBVg+
50XsWjzCw52MsH/PMbLB8ZQKv0sOrLE4/bNvA2rooKbiPB9f7XpoyUgvw8ONnigN
0YOOoNWUE8Crxd8oKkZGwq6ICKFAmCAUnaSLPE2esya7OhKPemsyZuP2REWg9DEA
KOAPeviv48x4oauhsa1IBYOt37cWOSqV6fZCYmpcvGu4qpb1amYlHDZort7gTq5M
JwFFgazu+Eu6LPXnGOIivON9lbT6hDXczDrA0Ulryp2pcyCKluBub3M6r7/CXxHD
9LzkocyHq/M/rpvFJYLwyWbTMh+VECQliRu6btrZsdiEe46dX6oexWsD5bhthbf1
kGewUSlLnumHyP2Q4qO6t6rf6XHgSZOvvDajhfOhtqmKVQx5PnTb5T57r07LCkF2
mAHJEw4OtzZDQV09LA1rsEK8HsrVugbUKxRn0be35/6+vuMJtkYgjhN9vYeJLjEa
xNp3VL9wmXx19j9mO7rvBaUcNULzl9DteEsqhJRZNd0NjJvkZMc=
=A07/
-----END PGP SIGNATURE-----

--8MZM6zh5Bb05FW+3--
