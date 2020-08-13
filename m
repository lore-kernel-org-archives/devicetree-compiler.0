From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: libfdt / fdt_check_node_offset_ with VALID_INPUT
Date: Thu, 13 Aug 2020 17:09:45 +1000
Message-ID: <20200813070945.GD17532@yekko.fritz.box>
References: <34725235.0rVAnNm8GT@noys4>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OROCMA9jn6tkzFBc"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1597302593;
        bh=CdUZQDX+JRBzOOMycm+iIgo0V63idjVB2adIm6dz6lg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZtcX6uzKMiwG9EDLj6YDThcQwb9EllIzMtxa12DVCRmGrSb5sMQ7obAXV849sfkDX
         vm8UNOiMRDK8UOdvUPh3qIGYIlseuUWcd89FnDk/GT+vLZSQ4/kKCShjDvzKtYq0+Y
         fZdBc3Zk+UeIMkSixAk7dodnQ4+RYC8+F7UcO8vU=
Content-Disposition: inline
In-Reply-To: <34725235.0rVAnNm8GT@noys4>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Frank Mehnert <frank.mehnert-2ptZNfhJYoRaodhZ+FW2PA@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--OROCMA9jn6tkzFBc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 05:48:56PM +0200, Frank Mehnert wrote:
> Hi all,
>=20
> I'm not sure if I found a bug or if I mis-use libfdt.
>=20
> I have a valid Linux device tree in memory and want to recursively scan
> thru it. The device tree contains a root node and several subnodes.
>=20
> First, I start with the root node:
>=20
>   int root =3D fdt_next_node(fdt, -1, NULL);

Tangential aside: the offset of the root node is *always* 0, you don't
need to "find" it with code like this.

> Here, root is set to 0. Now I determine the offset of the first sub node:
>=20
>   int subnode =3D fdt_first_subnode(fdt, root);
>=20
> Here, subnode is either 0 if FDT_ASSUME_MASK contains ASSUME_VALID_INPUT
> or 164 (in my case) if FDT_ASSUME_MASK does not contain ASSUME_VALID_INPU=
T.

That certainly sounds like a bug.  Adding things to FDT_ASSUME_MASK
shouldn't change behaviour for valid inputs.

> As far as I understand, fdt_first_subnode() should not return the node
> offset of the current node if there are subnodes available.

That's correct.

> I think the problem origins at fdt_check_node_offset_() in fdt.c: If
> VALID_INPUT is set, the whole code in that function is skipped. If that
> flag is not set then fdt_next_tag(fdt, offset, &offset) is called and
> the resulting 'offset' is returned.
>=20
> In other words, fdt_check_node_offset_() has a side effect which depends
> on the VALID_INPUT flag.

Right.  Looks like the problem is that the next if *looks* like just
an error/sanity check, which can_assume(VALID_INPUT) is bypassing.
However, it also has the fdt_next_tag() call which alters offset.

I was afraid of this sort of thing when we added the assumptions
stuff.  Really we need to be running the testsuite with different
assumptions masks, but it's fiddly to do.

Care to send a patch?

[Another aside: why are you using ASSUME_VALID_INPUT - it's really
only of value if you have to run your code in an *extremely* space
limited environment, I don't recommend it as a rule]

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OROCMA9jn6tkzFBc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl805zcACgkQbDjKyiDZ
s5JKphAAwuU/767QnAVOJliZy2QCbEBjthNHzPMnYDcg6gG/6dpd0FhVlobwImJF
Yq+KiGBk6x7h0i7AVmbRlb1944ZfnmAqrLZETAJVttSTHQ+3pf1s64iGCoi+e8qv
y7H5/uM5JbpwbjBIvfBGEtqKcI5prGz4fwpWcc3iiN+exczoz6S4VsaMYwPkvQUX
UTnJ2B9OeMc7qLt+hxcgBsYWA59s/v+Fhw8XZvQjnXWo5o0j5K4tIHo+c0O8dzTr
OYT7VupImMJ/0qYo9ruWCe+elgkBfjtf3bqCIdyykczO7f1RpoxhYNELUd3x7uwb
oAvrNzp1fKDQWmNtlILMKXd+v2F3ywbqwJ7eulowU32+V8DOxWwMUr5DMcF+MF9D
AcOce59t527ksvx4/F6z4qQ9lQ9mdhyobJtAbTWGb6pAgeDZP7xBxzwVwVTS5uMN
gbccQzoj2N59IWQjojM9f9Avtk9DO2JPThafnd7DAA/O0IR07sNBkBpBfQYdBhXx
ZSotEXUAR/MRIsabnKsRTp7b2Amj8inv5lmPvNLsuDE/uybqeyW/vwsUzO+uKfR7
W0V338MaRMFGPY2xXiz4w4W/PgLN8S8/oXLonAtkXIRUqyFXXT3zChhuSHiVP8rD
U+qtbIEHDrGI6ue8MzKVfHloj4e7zyttRhjD0ThqEERRYVi2PlM=
=LLse
-----END PGP SIGNATURE-----

--OROCMA9jn6tkzFBc--
