Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881C522EED
	for <devicetree-compiler@vger.kernel.org>; Wed, 18 Sep 2024 03:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726630575; cv=none; b=O31PI7EThrs6M7sspKfEuIVHkAc/YlZ8mN8eq9mVmKHl5+zWJzB4cnvS/CNiZjT3N3OhJCnFkpx6YgAz3sVUPpWEJhed+Ow+V8fD0f4F3BBRVojjejWeWLxcQOuhj8l18EtjWMaFwLI8Arig5iK19bfBWAVadL5gb7pQ7GXDQto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726630575; c=relaxed/simple;
	bh=MTIbvY0ieDA0tKMjDh1NaDqED2lpXh9ceosOzp1ehqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPfJS4A6hhYfiejFzjWMwrdqA+oFcqS6Q6rgr6398XzBr7mMpgVKvV4eRq83SYvdTOimEwySnzWDuwZQ9lXTtVYzNpqPo9B51Fnz2GERUTA7M8QNDAZBJhiK913ayRTyJ9G4vU2U3Zf5hZdo7JkDvwHDJaAUdxtZNfIrLznDe04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=MI8plswl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="MI8plswl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1726630570;
	bh=S3dSM0jCZzyL9DRA9yIKkiPU8a0ohni0ujLdKIfYi7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MI8plswlTpZUgnd8eX+b/g9IkGDlLUat4wOmto9G8VeIrVL68dTOVqX/Q2l8MRhgp
	 7QKEZ3IGxE3XtawT6pIHGrWT6m9bTSltsQpflYN2RKYeFcuTV6uSP70b16y9OZI1PL
	 UMjK8GO65CO3bcHG6Q5fV5jpA47BEkb0c+8WXsPQbOHz+ZAsUbiACKvUNVKP1FpIl4
	 UnuLoxENr8donuDSQ+0gR034kV/Vs2sMcND2tZgpENl8kCk6eaaWKe7DX436NY6koU
	 eSLPwU2eZ1hfQRYHlk0pIid4jVV+s+tUbT5Qvf0rQ/GXsx/DTMP8yR4Xa0sTHjeM4b
	 SYhgqL0GaG35A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4X7kp25K7kz4xWZ; Wed, 18 Sep 2024 13:36:10 +1000 (AEST)
Date: Wed, 18 Sep 2024 12:36:57 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Message-ID: <Zuo8yWrRPGcqnEwN@zatzit.fritz.box>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
 <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
 <3f062731-5819-4fb3-bf97-5748be63eb17@beagleboard.org>
 <ZuJiRfTWm8f8YfZ7@zatzit.fritz.box>
 <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fO3J2lumMdKu9CvC"
Content-Disposition: inline
In-Reply-To: <71d8be80-8dd0-470b-9881-414c13746eb1@beagleboard.org>


--fO3J2lumMdKu9CvC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 03:10:52PM +0530, Ayush Singh wrote:
> On 9/12/24 09:08, David Gibson wrote:
>=20
> > On Mon, Sep 09, 2024 at 12:54:34PM +0530, Ayush Singh wrote:
> > > On 9/9/24 10:33, David Gibson wrote:
> > >=20
> > > > On Mon, Sep 02, 2024 at 05:47:55PM +0530, Ayush Singh wrote:
> > > > > Add ability to resolve symbols pointing to phandles instead of st=
rings.
> > > > >=20
> > > > > Combining this with existing fixups infrastructure allows creating
> > > > > symbols in overlays that refer to undefined phandles. This is pla=
nned to
> > > > > be used for addon board chaining [1].
> > > > I don't think this "autodetection" of whether the value is a phandle
> > > > or path is a good idea.  Yes, it's probably unlikely to get it wrong
> > > > in practice, but sloppy cases like this have a habit of coming back=
 to
> > > > bite you later on.  If you want this, I think you need to design a =
new
> > > > way of encoding the new options.
> > > Would something like `__symbols_phandle__` work?
> > Preferable to the overloaded values in the original version, certainly.
>=20
> I can whip it up if that would be sufficient. But if we are talking about
> any big rewrite, well, I would like to get the details for that sorted out
> first.

