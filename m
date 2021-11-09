From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 4/5] dtc: Drop dts source restriction for yaml output
Date: Tue, 9 Nov 2021 15:41:42 +1100
Message-ID: <YYn8BoYk3WkCnGyy@yekko>
References: <20210727183023.3212077-1-robh@kernel.org>
 <20210727183023.3212077-5-robh@kernel.org>
 <YWPIiqpb3KlwTVN/@yekko>
 <CAL_Jsq+sMrRWqqPgcvoaiY0rLSp_s+gXOqJ9OuFLQ-3piUHSVA@mail.gmail.com>
 <YWZOjOzqhtakSw56@yekko>
 <CAL_Jsq+iv7eM+LZ1O8d3V18dHraEAyfgdT8ucFKKVXZc9jEp4g@mail.gmail.com>
 <YYITHjgBGzS4jyNe@yekko>
 <CAL_JsqLNyfe8Ou4RXeLm0ie1vvJ+z15J6EDgB96dPbCC5qvHVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GVPO9LswCs24VaxX"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1636432963;
        bh=QJrT458WwUCMoA02PlvHIcwW2fVaSOzbernm368H7BM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hmELJWZxM4OInAZyyf+N+S4G7YeCzxqH/AjUbCqaRG4RMm4Vor7Rk5YG5+FaknCkU
         Lg2Lt3/+xAsjoMW2+BefAV3nBwG7UrOfJ9nxewyjKsaltQYf4Hfi8G8PbJsvgD0gMv
         hlqFkPVE8po8Issy39r2b3jI+kIR+P/e+Nr192A8=
Content-Disposition: inline
In-Reply-To: <CAL_JsqLNyfe8Ou4RXeLm0ie1vvJ+z15J6EDgB96dPbCC5qvHVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>


--GVPO9LswCs24VaxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 03, 2021 at 10:59:39AM -0500, Rob Herring wrote:
> On Tue, Nov 2, 2021 at 11:42 PM David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >
> > On Wed, Oct 13, 2021 at 08:29:53PM -0500, Rob Herring wrote:
> > > On Wed, Oct 13, 2021 at 1:26 AM David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >
> > > > On Mon, Oct 11, 2021 at 08:22:54AM -0500, Rob Herring wrote:
> > > > > On Mon, Oct 11, 2021 at 2:19 AM David Gibson
> > > > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > > >
> > > > > > On Tue, Jul 27, 2021 at 12:30:22PM -0600, Rob Herring wrote:
> > > > > > > YAML output was restricted to dts input as there are some dep=
endencies
> > > > > > > on source annotations which get lost with other input formats=
=2E With the
> > > > > > > addition of markers by the checks, YAML output from dtb forma=
t becomes
> > > > > > > more useful.
> > > > > > >
> > > > > > > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > > >
> > > > > > Urgh.  There's not really anything wrong with this patch of its=
elf,
> > > > > > but it really underlines my feeling that the whole yaml output =
thing
> > > > > > is a bunch of hacks in pursuit of a bogus goal.
> > > > >
> > > > > Validating DTs is a bogus goal?
> > > >
> > > > Goal probably wasn't the right word.  Validating DTs is fine.  The
> > > > bogosity comes from doing the conversion to YAML essentially without
> > > > reference to the bindings / schemas.  Bindings describe how to
> > > > interpret the DT's bytestrings into meaninful numbers or whatever, =
so
> > > > using the bindings is the only reliable way of converting those
> > > > bytestrings into some more semantically useful representation.
> > >
> > > That is exactly the direction I'm going.
> >
> > Ok, that's good to hear.
> >
> > > The YAML format can change if
> > > we need it to (remember the plugin interface?).
> >
> > See, I find that worrying, not reassuring.  It feels like dtc is
> > chasing a fuzzy moving target with the yaml output.
>=20
> I meant either it goes away entirely or a 2.0 version rather than
> continual incremental changes.

That makes sense... but every change to the type tagging implicitly
changes the yaml output.  So there have already been a number of
incremental changes, and here you're proposing more.

Again, the problem is I can't see any natural scope to what dtc does
in terms of type tagging in between nothing and being fully integrated
with schema validation (which implies knowing at least part of every
binding).

> >  I can see no
> > clear line between what parts of the decoding should be done by dtc
> > (in making the yaml type choices) and what parts should be done by
> > whatever consumes it.  Even if we could define a line, AFAICT it would
> > necessarily require dtc to know about *every* binding.  Not every part
> > of every binding, but at least part of every binding (enough to make
> > those type choices).
> >
> > Encoding even part of every binding is an unbounded amount of work,
> > and not something that was ever really intended to be in dtc's scope.
> >
> > Now, I realize I kind of started that fuzziness by introducing the
> > checks.  But there's a real difference between having some checks for
> > the most common errors and *requiring* annotation from the checks in
> > order to consume the output.  I don't see any sensible place to stop
> > with incorporating of this stuff into the checks, short of absorbing
> > the entire validation effort, which I don't think either of us wants.
>=20
> Only in the form of a plugin. A big part of that was to get source
> line numbers for warnings.

