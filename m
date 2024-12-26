Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5E1BBBF7
	for <devicetree-compiler@vger.kernel.org>; Thu, 26 Dec 2024 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735194843; cv=none; b=dd264iakgRyQxk88Tupiz8RdvkWrp5xCYb3ZY7wOpq03GwOZT5zRHoATm695272/arGFGgU8QysgARozbWwrZ5fpy9V9LEMHeM682RSMo0nLc027PGyU0l5pMGLToMLUQrsuchlzTbKtATPokBBfNBV+PNVLs8asxUJDk/DVlrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735194843; c=relaxed/simple;
	bh=tfHoigfz1/YaNCaoZW+JTVLeZs8nhX28j/1EVhoMKOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVc+er9WKpvyltVXEosuj2bfIA6eiAWrC3/068pTWr3f1oKrAgokpxmp7g5CX5SkSsP5kOC0kznMdNBSFiIELO3Qx+O8KEl9CU9WnJ6bw/8MitUrDOuPL9sA6dJJGbU3krR9P9qfpezUHiyfM5CDjDEjULMiOVMzY6Ee5TV/kWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=PAATDRQx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="PAATDRQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202412; t=1735194824;
	bh=2t1NO29K328fQ2qXs+p8kXC55lmXohe454ASBCxbUwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAATDRQx62O9p93IUTGMlyuE9AzVHCYXbP0u6QOSoyf3MFGUJ7eo3JboUq4OyV2An
	 /9GjI1fZAjvTKWz7IWFIuV2wV971iOny6aPMvyhIBWSytd80BWqM+uV9YYGZunRFan
	 1Ka2HNhEsFm1pm6dB4ypCvfw2KDtNQGE7QFQRCK4Xt5FeZyJkDQOeyqf8VbcAzN+9W
	 ak3jTusfF5MuXbZEXf/CeYtKSJQ+Gt/SvoChy3OhVouxHRUiszj99YBvCk8bXvIKtG
	 bzav5NxGjzagLemwj3yCUYgdCjsRcEJ/DgH5ubMjP8zjadsaAf3L9Va3AMTc0TXzdi
	 G+5GsGh+AIrNw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4YJf3D6pJ4z4x6V; Thu, 26 Dec 2024 17:33:44 +1100 (AEDT)
Date: Thu, 26 Dec 2024 17:33:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 5/5] tests: Add path tests for overlay
Message-ID: <Z2z4x0hYvUaF4VIQ@zatzit>
References: <20241116-overlay-path-v1-0-ac3e121359e9@beagleboard.org>
 <20241116-overlay-path-v1-5-ac3e121359e9@beagleboard.org>
 <Z06NHgkgh9-d310t@zatzit>
 <3cfec8db-9d41-4f34-9765-686320bfa8b9@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IoOpsadNn6FKzg8Y"
Content-Disposition: inline
In-Reply-To: <3cfec8db-9d41-4f34-9765-686320bfa8b9@beagleboard.org>


--IoOpsadNn6FKzg8Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 14, 2024 at 10:15:49AM +0530, Ayush Singh wrote:
> On 03/12/24 10:16, David Gibson wrote:
> > On Sat, Nov 16, 2024 at 08:30:23PM +0530, Ayush Singh wrote:
> > > Add tests to verify path reference support in overlays
> > >=20
> > > Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> > > ---
> > >   tests/overlay_overlay.dts               | 11 +++++++++++
> > >   tests/overlay_overlay_manual_fixups.dts | 26 ++++++++++++++++++++++=
+++-
> > >   tests/overlay_overlay_nosugar.dts       | 19 +++++++++++++++++++
> > >   3 files changed, 55 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/tests/overlay_overlay.dts b/tests/overlay_overlay.dts
> > > index c4ef1d47f1f159c5284c8f7282a0232d944ecfd1..18382762eb3d7c26b0f2e=
507acc3803f38194fb1 100644
> > > --- a/tests/overlay_overlay.dts
> > > +++ b/tests/overlay_overlay.dts
> > > @@ -50,3 +50,14 @@
> > >   		new-sub-test-property;
> > >   	};
> > >   };
> > > +
> > > +&test {
> > > +	test-patha =3D &test;
> > > +	test-pathb =3D &test;
> > > +};
> > > +
> > > +&test {
> > > +	sub-path-test-node {
> > > +		test-path =3D &test;
> > > +	};
> > > +};
> >=20
> > You should test path references combined with other pieces too:
> >=20
> > 	test-pathc =3D "a string", &test, "another string";
> >=20
> > In fact it would even be a good idea to test path references combined
> > with phandle references.
> > 	test-pathd =3D "a string", <0x1 0x2 &test>, &test;
>=20
> I have hit a bit of roadblock with the following case:
>=20
> 	test-pathe =3D "a string", &test1, &test2;

