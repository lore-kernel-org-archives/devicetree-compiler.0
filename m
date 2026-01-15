Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDFF17DE36;
	Thu, 15 Jan 2026 00:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438269; cv=none; b=FJTlrEE943FVsqqdGJC4b6Is9vsJbJW7Zxt3sXHlMsHxIhQA4iWYg5k/VaIfotIUVXFl2Ud76/CuK3oBI/PjW7zKbwZTbJ/jemhMTRQ5Gszj9uHuYBvAuGX3072t0S9Gjlc2ch6oVe0HZoQ6dRm2SWjsA6PMvIxPxYVrxTpFBts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438269; c=relaxed/simple;
	bh=hWPlWUn6jij57g+2ICHsKoY4s+6hMmh4lKsxhONqRm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnZQbnPvMkIP37A0FKDT/Jj6pC/ca3CzaKM3GA1ODC9A612g2YJJA9Z5pcj+nTNeO4gU7nxTck+vLVyC8zM1e4dbXAERu9sZ9I24d/JsG9ZMueF1z4lXaxwcS3URKs9hHJWgQcydUQhI6/bY70AeYm1cY/PkP0TXAhRhxghFT3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=uh0UhWLe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="uh0UhWLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768438265;
	bh=jmvYnyEg69HjBGT0U2VvARzXt+NP/KuYJiIYL4sVMAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uh0UhWLerWP+CxaxW299i6seequfsBgTyc6PBYbDHbWUgQ03H4hzsdFqHAHrd+4fp
	 zsU5RhQWEPenk7Pui7kQDr4fWyAXOljpXSHaxEW0ehNuFf+sux9Oji/206UQkrem0Q
	 GGAZL3YusDxJypO9czHW5YZu7olfPo/OeS1QiOGWSC6qoBEE1Zu4AqViU5O6mNtjiC
	 5UEKt0VyBa0TmBknbuA73BD5C7SsgCfwApPWMmFz+VgvW69WSg2mHnrj+CxgdPxlF+
	 gANARcQdqprSudFSwdMaJ5BHemtn3rSYdemgb4znkGkZrsXiaiMYI3q9euekK5EY/i
	 T2fdsU3wARiPg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds4D963Z7z4wGT; Thu, 15 Jan 2026 11:51:05 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:34:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 06/77] Add support for FDT_REF_LOCAL dtb tag
Message-ID: <aWg2JJstA0F-h9hi@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-7-herve.codina@bootlin.com>
 <CAL_Jsq+EDvrEqqwsFjs0sGxYfKgQuSFqCiqQs-1b3TnbG+gATQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VIu+acwi3SCrnEAR"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+EDvrEqqwsFjs0sGxYfKgQuSFqCiqQs-1b3TnbG+gATQ@mail.gmail.com>


--VIu+acwi3SCrnEAR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 01:22:08PM -0600, Rob Herring wrote:
> On Mon, Jan 12, 2026 at 8:20=E2=80=AFAM Herve Codina <herve.codina@bootli=
n.com> wrote:
> >
> > FDT_REF_LOCAL dtb tag is a meta-data tag attached to a property.
> >
> > It indicates that the property defined before this tag (FDT_PROP) uses a
> > phandle value and the node related to this phandle value is local (i.e.
> > the node is present in the device-tree blob).
> >
> > It is followed by one value:
> >  - offset (32bit):
> >      Offset in the property data where the phandle is available.
> >
> > Example:
> >   FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0x04
> >   FDT_REF_LOCAL 0x00000004
> >
> >   This means that at the offset 4 of the property data, the value
> >   (0x01020304) is a phandle and the related node is available in the
> >   dtb.
> >
> >   This is what is encoded in the dtb when the related dts has a property
> >   with the value set to <0xcafedeca &foo> with 'foo' a reference to an
> >   existing node where the phandle value is 0x01020304.
> >
> > If several local phandles are used in the property data, several
> > FDT_REF_LOCAL are present after the FDT_PROP tag. Each of them points
> > with its offset value to the position of one phandle.
> >
> > For instance, if a first property with 8 bytes of data has a phandle
> > value at offset 4 and a second property with 16 bytes of data has
> > phandle values at offset 0 and 8, the following tags sequence is
> > present:
> >   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
> >   FDT_REF_LOCAL 0x00000004
> >   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
> >   FDT_REF_LOCAL 0x00000000
> >   FDT_REF_LOCAL 0x00000008
>=20
> To follow up on my desire to both be easily extended and have more
> type info, I have something like this in mind:
>=20
> FDT_TYPE_INFO 0x10 FDT_REF_LOCAL 0x0 FDT_TYPE_U32 0x4 FDT_REF_LOCAL
> 0x8 FDT_TYPE_U32 0xc

I think general type info should be out of scope for this:
 * This series is already enormous and complicated without that
 * phandles aren't just another type, they have structural relevance
   which makes them a special case

Plus, I'm actually pretty dubious about adding type information to
dtbs in the first place.  It gives the impression that dt property
values are self-describing, but they're not.  If you want a
self-describing format, I think you'd be better off dropping the
OF-related past entirely, and using json or one of the various other
modern self-describing structure data formats.

> Length is 16 because I would do u16 for the types and lengths. I'm not
> sure what the max property length is. In theory 2^32, but I suspect
> we'd run into other issues (e.g. libfdt offsets are 32-bit on 32-bit
> systems). We could also do 8 bits for type and 24 bits for offset.
> Offset could also be relative to the prior offset.

Structurally dtbs are limited to 2^32 bytes, by policy they're limited
to 2^31 bytes (so we can safely store an offset in a signed 32-bit
int).

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--VIu+acwi3SCrnEAR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloNiMACgkQzQJF27ox
2Ge3KA/+LDBCMvY4FzOyrr+MrSML2gpUkgmvrDO+aprY2TR2VzLOWLJ4ID5j10oy
8ya9oNcTIYJkNcjQVVxmZKXuslXmvqIXCPXDne0fCUzGnOJZ4JymsbGkW2Vv2gOV
z43spxgekqBxVYi0l7rXc+Yao5xbmNTzJ4vpdiePSkhxUYpmWFaFBqwRPqFXPL+n
pP8FLN91+iFaNFP6gV3tV+l0bzAii+QqUjmNjFge8mLtms6ZDdTr0ZPs2/7/fOG3
K6wYu6u5kyeblG1FrPu+efKMKP1hFe0gqVP8yuIsNgYSee1HeqNCOeA4zYn7zNmo
v45PrxXkV9M2T1E2hpjIE95yLiumzEsGvqWVMuleiGRA0L/NataQz4z2sllR6b8P
lwTU5/M3RwE6Wqp/oJ2UQQ9i8AGs5TxCcDOaPeDBum17fwHaiBWnD8ph/FzMdgi8
VkD4IHkpspRS4LO6u/Ah0e9YpmT/wZCpieYfzNi5vgzbDORuoUR0Yzui7lo83oTI
JdBnIP1eJyYRqFzMQDmLqFSDobrxlZ9ALk2iZJHvP+CqiA47MaN1cZzfSEfs9t0h
WlAz91ooJWbHVxetiVj3Ql0+yHVq7XVAVMaThHu5OIH3susmw03T6MdpWomKfMiV
o8dh2xEJYpCPdp4WEHRUNMu8j8TX9kSPYfmB4TNcykHT2ru4PrI=
=Zvzb
-----END PGP SIGNATURE-----

--VIu+acwi3SCrnEAR--
