From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] write_propval_string: Use a list of strings instead
 of "\0" in a string
Date: Sun, 30 Apr 2023 15:23:08 +0200
Message-ID: <20230430132308.et66uaghvpenacj2@pengutronix.de>
References: <20230428113217.744447-1-uwe@kleine-koenig.org>
 <ZEy5Xnh/DM/wzUWa@yekko>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="woh4vxhhglpcodpy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ZEy5Xnh/DM/wzUWa@yekko>
List-ID: <devicetree-compiler.vger.kernel.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org


--woh4vxhhglpcodpy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 29, 2023 at 04:29:50PM +1000, David Gibson wrote:
> On Fri, Apr 28, 2023 at 01:32:17PM +0200, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >=20
> > A string that contains '\0' can be written as a list of strings e.g.
> >=20
> > 	clock-names =3D "di0_pll\0di1_pll\0di0_sel\0di1_sel\0di2_sel\0di3_sel\=
0di0\0di1";
> >=20
> > is equivalent to
> >=20
> > 	clock-names =3D "di0_pll", "di1_pll", "di0_sel", "di1_sel", "di2_sel",=
 "di3_sel", "di0", "di1";
> >=20
> > The latter is easier to read, to use this format instead.
> >=20
> > Two test files are adapted accordingly to keep the test suite happy.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > Changes since (implicit) v1, sent with Message-Id:
> > 20230426182405.572729-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org:
> >=20
> >  - Adapt the test suite
> >=20
> >  tests/type-preservation.dt.yaml | 2 +-
> >  tests/type-preservation.dts     | 2 +-
> >  treesource.c                    | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/tests/type-preservation.dt.yaml b/tests/type-preservation.=
dt.yaml
> > index a0cc64cc4b69..e238d395aa02 100644
> > --- a/tests/type-preservation.dt.yaml
> > +++ b/tests/type-preservation.dt.yaml
> > @@ -12,7 +12,7 @@
> >      int16-matrix: [!u16 [0x1234, 0x5678], [0x90ab, 0xcdef]]
> >      int64: [!u64 [0x200000000]]
> >      int64-array: [!u64 [0x100000000, 0x0]]
> > -    a-string-with-nulls: ["foo\0bar", "baz"]
> > +    a-string-array: ["foo", "bar", "baz"]
>=20
>=20
> Ah.  I was afraid of this.  So "fixing" the test highlights another
> problem.  It's pretty clear to me that the whole point of this test is
> to test the preservation of the internal \0, as distinct from the
> separate strings later in there.  So, this is exercising an edge case
> of the typing markers we now add.
>=20
> Now.. personally, I've never been particularly convinced that the type
> preservation stuff was a particularly good idea.  It will never be
> perfect, and it can give a misleading impression that information is
> preserved into the dtb which isn't.  But, it's pretty well established
> now, and I assume people had reasons for wanting it.
>=20
> So, your patch makes things nicer when going from dtb -> dts, but
> breaks an established feature when going dts -> dts, or dts -> yaml.
> So, I think we need to rethink.
>=20
> Rather than changing how "strings" are emitted, I think you want to
> change how we guess typing information when coming from dtb: instead
> of just putting a single string marker on the property, we should put
> one after every \0 and we should get the output you're after.

Yeah, sounds reasonable. I looked into that, and I don't see an easy way
to do that. I'll put that aside and concentrate on the other two bigger
changes (i.e. not overwriting phandles by an overlay and label/reference
restoring) first.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--woh4vxhhglpcodpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmROa7sACgkQj4D7WH0S
/k76ZAf9FgUiRgdqag4QdFJxsldZ8DE8eMm6t8eFv8CjEP6PmD+/86il1CF/RC/5
cER0ngl/l8ECeRcyuSNGPqwNXBJavxXwzkvZqehamjGEUizgZDkMOjZo7N/KVlQ3
C7GmUMcRT5MXL/2W3AgGUUOy3u9Y9VI/ZQHS9Midm1JZqnKzxqoK195jIkVqLAdj
GB38aDXIAweb4nS6yGf9N03UbxC+oVhOyczT21kStQzXTIJuGhUrJMwWszECZ5Nf
bXKtFbWwiyd7opJ024hkSxKmIwkzNYn2KkL+q//s9LLKbDHZmN4LqpRVsV5Y3cZ0
1lv88tM/oRVUXKj4kM3tpzOIQ9tJYQ==
=HU4t
-----END PGP SIGNATURE-----

--woh4vxhhglpcodpy--
