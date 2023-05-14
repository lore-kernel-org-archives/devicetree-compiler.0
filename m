From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: When compiling to dts interpret /__symbols__ and
 /__local_fixups__
Date: Sun, 14 May 2023 16:30:41 +1000
Message-ID: <ZGCAEd/w4T+Ad7oM@yekko>
References: <20230426182558.573161-1-u.kleine-koenig@pengutronix.de>
 <ZEtjoSXF/X1osv2B@yekko>
 <20230428191130.nuibhzf3zjoqwpwm@pengutronix.de>
 <20230503210535.denueqhecvuedppv@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w3h82vpVEHo0d4KZ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1684045851;
        bh=udSm/BYS/6DckscaHcWnWIYk2fScaeUaLzg8IW+BJCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eEWAhOilk2w3U5pOKmCesyIUAVLxDgIr1dvFOPUYYYF0PqdtCxdfg+aljIKtNhMRD
         42HjnGz6bmI5YGiQiXQNyA5/G/J5K2uZi4zy+dXG+VchI97fi6IUkGI60l6xHmtkMi
         x1H//nUjH7PnMDX2ZKAagF5sVgPi0QPxoLwvWk6E=
Content-Disposition: inline
In-Reply-To: <20230503210535.denueqhecvuedppv-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--w3h82vpVEHo0d4KZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 11:05:35PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Fri, Apr 28, 2023 at 09:11:45PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > @@ -219,6 +219,9 @@ static void write_propval(FILE *f, struct prope=
rty *prop)
> > > >  		if (emit_type =3D=3D TYPE_NONE || chunk_len =3D=3D 0)
> > > >  			continue;
> > > > =20
> > > > +		if (m->offset !=3D 0)
> > > > +			fputc(' ', f);
> > >=20
> > > I'm not sure how this change is related to anything else.
> >=20
> > Without this, the resulting dts might have:
> >=20
> > 	clocks =3D <&clk 17&clk 19>;
> >=20
> > I think before my patch this never happend in practise because an array
> > never had more than one marker?!
>=20
> That hunk is wrong, but I don't see the right fix. A reproducer is:
>=20
> diff --git a/tests/type-preservation.dts b/tests/type-preservation.dts
> index 921ea21172d1..38e97cee6353 100644
> --- a/tests/type-preservation.dts
> +++ b/tests/type-preservation.dts
> @@ -18,6 +18,7 @@
>  		a-string-with-nulls =3D "foo\0bar", "baz";
>  		a-phandle =3D <&subsub1>;
>  		a-phandle-with-args =3D <&subsub1 0x00 0x01>, <&subsub1 0x02 0x03>;
> +		another-phandle-with-args =3D <&subsub1 0x00 0x01 &subsub1 0x02 0x03>;
> =20
>  		subsub1: subsubnode {
>  			compatible =3D "subsubnode1", "subsubnode";
>=20
> Maybe you see the right thing to do?

Oof, finally got a chance to look at this.  Thanks for the simple
reproducer.  write_propval() is an even worse mess than I suspected
:(.  I think I figured out a fix, which I've just committed as
3b02a94b486f998aa22d898b427820a805d0904f.

All that type preservation and yaml stuff is really ghastly though.
If you had a chance to submit poatches which tore it out, I'd be
pretty grateful.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--w3h82vpVEHo0d4KZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRgf/kACgkQzQJF27ox
2GeK+RAAiD/uq3JAUE9WS8VRc+Pky60JE8T3zsd+yC7N9Hp9cncZ2DMELPlVsVom
eN35rW57rWUvQfLcHNK54zYJJ844G8JvViXIwGWt+Ef4js135V89t+TsyG1nIS51
oRo14D4yR4WXZdDxIV//CtMVhONKCDAj3GFzG+qFxM57bcv+3Nu13qYCb0edS4BK
6XG+h+xlqLOxnalf/B8ze1ASpSYG+zREIgLhlNjUicJuHcR2dGmyC4BW0ixyTAHe
+fUZKOAAJBxRaAy+kNOziUK/1CWC/UJkuFW5O205EB/Rn9ylv9R/H9W8BTaeVSjb
LzdSvRg5v8k97fdQ9q1wNPxclm+AcrkZWVFRjx9elXtLU4grFANXtSbeB7dbkV7f
4VzDp1RIJf8+YTIBD/XMs8G9LcR3IFI0KuMRPtvCX36M71mg9GvTITwtfAVMpxUB
kLFVIT5WXlsl7nBh7rT5zT6Vx/FqxByn+mX9gkh7pYNCITef7KeY3ycahB5xeNMo
trRqpE66tiTrv8IngS0cbO35NzEN9xw69FmNcKeJoj2iFmgbAyZVjR8rJdV3qWBn
olBx21Et5R+rmVJVLtAYuKfv7GYDcZ30MrjCvO5514R3w2DHRV+/n2Uz156rHTTI
HorZln2okXA2n7Oa7Zi01nIsaJklEIcuMLm2XQ4JYU4rtvxgaSE=
=Mq0c
-----END PGP SIGNATURE-----

--w3h82vpVEHo0d4KZ--
