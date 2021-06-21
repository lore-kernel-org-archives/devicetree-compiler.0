From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 5/5] Makefile: add -Wsign-compare to warning options
Date: Mon, 21 Jun 2021 15:35:21 +1000
Message-ID: <YNAlGad2CNxD8q7g@yekko>
References: <20210618172030.9684-1-andre.przywara@arm.com>
 <20210618172030.9684-6-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vzKZa+NP/uzi7aKm"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1624253931;
        bh=cFqgN7gQvRIrrOu4btVXJz87l/EOGzTUJTiT5WBBnDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kmwuDDqKiR85oYZKlDi8G7BCjxp6Kx0bS34hpNP3pEqP3v1LXA9+0AvawZK7M1b4H
         oEY60vs4zx3h7VADNYoRF9VnkwZjsvyASWxUqc+uct7/Re198fkW+3kpDo6lXSGzgP
         ZKaRMfO2D2UidX/MsqzIf1Ht6hkZVcvhDqurWZkE=
Content-Disposition: inline
In-Reply-To: <20210618172030.9684-6-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--vzKZa+NP/uzi7aKm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 18, 2021 at 06:20:30PM +0100, Andre Przywara wrote:
> Now that all signedness comparison warnings in the source tree have been
> fixed, let's enable the warning option, to avoid them creeping in again.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>

Applied, thanks.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index ea8c659..ee77115 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -21,7 +21,7 @@ CONFIG_LOCALVERSION =3D
>  ASSUME_MASK ?=3D 0
> =20
>  CPPFLAGS =3D -I libfdt -I . -DFDT_ASSUME_MASK=3D$(ASSUME_MASK)
> -WARNINGS =3D -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> +WARNINGS =3D -Wall -Wpointer-arith -Wcast-qual -Wnested-externs -Wsign-c=
ompare \
>  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
>  CFLAGS =3D -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vzKZa+NP/uzi7aKm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDQJRkACgkQbDjKyiDZ
s5Lqlw//XWpUtR2n/0iRkUf5S9aJ2WKgdQ8Bl0BeVTQ90WZeFLDaPoeMf0jINJqu
KgzDF477cd/OKyxF8+C9FNHWt5+FEEjij8O2A8WOjsAOvPaRQ272MDR6R1MMUeSg
8wzwPNAN+ufvKjRbkXGpapzfEQACSc/TVhoHcvVQjNUFR34Ua+E45L0x85Id6fZm
yFFcbRKsYXOmgA9g+skTUGfu92uwY5781Y/zXuldPfQgXiRVPwgtJPecG40FH8Wn
s8DUjGgVPcbHHD510OjyWgVXZNO7TBzKPHvuYMp6wHu38kUndiNub0mXtyEGoIQr
6tb6A+7lXVn6/aMOoVL5VY9l4UjwZCs0/uI8lrM6WskyiGL7ggfbGOvxcF8bnWWu
VmlAO8LvXNQ2S5ruvPP8TIsCyB6BJAdWY+MoOr0PxXlmw2f1CAarL4yPfaTFk+dR
WNENt3XpzGY8urXcVZfW5/TsKeoRLLZvqxv1xlCd4FQ2t7+oZelbnhpfCPW3molt
jVhsTnl2H32g+icXDwkSRMaadajK3ngnl9scbXTL1O53uwsMbc5RVgcitxktBQyL
xjNJgxVhVMo7Ji116I04jsdNPI0Ob+HL1HuPeherdy2Wm/YXzjcmNaloPp2WxWIs
3HyqARwm3ZasNszFV5lDgiNPcFrUIvEe/WGJ0UIJXQ1IKPMWJU8=
=xZr5
-----END PGP SIGNATURE-----

--vzKZa+NP/uzi7aKm--
