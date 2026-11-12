Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446048;
	b=TNXKJEhSmTCFE2EC+90j0HbtiN3QFc6uwx2SdLPF5s1iWBSMkXzNzFHad2EGPF9XF62+
	 24M3ehiROA2Sez6c3bH6ztjLs8YoRVAljA+gnIDUXPFJcscwuaCEcd1oGGMKISoEPHp3A
	 3jteDV4MQHCf5mYOXu2N85H0a8/3k/mViyggP5UmLF0WvqlWz812pcunl6EufKVBGte0t
	 YBFJhHCd2agBcY1vP/bS3sWEM59JCgJLqud2K9b8KEGQZhLrKEATfpzpFzH9k88kfiFHs
	 dmbhSC9rAsmgHH+CecxqmRiN88s98/ELxZ1BnjEcsb2lHt1TSI46Hv4Iuwb2HA6CUvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446048;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=e1d5GnGG1IA5HYXy/vx8R3P235sCAaFLCBJXkqzRXlY=;
	b=KkcC23QdpMbw42etHdnH97temhi1wFCHpAn3xmJbgUGxfbSvsGVDMPZvlwbEQAId3J5G
	 nG6S2X98UGXyu/Hf5ZiB3VnSSizr5JU+pIwf6SeVoBMVM+U8lxKzDT+Wuspf3PCxuOBbe
	 OzKGt5QaaOHbKb8wF4WR7Z95VNgUzzkNddn2+F6TVASwEDq5qWer89mK7wSULgYAjDF5p
	 ZywBworNc0Cfj4lrW3hEH1MAfcOBY98DsnnyDAL90rSUkziqKD3rsGMCdfCykvHk/DAzg
	 DbiwvjJqD9MCAYmz+riI3S8hIvV7J+tq9b9JI4CNQJO+EGk/ziiqtUaFXfd7NjtUOUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=VNeVJ+Qa;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81420606A321
	for <devicetree-compiler@vger.kernel.org>; Thu, 12 Nov 2026 01:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81420606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=VNeVJ+Qa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794446044;
	bh=e1d5GnGG1IA5HYXy/vx8R3P235sCAaFLCBJXkqzRXlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNeVJ+QaKgyzc2F4TUc1TeUkjKDRC6uwWqss6WiVvDr2zy2RksomfbxW2BmmkBaB2
	 86mFeVEbiFxQQWBEjF2yKWcTrT+5mKwN/rdwqZ8F8J5OetZVHbV6ml3Vv/zsfd174R
	 tYW715HsMhG/KD4K/R7I+e8mwAU8sDupv5AsSGDwGGOlI/6dnUmtdJle2WRZAPboAa
	 5owap7CVQjzDh9k6kw69qz/wnKaOityQYxORYzzXAvjg5KFvO8fMrKOXBoAdhyzJwW
	 uK9xBP1Zj12ZHVPy6FHZdPN7ROlZKHiheCdnJiVZjR2fLFcChu/Qlzq1A5avqqVkcS
	 W9JOft76BQU9g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQ2Tm2tXLz4w9b; Thu, 12 Nov 2026 12:14:04 +1100 (AEDT)
Date: Thu, 12 Nov 2026 12:10:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 02/13] dtc: Add a list for the top-level fragments of a
 dts file
Message-ID: <avUR-WO1M3Ux790v@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-3-sjg@chromium.org>
 <auhctwoLtdWs9p-7@gractus.seuss>
 <CAFLszThoSafw5Zjt=3ucu8Ewr6tOjVwxm35kVUGfGTWLr8gtUw@mail.gmail.com>
 <avPa1zoPCi5EcAyI@gractus.seuss>
 <CAFLszTg7FcOd4S3toXSD-hvO1N8zDVPNJ5UL0g3_6ybEi_t5vQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="thIyfXFUGqbfB3tu"
Content-Disposition: inline
In-Reply-To: <CAFLszTg7FcOd4S3toXSD-hvO1N8zDVPNJ5UL0g3_6ybEi_t5vQ@mail.gmail.com>

