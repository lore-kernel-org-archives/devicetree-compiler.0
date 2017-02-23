From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Warnings do include offending filename
Date: Thu, 23 Feb 2017 14:42:19 +1100
Message-ID: <20170223034219.GG12577@umbus.fritz.box>
References: <1485767585.7612.23.camel@hellion.org.uk>
 <20170130234932.GB14879@umbus.fritz.box>
 <1485851088.7612.32.camel@hellion.org.uk>
 <20170201001654.GB30639@umbus.fritz.box>
 <20170201010004.GG30639@umbus.fritz.box>
 <1485934446.7612.36.camel@hellion.org.uk>
 <20170202050553.GF13219@umbus.fritz.box>
 <1486151046.7612.44.camel@hellion.org.uk>
 <20170210041122.GA25381@umbus>
 <1487520043.7612.59.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wQkw7DhpL9hyPo7K"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1487822279;
        bh=raOco+9LndT+zZtGrnBurE7BbRheOBtQaaTM/mbj/a8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QOXLDuWtZgsM+wNFSpgJ2kJs5M4dO+Mvokaic6npSyv1TdU2hRnWPq06cbWAFZ5Dk
         uaSgaCnI8e60mEEvtCeXRhkb2Z8NMWm/Eu/6kaP/3SBUCbu2aW9cIB4Ksw9wZiy8ok
         qkdTfzeInDxU9yTjP+qygKKZSvhqvgs2aKxeebD0=
