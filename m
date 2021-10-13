From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dtc: Drop dts source restriction for yaml output
Date: Wed, 13 Oct 2021 14:12:12 +1100
Message-ID: <YWZOjOzqhtakSw56@yekko>
References: <20210727183023.3212077-1-robh@kernel.org>
 <20210727183023.3212077-5-robh@kernel.org>
 <YWPIiqpb3KlwTVN/@yekko>
 <CAL_Jsq+sMrRWqqPgcvoaiY0rLSp_s+gXOqJ9OuFLQ-3piUHSVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dY55mLHRW30TZyYv"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1634106389;
        bh=p0YAtnddaRe+V2ie5+uwmoZ3exgvV0hTkCKYnAjw8ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BWJf8REgV24G4j+jbbm7JNuM+qtYQRT+KgNNAfw2pza20iAotUlzgq7OYOpA7qzvQ
         BdS8HFQUB/S3Bm2i5egvgEudIBypgT5SOCLrzJf6X/2qT0CkhbPo0U2KEAGfPGmZWe
         Q5ukNo6n8fNwHOXaNk8KnOo1jtzWHHlU/YPGohyU=
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+sMrRWqqPgcvoaiY0rLSp_s+gXOqJ9OuFLQ-3piUHSVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--dY55mLHRW30TZyYv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 08:22:54AM -0500, Rob Herring wrote:
> On Mon, Oct 11, 2021 at 2:19 AM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Tue, Jul 27, 2021 at 12:30:22PM -0600, Rob Herring wrote:
> > > YAML output was restricted to dts input as there are some dependencies
> > > on source annotations which get lost with other input formats. With t=
he
> > > addition of markers by the checks, YAML output from dtb format becomes
> > > more useful.
> > >
> > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Urgh.  There's not really anything wrong with this patch of itself,
> > but it really underlines my feeling that the whole yaml output thing
> > is a bunch of hacks in pursuit of a bogus goal.
>=20
> Validating DTs is a bogus goal?

Goal probably wasn't the right word.  Validating DTs is fine.  The
bogosity comes from doing the conversion to YAML essentially without
reference to the bindings / schemas.  Bindings describe how to
interpret the DT's bytestrings into meaninful numbers or whatever, so
using the bindings is the only reliable way of converting those
bytestrings into some more semantically useful representation.

> > Yaml output wants to include information that simply isn't present in
> > the flattened tree format (without considering bindings), so it relies
> > on formatting conventions in the dts, hence this test in the first
> > place.  This alleges it removes a restriction, but it only works if a
> > bunch of extra heuristics are able to guess the types correctly.
>=20
> The goal here is to validate dtb files which I'd think you'd be in
> favor of given your above opinions. For that to work, we have to
> transform the data into the right types somewhere.

Yes - and that should be done with reference to specific bindings, not
using fragile heuristics.

> We don't need any
> heuristics for that. For the most part, it is done using the
> definitive type information from the schemas themselves to format the
> data.

Exactly.  That type information should come *from the schemas*.  Not
=66rom separately maintained and fragile approximations to parts of the
schemas embedded into dtc.

> The exception is #*-cells patterns which need to parse the tree
> to construct the type information. Given dtc already has all that
> knowledge in checks, it's easier to do it there rather than
> reimplement the same parsing in python.

dtc only has parts of that knowledge in checks.  The checks have been
written with the assumption that in ambiguous cases we can just punt
and not run the check.  For the goal of truly parsing everything, the
current design of the checks subsystem really isn't adequate.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dY55mLHRW30TZyYv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFmTooACgkQbDjKyiDZ
s5LqTQ/9H1hrnvhy7+QlSKCy+pR+kSoMzX7f7UrK64C8Ye/b6ttxmdMqsIOx1aLu
gV5qq2Hk5Gj+j8nb2dPDVWS8EeDLLLrEhrVwA9GhNTCpRaCcMFBOLkFqTIr5izw5
0Ih1N75gswk39KtO6sih5mfmPNMcLbhQpQzBNUqJ7eFdVMN3P7vb5Y+HV4eiG0LV
PJ+C8OkLurZWU7DzOCls4B08OSb9NIZy3hNtiv/deE8wbE7g8QqgcAlGrn1J7W1F
ieEJ+PXviAbAmeJPTCAac+am8ORIfwuCfnQnfzuGSPYoDKbNPVFTh/5LIDE8U0L9
GfvRrA08SgC3vkkpPr9GobF0udi3OLzVT2UFHuhozeNaiKEStlsI5f2idjQIVzUq
03yNs62ESbJlqpHENt0nTuVOEooqpy+s1HjEEd+99ChD3BR00P9dkO/FBzj1YTue
ipHWc/oIUW8R3HUGGRL9Tlce1X3Y8U/LOnpIfzADPhptVIxfTtSg2mqR9aE7sK4D
lU6UV8PXW71cCcE7KwlM7Am01WVq8P02vHMkPsyLPSpaRtWLigfpV+Ts5VRDD2Jg
TSL8oZZdJFKNnWl28VBoNH2+uX7IG7acjEoUdiX2AnQkoto5kZfizDbh8lfST3w4
kwB9+y73dAdknV06nBxjqYLu5SRzRX8BQ8sU8t7OulANveaJU8g=
=kFlR
-----END PGP SIGNATURE-----

--dY55mLHRW30TZyYv--
