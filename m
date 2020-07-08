From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] dtc: Preserve negative integers in yaml and dts
 output
Date: Wed, 8 Jul 2020 21:12:04 +1000
Message-ID: <20200708111204.GI18595@umbus.fritz.box>
References: <20200626162528.2129-1-andrei.ziureaev@arm.com>
 <20200705085940.GB12576@umbus.fritz.box>
 <CAL_JsqJt5a1SGN4JsTLBdO0+7niYh0hvEP_Ta80iuFV-__5TZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+Hr//EUsa8//ouuB"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1594206731;
        bh=J3HPztUaHJfyYsT95VpLs0exHIlF3adFqJWXbMYRTEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MjAnrrFVLSBk3x5YMjAtxTISf9M/iy7FMRbFy/9IP96zPdLnwS3rl7LySrsz/iivS
         Ei1Qc5lw6llkvPJMJnWH30HhY2zeIjobMfegP2gzMGl0Zclmu1BgJ27diWseB7Zeci
         Cq6Vg5A02T2p1tOLcklmiCV0TVJr/GBFVB95ShEM=
Content-Disposition: inline
In-Reply-To: <CAL_JsqJt5a1SGN4JsTLBdO0+7niYh0hvEP_Ta80iuFV-__5TZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrei Ziureaev <andrei.ziureaev-5wv7dgnIgG8@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--+Hr//EUsa8//ouuB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2020 at 09:47:49AM -0600, Rob Herring wrote:
> On Sun, Jul 5, 2020 at 2:59 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>=
 wrote:
> >
> > On Fri, Jun 26, 2020 at 05:25:25PM +0100, Andrei Ziureaev wrote:
> > > Currently, in yaml output, negative values are indistinguishable from
> > > positive ones. Some bindings (for example
> > > Documentation/devicetree/bindings/iio/accel/lis302.txt) mention negat=
ive
> > > values. If those binding are converted to yaml, dt-schema validation
> > > wouldn't work with them.
> >
> > > The first patch is a mechanical change and shouldn't affect dtc's
> > > behaviour.
> > >
> > > The second one is the functional change. When applied, dts to dts and
> > > dts to yaml conversions preserve the '-' sign in front of integers.
> > >
> > > For now, in dts parsing, only the unary '-' operator creates negative
> > > values (the other operators just set the 'is_negative' flag to false),
> > > but it should be easy to add support for other operators if needed.
> >
> > Hmmmmm.  I'm really not convinced by this.  It seems like a lot of
> > fiddly work to preserve the sign only in a pretty narrow set of cases.
> > Basically it will only be reliably correct in the case of just
> > (-literal).  Something like (5-3) will still show as 0xfe rather than
> > -0x2, and if you do -(3-5) or (-3+5) you'll get the very strange
> > looking "-0xfe".
>=20
> It's a narrow set of cases if you assume an equal distribution of
> expressions, but I'd bet you'd be hard pressed to really find examples
> beyond (-literal).

You might be right, but I still really dislike guessing the type from
how the user has happened to format it.  Oh, and another case: it's
not uncommon to use "-1" just as a shorthand for 0xfffffffff (or
whatever) in an essentially unsigned field.

> But I guess at least the above examples could be supported. We'd have
> to assume that if there's any subtraction, then types are signed and
> we carry that thru. And perhaps give up and revert to unsigned if
> there's anything more complex (signed values plus logic ops). In that
> case, rather than tracking 'is_negative', we'd track is_signed and
> then the output side would have to check that plus the data value to
> output a negative.
>=20
> > I also don't see why this is vital to schema validation.  The
> > validator should know the binding, and will therefore know which
> > values are signed, and can appropriately treat 0xfe and -2 (or
> > equivalent at whatever width) as the same.
>=20
> We could do that to some extent. The type is abstracted from the
> binding and it just specifies 'int8' for example. That could be
> internally set to { maximum: 0xff, minimum: 0 }. This works until you
> want to further constrain the values for the specific bindings (e.g. {
> enum: [ -1, -2, 127 ]}). We could process the schemas to find every
> negative number and transform them to an unsigned value, but this gets
> messy and fragile and is something I want to minimize.

