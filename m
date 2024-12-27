Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FF1C28E
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Dec 2024 04:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272359; cv=none; b=biOx5z8Mo7hsfrtxvb24HTiLK3ewGD4xrKwOtdQ0+//3MYGVPrVTwhyPgA+Wpxr0C66fe3reqDk1OibGB5DjThpXu0frFwvP4s6dqJRaD+E/AXYUNyhL5dxmiWY6akMTJKPwC+yxM8QUnHcWQ9+ZuH3V8rmwxo2QsHHJr495IDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272359; c=relaxed/simple;
	bh=ZEgglelA2sgIKTkcL7v7fUNgZ28NDOYyBsQhUXs5yYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg8dIyQNiN797tSHlXFDD9Peu7wtYDE+2yjxuVI6Y33zIHLlcK4UMsljglbF6bsVt4M7eMoFS7w9wjw501dfe6y32wWA/S4pIpebIWTpnZCDIKz+F6+0kqLTjJTW87B7FW0Y6Agd0IboMkhYQAcHsweH1TKMxfAMnRqglAgwA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=lV0EcZM/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="lV0EcZM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202412; t=1735272344;
	bh=kwbPY1QRKiVjeaEuOqz3ccc4nvxDth9JH0vHvW5ggdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lV0EcZM/r5TVlURPcWqr8Lzojy7hPOoTWQSgvpWKEf+yTrbf4fLzGzSZ+s5GZEUMF
	 BoYotMSL2UWhnHfmgSylR8NE55jhUe39KebYVI4op3NKb+GJiSvZ7iciKHoyTl4kfc
	 E8cTx1SO9233wmIytrC8EReuPTkr5N2k3dtxGlsx2L1C1VS4R2khnQkeFrFlm9iG6g
	 sMhKYmdeaiJ/mMvieKO8z/JmrJdiQVj3ZhsSEWF/u/chNkrEQSxr1BHgLnJrObrnke
	 LZzyvICSU8OTdMU+9qm+Eb7QXcBOuc/Ia+mhAuRsi0f3du7I6BMMumKxyMbXjgXyQO
	 UUIh0S2uJKndQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4YKBk05cLyz4x6D; Fri, 27 Dec 2024 15:05:44 +1100 (AEDT)
Date: Fri, 27 Dec 2024 15:05:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
	Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>, Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3 0/2] Add capability to append to property
Message-ID: <Z24nldCpXpoT7RaK@zatzit>
References: <20241111-append-v3-0-609c09401f3f@beagleboard.org>
 <58c44f5d-7b45-4489-bf26-2be36c44e39a@iopsys.eu>
 <Z1_EM1dEmN4KHhBr@zatzit>
 <89073be9-c5f6-47ef-81d3-e7d57070f8d0@beagleboard.org>
 <Z2z9mk8nrMzLi-gy@zatzit>
 <CAMuHMdVQZ0Ffhi5LGWdPeiMbaGp-ctN=OAg9kvrwJgpxEpENmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2rmbr7n2izPQE4Af"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVQZ0Ffhi5LGWdPeiMbaGp-ctN=OAg9kvrwJgpxEpENmw@mail.gmail.com>


--2rmbr7n2izPQE4Af
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 12:10:04PM +0100, Geert Uytterhoeven wrote:
> On Thu, Dec 26, 2024 at 7:54=E2=80=AFAM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> > On Fri, Dec 20, 2024 at 09:00:14PM +0530, Ayush Singh wrote:
> > > On 16/12/24 11:39, David Gibson wrote:
> > > > On Tue, Dec 10, 2024 at 04:34:17PM +0100, Andreas Gnau wrote:
> > > > > If we add /append-property/, why not add /prepend-property/ as we=
ll? This is
> > > > > not only "nice for consistency", but it would also enable solving=
 a problem
> > > > > where SoC compatible strings from dtsi [1] need to be repeated in=
 board dts
