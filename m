From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 3/5] checks: Add markers on known properties
Date: Mon, 11 Oct 2021 16:09:32 +1100
Message-ID: <YWPHDJBS51Ne2fMT@yekko>
References: <20210727183023.3212077-1-robh@kernel.org>
 <20210727183023.3212077-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8PIXu6CW4nDUXuJR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1633936793;
        bh=f1V1UzRWaMkVDBFvolPbB7d/JwZwCMwix44v5fK5V9Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nw74DORahBUBc3EY6uMUXvalmQRpxz4Cet17NAH7m9QQ7O13zo6NHaaQ+AR9P9/Z7
         wFdhIHT8b5FC06wEjys3PO/8a+DFCcb73nBKjt/NZudPne04xX1WjbjjwN5e4mQ5Sb
         E3Go7H/K8IprEbFt1caQCbxgmbK0Ty+lrQ/WF5iM=
Content-Disposition: inline
In-Reply-To: <20210727183023.3212077-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--8PIXu6CW4nDUXuJR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 12:30:21PM -0600, Rob Herring wrote:
> For properties we already have checks for, we know the type and how to
> parse them. Use this to add type and phandle markers so we have them when
> the source did not (e.g. dtb format).
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> v3:
>  - Rework marker_add() and callers into 3 functions. marker_add() just
>    adds a marker. marker_add_type_annotations() adds type annotations
>    at each entry offset. marker_add_phandle_annotation() adds a phandle
>    and type annotation at a phandle offset.
>  - Only add type info when no type markers are present at all.
>  - Keep phandle ref check on phandle+args properties.
> v2:
>  - Set marker.ref on phandle markers
>  - Avoid adding markers if there's any conflicting type markers.
> ---
>  checks.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 82 insertions(+), 5 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index e2690e90f90c..b7ac1732b0b8 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -58,6 +58,56 @@ struct check {
>  #define CHECK(nm_, fn_, d_, ...) \
>  	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> =20
> +static struct marker *marker_add(struct marker **list, enum markertype t=
ype,
> +				 unsigned int offset, char * ref)
> +{
> +	struct marker *m =3D *list;
> +
> +	m =3D xmalloc(sizeof(*m));
> +	m->type =3D type;
> +	m->offset =3D offset;
> +	m->next =3D NULL;
> +	m->ref =3D ref;
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
> +static void marker_add_type_annotations(struct property *prop,
> +					enum markertype type,
> +					unsigned int entrylen)
> +{
> +	unsigned int offset;
> +
> +	assert(is_type_marker(type));
> +
> +	if (has_type_markers(prop->val.markers))
> +		return;
> +
> +	for (offset =3D 0; offset < prop->val.len; offset +=3D entrylen)
> +		marker_add(&prop->val.markers, type, offset, NULL);
> +}
> +
> +static void marker_add_phandle_annotation(struct property *prop,
> +					  unsigned int cell,
> +					  char *ref)
> +{
> +	if (!cell && has_type_markers(prop->val.markers))
> +		return;

So, you allow adding a phandle annotation if the property has no
existing type markers *or* you're adding it after position 0.  That
seems a bit arbitrary and fragile.

> +
> +	marker_add(&prop->val.markers, TYPE_UINT32, cell * sizeof(cell_t), NULL=
);
> +	marker_add(&prop->val.markers, REF_PHANDLE, cell * sizeof(cell_t), ref);
> +}
> +
>  static inline void  PRINTF(5, 6) check_msg(struct check *c, struct dt_in=
fo *dti,
>  					   struct node *node,
>  					   struct property *prop,
> @@ -260,8 +310,12 @@ static void check_is_cell(struct check *c, struct dt=
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
> +	marker_add_type_annotations(prop, TYPE_UINT32, prop->val.len);
>  }
>  #define WARNING_IF_NOT_CELL(nm, propname) \
>  	WARNING(nm, check_is_cell, (propname))
> @@ -526,6 +580,8 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  		return 0;
>  	}
> =20
> +	marker_add_type_annotations(prop, TYPE_UINT32, prop->val.len);
> +
>  	return phandle;
>  }
> =20
> @@ -774,10 +830,14 @@ static void check_reg_format(struct check *c, struc=
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
> +	marker_add_type_annotations(prop, TYPE_UINT32, entrylen);
>  }
>  WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
> =20
> @@ -821,6 +881,8 @@ static void check_ranges_format(struct check *c, stru=
ct dt_info *dti,
>  			  "#size-cells =3D=3D %d)", ranges, prop->val.len,
>  			  p_addr_cells, c_addr_cells, c_size_cells);
>  	}
> +
> +	marker_add_type_annotations(prop, TYPE_UINT32, entrylen);
>  }
>  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
>  WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size=
_cells);
> @@ -1389,6 +1451,7 @@ static void check_property_phandle_args(struct chec=
k *c,
>  {
>  	struct node *root =3D dti->dt;
>  	unsigned int cell, cellsize =3D 0;
> +	bool has_type =3D has_type_markers(prop->val.markers);
> =20
>  	if (!is_multiple_of(prop->val.len, sizeof(cell_t))) {
>  		FAIL_PROP(c, dti, node, prop,
> @@ -1417,7 +1480,7 @@ static void check_property_phandle_args(struct chec=
k *c,
>  		}
> =20
>  		/* If we have markers, verify the current cell is a phandle */
> -		if (prop->val.markers) {
> +		if (has_type) {
>  			struct marker *m =3D prop->val.markers;
>  			for_each_marker_of_type(m, REF_PHANDLE) {
>  				if (m->offset =3D=3D (cell * sizeof(cell_t)))
> @@ -1454,7 +1517,11 @@ static void check_property_phandle_args(struct che=
ck *c,
>  			FAIL_PROP(c, dti, node, prop,
>  				  "property size (%d) too small for cell size %d",
>  				  prop->val.len, cellsize);
> +			break;
>  		}
> +
> +		if (!has_type)
> +			marker_add_phandle_annotation(prop, cell, provider_node->fullpath);
>  	}
>  }
> =20
> @@ -1629,10 +1696,13 @@ static void check_interrupts_property(struct chec=
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
> +			marker_add_phandle_annotation(prop, 0, irq_node->fullpath);
>  			break;
>  		}
> =20
> @@ -1655,7 +1725,10 @@ static void check_interrupts_property(struct check=
 *c,
>  		FAIL_PROP(c, dti, node, prop,
>  			  "size is (%d), expected multiple of %d",
>  			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
> +		return;
>  	}
> +
> +	marker_add_type_annotations(irq_prop, TYPE_UINT32, irq_cells * sizeof(c=
ell_t));
>  }
>  WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);
> =20
> @@ -1776,8 +1849,12 @@ static struct node *get_remote_endpoint(struct che=
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
> +	marker_add_phandle_annotation(prop, 0, node->fullpath);

Shouldn't this be the same as check_property_phandle_args() and verify
the type annotation if there's one already, only adding it if there
are no pre-existing types.

> =20
>  	return node;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8PIXu6CW4nDUXuJR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFjxwoACgkQbDjKyiDZ
s5Ir3Q/+IRkzvKxoXiZYPgq/MisQvqfuYelzSxKyuTnpISD7jrtF1VmkAuSwAShC
CKMoF+GhFNqHIqeICNrdf3GyqOAQH2eeXMW2nmKewt1267Ej31aE3CKm8j/GIuBQ
KU2wJo/1BCPorLAO3RDIAxUWz/7huSpF5XN3uKXngtIj/q5yqi25Xvf5mdhmn7Dq
hMhN833xR0xrfEfAHWxhemq6ExUfJ9AWSh6r0h21wLGNLJnqlj+qb7rTdGkoS+V3
BBUElzi8+kzSpgdL/MPrKjb9p9eE6ULG9hsKZOHQU98VnzyJSnoPL8fyevW8TVg1
qKqF/GMZj4qZplQ8zbLRek/9CEMDDXrK86TXZKp/4RinTCqOrUDe5pAFd38IZdCx
Ly+2ZvhaUIHPEtmZLrPcprEwOplzbQb5KZyOvoZXZN4o0ML9zHMnmB/mZir+FWal
mVusbSQ8fK4oqHdCfo7KemWexVhe7GSZ+vOnMvQJ/azxF4m4j+Z3ulonTcGf9eCG
22+NB1Ci/rdeScLuQVEXrATNN3UKw3F1hZXpOcpm+dJaRTi1BJ1r8K46CAc0cTRM
4TQUf/dcX+QFIW65hLGEdp/e9Kk4CU73+pYmf0ULL9rsFwj7L6m16XrkqT21y/5t
0mZm5PvM/BaagI6g2ThXVfsz4Y8KuicVhm7maAG4mZzqc9YMGEA=
=/YpQ
-----END PGP SIGNATURE-----

--8PIXu6CW4nDUXuJR--
