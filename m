From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] checks: add phandle with arg property checks
Date: Sat, 19 Aug 2017 17:33:33 +1000
Message-ID: <20170819073333.GA12356@umbus.fritz.box>
References: <20170814214807.338-1-robh@kernel.org>
 <20170818043502.GQ5509@umbus.fritz.box>
 <CAL_Jsq+yA2W=SD9zSkWxw-R16uNELeqPqJK3fVMvi0_jhEbooQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503129141;
        bh=c5TatkBlnZ0IxtgSsqJ7z2EBed2Ks1WGcxZddb9G35E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=narHjUZbzQvgj7gmgmpsxTUUm7sEhWpMz6D3+Z80Z8WlPEpbH+B/8Pb1DoCgRfj7l
         Tib5CuXhvOFmIvsRN18sbYW6diRM4ZdicMAK17203To5XV4bA/Inw7X5ldGAbzQeX+
         aIfpfzxc79Jo6JSuSEJQesr4C5RctKdJSFCN00Pc=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+yA2W=SD9zSkWxw-R16uNELeqPqJK3fVMvi0_jhEbooQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2017 at 11:02:01AM -0500, Rob Herring wrote:
> On Thu, Aug 17, 2017 at 11:35 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Mon, Aug 14, 2017 at 04:48:06PM -0500, Rob Herring wrote:
> >
> > Yay! Someone actually implementing checks.
>=20
> Not like it is my first. I'll celebrate when someone else does.
>=20
>=20
> >> Many common bindings follow the same pattern of client properties
> >> containing a phandle and N arg cells where N is defined in the provider
> >> with a '#<specifier>-cells' property. Add a checks for properties
> >> following this pattern.
> >
> > I think this description would be easier to follow if you led with an e=
xample.
> >
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Looks pretty good, though I have some suggestions.
> >
> >> ---
> >>  checks.c | 117 ++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++
> >>  1 file changed, 117 insertions(+)
> >>
> >> diff --git a/checks.c b/checks.c
> >> index afabf64337d5..c0450e118043 100644
> >> --- a/checks.c
> >> +++ b/checks.c
> >> @@ -956,6 +956,120 @@ static void check_obsolete_chosen_interrupt_cont=
roller(struct check *c,
> >>  WARNING(obsolete_chosen_interrupt_controller,
> >>       check_obsolete_chosen_interrupt_controller, NULL);
> >>
> >> +struct provider {
> >> +     const char *prop_name;
> >> +     const char *cell_name;
> >> +     bool optional;
> >> +};
> >> +
> >> +static void check_property_phandle_args(struct check *c,
> >> +                                       struct dt_info *dti,
> >> +                                       struct node *node,
> >> +                                       struct property *prop,
> >> +                                       const struct provider *provide=
r)
> >> +{
> >> +     struct marker *m =3D prop->val.markers;
> >> +
> >> +     if (!m) {
> >> +             FAIL(c, dti, "Missing phandles in %s:%s",
> >> +                  node->fullpath, prop->name);
> >> +             return;
> >> +     }
> >> +     for_each_marker_of_type(m, REF_PHANDLE) {
> >
> > So going through the markers I think is not the best approach.
> > That'll work if the source contains a reference here, which it usually
> > will, but there are some circumstances where it could contain a "raw"
> > phandle value (the most obvious being when you're decompiling an
> > existing dtb).
> >
> > But I don't think you really need to.  Instead you should be able to
> > read the actual value, look it up with get_node_by_phandle().  You can
> > make this check dependent on fixup_phandle_references to make sure
> > it's executed after the references are resolved.
>=20
> That's how I implemented it initially...

Ok.. why did you change?

> > That should also let you more strictly verify the property in the
> > client node, including checking for misaligned entries of extraneous bi=
ts.
> >
> >> +             int cellsize;
> >> +             struct node *root =3D dti->dt;
> >> +             struct node *provider_node;
> >> +             struct property *cellprop;
> >> +
> >> +             provider_node =3D get_node_by_ref(root, m->ref);
> >> +             if (!provider_node) {
> >> +                     FAIL(c, dti, "Could not get provider for %s:%s",
> >> +                          node->fullpath, prop->name);
> >> +                     break;
> >> +             }
> >
> > AFAIK the "provider" terminology isn't standardized somewhere.  It's a
> > reasonable term internally, but if can rephrase to it in the displayed
> > messages that would be a bonus.
>=20
> The kernel uses that at least. I guess maybe "phandle node" will work.

Hm, if the kernel uses the term, that's probably enough, actually.

> >> +             cellprop =3D get_property(provider_node, provider->cell_=
name);
> >> +             if (cellprop) {
> >> +                     cellsize =3D propval_cell(cellprop);
> >> +             } else if (provider->optional) {
> >> +                     cellsize =3D 0;
> >> +             } else {
> >> +                     FAIL(c, dti, "Missing %s in provider %s for %s",
> >> +                          provider->cell_name,
> >> +                          provider_node->fullpath,
> >> +                          node->fullpath);
> >> +                     break;
> >> +             }
> >> +
> >> +             if (prop->val.len < ((cellsize + 1) * sizeof(cell_t))) {
> >> +                     FAIL(c, dti, "%s property size (%d) too small fo=
r cell size %d in %s",
> >> +                          prop->name, prop->val.len, cellsize, node->=
fullpath);
> >> +             }
> >> +     }
> >> +}
> >> +
> >> +static const struct provider providers[] =3D {
> >> +     { "clocks", "#clock-cells" },
> >> +     { "phys", "#phy-cells" },
> >> +     { "interrupts-extended", "#interrupt-cells" },
> >> +     { "mboxes", "#mbox-cells" },
> >> +     { "pwms", "#pwm-cells" },
> >> +     { "dmas", "#dma-cells" },
> >> +     { "resets", "#reset-cells" },
> >> +     { "hwlocks", "#hwlock-cells" },
> >> +     { "power-domains", "#power-domain-cells" },
> >> +     { "io-channels", "#io-channel-cells" },
> >> +     { "iommus", "#iommu-cells" },
> >> +     { "mux-controls", "#mux-control-cells" },
> >> +     { "cooling-device", "#cooling-cells" },
> >> +     { "thermal-sensors", "#thermal-sensor-cells" },
> >> +     { "sound-dais", "#sound-dai-cells" },
> >> +     { "msi-parent", "#msi-cells", true },
> >> +     { NULL },
> >> +};
> >
> > How hard would it be to use macros to make each of these providers
> > different check structures.  I think the output would be a bit more
> > useful if errors in different types of these things was reported as a
> > different check failure rather than one big generic one.
>=20
> Should be doable.

Ok.  Not essential, but I think it would improve the output.

> > It does mean listing everything in the check_table which is a pain.  I
> > would really like to change things so that a single macro can both
> > declare the check and add it to the master list, but I haven't thought
> > of a portable way to do that so far.
>=20
> This is done in the kernel frequently using linker sections. Each
> check entry would get put into a specific section, then you just
> iterate through the entries. Would that work? I could imagine that
> linker magic may not be all the portable.

Right.  Linker sections are the usual way to do this, but that
requires lower level knowledge of how the toolchain works than I
really want to put into dtc.  At heart dtc is really a very
straightforward standard C program, so I don't want to introduce
dependencies on a specific compiler.

>=20
> > If you do need the providers array, ARRAY_SIZE() is preferred over a
> > terminator NULL.
>=20
> Okay.
>=20
> >> +static void check_provider_cells_property(struct check *c,
> >> +                                       struct dt_info *dti,
> >> +                                       struct node *node)
> >> +{
> >> +     int i;
> >> +
> >> +     for (i =3D 0; providers[i].prop_name; i++) {
> >> +             struct property *prop =3D get_property(node, providers[i=
].prop_name);
> >> +             if (!prop)
> >> +                     continue;
> >> +             check_property_phandle_args(c, dti, node, prop, &provide=
rs[i]);
> >> +     }
> >> +}
> >> +WARNING(provider_cells_property, check_provider_cells_property, NULL);
> >> +
> >> +static void check_gpio_cells_property(struct check *c,
> >> +                                       struct dt_info *dti,
> >> +                                       struct node *node)
> >> +{
> >> +     struct property *prop;
> >> +
> >> +     for_each_property(node, prop) {
> >> +             char *str;
> >> +             struct provider provider;
> >> +
> >> +             /* Skip over false matches */
> >> +             if (strstr(prop->name, "nr-gpio"))
> >> +                     continue;
> >> +
> >> +             str =3D strrchr(prop->name, '-');
> >> +             if (!str || !(streq(str, "-gpio") || streq(str, "-gpios"=
)))
> >> +                     continue;
> >> +
> >> +             provider.prop_name =3D prop->name;
> >> +             provider.cell_name =3D "#gpio-cells";
> >> +             provider.optional =3D false;
> >> +             check_property_phandle_args(c, dti, node, prop, &provide=
r);
> >> +     }
> >> +
> >> +}
> >> +WARNING(gpio_cells_property, check_gpio_cells_property, NULL);
> >
> > Since the gpio stuff is a bit tweaker, it would be good to go into a
> > separate patch.  Then the commit message can explain what the logic
> > here is for (I'm having a little trouble following it).
>=20
> Okay.
>=20
> Rob

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmX6coACgkQbDjKyiDZ
s5IsUA/+OzoaqCXMZ9dzTFpJInXfR2XIpT455CDnsKtHUzjJzvjnpR0XcebXHL1U
kRg2ZZ5LqlMG+PqfzzE11tY0K1FxmNxUgmA5W2RuERb5CXDI+31vazoj3Wj+nvBu
7KkTMVCdils+0Erya/q0asdzwK9SkEEMCOvFTZH09Nvkd7BSLJWzFIwEfJkCJ6lB
MJYsFFu8+HtLiOxHfdLNlnsVLfXKA8Noqir29q3TZe3FXH4pDPxPUe5foMr5DH55
h4Mp10/5fHWTVWCEInymcCjh/eaUSQB5p+J33PB8a8avJc4E9uYMgmbGRTBV0ppn
IQd3YkJj7lagd933ED7W7bIIZGxBQ4/Sctxx27jo0yKsNGFlKnJhuQCFz3/vvRjy
SkMkt1OpHcm5aRPk+71sf7Ad4jMJv6dtSL9A95sW+HqFqItz9XYJ4TPdw2nsxTR4
GCi/r0PkhzVHLSpYesAe3MwcvBRiqWdabzg720QyHG++yH8wuLhsViBasydBgt+Y
eEzWb2H5M0qNOYwy9FgS8L6mZgnrLgzyQIBwb4+aFb8ygw7k8R47FppY4kXrrm4y
qfaI+sBR5wSzTfYUf7bCNYujtasJepsmQPLB12ozact1Oxce3sWqOa+ITGAUQULu
razqa19UpbYLg84hKwQhXx9NCzTW6LnEM6da2mh+3NKDj8IH5sE=
=uHhE
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
