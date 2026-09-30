Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB2A3D0BE4
	for <devicetree-compiler@vger.kernel.org>; Wed, 30 Sep 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762960; cv=none; b=cxnGo3a9EdnSnDTab8ED7gStqFNh9bcQ6rHKyRiVtnY2w/hgMiLA1fSutsEDRooZ8/5SZF3rd2uvM5aNNzt5Il8yLs/sIq46tPMMp7CMVjYDgNhWd5ihBHXYZihsMpe5wFIoSeCk80wzdAVhLIQ2zmxnEY8psbTYI+J96TD5fdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762960; c=relaxed/simple;
	bh=+SuIRuPPJRM8guq0O2LRs3C0kQcEN2Gn1PUq3snVezw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMB8D5/P4BU/YEg9lBgYCXE37uNW/cmjAZiX3CwzqaCe5VliokC3E9Ex6XyboefAXzm43t6OodvoCCkxb57t0WFjneTAdS9bDqnMMoBozgWUkABW/X43r2RfZ9BEkPtAiBhLPupZNRM9eLOaZi/YO747Xa1r5HteKjP3gfJkWR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=RqfmKIXI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="RqfmKIXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1790762922;
	bh=z24++FdPgutxvYIA6y0c1k7Ayq7gHBcKawczSwV8xzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqfmKIXIP9ljWxmZdJdwt3QzMBBRkVPNw2kQdYxBmm8hAv1sheQ39nt2bBnwDpZT4
	 dWedE+KdkM1rl1Px5O7jOcKE9YxMFlQESFIxSJuvuqHpYqsJVdIqXv7uqtECKgtPtz
	 Fl5B5Ino9z+6k5Sdm5YGksjb23i92+sLDu1GRGGnJeIns2Oai7PuS/4D4q6WrcRHzb
	 m8ixj+2Kf9Q08AAY4WiYDDoHxxIYQzbSE02KDgjrhfhBxGEuGBQdxSr0/YKsVp1twm
	 RKlsNukQ4ZH2uRqBjWmb0+q7+Zm2oAtozOksrKttTzWj4YQL4yr+utvGCywIjDywGF
	 YYv5EjgiZTugQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hvrNV5f4jz4wDh; Wed, 30 Sep 2026 20:08:42 +1000 (AEST)
Date: Wed, 30 Sep 2026 19:44:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Warn about overlapping reserved-memory ranges
Message-ID: <arzaAE-rwQUNKtpK@gractus.seuss>
References: <20260923-check-reserved-overlap-v1-1-eef819889dae@oss.qualcomm.com>
 <20260925190300.7e3c1620@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LM4QNLyyj5XcXNWM"
Content-Disposition: inline
In-Reply-To: <20260925190300.7e3c1620@bootlin.com>

--LM4QNLyyj5XcXNWM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 07:03:00PM +0200, Herve Codina wrote:
> Hi Bjorn,
>=20
>=20
> On Wed, 23 Sep 2026 17:50:18 +0000
> Bjorn Andersson <bjorn.andersson@oss.qualcomm.com> wrote:
>=20
> > Static /reserved-memory entries associate physical address ranges with
> > particular purposes and properties. While not explicitly prohibited,
> > overlapping ranges commonly indicate an incorrect address or size and
> > may assign the same memory conflicting attributes. Dtc currently
> > provides no diagnostic for this type of mistake.
> >=20
> > Check every non-empty reg range under available reserved-memory children
> > and report overlaps. Add tests covering overlapping and adjacent ranges,
> > as well as unavailable, zero-sized, and dynamically allocated regions.
>=20
> I am not so sure that this has to checked by dtc.

It doesn't have to be, but that doesn't mean it isn't useful to do so.

> Should dtc have the knowledge of /reserved-memory nodes and
> sub-nodes meaning?

For the core logic, no.  But checks.c is explicitly about making
semantic checks of the tree's contents.  This is at the very least a
reasonable candidate for a check.

> Overlaps on regs and size can appear in many places in the devicetree whi=
ch
> are not correct from a functional point of view. Should dtc check this ki=
nd
> of issue? I am not so sure.

Again, it doesn't have to, but it could still be useful.  What we
check in checks.c is not that extensive, but that's because of policy,
it's just because no-one's implemented it.