--thIyfXFUGqbfB3tu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:53:30PM +0000, Simon Glass wrote:
> Hi David,
>=20
> On Tue, 10 Nov 2026 at 21:16, David Gibson <david@gibson.dropbear.id.au> =
wrote:
> >
> > On Wed, Nov 04, 2026 at 08:18:22AM -0700, Simon Glass wrote:
> > > Hi David,
> > >
> > > On Mon, 2 Nov 2026 at 02:55, David Gibson <david@gibson.dropbear.id.a=
u> wrote:
> > > >
> > > > On Sun, Nov 01, 2026 at 09:36:56AM -0700, Simon Glass wrote:
> > > > > A dts file is made up of top-level fragments: the root node, later
> > > > > definitions of a node by label or path, and /delete-node/ or
> > > > > /omit-if-no-ref/ with a reference. We would like to deal with each
> > > > > fragment on its own before it is merged, for example to apply del=
etes
> > > > > consistently or to run some checks on each one, but that requires
> > > > > keeping the fragments apart. At present the parser merges each on=
e into
> > > > > the tree as soon as it is parsed.
> > > >
> > > > Btw, I'm extremely open to a better name than "fragment" if one occ=
urs
> > > > to you.  I believe I originally thought of these as "overlays" but
> > > > that's confusing since runtime overlays were invented.
> > >
> > > I did look at this as I had the same thought, but ended up going with
> > > fragment as I didn't come up with any great idesa in the two minutes I
> > > thought about it. Here is my new attempt:
> > >
> > > section - doesn't really match Elf's use of the term, since it isn't
> > > referring to a part of the output.
> > > statement - matches the syntax in a sense (statements end in ';') but
> > > it is too generic and I would find it confusing
> > > block - so, so generic
> >
> > Agreed.
> >
> > > stanza - a bit out there, but at least it would not be confusing
> >
> > Eh, don't really like it.
> >
> > > layer - too confusing with overlay (since the things you overlay are
> > > layers), even though it does fit the process that the fragments go
> > > through (including the idea that order matters)
> >
> > This one has some appeal, but as you say it is likely to be a bit
> > confusing overlay.  Plus, I think it has some danger of implying that
> > all the "layers" exist at once and are independently editable (like
> > Photoshop or Inkscape layers), rather than the upper/later layers
> > irreversibly overwriting the lower/earlier layers.
> >
> > > If any of those seem appealing let me know :-)
> > >
> > > >
> > > > > Add a struct fragment to hold one of these, functions to build on=
e, to
> > > > > append it to a list and to free it, and a list of them in struct =
dt_info
> > > > >
> > > > > These are not used yet.
> > > > >
> > > > > Assisted-by: Claude:claude-opus-5-5
> > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > ---
> > > > >
> > > > >  dtc.h      | 47 ++++++++++++++++++++++++++++++++++++++++++
> > > > >  livetree.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
> > > > >  2 files changed, 107 insertions(+)
> > > > >
> > > > > diff --git a/dtc.h b/dtc.h
> > > > > index 473552e..c0d8e8f 100644
> > > > > --- a/dtc.h
> > > > > +++ b/dtc.h
> > > > > @@ -322,12 +322,59 @@ struct reserve_info *chain_reserve_entry(st=
ruct reserve_info *first,
> > > > >  struct reserve_info *add_reserve_entry(struct reserve_info *list,
> > > > >                                      struct reserve_info *new);
> > > > >
> > > > > +/*
> > > > > + * A fragment is one top-level part of a dts file, after the hea=
der and any
> > > > > + * memory reservations: the root node, a later definition of a n=
ode which
> > > > > + * refers to it by label or path, or a /delete-node/ or /omit-if=
-no-ref/ with
> > > > > + * a reference. Fragments are kept apart until they are merged i=
nto a single
> > > > > + * tree.
> > > > > + *
> > > > > + * This is not the same as an overlay fragment (a fragment@N nod=
e), although
> > > > > + * in a plugin a fragment may become one when it is merged.
> > > > > + */
> > > > > +
> > > > > +enum fragment_type {
> > > > > +     FRAGMENT_ROOT,          /* / { ... }; */
> > > >
> > > > Why do we need a special type for ROOT, rather than setting ref =3D=
=3D "/"?
> > >
> > > I'll change this,. I was just separating the case but the code doesn't
> > > really gain much.
> > >
> > > Note that we need to handle &{/} in a plugin, so I think this we need
> > > ref =3D=3D NULL rather than "/".
> >
> > Only if we actually need to distinguish between a &{/} overlay and the
> > "base" tree - I can't immediately see any reason we would.
>=20
> Can you explain that a bit more? In a plugin, / means the root of the
> plugin itself, but &{/} creates a fragment targeted at the root node
> of the base tree. So if we used ref =3D=3D "/" for both, the contents of /
> { ... } in a plugin would presumably end up as a fragment too, i.e.
> wrapped in fragment@N with target-path =3D "/" and applied to the base
> tree.

Ah.. hmm.. right.  Arguably that was a design bug.  You generally
shouldn't be directly modifying the base part of a plugin tree, and I
don't think most plugin dts files have a / { } section.  To my mind in
a plugin everything you put in should be translated into a fragment in
the dtbo, so / { } would be treated identically to &{/} { }.

But.. you're right, that's not quite the case at the moment.

> E.g. in Linux there is drivers/misc/lan966x_pci.dtso (actually, Herve
> wrote it) which has:
>=20
> / {
>         fragment@0 {
>                 target-path =3D "";
>=20
> We presumably need that to be used as is, not wrapped in another
> fragment. The empty target-path means the overlay is applied to the
> PCI device=E2=80=99s node, and I don=E2=80=99t see how to write that with=
 &{...}.

Right, so someone is using it.  AFAICT the reason for this is to put
the #interrupt-cells and interrupt-controller properties in
/fragment@0, thus suppressing spurious check warnings.  That's exactly
the sort of check that this refactor will help to fix in a more
sensible way.

> Anyway, there is something I'm missing here. Perhaps this sort of
> thing should just not be allowed?

Not allowing it would be my preferred eventual solution, but we need
to consider compatibility in the meantime.

Ok, for now, let's track the "root" fragment separately, and we'll
tackle this transition some other time.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--thIyfXFUGqbfB3tu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr1EfkACgkQzQJF27ox
2GfuXA/9GoZQSEXHf/TUnggkENmU9GklTtU/WEHf90jOadghVliG54bYCB4N8Cm+
e2VsB8g3zNovHlAq7vM+NpJhkqUDYmf28e2azo2/C9KBZ31YAH78fdu0XwQ4IW4P
dp4A6R7lxCuR3uPnx25rgt3bKWj5aCq6fc9nabJmZ7KCymn4VmvU0z4QTp42xw/n
BhadG7c1iBfbHJpZUZCOKwsWggrenUX5H/144+9gQKqzCJ+bDEciiaiIuzA6XDsy
tyGuqp+5Q1e4IbmYvN67YEFKZKavEz3LHSiAcraDTBMh57xCXVlaRerTvfRU4/cF
9ecZZm4QU0wooFT9/mUkCmyJhRmmQvPzn/12L2q60cLKt20j7zH1inU71Cj29vcF
NhWPlISXe8AjIg/ZJT/SUfMwphYA9/vY8T1D3Sb2r6GUwfrDewzKzZi1iWCXLEy1
oU0DObi4mIPt9L9h/mJwSOCkhLGo6opjfeE0R15w+wZ5nTrvVvpxEJhYkf6JxFW4
OMH6l9BjoRTxtxqzbI6uo/FBCiaorWf+ZWdAtsTqkmJOsbtGFRubOEPG7QitVf0W
FIk/lHNMkW/z09q419FyFVnqYWtWvCZFYmC6vGJ657dnGvEA+Jmihc5CjrqokbQo
vnee8zW8kFauVFy641I1Swc6CG2q3Z8tYn4pJcTwx/ityg9qu6k=
=K12D
-----END PGP SIGNATURE-----

--thIyfXFUGqbfB3tu--
