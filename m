From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/3] Correct output from memreserve in fdtdump
Date: Wed, 18 Jun 2014 21:14:29 +1000
Message-ID: <20140618111429.GG29264@voom.redhat.com>
References: <1403074825-5069-1-git-send-email-sjg@chromium.org>
 <20140618103215.GF29264@voom.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j2AXaZ4YhVcLc+PQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140618103215.GF29264-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>


--j2AXaZ4YhVcLc+PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 08:32:15PM +1000, David Gibson wrote:
> On Wed, Jun 18, 2014 at 01:00:22AM -0600, Simon Glass wrote:
> > This currently displays a hex value without the 0x prefix. Add the pref=
ix
> > as dtc requires it.
> >=20
> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> >  fdtdump.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/fdtdump.c b/fdtdump.c
> > index 723770d..a29aa5e 100644
> > --- a/fdtdump.c
> > +++ b/fdtdump.c
> > @@ -88,7 +88,7 @@ static void dump_blob(void *blob, bool debug)
> >  		if (addr =3D=3D 0 && size =3D=3D 0)
> >  			break;
> > =20
> > -		printf("/memreserve/ %llx %llx;\n",
> > +		printf("/memreserve/ %#llx %#llx;\n",
>=20
> Is the # modifier and its behaviour standardized?  I couldn't quickly
> find a reference.

Never mind, found the reference, and the # flag's behaviour is there.

Applied.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--j2AXaZ4YhVcLc+PQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJToXSVAAoJEGw4ysog2bOSUfUP/iq2HYXKbyEWVgtF0CNUJBQc
6acWOuf2epADIUDqqW2xYJaEp+pFTjF9yOSf4DaZhlFQk4nT1AesEgdAFlg6TBGp
KuZuJngPcd8FrIroiEgqCuQqvXcn9a6f3Sr4Y16hYcnCtNaQ0KU0ScVSshZfnVJm
CNKx+xUjJOMg9ECBtx6HkM+Y0Z0vBQE6f99lNSfO73cRUL0f0tsh87XvR0C2Tdde
URub0UqflC0rB/8+EEZ7uwtz+rcqFNGvWa4aLZGS02utsFRRrgeWSJJCou2evsTt
IfQUu28iZlMglLRPQfjZy/bSVwFHpe1A7lHy9zNMiIOzJyHqcloRPi5W+MERmUBx
wEO1GP/RWTjqj3CP6U/QVb25IsKcvgSlXzA9DLcZ32BF8Gx0eD4uGKES1NV+UZUH
C3CBbfHtXh3FMKJFsYoNlWmnhLabl4LnhOSFlN/oT+ecF+cTYLU/Emd9IZyiToHr
mQbDqhhvOPnpGFu21VaqIGB1zi38D4EIz+WmdWy/6CiTpI3vjm8lj31Eirr5ZGnO
K0/OoqK1YiLTinLjjkQ6Aa/mKm6efe5VSQQQqqlLAfkzGgP0hvTLDSHrCou8hhFI
fFSwjigLhU8+SoArnZinI7WsgsaIbSBrO2YiP++p0lYvtSL/pnmDmgjj7tk2GcNa
zC0b1QjFDtgq8rpaxRSl
=m2Yh
-----END PGP SIGNATURE-----

--j2AXaZ4YhVcLc+PQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
