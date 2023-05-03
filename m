From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2] write_propval_string: Use a list of strings instead
 of "\0" in a string
Date: Wed, 3 May 2023 23:43:45 +1000
Message-ID: <ZFJlESnMYNI/jmHr@yekko>
References: <20230428113217.744447-1-uwe@kleine-koenig.org>
 <ZEy5Xnh/DM/wzUWa@yekko>
 <CAL_JsqJ9QManUTkOpgaE85b-uVB_JQZGsLXdJCz7_5J_3Aqq2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UDjVL0QimPemTP3F"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1683130996;
        bh=LwalnhhucK0G/Fg2X6Jr0b5axLgXUovpzlK7kSRm8iA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M6PEYp1V8CpTLjAXjK9/5iJoesvbb4Bg6dfRHr2vFK+ij6uNdnfnuu3vJam9bAAgY
         XaOCri78Pg53cAxycl6BHQHoYhoXWcokn6C0ZvKABOLLu8ZfKGQPMxg/8QeLJPSCqn
         Lb/50l4Ubbf2wDZRbhEDorHNN/dqEpw9AzUyS2Ao=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ9QManUTkOpgaE85b-uVB_JQZGsLXdJCz7_5J_3Aqq2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>


--UDjVL0QimPemTP3F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 01:43:22PM -0500, Rob Herring wrote:
> On Sat, Apr 29, 2023 at 1:52=E2=80=AFAM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Fri, Apr 28, 2023 at 01:32:17PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > >
> > > A string that contains '\0' can be written as a list of strings e.g.
> > >
> > >       clock-names =3D "di0_pll\0di1_pll\0di0_sel\0di1_sel\0di2_sel\0d=
i3_sel\0di0\0di1";
> > >
> > > is equivalent to
> > >
> > >       clock-names =3D "di0_pll", "di1_pll", "di0_sel", "di1_sel", "di=
2_sel", "di3_sel", "di0", "di1";
> > >
> > > The latter is easier to read, to use this format instead.
> > >
> > > Two test files are adapted accordingly to keep the test suite happy.
> > >
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > ---
> > > Changes since (implicit) v1, sent with Message-Id:
> > > 20230426182405.572729-1-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org:
> > >
> > >  - Adapt the test suite
> > >
> > >  tests/type-preservation.dt.yaml | 2 +-
> > >  tests/type-preservation.dts     | 2 +-
> > >  treesource.c                    | 2 +-
> > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tests/type-preservation.dt.yaml b/tests/type-preservatio=
n.dt.yaml
> > > index a0cc64cc4b69..e238d395aa02 100644
> > > --- a/tests/type-preservation.dt.yaml
> > > +++ b/tests/type-preservation.dt.yaml
> > > @@ -12,7 +12,7 @@
> > >      int16-matrix: [!u16 [0x1234, 0x5678], [0x90ab, 0xcdef]]
> > >      int64: [!u64 [0x200000000]]
> > >      int64-array: [!u64 [0x100000000, 0x0]]
> > > -    a-string-with-nulls: ["foo\0bar", "baz"]
> > > +    a-string-array: ["foo", "bar", "baz"]
> >
> >
> > Ah.  I was afraid of this.  So "fixing" the test highlights another
> > problem.  It's pretty clear to me that the whole point of this test is
> > to test the preservation of the internal \0, as distinct from the
> > separate strings later in there.  So, this is exercising an edge case
> > of the typing markers we now add.
> >
> > Now.. personally, I've never been particularly convinced that the type
> > preservation stuff was a particularly good idea.  It will never be
> > perfect, and it can give a misleading impression that information is
> > preserved into the dtb which isn't.  But, it's pretty well established
> > now, and I assume people had reasons for wanting it.
>=20
> I don't really think so. It was a side effect of adding the yaml
> support AFAICT. Before commit 32b9c6130762 ("Preserve datatype markers
> when emitting dts format"), any '\0' was not maintained.

Right, which also introduced this test, presumbly to verify those
semantics.

> Speaking of the YAML output, at least for dtschema, it is no longer
> being used with using dtb format directly for over a year now. Support
> for yaml encoding in dtschema was removed completely in the January
> release. Perhaps in dtc it should be deprecated for some time if not
> just outright removed. I'm not aware of anyone else using it.

Oh, that's good to hear.  I've long thought the yaml output was a bad
idea, because it makes people think the dtb encodes type information
which it doesn't and can't.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UDjVL0QimPemTP3F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmRSZPsACgkQzQJF27ox
2GcK5g//VRmAOu5mSAEqbBrsCHnm5B6TIzyW2DgD/FlHNGz+PcxIDYSBUDlZ+c40
rBtB6u1DEkDX74ZyaNwLvHFy9NRQvqgl/84Z/Iq34kconZsBuild01sbiiiHItup
KEAbIcv4+sRZhzGYbbY9nAJz9aaOIGRerm9k2fTmRn0DKmxpJ3aXz1iDI7t+rkUS
bFi0zaVc4PDpCK8ekh5vnYX1Xnf980jOS9K7SkuI0JDyOgKVX1HnYt9VD/3AnC25
I/xtQNBNOSK2TeQz8rq6hfAnNnna50a1UF+8asA0ckKLGXP83DlXkxrs+1mc1dym
UEvMov6hgD3bSHyYeCTTrW75LmO6GyAmqiO5PzPFq0Fa61bbJbU1f0khzlpbXZtz
Q7zI9m4i8eWea4CVspdm6tLlGnJWADyf/nAJVByVQbqYGt/kZJ1kVD1jwV0a3ac+
VYEQUh21+gvheI6RktTSUoPQpj8pFDfucgpU1u96Iao8h6+K3ONAHe+FW0t/KF5e
Rv1lg6ykkcK7UVnF3bzJOO5IhN4RgweOYpOJN0DPEUT/uVtBVRzMaU+va7WlXUPw
HolJNfi90183kWcC1Zf0xEnlkHCC+ZuKotTtFAqo2OYmfD31JT8xTbtNQ3V/TNpD
RjLkxWpMRHGzs+bBfg+OT/FWFtwgjimOuBgfEBDI4b1WZJx1Yq0=
=OnY9
-----END PGP SIGNATURE-----

--UDjVL0QimPemTP3F--
