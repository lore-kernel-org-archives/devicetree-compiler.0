Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D4381AF;
	Mon, 19 Jan 2026 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768803419; cv=none; b=CAoj/B93gZLlG72gApmKh3iF1LYvtQToSbDVWkeYQChZhyHUlfv0NGXILvPROYgufeJZnSi0EmaMgprim/xD/iUyZQtYcUEHvFMDwBmJ3PiyL5mXRKDMhSIth5PBFeGqXMBSM3La6hQjTlabcEgZBxHO6qPnDWvDyA00DoKTwwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768803419; c=relaxed/simple;
	bh=1tSAwoojmLLP09xdjfjSyYptT5kLO1Q3rFb4O2O3pOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRVksGRTkACRLqF8sozQ0nSivbkRqZ4x5R1dXtSwJQJZwcNgqbjz/wdN0t4pOHIniA71CfmgDArDE5mArHuYk0cZz5HXVJfgZWu3lBRNAH0gg5HBUrkdQup4fef1JbHIZlDYPr6bztZ2SKf/6a44rEDiVQMlDTvsv1BahU2nSgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=fN74Akwh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="fN74Akwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768803414;
	bh=dy9DynMss95U5C1rQckkcUpti23IhzwZpakGu/M2kvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fN74Akwhk+hZlcEBSsYmzgw7/CLbxfQctyYJExXmAC1PwJBQJwY/bM6R0gZq2dAiu
	 C3hsxRll03Tge2UHHUBXMMVk/2asDuebhJxXbDvMDwQaMJFnZm7lMYBB716lY2AMgx
	 xBBBcGcWZn6PfoAyl4JFV+KzVprY+KRbDjrI2rtL8oU0dM5aUnUVvYoer/Od1Z2eb4
	 8ASlPD8QaaTVtyFjgK44/e7kw2YglgaphRAL38H4+sWjxqqndsQbhVE6U2GZ4uv9Iv
	 43OgYM712paL5ZT/QPrATwHrgk+wrCX6chuCoR9wH8E0G+Z/9FjU4Zr0q4tZmYlh0I
	 Ec0H8ybbNDqGQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dvgGG0WVLz4wCJ; Mon, 19 Jan 2026 17:16:54 +1100 (AEDT)
Date: Mon, 19 Jan 2026 17:16:05 +1100
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
Message-ID: <aW3MJTC97VSwGsMm@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-7-herve.codina@bootlin.com>
 <CAL_Jsq+EDvrEqqwsFjs0sGxYfKgQuSFqCiqQs-1b3TnbG+gATQ@mail.gmail.com>
 <aWg2JJstA0F-h9hi@zatzit>
 <CAL_JsqLx-NWM=gFdQfQ1Nw10ii2n5gX93WgH+zTcbHRt=Ze_vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dd0ATUC3pSb1IIF4"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLx-NWM=gFdQfQ1Nw10ii2n5gX93WgH+zTcbHRt=Ze_vA@mail.gmail.com>


--Dd0ATUC3pSb1IIF4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 09:54:22AM -0600, Rob Herring wrote:
> On Wed, Jan 14, 2026 at 6:51=E2=80=AFPM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Tue, Jan 13, 2026 at 01:22:08PM -0600, Rob Herring wrote:
> > > On Mon, Jan 12, 2026 at 8:20=E2=80=AFAM Herve Codina <herve.codina@bo=
otlin.com> wrote:
> > > >
> > > > FDT_REF_LOCAL dtb tag is a meta-data tag attached to a property.
> > > >
> > > > It indicates that the property defined before this tag (FDT_PROP) u=
ses a
> > > > phandle value and the node related to this phandle value is local (=
i.e.
> > > > the node is present in the device-tree blob).
> > > >
> > > > It is followed by one value:
> > > >  - offset (32bit):
> > > >      Offset in the property data where the phandle is available.
> > > >
> > > > Example:
> > > >   FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0=
x04
> > > >   FDT_REF_LOCAL 0x00000004
> > > >
> > > >   This means that at the offset 4 of the property data, the value
> > > >   (0x01020304) is a phandle and the related node is available in the
> > > >   dtb.
> > > >
> > > >   This is what is encoded in the dtb when the related dts has a pro=
perty
> > > >   with the value set to <0xcafedeca &foo> with 'foo' a reference to=
 an
> > > >   existing node where the phandle value is 0x01020304.
> > > >
> > > > If several local phandles are used in the property data, several
> > > > FDT_REF_LOCAL are present after the FDT_PROP tag. Each of them poin=
ts
> > > > with its offset value to the position of one phandle.
> > > >
> > > > For instance, if a first property with 8 bytes of data has a phandle
> > > > value at offset 4 and a second property with 16 bytes of data has
> > > > phandle values at offset 0 and 8, the following tags sequence is
> > > > present:
> > > >   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
> > > >   FDT_REF_LOCAL 0x00000004
> > > >   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
> > > >   FDT_REF_LOCAL 0x00000000
> > > >   FDT_REF_LOCAL 0x00000008
> > >
> > > To follow up on my desire to both be easily extended and have more
> > > type info, I have something like this in mind:
> > >
> > > FDT_TYPE_INFO 0x10 FDT_REF_LOCAL 0x0 FDT_TYPE_U32 0x4 FDT_REF_LOCAL
> > > 0x8 FDT_TYPE_U32 0xc
> >
> > I think general type info should be out of scope for this:
> >  * This series is already enormous and complicated without that
>=20
> It is enormous, but I don't think the intention was to finalize and
> merge it all at once. I certainly don't intend to review it all now.
> The final result looks sane to me and with that we have a good idea
> what information needs to go in the DTB. I think the first step is to
> define the new metadata tags and what DTB format changes are needed.

