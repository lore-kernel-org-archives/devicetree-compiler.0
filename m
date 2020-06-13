From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: /bits/ encoding
Date: Sat, 13 Jun 2020 17:10:08 +1000
Message-ID: <20200613071008.GC5861@umbus.fritz.box>
References: <CAL_JsqLsT=HBTdRzEg4k6jOHDYkELj4cLXDjX8+9mdc1fNk0RQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1592032217;
        bh=g0jbFNYwgR8UwbrhtJTulzF24mPeCpbmWrsS9ohB5Jg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fyw17kWM/BpvsCWEAVR1CmN7Y7JaDfqneyAzxPp1Cm3dyu198Xp79/a/lMswKaJXu
         OKoAoPxGesbJnkMvGQVm9qymfuiuJdoe1Vv5FGUs/kNkVX99K867scePt4MHdYa5qm
         m9JwEAC7qBJ1e2/nl6dP0obnog/OqxsGn4gCKJsg=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLsT=HBTdRzEg4k6jOHDYkELj4cLXDjX8+9mdc1fNk0RQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 02:02:55PM -0600, Rob Herring wrote:
> What's the expected property length in these 2 cases?:
>=20
> prop =3D /bits/ 16 <0x1234 0x5678>, <0x9abc 0xdef0>;
> prop =3D /bits/ 16 <0x1234 0x5678 0x9abc 0xdef0>;
>=20
> For 32-bit sizes, the <> don't matter. I had assumed /bits/ applied to
> the whole property value and the <> don't matter in that case either.
> But that's not the case in dtc. In the 1st example, the last 2 values
> are 32-bit. In order to make all values in the 1st example 16-bit, we
> have to do:
>=20
> prop =3D /bits/ 16 <0x1234 0x5678>, /bits/ 16 <0x9abc 0xdef0>;
>=20
> That also means one could do:
>=20
> prop =3D /bits/ 16 <0x1234 0x5678>, /bits/ 8 <0x9a 0xbc 0xde 0xf0>;
>=20
> Something we want to support (it already works)?

Allowing that was my intention when I added this code.

> I don't think such a
> thing exists in the wild,

Well, arrays of 16-bit or 8-bit values in the tree are pretty rare to
begin with.  The reason I wanted to allow mixed things here is that
properties with mixed types of data absolutely do exist in bindings
out there.  Note that I suspect there could well be some examples out
there with mixed 64-bit and 32-bit values, which could also this
form if it's useful to do so.  e.g. 'reg' of nodes on a bus with
#address-cells =3D 2 and #size-cells =3D 1 could be like that.

> the kernel's array parsing doesn't expect
> it, and I haven't encountered a use for it. Given the non-existent
> type information in FDT, that doesn't seem like a great idea.

Hrm.  To me, it's this way precisely *because* there's no type
information.  Properties are bytestrings, any internal structure is
added by bindings.  dtc's job here isn't to impose a structure that
doesn't exist onto properties, just to provide tools to let people
build those bytestrings in the most convenient possible way.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl7ke84ACgkQbDjKyiDZ
s5J3dxAAvP/V5Ng4fDUlKGquizWc6i3iUSOOhRvLSYEGJQj68fV+QJpRRa2xYKqk
AeqTlAJU9M5SdzByqMeR3qi2/W5zKfAwM3ZWuv2y1lUyhP7xIdiQax4/6BYN3dQD
a3vr7MpxMjDYVuqzt5KqpRgLSozrhLwKtcmKE8RC17escfUcLXuhzLcdy6Tva3uZ
rdvh7xblaY952v24if5uiu8j/c0JGNsIUnCTYgGl6lDeeCktewZ59/C6jABJkmih
EpOojJeRXG/yelJgtgQQUtxRdcX/znGIEFljxQBI0eW/LUwyqrZz8ekrtBbNFDt1
jxAjejZMXFUYh9rVNrYwqKqyIjW4OsTvC1oPh/mxcSFgjUbHhzguAILxbrgtFO/f
yP59iwMxfgkgZHW+g5pQzp4Gid87LqRkOVc3FmGy4RC0phSM2xM1+y2QzhXjLycz
5YY1/C0H1ar/mK3D7wkwtA/JNNcby/C6jQwaQ2p9wMcZsqxeMTb4UGpY/5tWrWlq
NgIlyqkWZTRarmPeg/h6v5VONhcwDTD8x2sY+IZ15VTCuFXlV1hoU6DSr56neE2e
aaeXbo2WbhO0m5L/c/Ql8PMj2Q2ht8hJCVwzYAo/vQRfCuVc1j+uqbrT2NsziWdY
PzO5fMyjFCarNEjOJOO+xZac/lSe/iVB2yxTEESIKrLb6qAHeMk=
=DT5y
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
