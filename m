From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] check: Inform about missing ranges
Date: Tue, 10 Mar 2020 11:44:30 +1100
Message-ID: <20200310004430.GD660117@umbus.fritz.box>
References: <20200308165643.19281-1-arkadiusz@drabczyk.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1583801358;
        bh=fh6MHZk5WzukZOg+80NseglLxCruQtRZ9f8qXemCWfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nGTtL2zopvMteZVHJBJPvQYkHLGjD5MVc7JoQX8V/y9r8Mk2rcMtWkmLy/k9PbwIK
         9rNkvkpklrh2xXyXW+L1PqGlvCHPwAi3mWRw9a+423biXWTuT343qN65keCm67JYgz
         jLffnURcJ9imsZ3N2IAnbOTTq99PmmzC6EjhE+Ck=
Content-Disposition: inline
In-Reply-To: <20200308165643.19281-1-arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2020 at 05:56:43PM +0100, Arkadiusz Drabczyk wrote:
> In check_unit_address_vs_reg() warning message already says 'reg _or_
> ranges' when reg or ranges are present but unit name is missing.  Add
> this message for compatibility to say "reg _or_ ranges" when unit name
> is present but neither reg nor ranges are present.
>=20
> Signed-off-by: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>

Applied, thanks.

> ---
>  checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 8acbc05..4b3c486 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -352,7 +352,7 @@ static void check_unit_address_vs_reg(struct check *c=
, struct dt_info *dti,
>  			FAIL(c, dti, node, "node has a reg or ranges property, but no unit na=
me");
>  	} else {
>  		if (unitname[0])
> -			FAIL(c, dti, node, "node has a unit name, but no reg property");
> +			FAIL(c, dti, node, "node has a unit name, but no reg or ranges proper=
ty");
>  	}
>  }
>  WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5m4u4ACgkQbDjKyiDZ
s5JyuQ//bSuUPE37/q7CF1ZSizLYI163l++MsCfK3R2WTtz7Kl4yGfsefuoUAiwv
DSflQsoOtXHbgupDNBXn6/7AhuLfo5Mwtq5adsrz66TIatMb40siMFXSbf+aRezj
qy42Y/OAhaVEfKqqQnkCVXZNeVThKw69lhOnd724nj/3+s681mPazGdTcwu6s1lA
naFz0A5dXIv+sx7QkPh5hzuhCBzJmXhKezeUarfV3hvksfBr5b8PtESnoSlnEn+B
PpP9nwLEZmC7aWqeFab2lP/sDZqmA/MG7KVuCKnfZ0oKvvmS4EfHK5fF5xYOzmGm
X9mzoznCL35VUFHvQ9yO+NC1Wm6k34MWDrBnuMCMc9gSnZ3HsBwN4R53HRVpIgIK
2U2LWoHf02Vt0xg4wglY+e1k3BmcpKqEqRM9fVjl5WVzU9pJHrrk4pEC/jLyrNFn
82UYzmCtUDfJy0xBNqlBKQUIP2WSQjiqwXGLoY2ascAG/a8RrONMVQ/y7pZPvkgq
DkD/tW5vocntEmOWvrjnkT0wNpCliJpghB4R/IcUDAqfa6VSWU9ZQU/nPbDn/WmK
Ho2tm4PHyBg5sD8gXGN85NkqMAljcSE1A4rb3EU4ZfREaetEgjGFUsrj+Gp7dCuE
sKR4qbbhRcpnl93nXxd3SPnwRhSC9Px/8CGEviZs12D51TK3PLA=
=1tCJ
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--
