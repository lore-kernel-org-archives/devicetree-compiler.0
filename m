Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AFF353A8E;
	Sat, 19 Sep 2026 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793211; cv=none; b=p4SXqm4XalPsTef9XeA8dzhfAOtAFopjVRotM/HM54IOV7NXiYFihaKn/ZA2DBsmhARVDGQbgbNXVbhSDWmNidFFbHYhGGLP0FRr5giMnwgd4bn4QDT6mdWM1Leu/qwW7ynMTrzSOwNfU2Mcc5yir5FWS25ZuKChzDE1Ag8mztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793211; c=relaxed/simple;
	bh=Yp43sGxUJq+WIfGJue9TU0DZDOS8rLKb20i8Jg4kCuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQd/XU4dMtELSwr8vqq0OpKlkI63Z5HHX2E5gz8C1zEyLeiUk1pUbCAL+9Do8yRYVL/hjWEcbOw6TcH6k4Oy6Nh2u+1WS20978fs5lmSmKV57UjRaLX+bYcL47wJ4Z/us3YgwNNqJnMhESoEUWpGAL/BRPECTas3ImFP8SLzJSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=QZN4rbkP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="QZN4rbkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789793181;
	bh=kdN8HGttJdpumzSTDvv6wCaT2062teaGgvt9u9dhsqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZN4rbkPOpgVAIsGKpQjhagKVzGOr65/4U1r/24xugxUnbbSn/GqmtLMCel1DzMww
	 PtW8vo1ApR4GJUBE1bLwV/szmkIzHRp+TWSVwsH0qUhwT28qpWHXvhHlsZ1yHF4+n3
	 32cYlBUIR3uW07bqxnsB35rqVfeLncLRI1j+OK31Qa2jB5yCYyWusRhxxh6KeXyVQB
	 FRI+Us6QUNgjoCdkI+MGopDFB0GD+0cOOzO+gQcKdtdR0Nxl6CKpr4F2XzsYQLqw88
	 2k858m5fRQcgGLMCi02YMNs4bxnxLx2SUHhQzNqi/vHfw/clyp4bHT/lbUvDj29mS5
	 FMAyK4jorBBrw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hmxld2Qg4z4wK1; Sat, 19 Sep 2026 14:46:21 +1000 (AEST)
Date: Sat, 19 Sep 2026 14:46:05 +1000
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 09/15] libfdt: Handle unknown tags in fdt_next_tag()
Message-ID: <aq4Tg0cAD8z6IL9Q@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-10-herve.codina@bootlin.com>
 <aqpc9HZ2T74Q2lYs@gractus.seuss>
 <20260917103410.1fcfe0f1@bootlin.com>
 <aqu0c3qMJOLoD0Ho@gractus.seuss>
 <20260917192814.70cbecbb@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xkXI4Z0S0PE4d0Fr"
Content-Disposition: inline
In-Reply-To: <20260917192814.70cbecbb@bootlin.com>

--xkXI4Z0S0PE4d0Fr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 07:28:14PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 17 Sep 2026 19:36:06 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Thu, Sep 17, 2026 at 10:34:10AM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Wed, 16 Sep 2026 19:10:27 +1000
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Wed, Aug 26, 2026 at 10:31:40AM +0200, Herve Codina wrote: =20
> > > > > The structured tag value definition introduced recently gives the
> > > > > ability to ignore unknown tags without any error when they are re=
ad.
> > > > >=20
> > > > > libfdt uses fdt_next_tag() to get a tag.
> > > > >=20
> > > > > Filtering out tags that should be ignored in fdt_next_tag() allow=
s to
> > > > > have the filtering done globally and allows, in future releases, =
to have
> > > > > a central place to add new known tags that should not be filtered=
 out.
> > > > >=20
> > > > > An already known tag exists with the meaning of "just ignore". Th=
is tag
> > > > > is FDT_NOP. fdt_next_tag() callers already handle the FDT_NOP tag.
> > > > >=20
> > > > > Avoid unneeded modification at callers side and use a fake FDT_NO=
P tag
> > > > > when an unknown tag that should be ignored is encountered.
> > > > >=20
> > > > > Add also fdt_next_tag_() internal function for callers who need t=
o know
> > > > > if the FDT_NOP tag returned is a real FDT_NOP or a fake FDT_NOP d=
ue to
> > > > > an unknown tag.   =20
> > > >=20
> > > > I'm a bit unsure about this one.  If we were designing the libfdt
> > > > interface from scratch, I'd definitely say that fdt_next_tag() - as=
 a
