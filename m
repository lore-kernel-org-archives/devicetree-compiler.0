Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370603;
	b=RTlHYbsk4EU9QjhIcUYfWO5uj5UeG16CBVGdlQ8kt44RYsTPKowql/AETO+42ZCEG7iR
	 SIeNpUhiN3gc4ERnkf/czmZlzTmO/Y1iiTOM0Q3NydFbfGaGm/jeH7V5BqSyIP8AGxUFv
	 qlxCR3GbdvGiXJ/AePBu4gsnvM9A2cRExI51ZlPBSz6mPpyfKQrIFTbamNgL3d3nntpLI
	 dAbr7NYEk9ANkxPoTOOhRGGqEz9AEmkuChsvqDfFZ7r0grBzwJMsOjWas5KTTEo8ciWZz
	 2vejPB3kWA0aVQ6Nev9/D2ag9GGguz7dsTR5TRb1gZI6Q+2aJh1X6wkBrBPDOGUmCCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370603;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=l5aQN0gWmxcrIGQhk8kGSoHWqDztc6b7DwiJytigGOE=;
	b=wHWG0jhy3DB67ckrBgKIDt/QJznGL21E8BMexFQgCWptvZvagPx2p4UJg7zXZrrDhlOo
	 jo1hl76YhNWSY8nMPZG/4Cd2KJoBkLE4rKTAVplacYClcIKdmw8HKmB6FK6oXhdCPdnOk
	 jm82lM8/aPANsBKlrdpxBWb2SMwyzwaXol29gDwwlZgNtvjyyrtWqk4cDsliBVGeJIOfB
	 ausMMwhFvTpzsnXKQra2icHUdR2M/+wUA0sFDJ1YM1eX8dYxymxOYqVtoXHVy81pgfv26
	 t2vy04mYr+uub/CnOl2aL1G+Ho69vEpcmv2707qtgHliEzwUYd9VjD1nC87Xrgdrbjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=O99fRRtw;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1200606A324
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Nov 2026 04:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1200606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=O99fRRtw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794370599;
	bh=l5aQN0gWmxcrIGQhk8kGSoHWqDztc6b7DwiJytigGOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O99fRRtw5dXUbaqJZDC1nMc/M1hPmkWN3P89tN9pOau9gvOtWEgjisEfqPr6DF9S/
	 n9N47BtR2nFO8dZJh8k9VGSGQc+DwYwepbvCdknEX7duC+pbK36UUnhgVNA2MFdmaI
	 IsTHosOV1MWck0xm5AkWyfbvZoROI8a921l6o5iUzAYUXIZHsIqytAfh/XJnz99qxI
	 pWNICdcOH4K2XhgUPJIcMpXdQ3Hn+zr+/XJUx9M2mXaiINOE54npVtz4ssc5lh5pmV
	 AQC05XC7aSBuxoapfTNt9ht7OyZECdSkpTYLqXUSnyjs76UU66EfaFFwohUKIATGmE
	 x0aVy2SogB58g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jPVZv5pY9z4wTM; Wed, 11 Nov 2026 15:16:39 +1100 (AEDT)
Date: Wed, 11 Nov 2026 14:02:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
Message-ID: <avPa1zoPCi5EcAyI@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-3-sjg@chromium.org>
 <auhctwoLtdWs9p-7@gractus.seuss>
 <CAFLszThoSafw5Zjt=3ucu8Ewr6tOjVwxm35kVUGfGTWLr8gtUw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="65ZK+qCrucaxjoTE"
Content-Disposition: inline
In-Reply-To: <CAFLszThoSafw5Zjt=3ucu8Ewr6tOjVwxm35kVUGfGTWLr8gtUw@mail.gmail.com>

--65ZK+qCrucaxjoTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 08:18:22AM -0700, Simon Glass wrote:
> Hi David,
>=20
> On Mon, 2 Nov 2026 at 02:55, David Gibson <david@gibson.dropbear.id.au> w=
rote:
> >
> > On Sun, Nov 01, 2026 at 09:36:56AM -0700, Simon Glass wrote:
> > > A dts file is made up of top-level fragments: the root node, later
> > > definitions of a node by label or path, and /delete-node/ or
> > > /omit-if-no-ref/ with a reference. We would like to deal with each
> > > fragment on its own before it is merged, for example to apply deletes
> > > consistently or to run some checks on each one, but that requires
> > > keeping the fragments apart. At present the parser merges each one in=
to
> > > the tree as soon as it is parsed.
> >
> > Btw, I'm extremely open to a better name than "fragment" if one occurs
> > to you.  I believe I originally thought of these as "overlays" but
> > that's confusing since runtime overlays were invented.
>=20
> I did look at this as I had the same thought, but ended up going with
> fragment as I didn't come up with any great idesa in the two minutes I
> thought about it. Here is my new attempt:
>=20
> section - doesn't really match Elf's use of the term, since it isn't
> referring to a part of the output.
> statement - matches the syntax in a sense (statements end in ';') but
> it is too generic and I would find it confusing
> block - so, so generic

