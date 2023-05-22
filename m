From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add an option to generate __local_fixups__ and
 __fixups__
Date: Mon, 22 May 2023 16:20:32 +0200
Message-ID: <20230522142032.5e4rqg7iokta5vkp@pengutronix.de>
References: <20230522081629.385489-1-u.kleine-koenig@pengutronix.de>
 <ZGswiPv/CAl/Z4EH@yekko>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eigvwgymgbzuwnui"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ZGswiPv/CAl/Z4EH@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--eigvwgymgbzuwnui
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 07:06:16PM +1000, David Gibson wrote:
> On Mon, May 22, 2023 at 10:16:29AM +0200, Uwe Kleine-K=F6nig wrote:
> > This happens implicitly for dts files with a /plugin/ tag.
>=20
> Remind me what the use case for this is?

The idea is to have enough information in a dtb file to restore the tags
and phandle-refs. Look for "[PATCH] dtc: When compiling to dts interpret
/__symbols__ and /__local_fixups__" in your inbox.

Is this a request to improve the commit log? If so, maybe:

	dtc: Add an option to generate __local_fixups__ and __fixups__

	This records detailed usage of labels in a dtb that can
	later be used to restore labels when compiling back to dts
	format.

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eigvwgymgbzuwnui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRrei8ACgkQj4D7WH0S
/k48Zgf+I1XGMNfH8OSnwlOmqagqEOIZnx7fukqm4CRvhuzgDn1yRypXqWO8qV6z
XOEN3xcPglxMiuEpSeh4q+iOQIiWzXHzmhpcb7WIgUO/vQwsBuF4EbZAzDdo15C0
bIsqtqreJ2u02xKlYqKdykHnP0hyC9C54MRpjHI3Vm3ZqIm0vjVNDfKckvxIfI/2
Z1hDh3B1RwlI6cKIO8A1FwQH6Irlfcch05YCs25kPh+vnoEWPStq9PZ4xOs9SWOL
G01f3k55fcBRTYeZtiXvscOKVFAmTowOXRisqi+wGtwxo8p9N+Xol93Kd1XxJRJD
NjZxRr+6uZ/hlHJ/yHLMRDboUQL1uA==
=Fdjm
-----END PGP SIGNATURE-----

--eigvwgymgbzuwnui--
