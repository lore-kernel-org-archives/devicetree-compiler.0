Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC930403AFF;
	Wed,  2 Sep 2026 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339419; cv=none; b=EJ220cf5QrvgICf8ML2u+fVYM6gV3fpPUqFV7wp+PRlB8xJU8I+d/+cYPm9W3otrM4d/rcOr+HvWnEl54WLGzCsSEblPcSf3cdh1ftLGZ/17Xu4mFx5dK8OTZWSSU7gqSAieABX9fcxxkpcXDfAVjXdVhtntX7U1cDtwCkCLZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339419; c=relaxed/simple;
	bh=lxnl/XiQqizW58MwO0XbaFcDVZBe9W7IGhRmlfzWCWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1YZ9GAM/bkRzg1qEvnDzt01dz41aUOM9/EtADQueDUsbe7Vm/85oORhJfWvln9XudLGXfKh9E5/XGd0Svl24YfzbBVdGngZfQgLhdaHgw8oUqJWhS8HSKcUIbaudJQr0COFHiz4flcnCfe3mFGWrIXu0QtBXnDVf1ZIWu8dOh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Dzrh4v7O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Dzrh4v7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788339407;
	bh=YzbYR6QStoZSc1aEZFPHiU0QniMuOaM7ARATJOtrQ0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dzrh4v7OsBX8H6lH0vFp7sx1FKQZvoKi5gpHNj8pqwzhXr4GQdYq8BlrW4vk938bu
	 SZCyL/gm6Idj6umGZUZOXZpb+hB6rI4at/37xmI/WPpjIUBx7wO2dJkLuCPKWv3a48
	 vRKgYZeLXNRVDO297R49R8I5eRC0qCUMPWUlcex8wX2v6BbkIYJPWusffGhGTCrmEj
	 xIDcoNuycJqTXJvX3JZvrbnKO+FE2IuIbfettit+mBy7ohNq8k17l7MIGp+uN8bHwc
	 weenUR7UrjSRSMS/No3SXiwn+bh8gErXTKfTdYOONTOhGmqddnMTI6RlBsnUJE8E2L
	 yQWQKUQCgTvqw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hZc6R6KlGz4wK1; Wed, 02 Sep 2026 18:56:47 +1000 (AEST)
Date: Wed, 2 Sep 2026 18:56:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 03/15] tests: Don't assume the root node is available
 at offset 0
Message-ID: <apfktu0dxJL8n-xW@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-4-herve.codina@bootlin.com>
 <apaGr_i-s4DAZ-Ul@gractus.seuss>
 <20260901153626.7f0e0813@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mGXwxgxoBZEXphHt"
Content-Disposition: inline
In-Reply-To: <20260901153626.7f0e0813@bootlin.com>

--mGXwxgxoBZEXphHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 03:36:26PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Tue, 1 Sep 2026 18:03:09 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 10:31:34AM +0200, Herve Codina wrote:
> > > Several tests uses offset 0 as the offset of the root node. Either to
> > > check the offset returned by tested functions or to directly manipula=
te
> > > the root node retrieved using fdt_offset_ptr(fdt, 0, ...).
> > >=20
> > > The root node is not always at offset 0. Indeed, a FDT_NOP tag can be
> > > present at offset 0. fdt_root_offset() returns the offset of the root
> > > node taking care of possible FDT_NOP tag.
> > >=20
> > > Use fdt_root_offset() to get the offset of the root node and use this
> > > value whenever the offset of the root node is expected.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  tests/node_offset_by_compatible.c |  4 +++-
> > >  tests/node_offset_by_prop_value.c | 11 +++++++----
> > >  tests/path_offset.c               | 13 +++++++++----
> > >  tests/root_node.c                 |  6 +++++-
> > >  4 files changed, 24 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/tests/node_offset_by_compatible.c b/tests/node_offset_by=
_compatible.c
> > > index a9e67835..1278a562 100644
> > > --- a/tests/node_offset_by_compatible.c
> > > +++ b/tests/node_offset_by_compatible.c
> > > @@ -39,12 +39,14 @@ static void check_search(void *fdt, const char *c=
ompat, ...)
> > >  int main(int argc, char *argv[])
> > >  {
> > >  	void *fdt;
> > > +	int root_offset;
> > >  	int subnode1_offset, subnode2_offset;
> > >  	int subsubnode1_offset, subsubnode2_offset;
> > > =20
> > >  	test_init(argc, argv);
> > >  	fdt =3D load_blob_arg(argc, argv);
> > > =20
> > > +	root_offset =3D fdt_root_offset(fdt);
> > >  	subnode1_offset =3D fdt_path_offset(fdt, "/subnode@1");
> > >  	subnode2_offset =3D fdt_path_offset(fdt, "/subnode@2");
> > >  	subsubnode1_offset =3D fdt_path_offset(fdt, "/subnode@1/subsubnode"=
);
> > > @@ -54,7 +56,7 @@ int main(int argc, char *argv[])
> > >  	    || (subsubnode1_offset < 0) || (subsubnode2_offset < 0))
> > >  		FAIL("Can't find required nodes");
> > > =20
> > > -	check_search(fdt, "test_tree1", 0, -FDT_ERR_NOTFOUND);
> > > +	check_search(fdt, "test_tree1", root_offset, -FDT_ERR_NOTFOUND); =
=20
> >=20
> > This does highlight that even with the compatibility changes
> > introduced here, allowing NOPs before the root node can potentially
> > break things.  We now handle _passing_ 0 to any of the functions as a
> > node offset, but anything that expects a _returned_ offset to be 0 if
> > it's the root node will break.
> >=20
> > I think that's probably an acceptable breakage, but it's something to
> > be aware of.
>=20
> Yes, I know but I wouldn't say it is a breakage. NOPs are allowed by the
> specification. In current version dtc/libfdt, having a NOP before the root
> node is already broken.

Yes, but (usually) not breaking existing users of real software is
more important than not breaking compliance with an abstract spec.
Especially when the spec was written from the software, not the other
way around.

