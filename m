Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772133;
	b=k4lpwJphJMDkku8vyyaT3S9ogzWBseYW0+aNugRJV2V/1UK56MuIeM57/1tjGX3snOaG
	 MiN6GxQuUz+reuS8JfePyE/a1UiR9BCQJ2powOw1xRL3gWnEafbRuQsISUy4UirDJg172
	 g1G963jqYDrDKZrzyjK9DbC56m3koO8S2JlgcgfLKQ/eF7WB9IkyGKQWeF+oFs/mjQmc3
	 14zDITF+PcKfx+Dv0/mYpJjEqyY8rP9mc80CJ/pbBaJViyLDSEcon7/LUqIpuj6DNV/RN
	 OWj8eN4uVJyFEwFYQhRx56jxpDJuwz19HPprHA4q3UHkqc4aAcsRLBE1YlQ2Cg3JDUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772133;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=c4mMRTkJzpsbH6wE7vTX31QSvrwz1ZRQ2DJ4ELfdQfI=;
	b=NdXybgmiBynH7cuvPMwNgiKDJiNUqHUOjeMnX2OjIV4IMPiTfQ6epVeCZ1YPrLksMqAI
	 PKjPYY2GlhChi3MuUglecUyNze9hr/JcUgvx9nx6WqKehHrndezm9GbJhMC7nxOdnBolh
	 RTqbwNmrbTJ66OAtMHTwM+5ScTXDNlQgYTBNTRCFScSGZZ1SrB8//vpX4MtKqxtWTghbr
	 3IIHQfL//Ete5VHcl73dg02nG7JrTa3zOPJpeN4aoS+2fG7CVZdK3VISe++guVg3FolFd
	 SB9KOpxsVTCgYmtjpMey8njWVptKYMtWWuRYDP2s4mf7ZNWgyw8FY6uvb+oxBpCGnkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=eX4T7BBV;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E5D606A31B
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 06:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E5D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=eX4T7BBV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793772130;
	bh=c4mMRTkJzpsbH6wE7vTX31QSvrwz1ZRQ2DJ4ELfdQfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eX4T7BBV4JxVFeSvJ4mvoBm7mIaeca5ejpQ1AE+VYvJvNImp1BZPvXE1mhBveiR5T
	 TGsFaOVNv0q/FiVjOmoFSCi+P5d7pB71xrM78/yibQ3kiW+6cW0jdZb1R37T2mlIdq
	 inuvYVtjW0WcklFjxa80gomfQ5CqHkGzDa+fMDpzs/sIgUCOgPUjTO5BwJFNYPAvIe
	 Knq5ynFuuAQ0X/dU8/dHPp/akmWd3mf2UmY70qWrCEck9/uOAcUYqQfgXidSp+deAV
	 DkwbMX6aFY9eeybu/VYKijVRUi7w8Pbr4/PlHK2HB0RODLOFkw/hNarW5lAesJygek
	 KEB3oY8yH3Jpw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKFFt0Y09z4w9g; Wed, 04 Nov 2026 17:02:10 +1100 (AEDT)
Date: Wed, 4 Nov 2026 17:01:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] dtc: Fix deletes within a section and before a
 redefinition
Message-ID: <aurKRLcMjjFA70CM@gractus.seuss>
References: <20261028093620.3705074-1-sjg@chromium.org>
 <auK0ERvxGCJGSc3p@gractus.seuss>
 <CAFLszTjtkEjBMhbKomVr6WhrZH7hN3AcAMBwN2mvdmf+T-DQdw@mail.gmail.com>
 <aufqF92dKRRdb3V3@gractus.seuss>
 <20261103140030.3aa7b134@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rWcPZEjx4b3qhF4G"
Content-Disposition: inline
In-Reply-To: <20261103140030.3aa7b134@bootlin.com>

