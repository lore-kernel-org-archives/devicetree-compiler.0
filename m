From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: Bug or feature? /somenode overwrites /somenode@17 in fdt-overlay
Date: Fri, 28 Apr 2023 20:40:07 +0200
Message-ID: <20230428184007.56cwbzk5fe5trb4z@pengutronix.de>
References: <20230425145504.tswuitufzikuhmnz@pengutronix.de>
 <ZEtvOVy3eZwgubMr@yekko>
 <20230428180441.hn34wlwevuj75zml@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b5gzxabgohp3hrvz"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20230428180441.hn34wlwevuj75zml-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--b5gzxabgohp3hrvz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello David,

On Fri, Apr 28, 2023 at 08:04:49PM +0200, Uwe Kleine-K=F6nig wrote:
> Still adding the strict flavour variants of the affected functions is a
> good idea. Then future usages can consciously choose which semantic is
> intended.

Another surprising instance is fdt_get_alias() which might behave in
strange ways if there is a node at /aliases@12345.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--b5gzxabgohp3hrvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRMEwIACgkQj4D7WH0S
/k5PVAgAp+kQVBOrRRnGIAMrnLt8pRwcbC2Up4/V3oSVBYuuyRLkGzsHluDWaj9C
LvRY56kT/9vkw/SvpmUu6MiRG9II3wbYKWP//BrCazmsivOF/L3dhMTgQRGKrwBQ
8onmjNceNQ0HKJuDrifW6X3fc5APFu48yllIhTFZZa/w+cfnSZISbxm6rPY6d023
yCmLCqheJG+vGkvoV03s4QivW+iItYfeK3iifuoAF/ts7hWWEyJRQhxKmvYo5leI
8LNaQMMM/lK9OTxnzQT7XLl0qAjr5nnF53hrptqXJPunQvscPxbmv7QjPm2hs/WF
OJutzXbNB9LzXnwh/k8htMsxE0Q9zg==
=vQrn
-----END PGP SIGNATURE-----

--b5gzxabgohp3hrvz--
