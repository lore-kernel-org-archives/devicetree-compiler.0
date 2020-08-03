From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] dtc: Preserve negative integers in yaml and dts
 output
Date: Mon, 3 Aug 2020 18:52:18 +1000
Message-ID: <20200803085218.GG7553@yekko.fritz.box>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com>
 <20200705085940.GB12576@umbus.fritz.box>
 <CAL_JsqJt5a1SGN4JsTLBdO0+7niYh0hvEP_Ta80iuFV-__5TZA@mail.gmail.com>
 <20200708111204.GI18595@umbus.fritz.box>
 <CAL_JsqJ5+um_2XMzzL90K3wS-N98MXP52SBSnJgNQ1agsjz-eg@mail.gmail.com>
 <20200717111316.GK5607@umbus.fritz.box>
 <CAL_JsqKwQ0wFq60EKNz_g8R-We9JKWh7P=hgtRTOYtufac179Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1596444743;
        bh=14UBmqwvFvocJuKYpjc+fpSPt5ek5im7hW+MK9Mxcyk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ieB4K4o7e9QPSxyNLqi8JIhqvt/px1YsdMhT0Tpdq7otAymKeThckP0Evgd8Rr7RS
         e/U6j4ZGeM7qTwTkn1QQ3PqWEF8Kfq6/j5qEeI38EK+dj848oQDe8PoiwNxKm3ORTS
         8rpzZc85YDmas9gMzqfcrsEpQK2VUzHVIjqIuApc=
Content-Disposition: inline
In-Reply-To: <CAL_JsqKwQ0wFq60EKNz_g8R-We9JKWh7P=hgtRTOYtufac179Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 02:25:30PM -0600, Rob Herring wrote:
> On Fri, Jul 17, 2020 at 5:13 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Wed, Jul 08, 2020 at 10:26:07AM -0600, Rob Herring wrote:
> > > On Wed, Jul 8, 2020 at 5:12 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6ryscVyMRj84@public.gmane.org=
=2Eau> wrote:
> > > >
> > > > On Tue, Jul 07, 2020 at 09:47:49AM -0600, Rob Herring wrote:
> > > > > On Sun, Jul 5, 2020 at 2:59 AM David Gibson <david-xT8FGy+AXnSZP5U4TJ/6Hg@public.gmane.org=
r.id.au> wrote:
> > > > > >
> > > > > > On Fri, Jun 26, 2020 at 05:25:25PM +0100, Andrei Ziureaev wrote:
> > > > > > > Currently, in yaml output, negative values are indistinguisha=
ble from
> > > > > > > positive ones. Some bindings (for example
> > > > > > > Documentation/devicetree/bindings/iio/accel/lis302.txt) menti=
on negative
> > > > > > > values. If those binding are converted to yaml, dt-schema val=
idation
> > > > > > > wouldn't work with them.
> > > > > >
> > > > > > > The first patch is a mechanical change and shouldn't affect d=
tc's
> > > > > > > behaviour.
> > > > > > >
> > > > > > > The second one is the functional change. When applied, dts to=
 dts and
> > > > > > > dts to yaml conversions preserve the '-' sign in front of int=
egers.
> > > > > > >
> > > > > > > For now, in dts parsing, only the unary '-' operator creates =
negative
> > > > > > > values (the other operators just set the 'is_negative' flag t=
o false),
> > > > > > > but it should be easy to add support for other operators if n=
eeded.
> > > > > >
> > > > > > Hmmmmm.  I'm really not convinced by this.  It seems like a lot=
 of
> > > > > > fiddly work to preserve the sign only in a pretty narrow set of=
 cases.
