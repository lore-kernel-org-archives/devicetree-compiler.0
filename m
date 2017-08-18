From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] checks: add phandle with arg property checks
Date: Fri, 18 Aug 2017 14:35:02 +1000
Message-ID: <20170818043502.GQ5509@umbus.fritz.box>
References: <20170814214807.338-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cmVHo2jXx4bdYlgS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1503031388;
        bh=biyp2wWFb1Oaa/MJwBNAfaORua4YRyg6SNwUPDHI/K0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=boH5vD0KjC+GxNfzrMDolfBTHVU48JBC8maxybk2w2sXW0fR3rtBF23S9z22E9TvP
         3UQDo+w6KReFDQp2gk195argNZn4lzopHgdk7B8tqzrEHS04g8kDwhGNLnZRUhHHmx
         ylznypTaGeB2ezjjZngovRP4/GUm1vkAc1o0MyPs=
Content-Disposition: inline
In-Reply-To: <20170814214807.338-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--cmVHo2jXx4bdYlgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2017 at 04:48:06PM -0500, Rob Herring wrote:

Yay! Someone actually implementing checks.

> Many common bindings follow the same pattern of client properties
> containing a phandle and N arg cells where N is defined in the provider
> with a '#<specifier>-cells' property. Add a checks for properties
> following this pattern.

I think this description would be easier to follow if you led with an examp=
le.

>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Looks pretty good, though I have some suggestions.