Fair enough.

> > > It should be fairly
> > > straightforward to do. I am not sure how old devicetree compilers wil=
l react
> > > to it though?
> > Well, the devicetree compiler itself never actually looks at the
> > overlay encoding stuff.  The relevant thing is libfdt's overlay
> > application logic... and any other implementations of overlay handling
> > that are out there.
> >=20
> > At which I should probably emphasize that changes to the overlay
> > format aren't really mine to approve or not.  It's more or less an
> > open standard, although not one with a particularly formal definition.
> > Of course, libfdt's implementation - and therefore I - do have a fair
> > bit of influence on what's considered the standard.
>=20
> So do I need to start a discussion for this somewhere other than the
> devicetree-compiler mailing list? Since ZephyrRTOS is also using devicetr=
ee,
> maybe things need to be discussed with them as well?

<devicetree-spec@vger.kernel.org> and <devicetree@vger.kernel.org> are
the obvious candidate places.  There will be substantial overlap with
devicetree-compiler of course, but not total probably.

> > > I really do not think having a different syntax for phandle symbols w=
ould be
> > > good since that would mean we will have 2 ways to represent phandles:
> > >=20
> > > 1. For __symbols__
> > >=20
> > > 2. For every other node.
> > I'm really not sure what you're getting at here.
>=20
> I just meant that I would like to keep the syntax the same:
>=20
> sym =3D <&abc>;

Ok, the syntax for creating them in dts, rather than the encoding
within the dtb.  Why are you manually creating symbols?

So.. aside from all the rest, I don't really understand why you want
to encode the symbols as phandles rather than paths.

> > > I also am not in the favor of doing something bespoke that does not p=
lay
> > > nice with the existing __fixups__ infra since that has already been
> > > thoroughly tested, and already creates __fixups__ for symbols.
> > Hmm.  Honestly, the (runtime) overlay format was pretty a hack that's
> > already trying to do rather more than it was really designed for.  I'm
> > a bit sceptical of any attempt to extend it further without
> > redesigning the whole thing with a bit more care and forethought.  I
> > believe Rob Herring has some thoughts along these lines too.
>=20
> Well, if we are really redesigning stuff, does that mean something like
> dts-v2, or everything should still be backward compatible?

Well.. it depends.  There are actually 3 or 4 different layers to consider:

1) The basic data model of the device tree as consumed by the kernel

This is layer which "properties are just bytestrings" comes from.

There is a case for redesigning this, since it comes from IEEE1275 and
shows its age.  A modern format would likely be self-describing, so
type information would be preserved.  A json-derivative would be the
obvious choice here, except that json can't safely transport 64-bit
integers, which is kind of a fatal flaw for this application.

This would be a fundamentally incompatible change for all current
consumers of the device tree, though.  And when I say consumers, I
don't just mean the kernel base platform code, I mean all the
individual drivers which actually need the device tree information.
I'm not suggesting this layer be changed.

2) The "dtb" format: The linearized encoding of the data model above

Changing this is much more tractable.  The dtb header includes version
numbers, allowing some degree of backwards compatibility.  There have
been, IIRC, 5 versions in total (v1, v2, v3, v16 & v17), though we've
been on v17 for a long time (10+ years) now.

There's not a heap you that can be changed here - at least neatly -
without requiring an incompatible version bump.  However dealing with
even an incompatible change at this layer is *much* easier.  As long
as the base data model remains the same you can mechanically convert
between versions, at least as long as you're not actively using new
features.  In particular it's pretty feasible to have a whole set of
tooling using a newer version that as a last step converts a final
tree to an old version for consumption by the kernel or whatever.

3) The "dts" format: the human readable / writable format

Being parsed text, it's relatively easy to extend this in backwards
compatible ways.  Note that this is more influenced by (1) than the
details of (2).  To this day, dtc can input and output the
long-obsolete v1 dtb format, and that doesn't add a lot of complexity
to it.

Any change to the other layers would likely require extensions here as
well, but I don't think there would be a need for backwards
incompatible changes.  Using certain features in the source might
impose a minimum dtb output version though.

