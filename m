From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] checks: Allow PCI bridge child nodes without an
 address
Date: Fri, 2 Oct 2020 13:30:35 +1000
Message-ID: <20201002033035.GK1844@yekko.fritz.box>
References: <20200928201942.3242124-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4wkndigzIeYF6Hbg"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1601615083;
        bh=OHmf3+4Z7b0EeszvoGS854POrGt76F7FfeT4GCE/erc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JOviIJL64SQpShii8GWys5gzA2xES6ZeAOa2+LasgqcZ0p8/onM9DNWiEHVil06yd
         DRwL+YxyR7virxn3aVulYOafWJUzkR9K4pzGRN1EnQRjhdVEW/qlLdY+6q8tBtiYyj
         ZnhSCao/H9lMPont7dz/lwGp2FmEaQKPQqrhW9k0=
Content-Disposition: inline
In-Reply-To: <20200928201942.3242124-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--4wkndigzIeYF6Hbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 03:19:41PM -0500, Rob Herring wrote:
> Some PCI bridge nodes have child nodes such as an interrupt controller
> which are not PCI devices. Allow these nodes which don't have a
> unit-address.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I suspect doing that isn't really IEEE1275-ly correct, but I can see
how that would be convenient.  Applied.

> ---
>  checks.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index b7955dbd71ca..17cb6890d45a 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -891,10 +891,8 @@ static void check_pci_device_reg(struct check *c, st=
ruct dt_info *dti, struct no
>  		return;
> =20
>  	prop =3D get_property(node, "reg");
> -	if (!prop) {
> -		FAIL(c, dti, node, "missing PCI reg property");
> +	if (!prop)
>  		return;
> -	}
> =20
>  	cells =3D (cell_t *)prop->val.val;
>  	if (cells[1] || cells[2])

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4wkndigzIeYF6Hbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl92ntkACgkQbDjKyiDZ
s5KKwBAAqLRH+21YZt+vLQ2eyX38Du/42MOmh1DCAVaC6SSkCYNIuTKdtHg+7Lvn
4jfSTbir9wkXhQI7JxeccND71jgzEQTIuEsflw31Lp5FIvMO+eLHjoZJXt8IRE43
oSSm8tCluvoQArwZEpdrq1ti6MZT9tP2G49H2oO9sexVx0G+OQEtbYgppSdk5Y5i
+rd1kxk8UZsCji1/f/qJa456G7Hen14/Hw6Ol6yuxRcswN/YihbP+ukG1mHK7GD3
DTl026li8T0brX/dXyk0J5ohkwv1ooM1Nw1R6MvbQWU96o7n9ARbeKmh5tm7mZhd
mhR0dp2/0MMmM5SKRTTZ+Auv/L0ePfjhVvv/WXh3olClde7mI/N1ipR4KGeE/Nu9
1AgdF/xLnH+7JrGnzRCTqo8f7NEvTDePeKrgnGVIBsyyYqr6iC7I7yhqVnSj4RT2
40xyMH1B5SEbUrjBbP2phZ7moMI1feqzbnH4cbMxG1kTeO3Y2g1UpFO9788g217u
V4sFhbrtYRFkE25sSOZlqWKfDlz4dzesZ4ZruFEm5kF92WuagHRrdoYwkjY4PfsZ
1ALf+BrbikpQYz+LPh966u/47rtqRQ4qk09YlDX3q2qd0U8HtqNOd55jqIxzIxcD
eIOUV5bNIoUdtdAkko78Sssli7ZgIUMOrMDFgZG5mDI37+PXdTc=
=LV1m
-----END PGP SIGNATURE-----

--4wkndigzIeYF6Hbg--
