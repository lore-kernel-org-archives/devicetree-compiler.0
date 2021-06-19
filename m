From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: Add markers on known properties
Date: Sat, 19 Jun 2021 19:22:49 +1000
Message-ID: <YM23achEk4QOEAAk@yekko>
References: <20210608204626.1545418-1-robh@kernel.org>
 <20210608204626.1545418-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9/zoHFhMB2Hip5e2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1624094575;
        bh=mHf20KKAg45Ow8AsYjKi6wxAPwpWjDU+kQrO/y1tiyY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ePuzLHvwi/pgKI4+vwQQUmtEMdf/8Pbv8qVwzlr9dEt2Jk6+2qxuLaWp2HszhNG9q
         U714allflWXorpeNZeeRtCUiajdV4eiI8anR4ThMurgJkcRnn4V7Q+QcyoFjL5Mpkd
         2r9NDAfO07hzJ4NQMDiIiqK1WcZk3MHm91PkhPdo=
Content-Disposition: inline
In-Reply-To: <20210608204626.1545418-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--9/zoHFhMB2Hip5e2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 03:46:24PM -0500, Rob Herring wrote:
> For properties we already have checks for, we know the type and how to
> parse them. Use this to add type and phandle markers so we have them when
> the source did not (e.g. dtb format).
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> v2:
>  - Set marker.ref on phandle markers
>  - Avoid adding markers if there's any conflicting type markers.
> ---
>  checks.c | 102 ++++++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 82 insertions(+), 20 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index e6c7c3eeacac..0f51b9111be1 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -58,6 +58,38 @@ struct check {
>  #define CHECK(nm_, fn_, d_, ...) \
>  	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> =20
> +static struct marker *marker_add(struct marker **list, enum markertype t=
ype,
> +				 unsigned int offset)

Now that this is only conditionally adding markers, it needs a
different name.  Maybe "add_type_annotation".

> +{
> +	struct marker *m =3D *list;

Since this is strictly about type annotations (and you don't have
parameters for the necessary ref parameter for other things), an
assert() that the given type is a TYPE_* wouldn't go astray.

> +
> +	/* Check if we already have a different type or a type marker at the of=
fset*/
> +	for_each_marker_of_type(m, type) {
> +		if ((m->type >=3D TYPE_UINT8) && (m->type !=3D type))

I'm assuming the >=3D TYPE_UINT8 is about checking that this is a type
marker rather than a ref marker.  Adding a helper function for that
would probably be a good idea.  Putting it inline in dtc.h would make
it less likely that we break it if we ever add new marker types in
future.

Checking for m->type !=3D type doesn't seem useful to me.  If m->type =3D=3D
type then either it's at the same offset, in which case there's
nothing to do, or it's at a different offset in which case... well,
it's not totally clear what's going on, but it's probably safest to
leave it alone.

> +			return NULL;
> +		if (m->type =3D=3D type && m->offset =3D=3D offset)
> +			return NULL;
> +	}
> +
> +	m =3D xmalloc(sizeof(*m));
> +	m->type =3D type;
> +	m->offset =3D offset;
> +	m->next =3D NULL;
> +	m->ref =3D NULL;
> +
> +	/* Find the insertion point, markers are in order by offset */
> +	while (*list && ((*list)->offset < m->offset))
> +		list =3D &((*list)->next);
> +
> +	if (*list) {
> +		m->next =3D (*list)->next;
> +		(*list)->next =3D m;
> +	} else
> +		*list =3D m;
> +
> +	return m;
> +}
> +
>  static inline void  PRINTF(5, 6) check_msg(struct check *c, struct dt_in=
fo *dti,
>  					   struct node *node,
>  					   struct property *prop,
> @@ -260,8 +292,12 @@ static void check_is_cell(struct check *c, struct dt=
_info *dti,
>  	if (!prop)
>  		return; /* Not present, assumed ok */
> =20
> -	if (prop->val.len !=3D sizeof(cell_t))
> +	if (prop->val.len !=3D sizeof(cell_t)) {
>  		FAIL_PROP(c, dti, node, prop, "property is not a single cell");
> +		return;
> +	}
> +
> +	marker_add(&prop->val.markers, TYPE_UINT32, 0);
>  }
>  #define WARNING_IF_NOT_CELL(nm, propname) \
>  	WARNING(nm, check_is_cell, (propname))
> @@ -517,6 +553,7 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  		 * we treat it as having no phandle data for now. */
>  		return 0;
>  	}
> +	marker_add(&prop->val.markers, TYPE_UINT32, 0);
> =20
>  	phandle =3D propval_cell(prop);
> =20
> @@ -756,7 +793,7 @@ static void check_reg_format(struct check *c, struct =
dt_info *dti,
>  			     struct node *node)
>  {
>  	struct property *prop;
> -	int addr_cells, size_cells, entrylen;
> +	int addr_cells, size_cells, entrylen, offset;
> =20
>  	prop =3D get_property(node, "reg");
>  	if (!prop)
> @@ -774,10 +811,16 @@ static void check_reg_format(struct check *c, struc=
t dt_info *dti,
>  	size_cells =3D node_size_cells(node->parent);
>  	entrylen =3D (addr_cells + size_cells) * sizeof(cell_t);
> =20
> -	if (!is_multiple_of(prop->val.len, entrylen))
> +	if (!is_multiple_of(prop->val.len, entrylen)) {
>  		FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
>  			  "(#address-cells =3D=3D %d, #size-cells =3D=3D %d)",
>  			  prop->val.len, addr_cells, size_cells);
> +		return;
> +	}
> +
> +	for (offset =3D 0; offset < prop->val.len; offset +=3D entrylen)
> +		if (!marker_add(&prop->val.markers, TYPE_UINT32, offset))
> +			break;

I don't see any point to adding multiple markers.  Each type marker
indicates the type until the next marker, so just adding one has the
same effect.

>  }
>  WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
> =20
> @@ -785,7 +828,7 @@ static void check_ranges_format(struct check *c, stru=
ct dt_info *dti,
>  				struct node *node)
>  {
>  	struct property *prop;
> -	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
> +	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen, o=
ffset;
>  	const char *ranges =3D c->data;
> =20
>  	prop =3D get_property(node, ranges);
> @@ -821,6 +864,10 @@ static void check_ranges_format(struct check *c, str=
uct dt_info *dti,
>  			  "#size-cells =3D=3D %d)", ranges, prop->val.len,
>  			  p_addr_cells, c_addr_cells, c_size_cells);
>  	}
> +
> +	for (offset =3D 0; offset < prop->val.len; offset +=3D entrylen)
> +		if (!marker_add(&prop->val.markers, TYPE_UINT32, offset))
> +			break;
>  }
>  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
>  WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size=
_cells);
> @@ -1400,6 +1447,7 @@ static void check_property_phandle_args(struct chec=
k *c,
>  	for (cell =3D 0; cell < prop->val.len / sizeof(cell_t); cell +=3D cells=
ize + 1) {
>  		struct node *provider_node;
>  		struct property *cellprop;
> +		struct marker *m;
>  		int phandle;
> =20
>  		phandle =3D propval_cell_n(prop, cell);
> @@ -1416,19 +1464,6 @@ static void check_property_phandle_args(struct che=
ck *c,
>  			continue;
>  		}
> =20
> -		/* If we have markers, verify the current cell is a phandle */
> -		if (prop->val.markers) {
> -			struct marker *m =3D prop->val.markers;
> -			for_each_marker_of_type(m, REF_PHANDLE) {
> -				if (m->offset =3D=3D (cell * sizeof(cell_t)))
> -					break;
> -			}
> -			if (!m)
> -				FAIL_PROP(c, dti, node, prop,
> -					  "cell %d is not a phandle reference",
> -					  cell);
> -		}
> -

Why are you removing this part of the check?

>  		provider_node =3D get_node_by_phandle(root, phandle);
>  		if (!provider_node) {
>  			FAIL_PROP(c, dti, node, prop,
> @@ -1454,7 +1489,13 @@ static void check_property_phandle_args(struct che=
ck *c,
>  			FAIL_PROP(c, dti, node, prop,
>  				  "property size (%d) too small for cell size %d",
>  				  prop->val.len, cellsize);
> +			break;
>  		}
> +
> +		marker_add(&prop->val.markers, TYPE_UINT32, cell * sizeof(cell_t));
> +		m =3D marker_add(&prop->val.markers, REF_PHANDLE, cell * sizeof(cell_t=
));
> +		if (m)
> +			m->ref =3D provider_node->fullpath;
>  	}
>  }
> =20
> @@ -1596,7 +1637,7 @@ static void check_interrupts_property(struct check =
*c,
>  	struct node *root =3D dti->dt;
>  	struct node *irq_node =3D NULL, *parent =3D node;
>  	struct property *irq_prop, *prop =3D NULL;
> -	int irq_cells, phandle;
> +	int irq_cells, phandle, offset;
> =20
>  	irq_prop =3D get_property(node, "interrupts");
>  	if (!irq_prop)
> @@ -1614,6 +1655,8 @@ static void check_interrupts_property(struct check =
*c,
> =20
>  		prop =3D get_property(parent, "interrupt-parent");
>  		if (prop) {
> +			struct marker *m;
> +
>  			phandle =3D propval_cell(prop);
>  			if ((phandle =3D=3D 0) || (phandle =3D=3D -1)) {
>  				/* Give up if this is an overlay with
> @@ -1629,10 +1672,16 @@ static void check_interrupts_property(struct chec=
k *c,
>  				FAIL_PROP(c, dti, parent, prop, "Bad phandle");
>  				return;
>  			}
> -			if (!node_is_interrupt_provider(irq_node))
> +			if (!node_is_interrupt_provider(irq_node)) {
>  				FAIL(c, dti, irq_node,
>  				     "Missing interrupt-controller or interrupt-map property");
> +				return;
> +			}
> =20
> +			marker_add(&prop->val.markers, TYPE_UINT32, 0);
> +			m =3D marker_add(&prop->val.markers, REF_PHANDLE, 0);
> +			if (m)
> +				m->ref =3D irq_node->fullpath;
>  			break;
>  		}
> =20
> @@ -1655,7 +1704,12 @@ static void check_interrupts_property(struct check=
 *c,
>  		FAIL_PROP(c, dti, node, prop,
>  			  "size is (%d), expected multiple of %d",
>  			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
> +		return;
>  	}
> +
> +	for (offset =3D 0; offset < irq_prop->val.len; offset +=3D irq_cells * =
sizeof(cell_t))
> +		if (!marker_add(&irq_prop->val.markers, TYPE_UINT32, offset))
> +			break;

Again, I don't see any point to adding multiple markers.

>  }
>  WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);
> =20
> @@ -1763,6 +1817,7 @@ static struct node *get_remote_endpoint(struct chec=
k *c, struct dt_info *dti,
>  					struct node *endpoint)
>  {
>  	int phandle;
> +	struct marker *m;
>  	struct node *node;
>  	struct property *prop;
> =20
> @@ -1776,8 +1831,15 @@ static struct node *get_remote_endpoint(struct che=
ck *c, struct dt_info *dti,
>  		return NULL;
> =20
>  	node =3D get_node_by_phandle(dti->dt, phandle);
> -	if (!node)
> +	if (!node) {
>  		FAIL_PROP(c, dti, endpoint, prop, "graph phandle is not valid");
> +		return NULL;
> +	}
> +
> +	marker_add(&prop->val.markers, TYPE_UINT32, 0);
> +	m =3D marker_add(&prop->val.markers, REF_PHANDLE, 0);
> +	if (m)
> +		m->ref =3D node->fullpath;
> =20
>  	return node;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9/zoHFhMB2Hip5e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDNt2YACgkQbDjKyiDZ
s5K4dQ/+IhHB2B9CGkpXqdQCmL1tyh9OIFf5pWo2C0I833lbrEIGHsXxuff6OZd2
E0idnxenml/+wbwzJriROdda541/BTQvVOwy/5iGz80GldMkJwHIlvutLY2nbauX
7GSktDOydTiHnJjnB5zqPXaG1JkhpFACtosvjaWekQ8ngICMPQzfDX4JfLCOP39H
Z8sgqJCIFMpdrr1LrvstqNEL1kLSq/N6ZoM7RR5hCk5QEN5HpZbEF0GeWIcEB/8p
UFR6iWWuFnb/tuwXaz/74cvGmjvdNakWLA1Cebv0vFaNxMtpHtQqFESHy5RA5pOp
k4qk1Ax7puSqRB2I09HVVe9naQNz/ZPZV4pL8nlURkiu9SB73Bul+PeQspf7AwBy
4u0yYnhuvKIIJXDDfdr1USdQAjChLxL2o5eimYNQ3GZNYwcMC1AHpr6tPlul5X6u
cmsASNwyzTlN/rJjzAEgGGZ5YLFYqPNgXv/5dsJoDRd11E/vnic5BxL1Hh2bvrig
uxHHZEhnfl/5c1BC8qXtzfqymHzRXbbwZ4hs2tzloDCzy/Q1ussTp7vvK4ARmiKZ
d0E371FRbdsGR7IGOz5IXjk+qWCEjNy7J/05y1oNqDH2A0HHEgPybJ6C3zJMSjfS
U4LJJU1RfRXeiAGIECVlDvBwpas47jRWp3J1CqfUHJ20rapdjbg=
=K51U
-----END PGP SIGNATURE-----

--9/zoHFhMB2Hip5e2--
