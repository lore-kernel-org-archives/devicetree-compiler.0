From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 0/2] dtc: Improve checks for i2c reg properties
Date: Mon, 22 Jun 2020 17:53:18 +1000
Message-ID: <20200622075318.GT17085@umbus.fritz.box>
References: <20200622031005.1890039-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZXzThk3vFZecBD04"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1592813428;
        bh=Ce43B/8Fubqa8dR1cOJzDW7Y73JAHwovWlhBSJzM3CY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eOMTvTR7p3iDDktQO7xf6iq/zZY+SqaX7YzQZnmBeYAdU3Vb/iQW6iSId9wrg+T/G
         klMmNjOjAq/y35tT0XYpcgIJnBf3nkM1Eks9Krb4rfNgXFoOLWn/qetTtk+T9dtFg/
         z1hpQeFKEzeUNGGfPgmFy02oxsjVvRdlcpB952DI=
Content-Disposition: inline
In-Reply-To: <20200622031005.1890039-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>


--ZXzThk3vFZecBD04
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 12:40:03PM +0930, Joel Stanley wrote:
> This is to fix a build warning in the Linux kernel caused by dtc
> incorrectly warning about I2C_OWN_SLAVE_ADDRESS.

Applied, thanks.

>=20
> v4 adds a U to the defines
> v3 fixes the 10 bit size check
> v2 contains a second patch to check for 10 bit vs 7 bit addresses.
>=20
> Joel Stanley (2):
>   checks: Remove warning for I2C_OWN_SLAVE_ADDRESS
>   checks: Improve i2c reg property checking
>=20
>  checks.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZXzThk3vFZecBD04
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7wY20ACgkQbDjKyiDZ
s5LIHg/+JowiaWp26ONSiUBMBOOlj5fnSduXGzDLt6S/0xo3qTWsIwMoB9579Yk5
KwX4uuHoMseEC9KNwxK7cX6JpHLOkXMXzUbTrs7wqQcUbG4H+poYG53Ha5/IgTFp
j8E5IbKUR4zXme3zv9oOj5D7Nsc14EARFo7DxKAWNwL11Wmo9oKFZyUeQJH2S0UH
29ijTWoEeCLYIhgydCPR3zcvVza3f1KX/01yYseVExsnzdqb0xLbtOeAfiSmwWj6
uqWRPc5Uepp9gPaz/mgGKtbQ3CHnOirV4p3e4d6YgNbdBbutCsubQcsJoda5Wigw
/QpkcxDVJvus5WWoKGI7NXnXOcLEInA+dqZHbuM8J+roXGzhK3Q5jxx2xirs/LDX
JqsVMkA1986o4X9m4zQxXywvnw15oLokzO6kv3WA5RpFvHoXPURQLmZgHzH2BOJm
WK/N5mvt61sjL59e/RW7ggEGauJoKzv6SBfZP+VSvO59txZ+wZPOjAu1Lbx9A3TA
RGDwDjn+C7/QyTobLlFT0Wgw+WNJ3k/fGsFrDw7Pr+4BXaF8XI9Nuqo4j58nTsqw
Hcy7mk5WJZzjxbrMNm4QbdT4S4zMcqFQ06zifd/BoAggRBspcsjOMAD6sT13PTqE
8Oqb96+xqyWnTJLpqA4ZvvfF7guTw0HQQJxDnVKI9Mf84mDv00c=
=Qy89
-----END PGP SIGNATURE-----

--ZXzThk3vFZecBD04--
