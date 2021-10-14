From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 1/5] checks: Make interrupt_provider check dependent
 on interrupts_extended_is_cell
Date: Thu, 14 Oct 2021 14:41:54 +1100
Message-ID: <YWenAtTK9jmj5teB@yekko>
References: <20211011191245.1009682-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eWOiuRxWij+OHnYJ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1634183456;
        bh=W+wsgJG7bXY9hO2wmA5cPRXJ3p7c59UHkYNWrrVbYk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NQKuO5kXf3bbNGbre53WMGUC2iJTbsF6Gg3fPdWvrpNLUON1hFhctyGg0KgylMfbi
         4Jm6KyfKMCzNGDZQtiniqyuZSU6guxjWia+l/1zQnNODxAzcSHzikjk9qER26EFebY
         NxoJej0QnXSaYC5EvdE0+RzCxz5ZE6MgqNuQXGCw=
Content-Disposition: inline
In-Reply-To: <20211011191245.1009682-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>


--eWOiuRxWij+OHnYJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 02:12:41PM -0500, Rob Herring wrote:
> If '#interrupt-cells' doesn't pass checks, no reason to run interrupt
> provider check.
>=20
> Cc: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

> ---
>  checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index fb3fc9cda4b1..8153793a3e7d 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1587,7 +1587,7 @@ static void check_interrupt_provider(struct check *=
c,
>  		FAIL(c, dti, node,
>  		     "Missing #address-cells in interrupt provider");
>  }
> -WARNING(interrupt_provider, check_interrupt_provider, NULL);
> +WARNING(interrupt_provider, check_interrupt_provider, NULL, &interrupts_=
extended_is_cell);
> =20
>  static void check_interrupts_property(struct check *c,
>  				      struct dt_info *dti,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eWOiuRxWij+OHnYJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFnpwAACgkQbDjKyiDZ
s5J2GQ//crKHlaf0SUM8QKdKtwxsvBwZwmhCQyfztmJ20w3IRKmtRr+U6RCZa9+/
ArrlqIdsTkVis/GC/F1vn5aO7aOvKY+kvdEy6L2/HA3yTlqgqjeV2j0FWPc1SmfG
O+ozQOTPp/71R/wrQ8M+x90cDgMJUR7XL8ltayiFdlRotok42Wp1r/0X5CcJTd3r
9U1LQXifMqg3ki2QaCJFzrCzWYcWX6pgECTUNMNFkR5UdRKkHWwOCdxB8Jiqmoui
Sv9loTrxHTmI9y7m1xHgmirkWGNEmQdOQTIZCvDUXojE0jihj9ACX7OAiW1hAevL
7JlR0r1u+X6zlUfB8c3YJasEqi6y4FbxQu0MUkhiR6iPNLswxsT2N3N3MRypUFEm
nYPYAg4FXL7arG2q4u5AhshoYgsN2PjDECoLIRIefv817GDREVUwSGYEzSnBTXLw
IA4uX/YbNWfREybuMhRK9kjmTDwFHWdZTmhDg2hADjpkErXCMNdMYgRdShSEEeJx
xedIr0lQid+wr5Ef12Jtice/ASgD67V1yJyyBNI+DjkXK8D7vDpl9Be0Dg7GcpUM
8D3JDIUnluVBj8vh2gXhGsX7ZDLjnlZg4mBKrqzborGY4s6MU/Fw1EnGWHUXb1F2
xKw5zfV6KGCEdGPg1yROJUPj7lBasVVaJHDzU/IO/L44C4GHlmQ=
=yoUd
-----END PGP SIGNATURE-----

--eWOiuRxWij+OHnYJ--
