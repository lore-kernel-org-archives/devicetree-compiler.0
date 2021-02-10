From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3] checks: Warn on node-name and property name being the
 same
Date: Wed, 10 Feb 2021 15:49:27 +1100
Message-ID: <20210210044927.GJ4450@yekko.fritz.box>
References: <20210209175059.60057-1-kumar.gala@linaro.org>
 <20210210041510.382114-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PEkEgRdBLZYkpbX2"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612932573;
        bh=hEYgWmwK2MJzIqjynHgSjkAN5brP2ZxdNsihbPd/QVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FATvFTT5yLY7BAQ4+uOijnRSLWIkzdtPKthTVhYMU+DLjmavGcfB9BRWarhJHTRrA
         viYGLfXYAwl7BqFhcV0e+ogLjb1sRPcGFDNGCo7TOBPWgJeeQ5vnBYY1I8Zd6AjgW2
         A4u4Ttmm8+UvMTMsSTUUuczOHJBBDRWpuV1U3Fps=
Content-Disposition: inline
In-Reply-To: <20210210041510.382114-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-5wv7dgnIgG8@public.gmane.org


--PEkEgRdBLZYkpbX2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 10:15:10PM -0600, Kumar Gala wrote:
> Treat a node-name and property name at the same level of tree as
> a warning
>=20
> Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 17cb689..7f9e670 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -330,6 +330,23 @@ static void check_node_name_format(struct check *c, =
struct dt_info *dti,
>  }
>  ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
> =20
> +static void check_node_name_vs_property_name(struct check *c,
> +					     struct dt_info *dti,
> +					     struct node *node)
> +{
> +	struct property *prop;
> +
> +	if (!node->parent)
> +		return;
> +
> +	for_each_property(node->parent, prop) {
> +		if (streq(node->name, prop->name))
> +			FAIL(c, dti, node, "node name and property name conflict");
> +	}

This seems a somewhat roundabout way of detecting this.  Instead of
having a check for "sibling" properties of the same name, why not just do:

	for_each_subnode(...) {
		if (get_property(node, subnode->name))
			FAIL(..., "Has both subnode and property named %s", subnode->name);
	}


> +}
> +WARNING(node_name_vs_property_name, check_node_name_vs_property_name,
> +	NULL, &node_name_chars);
> +
>  static void check_unit_address_vs_reg(struct check *c, struct dt_info *d=
ti,
>  				      struct node *node)
>  {
> @@ -1796,7 +1813,7 @@ WARNING(graph_endpoint, check_graph_endpoint, NULL,=
 &graph_nodes);
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> -	&name_is_string, &name_properties,
> +	&name_is_string, &name_properties, &node_name_vs_property_name,
> =20
>  	&duplicate_label,
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PEkEgRdBLZYkpbX2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjZdQACgkQbDjKyiDZ
s5LX6g//ZekPEa+cHWA+1dBdTroyUe2bQICQ1NdkTfV2zOvZ7hfttInYa6bXEwK3
9wh8/f4NZQb2Ex3rVjV2Di7XTxzeZcACiUw0Qq+1LcJJV14JxmU79LPFkLe3qcYJ
GBZvLg3bi/XY3pxVospYeMoaLj1B3bEjr7fSA7VnHDBghg/6RXQbB9xraaC+GXlg
Y89zPHQwiC1eQTAlBvNxuYfabBh7LMfoG0O2snwfARvXLvhzEUP94mH0gJR2mQbL
y74a2CQOO/7xCmxRxxPQvduzYo+VJtOfHSJrn0smhiYxeCQgvtbwFmObQInsW1B9
FjwLdjrb0vYxWOCPPrpvy1J/Sduhe1cZG3fHCBpJUVFpEQW5XBBMcI081qw9ZmVJ
AW1494aFHMLPTQQd+iKMV1Yfc18Oi1vorbuFCeetRAaBzW4cCT1ZQZUaERbTXBSH
9oFy2ZG9D5kaGElFZNqyWyrUb1d58idc8eyAH//3SWegEsbS21JX0KNFLi2g/eHw
kb24B0EiRbRcnv6R3wdVaU5EXsjdNL4CwuGw5+BFND5s+KQWow+8C/ieEqlxSw45
7qiS/MHPQq12jpoEFHBivBHRxUEd/Nx9fK/ecFa75YOQDZSTth2SdJuTIwUPTaPR
y2HJXAH4FYCCPJwoVZgDHUzXDiSwtGqY5M3mCLHLQUuddalDbIk=
=gyhN
-----END PGP SIGNATURE-----

--PEkEgRdBLZYkpbX2--
