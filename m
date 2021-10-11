From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dtc: Drop dts source restriction for yaml output
Date: Mon, 11 Oct 2021 16:15:54 +1100
Message-ID: <YWPIiqpb3KlwTVN/@yekko>
References: <20210727183023.3212077-1-robh@kernel.org>
 <20210727183023.3212077-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hXKkPWqtGcnLb2yq"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1633936793;
        bh=WVY4N7SwCIOTxkESAhx02zIzb+2WUDSgZOiCMX0OlUc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QIdGJ5EJ+D/qWOFeRCIOqNB9cUooWl8dL7gHPUXHJoK2BvzC3WsPPFQ92n3A2xc+D
         KKGYJfXMXkBBBnBBhJ0E8tqjMqjsfGHedl01iNMThXsLM4jSj7oawQX4bXKlhB1Bco
         Ka3Y4w1rpwC3sNOx4RI6cJqtQfQQ0B28CFPDnMB8=
Content-Disposition: inline
In-Reply-To: <20210727183023.3212077-5-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--hXKkPWqtGcnLb2yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 12:30:22PM -0600, Rob Herring wrote:
> YAML output was restricted to dts input as there are some dependencies
> on source annotations which get lost with other input formats. With the
> addition of markers by the checks, YAML output from dtb format becomes
> more useful.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Urgh.  There's not really anything wrong with this patch of itself,
but it really underlines my feeling that the whole yaml output thing
is a bunch of hacks in pursuit of a bogus goal.

Yaml output wants to include information that simply isn't present in
the flattened tree format (without considering bindings), so it relies
on formatting conventions in the dts, hence this test in the first
place.  This alleges it removes a restriction, but it only works if a
bunch of extra heuristics are able to guess the types correctly.

> ---
> v3:
>  - no change
> ---
>  dtc.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index bc786c543b7e..acfeac1da234 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -353,8 +353,6 @@ int main(int argc, char *argv[])
>  		dt_to_source(outf, dti);
>  #ifndef NO_YAML
>  	} else if (streq(outform, "yaml")) {
> -		if (!streq(inform, "dts"))
> -			die("YAML output format requires dts input format\n");
>  		dt_to_yaml(outf, dti);
>  #endif
>  	} else if (streq(outform, "dtb")) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hXKkPWqtGcnLb2yq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFjyIoACgkQbDjKyiDZ
s5LQ3A//f8WSDuRCqzpNgT4hAMjBOlM0aSujcKKXEW2Isie2vqyHOU1WjwXhJES9
5sfKhlN2oqPogyX6FupWLsagPvd/dUBjNQZMrR1+0c0ARTwgJOG9WG0O9Go09gRA
9jSFoGK9LeVNX4JEBkVjZZq+iZMpE/3lhwRY4V7Rsb/L2kwXPUwDu5JVYma/+Zyc
bkr+BZvK6V61XVIBjtJPo/m2kjBmIxBzlK6B/Vh1iX5dBUf7CEt5cKQHF3GrXSwX
aslSjjq8y547RITg2QESs/wTQr24erEWnhVHVRtkTUJP/VPd8HTJP3a7ucDfOVLB
/qCFn6W6CaS8kx1kY8MWe2mVOSo1dm+iAOSBsWA6j7xzxMOivShMy6xy8EoMPvJB
rWaXFel9VCYvPrc5+8JruiFMrWiwL5nRQ2HuPAkr5YIQ4xV22X0O4huOVgnn+PyQ
IZI8hdu9aEVNMd8Zo3ontPRMvKKr/gJhdcDTxhZ8YIP/TEkJjylw1GHjnSdYqP40
YlrqAeV1Hbp8bb1z8ESYihSUvMhl4wg21YD56UxE/mWsO5JSOwQ9ULqf269NCRd5
aNWXWdZqvL0IyrTLK+lsH08dkUytslrTSBiNGFpXrVvlYZjHeQsAxa7TLah36Ner
1jW562tkSg8EccZXQSU7xZtw6/TmRSAXONI8FqM/vxAmt3JtR8M=
=EW7J
-----END PGP SIGNATURE-----

--hXKkPWqtGcnLb2yq--
