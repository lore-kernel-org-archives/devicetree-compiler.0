Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94FE314D37
	for <devicetree-compiler@vger.kernel.org>; Fri, 19 Jun 2026 04:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844605; cv=none; b=BwiaW1IBLCR6kMBqAuCPRuZqHuzQfBCnZiWFxLIaw+PQXwANgSMW8mvN5qjAR+5TyEExSnzvrmtSK8lBR8ITkZ8dB3PilTtL8oWMBia0laZrrEDbxEUMApiIpoRuNSl+egR4jT0kLkxc+2O8GJ6r1WTzircZ9tngI3HvyCkOyD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844605; c=relaxed/simple;
	bh=kr83gsci+crFqfTL2C4nQwqcEg6+wL+Riu81l2vxU10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULGsift401aHg1dSseUicrMn2m8UNpOQnlyGMQw3BbciR/yNS72Zrmwanwi+C0/J6rk+NBhtjdAnjH4QWM5HxWZuMgn6UYZV4Sv9/i7FjoRFc0CgRxrQcpkv6oZK4Cx6xbeL0odRnGEqmpYt0G1iuNbUCg2AJ2N6aH5ybkuXxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=NBUiwmFd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="NBUiwmFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202606; t=1781844594;
	bh=XFfylixRUFGl2LMNp5Jhyu2Bfsv6d5R1ZN97EE25EEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBUiwmFd2oBOn/T/Tn9wC8JHcnBvTz5zcTILr15wQTbBLo0b0YjYbT5jMfrEdpsIG
	 il6UtUg92/+Heajm4MisJqRD4pdVNHSEdvfh7DokExAkp8IdLHvP2E0kJZ7I950hdn
	 Gb7m4C0T8a3L6wgHjyXfAHNUMCpKGJqEjmfK4PUszVxC8bbzSHbswsUPkrAIY87zqA
	 8vS0Li8rMQpX1eNVHV28990dgr3t1hJZRMDSDbrJsTug1l1hWwftC6wAu7pZiKcOOe
	 A6Wamw/ATA9NZ3uZ91270e6mUDz3V6oulQikYI8J7Me1jSG2Lzxya+5NH/cF1L9Ys1
	 oWR20Uj2JoBpw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ghQBB239zz58sp; Fri, 19 Jun 2026 14:49:54 +1000 (AEST)
Date: Fri, 19 Jun 2026 14:15:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Brian Norris <briannorris@chromium.org>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Avoid warnings for reg override in __overlay__
Message-ID: <ajTCaMB1ZIfUMlgp@zatzit>
References: <20260617204401.2275738-1-briannorris@chromium.org>
 <CAL_Jsq++ERWJ19BcVXHKTzq1PN7tpJm=rm6e08UCH_gcp6ncHg@mail.gmail.com>
 <ajMvU-U-cdnlXykM@google.com>
 <CAL_JsqKqPhwrTjzXiVwnskqCm_SrxM=FVwChfwT-W1rjL+N7jw@mail.gmail.com>
 <ajOpRVdPadsDi-KT@zatzit>
 <20260618222438.1423c6c0@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Tn/ccXvv4d/cKgK6"
Content-Disposition: inline
In-Reply-To: <20260618222438.1423c6c0@bootlin.com>


