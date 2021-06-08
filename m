From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/5] checks: Add markers on known properties
Date: Tue, 8 Jun 2021 12:25:21 +1000
Message-ID: <YL7VETwYAct0B0Mq@yekko>
References: <20210526010335.860787-1-robh@kernel.org>
 <20210526010335.860787-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n9gv9mNaOMON1hPx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1623119149;
        bh=GCmpD/kdxmunnaHtkth90rlCO6FfJt5UcEkOFyXS0Uk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cVcX+3IGvqDaaMsNEL2+AJHl7nUsv1W3bPT/Mh91CQXXlfht7gvKzvNfO7hSR8uI+
         M7ORKDCuetG8ofFwKz8r0nS6Uik8R+oVNiS/0NFMe0PqbaBPf8p7/bLmIG4go9f7xd
         IEKVxQai+8V31cmLr6gGRxEzrR3SChONUlyYUvXM=
Content-Disposition: inline
In-Reply-To: <20210526010335.860787-5-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--n9gv9mNaOMON1hPx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:03:34PM -0500, Rob Herring wrote:
> For properties we already have checks for, we know the type and how to
> parse them. Use this to add type and phandle markers so we have them when
> the source did not (e.g. dtb format).
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 74 ++++++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 56 insertions(+), 18 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 7ff044df6837..69ad3eec50b5 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -58,6 +58,32 @@ struct check {
>  #define CHECK(nm_, fn_, d_, ...) \
>  	CHECK_ENTRY(nm_, fn_, d_, false, false, __VA_ARGS__)
> =20
> +static void marker_add(struct marker **list, enum markertype type, unsig=
ned int offset)
> +{
> +	struct marker *m =3D *list;
> +
> +	/* Check if we already have the same marker */
> +	for_each_marker_of_type(m, type)
> +		if (m->type =3D=3D type && m->offset =3D=3D offset)
> +			return;
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
> +}
> +
>  static inline void  PRINTF(5, 6) check_msg(struct check *c, struct dt_in=
fo *dti,
>  					   struct node *node,
>  					   struct property *prop,
> @@ -252,8 +278,12 @@ static void check_is_cell(struct check *c, struct dt=
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
> @@ -509,6 +539,7 @@ static cell_t check_phandle_prop(struct check *c, str=
uct dt_info *dti,
>  		 * we treat it as having no phandle data for now. */
>  		return 0;
>  	}
> +	marker_add(&prop->val.markers, TYPE_UINT32, 0);
> =20
>  	phandle =3D propval_cell(prop);
> =20
> @@ -748,7 +779,7 @@ static void check_reg_format(struct check *c, struct =
dt_info *dti,
>  			     struct node *node)
>  {
>  	struct property *prop;
> -	int addr_cells, size_cells, entrylen;
> +	int addr_cells, size_cells, entrylen, offset;
> =20
>  	prop =3D get_property(node, "reg");
>  	if (!prop)
> @@ -766,10 +797,15 @@ static void check_reg_format(struct check *c, struc=
t dt_info *dti,
>  	size_cells =3D node_size_cells(node->parent);
>  	entrylen =3D (addr_cells + size_cells) * sizeof(cell_t);
> =20
> -	if (!entrylen || (prop->val.len % entrylen) !=3D 0)
> +	if (!entrylen || (prop->val.len % entrylen) !=3D 0) {
>  		FAIL_PROP(c, dti, node, prop, "property has invalid length (%d bytes) "
>  			  "(#address-cells =3D=3D %d, #size-cells =3D=3D %d)",
>  			  prop->val.len, addr_cells, size_cells);
> +		return;
> +	}
> +
> +	for (offset =3D 0; offset < prop->val.len; offset +=3D entrylen)
> +		marker_add(&prop->val.markers, TYPE_UINT32, offset);

This doesn't seem quite right.  A 'reg' property could definitely be
u64s rather than u32s (amongst other possibilities, but u64 is the
most likely).  The user can even indicate that using /bits/ 64, but
this will overrule that.

>  }
>  WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
> =20
> @@ -777,7 +813,7 @@ static void check_ranges_format(struct check *c, stru=
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
> @@ -813,6 +849,9 @@ static void check_ranges_format(struct check *c, stru=
ct dt_info *dti,
>  			  "#size-cells =3D=3D %d)", ranges, prop->val.len,
>  			  p_addr_cells, c_addr_cells, c_size_cells);
>  	}
> +
> +	for (offset =3D 0; offset < prop->val.len; offset +=3D entrylen)
> +		marker_add(&prop->val.markers, TYPE_UINT32, offset);

Same thing for ranges.

>  }
>  WARNING(ranges_format, check_ranges_format, "ranges", &addr_size_cells);
>  WARNING(dma_ranges_format, check_ranges_format, "dma-ranges", &addr_size=
_cells);
> @@ -1408,19 +1447,6 @@ static void check_property_phandle_args(struct che=
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
>  		provider_node =3D get_node_by_phandle(root, phandle);
>  		if (!provider_node) {
>  			FAIL_PROP(c, dti, node, prop,
> @@ -1447,6 +1473,9 @@ static void check_property_phandle_args(struct chec=
k *c,
>  				  "property size (%d) too small for cell size %d",
>  				  prop->val.len, cellsize);
>  		}
> +
> +		marker_add(&prop->val.markers, REF_PHANDLE, cell * sizeof(cell_t));

This is definitely broken.  It's safe enough to add TYPE_ markers, but
REF_PHANDLE requires a label or path to be valid, which you don't add,
and have no way of deducing.  I'm kind of surprised you didn't cause a
crash in the later code that fixes up references with this.

> +		marker_add(&prop->val.markers, TYPE_UINT32, cell * sizeof(cell_t));
>  	}
>  }
> =20
> @@ -1588,7 +1617,7 @@ static void check_interrupts_property(struct check =
*c,
>  	struct node *root =3D dti->dt;
>  	struct node *irq_node =3D NULL, *parent =3D node;
>  	struct property *irq_prop, *prop =3D NULL;
> -	int irq_cells, phandle;
> +	int irq_cells, phandle, offset;
> =20
>  	irq_prop =3D get_property(node, "interrupts");
>  	if (!irq_prop)
> @@ -1625,6 +1654,8 @@ static void check_interrupts_property(struct check =
*c,
>  				FAIL(c, dti, irq_node,
>  				     "Missing interrupt-controller or interrupt-map property");
> =20
> +			marker_add(&prop->val.markers, TYPE_UINT32, 0);
> +			marker_add(&prop->val.markers, REF_PHANDLE, 0);

Ditto.

>  			break;
>  		}
> =20
> @@ -1647,7 +1678,11 @@ static void check_interrupts_property(struct check=
 *c,
>  		FAIL_PROP(c, dti, node, prop,
>  			  "size is (%d), expected multiple of %d",
>  			  irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)));
> +		return;
>  	}
> +
> +	for (offset =3D 0; offset < irq_prop->val.len; offset +=3D irq_cells * =
sizeof(cell_t))
> +		marker_add(&irq_prop->val.markers, TYPE_UINT32, offset);

Same problem as for reg and ranges.

>  }
>  WARNING(interrupts_property, check_interrupts_property, &phandle_referen=
ces);
> =20
> @@ -1771,6 +1806,9 @@ static struct node *get_remote_endpoint(struct chec=
k *c, struct dt_info *dti,
>  	if (!node)
>  		FAIL_PROP(c, dti, endpoint, prop, "graph phandle is not valid");
> =20
> +	marker_add(&prop->val.markers, TYPE_UINT32, 0);
> +	marker_add(&prop->val.markers, REF_PHANDLE, 0);
> +

And same problem with REF_PHANDLE.

>  	return node;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--n9gv9mNaOMON1hPx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC+1Q8ACgkQbDjKyiDZ
s5LSaBAAnSHR7wMb2Fx2BL1Ea0UDsMF5QaYGon8/NQPGIb8EmvZxrc2AVWPpyjnZ
jnE99urBuKR4Z73cbVwEN1+XVhLnSMrp2FI2Q8/bRbpn10XYCvnJz2sN02ckdK2A
97+eBUYvn+8VcXAaYqDQO3LRdrIOXhhrWNAjl+B88QJ+G2l7DtxN3zCxD/Y8KJEL
BN5tiTzLXC8HOyrRSVOcusH+Dr+0dEpE8OVjywS1Rm1gltSpowbM1bgp/Ii1cCIa
dgBn0Ohy9fBn2J1DlpIHdtxaI1HV2hED7aftzqCGlf1aOL9QmpbP6bwp2kcDA5Ov
PzbuaSjPUQorLiobngyMVY5fyicGJ5GGZ2e8H/WKxtdxxwvFzVjXYxKqzLzDXM1C
VlE358U2ri5Czm1aPLewzZieS7vApDqpZUWJJLVK8vhrB3naPB2YpGvcV6q5kRe+
1Np8PtAaXu2+dIKq9nhAdoCGQSk9E7C8yb2her3awF8H0A7Ftr37C9JGP9wajcEG
dMT9PSW/EU+TfVyTBt4dKVWWs0r8ENUGrL7tLrcOl0h8vrwTOblkyj2WOkVzHkuI
256YjrEqN5f6jkbB7sP4dlMqswrVp7CO38HOzeyg57Woyk9V9jbQYrAqFO0lQk2k
Q4CUh1MANhkPnQu2BMeOvhouMDpLoNj/N627CDrY3MyuY9DLwaA=
=bTFb
-----END PGP SIGNATURE-----

--n9gv9mNaOMON1hPx--
