From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] checks: Validate interrupt-map properties
Date: Thu, 14 May 2020 17:06:47 +1000
Message-ID: <20200514070647.GD2183@umbus.fritz.box>
References: <20200513163339.29607-1-andre.przywara@arm.com>
 <20200513163339.29607-2-andre.przywara@arm.com>
 <CAL_JsqKPTzb=0h4fCpHh+p=SanTDuVj8W-H8pj7EQ7LJxFySAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X2rN3GNvz+yeh2G1"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1589440053;
        bh=LpoqcPBru1s87o9y3GCwUsUWqRZujEi+JZCU+Z5XaDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xvc+4ykqw+uOib3eUHU/guxTcCZMZP7ynPjg1wpBXyDwJlyImaRuo3FJ+IEOpzE/I
         XVvSYCYf9b3TJ9dl7rl1CaS9swXuNPDs3egVYQi0T4VFUOuIMrklg4Bvyj5uMLVaAF
         JGaKjJQBIYRSp5pwz8GR7TuG/6ARZcgTeVEjqKPQ=
Content-Disposition: inline
In-Reply-To: <CAL_JsqKPTzb=0h4fCpHh+p=SanTDuVj8W-H8pj7EQ7LJxFySAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--X2rN3GNvz+yeh2G1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 10:03:14PM -0500, Rob Herring wrote:
> On Wed, May 13, 2020 at 11:35 AM Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =
wrote:
> >
> > The interrupt-map in an interrupt nexus is quite a tricky property: Each
> > entry contains five fields, the size of four of those depending on some
> > *-cells entries from two different nodes. This is even hard to validate
> > in a .dts file, especially when the associated interrupt controller is
> > described in a separate (included) file.
> >
> > Add checks to validate those entries, by:
> > - Checking some basic properties of the interrupt nexus node.
> > - Checking that a map entry contains at least enough cells to point to
> >   the associated interrupt controller.
> > - Checking that the phandle points to an actual interrupt controller.
> > - Checking that there are enough entries to describe an interrupt in
> >   that interrupt controller's domain.
> >
> > If each iteration passes and we exhaust exactly all the cells in the
> > interrupt-map property, the check passes.
> > Report errors on the way, and abort the check if that happens.
> >
> > Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  checks.c                    | 86 +++++++++++++++++++++++++++++++++++++=
++++++++
> >  tests/bad-interrupt-map.dts | 21 +++++++++++
> >  tests/run_tests.sh          |  2 ++
> >  3 files changed, 109 insertions(+)
> >  create mode 100644 tests/bad-interrupt-map.dts
> >
> > diff --git a/checks.c b/checks.c
> > index 4b3c486..12518db 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -924,6 +924,90 @@ static void check_pci_device_reg(struct check *c, =
struct dt_info *dti, struct no
> >  }
> >  WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format, &pci_=
bridge);
> >
> > +static void check_interrupt_map(struct check *c, struct dt_info *dti,
> > +                               struct node *node)
> > +{
> > +       struct property *map =3D get_property(node, "interrupt-map");
> > +       struct property *prop;
> > +       int i, cells, irq_cells;
> > +
> > +       /* We are only interested in interrupt nexus nodes. */
> > +       if (!map)
> > +               return;
> > +
> > +       if (map->val.len % sizeof(cell_t)) {
> > +               FAIL_PROP(c, dti, node, map, "invalid length of interru=
pt-map");
>=20
> It's good to say what size you found and what was expected.
>=20
> > +               return;
> > +       }
> > +       cells =3D map->val.len / sizeof(cell_t);
> > +
> > +       prop =3D get_property(node, "#interrupt-cells");
> > +       if (!prop) {
> > +               FAIL(c, dti, node, "missing #interrupt-cells in nexus\n=
");
> > +               return;
> > +       }
> > +       irq_cells =3D propval_cell(prop);
> > +
> > +       for (i =3D 0; i < cells;) {
> > +               int phandle_idx =3D i + node_addr_cells(node) + irq_cel=
ls;
>=20
> IIRC, node_addr_cells() will give you a default if not found which is
> not really what you want.

Using the default seems right to me.  We might want a warning in that
case, but I don't think it belongs in this test.

> > +               cell_t intc_phandle, intc_irq_cells, intc_addr_cells;
> > +               struct node *intc =3D NULL;
> > +
> > +               if (phandle_idx + 1 >=3D cells) {
> > +                       FAIL_PROP(c, dti, node, map,
> > +                               "insufficient cells for interrupt-map e=
ntry");
> > +                       return;
> > +               }
> > +               intc_phandle =3D propval_cell_n(map, phandle_idx);
> > +               /* Avoid the assert in get_node_by_phandle(). */
> > +               if (intc_phandle !=3D 0)
> > +                       intc =3D get_node_by_phandle(dti->dt, intc_phan=
dle);

This will always fail the check if the phandle is an unresolved
reference, which is likely for an overlay dt.

> > +               if (!intc) {
> > +                       FAIL_PROP(c, dti, node, map,
> > +                                 "invalid phandle for interrupt-map en=
try");
> > +                       return;
> > +               }
> > +
> > +               prop =3D get_property(intc, "interrupt-controller");
> > +               if (!prop) {
> > +                       FAIL_PROP(c,dti, node, map,
> > +                                 "interrupt-map phandle does not point=
 to interrupt controller");
>=20
> interrupt-map can point to another interrupt-map.

Right.

> > +                       return;
> > +               }
> > +
> > +               prop =3D get_property(intc, "#address-cells");
> > +               if (!prop) {
> > +                       FAIL_PROP(c,dti, node, map,
> > +                                 "interrupt-controller misses #address=
-cells property");

"is missing", or simply "missing" would be more normal english than
"misses" (here and elsewhere).

> > +                       /*
> > +                        * Linux treats non-existing #address-cells in =
the
> > +                        * interrupt parent as 0, and not 2, as the spec
> > +                        * suggests. Deal with that, but print the warn=
ing,
> > +                        * since we should have an explicit #a-c =3D 0 =
in the
> > +                        * controller node in this case.
>=20
> IMO, we should not print a warning. Or make it separately enabled.

I tend to agree.  A separate check to warn for an interrupt controller
(or nexus) without #address-cells seems like a good idea.

> > +                        */
> > +                       intc_addr_cells =3D 0;
> > +               } else
> > +                       intc_addr_cells =3D propval_cell(prop);
> > +
> > +               prop =3D get_property(intc, "#interrupt-cells");
> > +               if (!prop) {
> > +                       FAIL_PROP(c,dti, node, map,
> > +                                 "interrupt-controller misses #interru=
pt-cells property");
> > +                       return;
> > +               }
> > +               intc_irq_cells =3D propval_cell(prop);
> > +
> > +               if (phandle_idx + intc_addr_cells + intc_irq_cells >=3D=
 cells) {
> > +                       FAIL_PROP(c, dti, node, map,
> > +                               "insufficient cells for interrupt-map e=
ntry");
> > +                       return;
> > +               }
> > +               i =3D phandle_idx + 1 + intc_addr_cells + intc_irq_cell=
s;
> > +       }
> > +}
> > +WARNING(interrupt_map, check_interrupt_map, NULL);
> > +
> >  static const struct bus_type simple_bus =3D {
> >         .name =3D "simple-bus",
> >  };
> > @@ -1792,6 +1876,8 @@ static struct check *check_table[] =3D {
> >         &pci_device_reg,
> >         &pci_device_bus_num,
> >
> > +       &interrupt_map,
> > +
> >         &simple_bus_bridge,
> >         &simple_bus_reg,
> >
> > diff --git a/tests/bad-interrupt-map.dts b/tests/bad-interrupt-map.dts
> > new file mode 100644
> > index 0000000..cf9618f
> > --- /dev/null
> > +++ b/tests/bad-interrupt-map.dts
> > @@ -0,0 +1,21 @@
> > +/dts-v1/;
> > +
> > +/ {
> > +       intc: interrupt-controller {
> > +               interrupt-controller;
> > +               #address-cells =3D <2>;
> > +               #interrupt-cells =3D <3>;
> > +       };
> > +
> > +       nexus-node {
> > +               #address-cells =3D <1>;
> > +               #interrupt-cells =3D <1>;
> > +/*
> > + * The cells after the phandle are the address in the interrupt contro=
ller's
> > + * domain. This here encodes 0 cells , but the actual number is 2 abov=
e.
> > + */
> > +               interrupt-map =3D <0 0 &intc 1 42 4>,
> > +                               <0 1 &intc 1 43 4>,
> > +                               <0 2 &intc 1 44 4>;
> > +       };
> > +};
> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > index eccb85d..aec92fb 100755
> > --- a/tests/run_tests.sh
> > +++ b/tests/run_tests.sh
> > @@ -732,6 +732,8 @@ dtc_tests () {
> >      check_tests "$SRCDIR/pci-bridge-bad1.dts" pci_bridge
> >      check_tests "$SRCDIR/pci-bridge-bad2.dts" pci_bridge
> >
> > +    check_tests "$SRCDIR/bad-interrupt-map.dts" interrupt_map
> > +
> >      check_tests "$SRCDIR/unit-addr-simple-bus-reg-mismatch.dts" simple=
_bus_reg
> >      check_tests "$SRCDIR/unit-addr-simple-bus-compatible.dts" simple_b=
us_reg
> >
> >
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X2rN3GNvz+yeh2G1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl687gQACgkQbDjKyiDZ
s5IC7w/+MoR1t/vHLngZ2wd2KQHDh70jICxf9NGIhI1nOmcLYVBvXxdanNq4vZVn
X/xzJxtW3l+51rGdR50/3fGyKUsfDZlzv5hX98Eup50MrR/KmUUWoUipRW/eNgbv
taSiBsqS4DKFvjSjYVe/ZIuK+5pgQktcFRQCwCW14tRjeWLhiD7YtIxjZyQdPupk
+K9WZufHF8pxW7Y1yuInyK7Qwz/pnSt/UmsI6xk16VdDXD1eOf4qgYo2ARrovHCP
0uBlvbGbRM0DLzFTk7jmYJ83yo3+zvKwpUGxwFBFQrWxbCnVO53NdBdFVLS19o89
LPvLZu/9qew5uNEtnbeCA/8b5aQUb8PZZfQ/fxPtNjYS8rAGiEZfpteJ06Y8GXyn
8g1aw+NqmEMQfaMENDwN07I2sdfPhnsnc/Uob9y8BZgdNEZ0OEpnIBjsWmKSv4jA
ZxSmqz/Fxbk0kBARdxAB4QoTgIwFhUIDhAnhFAa/+0tjniWzRIJl437guZocQpNa
52Qz3IQ9X6UQ1QispR59pLZTfLYPJyr/MTMxdHlPu7I1t5rg+yC6+tzeV9Yts80X
4I/k9fXGoZgPwFIhrOQ1eiflS3rfVMHswYK56YwUf/VPY+6e4FEOhXSS6iX2HAQV
X1wUtqY0P1VAf4gw3izOEnVE4VvwanhIv/P2sHZIGu9Xmv4Gl58=
=359c
-----END PGP SIGNATURE-----

--X2rN3GNvz+yeh2G1--
