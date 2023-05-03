From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] dtc: When compiling to dts interpret /__symbols__ and
 /__local_fixups__
Date: Wed, 3 May 2023 23:05:35 +0200
Message-ID: <20230503210535.denueqhecvuedppv@pengutronix.de>
References: <20230426182558.573161-1-u.kleine-koenig@pengutronix.de>
 <ZEtjoSXF/X1osv2B@yekko>
 <20230428191130.nuibhzf3zjoqwpwm@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mocl5vbddvh6hwm4"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20230428191130.nuibhzf3zjoqwpwm-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--mocl5vbddvh6hwm4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Apr 28, 2023 at 09:11:45PM +0200, Uwe Kleine-K=F6nig wrote:
> > > @@ -219,6 +219,9 @@ static void write_propval(FILE *f, struct propert=
y *prop)
> > >  		if (emit_type =3D=3D TYPE_NONE || chunk_len =3D=3D 0)
> > >  			continue;
> > > =20
> > > +		if (m->offset !=3D 0)
> > > +			fputc(' ', f);
> >=20
> > I'm not sure how this change is related to anything else.
>=20
> Without this, the resulting dts might have:
>=20
> 	clocks =3D <&clk 17&clk 19>;
>=20
> I think before my patch this never happend in practise because an array
> never had more than one marker?!

That hunk is wrong, but I don't see the right fix. A reproducer is:

diff --git a/tests/type-preservation.dts b/tests/type-preservation.dts
index 921ea21172d1..38e97cee6353 100644
--- a/tests/type-preservation.dts
+++ b/tests/type-preservation.dts
@@ -18,6 +18,7 @@
 		a-string-with-nulls =3D "foo\0bar", "baz";
 		a-phandle =3D <&subsub1>;
 		a-phandle-with-args =3D <&subsub1 0x00 0x01>, <&subsub1 0x02 0x03>;
+		another-phandle-with-args =3D <&subsub1 0x00 0x01 &subsub1 0x02 0x03>;
=20
 		subsub1: subsubnode {
 			compatible =3D "subsubnode1", "subsubnode";

Maybe you see the right thing to do?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mocl5vbddvh6hwm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRSzJ4ACgkQj4D7WH0S
/k7eVwgAslzrH/AQ95T86I9ZHsngQ93ICmsZuKZ831bgG09SmtC2q9RUN/fiCRE1
xpjlTBkCSC7E8vz2/1xwksNxEIOVQM9hXGtRqRoKbwzvIfgvutl77s5qP4NAf0bD
s/SHzdlk1M5xaRemvqAkuth8q4PNEFAdP/xkgEFtOWbl9wUlCbaV1v9qithDfcfo
oxg70NcCVGBE9iFvTPqZfsEhBG+8pCFwmr404oHhprmYL47/3F8Xgb7nS7qQz0rB
gO5eO7XA86//m4EPHaGE00CICyI66HPLSDwrGVjoAJNXDE9jqQoHX98XFsIhB+WA
9pLl7WlRGuotO+Ad0FYEocxif1t/iA==
=FvIY
-----END PGP SIGNATURE-----

--mocl5vbddvh6hwm4--