> ---
>  checks.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 117 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index afabf64337d5..c0450e118043 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -956,6 +956,120 @@ static void check_obsolete_chosen_interrupt_control=
ler(struct check *c,
>  WARNING(obsolete_chosen_interrupt_controller,
>  	check_obsolete_chosen_interrupt_controller, NULL);
> =20
> +struct provider {
> +	const char *prop_name;
> +	const char *cell_name;
> +	bool optional;
> +};
> +
> +static void check_property_phandle_args(struct check *c,
> +					  struct dt_info *dti,
> +				          struct node *node,
> +				          struct property *prop,
> +				          const struct provider *provider)
> +{
> +	struct marker *m =3D prop->val.markers;
> +
> +	if (!m) {
> +		FAIL(c, dti, "Missing phandles in %s:%s",
> +		     node->fullpath, prop->name);
> +		return;
> +	}
> +	for_each_marker_of_type(m, REF_PHANDLE) {

So going through the markers I think is not the best approach.
That'll work if the source contains a reference here, which it usually
will, but there are some circumstances where it could contain a "raw"
phandle value (the most obvious being when you're decompiling an
existing dtb).

But I don't think you really need to.  Instead you should be able to
read the actual value, look it up with get_node_by_phandle().  You can
make this check dependent on fixup_phandle_references to make sure
it's executed after the references are resolved.

That should also let you more strictly verify the property in the
client node, including checking for misaligned entries of extraneous bits.

> +		int cellsize;
> +		struct node *root =3D dti->dt;
> +		struct node *provider_node;
> +		struct property *cellprop;
> +
> +		provider_node =3D get_node_by_ref(root, m->ref);
> +		if (!provider_node) {
> +			FAIL(c, dti, "Could not get provider for %s:%s",
> +			     node->fullpath, prop->name);
> +			break;
> +		}

AFAIK the "provider" terminology isn't standardized somewhere.  It's a
reasonable term internally, but if can rephrase to it in the displayed
messages that would be a bonus.

> +		cellprop =3D get_property(provider_node, provider->cell_name);
> +		if (cellprop) {
> +			cellsize =3D propval_cell(cellprop);
> +		} else if (provider->optional) {
> +			cellsize =3D 0;
> +		} else {
> +			FAIL(c, dti, "Missing %s in provider %s for %s",
> +			     provider->cell_name,
> +		     	     provider_node->fullpath,
> +	     		     node->fullpath);
> +			break;
> +		}
> +
> +		if (prop->val.len < ((cellsize + 1) * sizeof(cell_t))) {
> +			FAIL(c, dti, "%s property size (%d) too small for cell size %d in %s",
> +			     prop->name, prop->val.len, cellsize, node->fullpath);
> +		}
> +	}
> +}
> +
> +static const struct provider providers[] =3D {
> +	{ "clocks", "#clock-cells" },
> +	{ "phys", "#phy-cells" },
> +	{ "interrupts-extended", "#interrupt-cells" },
> +	{ "mboxes", "#mbox-cells" },
> +	{ "pwms", "#pwm-cells" },
> +	{ "dmas", "#dma-cells" },
> +	{ "resets", "#reset-cells" },
> +	{ "hwlocks", "#hwlock-cells" },
> +	{ "power-domains", "#power-domain-cells" },
> +	{ "io-channels", "#io-channel-cells" },
> +	{ "iommus", "#iommu-cells" },
> +	{ "mux-controls", "#mux-control-cells" },
> +	{ "cooling-device", "#cooling-cells" },
> +	{ "thermal-sensors", "#thermal-sensor-cells" },
> +	{ "sound-dais", "#sound-dai-cells" },
> +	{ "msi-parent", "#msi-cells", true },
> +	{ NULL },
> +};

How hard would it be to use macros to make each of these providers
different check structures.  I think the output would be a bit more
useful if errors in different types of these things was reported as a
different check failure rather than one big generic one.

It does mean listing everything in the check_table which is a pain.  I
would really like to change things so that a single macro can both
declare the check and add it to the master list, but I haven't thought
of a portable way to do that so far.

If you do need the providers array, ARRAY_SIZE() is preferred over a
terminator NULL.

> +static void check_provider_cells_property(struct check *c,
> +					  struct dt_info *dti,
> +				          struct node *node)
> +{
> +	int i;
> +
> +	for (i =3D 0; providers[i].prop_name; i++) {
> +		struct property *prop =3D get_property(node, providers[i].prop_name);
> +		if (!prop)
> +			continue;
> +		check_property_phandle_args(c, dti, node, prop, &providers[i]);
> +	}
> +}
> +WARNING(provider_cells_property, check_provider_cells_property, NULL);
> +
> +static void check_gpio_cells_property(struct check *c,
> +					  struct dt_info *dti,
> +				          struct node *node)
> +{
> +	struct property *prop;
> +
> +	for_each_property(node, prop) {
> +		char *str;
> +		struct provider provider;
> +
> +		/* Skip over false matches */
> +		if (strstr(prop->name, "nr-gpio"))
> +			continue;
> +
> +		str =3D strrchr(prop->name, '-');
> +		if (!str || !(streq(str, "-gpio") || streq(str, "-gpios")))
> +			continue;
> +
> +		provider.prop_name =3D prop->name;
> +		provider.cell_name =3D "#gpio-cells";
> +		provider.optional =3D false;
> +		check_property_phandle_args(c, dti, node, prop, &provider);
> +	}
> +
> +}
> +WARNING(gpio_cells_property, check_gpio_cells_property, NULL);

Since the gpio stuff is a bit tweaker, it would be good to go into a
separate patch.  Then the commit message can explain what the logic
here is for (I'm having a little trouble following it).

>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -987,6 +1101,9 @@ static struct check *check_table[] =3D {
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> =20
> +	&provider_cells_property,
> +	&gpio_cells_property,
> +
>  	&always_fail,
>  };
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cmVHo2jXx4bdYlgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmWbnQACgkQbDjKyiDZ
s5IpzRAA1mk96Os0v+iHIp34KAK2cwsk1BB8N+nFX9I43u3P8GYt3NM2I64XPzyw
gJnLjDDUvojNcQfENGMVt2gzHisUKyeH/He1monEwlE/jY+EZSUTBiGRREDe4BIK
k5RVPMbsJYm43U8c0oFzc8xU/1rXP1Zf8lnx+t0VUnhbmWUOyz32kU1dzS+lAt71
voqt7WEtUodUuJQxsZO/S02UWQpbT5QsVp78B6PjwMxDdLjjK4w3O1JUloYI+r6v
nFJzs4Zhk792VJOTFzWVvfiBYYPIC0d/gGTqUrdqnhoItx55ne4U59W+RNdew1/Q
TM3O/QXcmvA9hieGnMaaGli0eftWTR3GEWKqbiU/2N76oKlmUwQOKhZQ1Jv/v2dJ
zbq+NUHCVCKFjeYqvFPk1Th2g5qwfZPZcAHgjgIpA1vpAOtWPYSxi9fSIW6NZqjv
l9iiXgW89XSAj2gVK8edNVa8g6Ofcp3gpaDb0qB2WOpTrTNi7jtwxXXFFtxhPPfm
9Lcmc86Stxt4wFyILr9Agseo5EIPA/km9wiL8CXQBlSZbq2NW1xPxjKefPx+HPCn
a69GBfqnsvP1eg+QFVSbVgC3NXVSM5bbDUHH7R9rHY9JISGwDoMvLOHku+wKCInx
jHZnxIHyaMsrXb0RmW3cokfU1ouFkEp7MiKtx0+JeMdXaOZ/v0c=
=kUkn
-----END PGP SIGNATURE-----

--cmVHo2jXx4bdYlgS--