Again, that's not the case in the actual patches I've seen so far.

> > In the meantime the only real spec for what dtc needs to output in
> > yaml mode is "what the current validation tools want", which means you
> > have to watch for version synchronization between dtc and the
> > validation tools which sounds like a real pain.
>=20
> In practice, the format hasn't changed. The lack of spec was more to
> avoid any explicit endorsement of the format (and well, laziness).

As I've said, every change to type tagging changes the YAML format, so
that really doesn't seem true to me.

> > On top of that even if we had a clear boundary between "first stage"
> > and "second stage" validation, I think YAML has some pretty serious
> > drawbacks as the format for the first to communicate to the second.
> > The main one being that we can't safely communicate 64-bit ints across
> > it (since YAML is JSON-derived, its "numbers" are actually floats,
> > which can't safely carry integers above ~2^53).  It also can't
> > naturally represent "blobs" which are sometimes in dtbs, if they're
> > not valid Unicode.  Then there's the "Norway problem"[0].  I'm pretty
> > sure we quote all our strings so we won't hit that one, but it
> > definitely gives me the heebie-jeebies about trusting YAML parsers
> > with anything requiring precision.
>=20
> Fortunately, we've avoided problems there. Perhaps that's because we
> generally don't care about the actual value of numbers in validation.
> I did hit the Norway problem with booleans, but YAML 1.2 addresses
> that.
>=20
> > > > > > Yaml output wants to include information that simply isn't pres=
ent in
> > > > > > the flattened tree format (without considering bindings), so it=
 relies
> > > > > > on formatting conventions in the dts, hence this test in the fi=
rst
> > > > > > place.  This alleges it removes a restriction, but it only work=
s if a
> > > > > > bunch of extra heuristics are able to guess the types correctly.
> > > > >
> > > > > The goal here is to validate dtb files which I'd think you'd be in
> > > > > favor of given your above opinions. For that to work, we have to
> > > > > transform the data into the right types somewhere.
> > > >
> > > > Yes - and that should be done with reference to specific bindings, =
not
> > > > using fragile heuristics.
> > > >
> > > > > We don't need any
> > > > > heuristics for that. For the most part, it is done using the
> > > > > definitive type information from the schemas themselves to format=
 the
> > > > > data.
> > > >
> > > > Exactly.  That type information should come *from the schemas*.  Not
> > > > from separately maintained and fragile approximations to parts of t=
he
> > > > schemas embedded into dtc.
> > >
> > > The same can be said for every client program, too. But we're so far
> > > away from all knowledge about a binding flowing from a single source.
> > > I'd love it if we could just generate the parsing code out of the
> > > schemas to populate typed C structs for the OS to consume. The reality
> > > is that knowledge about bindings resides in multiple places and dtc is
> > > one of them.
> >
> > That's really not true on the dtb client side.  No, we don't have
> > automated tooling translating a machine readable binding into code.
> > However, generally all the knowledge *is* in the (human readable)
> > binding, and the client will have a (manual) translation of all that
> > into code for the properties it cares about.
> >
> > Automated tooling would be great, but even absent that, dtb clients
> > read and decode *bytestrings*, not structured data, and dtc generates
> > bytestrings just fine.
> >
> > > > > The exception is #*-cells patterns which need to parse the tree
> > > > > to construct the type information. Given dtc already has all that
> > > > > knowledge in checks, it's easier to do it there rather than
> > > > > reimplement the same parsing in python.
> > > >
> > > > dtc only has parts of that knowledge in checks.  The checks have be=
en
> > > > written with the assumption that in ambiguous cases we can just punt
> > > > and not run the check.  For the goal of truly parsing everything, t=
he
> > > > current design of the checks subsystem really isn't adequate.
> > >
> > > Yes, but handling 'foos' plus '#foo-cells' is a limited problem space
> >
> > Every thing like this is a limited problem space, but there's an
> > unbounded number of possible things.  Like I say there's no clear
> > boundary to what dtc should be doing and what it shouldn't.  Given
> > what can be done with YAML, we're pretty much being deliberately
> > incomplete if dtc does anything short of reliably and correctly typing
> > *every* property, which in turn means knowing (part of) *every*
> > binding.  I'm not really willing for that to be in scope for dtc.
> >
> > > compared to all bindings and not one that fits well with binding
> > > schemas.
> >
> > Yeah.. the way what I've seen of json etc. schemas work doesn't really
> > mesh well with the sorts of constraints we have.  But I don't think a
> > messy split between "first stage" and "second stage" validation
> > particularly helps with that.
> >
> > > dtc already knows how to parse these properties and we don't
> > > get new ones frequently. I'm just trying to use the knowledge that's
> > > already in dtc.
> >
> > Again, there's a real difference betwen knowing about some of them in
> > order to catch the most common mistakes, and *having* to know about
> > all of them in order to produce correct output.
> >
> > > I'm a bit worried about doing more in python too, because running
> > > validation on 1000+ DT files is already ~2 hours. And we're only a
> > > little over halfway converting bindings to schemas (though that's
> > > probably a long tail of older and less used bindings).
> >
> > Heh.  Ok, but there's no reason you couldn't bundle a dtb->yaml
> > preprocessor written in C (or Rust, or Go) with the rest of the
> > validation tools.  Then it would be colocated with the rest of the
> > binding information and can be updated in lockstep.
>=20
> That's a great idea. I found some code on the internet written in C
> that already does dtb->yaml conversion, so I can use that. Do you
> think it is any good[1]? ;)