Oh... good catch.  I felt like I was missing some additional wrinkle
with path substitutions at runtime... and here it is.  Ouch that
complicates things a bunch.

> Resolving &test1 will make the poffset for &test2 invalid. So do I need to
> worry about multiple path references in the same property? I do have a few
> ways to deal with this, but maybe I am missing something:

I really dislike having the arbitrary seeming constraint that you
can't put multiple path substitutions in a single property, especially
since that constraint doesn't apply for compile time substitution.
So, yeah, I think we need to worry about this.

> 1. Introduce something like `__fixups_path__` where we can use a different
> way to store information regarding path references. I am not too keen on
> going this way though. If we really need to introduce a new fixup node,
> might as well go all the way and have the node work for phandles as well.

At least in principle, I like the idea of improving the representation
to handle this case.  However, minimally extending the current format
just for this case doesn't seem like a good idea.  If we have to go
that far, seems like we should go further and clean up a bunch of the
other ugly problems with the current representation.

Note that my being comfortable with adding this feature in (roughly)
the current representation at all was based on missing this serious
complication.

> 2. Change the resolution algorithm to maybe create an intermediate tree
> first from `__fixups__` and resolve each property in reverse order in the
> tree. It seems great, until the fact that we cannot use heap comes into
> play. Playing with offsets all over the place has not been great in v2 (l=
ots
> of bugs), and this will just make it harder.

Yeah, this is really tricky.  The basic problem is that the fixups are
grouped by the target of the reference, not the property into which
we're substituting.  That's quite diffferent from the internal
representation in dtc, where the fixups are represented as "markers"
attached to the property which the substitution is happening.  The
dtbo representation makes it awkward to get the fixups in order; and
not having a heap takes it from awkward to very, very tricky.

Note that it would not be sufficient to order just the path
substitutions we'd need to handle all substitutions - both path and
phandle - in a property in reverse order to correctly handle:
	prop =3D &target0, <&target1>;

=2E..and, it gets even worse. In the un-substitute property, both of
those references are at offset 0, so the offsets alone aren't enough
information to correctly order the substitutions.  Somehow or other we
need additional information in the dtbo.

Crap.

At this stage, I don't know this feature is feasible without a rather
wider ranging revision of how dtbos are encoded.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--IoOpsadNn6FKzg8Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmds+LsACgkQzQJF27ox
2Gc7mBAAgWX1VrHQB6iSTS9id4w6aiKihLw6px2vnmSCMbJq3TvUn9lKEG37bNys
RxkF8Sb76Wt7TEl+63Vppz5uIET/NfANWj5clxJfT3ncVUhTfuLrJsGQ2IKopIYO
MvkNFTLsyYt4Csv7JioP3V8ITtkdu35b7tdHfbL+2ug09pHyFHWZzKweBmwv83e5
lNslSGakOjcRFEO7RWprktZc4jDfiXLR4aO+qkdCnjtwhlxAiDdqTnY5Hie/tnzx
QTHE6yUr/zFlm1beu72Y3rp7fmcIprx3UxnTpJDEnDZXo8krLOr+cEcT7StrkG6Z
rYcq19LEPg5vzjeLqG9zEBbAf6AH6uRvaxUorj3NNkKyayh7HFzYKFcej5XD2YjT
7l7OUxNoWuRlQSnjJm2xKEJIAsZu280Av7MNMIu9JB2JQ+0S10p9NvBRnJAxOuO7
IAaG5RqGGE/vla7RWEUsN8lrHMYiHkfboDKRmJQGT5EUhjVAyktIH+N5U0SvuQj2
G2a8g9DRpjxUPlwrJbo2YvjyR3yAPXXKY2Y3/cuwEtvnXDw9yCujzyfQ/Tt9Ibkp
31Pte6aEuged98vwjsVKQHA3aekfsx+PoCcTrFOvCVrP61m1EMtWb4HAbVYdXamZ
EV6CmFuYd3PgBLPLgoY8qm6UZFZNgGzPr8Op14TVC4CUeXkP3zg=
=NBEO
-----END PGP SIGNATURE-----

--IoOpsadNn6FKzg8Y--
