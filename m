Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342892;
	b=lBVY4MKhNmFZ6run+scCTLgzUexvvaAgAkPLpo8PFBc+PG6+9wUsP4pTgJzpSWODNJUO
	 P9He/Q4EaTawADb/YDokmIUjbUvvBVPiICFRqRgzgbUzqj0tsoskb2aSQqjpwVe9uXp+h
	 3u4b6eT012CzvWtCiBWqlDGsdEEVjgb6ZFGUatKPsZfXeDlAvdhoD3BuRbZ7I6rZAANTe
	 /HoXvXo4TQjkkap5yBWi/lSan+WX/spZ5wmFKNznWQn2/doSbVuHMSeP1VfENhU7mU66B
	 99menbFyyz2uXE9pbvQORZoktDiY73QzNdAaZwlSWMO78NxNzookF6woHHGqsfSwG3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342892;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=K+mdeaRj03KEshJ0LXx81QDIodC6xYZVWe8F5Y5UlGA=;
	b=SZfkjJg9csnUCatqgBfnTkLv91leRRDj7EXONrM6uxYuph9jRDRXmLytdPWHowCMWwgA
	 8UNZi9I7bXSYfzO3vWH84L9yIQdY6CMSo3+xn74b+QNj+fzOlLkDPp52aZuatPzp0GBOm
	 imRPX1F8BP0wT02P6dWlJUWpMUWkutw0UOaytTZImX+hNy9akAmzYfyVq0z6KXMSdTYjW
	 TlaYCVMiTw3Yu72gNSLU6uRvexm4ZHB6516+29pWSHLFfTkDMSg61vU0wUsm3GzzK0w6d
	 j6Sr0GcBFEdZ74knFmAvgCaXBaKzHBpwB86IdHKiufiT+2LYhW6/mUS63JievbcLgyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD81E606A31D;
	Fri, 30 Oct 2026 06:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD81E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793342887;
	bh=K+mdeaRj03KEshJ0LXx81QDIodC6xYZVWe8F5Y5UlGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7RDkqJuG4AnjsL02FvMr/Qs5JKjtinBVZp/jkKnNHu8kbuHap9U4982TO4eqZeZp
	 l5llhfwdYhh3ognXLSgoN5gT+rZRN4RFxOUqopVYxmk5Sl4NXMc1ZeaTVEusUvzc1l
	 I/jv/JBHv2oFHqdazLnldFJYthp+12x6mLWw+Yl0oRvYBYYThoSd2xfAAWlyGPNwxg
	 nX2KJ227bbh1o0AtlMhYqSkeyQ6KmF/N5+1+kRmuF/+h//+HPz8LY2kIb+Qotu42xt
	 LZtSqyoSh1GSDfb4mbvH6+rhhi/FyeN1XxKUy4bVvwMEIon6FmPgEQnl0RNe8fPxjv
	 6c6l9SAEzJdbw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jGBWC6n1Gz4xHH; Fri, 30 Oct 2026 17:48:07 +1100 (AEDT)
Date: Fri, 30 Oct 2026 16:27:21 +1100
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 08/74] livetree: Improve get_node_by_phandle()
Message-ID: <auQquHfayDEj1K8M@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-9-herve.codina@bootlin.com>
 <atrTn_I_8O6q9QUW@gractus.seuss>
 <20261023181533.0c44a57f@bootlin.com>
 <at6t-l9XYYFfS48T@gractus.seuss>
 <20261026125615.055e7214@bootlin.com>
 <auFgv_f0av-JxMjg@gractus.seuss>
 <20261028094110.2a8133a2@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="Gvg2FxIOocZhrw57"
Content-Disposition: inline
In-Reply-To: <20261028094110.2a8133a2@bootlin.com>

--Gvg2FxIOocZhrw57
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 09:41:10AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 28 Oct 2026 13:41:14 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> ...
>=20
> > >=20
> > > Ok, I will rename node->phandle to node->phandle_ and add a comment s=
aying
> > > that phandle_ field must not be accessed directly. =20
> >=20
> > You can even switch it back after you've checked there are no stray
> > accesses to it.
>=20
> If I switch it back, why talking about renaming?

Sorry, I wasn't very clear.  I was just suggesting temporary renaming
as the best way to make sure you don't have any leftover accesses to
the field in places you didn't expect.

> Of course, I will do this renaming locally to be sure that I handle all
> users but in the end no commit will rename this field.

Right, that's what I had in mind.