> > > > low level function - should return every tag, and it's up to the
> > > > caller to skip unknown ones.  fdt_next_tag() already provides
> > > > nextoffset making it fairly easy to do so.
> > > >=20
> > > > But, of course, we're not building from scratch so we do need to
> > > > consider backwards compatibility.  Supplying a skipping and
> > > > non-skipping version as you have here is the obvious approach.
> > > >=20
> > > > But I'm not entirely convinced it's the only or best approach.  A u=
ser
> > > > which calls fdt_next_tag() is, in a sense, already opting in to
> > > > low-level handling of the dtb.  They could well already be broken by
> > > > new tags (depending on how they handle the default case).  Arguably
> > > > it's reasonable to require them to be updated (once only) for this =
new
> > > > family of tags. =20
> > >=20
> > > I can go in that way. We will have same kind of sequence in almost all
> > > callers.
> > >=20
> > >    do {
> > >       tag =3D fdt_next_tag()
> > >    } while (!fdt_tag_is_unknown(tag)); =20
> >=20
> > Not really - users of fdt_next_tag() will typically already have a
> > switch on the tag type, so the unknown tag handling would be an
> > addition to the 'default' case, not requiring an extra loop.
>=20
> Ok, those are to be update to use a switch on tag but that's not big deal
>  - fdt_check_node_offset_()
>  - fdt_check_prop_offset_()

These don't have a switch because they're asserting we're already on a
specific tag type.  They should still do that with structured tags:
these functions should be checking that we're exactly on an
FDT_BEGIN_NODE or FDT_PROP, not on a skippable tag that sits before
one of those.

Or to put it another way, if we did have fdt_next_tag()
vs. fdt_next_tag_all() these functions should be using
fdt_next_tag_all().

>  - fdt_add_subnode_namelen()

The logic here is placing the subnode after the parent's properties,
by moving past any FDT_PROP or FDT_NOP tags.  With skippable tags we
do need to skip those too.  Which we can express instead as skipping
until we find either an FDT_BEGIN_NODE (indicating the first child) or
an FDT_END_NODE (indicating the end of a currently childless parent).
So, no need for a new switch here.

>  - fdt_finish()

No need for changes here either - this already skips everything that's
not FDT_PROP, so it will do the right think for skippable tags.

> Some others like nextprop_() or fdt_next_node() mix a while loop and a
> switch/case. Some rework to be planned.

nextprop_() will need some rework, yes.

fdt_next_node() only barely: it already ignores FDT_PROP and FDT_NOP;
change that to 'default' and it will skip those and future structured
tags as well.

> > > We have to care about those "unknown_and_skippable" tags only when
> > > we modify a dtb. This is handled by a few functions.
> > >=20
> > > The vast majority of callers of fdt_next_tag() just want to skip
> > > unknown tags. =20
> >=20
> > I'm not sure that's true of the (few) callers outside libfdt itself.
>=20
> Well, today there is no "unknown" tags and existing callers works
> correctly.

Rather, any tags unknown by the caller are assumed fatal.

> Unknown tags are reported as FDT_NOP. It should be ok with existing calle=
rs.
> They should handle FDT_NOP.
>=20
> >=20
> > > > Another potential approach would be to actually use the symbol
> > > > versioning we have, but have som far only minimally exploited.  The
> > > > LIBFDT_1.2 version of fdt_next_tag() would skip tags that postdate =
it,
> > > > but we'd introduce a new version tag and the new default version of
> > > > fdt_next_tag() would return all tags.  That would of course require
> > > > figuring out how to do that with the verison script. =20
> > >=20
> > > Hum, I really don't want to have versioning in loop for fdt_next_tag(=
).
> >=20
> > I'm not sure what you mean by "in loop" here.
>=20
> I don't want to add the versioning extra complexity in this context.
> I am sure we can find a solution for this "all tags vs only known tags"
> topic without versioning involved.

"known tags" is meaningless here - what matters is whether the tags
are known by the *caller*, which we don't know.

> > > Also, this could work in the dynamic lib (.so) case but not for static
> > > link and even less for libfdt code copy compiled in bootloaders or Li=
nux
> > > kernel code. =20
> >=20
> > Are symbol versions entirely unsupported with static libraries?
>=20
> I would say yes but maybe I am wrong.
>=20
> https://sourceware.org/binutils/docs/ld/VERSION.html
> https://sourceware.org/binutils/docs/ld.html#index-_002d_002dversion_002d=
script_003dversion_002dscriptfile

