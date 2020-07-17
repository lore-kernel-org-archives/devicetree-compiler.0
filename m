From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] dtc: Preserve negative integers in yaml and dts
 output
Date: Fri, 17 Jul 2020 21:13:16 +1000
Message-ID: <20200717111316.GK5607@umbus.fritz.box>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com>
 <20200705085940.GB12576@umbus.fritz.box>
 <CAL_JsqJt5a1SGN4JsTLBdO0+7niYh0hvEP_Ta80iuFV-__5TZA@mail.gmail.com>
 <20200708111204.GI18595@umbus.fritz.box>
 <CAL_JsqJ5+um_2XMzzL90K3wS-N98MXP52SBSnJgNQ1agsjz-eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bzq2cJcN05fcPrs+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1594984402;
        bh=iTpqEfAgQjf6STIz0PAKu11sDnOpPWPhDht4MlbrxaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QMe5xu/ydb3+ctIu5AGzilkeQnbyY2Kpb3xHnShfXan9KHxwzERMUjG+XQByLk8mT
         73lgryVmEuYvjHLUXlj0uJaCjfTJHi804qcffRhtSjGxfNxs61YYYX1EBrPcOZycoV
         YloMA6FdNBRrs6tT5trvtQ0sHTY8EgmHZGnmA3gI=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ5+um_2XMzzL90K3wS-N98MXP52SBSnJgNQ1agsjz-eg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--Bzq2cJcN05fcPrs+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2020 at 10:26:07AM -0600, Rob Herring wrote:
> On Wed, Jul 8, 2020 at 5:12 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
> >
> > On Tue, Jul 07, 2020 at 09:47:49AM -0600, Rob Herring wrote:
> > > On Sun, Jul 5, 2020 at 2:59 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6ryscVyMRj84@public.gmane.org=
=2Eau> wrote:
> > > >
> > > > On Fri, Jun 26, 2020 at 05:25:25PM +0100, Andrei Ziureaev wrote:
> > > > > Currently, in yaml output, negative values are indistinguishable =
=66rom
> > > > > positive ones. Some bindings (for example
> > > > > Documentation/devicetree/bindings/iio/accel/lis302.txt) mention n=
egative
> > > > > values. If those binding are converted to yaml, dt-schema validat=
ion
> > > > > wouldn't work with them.
> > > >
> > > > > The first patch is a mechanical change and shouldn't affect dtc's
> > > > > behaviour.
> > > > >
> > > > > The second one is the functional change. When applied, dts to dts=
 and
> > > > > dts to yaml conversions preserve the '-' sign in front of integer=
s.
> > > > >
> > > > > For now, in dts parsing, only the unary '-' operator creates nega=
tive
> > > > > values (the other operators just set the 'is_negative' flag to fa=
lse),
> > > > > but it should be easy to add support for other operators if neede=
d.
> > > >
> > > > Hmmmmm.  I'm really not convinced by this.  It seems like a lot of
> > > > fiddly work to preserve the sign only in a pretty narrow set of cas=
es.
> > > > Basically it will only be reliably correct in the case of just
> > > > (-literal).  Something like (5-3) will still show as 0xfe rather th=
an
> > > > -0x2, and if you do -(3-5) or (-3+5) you'll get the very strange
> > > > looking "-0xfe".
> > >
> > > It's a narrow set of cases if you assume an equal distribution of
> > > expressions, but I'd bet you'd be hard pressed to really find examples
> > > beyond (-literal).
> >
> > You might be right, but I still really dislike guessing the type from
> > how the user has happened to format it.  Oh, and another case: it's
> > not uncommon to use "-1" just as a shorthand for 0xfffffffff (or
> > whatever) in an essentially unsigned field.
>=20
> ~0 would be more correct for this IMO.

Eh, maybe, nonetheless it's an idiom that's common in C and therefore
likely to make its way into dts files.

> Shouldn't we follow C rules here? If we do signed operations we
> default to signed.

That's not C rules.  In C the values themselves are typed, and that's
what determines the output type, never the operations.  Plus type
promotions always go signed to unsigned, not the other way around.

