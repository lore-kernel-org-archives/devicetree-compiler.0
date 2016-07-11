From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 07/13] libfdt: Fix separator spelling
Date: Mon, 11 Jul 2016 08:59:01 +0200
Message-ID: <20160711065901.GD4589@lukather>
References: <20160705082646.25044-1-maxime.ripard@free-electrons.com>
 <20160705082646.25044-8-maxime.ripard@free-electrons.com>
 <20160706011641.GQ2251@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160706011641.GQ2251-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Jul 06, 2016 at 11:16:41AM +1000, David Gibson wrote:
> On Tue, Jul 05, 2016 at 10:26:40AM +0200, Maxime Ripard wrote:
> > The function fdt_path_next_seperator had an obvious mispell. Fix it.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Huh.. this entire function appears not to be in upstream libfdt.

Indeed, it was introduced in this commit:
http://git.denx.de/?p=3Du-boot.git;a=3Dcommit;h=3D77d7fff8cec2652be8c2494b6=
b66d14a398ec860

I have no idea why it wasn't upstreamed.

I'll make it part of my serie for libfdt.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXg0O1AAoJEBx+YmzsjxAgp9QP/iAmslPCiT28Ce4iUbGJgRk1
2uI+H/CAC91X3eOOKie31keHOjxzVmh+9NsOy4RwXFPA3vQWa53ktIlAjsEu88KL
r/AbNlylOq2DYfVxtfcJFmZcnOK65m1gRrEj/hh01FBRMtYdQhHNHLnioW6eMVzu
fUDs1Dc/QXrDHQIsfPX3XMBhG9WVTIKglsbKnMSnAO227Q4bYJueIF5LytQ1hjjK
TpV55knLsg/rXPrhgmB5Z9yq0m6dYOZ59fski6uxePt7SEs12QaJEoJ1sXj8LW3V
q9V2lJGsLRV/9etmq0TQI0AVDqEGhR/T9ofKrqIzpjJGAK8hAo0Olbtv68nFAvJU
YLS7PO6MgOQxO2GqW03R09FxwzmUynbgsgkQQFpHrK83rn3J/KIHipV9StIa4UwW
Z1l93BqT5oQISjrnpdWCHjS9Dy3xCFs0gSZgTDv2jr1cSWFDj0JomZz86cDykYGZ
8Nmj2YDN5fYKRRaaw/084IDyT4nb+aRgSqfxCACN/PmCWciHNA8qg4RJ9FvBq7Eo
kyKFDvhCs2LIX9aGH9EBgiXzvtrqSLSMjhD4NFNdB+aK7HfZLRnY++pdTHrpT6dO
U8qBUrWYDqImsZN2kUkkw5iP5EG1KsHmkF2IEmFw1Er4Gvft7xzmtbqkGUi5b2hb
NX+vEl+OsF/QOccz6AH+
=IjBT
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