> > > Related to existing users, I can see check_explicit_phandles() availa=
ble
> > > in the checks.c file.
> > >=20
> > > check_explicit_phandles() could use the new get_node_phandle_exising(=
) with
> > > the caching feature. The only problematic part will be
> > > --- 8< ---
> > > 	if (linux_phandle && phandle && (phandle !=3D linux_phandle))
> > > 		FAIL(c, dti, node, "mismatching 'phandle' and 'linux,phandle'"
> > > 		     " properties");
> > > --- 8< ---
> > >
> > > Indeed, this check is done in get_node_phandle_existing() and the fun=
ction
> > > returns 0 (invalid phandle) when both properties are set with a diffe=
rent
> > > value. A value other than 0 should be returned by get_node_phandle_ex=
isting()
> > > to identify that mismatching properties values.
> > >=20
> > > This should not be a big deal if we introduced a new invalid phandle =
value:
> > >   - 0:
> > >     Invalid value. Can be returned by get_node_phandle_existing().
> > >=20
> > >   - ~0:
> > >     Unresolved value (phandle value in properties) or value cached in=
=20
> > >     phandle->node_ for "mismatch 'phandle' and 'linux,phandle' proper=
ties
> > >     values". Can be returned by get_node_phandle_existing().
> > >=20
> > >   - (~0)-1:
> > >     Invalid value in properties and or value cached in phandle->node_=
 for Invalid value.
> > >     Will not be returned by get_node_phandle_existing().
> > >     When this cached value is found, 0 will be returned.
> > >
> > > In phandle_is_valid(), those 3 values will be checked to determine if=
 the phandle
> > > value is valid or not. =20
> >=20
> > Alas, we can't do that.  Which phandle values are valid is long
> > established from the IEEE1275 days, and we can't really change it.  I
> > don't _know_ if there are existing trees out there using 0xfffffffe as
> > a valid phandle, but there could be.
>=20
> Ok.
>=20
> >=20
> > *thinks*
> >=20
> > In some ways it would be elegant for get_node_phandle_existing() to
> > report the various different error conditions separately, but I think
> > the awkwardness of passing that information back to the checks is
> > going to outweigh it.
> >=20
> > So, I think we're actually better off separating lookup of phandles
> > from validation.  So get_node_phandle_existing() (or whatever we call
> > it) will return 0 if there's no valid phandle, whether that's simply
> > because it's missing, or there's something malformed.  Separately
> > check_explicit_phandles() will report specific types of malformed
> > phandle properties.
> >=20
> > It does result in a little redudant logic, but I think it's the best
> > overall approach for now.
>=20
> Right. Ok on my side to have this redundancy.
>=20
> >=20
> > > Now last point, renaming get_node_phandle_existing().
> > >=20
> > > get_node_phandle() already exist. It get a phandle but also if the no=
de doesn't
> > > have a phandle, it allocate a new phandle value and set node "phandle=
" or
> > > "linux, phandle" property to this allocated value. =20
> >=20
> > Ah, sorry, I misunderstood what the "existing" was referring to.
> >=20
> > > IHMO, get_node_phandle() should be renamed to set_node_phandle() and
> > > get_node_phandle_existing() should be renamed to get_node_phandle(). =
=20
> >=20
> > Right, the existing name is bad.  But let's go with
> > get_or_assign_phandle() for the existing one and get_phandle() for the
> > new one.  (The "node" added no useful information and this way they're
> > two new names to reduce confusion).
>=20
> Ok, will use those names.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Gvg2FxIOocZhrw57
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkKrgACgkQzQJF27ox
2Gec7hAAgWeo+Z0sG1iqOr74jkQqvOb5649XYemVEA4lhzNPSF5g6mVXbqgM6QvD
xmACZtGxl3RbUhTssF/JVqFLNBmrsBWFm+gMlukqTXYG/BsniIXU6dUTDrLpGv6D
eJFsSjUohLsMhWvehnrXQeWrD5AmzQqb5owu2U8A+eo3NhhDL3ne6yYhK1OC767q
+pihiGqznI6WpHoFQxwTIZAP13LI0BQ0XLsN+lHUVxEAbflsw/xTkfNk4WNyReFn
bibZCJrGURPU5n3M+ReJJoZshcXXgGeWTgBvJI/NKH+NmJ2FVLPHHuLy2bGsCcHx
G55hVe4lMWsSneYLIRsxUAW1TjBkT7ZPmLIsgXlZE1gccBFNbQgmUKRvqonuCE1W
/HX3vEF7dgDq4eb8XMBJio91Mkb7/NHKRtCJAWVJtXziYUFF3VNM0F9vcUqeBMmu
dMinAZw7IdnGv19gw60p9V8+jlEUrmNu97SwSTEeubUmew3TQGiIzEb04fd6EAZl
YSNty1SlPsnTgeHM5DWR9yCj3GfAaaLF/QiTLFVKCYKv6iJSBR7lsdORQE1i0WfA
11z7iNEHLzjUtidfdoWflpddE8vEwnS7pzD8m6R57LLLnRJg3q1Prsf5TSVNIOOx
MVOrwRTwREOzHkkvJcOUXI0HLvcFrHNa6AUSFTlEl9/p1bU/PaQ=
=ODVP
-----END PGP SIGNATURE-----

--Gvg2FxIOocZhrw57--