> I agree with you we need to be aware of.
>=20
> ...
>=20
> > > diff --git a/tests/root_node.c b/tests/root_node.c
> > > index 37e6f059..30903f2b 100644
> > > --- a/tests/root_node.c
> > > +++ b/tests/root_node.c
> > > @@ -19,12 +19,16 @@ int main(int argc, char *argv[])
> > >  {
> > >  	void *fdt;
> > >  	const struct fdt_node_header *nh;
> > > +	int root_offset;
> > > =20
> > >  	test_init(argc, argv);
> > >  	fdt =3D load_blob_arg(argc, argv);
> > > =20
> > > -	nh =3D fdt_offset_ptr(fdt, 0, sizeof(*nh));
> > > +	root_offset =3D fdt_root_offset(fdt);
> > > +	if (root_offset < 0)
> > > +		FAIL("fdt_root_offset() returns %d", root_offset); =20
> >=20
> > Hm.  It's been a long time, but I suspect the purpose of this testcase
> > was to be super low-level, checking the contents of the root node
> > _without_ relying on iteration or lookup functions first.  Putting the
> > lookup call here arguably defeats that purpose: certainly the test
> > that nh->tag =3D=3D FDT_BEGIN_NODE is no longer meaningful, since
> > fdt_root_offset() will explicitly look for a location where that's
> > true.
> >=20
> > Or perhaps another way to look at it is that this test is explicitly
> > verifying that the root node is at offset 0, so does it make snese for
> > this test to even exist any more.  I guess the test for the name of
> > the root node is still meaningful, if minor.
> >=20
> > Nonetheless, to maintain as best we can this test's goal as working
> > independent of lookup functions, I think it might be worth open coding
> > something to skip FDT_NOP tags (not using fdt_next_tag(), even), then
> > construct nh immediately after that.
>=20
> Well "structured tags" are going to be introduced and so the open coding
> here will need to take care of that. Later some new tags could be introdu=
ced
> and could also have impacts on the test.

If structured tags are allowed before the root node.  There might be a
case for that (and maybe you've already made it in the addon series),
but so far it's not obvious to me that's useful.

> To be honest, I hesitated to just remove this root_node test.
>=20
> I kept it because at least it checks that the offset returned by=20
> fdt_root_offset() looks like a root node (i.e tag BEGIN_NODE and empty na=
me).

empty name checks something, but the BEGIN_NODE test is meaningless if
we're found our offset by searching for a BEGIN_NODE tag.

> Adding an open coded loop here without fdt_next_tag() call will looks like
> a copy/paste of the loop available in fdtdump.c. I am not sure that this =
is
> what we want to see here.

Usually I'd agree (DRY principle).  But as I say, the purpose of this
test is a special case - it's trying to test things piece by piece
with a minimum of circular dependencies.  That tends to make it
clearer what's gone wrong when somethin gbreaks.

> The question is: How to be sure that the offset returned by fdt_root_offs=
et()
> is really the root node offset without having an open code loop here?
>=20
> Maybe we can add a new test, root_offset, and build dtbs where we exactly
> know where the root is (2 dtbs, with and without FDT_NOP). treegen could
> build those dtbs.
> ---- 8< ----
> / {
>     offset =3D <real_root_node_offset>;
> };
> ---- 8< ----
>=20
> The treegen tool should be able to add a property where the value is the =
offset
> of the root node.
>=20
> The new test could get the root node offset thanks to fdt_root_offset(), =
read the
> 'offset' property available at this root node offset and check that the p=
roperty
> value matches the root node offset returned by fdt_root_offset().
> The root_node is kept as it is with this current patch applied:
> - use fdt_root_offset()
> - Check BEGIN_NODE
> - Check empty name
>=20
> What do you think about this solution ?

One test that's safe on any tree just checking the empty name, another
that's checking the low-level construction with a known offset.
That's a good idea.

Encoding that know offset in a property is overcomplicating things
though, and it makes this very low-level test rely on parsing a
property, which we want to do even less that searching for the root
offset.  But that's ok - we're only calling it on specifically
constructed trees, so we can pass in the expected offset as an another
parameter.

> Should the 'root_offset' test need to be implemented or does it look
> over-engineered ?

No, it's good.  I'm less concerned about over-engineering in the
tests since, in a way, they test themselves.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--mGXwxgxoBZEXphHt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqX5LYACgkQzQJF27ox
2Gcy2A/+O3/1/jpRov0cOG3R8PSKIQS5udctghrtC/lGb7bQiEuRnkHLaVqB6oMJ
jFAuKkm9t5Wb3shIcJ+GOLWxaN5SXVbUHmenO2jAefCXKcr1s9amR1wCw8VqbnMd
+JDxEZL0jbO0Xyi39bAqm2U8YjbAefgShc5R9yfuJ3FhCyqR94MnVX8okQQ8N21+
cy0UkM6YkifV+gQxVpirDHmbvtRnbBXbgN0SXGamUEVqsYCfyY8/mFZlBEFHJoLY
GWYhDPYRfV9Y2H8qDp6aGIgaz/ZqXDM0lmoU3IeAYj1AavaFi9GOTSQDkDb7x+Kt
m/LpK3689yQBTp4Rp6osvn2qCEivUE5NufImXc+XTmbUrJrsj5IWFPYmwv9HkalI
F1DbBo7esVkE2DeeAHbKj/qkj3tR30bshoW/obiljPHPIz6mY9+PtoAalIKJSwOb
Fg5gG1Bqqlb0Vbw0QkT79dStZOMBTfKV67p/Yx0yqdFJ15PMTgzeMziT+PJo5O/3
YhJQ3UQz5RX69taFRh0rxaSsuv6z1iMtDQGKqQquFpP3aImApiaokOKbcaJEa51m
3baybmkRGYWnxjcN/XY2Mwv8W2X+OFdFvVm/KiCQV8OXocjax2KBdHLxzFf7JJVI
GpMbZPMdz6OWQE6ggTWZi6jAH5ASvr0M7UnjwZI9n/IbbI08r9c=
=ZYcp
-----END PGP SIGNATURE-----

--mGXwxgxoBZEXphHt--