Ah, yes, I think you're right.  Ok, that's not going to work.
>=20
> > Obviously they'd have to be resolved at (static) link time, not
> > runtime, but I don't see that it's impossible.
> >=20
> > > fdt_next_tag() is a low level function accessible out of libfdt (API).
> > > If it doesn't skip unknown tags even for other libfdt internal functi=
on it
> > > will be a too lower function. =20
> >=20
> > I don't really follow what you're saying here.
>=20
> Skipping unknown tag is a low level feature.
> I think fdt_next_tag() can handle this low level feature.

It really can't, because it doesn't know what tags the caller is aware
of.  It can only make a distinction between "older tags than
<arbitrary cutoff>" and "newer tags than <arbitrary cutoff>".

> Upper layer using fdt_next_tag() should not handle this tag skipping the
> general case and let fdt_next_tag() do this job.
>=20
> Got the feeling that we are going to add complexity at upper layer to han=
dle
> a feature that should be handled at low level.
>=20
> >=20
> > > Ok, we can have a wrapper on top of
> > > fdt_next_tag() to skip unknown tags.
> > >=20
> > > fdt_next_tag() is a low level function but the rule related to skippi=
ng
> > > unknown tags is also a low level rule.
> > >=20
> > > We have to choose:
> > > a) fdt_next_tag() as I proposed
> > >    Of course ok for me
> > >=20
> > > b) fdt_next_tag() returns all tags -> Full handling at caller side
> > >    Ok, we can go in that direction but it will bring quite a lot of
> > >    code duplication. =20
> >=20
> > I'm not sure it's that bad, since fdt_next_tag() loops will typically
> > already have a 'default' case for irrelevant tags, which will
> > generally be handled the same as unknown tags.
>=20
> Well as we did for "offset 0 vs real root node offset", I think the best =
way
> to known if it's bad or not is to try.

Agreed.

> I will not have time this week to propose something and I have a training
> next week.
>=20
> If you're ok for a try, I will do it but not as quickly as I did for the
> "offset 0 vs real root node offset" topic.
>=20
> >=20
> > > I am not fully convinced by this option.
> > >=20
> > > c) lib version
> > >    I disagree on my side =20
> >=20
> > Yeah, I'm not really convinced by this one either.
>=20
> We are on the same page.
>=20
> >=20
> > > d) Other idea
> > >    Of course, I am still open. =20
> >=20
> > I haven't thought of any more ideas yet.
> >=20
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--xkXI4Z0S0PE4d0Fr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmquE4MACgkQzQJF27ox
2GfgsQ//VEmnCEtBbPcKkd7OLkTZfLjDdqjs9XpIyxvGRrn62ZH8ELT3keVDIISb
+nw1byHFmjtNWS03c6fWrA1aYoZ957sOF+jjH4ibccf707ExjdTYVLu4dFNrDjrc
Nu3fZ0NNkBu4JoBmGNrYvef/53F7pzyLlihQsCh9vNKSniyyu7D0yRmmJL5EFiZ4
eZQqkqHg/RoLnn8BAopo2QNlAGDrQc/SsyEvOdQUrS5/vjwa5rJiv48PEQ4r0Tvd
sYd3QwOGrfQoa8q1IRdx0vgtcxYYlyCPY9CR7/YcFEUyonT5qWlhcTiclftJVXzA
ZNbfSMOqd3SBDaX6zv4AEu9ZIK0s3UML87tPElg3R4MEEQ4YZwMdCsWXW9e89MXV
nh6W5fvD8VOH41Iw20Rv9fQOeyBuRzY9EOkNss47eTm5e/IwIbgYg95+ZCdPHUU5
URFG8yGAFlrGyM8V4AfUWukEfUdyLVphhGgnBGu48raFvFRpSm0grhVCCq/XI/ja
ykqy0XGHFmJi+6Yk9fcUZaSTO3x8WUOycRVo7O5DK7SVJpyllxn7NpLiaQtrfBTR
tT74JriXXO3njsJw8nYOyTPcs6hZJfWgGB0I7TSDdNH2FaRWZInoRGGQibPQ9AUT
FRlTpJwZk3g8uqG3z2PbMJt5Osg9/Yc0kzv0H1KaNRXjFdbKWxo=
=iTUB
-----END PGP SIGNATURE-----

--xkXI4Z0S0PE4d0Fr--
