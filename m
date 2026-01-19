Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C410C33032C;
	Mon, 19 Jan 2026 05:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768801220; cv=none; b=AgWyW2wl/2QYvdAE6vq7fHz5zkZG4ga5a2nEDu/yDZLWQ3NvbHhtqyymybF1uXfSwqGqM+pbNGbJSDWJ/JkdfB8TSAur1NV96JaTeQv2f5ESe33EDNRxHWzJ+28PMFJhTvCYWMLiVbYEPKBa8w6qSZ/ejibM8g2NLKYu+rB4pQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768801220; c=relaxed/simple;
	bh=excy1rnv52J83+N3FvRj7PGZlRiYDcbj7MzAUVVaW9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6BtATBVm6i290MZ/lpob0UXPGTkynY/d5JYP0W5iLsAZoIfU2A0bJFtMbMZggNzJP/Po++PnSQDD5alhS0NnMJDN5X0K9jcGo83AujWpxq0oqrN8wneDtz32CMvwp+6X3Qr6ofiFHGMqrLvMrlFu3dd/oespGkO2haAnhfO2xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=hfqSInXm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="hfqSInXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768801217;
	bh=NjhVmNU3/+niGPdkObNbjYgINOICOnB6cf36QexXmw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfqSInXmFYvpKqIyTFFnByFQXfMxNmXovAmkTUfLkPWD5jvRpr61td7FOf/A7T0Jk
	 e9GWD5uLrOcxFTeXJGL2wqgOxhehtjbdTQotYpyVd18nBiCV2NKVSFWeYvx4RqzLWz
	 eZxasXvyhUB5W+7Sk9WadpcbcK2ezySZIgLNZmoy1UGpCBliLecF/CNcV+S6N6+xNS
	 e2WI+dksl4eFbHEpDQEm7n0ESdmwhbIkWTjVR6VR85f78pvuvgZLB8dCOe0JvZJ++7
	 OpQ3Js4iJuCtLkRCqR9gjQuvU+WGwgMzGYweagiuvpimLaHHApj8AvZJMPsXd1+2bu
	 Pjust5aZK5CZg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dvfS121Ljz4wCJ; Mon, 19 Jan 2026 16:40:17 +1100 (AEDT)
Date: Mon, 19 Jan 2026 16:40:12 +1100
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
Subject: Re: [RFC PATCH 11/77] Add support for FDT_REF_PHANDLE dtb tag
Message-ID: <aW3DvDooCXxw83Av@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-12-herve.codina@bootlin.com>
 <aWhB4fYnXCD2f6Uq@zatzit>
 <20260116161727.7fe14658@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/MUN3licvuVFybRr"
Content-Disposition: inline
In-Reply-To: <20260116161727.7fe14658@bootlin.com>


--/MUN3licvuVFybRr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 04:17:27PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Thu, 15 Jan 2026 12:24:49 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:19:01PM +0100, Herve Codina wrote:
> > > The FDT_REF_PHANDLE dtb tag is similar to the FDT_REF_LOCAL tag except
> > > that it identifies a reference to an external phandle. The node
> > > referenced by the phandle is not present in the device-tree blob. =20
> >=20
> > The names FDT_REF_PHANDLE and FDT_REF_LOCAL are perhaps a little
> > misleading - both are marking a phandle, the difference is in the form
> > of reference.  That's quite difference from the distinction between
> > the REF_PHANDLE and REF_PATH marker types, where the difference is in
> > what the reference expands to in the property.
>=20
> I am agree.
>=20
> FDT_PHANDLE: A local phandle with the value known.
> FDT_PHANDLE_REF: An external phandle, its value need to be resolved ?

Yeah, I think that works.

> This is aligned with FDT_EXPORT_SYM / FDT_EXPORT_SYM_REF.
>=20
> Or maybe:
> FDT_TYPE_PHANDLE
> FDT_TYPE_PHANDLE_REF
>=20
> "TYPE" has been mentioned by Rob in the "FDT_TYPE_U32" context.

I don't especially like this.  phandles do have a bearing on types.
But as I said to Rob, I think they're a sufficiently special case,
that I'd prefer not to handle them as just an aspect of a more general
"types" system.

