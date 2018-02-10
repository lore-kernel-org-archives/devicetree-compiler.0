From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/3] checks: centralize printing of property names in
 failure messages
Date: Sat, 10 Feb 2018 12:09:33 +1100
Message-ID: <20180210010933.GK11634@umbus.fritz.box>
References: <20180131145705.21335-1-robh@kernel.org>
 <20180131145705.21335-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wRokNccIwvMzawGl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1518226093;
        bh=uq1qRCBRr63Hr7ikwzXOFCigG/kibpk/vpBCtehMkaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FHYklX5bYN8a0rvOEEtVV6+jo3QEMUyR7hjimbbdHnkdWPxq73ql8AsMb0iJJEiTc
         r5pXGLV0WYKO2nzLnVKYyFsFDyFLipbICFRHiMf8Unr+utz0eNAzBBhLKB23elpgIX
         LVATOACbsjL8d5zyvGJVgDbO5I/RTCc30886L0/Q=
Content-Disposition: inline
In-Reply-To: <20180131145705.21335-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--wRokNccIwvMzawGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2018 at 08:57:04AM -0600, Rob Herring wrote:
> Some failure messages apply to a specific property. Add a FAIL_PROP()
> macro for failure messages which are specific to a property. With that,
> failure messages can print the property name in a standard way. Once
> source line numbers are supported, then the file and line number of the
> property can be used instead of the node file and line number.
>=20
> Convert the existing messages related to properties to use the FAIL_PROP
> macro and reword the messages as necessary.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>  checks.c | 148 ++++++++++++++++++++++++++++++++++-----------------------=
------
>  1 file changed, 80 insertions(+), 68 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 54df014c1c79..c07ba4da9e36 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -72,8 +72,9 @@ struct check {
>  #define CHECK(nm_, fn_, d_, ...) \
>  	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> =20
> -static inline void  PRINTF(4, 5) check_msg(struct check *c, struct dt_in=
fo *dti,
> +static inline void  PRINTF(5, 6) check_msg(struct check *c, struct dt_in=
fo *dti,
>  					   struct node *node,
> +					   struct property *prop,
>  					   const char *fmt, ...)
>  {
>  	va_list ap;
> @@ -84,8 +85,12 @@ static inline void  PRINTF(4, 5) check_msg(struct chec=
k *c, struct dt_info *dti,
>  		fprintf(stderr, "%s: %s (%s): ",
>  			strcmp(dti->outname, "-") ? dti->outname : "<stdout>",
>  			(c->error) ? "ERROR" : "Warning", c->name);
> -		if (node)
> -			fprintf(stderr, "%s: ", node->fullpath);
> +		if (node) {
> +			fprintf(stderr, "%s", node->fullpath);
> +			if (prop)
> +				fprintf(stderr, ":%s", prop->name);
> +			fputs(": ", stderr);
> +		}
>  		vfprintf(stderr, fmt, ap);
>  		fprintf(stderr, "\n");
>  	}
> @@ -96,9 +101,17 @@ static inline void  PRINTF(4, 5) check_msg(struct che=
ck *c, struct dt_info *dti,
>  	do {								\
>  		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
>  		(c)->status =3D FAILED;					\
> -		check_msg((c), dti, node, __VA_ARGS__);			\
> +		check_msg((c), dti, node, NULL, __VA_ARGS__);		\
> +	} while (0)
> +
> +#define FAIL_PROP(c, dti, node, prop, ...)				\
> +	do {								\
> +		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
> +		(c)->status =3D FAILED;					\
> +		check_msg((c), dti, node, prop, __VA_ARGS__);		\
>  	} while (0)
> =20
> +
>  static void check_nodes_props(struct check *c, struct dt_info *dti, stru=
ct node *node)
>  {
>  	struct node *child;
> @@ -129,7 +142,7 @@ static bool run_check(struct check *c, struct dt_info=
 *dti)
>  		error =3D error || run_check(prq, dti);
>  		if (prq->status !=3D PASSED) {
>  			c->status =3D PREREQ;
> -			check_msg(c, dti, NULL, "Failed prerequisite '%s'",
> +			check_msg(c, dti, NULL, NULL, "Failed prerequisite '%s'",
>  				  c->prereq[i]->name);
>  		}
>  	}
> @@ -174,7 +187,7 @@ static void check_is_string(struct check *c, struct d=
t_info *dti,
>  		return; /* Not present, assumed ok */
> =20
>  	if (!data_is_one_string(prop->val))
> -		FAIL(c, dti, node, "\"%s\" property is not a string", propname);
> +		FAIL_PROP(c, dti, node, prop, "property is not a string");
>  }
>  #define WARNING_IF_NOT_STRING(nm, propname) \
>  	WARNING(nm, check_is_string, (propname))
> @@ -198,8 +211,7 @@ static void check_is_string_list(struct check *c, str=
uct dt_info *dti,
>  	while (rem > 0) {
>  		l =3D strnlen(str, rem);
>  		if (l =3D=3D rem) {
> -			FAIL(c, dti, node, "\"%s\" property is not a string list",
> -			     propname);
> +			FAIL_PROP(c, dti, node, prop, "property is not a string list");
>  			break;
>  		}
>  		rem -=3D l + 1;
> @@ -222,8 +234,7 @@ static void check_is_cell(struct check *c, struct dt_=
info *dti,
>  		return; /* Not present, assumed ok */
> =20
>  	if (prop->val.len !=3D sizeof(cell_t))
> -		FAIL(c, dti, node, "\"%s\" property is not a single cell",
> -		     propname);
> +		FAIL_PROP(c, dti, node, prop, "property is not a single cell");
>  }
>  #define WARNING_IF_NOT_CELL(nm, propname) \
>  	WARNING(nm, check_is_cell, (propname))
> @@ -258,8 +269,7 @@ static void check_duplicate_property_names(struct che=
ck *c, struct dt_info *dti,
>  			if (prop2->deleted)
>  				continue;
>  			if (streq(prop->name, prop2->name))
> -				FAIL(c, dti, node, "Duplicate property name %s",
> -				     prop->name);
> +				FAIL_PROP(c, dti, node, prop, "Duplicate property name");
>  		}
>  	}
>  }
> @@ -332,8 +342,8 @@ static void check_property_name_chars(struct check *c=
, struct dt_info *dti,
>  		int n =3D strspn(prop->name, c->data);
> =20
>  		if (n < strlen(prop->name))
> -			FAIL(c, dti, node, "Bad character '%c' in property name \"%s\"",
> -			     prop->name[n], prop->name);
> +			FAIL_PROP(c, dti, node, prop, "Bad character '%c' in property name",
> +				  prop->name[n]);
>  	}
>  }
>  ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
> @@ -364,8 +374,8 @@ static void check_property_name_chars_strict(struct c=
heck *c,
>  			n =3D strspn(name, c->data);
>  		}
>  		if (n < strlen(name))
> -			FAIL(c, dti, node, "Character '%c' not recommended in property name \=
"%s\"",
> -			     name[n], prop->name);
> +			FAIL_PROP(c, dti, node, prop, "Character '%c' not recommended in prop=
erty name",
> +				  name[n]);
>  	}
>  }
>  CHECK(property_name_chars_strict, check_property_name_chars_strict, PROP=
NODECHARSSTRICT);
> @@ -438,8 +448,8 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  		return 0;
> =20
>  	if (prop->val.len !=3D sizeof(cell_t)) {
> -		FAIL(c, dti, node, "bad length (%d) %s property",
> -		     prop->val.len, prop->name);
> +		FAIL_PROP(c, dti, node, prop, "bad length (%d) %s property",
> +			  prop->val.len, prop->name);
>  		return 0;
>  	}
> =20
> @@ -464,7 +474,7 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  	phandle =3D propval_cell(prop);
> =20
>  	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> -		FAIL(c, dti, node, "bad value (0x%x) in %s property",
> +		FAIL_PROP(c, dti, node, prop, "bad value (0x%x) in %s property",
>  		     phandle, prop->name);
>  		return 0;
>  	}
> @@ -644,14 +654,12 @@ static void check_alias_paths(struct check *c, stru=
ct dt_info *dti,
> =20
>  	for_each_property(node, prop) {
>  		if (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val)) {
> -			FAIL(c, dti, node, "aliases property '%s' is not a valid node (%s)",
> -			     prop->name, prop->val.val);
> +			FAIL_PROP(c, dti, node, prop, "aliases property is not a valid node (=
%s)",
> +				  prop->val.val);
>  			continue;
>  		}
>  		if (strspn(prop->name, LOWERCASE DIGITS "-") !=3D strlen(prop->name))
> -			FAIL(c, dti, node, "aliases property name '%s' is not valid",
> -			     prop->name);
> -
> +			FAIL(c, dti, node, "aliases property name must include only lowercase=
 and '-'");
>  	}
>  }
>  WARNING(alias_paths, check_alias_paths, NULL);
> @@ -696,16 +704,16 @@ static void check_reg_format(struct check *c, struc=
t dt_info *dti,
>  	}
> =20
>  	if (prop->val.len =3D=3D 0)
> -		FAIL(c, dti, node, "\"reg\" property is empty");
> +		FAIL_PROP(c, dti, node, prop, "property is empty");
> =20
>  	addr_cells =3D node_addr_cells(node->parent);
>  	size_cells =3D node_size_cells(node->parent);
>  	entrylen =3D (addr_cells + size_cells) * sizeof(cell_t);
> =20
>  	if (!entrylen || (prop->val.len % entrylen) !=3D 0)
> -		FAIL(c, dti, node, "\"reg\" property has invalid length (%d bytes) "
> -		     "(#address-cells =3D=3D %d, #size-cells =3D=3D %d)",
> -		     prop->val.len, addr_cells, size_cells);
> +		FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
> +			  "(#address-cells =3D=3D %d, #size-cells =3D=3D %d)",
> +			  prop->val.len, addr_cells, size_cells);
>  }
>  WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
> =20
> @@ -720,7 +728,7 @@ static void check_ranges_format(struct check *c, stru=
ct dt_info *dti,
>  		return;
> =20
>  	if (!node->parent) {
> -		FAIL(c, dti, node, "Root node has a \"ranges\" property");
> +		FAIL_PROP(c, dti, node, prop, "Root node has a \"ranges\" property");
>  		return;
>  	}
> =20
> @@ -732,20 +740,20 @@ static void check_ranges_format(struct check *c, st=
ruct dt_info *dti,
> =20
>  	if (prop->val.len =3D=3D 0) {
>  		if (p_addr_cells !=3D c_addr_cells)
> -			FAIL(c, dti, node, "empty \"ranges\" property but its "
> -			     "#address-cells (%d) differs from %s (%d)",
> -			     c_addr_cells, node->parent->fullpath,
> -			     p_addr_cells);
> +			FAIL_PROP(c, dti, node, prop, "empty \"ranges\" property but its "
> +				  "#address-cells (%d) differs from %s (%d)",
> +				  c_addr_cells, node->parent->fullpath,
> +				  p_addr_cells);
>  		if (p_size_cells !=3D c_size_cells)
> -			FAIL(c, dti, node, "empty \"ranges\" property but its "
> -			     "#size-cells (%d) differs from %s (%d)",
> -			     c_size_cells, node->parent->fullpath,
> -			     p_size_cells);
> +			FAIL_PROP(c, dti, node, prop, "empty \"ranges\" property but its "
> +				  "#size-cells (%d) differs from %s (%d)",
> +				  c_size_cells, node->parent->fullpath,
> +				  p_size_cells);
>  	} else if ((prop->val.len % entrylen) !=3D 0) {
> -		FAIL(c, dti, node, "\"ranges\" property has invalid length (%d bytes) "
> -		     "(parent #address-cells =3D=3D %d, child #address-cells =3D=3D %d=
, "
> -		     "#size-cells =3D=3D %d)", prop->val.len,
> -		     p_addr_cells, c_addr_cells, c_size_cells);
> +		FAIL_PROP(c, dti, node, prop, "\"ranges\" property has invalid length =
(%d bytes) "
> +			  "(parent #address-cells =3D=3D %d, child #address-cells =3D=3D %d, "
> +			  "#size-cells =3D=3D %d)", prop->val.len,
> +			  p_addr_cells, c_addr_cells, c_size_cells);
>  	}
>  }
>  WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
> @@ -784,14 +792,14 @@ static void check_pci_bridge(struct check *c, struc=
t dt_info *dti, struct node *
>  		return;
>  	}
>  	if (prop->val.len !=3D (sizeof(cell_t) * 2)) {
> -		FAIL(c, dti, node, "bus-range must be 2 cells");
> +		FAIL_PROP(c, dti, node, prop, "value must be 2 cells");
>  		return;
>  	}
>  	cells =3D (cell_t *)prop->val.val;
>  	if (fdt32_to_cpu(cells[0]) > fdt32_to_cpu(cells[1]))
> -		FAIL(c, dti, node, "bus-range 1st cell must be less than or equal to 2=
nd cell");
> +		FAIL_PROP(c, dti, node, prop, "1st cell must be less than or equal to =
2nd cell");
>  	if (fdt32_to_cpu(cells[1]) > 0xff)
> -		FAIL(c, dti, node, "bus-range maximum bus number must be less than 256=
");
> +		FAIL_PROP(c, dti, node, prop, "maximum bus number must be less than 25=
6");
>  }
>  WARNING(pci_bridge, check_pci_bridge, NULL,
>  	&device_type_is_string, &addr_size_cells);
> @@ -821,8 +829,8 @@ static void check_pci_device_bus_num(struct check *c,=
 struct dt_info *dti, struc
>  		max_bus =3D fdt32_to_cpu(cells[0]);
>  	}
>  	if ((bus_num < min_bus) || (bus_num > max_bus))
> -		FAIL(c, dti, node, "PCI bus number %d out of range, expected (%d - %d)=
",
> -		     bus_num, min_bus, max_bus);
> +		FAIL_PROP(c, dti, node, prop, "PCI bus number %d out of range, expecte=
d (%d - %d)",
> +			  bus_num, min_bus, max_bus);
>  }
>  WARNING(pci_device_bus_num, check_pci_device_bus_num, NULL, &reg_format,=
 &pci_bridge);
> =20
> @@ -845,16 +853,16 @@ static void check_pci_device_reg(struct check *c, s=
truct dt_info *dti, struct no
> =20
>  	cells =3D (cell_t *)prop->val.val;
>  	if (cells[1] || cells[2])
> -		FAIL(c, dti, node, "PCI reg config space address cells 2 and 3 must be=
 0");
> +		FAIL_PROP(c, dti, node, prop, "PCI reg config space address cells 2 an=
d 3 must be 0");
> =20
>  	reg =3D fdt32_to_cpu(cells[0]);
>  	dev =3D (reg & 0xf800) >> 11;
>  	func =3D (reg & 0x700) >> 8;
> =20
>  	if (reg & 0xff000000)
> -		FAIL(c, dti, node, "PCI reg address is not configuration space");
> +		FAIL_PROP(c, dti, node, prop, "PCI reg address is not configuration sp=
ace");
>  	if (reg & 0x000000ff)
> -		FAIL(c, dti, node, "PCI reg config space address register number must =
be 0");
> +		FAIL_PROP(c, dti, node, prop, "PCI reg config space address register n=
umber must be 0");
> =20
>  	if (func =3D=3D 0) {
>  		snprintf(unit_addr, sizeof(unit_addr), "%x", dev);
> @@ -1028,8 +1036,8 @@ static void check_obsolete_chosen_interrupt_control=
ler(struct check *c,
> =20
>  	prop =3D get_property(chosen, "interrupt-controller");
>  	if (prop)
> -		FAIL(c, dti, node, "/chosen has obsolete \"interrupt-controller\" "
> -		     "property");
> +		FAIL_PROP(c, dti, node, prop,
> +			  "/chosen has obsolete \"interrupt-controller\" property");
>  }
>  WARNING(obsolete_chosen_interrupt_controller,
>  	check_obsolete_chosen_interrupt_controller, NULL);
> @@ -1075,7 +1083,7 @@ static void check_chosen_node_stdout_path(struct ch=
eck *c, struct dt_info *dti,
>  		prop =3D get_property(node, "linux,stdout-path");
>  		if (!prop)
>  			return;
> -		FAIL(c, dti, node, "Use 'stdout-path' instead of 'linux,stdout-path'");
> +		FAIL_PROP(c, dti, node, prop, "Use 'stdout-path' instead");
>  	}
> =20
>  	c->data =3D prop->name;
> @@ -1099,8 +1107,9 @@ static void check_property_phandle_args(struct chec=
k *c,
>  	int cell, cellsize =3D 0;
> =20
>  	if (prop->val.len % sizeof(cell_t)) {
> -		FAIL(c, dti, node, "property '%s' size (%d) is invalid, expected multi=
ple of %zu",
> -		     prop->name, prop->val.len, sizeof(cell_t));
> +		FAIL_PROP(c, dti, node, prop,
> +			  "property size (%d) is invalid, expected multiple of %zu",
> +			  prop->val.len, sizeof(cell_t));
>  		return;
>  	}
> =20
> @@ -1131,14 +1140,16 @@ static void check_property_phandle_args(struct ch=
eck *c,
>  					break;
>  			}
>  			if (!m)
> -				FAIL(c, dti, node, "Property '%s', cell %d is not a phandle referenc=
e",
> -				     prop->name, cell);
> +				FAIL_PROP(c, dti, node, prop,
> +					  "cell %d is not a phandle reference",
> +					  cell);
>  		}
> =20
>  		provider_node =3D get_node_by_phandle(root, phandle);
>  		if (!provider_node) {
> -			FAIL(c, dti, node, "Could not get phandle node for %s(cell %d)",
> -			     prop->name, cell);
> +			FAIL_PROP(c, dti, node, prop,
> +				  "Could not get phandle node for (cell %d)",
> +				  cell);
>  			break;
>  		}
> =20
> @@ -1156,8 +1167,9 @@ static void check_property_phandle_args(struct chec=
k *c,
>  		}
> =20
>  		if (prop->val.len < ((cell + cellsize + 1) * sizeof(cell_t))) {
> -			FAIL(c, dti, node, "%s property size (%d) too small for cell size %d",
> -			     prop->name, prop->val.len, cellsize);
> +			FAIL_PROP(c, dti, node, prop,
> +				  "property size (%d) too small for cell size %d",
> +				  prop->val.len, cellsize);
>  		}
>  	}
>  }
> @@ -1259,8 +1271,8 @@ static void check_deprecated_gpio_property(struct c=
heck *c,
>  		if (!streq(str, "gpio"))
>  			continue;
> =20
> -		FAIL(c, dti, node, "'[*-]gpio' is deprecated, use '[*-]gpios' instead =
for %s",
> -		     prop->name);
> +		FAIL_PROP(c, dti, node, prop,
> +			  "'[*-]gpio' is deprecated, use '[*-]gpios' instead");
>  	}
> =20
>  }
> @@ -1294,8 +1306,8 @@ static void check_interrupts_property(struct check =
*c,
>  		return;
> =20
>  	if (irq_prop->val.len % sizeof(cell_t))
> -		FAIL(c, dti, node, "property '%s' size (%d) is invalid, expected multi=
ple of %zu",
> -		     irq_prop->name, irq_prop->val.len, sizeof(cell_t));
> +		FAIL_PROP(c, dti, node, irq_prop, "size (%d) is invalid, expected mult=
iple of %zu",
> +		     irq_prop->val.len, sizeof(cell_t));
> =20
>  	while (parent && !prop) {
>  		if (parent !=3D node && node_is_interrupt_provider(parent)) {
> @@ -1313,7 +1325,7 @@ static void check_interrupts_property(struct check =
*c,
> =20
>  			irq_node =3D get_node_by_phandle(root, phandle);
>  			if (!irq_node) {
> -				FAIL(c, dti, node, "Bad interrupt-parent phandle");
> +				FAIL_PROP(c, dti, parent, prop, "Bad phandle");
>  				return;
>  			}
>  			if (!node_is_interrupt_provider(irq_node))
> @@ -1339,9 +1351,9 @@ static void check_interrupts_property(struct check =
*c,
> =20
>  	irq_cells =3D propval_cell(prop);
>  	if (irq_prop->val.len % (irq_cells * sizeof(cell_t))) {
> -		FAIL(c, dti, node,
> -		     "interrupts size is (%d), expected multiple of %d",
> -		     irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
> +		FAIL_PROP(c, dti, node, prop,
> +			  "size is (%d), expected multiple of %d",
> +			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
>  	}
>  }
>  WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wRokNccIwvMzawGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlp+RksACgkQbDjKyiDZ
s5LZnxAAn3Dkf0rwpq+M4eMR9xVRDoGfMkJablJpsPxmb8q5YUmXLOsHpKf+TL1U
kj253lAF6nmzI/U6CG5Ea3SkWzwVRA9luyBlnsnPdz5IKz0j70huA+UrvXxDnU6U
eBtP1opaQLqSQA4+B6Xv9mWnY4FVRxhOHXd4Uw5JZF5FtAbWLuiJKHFrWjTXGpuE
9yYXDMa/+64A6F3ZOzY5mkUWrYnLTjRIYsIRH71SJPE1gMpg+xE9aSHLp21GhOUn
eLjX7l9t1ExMZr1icRFmUKhChSV+OFLIZT7VFottjQtXtxVU4YhcUKYbCxV1YX8B
H+LuOK+q4ldtpeGIqUUwjucJjpY79cUDuYvxHMh2UFMH5q8jCpwcIKwEghtQDxjd
ACMc2Z1o+Ic0dWRFPAn5EVW1Q/qR8CupXQWjp8G/BwPEgoF1kT8lioaXbAK3Bx8P
1qmVBD/WeF6gYsnZtf4J5VX0V52utLDO06yeEIaexhAQNoIUI9+dJSE4lYq5/fBH
zus77yX+F0q+O3PtmpFsHKtb78QKKr/5rgFfFmbt4nEY7GuoeDzNqKy4/D7+hqoZ
/P8hnjwfDJEVjjdV6IllvOdc4veAXl15Re4XlbcyerpL82kLEE8WzMs02e5J46R5
gs0FoqyHYO1E2atVB+tEg3tDZseNjBH9nbqzDXHgJYm9NB9/rvM=
=Q+o5
-----END PGP SIGNATURE-----

--wRokNccIwvMzawGl--
