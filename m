Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993992DB7BE;
	Thu, 29 Jan 2026 02:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769652052; cv=none; b=iGDOMbRtRd4tKEFzS2kMEOcq9Lev7Pb53vs7XsoFY8b7aL5Un6bmru7oIzaZCc/ugnna98igCWCPbxPS6wemBaFXRezRJb9yMMyy4F6ilGqtsSBM8R7LA6HJwGu4FvPHs7J1E+sD4cEEHNnPX1wmMmhv5YHi6Se+7J+wp7UT/Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769652052; c=relaxed/simple;
	bh=nlBPQ8ALeTVOwipEC/WRbuQcdpF/TTUlTAu5AvR1Who=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUfmqZ8oMfAVqPQVgCI77PcqBrAlpwdr9i60C7Px7RCKwIBLvajX+/5hxA5Ax/Qk2FNYtfkKqcZRvz0RIigqIr7uYY8bunGwv8BDPuLUbPSjHXU3hekwjJVZ6att9SqUcn+EjItks2ZBZlXSh0HZutYzwhKGL2ACkT48ciTHYDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=TQcrLVAJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="TQcrLVAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1769652032;
	bh=1zLwAWFbGoJecP4wRdYsYMU5lBB4+ssVZn0KQG2tUi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQcrLVAJa1mtk9c6G2rEaauBEvBvvHlb0abh4nxtyyx+TD9/F1ZzQJ3qBcCp9XuqX
	 q0NR6ondxPtGUhw+dkEbclERZwapznPOgOvsh0AwHVmxfp+frcXWudVGH9R+VXHScw
	 HOWfDHvDo1+mB8AllLe7IPTu/cCg13+uqg7mc/BkNj4OOGgj6XlUeWBiRe8BG3tZas
	 2Rcom6ThJLakwy86UUkZdNj+4sbWXmhqMZE5T7kw/E8oD8N1Ok3VlgLzgenBUe/X4V
	 KnF6z3/zSg7/xEMS/6R2GvY0EddfU6r7zPL2hZhHVV0cppoXKis5Yo24K0oWqBp47I
	 xHaS7NTq8tzeg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4f1j5r24y1z4wDK; Thu, 29 Jan 2026 13:00:32 +1100 (AEDT)
Date: Thu, 29 Jan 2026 12:36:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 29/77] Add support for FDT_EXPORT_SYM_REF dtb tag
Message-ID: <aXq5s-XdN79YzOHF@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-30-herve.codina@bootlin.com>
 <aWiIdpH0oG7H4fMZ@zatzit>
 <20260119164628.78f713bd@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w/oBFm/TrS5PBwNI"
Content-Disposition: inline
In-Reply-To: <20260119164628.78f713bd@bootlin.com>


--w/oBFm/TrS5PBwNI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 04:46:28PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 15 Jan 2026 17:25:58 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:19:19PM +0100, Herve Codina wrote:
> > > The FDT_EXPORT_SYM_REF dtb tag is similar to the FDT_EXPORT_SYM tag
> > > except that it identifies a reference to an external phandle. The node
> > > referenced by the phandle is not present in the device-tree blob.
> > >=20
> > > The FDT_EXPORT_SYM_REF dtb tag is a meta-data tag defining an exported
> > > symbol. It can be present in a node bloc meaning that a symbol is
> > > exported at this node level. The node pointed to by this symbol is no=
t a
> > > local node (i.e. the node is not present in the device-tree blob.). T=
his
> > > tag can be available only in overlay or addon device-tree blobs. The
> > > symbol has to be resolved when the device-tree blob is applied on top=
 of
> > > a base device-tree.
> > >=20
> > > It is followed by three values and a possible alignment padding:
> > >   - name (string including \0)
> > >       The export symbol name. I.e. the name used to reference this
> > >       exported symbol.
> > >   - padding:
> > >       Padding (0x00) added to have the next value aligned on 32bit.
> > >   - phandle (32bit)
> > >       A placeholder for a phandle value.
> > >       This placeholder can be used during some dtb manipulation to st=
ore
> > >       a temporary phandle value. =20
> >=20
> > Yuck.
>=20
> Will see what I can do to avoid this placeholder.
>=20
> I need to store the phandle value related to this symbol during the symbol
> resolution. This is done by addon_resolve_phandles() available in
> libfdt/fdt_addon.c in patch 70.
>=20
> libfdt is not designed to perform allocation to store temporary values. It
> manipulates data directly mapped from dtb working with offset in dtb blob
> without any other kind of object. No specific objects (C struct) for node,
> properties, markers, ...

I know. I designed it that way.

Tangent: I have thought that it might be useful to have a diffferent
dt library designed for non-flat trees - i.e. using allocations and
pointers to allow O(1) edits (as well as import/export to flat tree,
of course).  I think that would better suit some of the more complex
tree manipulation many things are doing these days.  I've never had
remotely enough time to look into it, but fwiw, I think the idea's
good.

> To have an area for this phandle value, a room reserved in dtb was really
> the easier way.
>=20
> But well, I understand your "yuck".

Yeah, I do realise that lack of free space to put things can make
things really tricky.  I hope we can find a way around this.

> I think it will be quite tricky to store this temporary phandle value
> without allocating some additional data.
>=20
> This placeholder simplified a lot of things but well, I think I need to f=
ind
> an other solution.
>=20
> If anyone has any ideas to store the temporary phandle value, I am all ea=
rs.
>=20
> Best regards,
> Herv=E9
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--w/oBFm/TrS5PBwNI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAml6ubIACgkQzQJF27ox
2Gf6txAApTuNovQCuo3a0InAgh9NA4ISvAJHfHNhG2S4L/gSGVKno3pzYs6+teT+
HUZCpaFVxkyr/TNXWkK9MeXvflQaAvHZrM4W1/H76TAjz34D2Fyi4MMkdV1V9LF0
JygynDvJH55Prklwv4wzBYUisbY9Ebj2c5OpC+9QwtZ50BeOhjFOYHWGjMLqBU7X
s/HQdkTEBTTwzFnM8okJVkAlIFl9/bLtZ3DrlQTlazkWf3y5jgGstyhSWG12O50l
YwT4iXpCrEjup2VmXVPINxmcJtyOz1vGb8+Dz9Ob5P5u6azmCktRGbndkSHXttHO
5foLkTBIthcoFHQi4Ii1FXDfq/1pgf9R2MMDL8u7CMnAP1XzWW7e5HAG+izr1mH2
T1m3KYkudlUOqOzmb34BTvnF6jDuU3LBXoNIR3TQEUOv4kmPLZkYPHdbGXOEnbqc
WmFyqiZIMRkXPwHKfZ1ioNkKZHUtXvDdXffLxkKFtgngYbBOxkqCd7KfGsxQNowS
QTaqnBtZZzvTimuOF/2dC3dTswVB5Ry8Hb/uBioYrSITIzXlWg5jRsk7Dlu6+X29
tdeSa24F99WyGyiAT9sOy7G2og7uFfhkcZAcyN3euN6toFhJtjILCrSd7p4izwoU
+0g3uFqeEppkxPAm6uYl7mNGvPYr5gNuzPFRX6WCoKtdyfvnrkw=
=3B3y
-----END PGP SIGNATURE-----

--w/oBFm/TrS5PBwNI--
