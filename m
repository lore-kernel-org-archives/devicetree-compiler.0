From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/8] fdtget: Fix signedness comparisons warnings
Date: Sat, 19 Jun 2021 15:40:58 +1000
Message-ID: <YM2Dai4R1/CJhADG@yekko>
References: <20210611171040.25524-1-andre.przywara@arm.com>
 <20210611171040.25524-4-andre.przywara@arm.com>
 <YMgUKtrYpxG8jADT@yekko>
 <20210615225133.4a597e7d@slackpad.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1EixGWSr3EAtTIeh"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1624087245;
        bh=NTzzVDLO/Kl/zM8L30g4cmyVTihOboGrNRrC/KN2UjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qT/sd+R7oxwFyca96z5Dnqb7qrun0Vy0y4r5vlO0YIcJPKCOgpowG7YPwbgCfJ6vi
         ej1BZSNYEmiENnrtUqOZJA1sCdGUKxkSwUPoZeOZ1SKXg808smk2/VVhJMy9SN3I2h
         0KSqMj8CY/ue5+JdBCWRUL6tDlgA2wodbhWAGqoo=
Content-Disposition: inline
In-Reply-To: <20210615225133.4a597e7d-KTS7eRBhINUXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>


--1EixGWSr3EAtTIeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 10:51:33PM +0100, Andre Przywara wrote:
> On Tue, 15 Jun 2021 12:44:58 +1000
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>=20
> Hi,
>=20
> > On Fri, Jun 11, 2021 at 06:10:35PM +0100, Andre Przywara wrote:
> > > With -Wsign-compare, compilers warn about a mismatching signedness in
> > > the different legs of the conditional operator, in fdtget.c.
> > >=20
> > > In the questionable expression, we are constructing a 16-bit value ou=
t of
> > > two unsigned 8-bit values, however are relying on the compiler's
> > > automatic expansion of the uint8_t to a larger type, to survive the l=
eft
> > > shift. This larger type happens to be an "int", so this part of the
> > > expression becomes signed.
> > >=20
> > > Fix this by explicitly blowing up the uint8_t to a larger *unsigned* =
type,
> > > before doing the left shift. And while we are at it, convert the hard=
ly
> > > readable conditional operator usage into a sane switch/case expressio=
n.
> > >=20
> > > This fixes "make fdtget", when compiled with -Wsign-compare.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =20
> >=20
> > Hmm... this code is pretty confusing.  I can't actually see any path
> > where size will be set to something other than 4, 1 or -1.
>=20
> If I read correctly, then size=3D=3D2 could come from the format modifier
> "h", as parsed by utilfdt_decode_type().

Ah, yes, missed that one.

> =20
> > The change looks correct, despite that.  Though I wonder if we should
> > add an fdt16_ld() helper for this case.
>=20
> Done.
>=20
> Cheers,
> Andre
>=20
> >=20
> > > ---
> > >  fdtget.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/fdtget.c b/fdtget.c
> > > index 777582e..1f6eb73 100644
> > > --- a/fdtget.c
> > > +++ b/fdtget.c
> > > @@ -62,8 +62,14 @@ static int show_cell_list(struct display_info *dis=
p, const char *data, int len,
> > >  	for (i =3D 0; i < len; i +=3D size, p +=3D size) {
> > >  		if (i)
> > >  			printf(" ");
> > > -		value =3D size =3D=3D 4 ? fdt32_ld((const fdt32_t *)p) :
> > > -			size =3D=3D 2 ? (*p << 8) | p[1] : *p;
> > > +		switch (size) {
> > > +		case 4: value =3D fdt32_ld((const fdt32_t *)p); break;
> > > +		case 2: value =3D ((unsigned)(*p) << 8) | p[1]; break;
> > > +		case 1:
> > > +		default:
> > > +			value =3D *p;
> > > +			break;
> > > +		}
> > >  		printf(fmt, value);
> > >  	}
> > >   =20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1EixGWSr3EAtTIeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDNg2gACgkQbDjKyiDZ
s5KnQA/7BYaB3ni6KrCF01yw81oRDj09YJZc5U31fDozpeaYo3BaSw52CBOGDJDb
GNkx4lbSm3ZBtaBaI+m/LOf5rYU5Lr/Qp8CQ9GREKZoj4Sl36T+Q3QJJnecNUNvq
bB6a21l4fYFoNJe16uH1VtVJm38cFhDMYzL1zeIsfIaLBfp/pNYdx9fqgNyAzPBw
meZ2gqFkfssGm30h5UjNjDiNGuPupojwjMQ2XEU+Dxr6n9CtKXBjgn3P9L5IV0TU
40cEUyV86IAGyT42VxhGMlRAOCVzoGKfr54KWrbQpsapMaLDXBAkCQW8Jec+Ip6f
a6Ke0jjqn6m0E9cb1vIBv5AbKG9hjYCl/UjH6UnTkNyHqjVxXmbOZZIJBKtbaZIK
utou4JRMEzsYhxleGA7o/IMrqJU27I/5HecVppWxntjrvdxsofds4+v6yFWx9Z2V
g0ZxOeAt0JVi1vtVuYz4EIR7XVYWDvgPxW7UYPDT5g0No/dwc79T041UWBC+fY2u
9nefNeOvp7M29ua5uXGkMiPuTfbZAugXC+k0drt+UOrunaxdlGve6zuiCDEs3DuV
s0mdEPYJO1Y/GO+gLajiiy+WoqKmRap1yR9s54ZCUZaP8ygsSL/fzZLpORnCUFR0
sGctjiy199im5/sZwD7S/JRVkAZ4hPPMTBczMNjBvmdn7qZvpvg=
=bIAj
-----END PGP SIGNATURE-----

--1EixGWSr3EAtTIeh--
