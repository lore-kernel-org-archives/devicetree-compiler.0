From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Consider one-character strings as strings
Date: Thu, 25 Jun 2020 11:42:46 +1000
Message-ID: <20200625014246.GD69292@umbus.fritz.box>
References: <20200623094343.26010-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1593050960;
        bh=Vo8FKJOqnaD6OEhhmrq5Gc+Uc/50NDamteK/u807kDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XjIWpPe+VR+f1/K308p56hJB/A9WvAfGKMsQ2KQDU7oaHpsAT/UKKEtVnOJjFdkr6
         o5yXY+iKtPFsyGD//xlztR4ZAawOvO9BPzUNIjdYtPCfiK94tO7SzIAMg0bF//uylg
         ufc+azGlElKHHsZc9P3irB4ZTLETjeVkp1E3fwcE=
Content-Disposition: inline
In-Reply-To: <20200623094343.26010-1-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 11:43:43AM +0200, Geert Uytterhoeven wrote:
> When using overlays, a target-path property pointing to the root node is
> quite common.  However, "dtc -O dts" prints it as a byte array:
>=20
>     target-path =3D [2f 00];
>=20
> instead of a string:
>=20
>     target-path =3D "/";
>=20
> For guess_value_type() to consider a value to be a string, it must
> contain less nul bytes than non-nul bytes, thus ruling out strings
> containing only a single character.  Allow printing such strings by
> relaxing the condition slightly.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Makes sense.  Applied, thanks.

> ---
> Alternatively, guess_value_type() could check explicitly for "/",
> reducing the number of false positives.
>=20
> However, there seem to be plenty of other uses of one-character strings
> in DTS files.  The most common one is 'type =3D "a"' for HDMI connectors.
> ---
>  treesource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/treesource.c b/treesource.c
> index 2acb920d77752410..061ba8c9c5e83265 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -183,7 +183,7 @@ static enum markertype guess_value_type(struct proper=
ty *prop)
>  			nnotcelllbl++;
>  	}
> =20
> -	if ((p[len-1] =3D=3D '\0') && (nnotstring =3D=3D 0) && (nnul < (len-nnu=
l))
> +	if ((p[len-1] =3D=3D '\0') && (nnotstring =3D=3D 0) && (nnul <=3D (len-=
nnul))
>  	    && (nnotstringlbl =3D=3D 0)) {
>  		return TYPE_STRING;
>  	} else if (((len % sizeof(cell_t)) =3D=3D 0) && (nnotcelllbl =3D=3D 0))=
 {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl70ARYACgkQbDjKyiDZ
s5J5bQ//eb8xTYzTNrwsMhjp590rDLH8q0S+0vh3wbWvxoR3E4YVcIyVJtpPhyX7
2n8DMdNnoN83yfwvQOj8h/VVO8BRY157v0RvU5VK+vKT6my3skqFccGQxg0wS3/v
+vEa9gapGQUKnKeE+xKEGvBrOivMqgI6o5vs1DWzsV+NHmVRy8PCTBMx3BlxOhO3
Z0opCrv+TSlm/dRpBLAUr3nSKWKmw+SpBIcYnLeyxmEoXwWNIzJF+ZDGLqIYEl6e
JsqWlEN++dIdPx0RW1pRCAKMmnoMMUdChPEwbWRruRtkpP3G63q6WwMw0uyKz0vi
tTAalO3gZjkT7HW5t1o0TfQvx1lrH4WcWm1bExUqUvmnPn5uco06+A9dGv6idt93
OUdHl5q+PtvXpQAW0c8QRjLVrhJTmcJaJ7SXHPatLSCtWFW/5ARASKlZs7hhyVh+
3H/hCPJDZNbqykZBAxHD+OSfyfoXCcZCR1ytb48DIlfyhWsYCNIjgv3t360dyErr
kxvIP2I+sI8qr0lYwiOfXfpKU+bvUkgRSsSAJL43h1Nf00T3wyeLzsIj5TTqAiMh
lG+aydMx7Y6Pfsx+5h07TQj2UTuTNJb9PjJUtx+Gf9wCvArdIwTf7/WnNUFuGFk9
s9psyVWlDzO24UIFUE57hoIYatfOgI7PIVKcxyV6X/RZWLdCnYM=
=KO1b
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--