[snip]
> > +	for_each_child(node, child) {
> > +		struct property *reg;
> > +		unsigned int cell;
> > +
> > +		if (!node_is_available(child))
> > +			continue;
>=20
> Could a "status" property be present in a /reserved-memory subnode?

That's a good question, it certainly seems an odd thing to have in
something that's not an actual device, but I'm not familiar with the
/reserved-memory binding off the top of my head.

> > +
> > +		reg =3D get_property(child, "reg");
> > +		if (!reg)
> > +			continue;
> > +
> > +		for (cell =3D 0; cell < reg->val.len / sizeof(cell_t);
> > +		     cell +=3D entry_cells) {
> > +			uint64_t addr, size;
> > +			unsigned int i;
> > +
> > +			if (!get_reg_value(reg, cell, addr_cells, &addr) ||
> > +			    !get_reg_value(reg, cell + addr_cells,
> > +					   size_cells, &size))
> > +				continue;
> > +
> > +			for (i =3D 0; i < range_count; i++) {
> > +				char end[20], other_end[20];
> > +
> > +				if (!ranges_overlap(addr, size, ranges[i].addr,
> > +						    ranges[i].size))
> > +					continue;
> > +
> > +				format_range_end(end, addr, size);
> > +				format_range_end(other_end, ranges[i].addr,
> > +						 ranges[i].size);
>=20
> Why do you need to convert to a string ?
>=20
>=20
> > +				FAIL(c, dti, child,
> > +				     "reg range [0x%" PRIx64 ", %s) overlaps with %s "
> > +				     "[0x%" PRIx64 ", %s)",
> > +				     addr, end, ranges[i].node->fullpath,
> > +				     ranges[i].addr, other_end);
>=20
> Weird to have '[' and ')'.

[x..y) is a standard notation in maths (it means x is included in the
range, but y is not).  But that doesn't mean it's generally known.


> Also, IHMO, end and other_end don't bring any benefit in the message.
>=20
> I think the following message is enough:
> --- 8< ---
>   "reg 0x%PRIx64 size 0x%PRIx64 overlaps with reg 0x%PRIx64 size 0x%PRIx6=
4 from %s",
>      addr, size, ranges[i].addr, ranges[i].size, ranges[i].node->fullpath
> --- 8< ---

This looks better to me.

> or in a more compact way:
>  "reg (0x%PRIx64, 0x%PRIx64) overlaps with reg (0x%PRIx64, 0x%PRIx64) fro=
m %s",

I don't really like this format, though.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--LM4QNLyyj5XcXNWM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmq82gAACgkQzQJF27ox
2Gcf5hAAkdW/Tx6t6veJJOiWOCcNOrN3I9tH9iAtMxPbtv1S1rblQhx5YJ3jF/h9
c9nGuGb8ldnO2ANIb9d9ktTSmRpWMzlVVjUPPDnZZ4esRpYPhYVjgl6MLwINBl75
cXUJMbOzBej9DdFTYTEg1HXYQ31gO4YZNpqsd1ISkkPZUkzjPaVWpG1k5ACM1K4A
e7O5I/+5okhJIxgE1rv72p4F799P9Vk3qnx3n8EFgRBAIEbSri/wdL/zA2pK9uS1
8d4Gc/sBUu3rtwfdKerUo0JH9hiSnP6feQo1RHHY/sPtOESVlOR/nSa97H8lNMXQ
3JACPdvwtO3KpROkDuMdhqcoSpAxSlaMa4VLEy5UXoDjV8rCXYBzkHC7iRgxGFt+
ZjMa2JKhIhvGXYBvZ5FORPFOl9/rn42KkFSIq1LZvgkaS9OgAvuspjada+LqO7ix
R+oIPVKmGZecVkTys4Ue4kml+OBqb+yt8FTSF0t6PQxw/ewi7lCdJFWuYSVe3suS
heIxxoPQLyfWXtjxCUnK3SZqX2Aba12nRoiYuwjQLzQo2Pr6dUX+HHJrftP6/Ufu
g4k+aW8WTZtDM0dmaMV/FMJ2gav5qDER6A+KG7fx60as2sE539cKeAgoRjiWxEG7
2jDJK4etXLIvSIInpiPV5qEJ62K74cmR06my909WNFEgJGWpCn0=
=U8zM
-----END PGP SIGNATURE-----

--LM4QNLyyj5XcXNWM--
