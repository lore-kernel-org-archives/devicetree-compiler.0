From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] checks: centralize printing of node path in check_msg
Date: Fri, 9 Feb 2018 17:53:18 +1100
Message-ID: <20180209065318.GI11634@umbus.fritz.box>
References: <20180131145705.21335-1-robh@kernel.org>
 <20180131145705.21335-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mhOzvPhkurUs4vA9"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1518159330;
        bh=qllLF8dwXzmFQW4wN6DmEXQtzjwIxo3JsUys478K7Lk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nzP93EqhpvBotKTjOOWxQ/aPsvtXpeqHh3j185f1AeE1WG2QpLk5JJthjsTgkH6G4
         CAu1QvY5d2Fc2s50+otxX+CG/Dw38l1k/x5J1V+74db2h+EKwux3t6z1eiNLQF6nWF
         fjGUJvSzY96SfwkYtUVcfR03L/mqBnFC6O9uCNSk=
Content-Disposition: inline
In-Reply-To: <20180131145705.21335-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--mhOzvPhkurUs4vA9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2018 at 08:57:03AM -0600, Rob Herring wrote:
> Most error/warning messages print the node path as part of their error
> message. Move printing of the node path into check_msg() so the
> formatting can be standardized to the form:
>=20
> <output file>: (ERROR|warning) (<check name>): <full node name>: <check m=
essage>
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>  checks.c | 232 ++++++++++++++++++++++++++++-----------------------------=
------
>  1 file changed, 104 insertions(+), 128 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 1cded3658491..54df014c1c79 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -72,7 +72,8 @@ struct check {
>  #define CHECK(nm_, fn_, d_, ...) \
>  	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> =20
> -static inline void  PRINTF(3, 4) check_msg(struct check *c, struct dt_in=
fo *dti,
> +static inline void  PRINTF(4, 5) check_msg(struct check *c, struct dt_in=
fo *dti,
> +					   struct node *node,
>  					   const char *fmt, ...)
>  {
>  	va_list ap;
> @@ -83,17 +84,19 @@ static inline void  PRINTF(3, 4) check_msg(struct che=
ck *c, struct dt_info *dti,
>  		fprintf(stderr, "%s: %s (%s): ",
>  			strcmp(dti->outname, "-") ? dti->outname : "<stdout>",
>  			(c->error) ? "ERROR" : "Warning", c->name);
> +		if (node)
> +			fprintf(stderr, "%s: ", node->fullpath);
>  		vfprintf(stderr, fmt, ap);
>  		fprintf(stderr, "\n");
>  	}
>  	va_end(ap);
>  }
> =20
> -#define FAIL(c, dti, ...)						\
> +#define FAIL(c, dti, node, ...)						\
>  	do {								\
>  		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
>  		(c)->status =3D FAILED;					\
> -		check_msg((c), dti, __VA_ARGS__);			\
> +		check_msg((c), dti, node, __VA_ARGS__);			\
>  	} while (0)
> =20
>  static void check_nodes_props(struct check *c, struct dt_info *dti, stru=
ct node *node)
> @@ -126,7 +129,7 @@ static bool run_check(struct check *c, struct dt_info=
 *dti)
>  		error =3D error || run_check(prq, dti);
>  		if (prq->status !=3D PASSED) {
>  			c->status =3D PREREQ;
> -			check_msg(c, dti, "Failed prerequisite '%s'",
> +			check_msg(c, dti, NULL, "Failed prerequisite '%s'",
>  				  c->prereq[i]->name);
>  		}
>  	}
> @@ -156,7 +159,7 @@ out:
>  static inline void check_always_fail(struct check *c, struct dt_info *dt=
i,
>  				     struct node *node)
>  {
> -	FAIL(c, dti, "always_fail check");
> +	FAIL(c, dti, node, "always_fail check");
>  }
>  CHECK(always_fail, check_always_fail, NULL);
> =20
> @@ -171,8 +174,7 @@ static void check_is_string(struct check *c, struct d=
t_info *dti,
>  		return; /* Not present, assumed ok */
> =20
>  	if (!data_is_one_string(prop->val))
> -		FAIL(c, dti, "\"%s\" property in %s is not a string",
> -		     propname, node->fullpath);
> +		FAIL(c, dti, node, "\"%s\" property is not a string", propname);
>  }
>  #define WARNING_IF_NOT_STRING(nm, propname) \
>  	WARNING(nm, check_is_string, (propname))
> @@ -196,8 +198,8 @@ static void check_is_string_list(struct check *c, str=
uct dt_info *dti,
>  	while (rem > 0) {
>  		l =3D strnlen(str, rem);
>  		if (l =3D=3D rem) {
> -			FAIL(c, dti, "\"%s\" property in %s is not a string list",
> -			     propname, node->fullpath);
> +			FAIL(c, dti, node, "\"%s\" property is not a string list",
> +			     propname);
>  			break;
>  		}
>  		rem -=3D l + 1;
> @@ -220,8 +222,8 @@ static void check_is_cell(struct check *c, struct dt_=
info *dti,
>  		return; /* Not present, assumed ok */
> =20
>  	if (prop->val.len !=3D sizeof(cell_t))
> -		FAIL(c, dti, "\"%s\" property in %s is not a single cell",
> -		     propname, node->fullpath);
> +		FAIL(c, dti, node, "\"%s\" property is not a single cell",
> +		     propname);
>  }
>  #define WARNING_IF_NOT_CELL(nm, propname) \
>  	WARNING(nm, check_is_cell, (propname))
> @@ -242,8 +244,7 @@ static void check_duplicate_node_names(struct check *=
c, struct dt_info *dti,
>  		     child2;
>  		     child2 =3D child2->next_sibling)
>  			if (streq(child->name, child2->name))
> -				FAIL(c, dti, "Duplicate node name %s",
> -				     child->fullpath);
> +				FAIL(c, dti, node, "Duplicate node name");
>  }
>  ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
> =20
> @@ -257,8 +258,8 @@ static void check_duplicate_property_names(struct che=
ck *c, struct dt_info *dti,
>  			if (prop2->deleted)
>  				continue;
>  			if (streq(prop->name, prop2->name))
> -				FAIL(c, dti, "Duplicate property name %s in %s",
> -				     prop->name, node->fullpath);
> +				FAIL(c, dti, node, "Duplicate property name %s",
> +				     prop->name);
>  		}
>  	}
>  }
> @@ -276,8 +277,8 @@ static void check_node_name_chars(struct check *c, st=
ruct dt_info *dti,
>  	int n =3D strspn(node->name, c->data);
> =20
>  	if (n < strlen(node->name))
> -		FAIL(c, dti, "Bad character '%c' in node %s",
> -		     node->name[n], node->fullpath);
> +		FAIL(c, dti, node, "Bad character '%c' in node name",
> +		     node->name[n]);
>  }
>  ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
> =20
> @@ -287,8 +288,8 @@ static void check_node_name_chars_strict(struct check=
 *c, struct dt_info *dti,
>  	int n =3D strspn(node->name, c->data);
> =20
>  	if (n < node->basenamelen)
> -		FAIL(c, dti, "Character '%c' not recommended in node %s",
> -		     node->name[n], node->fullpath);
> +		FAIL(c, dti, node, "Character '%c' not recommended in node name",
> +		     node->name[n]);
>  }
>  CHECK(node_name_chars_strict, check_node_name_chars_strict, PROPNODECHAR=
SSTRICT);
> =20
> @@ -296,8 +297,7 @@ static void check_node_name_format(struct check *c, s=
truct dt_info *dti,
>  				   struct node *node)
>  {
>  	if (strchr(get_unitname(node), '@'))
> -		FAIL(c, dti, "Node %s has multiple '@' characters in name",
> -		     node->fullpath);
> +		FAIL(c, dti, node, "multiple '@' characters in node name");
>  }
>  ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
> =20
> @@ -315,12 +315,10 @@ static void check_unit_address_vs_reg(struct check =
*c, struct dt_info *dti,
> =20
>  	if (prop) {
>  		if (!unitname[0])
> -			FAIL(c, dti, "Node %s has a reg or ranges property, but no unit name",
> -			    node->fullpath);
> +			FAIL(c, dti, node, "node has a reg or ranges property, but no unit na=
me");
>  	} else {
>  		if (unitname[0])
> -			FAIL(c, dti, "Node %s has a unit name, but no reg property",
> -			    node->fullpath);
> +			FAIL(c, dti, node, "node has a unit name, but no reg property");
>  	}
>  }
>  WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
> @@ -334,8 +332,8 @@ static void check_property_name_chars(struct check *c=
, struct dt_info *dti,
>  		int n =3D strspn(prop->name, c->data);
> =20
>  		if (n < strlen(prop->name))
> -			FAIL(c, dti, "Bad character '%c' in property name \"%s\", node %s",
> -			     prop->name[n], prop->name, node->fullpath);
> +			FAIL(c, dti, node, "Bad character '%c' in property name \"%s\"",
> +			     prop->name[n], prop->name);
>  	}
>  }
>  ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
> @@ -366,8 +364,8 @@ static void check_property_name_chars_strict(struct c=
heck *c,
>  			n =3D strspn(name, c->data);
>  		}
>  		if (n < strlen(name))
> -			FAIL(c, dti, "Character '%c' not recommended in property name \"%s\",=
 node %s",
> -			     name[n], prop->name, node->fullpath);
> +			FAIL(c, dti, node, "Character '%c' not recommended in property name \=
"%s\"",
> +			     name[n], prop->name);
>  	}
>  }
>  CHECK(property_name_chars_strict, check_property_name_chars_strict, PROP=
NODECHARSSTRICT);
> @@ -400,7 +398,7 @@ static void check_duplicate_label(struct check *c, st=
ruct dt_info *dti,
>  		return;
> =20
>  	if ((othernode !=3D node) || (otherprop !=3D prop) || (othermark !=3D m=
ark))
> -		FAIL(c, dti, "Duplicate label '%s' on " DESCLABEL_FMT
> +		FAIL(c, dti, node, "Duplicate label '%s' on " DESCLABEL_FMT
>  		     " and " DESCLABEL_FMT,
>  		     label, DESCLABEL_ARGS(node, prop, mark),
>  		     DESCLABEL_ARGS(othernode, otherprop, othermark));
> @@ -440,8 +438,8 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  		return 0;
> =20
>  	if (prop->val.len !=3D sizeof(cell_t)) {
> -		FAIL(c, dti, "%s has bad length (%d) %s property",
> -		     node->fullpath, prop->val.len, prop->name);
> +		FAIL(c, dti, node, "bad length (%d) %s property",
> +		     prop->val.len, prop->name);
>  		return 0;
>  	}
> =20
> @@ -452,8 +450,8 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  			/* "Set this node's phandle equal to some
>  			 * other node's phandle".  That's nonsensical
>  			 * by construction. */ {
> -			FAIL(c, dti, "%s in %s is a reference to another node",
> -			     prop->name, node->fullpath);
> +			FAIL(c, dti, node, "%s is a reference to another node",
> +			     prop->name);
>  		}
>  		/* But setting this node's phandle equal to its own
>  		 * phandle is allowed - that means allocate a unique
> @@ -466,8 +464,8 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  	phandle =3D propval_cell(prop);
> =20
>  	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> -		FAIL(c, dti, "%s has bad value (0x%x) in %s property",
> -		     node->fullpath, phandle, prop->name);
> +		FAIL(c, dti, node, "bad value (0x%x) in %s property",
> +		     phandle, prop->name);
>  		return 0;
>  	}
> =20
> @@ -493,16 +491,16 @@ static void check_explicit_phandles(struct check *c=
, struct dt_info *dti,
>  		return;
> =20
>  	if (linux_phandle && phandle && (phandle !=3D linux_phandle))
> -		FAIL(c, dti, "%s has mismatching 'phandle' and 'linux,phandle'"
> -		     " properties", node->fullpath);
> +		FAIL(c, dti, node, "mismatching 'phandle' and 'linux,phandle'"
> +		     " properties");
> =20
>  	if (linux_phandle && !phandle)
>  		phandle =3D linux_phandle;
> =20
>  	other =3D get_node_by_phandle(root, phandle);
>  	if (other && (other !=3D node)) {
> -		FAIL(c, dti, "%s has duplicated phandle 0x%x (seen before at %s)",
> -		     node->fullpath, phandle, other->fullpath);
> +		FAIL(c, dti, node, "duplicated phandle 0x%x (seen before at %s)",
> +		     phandle, other->fullpath);
>  		return;
>  	}
> =20
> @@ -526,8 +524,8 @@ static void check_name_properties(struct check *c, st=
ruct dt_info *dti,
> =20
>  	if ((prop->val.len !=3D node->basenamelen+1)
>  	    || (memcmp(prop->val.val, node->name, node->basenamelen) !=3D 0)) {
> -		FAIL(c, dti, "\"name\" property in %s is incorrect (\"%s\" instead"
> -		     " of base node name)", node->fullpath, prop->val.val);
> +		FAIL(c, dti, node, "\"name\" property is incorrect (\"%s\" instead"
> +		     " of base node name)", prop->val.val);
>  	} else {
>  		/* The name property is correct, and therefore redundant.
>  		 * Delete it */
> @@ -561,7 +559,7 @@ static void fixup_phandle_references(struct check *c,=
 struct dt_info *dti,
>  			refnode =3D get_node_by_ref(dt, m->ref);
>  			if (! refnode) {
>  				if (!(dti->dtsflags & DTSF_PLUGIN))
> -					FAIL(c, dti, "Reference to non-existent node or "
> +					FAIL(c, dti, node, "Reference to non-existent node or "
>  							"label \"%s\"\n", m->ref);
>  				else /* mark the entry as unresolved */
>  					*((fdt32_t *)(prop->val.val + m->offset)) =3D
> @@ -593,7 +591,7 @@ static void fixup_path_references(struct check *c, st=
ruct dt_info *dti,
> =20
>  			refnode =3D get_node_by_ref(dt, m->ref);
>  			if (!refnode) {
> -				FAIL(c, dti, "Reference to non-existent node or label \"%s\"\n",
> +				FAIL(c, dti, node, "Reference to non-existent node or label \"%s\"\n=
",
>  				     m->ref);
>  				continue;
>  			}
> @@ -646,12 +644,12 @@ static void check_alias_paths(struct check *c, stru=
ct dt_info *dti,
> =20
>  	for_each_property(node, prop) {
>  		if (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val)) {
> -			FAIL(c, dti, "aliases property '%s' is not a valid node (%s)",
> +			FAIL(c, dti, node, "aliases property '%s' is not a valid node (%s)",
>  			     prop->name, prop->val.val);
>  			continue;
>  		}
>  		if (strspn(prop->name, LOWERCASE DIGITS "-") !=3D strlen(prop->name))
> -			FAIL(c, dti, "aliases property name '%s' is not valid",
> +			FAIL(c, dti, node, "aliases property name '%s' is not valid",
>  			     prop->name);
> =20
>  	}
> @@ -693,21 +691,21 @@ static void check_reg_format(struct check *c, struc=
t dt_info *dti,
>  		return; /* No "reg", that's fine */
> =20
>  	if (!node->parent) {
> -		FAIL(c, dti, "Root node has a \"reg\" property");
> +		FAIL(c, dti, node, "Root node has a \"reg\" property");
>  		return;
>  	}
> =20
>  	if (prop->val.len =3D=3D 0)
> -		FAIL(c, dti, "\"reg\" property in %s is empty", node->fullpath);
> +		FAIL(c, dti, node, "\"reg\" property is empty");
> =20
>  	addr_cells =3D node_addr_cells(node->parent);
>  	size_cells =3D node_size_cells(node->parent);
>  	entrylen =3D (addr_cells + size_cells) * sizeof(cell_t);
> =20
>  	if (!entrylen || (prop->val.len % entrylen) !=3D 0)
> -		FAIL(c, dti, "\"reg\" property in %s has invalid length (%d bytes) "
> +		FAIL(c, dti, node, "\"reg\" property has invalid length (%d bytes) "
>  		     "(#address-cells =3D=3D %d, #size-cells =3D=3D %d)",
> -		     node->fullpath, prop->val.len, addr_cells, size_cells);
> +		     prop->val.len, addr_cells, size_cells);
>  }
>  WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
> =20
> @@ -722,7 +720,7 @@ static void check_ranges_format(struct check *c, stru=
ct dt_info *dti,
>  		return;
> =20
>  	if (!node->parent) {
> -		FAIL(c, dti, "Root node has a \"ranges\" property");
> +		FAIL(c, dti, node, "Root node has a \"ranges\" property");
>  		return;
>  	}
> =20
> @@ -734,19 +732,19 @@ static void check_ranges_format(struct check *c, st=
ruct dt_info *dti,
> =20
>  	if (prop->val.len =3D=3D 0) {
>  		if (p_addr_cells !=3D c_addr_cells)
> -			FAIL(c, dti, "%s has empty \"ranges\" property but its "
> +			FAIL(c, dti, node, "empty \"ranges\" property but its "
>  			     "#address-cells (%d) differs from %s (%d)",
> -			     node->fullpath, c_addr_cells, node->parent->fullpath,
> +			     c_addr_cells, node->parent->fullpath,
>  			     p_addr_cells);
>  		if (p_size_cells !=3D c_size_cells)
> -			FAIL(c, dti, "%s has empty \"ranges\" property but its "
> +			FAIL(c, dti, node, "empty \"ranges\" property but its "
>  			     "#size-cells (%d) differs from %s (%d)",
> -			     node->fullpath, c_size_cells, node->parent->fullpath,
> +			     c_size_cells, node->parent->fullpath,
>  			     p_size_cells);
>  	} else if ((prop->val.len % entrylen) !=3D 0) {
> -		FAIL(c, dti, "\"ranges\" property in %s has invalid length (%d bytes) "
> +		FAIL(c, dti, node, "\"ranges\" property has invalid length (%d bytes) "
>  		     "(parent #address-cells =3D=3D %d, child #address-cells =3D=3D %d=
, "
> -		     "#size-cells =3D=3D %d)", node->fullpath, prop->val.len,
> +		     "#size-cells =3D=3D %d)", prop->val.len,
>  		     p_addr_cells, c_addr_cells, c_size_cells);
>  	}
>  }
> @@ -769,39 +767,31 @@ static void check_pci_bridge(struct check *c, struc=
t dt_info *dti, struct node *
> =20
>  	if (!strprefixeq(node->name, node->basenamelen, "pci") &&
>  	    !strprefixeq(node->name, node->basenamelen, "pcie"))
> -		FAIL(c, dti, "Node %s node name is not \"pci\" or \"pcie\"",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "node name is not \"pci\" or \"pcie\"");
> =20
>  	prop =3D get_property(node, "ranges");
>  	if (!prop)
> -		FAIL(c, dti, "Node %s missing ranges for PCI bridge (or not a bridge)",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "missing ranges for PCI bridge (or not a bridge)");
> =20
>  	if (node_addr_cells(node) !=3D 3)
> -		FAIL(c, dti, "Node %s incorrect #address-cells for PCI bridge",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "incorrect #address-cells for PCI bridge");
>  	if (node_size_cells(node) !=3D 2)
> -		FAIL(c, dti, "Node %s incorrect #size-cells for PCI bridge",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "incorrect #size-cells for PCI bridge");
> =20
>  	prop =3D get_property(node, "bus-range");
>  	if (!prop) {
> -		FAIL(c, dti, "Node %s missing bus-range for PCI bridge",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "missing bus-range for PCI bridge");
>  		return;
>  	}
>  	if (prop->val.len !=3D (sizeof(cell_t) * 2)) {
> -		FAIL(c, dti, "Node %s bus-range must be 2 cells",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "bus-range must be 2 cells");
>  		return;
>  	}
>  	cells =3D (cell_t *)prop->val.val;
>  	if (fdt32_to_cpu(cells[0]) > fdt32_to_cpu(cells[1]))
> -		FAIL(c, dti, "Node %s bus-range 1st cell must be less than or equal to=
 2nd cell",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "bus-range 1st cell must be less than or equal to 2=
nd cell");
>  	if (fdt32_to_cpu(cells[1]) > 0xff)
> -		FAIL(c, dti, "Node %s bus-range maximum bus number must be less than 2=
56",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "bus-range maximum bus number must be less than 256=
");
>  }
>  WARNING(pci_bridge, check_pci_bridge, NULL,
>  	&device_type_is_string, &addr_size_cells);
> @@ -831,8 +821,8 @@ static void check_pci_device_bus_num(struct check *c,=
 struct dt_info *dti, struc
>  		max_bus =3D fdt32_to_cpu(cells[0]);
>  	}
>  	if ((bus_num < min_bus) || (bus_num > max_bus))
> -		FAIL(c, dti, "Node %s PCI bus number %d out of range, expected (%d - %=
d)",
> -		     node->fullpath, bus_num, min_bus, max_bus);
> +		FAIL(c, dti, node, "PCI bus number %d out of range, expected (%d - %d)=
",
> +		     bus_num, min_bus, max_bus);
>  }
>  WARNING(pci_device_bus_num, check_pci_device_bus_num, NULL, &reg_format,=
 &pci_bridge);
> =20
> @@ -849,25 +839,22 @@ static void check_pci_device_reg(struct check *c, s=
truct dt_info *dti, struct no
> =20
>  	prop =3D get_property(node, "reg");
>  	if (!prop) {
> -		FAIL(c, dti, "Node %s missing PCI reg property", node->fullpath);
> +		FAIL(c, dti, node, "missing PCI reg property");
>  		return;
>  	}
> =20
>  	cells =3D (cell_t *)prop->val.val;
>  	if (cells[1] || cells[2])
> -		FAIL(c, dti, "Node %s PCI reg config space address cells 2 and 3 must =
be 0",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "PCI reg config space address cells 2 and 3 must be=
 0");
> =20
>  	reg =3D fdt32_to_cpu(cells[0]);
>  	dev =3D (reg & 0xf800) >> 11;
>  	func =3D (reg & 0x700) >> 8;
> =20
>  	if (reg & 0xff000000)
> -		FAIL(c, dti, "Node %s PCI reg address is not configuration space",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "PCI reg address is not configuration space");
>  	if (reg & 0x000000ff)
> -		FAIL(c, dti, "Node %s PCI reg config space address register number mus=
t be 0",
> -			     node->fullpath);
> +		FAIL(c, dti, node, "PCI reg config space address register number must =
be 0");
> =20
>  	if (func =3D=3D 0) {
>  		snprintf(unit_addr, sizeof(unit_addr), "%x", dev);
> @@ -879,8 +866,8 @@ static void check_pci_device_reg(struct check *c, str=
uct dt_info *dti, struct no
>  	if (streq(unitname, unit_addr))
>  		return;
> =20
> -	FAIL(c, dti, "Node %s PCI unit address format error, expected \"%s\"",
> -	     node->fullpath, unit_addr);
> +	FAIL(c, dti, node, "PCI unit address format error, expected \"%s\"",
> +	     unit_addr);
>  }
>  WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format, &pci_br=
idge);
> =20
> @@ -936,7 +923,7 @@ static void check_simple_bus_reg(struct check *c, str=
uct dt_info *dti, struct no
> =20
>  	if (!cells) {
>  		if (node->parent->parent && !(node->bus =3D=3D &simple_bus))
> -			FAIL(c, dti, "Node %s missing or empty reg/ranges property", node->fu=
llpath);
> +			FAIL(c, dti, node, "missing or empty reg/ranges property");
>  		return;
>  	}
> =20
> @@ -946,8 +933,8 @@ static void check_simple_bus_reg(struct check *c, str=
uct dt_info *dti, struct no
> =20
>  	snprintf(unit_addr, sizeof(unit_addr), "%"PRIx64, reg);
>  	if (!streq(unitname, unit_addr))
> -		FAIL(c, dti, "Node %s simple-bus unit address format error, expected \=
"%s\"",
> -		     node->fullpath, unit_addr);
> +		FAIL(c, dti, node, "simple-bus unit address format error, expected \"%=
s\"",
> +		     unit_addr);
>  }
>  WARNING(simple_bus_reg, check_simple_bus_reg, NULL, &reg_format, &simple=
_bus_bridge);
> =20
> @@ -963,14 +950,12 @@ static void check_unit_address_format(struct check =
*c, struct dt_info *dti,
>  		return;
> =20
>  	if (!strncmp(unitname, "0x", 2)) {
> -		FAIL(c, dti, "Node %s unit name should not have leading \"0x\"",
> -		    node->fullpath);
> +		FAIL(c, dti, node, "unit name should not have leading \"0x\"");
>  		/* skip over 0x for next test */
>  		unitname +=3D 2;
>  	}
>  	if (unitname[0] =3D=3D '0' && isxdigit(unitname[1]))
> -		FAIL(c, dti, "Node %s unit name should not have leading 0s",
> -		    node->fullpath);
> +		FAIL(c, dti, node, "unit name should not have leading 0s");
>  }
>  WARNING(unit_address_format, check_unit_address_format, NULL,
>  	&node_name_format, &pci_bridge, &simple_bus_bridge);
> @@ -993,12 +978,10 @@ static void check_avoid_default_addr_size(struct ch=
eck *c, struct dt_info *dti,
>  		return;
> =20
>  	if (node->parent->addr_cells =3D=3D -1)
> -		FAIL(c, dti, "Relying on default #address-cells value for %s",
> -		     node->fullpath);
> +		FAIL(c, dti, node, "Relying on default #address-cells value");
> =20
>  	if (node->parent->size_cells =3D=3D -1)
> -		FAIL(c, dti, "Relying on default #size-cells value for %s",
> -		     node->fullpath);
> +		FAIL(c, dti, node, "Relying on default #size-cells value");
>  }
>  WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
>  	&addr_size_cells);
> @@ -1023,8 +1006,7 @@ static void check_avoid_unnecessary_addr_size(struc=
t check *c, struct dt_info *d
>  	}
> =20
>  	if (!has_reg)
> -		FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\=
" or child \"reg\" property in %s",
> -		     node->fullpath);
> +		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"r=
anges\" or child \"reg\" property");
>  }
>  WARNING(avoid_unnecessary_addr_size, check_avoid_unnecessary_addr_size, =
NULL, &avoid_default_addr_size);
> =20
> @@ -1046,7 +1028,7 @@ static void check_obsolete_chosen_interrupt_control=
ler(struct check *c,
> =20
>  	prop =3D get_property(chosen, "interrupt-controller");
>  	if (prop)
> -		FAIL(c, dti, "/chosen has obsolete \"interrupt-controller\" "
> +		FAIL(c, dti, node, "/chosen has obsolete \"interrupt-controller\" "
>  		     "property");
>  }
>  WARNING(obsolete_chosen_interrupt_controller,
> @@ -1059,8 +1041,7 @@ static void check_chosen_node_is_root(struct check =
*c, struct dt_info *dti,
>  		return;
> =20
>  	if (node->parent !=3D dti->dt)
> -		FAIL(c, dti, "chosen node '%s' must be at root node",
> -		     node->fullpath);
> +		FAIL(c, dti, node, "chosen node must be at root node");
>  }
>  WARNING(chosen_node_is_root, check_chosen_node_is_root, NULL);
> =20
> @@ -1094,7 +1075,7 @@ static void check_chosen_node_stdout_path(struct ch=
eck *c, struct dt_info *dti,
>  		prop =3D get_property(node, "linux,stdout-path");
>  		if (!prop)
>  			return;
> -		FAIL(c, dti, "Use 'stdout-path' instead of 'linux,stdout-path'");
> +		FAIL(c, dti, node, "Use 'stdout-path' instead of 'linux,stdout-path'");
>  	}
> =20
>  	c->data =3D prop->name;
> @@ -1118,8 +1099,8 @@ static void check_property_phandle_args(struct chec=
k *c,
>  	int cell, cellsize =3D 0;
> =20
>  	if (prop->val.len % sizeof(cell_t)) {
> -		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of=
 %zu in node %s",
> -		     prop->name, prop->val.len, sizeof(cell_t), node->fullpath);
> +		FAIL(c, dti, node, "property '%s' size (%d) is invalid, expected multi=
ple of %zu",
> +		     prop->name, prop->val.len, sizeof(cell_t));
>  		return;
>  	}
> =20
> @@ -1150,14 +1131,14 @@ static void check_property_phandle_args(struct ch=
eck *c,
>  					break;
>  			}
>  			if (!m)
> -				FAIL(c, dti, "Property '%s', cell %d is not a phandle reference in %=
s",
> -				     prop->name, cell, node->fullpath);
> +				FAIL(c, dti, node, "Property '%s', cell %d is not a phandle referenc=
e",
> +				     prop->name, cell);
>  		}
> =20
>  		provider_node =3D get_node_by_phandle(root, phandle);
>  		if (!provider_node) {
> -			FAIL(c, dti, "Could not get phandle node for %s:%s(cell %d)",
> -			     node->fullpath, prop->name, cell);
> +			FAIL(c, dti, node, "Could not get phandle node for %s(cell %d)",
> +			     prop->name, cell);
>  			break;
>  		}
> =20
> @@ -1167,16 +1148,16 @@ static void check_property_phandle_args(struct ch=
eck *c,
>  		} else if (provider->optional) {
>  			cellsize =3D 0;
>  		} else {
> -			FAIL(c, dti, "Missing property '%s' in node %s or bad phandle (referr=
ed from %s:%s[%d])",
> +			FAIL(c, dti, node, "Missing property '%s' in node %s or bad phandle (=
referred from %s[%d])",
>  			     provider->cell_name,
>  			     provider_node->fullpath,
> -			     node->fullpath, prop->name, cell);
> +			     prop->name, cell);
>  			break;
>  		}
> =20
>  		if (prop->val.len < ((cell + cellsize + 1) * sizeof(cell_t))) {
> -			FAIL(c, dti, "%s property size (%d) too small for cell size %d in %s",
> -			     prop->name, prop->val.len, cellsize, node->fullpath);
> +			FAIL(c, dti, node, "%s property size (%d) too small for cell size %d",
> +			     prop->name, prop->val.len, cellsize);
>  		}
>  	}
>  }
> @@ -1278,8 +1259,8 @@ static void check_deprecated_gpio_property(struct c=
heck *c,
>  		if (!streq(str, "gpio"))
>  			continue;
> =20
> -		FAIL(c, dti, "'[*-]gpio' is deprecated, use '[*-]gpios' instead for %s=
:%s",
> -		     node->fullpath, prop->name);
> +		FAIL(c, dti, node, "'[*-]gpio' is deprecated, use '[*-]gpios' instead =
for %s",
> +		     prop->name);
>  	}
> =20
>  }
> @@ -1313,9 +1294,8 @@ static void check_interrupts_property(struct check =
*c,
>  		return;
> =20
>  	if (irq_prop->val.len % sizeof(cell_t))
> -		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of=
 %zu in node %s",
> -		     irq_prop->name, irq_prop->val.len, sizeof(cell_t),
> -		     node->fullpath);
> +		FAIL(c, dti, node, "property '%s' size (%d) is invalid, expected multi=
ple of %zu",
> +		     irq_prop->name, irq_prop->val.len, sizeof(cell_t));
> =20
>  	while (parent && !prop) {
>  		if (parent !=3D node && node_is_interrupt_provider(parent)) {
> @@ -1333,14 +1313,12 @@ static void check_interrupts_property(struct chec=
k *c,
> =20
>  			irq_node =3D get_node_by_phandle(root, phandle);
>  			if (!irq_node) {
> -				FAIL(c, dti, "Bad interrupt-parent phandle for %s",
> -				     node->fullpath);
> +				FAIL(c, dti, node, "Bad interrupt-parent phandle");
>  				return;
>  			}
>  			if (!node_is_interrupt_provider(irq_node))
> -				FAIL(c, dti,
> -				     "Missing interrupt-controller or interrupt-map property in %s",
> -				     irq_node->fullpath);
> +				FAIL(c, dti, irq_node,
> +				     "Missing interrupt-controller or interrupt-map property");
> =20
>  			break;
>  		}
> @@ -1349,23 +1327,21 @@ static void check_interrupts_property(struct chec=
k *c,
>  	}
> =20
>  	if (!irq_node) {
> -		FAIL(c, dti, "Missing interrupt-parent for %s", node->fullpath);
> +		FAIL(c, dti, node, "Missing interrupt-parent");
>  		return;
>  	}
> =20
>  	prop =3D get_property(irq_node, "#interrupt-cells");
>  	if (!prop) {
> -		FAIL(c, dti, "Missing #interrupt-cells in interrupt-parent %s",
> -		     irq_node->fullpath);
> +		FAIL(c, dti, irq_node, "Missing #interrupt-cells in interrupt-parent");
>  		return;
>  	}
> =20
>  	irq_cells =3D propval_cell(prop);
>  	if (irq_prop->val.len % (irq_cells * sizeof(cell_t))) {
> -		FAIL(c, dti,
> -		     "interrupts size is (%d), expected multiple of %d in %s",
> -		     irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)),
> -		     node->fullpath);
> +		FAIL(c, dti, node,
> +		     "interrupts size is (%d), expected multiple of %d",
> +		     irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
>  	}
>  }
>  WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mhOzvPhkurUs4vA9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlp9RVwACgkQbDjKyiDZ
s5JxIxAAz6Axm9nJ7f6HcuAqKHLZN5Sh/8OgKAq+Pwuw1GFTK6UAbOEZ+2noHYAd
V52X73Os6UhTfTBRioLrG0yQFAM49AHZlKgBkf+u4ArvFLHqqRRr0HtYQhXoUtvH
U6dW8f6VTLrvcRt4Tc+ltjrskwOF37r2B3Z00/+VTWfSLajNTDRv6pham49LTjOZ
nh2fnaCykwfiB8x4TaS3Xj8DLI5Qw6FvBOLnCVL/Lcpomg3gdrtOVgftk8N64D48
BowwaXSw5Fmkg51eaUcd5A0VBFufWNDiByMaktCDGPdt/xJ6nEZcCAFaHoN6n3ZS
T5BD7LwCfFg8pkeMaj/ozbOv5dvpqIl9h3ipPf4ZJjPGXq8ThHcIItaI67UEeejF
8IeO+6fbBH97hjJ522Dht19yhETzYtLVpB4EgI72ujWvI/HgcYmuvQK0WopsGBkt
hBd9kOGJokiQIBTiVGoUduvYquZnnHwXhb6wSFCdR8oX1saU85w0U5EqPLmaAIUt
qAWJo1qkCjCHnMs9EEuN+d/I5s8b7HFNIMuzcZdhmReUZ1+BllZJ79GYIWDAs+hT
1G/XePr8x/t0G5CHywy5mlJNAhm8k4p2Uuy7JkJ6jXpTZB+YslP1IJE/oH2ke88c
1J0zriEk3YuL2Ahw8tGURfNzG/pX9xkFOq/e/IqQqE905U6rJxg=
=vba7
-----END PGP SIGNATURE-----

--mhOzvPhkurUs4vA9--
