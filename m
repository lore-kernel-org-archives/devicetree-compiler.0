From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] checks: Change node-name check to match devicetree
 spec
Date: Wed, 10 Feb 2021 16:29:32 +1100
Message-ID: <20210210052932.GL4450@yekko.fritz.box>
References: <20210209172451.56967-1-kumar.gala@linaro.org>
 <20210209184641.63052-1-kumar.gala@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6Mt39TZj+HFMr11E"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612935579;
        bh=ufUPuVLmbl3/g9FjEWvdtetbuFUWzoUptZAKy1O9xPk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b7SzI28z8EFclt3ulXZ+ewWG/jQ1yBwk6R2NTFyrwgWl/me/mSRvr4tmWUshLzXui
         6mh9/w3SB/t9TrHcMAvTb0lYEAfBkBxH+3RHNjHuwGMe9yXTqOxtEyvN56VneLT+Mp
         Ny/0Mi1h3p1+bvsWnKiw9HZy3zJ4r14tFLmSohao=
Content-Disposition: inline
In-Reply-To: <20210209184641.63052-1-kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-5wv7dgnIgG8@public.gmane.org


--6Mt39TZj+HFMr11E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 12:46:41PM -0600, Kumar Gala wrote:
> The devicetree spec limits the valid character set to:
>   A-Z
>   a-z
>   0-9
>   ,._+-
>=20
> while property can additionally have '?#'.  Change the check to match
> the spec.
>=20
> Signed-off-by: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>  checks.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 17cb689..48e7fe9 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -297,7 +297,8 @@ ERROR(duplicate_property_names, check_duplicate_prope=
rty_names, NULL);
>  #define LOWERCASE	"abcdefghijklmnopqrstuvwxyz"
>  #define UPPERCASE	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
>  #define DIGITS		"0123456789"
> -#define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
> +#define NODECHARS	LOWERCASE UPPERCASE DIGITS ",._+-@"
> +#define PROPCHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
>  #define PROPNODECHARSSTRICT	LOWERCASE UPPERCASE DIGITS ",-"
> =20
>  static void check_node_name_chars(struct check *c, struct dt_info *dti,
> @@ -309,7 +310,7 @@ static void check_node_name_chars(struct check *c, st=
ruct dt_info *dti,
>  		FAIL(c, dti, node, "Bad character '%c' in node name",
>  		     node->name[n]);
>  }
> -ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
> +ERROR(node_name_chars, check_node_name_chars, NODECHARS);
> =20
>  static void check_node_name_chars_strict(struct check *c, struct dt_info=
 *dti,
>  					 struct node *node)
> @@ -370,7 +371,7 @@ static void check_property_name_chars(struct check *c=
, struct dt_info *dti,
>  				  prop->name[n]);
>  	}
>  }
> -ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
> +ERROR(property_name_chars, check_property_name_chars, PROPCHARS);
> =20
>  static void check_property_name_chars_strict(struct check *c,
>  					     struct dt_info *dti,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6Mt39TZj+HFMr11E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjbzgACgkQbDjKyiDZ
s5IEvA/+O4HFRYNkOGPSackU5nwNobca4cw05RXt8WZMFcNht09uZ3x8TjBAlLJx
JgrfkpGwsJuJNw/+NLWaMuZMpyeamCeUbchH2nNRNCqz1KDXQqJYeu8Hjsu9Vx5m
CEE6I5c36f5vOPegTe7s9WzehCELHNz06fjzGQ9/mc+qSmwi2gISVJUhXnxVuZda
c2pZ+flR2rcEDu8UoH6/gdfPR9RYhLe1HcK9K73Z+zvf9tOjRIiZkDlnWSWEQ6qE
SaKcjhEHAXr26+u97amTrDIsNpy9rOttBJZ1P09gaPJSymznF/1CT012YJtdl9O+
a19zq7ir22LFWiH7fdT0ol0dFtFtPkzRUXPQCRYFZlm4gctOMMzNIfJkpl8Alfgh
rioJtrJYZkGsyK0w8jMifkx+5logrD3E8SRoEGRuVt3QOIrOYiyuT9XFgLxhXsId
4PJL9+8GtnOjz/A9FWzUwtz6gsTg2cliqLoMReExvAN2PGP9PS6Gp5jr1Ulu3AvU
mjKqO9zqfmxvyvDlg9DtOa7lmpHFnpXVtrY9vifRSIxsJiG6DHcyZZUNOYYkBoBK
N4IutigORi2IW1CuKV3de62FwutxWpGwwmBOSzIs1dstmFho8PK65jssiQ8ypX08
tjy2ycpE0z3+m0LoeKF4tJBx2BHE/D5L5NmlImcdGgv5D6B8Bho=
=pF/o
-----END PGP SIGNATURE-----

--6Mt39TZj+HFMr11E--
