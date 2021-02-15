From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4] checks: Warn on node-name and property name being the
 same
Date: Mon, 15 Feb 2021 17:17:43 +1100
Message-ID: <YCoSB02Wm1EqgxyW@yekko.fritz.box>
References: <20210209175059.60057-1-kumar.gala@linaro.org>
 <20210210193912.799544-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/lcb2dXJM8bOMa/+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1613370409;
        bh=IKNvqaeH3seBy9byFCriqXGDai9jF7/7P7b2JVcWJLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pbuFO/e6avcMu6Hm+ICm6h2SMBt37CD7rRvAFIOSiw/q8hKxtiL3mJwsNPYF7CwBl
         yogzck8n0AwZCtUmBgJw7h9Nmay0LSmTmOG0MHo0zjW8UuXX7a9QeB9dYPWEG+HeZ5
         uByJIAtNtPOWcAIRt2pfA6nfzkYAerXKzZgUeMMo=
Content-Disposition: inline
In-Reply-To: <20210210193912.799544-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: rob.herring-5wv7dgnIgG8@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--/lcb2dXJM8bOMa/+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 01:39:12PM -0600, Kumar Gala wrote:
> Treat a node-name and property name at the same level of tree as
> a warning

Applied, thanks.

>=20
> Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 48e7fe9..c420772 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -331,6 +331,20 @@ static void check_node_name_format(struct check *c, =
struct dt_info *dti,
>  }
>  ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
> =20
> +static void check_node_name_vs_property_name(struct check *c,
> +					     struct dt_info *dti,
> +					     struct node *node)
> +{
> +	if (!node->parent)
> +		return;
> +
> +	if (get_property(node->parent, node->name)) {
> +		FAIL(c, dti, node, "node name and property name conflict");
> +	}
> +}
> +WARNING(node_name_vs_property_name, check_node_name_vs_property_name,
> +	NULL, &node_name_chars);
> +
>  static void check_unit_address_vs_reg(struct check *c, struct dt_info *d=
ti,
>  				      struct node *node)
>  {
> @@ -1797,7 +1811,7 @@ WARNING(graph_endpoint, check_graph_endpoint, NULL,=
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

--/lcb2dXJM8bOMa/+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAqEgYACgkQbDjKyiDZ
s5JZTA//fSUS0RExjZLpjefTGBfPlklKnPnwpaWtrUiAvH7hIg4gIm4MucJrnT2/
f53Le+Eji+z89eUOt/v0vgr780Yw9TSwPe8MxKleApstPu3QDXUW6ZgTNkShpvVQ
wvisuR6yAdPh4kPGJ3gNeOYp7oHoo1mqcCDJboe/FF3oBgbwccrbE5ymVBfntanh
cVYXaxOuxh9Q/3PkWEJa5sz0GX0548M5PJrSqGzWWv4M2xyVIDYSr6pT2KPIl10u
51eCkYkfCiYdQZ1uXz7VTUuWIvutOaAZh2h2YTw+HbgbqjQ8woFHodbZCQkfQorU
dMa8wru3WPNVnrUWI2Pe2kMHKTdH6hAwfZL0l1vQVC/YoeBpyupaiVdDJF9j4oAL
iBLzxI48bDGYbz7Sns7jXqv5SAR2m9Ggd53X2r+aVu97PtwWkZ5TojAOGMFkclLL
57h+37gXPUvUbh94g+CXQJimIQnhR7ZD06AmERS/4Lof1cyd5TZnVe6lACSmA20Z
xiNLH/VQL1qk3pNMbK1zjJK9CARTqc9PGxo3Q54Ehnu45PpnGcU0EkmvNYIkFREn
stZV4r//Bpsiyzq9R0X7o0psC13LsnU0MRnl0eqae47msYf4XaofwtkBIzMGTLB5
309QFxdE5iucCwi9eQWuJQR0fvqRWjj5b60Ayypf1oewKb1D2gw=
=Ys4p
-----END PGP SIGNATURE-----

--/lcb2dXJM8bOMa/+--