> > > > > [2], because one cannot prepend to an existing property.
> > > > >
> > > > > ```
> > > > > dts-v1/;
> > > > > / {
> > > > >   compatible =3D "soc-vendor,soc1234";
> > > > > };
> > > > >
> > > > > / {
> > > > >   /prepend-property/ compatible =3D "board-vendor,board-xyz";
> > > > > };
> > > > > ```
> > > > >
> > > > > What do you think?
> > > > So, this kind of demonstrates why I don't love /append-property/ as=
 a
> > > > proposed syntax.  The way I'd prefer to do this, ideally, is to all=
ow
> > > > properties to be described as expressions.  We already have integer
> > > > expressions that can be used in < > context, but I had intended to
> > > > extent to string and bytestring expressions - but I've never had the
> > > > time to implement that.
> > > >
> > > > Under that proposal, I'd expect appending to look something like:
> > > >     str-prop =3D /previous-value/, "1";
> > > >
> > > > Prepending,
> > > >     str-prop =3D "1", /previous-value/;
> > > >
> > > > .. and you could do both at once in the obvious way.
> > > >
> > > > The downside, of course, is that this is a much more complicated
> > > > proposal to implement.  Parsing that syntax isn't too hard, but I
> > > > think doing it sensibly will need some structural changes in order =
to
> > > > evaluate property values as expressions, rather than simply
> > > > constructing the properties directly left to right.  In particular =
the
> > > > interactions between expression syntax and within-property labels (=
and
> > > > other markers) could be fiddly to get right.
> > >
> > > Do you wish to allow `/previous-value/` to be repeated in the same pr=
operty?
> > > Something like this:
> > >
> > >     str-prop =3D "1", /previous-value/, "2", /previous-value/, "3";
> >
> > Yes, I'd expect that to work.  Note that I don't particularly like the
> > name "/previous-value/" - that was just an example to demonstrate what
> > I had in mind.  If anyone can think of a better or more succinct name
> > for this, please suggest it.
>=20
> Something like "/./"? (dot is also used in assembler for the current addr=
ess)
> So e.g.
>=20
>     str-prop =3D "1", /./, "2", /./, "3";

/./ might work.

> Or would that be too short? "/orig/"?

It's not too short but I think "/orig/" is a bad idea. In cases where
the value of a property is modified more than twice, this would refer
to the most recent previous value, not the "original" / first value
assigned.  "/prev/" might work, though.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--2rmbr7n2izPQE4Af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmduJ4IACgkQzQJF27ox
2Gew+w//ajINHlXhmg23c+vjin8fGduJrNNqRPbOLZoV8IjKGvfiitBrb7aq78iX
gscIjHwFbHasN/Ie0ePY+pO0RW3XuejDOLcJ870+TcSJ9rDF/fGyvdtR4pbL/xGy
G29UESsxh1LytBAag3d6FuzSVNifJKPRkzzfnhTUIaT8yxr/2P2MI562wRi3f04n
9vQDDrnviVqTSAi3f60DdZCU5OVq8Uq7szwqAAc1bnNuobFh/Ue70EcvsQHrBWzg
uh/LURRV1ENHapY5VHlQpMQ6HqIjmrE1brAkK+nLneWXtuBWAb5gdLL0ULOtDO/U
aT3jruefS5nNxftzs5Ws9BoGqPOGNQL4IZ8niCoErEyd+zk69plX9/AHTOe21ti5
TLROEXSQn/Ws9i1EY+f6i+UlS89J3Ukuiu7P5YYZyCuTZ8SdkyVXTvoRoJgdkHgU
hvefYgA9HppaPo4LhGit+8M8Y+rg+7OTLcmC0qD7v/q391jOJValF7BymjktbHZr
1lNbnzmyC3ptA/yPytg5bq+gI83iTGZyutNpdJErH8prtsNhGS9UlIvMvHSmJRnu
VL3Smvf9Iz24cSWK4t3QHCRMuOG1uFmZMzg7LyghLRmroSJl2XggDoh6PI0TnLiN
Pfs1cwmtJSaICfu0lRTlrLWRxNXtCAleW6JvjE2gdp/LZ7YEdao=
=BdNG
-----END PGP SIGNATURE-----

--2rmbr7n2izPQE4Af--
