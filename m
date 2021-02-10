From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: Error on node-name and property name being the
 same
Date: Wed, 10 Feb 2021 11:08:27 +1100
Message-ID: <20210210000827.GB4450@yekko.fritz.box>
References: <20210209175059.60057-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612919802;
        bh=pbg2r7EbCQcDpdFcxzHwfUTIrPV9v5gSaLz8jcDWPho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LGxoFpJluoqaAzIoYfj2BPzs3KOdgPq/SvwR0ZohjEAPyj2InMjUd+A3IAYaoWHpR
         Y3iJLzmVvS+KHdOqhZEBL82y25Sw2r+KV8AQvFs2pN1ZUAIVPXX6Y7FpVFY/2/W7iM
         NGVjnXm2zcanGlW9j+sqhtJMOyZh+fsW/7qKIQcY=
Content-Disposition: inline
In-Reply-To: <20210209175059.60057-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-5wv7dgnIgG8@public.gmane.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 11:50:59AM -0600, Kumar Gala wrote:
> Treat a node-name and property name at the same level of tree as
> an error.
>=20
> Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Nack.  Discouraging/banning this at the spec level for future trees is
reasonable.  But dtc should be able to handle old trees that *do* have
node/property conflicts as well.

> ---
>  checks.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 17cb689..3f46043 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -330,6 +330,22 @@ static void check_node_name_format(struct check *c, =
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
> +	if (node->parent) {
> +		for_each_property(node->parent, prop) {
> +			if (strcmp(node->name, prop->name) =3D=3D 0)
> +				FAIL(c, dti, node, "node name and property name conflict");
> +		}
> +	}
> +}
> +ERROR(node_name_vs_property_name, check_node_name_vs_property_name,
> +      NULL, &node_name_chars);
> +
>  static void check_unit_address_vs_reg(struct check *c, struct dt_info *d=
ti,
>  				      struct node *node)
>  {
> @@ -1796,7 +1812,7 @@ WARNING(graph_endpoint, check_graph_endpoint, NULL,=
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

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjI/sACgkQbDjKyiDZ
s5JuwA/+LJshN+ZURTw8drdhukAbafJW/sHvMn7IKL/ivBVnt/24H9BLHpgS2+lu
s0+nYQVWOV4ro2Ib7lV5jqGoWrEG8qHmFRrtKneqHOwpwc8ONbyjIkgFHKkvK0pU
rBgMSaERe6Xswr9TT8ZEwXvBLArldyOH4emcPrtZ9BZBU0ThigLK88xm/SlRxM61
28jtQHAvPNgFmnWsun8KIcg+0eJmBKHqPuWC2dsKIdPgq0XE9iMvUUEuCqmVisbq
io43QxPLPP091LjY/AGK2CD05ul+6QnAkUjbagXygCaThTBjCgSeZRREeKg/4Wtg
kOZsqkuXJGdEvk6AprtD7yaKEde++CWxQQiH/RABfe1R8enConTmByriro4jaB5S
6mUe8cejIWea/n/eFn8I3IQpb2pV4TLOCvG4KFARQ/L4fsZtygHMAsxG56IXmDW3
0yLbAddhgNklytftjdap224+jpPgFw9G5/KrpHNo69MMSMp+ueZyjni97LOCwXi5
5BylizNhah8haM1KuSuFjzVcIvnOBnj20NPM+FFy3yvDo89tbjZgEKuS2A3P4bKC
ffocG5jDfT2gBeTTjHt2FkM4OdLLf0qu4UNitw3fW11Ap5qPLwKdF7iSrmeTo4w8
jGLy0iiFQrSF3hILFU7Eiw4Zcp4iybRWcoaOu5NwbNbKDRHBcoc=
=bwa9
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