> > > > > > Basically it will only be reliably correct in the case of just
> > > > > > (-literal).  Something like (5-3) will still show as 0xfe rathe=
r than
> > > > > > -0x2, and if you do -(3-5) or (-3+5) you'll get the very strange
> > > > > > looking "-0xfe".
> > > > >
> > > > > It's a narrow set of cases if you assume an equal distribution of
> > > > > expressions, but I'd bet you'd be hard pressed to really find exa=
mples
> > > > > beyond (-literal).
> > > >
> > > > You might be right, but I still really dislike guessing the type fr=
om
> > > > how the user has happened to format it.  Oh, and another case: it's
> > > > not uncommon to use "-1" just as a shorthand for 0xfffffffff (or
> > > > whatever) in an essentially unsigned field.
> > >
> > > ~0 would be more correct for this IMO.
> >
> > Eh, maybe, nonetheless it's an idiom that's common in C and therefore
> > likely to make its way into dts files.
>=20
> So we follow C, but...
>=20
> > > Shouldn't we follow C rules here? If we do signed operations we
> > > default to signed.
> >
> > That's not C rules.  In C the values themselves are typed, and that's
> > what determines the output type, never the operations.  Plus type
> > promotions always go signed to unsigned, not the other way around.
> >
> > > And since we don't have casting, the above should
> > > not be valid. (I couldn't find any examples of the above).
> >
> > Uh.. that doesn't follow.  At present all integers in dtc are
> > implicitly unsigned, so (-1) in dtc is equivalent to (-1U) in C, which
> > is both valid and pretty common.
>=20
> ...don't follow C? The 'U' is essentially casting.

Well, we try to follow C as a rule, but there are occasional
differences.  Some are deliberate choices, some are basically
mistakes, but we can't change them now.  Defaulting to unsigned rather
than signed is.. borderline.  Unsigned values (like addresses) are a
lot more common in DT data, but whether that's enough to justify the
change is debatable.

But in any case, defaulting to unsigned rather than signed is a far
smaller and easier to understand change than having the '-' operator
change the expression type.

[snip]
> > > >  You're putting the onus on
> > > > dtc which fundamentally *does not have* the information it would ne=
ed
> > > > to do this correctly.  So you're resting the validation on some
> > > > heuristic of how the user expresses the value, which really doesn't
> > > > seem like a good idea.
> > > >
> > > > The schema checking has (or should have) the binding, which specifi=
es
> > > > the types (including signedness, I would hope) of each field.  That=
's
> > > > what you need to correctly analyze this
> > > >
> > > > I don't see why constraining to particular values makes this hard.
> > > > You know the type, so you can translate each of the specific values
> > > > into that type
> > >
> > > Actually, I wasn't thinking about that, but you may not have all the
> > > information. There can be multiple schemas for a given property. This
> > > is a very common pattern where we have a common definition containing
> > > the type and then specific bindings have further constraints such as
> > > valid values. Even within a single binding we can have this pattern:
> >
> > Yes, and..?  I don't see why that makes things any harder.
>=20
> The different schema whether in different files or the same file are
> essentially completely independent from each other. That's just how
> json-schema works.

Ah, ok, I think I get you.  Really it seems like the type checks in
json-schema are kind of bogus - they're "checking" values on the JSON
side, but on the dtb side those types are more or less structurally
enforced (i.e. if you interpret 8 bits of your bytestring as an u8, it
can't fail to be a valid u8).

As I feared, this is really again showing up the mismatch between the
dt and json data models.  I can understand the impetus to want to
re-use the existing json schema tooling, but there's some real uglies
in the interface.

Basically the problem is that you want to run your schemas on a
"sensible" json representation of the data - you want strings as json
strings, lists of values as json lists of json integers and so forth.
But dtb files fundamentally *do not know* the right json
representation.  dtc doesn't either, since it was built around the dtb
data model where properties are just bytestrings.

The only way it's working at all by abusing dts side information - how
the user has chosen to enter the data - to infer the likely json
representation.  But it's a pretty flawed approach:

1) It will break if for whatever reason the user used a source
   representation that wasn't an obvious match to the json structuring
   we want

2) It means we can only check dts files, not dtb files

3) Most importantly, it breaks down when we get to details that don't
   have a natural representation in dts syntax; like the signedness of
   integers.

I think signedness won't be the end of it either.  Just off the top of
my head, I think there's a whole other can of worms in the fact that
dtb "strings" are basically just bytestrings that happen to have no
\0s until the terminating \0, whereas JSON strings are Unicode.