Agreed.

> stanza - a bit out there, but at least it would not be confusing

Eh, don't really like it.

> layer - too confusing with overlay (since the things you overlay are
> layers), even though it does fit the process that the fragments go
> through (including the idea that order matters)

This one has some appeal, but as you say it is likely to be a bit
confusing overlay.  Plus, I think it has some danger of implying that
all the "layers" exist at once and are independently editable (like
Photoshop or Inkscape layers), rather than the upper/later layers
irreversibly overwriting the lower/earlier layers.

> If any of those seem appealing let me know :-)
>=20
> >
> > > Add a struct fragment to hold one of these, functions to build one, to
> > > append it to a list and to free it, and a list of them in struct dt_i=
nfo
> > >
> > > These are not used yet.
> > >
> > > Assisted-by: Claude:claude-opus-5-5
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > ---
> > >
> > >  dtc.h      | 47 ++++++++++++++++++++++++++++++++++++++++++
> > >  livetree.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  2 files changed, 107 insertions(+)
> > >
> > > diff --git a/dtc.h b/dtc.h
> > > index 473552e..c0d8e8f 100644
> > > --- a/dtc.h
> > > +++ b/dtc.h
> > > @@ -322,12 +322,59 @@ struct reserve_info *chain_reserve_entry(struct=
 reserve_info *first,
> > >  struct reserve_info *add_reserve_entry(struct reserve_info *list,
> > >                                      struct reserve_info *new);
> > >
> > > +/*
> > > + * A fragment is one top-level part of a dts file, after the header =
and any
> > > + * memory reservations: the root node, a later definition of a node =
which
> > > + * refers to it by label or path, or a /delete-node/ or /omit-if-no-=
ref/ with
> > > + * a reference. Fragments are kept apart until they are merged into =
a single
> > > + * tree.
> > > + *
> > > + * This is not the same as an overlay fragment (a fragment@N node), =
although
> > > + * in a plugin a fragment may become one when it is merged.
> > > + */
> > > +
> > > +enum fragment_type {
> > > +     FRAGMENT_ROOT,          /* / { ... }; */
> >
> > Why do we need a special type for ROOT, rather than setting ref =3D=3D =
"/"?
>=20
> I'll change this,. I was just separating the case but the code doesn't
> really gain much.
>=20
> Note that we need to handle &{/} in a plugin, so I think this we need
> ref =3D=3D NULL rather than "/".

Only if we actually need to distinguish between a &{/} overlay and the
"base" tree - I can't immediately see any reason we would.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--65ZK+qCrucaxjoTE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrz2tcACgkQzQJF27ox
2Gd7sg//UwFAwzGPf7U8iOgh2Eyw29/Pqu/iISMxo2vgoivkreLt/0THAuiULdEn
V1l5HF9EfSrxkT8PPKUswp4bt3O0RbLAWjzABenNq8cyHd4hA80/PZwjcU+m/RQd
w5go8H3nehmkPfdG27b6w3E+FjV/cs47l9OMo7N69j6JtfhzWOL1EiNavIVFYnO1
MFgN61S/P7s4fYkKmysiWt+OWheeBsg2Q006tFh9BXHfdJdEb982B297IAdAAftI
5PTuhZT0Tjipz2e2CLdFDUEr76pKjAC/fqRkpA0bp7067ocTlVSB3MvRuzhhbnSY
IVpRy929fdKUK9KsXX34xVdlkwtdZAUvwGk5FPhfD7Su/LhAQC+jQpm25GOanvqb
0d0HxO64BElBlibZ0+jPjsmHMMGagSXndAF//u1SMZXo2w8TIy8ujvSMpCK0ytNK
gVom8nercfYYqiiHc8/XVx75jtCB4/dTeEt9XGFRzXZDOiFvMbZC4ztycNnBp0Fp
+VelSIQlK/0Y0rlW5VCF5MUNZJ/7nvFfJo/LJhVWCQMZVHubmxkEtARm2Ele7PM+
LEdUqwkcE8ua40FQ/OLEXn+bHcyL+FBtCEVrsUcKNiIEN1j/MmcDM4fPNufcH0cc
bbXuTn8BMR7HtXqqLYv2L/lBwR95Xk/8F3kmspClde2afLjtuA0=
=HwSX
-----END PGP SIGNATURE-----

--65ZK+qCrucaxjoTE--