> And since we don't have casting, the above should
> not be valid. (I couldn't find any examples of the above).

Uh.. that doesn't follow.  At present all integers in dtc are
implicitly unsigned, so (-1) in dtc is equivalent to (-1U) in C, which
is both valid and pretty common.

> > > But I guess at least the above examples could be supported. We'd have
> > > to assume that if there's any subtraction, then types are signed and
> > > we carry that thru. And perhaps give up and revert to unsigned if
> > > there's anything more complex (signed values plus logic ops). In that
> > > case, rather than tracking 'is_negative', we'd track is_signed and
> > > then the output side would have to check that plus the data value to
> > > output a negative.
> > >
> > > > I also don't see why this is vital to schema validation.  The
> > > > validator should know the binding, and will therefore know which
> > > > values are signed, and can appropriately treat 0xfe and -2 (or
> > > > equivalent at whatever width) as the same.
> > >
> > > We could do that to some extent. The type is abstracted from the
> > > binding and it just specifies 'int8' for example. That could be
> > > internally set to { maximum: 0xff, minimum: 0 }. This works until you
> > > want to further constrain the values for the specific bindings (e.g. {
> > > enum: [ -1, -2, 127 ]}). We could process the schemas to find every
> > > negative number and transform them to an unsigned value, but this gets
> > > messy and fragile and is something I want to minimize.
> >
> > I find it really hard to believe this would be *more* messy and
> > fragile than what you're proposing here.
>=20
> You are basing that statement on having looked at the schema tools?

No... but I guess I am judging the schema tools poorly if they can't
handle this.

> The code to walk the schema and doing this for all the possible schema
> structures that can exist is messy. I've re-written the code 3 times
> and still don't like it. So I don't want to add more to it.

Hmm.

> >  You're putting the onus on
> > dtc which fundamentally *does not have* the information it would need
> > to do this correctly.  So you're resting the validation on some
> > heuristic of how the user expresses the value, which really doesn't
> > seem like a good idea.
> >
> > The schema checking has (or should have) the binding, which specifies
> > the types (including signedness, I would hope) of each field.  That's
> > what you need to correctly analyze this
> >
> > I don't see why constraining to particular values makes this hard.
> > You know the type, so you can translate each of the specific values
> > into that type
>=20
> Actually, I wasn't thinking about that, but you may not have all the
> information. There can be multiple schemas for a given property. This
> is a very common pattern where we have a common definition containing
> the type and then specific bindings have further constraints such as
> valid values. Even within a single binding we can have this pattern:

Yes, and..?  I don't see why that makes things any harder.

> properties:
>   signed-prop:
>     $ref: /schemas/types.yaml#/definitions/int8
>=20
> if:
>   properties:
>     compatible:
>       const: foo,bar
> then:
>   properties:
>     signed-prop:
>       enum: [ -1, 0, 1 ]

You have the signed-prop flag right there, why can't you use that to
interpret the enum values correctly?

> else:
>   properties:
>     signed-prop:
>       enum: [ -2, 0, 2 ]
>=20
>=20
> While we could fixup this case and all the possible variations in
> structures (such as allOf/anyOf/oneOf schemas), I don't see how we can
> do it when the schema is split across different schema files.
>=20
> If we don't address this in dtc, signed types are so rare (I found 22
> cases of (-literal) and one case of subtraction in 1200 dts files),
> I'm inclined to just make the schemas define unsigned values. That's
> awful for readability and writers and reviewers of schema files,
> but...

Um.. why can't you basically do the same thing interpreting the
schemas as we do in dtc.  You can specify signed values, but they're
basically just implicitly cast into unsigned values for comparison to
the values from the dt.

> I'll throw out another idea. What if we extend '/bits/' to include the
> sign. So we could have '/bits/ -8' for signed 8-bit. Then it's
> explicit and there's no guessing.

That's definitely a better idea that what we have so for, but I'm
still not following why introducing signed values as a concept in dtc
actually buys anything.

Plus... to really do that correctly we really out to use signed
arithmetic in any expressions after a /bits/ -8 (or whatever).  Which
means implementing signed multiply and shifts and all the rest in
dtc.  Which isn't that much work of itself, but the larger problem is
that getting the sign information from earlier to the right part of
the parser, I suspect will be quite a drag.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Bzq2cJcN05fcPrs+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8Rh8kACgkQbDjKyiDZ
s5KI2A//dOfNG46RrYxgcfF+Z8XLhYeQOOm1D8TtxOAd2hOauECFiNvXeta3oW5c
0MHfd+KUj74kFiuUDi66bNYcQUDINwpQyFVCuVqj09QbugMMT5IqZ5jrnlHUqWNw
lXL6eXSWzwL/NlVJ6LytdF7cPl8UFLlD0FPsoqC3NqEiq/M/kqDhDJXtApFgLkLi
uWxnr8ASQuRJeSy1b6S0avnOXVR+TsUHErFhw4tWi58UTr7K3L0QPua0Zv2RF/xD
K8F/Slz2HI2bwBAIx94hKax11hav28UmOqFWDekKguA3bOu1e+GlxVLgprhtmRKC
YGM4LUli8p9ubgMS2xSHq3NrTJejar8dNaUdQSL+CClE25vsRb8NNd4a97qpFnvF
XeTIMsIHoARiDwnu8Kr+bvJsz9kgC5XzjSR393Wi6MBO8VZ75YsdEqN3RpsNatwp
dpi+kLz4M5eALQoD5UeAkY4k/V9chhkwnsk/jewepSCk1Nyg5CzmW2Kf0s05N7eq
D7948VldHr05MeAFkxsbrsdUQeQyG7E2Yb8Bd3HNkWz/6fekZXjdj51Fu5Lc8NkT
WDbrbo9iUkGAP7Qb73qkH2lEo0o+vRAc0PEFFpIaz5urL7g7kJcm4vGs7UEn9CZS
YRZ4S8Meh9JvhhFGc6ZMNxhaed1leCZHRnJbdb6uEVGBGvBYdAk=
=++NK
-----END PGP SIGNATURE-----

--Bzq2cJcN05fcPrs+--
