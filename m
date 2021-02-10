From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] checks: Error on node-name and property name being the
 same
Date: Wed, 10 Feb 2021 12:57:45 +1100
Message-ID: <20210210015745.GF4450@yekko.fritz.box>
References: <20210209175059.60057-1-kumar.gala@linaro.org>
 <20210210000827.GB4450@yekko.fritz.box>
 <035E7DE0-A9AC-4738-81CD-034784754B07@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IvGM3kKqwtniy32b"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612922938;
        bh=pvVdGRbzBpyejYuQ7cIVhg4kBk9zNKj74ekrFbpZQ08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GR1ROgXz6xbnm1JoQuEIhZ6omkjjFEZzR2lVwW9w/G+yFpNxzBaoVv8VsoDak7otL
         MOuaVYs/pEZx+nznqZ+PVa9iDIJinOwWjg9lqXafmyM+jssqaq0pWVm5zlA0m4w/Fg
         kKLgU9rdiXFRvMBTxohh4hc1WKRt50z1cfWGMLEg=
Content-Disposition: inline
In-Reply-To: <035E7DE0-A9AC-4738-81CD-034784754B07-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-5wv7dgnIgG8@public.gmane.org


--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:33:05PM -0600, Kumar Gala wrote:
>=20
>=20
> > On Feb 9, 2021, at 6:08 PM, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > On Tue, Feb 09, 2021 at 11:50:59AM -0600, Kumar Gala wrote:
> >> Treat a node-name and property name at the same level of tree as
> >> an error.
> >>=20
> >> Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >=20
> > Nack.  Discouraging/banning this at the spec level for future trees is
> > reasonable.  But dtc should be able to handle old trees that *do* have
> > node/property conflicts as well.
>=20
> Then we can make this a warning instead of an error.  Or a user is
> always about to disable this via the =E2=80=99no-=E2=80=A6=E2=80=99 comma=
nd line option.

A warning would be ok.

>=20
> - k
>=20
> >=20
> >> ---
> >> checks.c | 18 +++++++++++++++++-
> >> 1 file changed, 17 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/checks.c b/checks.c
> >> index 17cb689..3f46043 100644
> >> --- a/checks.c
> >> +++ b/checks.c
> >> @@ -330,6 +330,22 @@ static void check_node_name_format(struct check *=
c, struct dt_info *dti,
> >> }
> >> ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars=
);
> >>=20
> >> +static void check_node_name_vs_property_name(struct check *c,
> >> +					     struct dt_info *dti,
> >> +					     struct node *node)
> >> +{
> >> +	struct property *prop;
> >> +
> >> +	if (node->parent) {
> >> +		for_each_property(node->parent, prop) {
> >> +			if (strcmp(node->name, prop->name) =3D=3D 0)
> >> +				FAIL(c, dti, node, "node name and property name conflict");
> >> +		}
> >> +	}
> >> +}
> >> +ERROR(node_name_vs_property_name, check_node_name_vs_property_name,
> >> +      NULL, &node_name_chars);
> >> +
> >> static void check_unit_address_vs_reg(struct check *c, struct dt_info =
*dti,
> >> 				      struct node *node)
> >> {
> >> @@ -1796,7 +1812,7 @@ WARNING(graph_endpoint, check_graph_endpoint, NU=
LL, &graph_nodes);
> >> static struct check *check_table[] =3D {
> >> 	&duplicate_node_names, &duplicate_property_names,
> >> 	&node_name_chars, &node_name_format, &property_name_chars,
> >> -	&name_is_string, &name_properties,
> >> +	&name_is_string, &name_properties, &node_name_vs_property_name,
> >>=20
> >> 	&duplicate_label,
> >>=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjPZkACgkQbDjKyiDZ
s5J0yA//QxrUIzF4loQsysRvLAkUtj/Oo595+upgCXcr2S27QKhkJrKUAdBbkVe5
IwHP6zt/ASUJBS31tTMKDns4F3RcH+58pEdyKui5jDKHbXYwegzODMzUeixy+4Xy
ypk66ATNxsa9GAO7RR/d+r/JlrwJ2UGJnYVgHMkgJDUcHMIn0Yh1WRDD5pJ49Cji
G49ryerROFc4OIE/v0hTgMi5Mk+CVmp3rkZNlY07P8FgsScsScbu6mi55P43Wx8L
liwqxKBH0qYfeUgaBuTUkvPrkHAutZ+uz+mE8H+LvLoy1dpUnlr4OiQbjEt1Aloc
Rk4BY3O1udUkje0Wef4FF0RfkUKy2e6ecuivGwGT+LfeC/9+NcSSLB3/OnfY9ZES
bn1leBlQEmrJGTH7Q8WPTVOnBrydFRPhFCoaTYAUblDDxHnlG578M98knbxlhwRi
8HhYWDrSqAuydW6pgcta/A4hh6e/S+GPs2gA4CXYe8PiaUhNMMDsWRRWonvQJxs/
tl3bgBeT7lA2GsYx+fj49SpI3O/XPnj3Tme1WrourIXJWI4QTj8buylZyG0/S6rh
0lCGlXcORLsRNO7jnrTIh5ValCm2pb2Oi7ZflDtmjSdgwsXeYKYcd+Sz/QG15QMg
VCMI9/1ZtQqOuKx8Mdvcl+WlE0qNx7Emg0P6IPK/1xGEq0umie4=
=2pcR
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--