I mostly agree.  But as noted, we can't advertise v18 (or whatever)
support until we actually *do* support it - which would imply having
some docs / specs on what exactly is in v18.  So the series will need
some re-ordering to allow pieces to be merged earlier.

> >  * phandles aren't just another type, they have structural relevance
> >    which makes them a special case
>=20
> Fair enough.
>=20
> What's similar is we need to define FOO is at offset X just like the
> markers within dtc. We can add other types later, I'm just asking that
> the design here for new tags and phandles accounts for that.
>=20
> > Plus, I'm actually pretty dubious about adding type information to
> > dtbs in the first place.  It gives the impression that dt property
> > values are self-describing, but they're not.  If you want a
> > self-describing format, I think you'd be better off dropping the
> > OF-related past entirely, and using json or one of the various other
> > modern self-describing structure data formats.
>=20
> json has no concept of integer sizes (and numbers are floats).

Good point, and dtb has heavier than many need of true 64-bit ints.
It's a real half-ton of flies in a mostly pretty decent data model :(.

> The
> typical work-around for that is encode everything as a string and then
> we're pretty much back to everything's a byte array. Pretty sure we've
> been thru this already. So I don't know what format we'd use. I've not
> come across one.

ASN.1? CBOR? Messagepack? Protobuf?  I don't love any of those, but
I'm not sure they'd be *more* clunky than something we cobble together
on top of dtb.

> Perhaps just DTS as that does have the type
> information. :) In any case, I'm not interested in a revolution, just
> evolution. I want a format that transparently works with only an
> updated libfdt. Anything else is simply going to go nowhere (as
> evident by the last 15 years of new DTB format discussions).

As a rule, I also prefer evolution to revolution.  But there can come
a point where you're straining the thing you're building on further
than makes sense any more.

> I know you aren't a fan of relying on .dts information for type
> information, but that's not the only source anymore. We now have an
> entire database of every last property and its type. That could be
> what's used to populate type information. Again, we don't have to
> define how we do it now, just allow for it (and any other metadata we
> have yet to think about) in the DTB format changes.

I guess it depends a bit how you're thinking of this type information.
Are you thinking of it as an intrinsic part of the dtb information
that a consumer (like the kernel) would use?  Something akin to the
symbols or relocation information in an ELF object.

Or are you thinking of it as something for the benefit of intermediate
tools, that could be stripped out before going to the final consumer?
Something like debug symbols in an ELF object.

I'm open to the second approach, although I'm still a bit concerned
that once it's there as "debug" information things might start relying
on it which shouldn't.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Dd0ATUC3pSb1IIF4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmltzCQACgkQzQJF27ox
2GdRLw//Z4n5FB5/062jnuZjZ7+sEINtktXD+bEFjZEmVie08irabokx1ojKqrWI
PBBaTnErldINkFakBuW09Nvs1ddHeYMr6OqafR9Eo2Xh9kwdRE3PmZvzicIqx/ka
ZLD9GdeG168qHIHCa95zOM0scvztKjRCZXgfLTJz7utow5SR8AfOSN1T5uNx6k1U
LzC30jkeCPubOhE7BULHDro5u6ZPQFpUWoX3puvZwrwmUPO459YHkRB5zECTAGMN
xA2IO8Byw42sa4gzpjGUKESPfrDBluvrZSvv9mF4FNfCJt6Docwuwm1F4JH9BpKu
BRJZkItz6Sov/KST13g6fopSLYxtg7ba1QQO50MhJytIkJah8v7SiiN3HqbfyPst
VQ2kDMxlpcGaZir206nj1cy/pnPoGDEFSS5ItNzZ/S0rATHlpwkkPPCutCAZfhDc
l5IbhXHVmy7pEkhAqvzdf6yJJxljGFDvPkqfDgI2PQAG8l6K9w7QVlMNr4sMdluo
aw6oziF8mjojLfAfJz8IMKUXJ81D21QYiwLQYSZPZzsPIPjlXl5ox6z6Zk7IIX7c
f1VpOtcJA0CWz7bHI/coBI9GbovXuFJ6jwvdY1l5g+yC+PWwo1/GwjFkDDFB+M50
eCEiarD04E4O3mnfDyB8W0/1LpQmWXY4xo4Ho1J2Yx0xMQn3JYM=
=QDTS
-----END PGP SIGNATURE-----

--Dd0ATUC3pSb1IIF4--
