From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: phandle via absolute path?
Date: Thu, 16 Jun 2016 11:01:53 +1000
Message-ID: <20160616010153.GH28087@voom.fritz.box>
References: <57618E2F.8050900@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dx9iWuMxHO1cCoFc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1466038813;
	bh=v0OdU7WhIYHfrxY+fcjBRKVkMn/m7v8HDKlidnWd+uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUVkYg23Ex2dx4MVnCU1DWYI9F8RJoVGeWViodyNoNdT/LGB/AQj07ljhkCtKXgf1
	 Ys6BSAUpYcWLA4zzvrljYjYpCQncPegdCCzv1UtfGPFJDbUBRLmnBbK7SZmLZI36w4
	 ifYcmhGCWn08fFCuNFuUn4LAxfg2m97vQ/JqiESc=
Content-Disposition: inline
In-Reply-To: <57618E2F.8050900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--Dx9iWuMxHO1cCoFc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 10:19:43AM -0700, Florian Fainelli wrote:
> Hi,
>=20
> I can't really see anything that would prevent me to have a phandle
> property taking a full-path to a node, but this produces a syntax error.
> Let's say we have this:
>=20
> /dts-v1/;
>=20
> / {
> 	soc@0 {
> 		somenode@deafbeef {
> 		};
>=20
> 		someothernode@cafebabe {
> 			handle =3D <&/soc@0/somenode@deafbeef>;
> 		};
> 	};
> };
>=20
> Does this sound like something that should work?

So you can't specify full paths quite like that because it would cause
an ambiguity in the grammar (I forget the details).  You can however
specify a phandle to a full path as:
	handle =3D <&{/soc@0/somenode@deafbeef}>;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Dx9iWuMxHO1cCoFc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYfqBAAoJEGw4ysog2bOSS3kQAJUMkzN87ozN0jhzOq1sUyWS
jALHNEY1FK05aWPdXteyFGdHnGGYpbA1mLAielHpAthI1JSb8KVJreUQLVflK9am
Ifdxf5eZsYu9LYX+/CMdBsLaDkFospu1j1h+jDX7Hbh++r6VleIMOcCQC64GLyfj
xsMUB5jwyPOY2uRFvBKKKXAhNfYWMcelg9dgJmnJJ9VxomIDdCu5ddX8+f7j+8MK
8AyksQftDl4F/Jtb3vBR1b42BAOyOrxpYta1NYbY/7H0CLvC5c212Qb81B1KmAkx
7n2JpedtdyUWPnS+qQ97i/8duBcBQLQXWsweoefn03Gve1H2xJtgXx5kFreVou4W
8Jp+LPiHLcTCmiUTwWKqoUKlgn6nFRilkuFuz8Gt30MBd6vreEk2+dgDzjQd/XEd
90WShkvB0YdK31R2Arcxlh9PtPpwHbB1+cy+bKg2UUvuiOFhykLX7iWB6nyX9C+D
xBAKZUj/gLWCJhaFL/3XWRQsKITavrk4ALL1fAIhvxULdMf/Zv8uWaDfulflqusz
LczU9Kb7mER0rfJCrGCuD/l/kHUqdBGkhqD4h8Jd4WGKS4gL3mhwSwM7HJ1jdxGE
BjHOMDbr0bDefWoLiiO8ybutogau5slS4y8AWb8fFAyaOgR6sVYeJ6cppwdBYoTp
eRIfL/2m18MW8Fp5CZRj
=HnMU
-----END PGP SIGNATURE-----

--Dx9iWuMxHO1cCoFc--