Note that dts isn't in one to one correspondance with either (1) or
(2): there are multiple ways of specifying identical output, as there
would be in most languages.  That is a recurring source of confusion,
but I can't see a reasonable way of changing it short of a complete
redesign of (1), in which case "dts" would likely simply be obsoleted.

4) The overlay specific encoding

Overlays first existed purely as a dts construct: a different way of
arranging things in the source that would compile to the same final
tree.  Runtime overlays (a.k.a. dtbo) came later.  This is by far the
most poorly designed layer, IMO.

Basically when dtbos were invented, it was done as a quick and dirty
encoding of the dts level overlay features into the data model of (1),
which was then just encoded using (2), thereby blurring the layers a
bit.  No real thought was given to versioning or backwards
compatibility.

This is where I think a redesign would make most sense.  However, the
most sensible (IMO) ways of doing so would also require some redesign
to (2).  Basically rather than encoding the overlay specific
information "in band" as specially named and encoded properties, it
would be carried "out of band" as new special tags in the updated dtb
format.  You can think of this as a bit like relocation information
that a C compiler emits alongside the actual instruction stream.

> The problem with guessing type can probably be fixed with a tagged union =
for
> the type (so an extra byte for every prop).

Yeah, it's not so simple.  As things stand this would imply a change
to (1), which as noted probably isn't really feasible.  Plus, just a
one-byte type per property wouldn't cut it: some bindings have complex
encoded values in properties that are a mixture of integers and
strings and so forth.

>=20
> With more and more emphasis on runtime devicetree [0], it would be great =
to
> have a design that allows tackling more complex use cases.
>=20
> [0]: https://lpc.events/event/18/contributions/1696/

Oof.   I don't think overlays as currently designed are a great choice
for hotplug: overlays essentially allow rewriting any part of the
whole device tree, which isn't a great model for a hotplug bus.  A
long time ago some ideas were floated to define "connectors" in the
device tree that more specifically described a way things could be
plugged in that could cover several busses / interrupt controllers /
etc.  That would provide a more structured way of describing plug in
devices that can actually validate what they can do.

Of course, such a scheme is a lot more work to design and implement,
which is why the simple hack of overlays have become dominant instead.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--fO3J2lumMdKu9CvC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbqPMgACgkQzQJF27ox
2GdtWg//XJdA4JlNOwxinoeg/5rgqU6z0gXG48vMkbEHsw/B229wPfiIpRfOkSgQ
w8TAAD0YLV5cjO2DHtdQHD47KgRFmrZxfSA8VGfTRJBpzI5d9ct/wep9/R8WkNG0
7YQB07DKHvjpEoljFOGLJ7B95LDeQ7lyabN8TfvUIfL3ZbY5MX6G0Gd/EC0yFdp4
EmXuOJh/PjW5LaSnlDmGuwG7D4oN5g/KcS3xpTXzm1pYp4YE6bsAaOm7MIEkosnL
ju8kf8csP9Q0i3WynY6rNP8TZVJuwZlpnPAPj4hxrNiKPtfwZumxhhWeQXZFqy38
370rcJ1lmnzaQtcjQjImxXO0bghMyOeu9a5C5ju0sKkeCl5EZFBf0u65BbW9vJbt
xzP72oQv0R+OWuBmGHxJpdXEi/RM1DVhf0v67/zS3dExV29D8wpeGE/ZYdLn/Zew
t1nJDbUImNTnX72rgSWVy1i8J6XkSOkcmMYRSa+YVTN+isVe+jOGytDy1HxiEg7G
vL8QBDqObdYZbjB4qZL5RFqiPOpGgluH6xUBxY+IyijmDNcrcaQ4NbvTz0c2hGiG
pPiiRkGtRxmgZLz4s2MEIIag4czwp9gos58/JBViitRNEzlps2sTZkT8cXEMz6On
HT6YTQYoaHxxmgBwzgtalwN/atjayuVYWxVZ3wv+yZfutvFCOr0=
=TC12
-----END PGP SIGNATURE-----

--fO3J2lumMdKu9CvC--