Btw, since we're looking at dtb changes anyway, one possibility would
be to no longer encode a node's phandle as a property, but include it
as a new field in the FDT_BEGIN_NODE tag.  Putting it in a property
was always a bit of a hack - in traditional OF, it was generally the
node's address in memory, not something from a property.  Doing it
that way might side step some messy edge cases like dealing with
improperly encoded "linux,phandle" properties.

> Any other ideas are welcome.
>=20
> > > The FDT_REF_PHANDLE dtb tag is a meta-data tag attached to a property.
> > >=20
> > > It indicates that the property defined before this tag (FDT_PROP) use=
s a
> > > phandle value and the node related to this phandle value is not local
> > > node (i.e. the node is not present in the device-tree blob). This tag
> > > can be available only in overlay or addon device-tree blobs. The phan=
dle
> > > value used in the property has to be resolved when the device-tree bl=
ob
> > > is applied on top of a base device-tree. =20
> >=20
> > This is kind of looking ahead, but does that imply that this tag is
> > only valid in addon dtbs?
>=20
> addon dtbs for sure but also overlay (plugin) dtbs.

I don't really understand how they would be used for plugins - I
thought the idea was that addons would more or less obsolete plugins.

> >=20
> > > It is followed by two values and a possible alignment padding:
> > >  - offset (32bit):
> > >      Offset in the property data where the phandle is available.
> > >  - label (string including \0):
> > >      The label to use to resolve the phandle value. =20
> >=20
> > I expect it will become apparent later in the series, but it would be
> > helpful to clarify what the scope of that label is.  A single node?
> > The whole tree?  Across a tree and all its possible addons?
>=20
> This label is the unresolved reference. Its scope is the dtb.

"the dtb" being a single addon, yes?  That could have several meanings
in the base tree depending on where the addon is attached, yes?

> For instance, "prop =3D < 0 1 &foo>;" in a dts with the node referenced by
> &foo not present in this dts (possible for addons and plugins) will lead
> to 'FDT_REF_PHANDLE 8 "foo"'
>=20
> The way "foo" is used when the dtb is applied is covered later in the
> series.
>=20
> It will be resolved with import/export mechanism (when the addon is
> applied).
>=20
> Also it can be a namespace label reference (see patch 66 for the definiti=
on
> of namespace label reference) and here also it will be resolved thanks to
> import/export mechanism. Namespace label references can only be present in
> addons.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--/MUN3licvuVFybRr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmltw7sACgkQzQJF27ox
2GcD9xAAoReg+P0Hi/2MMiY6qh8QyYTYjaZFYc4aNDRl1DJcRvH5rBMxaEqSmzBc
ruN4FZz41S6lBBZr0mroTTH60Q9kMFFfrffON7oO1+7SX0Adbny8thr2c8OoR3zc
swnWHUzDauJIMtAV6QMqbDHScRUzzIhPWiXwxH3PDMUIa90Vn4iHrl2cfF/d8dZY
oF6Vx0613Gh6zhvShIDjwkJn+Zvf73mpskwTLwlWmHgkgRJVxTT/UUin+miv/rGj
dQ5BiFryT3cCzvF6ACrsU85EVNMsXAgFFWB7adR+ayAeSDgH1fWjmXm59CnM2Dlk
gqOwY9Kee46psH1nbDdrzAmMhnLIu2r+jaMXbzKRykUiWcl9tkCF1mWaUIZKOwxw
oY063s23db8wrVHnjXrNyKSWZ4+PW6gtEYRKPT+3HgdPQTNauuU8FQXpYv2oZShp
JeRisxnrqDYwa/ZCcuOv/z2+25CqG2Hn3G2e5KZ5QVCJmE2arxUqhOerbG6lIFER
gW1nkKnC1UK7RnmcKI4+4ndXXuo5reTjrNY3UXbtqezoMOvYxYqVUp2IMCPblb1I
SsmZzSfY2TScjLX8el2wZvpqke4VPGRzje8q5zOmRTf33Dc+sga4/CdTONOTS7V0
Mf4odIokAoGOS7Z5KQOZAZlg3gLJPV1HwAAj0IQ11MhlvG7RtYY=
=R9E7
-----END PGP SIGNATURE-----

--/MUN3licvuVFybRr--
