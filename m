Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5890186E58
	for <devicetree-compiler@vger.kernel.org>; Thu, 12 Sep 2024 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113580; cv=none; b=n87WYQmBJzDnRJKeplPU/LrcQb6J9kYsrqWtapsJGppUeXC8OzmdECsyLM8ZWkoTcGKqNOKOC+4pWjLAu17PGx/3KtlRgRhWOOFuMDxvkSa25Tdg0DcbooGKgL9OT5PZMxW53SefAwon0mlk3Qjbl3M608I+aiBISMqE4LThp/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113580; c=relaxed/simple;
	bh=KSTS1TnqmLG9QiwUVnYbNBP2u7R7DSRsc8qNYs+i0SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxKUHUUtMvxvfvlkudbpkymcvEyLILUlja59bgUWhZ6kqkX+uZhe1ejQTLOjgu/ve1w5upDcf21/IY8DagD9kYaHoHyRJKKctuAx7NxZc//sOEfAOnWph8O+HyK9u8a8OQRaDQGlpyMe6RoR1L0ZKhqvyNU8ECwLM4Pmz6Mj5oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=e05+uIm6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="e05+uIm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1726113575;
	bh=qOJG/MPd2reXTpXnGV4RwYBccku6k4/OQnGJUKdTi9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e05+uIm6Ny0SH78vk3xh5JHacJudRgCortiS+gwjAtF0HZ6JRh1hUNBZupy5fxNpZ
	 cDU+h1+310wQln1DBom3LNiiie9Ux9AfOWG1bRkocSJhHh+qkCeL1+dk9yD2L6sdCa
	 oCQHNWlRjKzMMhZ4+KaUelw6DbzmpZM6tHglwBX6TlyTmRZZ7EEv5ZXSf5srl4QlAK
	 D9akWzbVqlbUOqykSgDOQDZ0ypaJgl40CqySw1TzTAtBFgXVKzXarIfXyO8Abkfmyl
	 oxoyR24wQe2BqaZ35ixYf6oUcmRmmgq/8U+VWhB0k6rXUG1lirLB1xTqKVLtgUDwsx
	 oePQH+qtvpOlw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4X43bq0mMFz4x21; Thu, 12 Sep 2024 13:59:35 +1000 (AEST)
Date: Thu, 12 Sep 2024 13:59:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Davis <afd@ti.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Ayush Singh <ayush@beagleboard.org>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 0/2] Add capability to append to property
Message-ID: <ZuJnIraA3lSBX0l8@zatzit.fritz.box>
References: <20240830-append-v2-0-ec1e03f110ad@beagleboard.org>
 <CAMuHMdV4oykS9UGdw0xFm45sD6Xkwcz3KPidafqFFsAv6bNKhg@mail.gmail.com>
 <5a9dc053-d826-4168-a626-8d7f4ee72de1@ti.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2yS/fwXXCrqg0F1M"
Content-Disposition: inline
In-Reply-To: <5a9dc053-d826-4168-a626-8d7f4ee72de1@ti.com>


--2yS/fwXXCrqg0F1M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 10:43:11AM -0500, Andrew Davis wrote:
> On 8/30/24 3:09 AM, Geert Uytterhoeven wrote:
> > Hi Ayush,
> >=20
> > On Thu, Aug 29, 2024 at 10:04=E2=80=AFPM Ayush Singh <ayush@beagleboard=
=2Eorg> wrote:
> > > Allow appending values to a property instead of overriding the previo=
us
> > > values of property.

I can see how this would be useful for certain cases.  I don't love
implementing it just as a specific ad-hoc new keyword thuogh.  I did
long ago have a more comprehensive plan that would allow for this,
amongst other things.  Currently we allow integer expressions in dts
files, but I had been hoping to add string-valued and
bytestring-valued expressions as well.  That would allow appends as
something like:

	prop =3D /previous-value/, "extra stuff";