> > > properties:
> > >   signed-prop:
> > >     $ref: /schemas/types.yaml#/definitions/int8
> > >
> > > if:
> > >   properties:
> > >     compatible:
> > >       const: foo,bar
> > > then:
> > >   properties:
> > >     signed-prop:
> > >       enum: [ -1, 0, 1 ]
> >
> > You have the signed-prop flag right there, why can't you use that to
> > interpret the enum values correctly?
>=20
> What flag? 'signed-prop' is a completely opaque DT property name here.
> At the location of the enum, I don't know if the -1 should be 0xff,
> 0xffff, or 0xffffffff. I guess when I have the schema and the instance
> data, I'd have the size. Though the size is part of the parent array,
> not the scalar, so maybe not.

Yeah, sorry, I misunderstood the example.

> > > else:
> > >   properties:
> > >     signed-prop:
> > >       enum: [ -2, 0, 2 ]
> > >
> > >
> > > While we could fixup this case and all the possible variations in
> > > structures (such as allOf/anyOf/oneOf schemas), I don't see how we can
> > > do it when the schema is split across different schema files.
> > >
> > > If we don't address this in dtc, signed types are so rare (I found 22
> > > cases of (-literal) and one case of subtraction in 1200 dts files),
> > > I'm inclined to just make the schemas define unsigned values. That's
> > > awful for readability and writers and reviewers of schema files,
> > > but...
> >
> > Um.. why can't you basically do the same thing interpreting the
> > schemas as we do in dtc.  You can specify signed values, but they're
> > basically just implicitly cast into unsigned values for comparison to
> > the values from the dt.
>=20
> Maybe, I suppose there's some way to do that in python, and we'd have
> to override what standard tools already do for us.
>=20
> > > I'll throw out another idea. What if we extend '/bits/' to include the
> > > sign. So we could have '/bits/ -8' for signed 8-bit. Then it's
> > > explicit and there's no guessing.
> >
> > That's definitely a better idea that what we have so for, but I'm
> > still not following why introducing signed values as a concept in dtc
> > actually buys anything.
> >
> > Plus... to really do that correctly we really out to use signed
> > arithmetic in any expressions after a /bits/ -8 (or whatever).
>=20
> Why? This is just like doing a C cast to signed *after* you do all
> operations. We're just passing thru extra type information.

Hmm, I guess.  Not sure that really satisfies principle of least
surprise.

> > Which
> > means implementing signed multiply and shifts and all the rest in
> > dtc.  Which isn't that much work of itself, but the larger problem is
> > that getting the sign information from earlier to the right part of
> > the parser, I suspect will be quite a drag.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8n0EAACgkQbDjKyiDZ
s5KKnxAAzDbrCjQr22boKjTOV2HgYpG2mPu0rbUDIrbDVouUQm/9ziE0cox6cZGJ
lOAznJFaE7YjynncUZsgdnKwfPBWnwKGkcokZzMdfOmGagkDf5m44yklCAzQV/Cd
Dop4ZP/D6DGMpcbD9cK/sRI9LayzVOwjzplDardlcxEPIXd0kgZHdinoeli1o+fR
zURR11GDESVGdB97qEIKffnFcHO1K36vK4WzaUdSoKHIFt3F9eLtPS2L3df9kou3
dpm5u/LvtSdP1sOl4qzLQmYgflpcLeSTO3KGo+b7mymMqDXHDS+FOMJj9iXTACeL
lyuq25VK5On10oB0TnDTLsc7Ti/SyXpDhGRvQ5FkSWKtvi+uRSXApTx2MJghJO3m
bOIjlq+/qaY3dCUd2kKOdTN0fUZxmrvNW1GT3N25EDsLtwZe6uhQnv8z5PBgrAfB
mJ/fEfFLWAbQjxdOFey5INTxZEUEgd24cGIROnI+aGPSwNYsqbVsIz57mwybdzBA
M1GfNCuS2Cp8VP0WXxSmgmYGi6EB+5bAjTSnkCuV6udNIFaDOLs9OW0nejg0pfmE
9O3kjcgVKOt1z2KLhcQlJH0UxpiVqhmHio49pyfF+b3DZK/ZoBVHvL/cJIcxHunh
3FWxlLjS9ApH0cSHSNCzTe8k2FuikWyS3xvZAUC1HrSTpca4T9s=
=j+gQ
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