I find it really hard to believe this would be *more* messy and
fragile than what you're proposing here.  You're putting the onus on
dtc which fundamentally *does not have* the information it would need
to do this correctly.  So you're resting the validation on some
heuristic of how the user expresses the value, which really doesn't
seem like a good idea.

The schema checking has (or should have) the binding, which specifies
the types (including signedness, I would hope) of each field.  That's
what you need to correctly analyze this

I don't see why constraining to particular values makes this hard.
You know the type, so you can translate each of the specific values
into that type

> > > One issue is that there are two ways to format an array of bytes in d=
ts:
> > > '/bits/ 8 <...>' and '[...]'.
> >
> > So, these are intended for different purposes.  If you want to think
> > of your bytes as a bunch of 8-bit numbers, the former is appropriate.
> > The [ ... ] notation is more intended to be a compact way of putting
> > in "untyped" binary data.  For example, a blob of information which
> > gets verbatim copied into a device without interpretation by the
> > driver would make sense to use this form.
>=20
> That probably means we should have a schema type for [...], but so far
> I haven't seen a need.

Sure.

> > > Only the former supports negative
> > > integers. But, in dts output, only the latter is used. Therefore, I
> > > didn't include support for negative 8-bit values in dts output (I did
> > > add support for them in yaml output). Some possible alternatives are:
> > >
> > > - switch to the '/bits/ 8 <>' format in dts output
> > >
> > > - only switch to the '/bits/ 8 <>' format if the array contains negat=
ive
> > >   values
> > >
> > > - add another marker to differentiate between the two formats
> >
> > I'd be ok with this, given the distinction above.  This is similar to
> > putting different for markers for say "abc" and <0x61626300> which
> > likewise represent the same bytes.
>=20
> Okay, fine by me.
>=20
> Rob
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+Hr//EUsa8//ouuB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8FqgIACgkQbDjKyiDZ
s5LaRRAAk/76EW3xOn0L7GqOetYt4I9v5GCMbFkYsHnK5xS2YYqd2k98ey/pG4MJ
6btZEyvkmsC3uOAGKgaQtLV+9/SSx7Ur1/POPCZOom6Kn9sffpuWEjlhgDfn1u4g
jMq0kDhHBCerNIhXsDShIbxrkkws8iSC30mg1BZs6AVue6VGOtPqsmcO8rYTkD5Y
Tj3q1qgT+ULmFp+PYv0rRG++p0e5TcB1vUtB/Fp4rl/tWAxe1T5O29gcAY8uK4zG
eGI2kFKSDWzhu2RaE6JkWRJ9RysLDB5xNYDuV6PANYzBkzQquKQVtE86mSx1iU4E
jFLbQPTdGdDjpvmAcTallpJ0qnkix7HNt3Uk/Sk2zzdzi5aU0Yj5S4EuUP4CPH6n
f0vRFyf/7VNTV2IUPNNL9aTHvoexxMvFSo609DJR3T9+RfO1LdFA5TyeCGEQWqOf
Eg240KOk7ysCUj0mZZ1PPajvIMjEirUtuDXrcnWDiRKrPWbZqQGue5yN0ZofcwNb
5xTpoWjoPaa0IhMxlljsGIuaZ8Mt7yJT79iIocLv6xoB41G51+JuqSEy8Z/VOe9i
mtmZNyPVSnijgVNWXrKvUmlSfdsv2P/qsBbYX2dFxNHWITWMsc136tbfdD9zzwAF
OomouZBgu7pDAWdJeHB35aBXbEaCy/w/ZE8ZfbaPdAXwt7X6aVQ=
=4hzz
-----END PGP SIGNATURE-----

--+Hr//EUsa8//ouuB--