',' being the bytestring append operator.  It would also allow
prepend, and - with the addition of other bytestring operations -
various other manipulations.

However, the chances of me ever actually getting around to
implementing this are basically zero at this point.  I guess based on
that design we could allow appends with the syntax:
	prop ,=3D "additional data";

Which is, I think, theoretically more elegant, but also risks being
pretty unreadable.

> > Thanks for your series!
> >=20
> > > Open items
> >=20
> > > - Appending to non-existent property: Currently am just adding a new
> > >    property if not found. Not sure if this is the desired behaviour.
> >=20
> > I think this should raise an error.
> >=20
>=20
> I was thinking this at first too, but if we want to be consistent we
> may want to instead go with adding the new property without error for
> the following reasons.
>=20
> High level, nodes and properties should behave the similarly.

I'm not sure I buy that premise.  dtb is not like (say) json, where
"node" and "property" are just different types an entry could have.
Properties are structurally distinct from nodes (the subnodes and
properties and a node even occupy different namespaces).

The other important distinction is that dtc necessarily understands
the internal structure of nodes, but it doesn't necessarily know
anything about the internal structure of properties (beyond that
they're bytestrings).

> When
> we run into an already defined node we take the content and append
> to the existing node. But for properties we replace the content,
> not append. This is the fundamental asymmetry that causes us to
> need /append-property/ but not need /append-node/, nodes append
> by default.
>=20
> When we want to replace a node we do /delete-node/ first, followed
> by the defining the new node content. If properties were default
> append, we would do the same with /delete-property/ followed by
> the new content. If we could do all this over that would have made
> the semantics much cleaner and only required /delete-node/ and
> /delete-property/, but little late for that now..
>=20
> So when we label a property with /append-property/, we want it to
> have the same semantics as nodes. Which is to append if it exists,
> and to add new if not, without error.

Hrm.  I'm pretty dubious about this approach because a property being
absent is different from a property being present, but containing an
empty bytestring as value ("boolean" properties rely on this).
Appending in this matter erases that distinction in the base tree.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--2yS/fwXXCrqg0F1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbiZyEACgkQzQJF27ox
2GcQxw/+LyunugUCXs3ar1Mw0snsxUU+TesHdVpM5ByGFvn5wJX6sVeru9vILXS8
/L2eXt2eBRXcwN23q9mq32dRg0jqxQNNbLpquuJjYwAJlcr3VVyP+KcS+3hgPNl2
a7Nz2wrm7/31Ot6/NC7W94KUC5kz7WwBBQaCivA1Z01k81ikuOnGtPIuKNgmsYl3
C9rP3Uhlb9de4ChG658yQNNnDlva4HVm4NWdJFtwNxV/U1LS4oN4BkaKIlqxdGM9
QZxP8x8d79hS3s67ayhV3WGotxInoaZRwiQbtMsK6/PW5x/lehDzW5KD8gcG3Ss0
nKb4nxj8KS0k89fSHE/56Fb0kdq2HyTuieGgPZhbE1rkGfabsl4hgfZInqa+GZRR
FHj6aVqvdjJmD+0LstxfT9Odc2GgwLUNWoaK9We4jwkqm16+t2t8TDz7BSRFEbfm
2OsFBqgI2hs8dx8OELax1Rn2PjGbXBg+QrXn8qSOzoJZsxZiN7AO/eRKI1dLskF2
lkwbIMs5NJ2wXj+gUAutUh+U+nHr3R8wOYUUnbGdgq4BJYxSjj7nJHQYxqWdBwET
v5wqSvXslJDGsCrL2scnhyk1H/y6/37AoJq9jCyvs94KoKrG+OlxSMM+cQfx6bQQ
9Y3ldCC9UXnvPTHrsuk9QqDdhxWekw0jqzfpDuy9OeZCQ2wKrAw=
=tXvt
-----END PGP SIGNATURE-----

--2yS/fwXXCrqg0F1M--
