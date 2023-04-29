From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] doc: dt-object-internal: Fix a typo
Date: Sat, 29 Apr 2023 11:45:59 +1000
Message-ID: <ZEx21weWQa1KUv5C@yekko>
References: <20230428163034.775288-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dz03chDmrz9xmcvm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1682732775;
        bh=ZNmZNEI99wy+AX+PWHefsT252wDYjiTUF+55SqiFYyE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bEjeYAMAwyP2aB2hIihJYNnwk3uV2rsRLDRuiSbOJuCsYhrjN32Slh/CgFonEfkcL
         fr85swWtXAOJhm+r48IZFBRgOSLAITUwoWDF2yvB8ZraFVgxrXCAvRIGoB/RTJkYFo
         NCsK1hiWvUTuY76O6zh/QkkzDCU9DUQfEaPxyurk=
Content-Disposition: inline
In-Reply-To: <20230428163034.775288-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--dz03chDmrz9xmcvm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 06:30:34PM +0200, Uwe Kleine-K=F6nig wrote:
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Applied, thanks.

> ---
>  Documentation/dt-object-internal.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-obje=
ct-internal.txt
> index 51d68ab93ac9..c7357e6263df 100644
> --- a/Documentation/dt-object-internal.txt
> +++ b/Documentation/dt-object-internal.txt
> @@ -35,7 +35,7 @@ We have a number of peripherals that after probing (usi=
ng some undefined method)
>  should result in different Device Tree configuration.
> =20
>  We cannot boot with this static tree because due to the configuration of=
 the
> -foo platform there exist multiple conficting peripherals DT fragments.
> +foo platform there exist multiple conflicting peripherals DT fragments.
> =20
>  So for the bar peripheral we would have this:
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dz03chDmrz9xmcvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRMdrwACgkQzQJF27ox
2GdaYw//QoOsHcD3xIVqSo6b6/ssaPlSZN4AoxwI20hvMt0h6XIi2qwi0jp1KbQr
/n2vfSubdew2vQKDM0MBWMGeStWI+ZIqBr26k/6JpGb5fmEJJPK4MfyIz9HqrMso
NGB9m1onSPTfZ5lBgiAkZKX1ZfQId5RPXENMDpSqZDFs4edsXvQWNfmHfcmbXIJM
Fx2uAqN5w9CuicN02pKnTQKUcp9spR9Nc7HPzEegyLfbjwLP3cRgdQoa8ZUrMi4E
e/y6/H4gtkLn5vyCoyqBhQzIt8ATaXY/YeWR2MpmLUVjW1rfpug9JvAHUEzxZj9f
gCbq/F8T2VmYzuoWfOIpRhnKFT9QzcxJZxh+hI/b+5h6BJBP9IpcoIRVkt6V9cO8
+ey1jXGuAbIkzeJq/jKsvx3rPvl3EOcy63Hxn2ews+FgAHTqUUmamd8oiOc6U3Ri
AvqG6Oc2/kfk1CSMPsZQmZ6XVYw/5Uo6olMwjLcewHRkF29NDsg/MxsZ0+OahSq2
dYQ8r83JrdznemJaNzClMwMPfPR6iQ9f2BZ29MqjPV4ZIaFDpjbrjVaiiy3D6ejW
qx/J30TcYDDDN5amHHFbWOBZCuTN8ouG4RdkS3jaQ5jTsBL2l6fuA0Kz8Egv1VB3
tqwbjiVy2MyaCXfHEHBsn5GDX1DnSM47ZBcEGLben9MS8BBlHBc=
=ISQ8
-----END PGP SIGNATURE-----

--dz03chDmrz9xmcvm--