Hardy har har.  But more seriously: clearly dtc *doesn't* suit your
needs for this right now, since you keep sending patches to change its
behaviour here.  I can't see where those changes can converge sensibly
short of knowing every schema.  The difference with a tool inside the
validation repo is that it can be updated in lockstep with the schemas
here, so "provide just enough info that the schema checker needs"
becomes a workable goal where it's not for dtc as an independent
project.

If you want to fork dtc as a first step to making such a tool, then by
all means go ahead.  What I'm not comfortable doing is merging and
maintaining a bunch of things for type tagging without a clear picture
of what the end goal is (and maybe not even then, depending on how
much work is involved in that end goal).

> >  Or better yet,
> > write a preprocessor that goes direct from dtb to Python native data
> > types, avoiding the problems with YAML.
>=20
> That's exactly what the plugin did. Maybe the last patch should have
> been removing YAML output.

Well, maybe.

> You seemed fairly lukewarm on the whole
> thing, so it seemed like it was going to take more time than I had to
> spend on it.

It's been long enough that I don't clearly remember why.  I think part
of it was that the interchange format between dtc and the plugin
seemed very ad-hoc, and therefore hard to keep stable.  That's
kind of the same problem I see with YAML as a typed output format
going into something that cares about the types.

> Maybe using pylibfdt could work here though it doesn't already
> unflatten the tree into dictionaries. Maybe that already exists
> somewhere. Simon?

You could certainly accept dtb input using pylibfdt.  It probably will
be pretty slow to do that, if that's a concern.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GVPO9LswCs24VaxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGJ/AQACgkQbDjKyiDZ
s5Jphg/8CiFrMnORbdfyEYMGdQdYnhI3GM4unfVAJxQW6lfmiWycS7lmHPeQ3zuQ
H1X+XBnmEcgqOXNUE/oet48P0mbtGzht3LG43qc1a9p3yQ1TvegqeNMRWlvAGYbo
Cl79pgoPkrHtNR1eeWPximknd9QpjrvEZYEKP/1L9rMYgwyMxhnujDQv9+T266ht
+UmoY1+o8kK5qBWmGTGD6zxAxhd1x38p8PwXTo/RFF8o/CKpMe0oVCNMmII9dC5u
1THHGqfFNFhLF9SjvM2DwM3xcjhtTGxDxlAWBtHHjxwHnnor4b2mvCc/skxzz67f
WHNgSDOUvzzABmHvq6Px/3atTqcmWKIvShdsaXF8c3AOLGX3G/AJr/eacoR7p9s5
0n0RgKS5jcrEuVGnqvksHzqZnRfSwjv0W16Ff2vk4T37ioOtk55dPUQSNAk/u99N
O9o27mO8NU+Wr4iTX4gYoPTzPh9dul4/qtDKqiNQR3q4k0H6hG+1R+NX1xHhCLMO
ZFx7AOaraqImKnzKobghlMDrrNtDMKk55XswgXjD0mO9w/wVvU5Vcq9MvvX7w18/
495Ixem+pO9EXDabncoC2dWAhKV5z9lOR+nrge8vtpuu7NlH26Dfe2lTnVZxpJMz
SSmgIK+iKZqAZjbI2G1b7SnL9ZlFO5zxttNuV0rl6p0ChuhZCiw=
=gdJc
-----END PGP SIGNATURE-----

--GVPO9LswCs24VaxX--