Content-Disposition: inline
In-Reply-To: <1487520043.7612.59.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--wQkw7DhpL9hyPo7K
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2017 at 04:00:43PM +0000, Ian Campbell wrote:
> On Fri, 2017-02-10 at 15:11 +1100, David Gibson wrote:
> > On Fri, Feb 03, 2017 at 07:44:06PM +0000, Ian Campbell wrote:
> > > On Thu, 2017-02-02 at 16:05 +1100, David Gibson wrote:
> > > > Feel free to send a patch and I'll think about it.
> > >=A0
> > > Please see below.
> > >=A0
> > > The diffstat is a rather large due to the need to plumb `outname`
> > > through to all the check functions. That could perhaps be avoided
> > by
> > > adding it to `struct dt_info *dti` instead since that is already
> > > available in most places, but there would still be the churn
> > relating
> > > to adding a parameter to `check_msg` and the various wrapper
> > macros.
> > > Happy to rework along those lines if you prefer it though.
> >=20
> > I think putting the output name into dt_info would be nicer, yes.
>=20
> Done, see below (sorry for the delay, I've been away).

Sorry for my delay, I've been busy.

> > Make sure you allow for the case of output to stdout (which is default
> > for -I dtb -O dts).
>=20
> I get:
>=20
> $ ../dtc/dtc -I dtb -O dts src/arm/sun5i-a13-difrnce-dit4350.dtb > x.dts
> <stdout>: Warning (unit_address_vs_reg): Node /chosen/framebuffer@0 has a=
 unit name, but no reg property
> <stdout>: Warning (unit_address_vs_reg): Node /memory has a reg or ranges=
 property, but no unit name
> [...snip...]

Ok looks good.  Except that since you wrote it I've merged some other
patches adding more FAIL() calls, so this now causes compile errors.

Can you please rebase onto current master, fix up for the new calls
and resend.

>=20
> Ian.
>=20
> 8----------
>=20
> >From 4434e0e8798e3770ed34e33f1e962f747f820509 Mon Sep 17 00:00:00 2001
> From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Date: Fri, 3 Feb 2017 08:29:39 +0000
> Subject: [PATCH] Print output filename as part of warning messages
>=20
> For example:
> src/arm/at91-ariag25.dtb: Warning (unit_address_vs_reg): Node /memory has=
 a reg or ranges property, but no unit name
>=20
> If output is to stdout then the prefix is "<stdout>: ".
>=20
> This helps to direct the developer to where to look when multiple files a=
re
> being compiled in parallel.
>=20
> Signed-off-by: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> ---
>  checks.c | 79 +++++++++++++++++++++++++++++++++-------------------------=
------
>  dtc.c    |  2 ++
>  dtc.h    |  1 +
>  3 files changed, 44 insertions(+), 38 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 3d18e45..3a1dc6f 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -73,16 +73,19 @@ struct check {
>  	CHECK_ENTRY(_nm, _fn, _d, false, false, __VA_ARGS__)
> =20
>  #ifdef __GNUC__
> -static inline void check_msg(struct check *c, const char *fmt, ...) __at=
tribute__((format (printf, 2, 3)));
> +static inline void check_msg(struct check *c, struct dt_info *dti,
> +			     const char *fmt, ...) __attribute__((format (printf, 3, 4)));
>  #endif
> -static inline void check_msg(struct check *c, const char *fmt, ...)
> +static inline void check_msg(struct check *c, struct dt_info *dti,
> +			     const char *fmt, ...)
>  {
>  	va_list ap;
>  	va_start(ap, fmt);
> =20
>  	if ((c->warn && (quiet < 1))
>  	    || (c->error && (quiet < 2))) {
> -		fprintf(stderr, "%s (%s): ",
> +		fprintf(stderr, "%s: %s (%s): ",
> +			strcmp(dti->outname, "-") ? dti->outname : "<stdout>",
>  			(c->error) ? "ERROR" : "Warning", c->name);
>  		vfprintf(stderr, fmt, ap);
>  		fprintf(stderr, "\n");
> @@ -90,11 +93,11 @@ static inline void check_msg(struct check *c, const c=
har *fmt, ...)
>  	va_end(ap);
>  }
> =20
> -#define FAIL(c, ...) \
> -	do { \
> -		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__); \
> -		(c)->status =3D FAILED; \
> -		check_msg((c), __VA_ARGS__); \
> +#define FAIL(c, dti, ...)						\
> +	do {								\
> +		TRACE((c), "\t\tFAILED at %s:%d", __FILE__, __LINE__);	\
> +		(c)->status =3D FAILED;					\
> +		check_msg((c), dti, __VA_ARGS__);			\
>  	} while (0)
> =20
>  static void check_nodes_props(struct check *c, struct dt_info *dti, stru=
ct node *node)
> @@ -127,7 +130,7 @@ static bool run_check(struct check *c, struct dt_info=
 *dti)
>  		error =3D error || run_check(prq, dti);
>  		if (prq->status !=3D PASSED) {
>  			c->status =3D PREREQ;
> -			check_msg(c, "Failed prerequisite '%s'",
> +			check_msg(c, dti, "Failed prerequisite '%s'",
>  				  c->prereq[i]->name);
>  		}
>  	}
> @@ -157,7 +160,7 @@ out:
>  static inline void check_always_fail(struct check *c, struct dt_info *dt=
i,
>  				     struct node *node)
>  {
> -	FAIL(c, "always_fail check");
> +	FAIL(c, dti, "always_fail check");
>  }
>  CHECK(always_fail, check_always_fail, NULL);
> =20
> @@ -172,7 +175,7 @@ static void check_is_string(struct check *c, struct d=
t_info *dti,
>  		return; /* Not present, assumed ok */
> =20
>  	if (!data_is_one_string(prop->val))
> -		FAIL(c, "\"%s\" property in %s is not a string",
> +		FAIL(c, dti, "\"%s\" property in %s is not a string",
>  		     propname, node->fullpath);
>  }
>  #define WARNING_IF_NOT_STRING(nm, propname) \
> @@ -191,7 +194,7 @@ static void check_is_cell(struct check *c, struct dt_=
info *dti,
>  		return; /* Not present, assumed ok */
> =20
>  	if (prop->val.len !=3D sizeof(cell_t))
> -		FAIL(c, "\"%s\" property in %s is not a single cell",
> +		FAIL(c, dti, "\"%s\" property in %s is not a single cell",
>  		     propname, node->fullpath);
>  }
>  #define WARNING_IF_NOT_CELL(nm, propname) \
> @@ -213,7 +216,7 @@ static void check_duplicate_node_names(struct check *=
c, struct dt_info *dti,
>  		     child2;
>  		     child2 =3D child2->next_sibling)
>  			if (streq(child->name, child2->name))
> -				FAIL(c, "Duplicate node name %s",
> +				FAIL(c, dti, "Duplicate node name %s",
>  				     child->fullpath);
>  }
>  ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
> @@ -228,7 +231,7 @@ static void check_duplicate_property_names(struct che=
ck *c, struct dt_info *dti,
>  			if (prop2->deleted)
>  				continue;
>  			if (streq(prop->name, prop2->name))
> -				FAIL(c, "Duplicate property name %s in %s",
> +				FAIL(c, dti, "Duplicate property name %s in %s",
>  				     prop->name, node->fullpath);
>  		}
>  	}
> @@ -246,7 +249,7 @@ static void check_node_name_chars(struct check *c, st=
ruct dt_info *dti,
>  	int n =3D strspn(node->name, c->data);
> =20
>  	if (n < strlen(node->name))
> -		FAIL(c, "Bad character '%c' in node %s",
> +		FAIL(c, dti, "Bad character '%c' in node %s",
>  		     node->name[n], node->fullpath);
>  }
>  ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
> @@ -255,7 +258,7 @@ static void check_node_name_format(struct check *c, s=
truct dt_info *dti,
>  				   struct node *node)
>  {
>  	if (strchr(get_unitname(node), '@'))
> -		FAIL(c, "Node %s has multiple '@' characters in name",
> +		FAIL(c, dti, "Node %s has multiple '@' characters in name",
>  		     node->fullpath);
>  }
>  ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
> @@ -274,11 +277,11 @@ static void check_unit_address_vs_reg(struct check =
*c, struct dt_info *dti,
> =20
>  	if (prop) {
>  		if (!unitname[0])
> -			FAIL(c, "Node %s has a reg or ranges property, but no unit name",
> +			FAIL(c, dti, "Node %s has a reg or ranges property, but no unit name",
>  			    node->fullpath);
>  	} else {
>  		if (unitname[0])
> -			FAIL(c, "Node %s has a unit name, but no reg property",
> +			FAIL(c, dti, "Node %s has a unit name, but no reg property",
>  			    node->fullpath);
>  	}
>  }
> @@ -293,7 +296,7 @@ static void check_property_name_chars(struct check *c=
, struct dt_info *dti,
>  		int n =3D strspn(prop->name, c->data);
> =20
>  		if (n < strlen(prop->name))
> -			FAIL(c, "Bad character '%c' in property name \"%s\", node %s",
> +			FAIL(c, dti, "Bad character '%c' in property name \"%s\", node %s",
>  			     prop->name[n], prop->name, node->fullpath);
>  	}
>  }
> @@ -327,7 +330,7 @@ static void check_duplicate_label(struct check *c, st=
ruct dt_info *dti,
>  		return;
> =20
>  	if ((othernode !=3D node) || (otherprop !=3D prop) || (othermark !=3D m=
ark))
> -		FAIL(c, "Duplicate label '%s' on " DESCLABEL_FMT
> +		FAIL(c, dti, "Duplicate label '%s' on " DESCLABEL_FMT
>  		     " and " DESCLABEL_FMT,
>  		     label, DESCLABEL_ARGS(node, prop, mark),
>  		     DESCLABEL_ARGS(othernode, otherprop, othermark));
> @@ -367,7 +370,7 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  		return 0;
> =20
>  	if (prop->val.len !=3D sizeof(cell_t)) {
> -		FAIL(c, "%s has bad length (%d) %s property",
> +		FAIL(c, dti, "%s has bad length (%d) %s property",
>  		     node->fullpath, prop->val.len, prop->name);
>  		return 0;
>  	}
> @@ -379,7 +382,7 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  			/* "Set this node's phandle equal to some
>  			 * other node's phandle".  That's nonsensical
>  			 * by construction. */ {
> -			FAIL(c, "%s in %s is a reference to another node",
> +			FAIL(c, dti, "%s in %s is a reference to another node",
>  			     prop->name, node->fullpath);
>  		}
>  		/* But setting this node's phandle equal to its own
> @@ -393,7 +396,7 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  	phandle =3D propval_cell(prop);
> =20
>  	if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
> -		FAIL(c, "%s has bad value (0x%x) in %s property",
> +		FAIL(c, dti, "%s has bad value (0x%x) in %s property",
>  		     node->fullpath, phandle, prop->name);
>  		return 0;
>  	}
> @@ -420,7 +423,7 @@ static void check_explicit_phandles(struct check *c, =
struct dt_info *dti,
>  		return;
> =20
>  	if (linux_phandle && phandle && (phandle !=3D linux_phandle))
> -		FAIL(c, "%s has mismatching 'phandle' and 'linux,phandle'"
> +		FAIL(c, dti, "%s has mismatching 'phandle' and 'linux,phandle'"
>  		     " properties", node->fullpath);
> =20
>  	if (linux_phandle && !phandle)
> @@ -428,7 +431,7 @@ static void check_explicit_phandles(struct check *c, =
struct dt_info *dti,
> =20
>  	other =3D get_node_by_phandle(root, phandle);
>  	if (other && (other !=3D node)) {
> -		FAIL(c, "%s has duplicated phandle 0x%x (seen before at %s)",
> +		FAIL(c, dti, "%s has duplicated phandle 0x%x (seen before at %s)",
>  		     node->fullpath, phandle, other->fullpath);
>  		return;
>  	}
> @@ -453,7 +456,7 @@ static void check_name_properties(struct check *c, st=
ruct dt_info *dti,
> =20
>  	if ((prop->val.len !=3D node->basenamelen+1)
>  	    || (memcmp(prop->val.val, node->name, node->basenamelen) !=3D 0)) {
> -		FAIL(c, "\"name\" property in %s is incorrect (\"%s\" instead"
> +		FAIL(c, dti, "\"name\" property in %s is incorrect (\"%s\" instead"
>  		     " of base node name)", node->fullpath, prop->val.val);
>  	} else {
>  		/* The name property is correct, and therefore redundant.
> @@ -488,7 +491,7 @@ static void fixup_phandle_references(struct check *c,=
 struct dt_info *dti,
>  			refnode =3D get_node_by_ref(dt, m->ref);
>  			if (! refnode) {
>  				if (!(dti->dtsflags & DTSF_PLUGIN))
> -					FAIL(c, "Reference to non-existent node or "
> +					FAIL(c, dti, "Reference to non-existent node or "
>  							"label \"%s\"\n", m->ref);
>  				else /* mark the entry as unresolved */
>  					*((cell_t *)(prop->val.val + m->offset)) =3D
> @@ -520,7 +523,7 @@ static void fixup_path_references(struct check *c, st=
ruct dt_info *dti,
> =20
>  			refnode =3D get_node_by_ref(dt, m->ref);
>  			if (!refnode) {
> -				FAIL(c, "Reference to non-existent node or label \"%s\"\n",
> +				FAIL(c, dti, "Reference to non-existent node or label \"%s\"\n",
>  				     m->ref);
>  				continue;
>  			}
> @@ -579,19 +582,19 @@ static void check_reg_format(struct check *c, struc=
t dt_info *dti,
>  		return; /* No "reg", that's fine */
> =20
>  	if (!node->parent) {
> -		FAIL(c, "Root node has a \"reg\" property");
> +		FAIL(c, dti, "Root node has a \"reg\" property");
>  		return;
>  	}
> =20
>  	if (prop->val.len =3D=3D 0)
> -		FAIL(c, "\"reg\" property in %s is empty", node->fullpath);
> +		FAIL(c, dti, "\"reg\" property in %s is empty", node->fullpath);
> =20
>  	addr_cells =3D node_addr_cells(node->parent);
>  	size_cells =3D node_size_cells(node->parent);
>  	entrylen =3D (addr_cells + size_cells) * sizeof(cell_t);
> =20
>  	if (!entrylen || (prop->val.len % entrylen) !=3D 0)
> -		FAIL(c, "\"reg\" property in %s has invalid length (%d bytes) "
> +		FAIL(c, dti, "\"reg\" property in %s has invalid length (%d bytes) "
>  		     "(#address-cells =3D=3D %d, #size-cells =3D=3D %d)",
>  		     node->fullpath, prop->val.len, addr_cells, size_cells);
>  }
> @@ -608,7 +611,7 @@ static void check_ranges_format(struct check *c, stru=
ct dt_info *dti,
>  		return;
> =20
>  	if (!node->parent) {
> -		FAIL(c, "Root node has a \"ranges\" property");
> +		FAIL(c, dti, "Root node has a \"ranges\" property");
>  		return;
>  	}
> =20
> @@ -620,17 +623,17 @@ static void check_ranges_format(struct check *c, st=
ruct dt_info *dti,
> =20
>  	if (prop->val.len =3D=3D 0) {
>  		if (p_addr_cells !=3D c_addr_cells)
> -			FAIL(c, "%s has empty \"ranges\" property but its "
> +			FAIL(c, dti, "%s has empty \"ranges\" property but its "
>  			     "#address-cells (%d) differs from %s (%d)",
>  			     node->fullpath, c_addr_cells, node->parent->fullpath,
>  			     p_addr_cells);
>  		if (p_size_cells !=3D c_size_cells)
> -			FAIL(c, "%s has empty \"ranges\" property but its "
> +			FAIL(c, dti, "%s has empty \"ranges\" property but its "
>  			     "#size-cells (%d) differs from %s (%d)",
>  			     node->fullpath, c_size_cells, node->parent->fullpath,
>  			     p_size_cells);
>  	} else if ((prop->val.len % entrylen) !=3D 0) {
> -		FAIL(c, "\"ranges\" property in %s has invalid length (%d bytes) "
> +		FAIL(c, dti, "\"ranges\" property in %s has invalid length (%d bytes) "
>  		     "(parent #address-cells =3D=3D %d, child #address-cells =3D=3D %d=
, "
>  		     "#size-cells =3D=3D %d)", node->fullpath, prop->val.len,
>  		     p_addr_cells, c_addr_cells, c_size_cells);
> @@ -656,11 +659,11 @@ static void check_avoid_default_addr_size(struct ch=
eck *c, struct dt_info *dti,
>  		return;
> =20
>  	if (node->parent->addr_cells =3D=3D -1)
> -		FAIL(c, "Relying on default #address-cells value for %s",
> +		FAIL(c, dti, "Relying on default #address-cells value for %s",
>  		     node->fullpath);
> =20
>  	if (node->parent->size_cells =3D=3D -1)
> -		FAIL(c, "Relying on default #size-cells value for %s",
> +		FAIL(c, dti, "Relying on default #size-cells value for %s",
>  		     node->fullpath);
>  }
>  WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
> @@ -684,7 +687,7 @@ static void check_obsolete_chosen_interrupt_controlle=
r(struct check *c,
> =20
>  	prop =3D get_property(chosen, "interrupt-controller");
>  	if (prop)
> -		FAIL(c, "/chosen has obsolete \"interrupt-controller\" "
> +		FAIL(c, dti, "/chosen has obsolete \"interrupt-controller\" "
>  		     "property");
>  }
>  WARNING(obsolete_chosen_interrupt_controller,
> diff --git a/dtc.c b/dtc.c
> index a4edf4c..9c30c33 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -309,6 +309,8 @@ int main(int argc, char *argv[])
>  	else
>  		die("Unknown input format \"%s\"\n", inform);
> =20
> +	dti->outname =3D outname;
> +
>  	if (depfile) {
>  		fputc('\n', depfile);
>  		fclose(depfile);
> diff --git a/dtc.h b/dtc.h
> index c6f125c..1ac2a1e 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -246,6 +246,7 @@ struct dt_info {
>  	struct reserve_info *reservelist;
>  	uint32_t boot_cpuid_phys;
>  	struct node *dt;		/* the device tree */
> +	const char *outname;		/* filename being written to, "-" for stdout */
>  };
> =20
>  /* DTS version flags definitions */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wQkw7DhpL9hyPo7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYrloXAAoJEGw4ysog2bOSXEoP/j1/WOUfCmEwmoJ6pWaNqxRO
86FEe/iXLs+Jk2piUJqjodohuGMaFcxT5GfG2KPlil3aujDTr4oe6LpunPaUBubJ
YJkLQh+/7oyiF6vIc0E3I88WE0LQU1sgRN0IQtzDqoOQfcdmcMl0BJq5GA7dSlka
qfgXIRUtjhl8IAy7e7qF/VSd4UpHHdw0u7YLgZvSmj+XjTQlF2Aq+oVE06LvWk6q
kYVvalC999r1U0U2rt7nV6yegt76NuVcFd7CmNL5E2jdcNoXttw6aw3SirjZTcsE
0qvTmEd2vUmLUgqH21XgW7Dn1jQr04L3BCip/Yox47I1e+sOmogUQItDW0ppzyuK
h1xBZ8yq1tt1k9ibFz1QtJB4uGhPkWImt24R/bPDIOloxgywC/g9CDgXPGsl8UKw
MY50gt5iRbRfHk03SQFTXN68oxEGF6n2vemkljhwQl0rhBy811iVWKys+CBO5iqS
AGv1YNx9MrBEt3JhSurkgo5KLHMNmlxHBwO9PgYcJBueVofjayktfhmi635bGCWy
c2VQxEb05fAIm024UA+TGvFhgMcm0dr4wE7L18VhTGj7GWOui85uZh/g7f48icjO
TAFtUOBftcpT+ILdflqL6fx1pMBctdCRMZn4zZFz+c2L2qKNi6Kj4iONYeT25yvp
+5nOvmo97EFjPMZ5YYS4
=lXvB
-----END PGP SIGNATURE-----

--wQkw7DhpL9hyPo7K--