--rWcPZEjx4b3qhF4G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 02:00:30PM +0100, Herve Codina wrote:
> Hi Simon, David,
>=20
> On Mon, 2 Nov 2026 12:41:24 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> >=20
> > Yes, that was my intention, though we can revisit it if that breakgs
> > things for people in practice.  This was the way it was before
> > source-level overlays were implemented, and still is for the "base"
> > tree fragment in a file.
> >=20
> > > In an overlay, a top-level /delete-node/ &label can remove a node from
> > > another fragment of the same overlay, as Herv=E9 pointed out. I assume
> > > that should keep working, with only deletes of something in the base
> > > tree being an error. Is that right? =20
> >=20
> > Uh.. yes.  In a sense this is a question of whether we try to
> > partially resolve the overlays in a /plugin/ dts or not.  i.e. Do we
> > attempt to merge those fragments we can, or do we translate every
> > fragment directly into the dtbo to be resolved at runtime.  I'm not
> > sure there's a clear correct answer here, so I'd err on the side of
> > maintaining existing behaviour.
> >=20
>=20
> David, I don't see you point here.
>=20
> IMHO, /delete-node/ and /delete-property/ keywords present in a dts
> apply to the generated dtb.
>=20
> A dts with /delete-*/ will generate a dtb with related node/property
> deleted.
>=20
> A dtso with /delete-*/ will generate a dtbo with related node/property
> deleted.
>=20
> David, I don't see why resolution is (or should be) involved here.

So the restructure I'm now suggesting here means that processing those
deletes doesn't happen during the parse, but as an explicit later
step.  For dtb output, that must result in a single tree.  For dtbo
output although we may be able to merge some parts, we don't expect to
be able to fully resolve them.

Given that, and ignoring deletes for now, the merge step could be
entirely skipped for dtbo output: just emit each dts fragment as a
dtbo fragment and let them be resolved at runtime, regardless of
whether they modify things from a base tree or from earlier fragment.

However, once we consider deletes we need an intermediate
representation of "a delete" within a fragment.  But that can't be
encoded into dbto format.  So, deletes in a /plugin/ dts require that
we attempt to resolve the fragment merge (as much as we can), rather
than leaving it all to runtime.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--rWcPZEjx4b3qhF4G
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrqykQACgkQzQJF27ox
2GdVmA//V9m4qG0lNv4cT1/wT9krtLaEaA9D/BNJYrdrSmas+d1/TcAMxZOu3ADB
DKvY7WSR934h5mAwmnIxySI+mgE3B1eyO/5yg+zM9Cpt4+POUPnliEVRUeqhM390
gl0b4lJkfQOIDCJDb33MN1BFNjSFANULHgEAAPFVRt8TCE2+G+31HWmuGYdSgi/L
6ljQG1L5DTDmeg8s7wTrJztF92PuwbvIlfLAKzk3kFlmibu2vU/1fTw0vMmAQvTT
samTTYyN5XhypY0PJCIg9YSL0UN+AT2oU3ivcutc+FhhF7qa/xiydmousq3UPEvO
HCZ5NwGTVtUm+qt43++RngUFgPqZQbAkYD93wiSD2EtTXlvKaQW2s9JI42AYb1a6
1zdpakmD7eVUBUpztWyhasdGViDDoOqavbQgxZc0wRSi2BukEviEAOOpOFJgadI9
AEEx/Q8aME/Y2doJh6t7jH1dw3j6JOrBlwUmYe0cUgycrkG5tqXmPgpR6E577YDM
glXKXN+DZhZFmLacSWl5XqEPbkHnDHGSt4rWJXMgvJi4rluTyo2dSHMSI4fyjmvc
bVRSfwyx9+2MZsGSwtukgNBiSzDgfhAa/FXrYCKqRbYa3yKD/hGbcueF0k7yiFzj
9G6Fb9sse6SHUpxeqUAyFmy72qpD65jmUdhq/NCpFVg4TcJCJ3A=
=8x0s
-----END PGP SIGNATURE-----

--rWcPZEjx4b3qhF4G--
