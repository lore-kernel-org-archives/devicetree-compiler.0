Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C012EB875
	for <devicetree-compiler@vger.kernel.org>; Fri, 21 Nov 2025 04:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763698453; cv=none; b=ln0upjJGHnUd5XsDaGMSlOrNThr5Lu0/lbEXZJT5QW8b1/36kc2O2RmO9iIimZYu890SnG5CcsqE+2LWKhmbye2d0kD4shZPvhMCJ1ihsIiWMePSem82OfE60mYt3dhmnXVjC4H+xT7ClXr/rFz9lmXZ8d+o2hPn9jetMG8WWN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763698453; c=relaxed/simple;
	bh=7L5B7w+F9316/DOZi/pa4o1rwGGpgqRKl8fdWqDciS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSSxA37YFQBSg2kDcPXPBSndj1VGsu0F6KB2CYxOSQIxoYgAlbPxmPGIT0mLrt1AqAYNISB6C7LgngegQxy1ixhGmYy8+geMJE5olUDW5XtlRrEQY64ysDKLeHnGw6RbsbG2Wf5hYO02mGBIVAxsHu0JC/uJhbSQ1htuitCYNck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Gvcjz62L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Gvcjz62L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202510; t=1763698441;
	bh=uUcsuBqx5DFh1+y4F4OZYVgls7VM8w9p0UvY5GtRMhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gvcjz62LmzLKw2ShT22/j5rPc83NrIt+Kr8ywGGoYkFG8v8v3PykwJoYp2xpwjaJV
	 ZSLPprcFOpuJbHvJuU9dVvvQorIZsWyvZaxWdvC+H9ZdIsTEEyuv351IpiV8dy2Ko6
	 A4jgixAeT+4lWZpHjSnkyu0jBB5BVMfFignD3eefvLQ5ddOTr3LudrF6i4Sq9+EdIa
	 Ib8dZbLssrtFTMD4aY0z0E5PsubZGDhiLbQM6vQNMhq3EsULJ9Cx+01XWsr04Fgl4U
	 bHYXI/VE9mad30DZndIvBB9kaAe5SkXOIZHZAmIZGeqmDpZM5neOqYW8zmA3nv4SUq
	 OrjkzrmeeTDpA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dCMKj0xw7z4wHY; Fri, 21 Nov 2025 15:14:01 +1100 (AEDT)
Date: Fri, 21 Nov 2025 15:13:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: Rust library?
Message-ID: <aR_nA3qcTG2jp_fp@zatzit>
References: <CAFLszTgYUVScwyd3_SS+AR305XCUHbiQgCurQVtK3nYfSXe7dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rGG2EFWdNhsdkLuw"
Content-Disposition: inline
In-Reply-To: <CAFLszTgYUVScwyd3_SS+AR305XCUHbiQgCurQVtK3nYfSXe7dw@mail.gmail.com>


--rGG2EFWdNhsdkLuw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 03:10:01PM -0700, Simon Glass wrote:
> Hi,
>=20
> Does anyone know of a good / official Rust library for libfdt?
>=20
> If not, this one[1] seems somewhat sane, although a bit limited. Would
> it make sense to try to create an 'official' version based on that? It
> would need quite a bit of work as it only supports reading.
>=20
> Any advice or thoughts are welcome!

I'd love to have a Rust library as part of the dtc/libfdt repository.
I've thought about doing it, but never had remotely enough time to
get anywhere.

There are a couple of extra complexities to consider.

# Bindings versus new library

Normally when presenting a library in several languages, I'd suggest
writing it in just one, and making a minimal binding wrapper for
others (like pylibfdt is a binding to libfdt at the moment).

In this case, though, while it certainly would be possible to write
Rust wrappers around the C library, I'm not sure it's a good idea.  I
don't think the C library's interface would be particularly natural in
Rust.  More significantly, it would be good to use Rust's features to
make the interface safer to use: e.g. I think it should be possible to
use the borrow checker to prevent a user from inadvertently re-using
an offset across a call to a read-write function (a subtle gotcha in
the libfdt interface).  The mutable-xor-shared model is a good match
for safely manipulating an fdt.

Similarly, I don't think writing C bindings on top of a Rust library
would work well.  Taking an interface that's natural and safe with the
borrow checker would likely be not just theoretically unsafe, but
wildly easy to misuse once accessed via C.  Maybe I'm wrong about
that, though.  But even then, being able to run anywhere - including
weird constrained systems - is an explicit design goal of libfdt, and
requiring a Rust compiler would be a big step away from that.

So, it seems likely that we'd need to maintain two separate libraries,
which isn't ideal.  On the plus side, we should be able to cross-test
them.

# Memory allocation

libfdt is allocation free, by design.  It's certainly possible to
write allocation-free Rust code, but I'd say it requires a bit more
discipline even than in C.  We'd definitely want an allocation-free
#[no_std] library.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--rGG2EFWdNhsdkLuw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmkf5vMACgkQzQJF27ox
2GeJ+Q/+MmbHftwxQcNcyoxxfYxtuOSX9lhJCFDnXieoUvTwaqMqDNXhAvoLz/gF
ZRdKY1en6Yv/11m8NeHWsaVIeJgBd96tjh3gNAwT5vHYLIyH1SRLdhVUlufclXp7
aeMvPf3ymk8F7QETKU2fofa1cR+EniiGMlsTUmXpvGMM7UzmlUqyY3IrS8DItW/k
e2FkXRJdggCBWatONg1SbjF/l4X8+sX2rXYspOzcI2rU64ZIzCXcljV/r6ClxVaI
/JhG+GWCrknG1Hd5LB3awZ7N4cUCb9b318OLY+MnwVGRl4Ss7E6SJSYpasBN/FHy
8sJWR/6jrhy+rOgK3bJOgIkUl2SlAaS5Pq6QDf5PXLKzSyXyJz7mJmIM2d46f5Qf
+vf9A0pBtCF2oz80pImA2EYhv5rmerfQu2fnF7G4UcgnF6nOyaj+b1x26oXVOnrz
GNORqre58Tr3/h7PjDHfww2+U3wbGVR0yf8ftUQGNh2COt/cD7j4gv3oDBdlWwpW
xx6zXC1yzV9qtuYq3bHSs1mJs52PfuWn7Tb/pw6Y8e8Ucn5EjPfR1y7zTGdInmM5
pZMcU82zxw02KDo0Ba3jJvBDQkNAwTzoq3tPrCPmT4I73ACi6Wx5kaX+o3nNmsc0
Pc/oqakY+qdIy0kq3Vnb03iEqHGPczWF0+pquWa1AyXuN8lzRaM=
=eivb
-----END PGP SIGNATURE-----

--rGG2EFWdNhsdkLuw--
