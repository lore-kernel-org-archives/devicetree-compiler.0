Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E2630F80C
	for <devicetree-compiler@vger.kernel.org>; Thu, 18 Jun 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771119; cv=none; b=DZ1NRhvasZWK/FK4oZFBNmG0XnNoTLByWx8z1nUIObmNAe725qATjy+hATOkZ5mOa7VNhUDxfGwyLiZV1dX/rd18UGECTrL1VP2DD2theeBVSKvWBlZr8hTXQDCXTL30EI+kIOMZ3HKfKCHu9py11EPCOvtL/D10xaQqB707lWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771119; c=relaxed/simple;
	bh=nFInRy41JUSPv5Cy/7RZ4tig2E5AQWyVo2HQJqZSX4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuyJCDHTmFFcEbLVAjsdEZPo5F31nQHoKo4DFfDrDz+sv0yhpAMNjiSa4ahO2KTA5YECdn/TMZxJv0XCJwKyiIdJrrBBC6GspsrGX/A7c/6yuzqg/i6EWej/jVw6T2s0aXmCggxKzitkFL86zeHtFTdF7iPWCHmaqFeJg5M6VRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=de0Y0xip; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="de0Y0xip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202606; t=1781771114;
	bh=lNKvNQWwikaF8oK3fhcNcZzREBPnN542om5vzRw9FUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=de0Y0xipoJYtFO/R7QlcvIq9y4w0jhFHuZoshz1IwOTpHRb3jSOw3wVp9U3sOfxnC
	 5J4ojZ8gCM+EGEW8eFGyaKZF+u+7c6VzVJ1bnRBPxQzJv5iHmHQ7dUjPOF2ClwA/Cq
	 7FEfxJrt/hOtnOdBMb7JVAUdxlPOGfGUv9fxG3loFaG3jlFKebRRB0W1/xXRIHPJbC
	 xUNHW3Kev6sy2sdf5Z8XL0OrDYX9xBnTo2iPCEqYaqjrOZJ35wWLHRCSafxwgXAPtx
	 stJct+qyXDSl9b38rD/tJ7BukZqcI2bFJqfPPTrPdd59CzXWiRBdBnwijWhGu/xrRU
	 OB7Zk5bP3oEzw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ggv163SW8z58m6; Thu, 18 Jun 2026 18:25:14 +1000 (AEST)
Date: Thu, 18 Jun 2026 18:16:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Avoid warnings for reg override in __overlay__
Message-ID: <ajOpRVdPadsDi-KT@zatzit>
References: <20260617204401.2275738-1-briannorris@chromium.org>
 <CAL_Jsq++ERWJ19BcVXHKTzq1PN7tpJm=rm6e08UCH_gcp6ncHg@mail.gmail.com>
 <ajMvU-U-cdnlXykM@google.com>
 <CAL_JsqKqPhwrTjzXiVwnskqCm_SrxM=FVwChfwT-W1rjL+N7jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q5l3d6hEx18FTHRr"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKqPhwrTjzXiVwnskqCm_SrxM=FVwChfwT-W1rjL+N7jw@mail.gmail.com>


--Q5l3d6hEx18FTHRr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 09:58:03PM -0500, Rob Herring wrote:
> On Wed, Jun 17, 2026 at 6:35=E2=80=AFPM Brian Norris <briannorris@chromiu=
m.org> wrote:
> >
> > Hi Rob,
> >
> > On Wed, Jun 17, 2026 at 05:54:42PM -0500, Rob Herring wrote:
> > > I would argue (and did the last time this came up IIRC) the overlay
> >
> > I gave a quick look for prior art, but didn't go far enough. I see this
> > was a similar conversation:
> >
> > [PATCH v2] checks: Suppress warnings on overlay fragments
> > https://lore.kernel.org/all/20230308091539.11178-1-qun-wei.lin@mediatek=
=2Ecom/
> >
> > I don't think it had a satisfying conclusion though.
> >
> > > should target the parent node instead and then you can put in
> > > #address-cells and #size-cells in the overlay to make it pass checks
> > > (and make 'reg' parsable without applying the overlay).
> >
> > This implies we can't actually target the appropriate node via phandle
> > any more, and so we lose the ergonomics that phandles provide. Where
> > previouly an overlay could be resilient to node renaming and other sorts
> > of incompatibilities between a dtb and a dtbo (the overlay wouldn't
> > apply if &foo isn't found), now we'd have to open-code the node name and
> > maybe even its parent node name in the overlay. If either of those were
> > wrong ... we wouldn't notice at all, unless there's an obvious
> > functional breakage as a result.
>=20
> Why can't we use the parent node phandle?

That assumes it has one, and that the name of the target node within
its parent is fixed, not variable between boards that can take the
same overlay.

This approach also normalises overwriting (presumably with the same
values, but nothing verifies that) properties outside the device we're
actually trying to update, exacerbating the write-anywhere problem
that overlays already suffer from.

Targeting the parent node is not a good solution.

> > I acknowledge that it's difficult to parse and validate dtbos when they
> > are low on context. But I don't see why we should emit false warnings
> > for the possibly-correct, and more ergnomic approach.
>=20
> It just feels to me like we're disabling checks one by one on
> overlays. And it's not just dtc checks we have to skip, but schema
> checks too. We somewhat mitigate that by requiring (requesting really,
> because it gets skipped) overlays to be applied to *something* at
> build time, but that's the kernel tree which isn't everything.

Yeah, the suggested patch is also not a good solution, comments on
that email.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Q5l3d6hEx18FTHRr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmozqTwACgkQzQJF27ox
2GcyuBAAharTpQtB/o1gRhRbPevG2UEaicA++BlnJRaor7P+GQ0vUqLs4zA/wxKv
46lEfYoEDFEdRTTCLfn0aqnrpvPiDB+hFHkNdQBbrim87B/QEykRxIltY4MEf+1P
DOyAOr3Vz7yUcuiHfQwFvWSlbsxprrRRk1mSk5NZ+sW5Uy9/jZi62XeXFMrTjBVz
hvVnk3Enxx4UCiTzG7dbGs/92ONUekvAWQpHfyVvbmidM8kNpPfrLE4VMzug12rN
I9hFGbyPCy0UJu86YVsuKs1XKONLwMaX56MShEzyqRAAx2YmDTwoEIdPg5Ou1vFR
wSmTY/XaSEfHMoC7V6WXLQwMJm52C7qZrGxeji7D2yeNFd5N8HKupDI9Wth9G5Vc
s/h1P2CDxOpksGRPda9p3f+VFGYppd/lIEiWny7WluikuZ7ht31FNDzuONCLLtBr
dxb7Qo91klsAycFeLcTKiMnxbniU8KkvT8ze1AYQAcRSgyW9115E+qHS80IAaKIf
4YH4RROm7wZPWWgEJ8j9t8TglmDM7Kv4iu6AXifZapUNY/YuE6QfC2heIZMzyIKB
kDhELEqbiZWABU6v7iTp8TM4rWpa0WfWZt4bfXneJVBoeI+gFeoaPnrNEcBWUUJS
cXv4x1pvOFbcqvsshRD/neDBnH+dUyvxvAYFGMa0hK7Vv8r5JSo=
=bFSH
-----END PGP SIGNATURE-----

--Q5l3d6hEx18FTHRr--