--Tn/ccXvv4d/cKgK6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 10:24:38PM +0200, Herve Codina wrote:
> On Thu, 18 Jun 2026 18:16:05 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Jun 17, 2026 at 09:58:03PM -0500, Rob Herring wrote:
> > > On Wed, Jun 17, 2026 at 6:35=E2=80=AFPM Brian Norris <briannorris@chr=
omium.org> wrote: =20
> > > >
> > > > Hi Rob,
> > > >
> > > > On Wed, Jun 17, 2026 at 05:54:42PM -0500, Rob Herring wrote: =20
> > > > > I would argue (and did the last time this came up IIRC) the overl=
ay =20
> > > >
> > > > I gave a quick look for prior art, but didn't go far enough. I see =
this
> > > > was a similar conversation:
> > > >
> > > > [PATCH v2] checks: Suppress warnings on overlay fragments
> > > > https://lore.kernel.org/all/20230308091539.11178-1-qun-wei.lin@medi=
atek.com/
> > > >
> > > > I don't think it had a satisfying conclusion though.
> > > > =20
> > > > > should target the parent node instead and then you can put in
> > > > > #address-cells and #size-cells in the overlay to make it pass che=
cks
> > > > > (and make 'reg' parsable without applying the overlay). =20
> > > >
> > > > This implies we can't actually target the appropriate node via phan=
dle
> > > > any more, and so we lose the ergonomics that phandles provide. Where
> > > > previouly an overlay could be resilient to node renaming and other =
sorts
> > > > of incompatibilities between a dtb and a dtbo (the overlay wouldn't
> > > > apply if &foo isn't found), now we'd have to open-code the node nam=
e and
> > > > maybe even its parent node name in the overlay. If either of those =
were
> > > > wrong ... we wouldn't notice at all, unless there's an obvious
> > > > functional breakage as a result. =20
> > >=20
> > > Why can't we use the parent node phandle? =20
> >=20
> > That assumes it has one, and that the name of the target node within
> > its parent is fixed, not variable between boards that can take the
> > same overlay.
> >=20
> > This approach also normalises overwriting (presumably with the same
> > values, but nothing verifies that) properties outside the device we're
> > actually trying to update, exacerbating the write-anywhere problem
> > that overlays already suffer from.
> >=20
> > Targeting the parent node is not a good solution.
> >=20
> > > > I acknowledge that it's difficult to parse and validate dtbos when =
they
> > > > are low on context. But I don't see why we should emit false warnin=
gs
> > > > for the possibly-correct, and more ergnomic approach. =20
> > >=20
> > > It just feels to me like we're disabling checks one by one on
> > > overlays. And it's not just dtc checks we have to skip, but schema
> > > checks too. We somewhat mitigate that by requiring (requesting really,
> > > because it gets skipped) overlays to be applied to *something* at
> > > build time, but that's the kernel tree which isn't everything. =20
> >=20
> > Yeah, the suggested patch is also not a good solution, comments on
> > that email.
>=20
> For #address-cells/#size-cells, you can also have the properties set in t=
he dtso
> file either in the __overlay__ node or if, some other DT properties are n=
eeded,
> in the fragment node.
>   https://elixir.bootlin.com/linux/v7.1/source/drivers/misc/lan966x_pci.d=
tso#L25

Setting #address-cells or #size-cells in __overlay__ or descendents
thereof is reasonable, but won't address the relevant case here: here
the problem is the check on 'reg' of the target node, which depends on
#*-cells of the *parent* node, which doesn't exist within the overlay
fragment.

You _could_ set #*-cells in the fragment@ node, and I think that will
fool the check.  It's a real hack, though, and I'd consider at best
dubiously conforming to the overlay spec.

> Worth noting that, in linux code, when an overlay is applied if #address-=
cells
> and/or #size-cells are identical to already existing ones, its fine. Othe=
rwise,
> an error is returned.
>   https://elixir.bootlin.com/linux/v7.1/source/drivers/of/overlay.c#L322
>=20
> We can have dtc checking reg values against #address-cells/#size-cells
> and when the overlay is applied, there is guarantees the
> #address-cells/#size-cells matches base DT existing ones.

But I'm guessing #*-cells in the fragment node *won't* be checked,
because that's not "applied" as such - it generally just has metadata
for the fragment.
>=20
> It is not yet perfect but it is better than nothing.
>=20
> Best regards,
> Herv=C3=A9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Tn/ccXvv4d/cKgK6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmo0wlkACgkQzQJF27ox
2GcoaBAAqVjNeXto5Brq2JpiSska1WO66STqzm9I62sbFvLgiQ6YDbZuUP6OZOWQ
6bF4dXV36nY6WGBzrjCeSs/++DuQEToedAssTlLX9EgYdcMJYN2Z78eqca9L6KcY
HZ93AKSFIoTF6ykzGXB2mOERf+XTNgJoQBZniBzGRG1iXnnzGhkwaqiVle4hzU6u
sT/9vRajt7xgfRnVxXk2XJ7JxPkCsVQrMjs2urBAWo3MtC73nI142q0zcBHjkzje
szcx7ThgngKsptAPXX9HV9WmPnpVwfuap1Zc2vBjgQpgLD5Tnhbcl5bXtflS7awZ
44Fm4KEmfj8CGdRC2IykPB3TVea693XVl+FFhn1nU1TNxEsntcXMEx91lSpGijAT
3zLFPKQR0gvqi1dmgG1JcAisY4FJhM0R/L8Bp2gW0Wy3g6+dvctlIYFl16CVKvxt
+mRE1aZVitkz/tUKC1ztL6GCzAwJTNKwbPEUSzmGinbJJJLkLqgrNDEFDpmvBVfY
98DPt8wC4CKVgR8nNSfK3zz9ud5MS99q3FBPr8rE6TK+3SboZe5mz8ohjfdFphR4
ARs3EyUTEljaumnnwwgNJiNvOXiO2o0k8X4eO/Z53/InxxSFhjSOs8Zt8NIJkZrQ
2vohCixV8Z7f731apdvmLvF44ZPf80iryl54HBr57DGdNojWQFg=
=3GP7
-----END PGP SIGNATURE-----

--Tn/ccXvv4d/cKgK6--
