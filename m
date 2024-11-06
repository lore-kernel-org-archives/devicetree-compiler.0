Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985EB13A26F
	for <devicetree-compiler@vger.kernel.org>; Wed,  6 Nov 2024 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730927794; cv=none; b=Jr/1ARuuNZx1igQ/wpOVjSzKyPCGZeiVUYdnt3Mmrb/f5LPRidFDCNWP6+3NvbrDTdvnopa8CKFE/XGg84umX3IeZLcsItYRE61Mxmm5ijmw3QlwW8vo+SwfUjDr+0dlkqy5BvYrXr1pNR9Iz1T0kqFQxcDA3MTnN6ecY3Gmf+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730927794; c=relaxed/simple;
	bh=kK6v9Vbb3JotqZXOrOjsreYnslu4tTmaULHAGZ0rJUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYignzP8x2VLS+W9t3QXKPfk6hJDFPghp2U8n50hw7/cjmvcEFlQaJD2I/cCRIPDaqJKLznb1jHM0RkPpL1qqErgEvIZfQk/UeppQtTdXc7fBPz+tA3t518ZXTgb6S6q33w/aokiR4r/PE+GfeuCdzh0YqvU4IHs+8fQ3yvXWKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=J96NltEI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="J96NltEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1730927783;
	bh=Ajnh1yOT8D+VnhjUpI8PM/cgbT2gz+sXynz0L1Z70vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J96NltEIzWAkPzdbnLe41wFi0zmmJ6344c4IN63nrIk1Oxzex6Ovn5JxDLIuLhWpj
	 XC37kjaNMUXDoXJL+PagR31IkWTYRY76yH4inFrL52R3idq27Sh1lpjaHvYK1e9WQY
	 18glK4zR63eyN10KO81y8sVBkyJgrXBelf3DrWZE/vwIgjYmt7MPSPg7pXxK/ov0kE
	 efyORyPrNR9KY4kEW+csKsUprcFvWfvLM+JxN2XMHM8tEjvLxsjRWjr6kG6yEYJx3n
	 UzmpNKybFVPdExlG6dP3lq/VHHgjzweFcXUcIvdH/WPVSWwgrr7+ZcC5j31AuaGpfe
	 dCDK+d1Nv5SAg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XkJ0l037wz4xFt; Thu,  7 Nov 2024 08:16:23 +1100 (AEDT)
Date: Thu, 7 Nov 2024 08:16:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] checks: Relax avoid_unnecessary_addr_size check to allow
 child ranges properties
Message-ID: <ZyvcnN0bMf9S-iL3@zatzit>
References: <20241025161307.3629901-1-p.zabel@pengutronix.de>
 <Zx75-Y1WfBran1nV@zatzit>
 <0d2ccf80d7cc8ba85ac379c99860bda02f29845c.camel@pengutronix.de>
 <ZyqwZzxn_45bLlK1@zatzit>
 <bd387296c82f0c649f70aa2189df8c9be1156742.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+kPLeSgrheh19MEp"
Content-Disposition: inline
In-Reply-To: <bd387296c82f0c649f70aa2189df8c9be1156742.camel@pengutronix.de>


--+kPLeSgrheh19MEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 02:23:33PM +0100, Philipp Zabel wrote:
> On Mi, 2024-11-06 at 10:55 +1100, David Gibson wrote:
> > On Mon, Nov 04, 2024 at 02:32:54PM +0100, Philipp Zabel wrote:
> > > On Mo, 2024-10-28 at 13:42 +1100, David Gibson wrote:
> > > > On Fri, Oct 25, 2024 at 06:13:07PM +0200, Philipp Zabel wrote:
> > > > > Do not fail the unnecessary #address-cells/#size-cells check if a=
ny
> > > > > children of the node have a "ranges" property.
> > > >=20
> > > > I think this is correct, but I had to think abuot it for a while,
> > > > because it's subtler than it looks.
> > > >=20
> > > > If there is no 'ranges' in the node itself, then the child devices'
> > > > address space is not mapped into the parent bus.  Of course, you can
> > > > still establish a local address space for them that (e.g.) could be
> > > > accessed indirectly via registers in this bridge device.
> > > >=20
> > > > Having a child device which acts as a bridge from this local address
> > > > to another subordinate address space, but no children with any
> > > > registers directly on the local bus seems odd... but it is logically
> > > > possible.
> > > >=20
> > > > Given the subtlety, it would be pretty nice to add an explanatory
> > > > comment about what this is check for and what some of the edge cases
> > > > are.
> > >=20
> > > Thank you. Can I steal your wording and add the following comment
> > > inside the for_each_child() loop:
> > >=20
> > >  /*
> > >   * Even if the child devices' address space is not mapped into
> > >   * the parent bus (no 'ranges' property on node), children can
> > >   * still have registers on a local bus, or map local addresses
> > >   * to another subordinate address space. The properties on the
> > >   * child nodes then make #address-cells/#size-cells necessary:
> > >   */
> >=20
> > Sure!
>=20
> Done in v2.
>=20
> > > The specific reason for this patch is a PCI device tree overlay [1]
> > > where the '#address-cells'/'#size-cells' properties are on the
> > > __overlay__ node and a child simple-bus node contains the 'ranges'
> > > property mapping between BAR space and the local bus.
> > >=20
> > > [1]
> > > https://lore.kernel.org/all/20241014124636.24221-2-herve.codina@bootl=
in.com/
> >=20
> > Hrm... two things strike me as suspicious about that example.
> >=20
> > 1) The __overlay__ node is the PCI bus root... which should already
> > have #address-cells and #size-cells in the base tree; it's PCI so
> > those values are known and standard.
>=20
> dtc doesn't know about this when compiling the overlay.
> Removing the #address-cells/#size-cells properties from the __overlay__
> node would cause these compiler warnings:
>=20
>   DTC     drivers/misc/lan966x_pci.dtbo
> ../drivers/misc/lan966x_pci.dtso:59.5-60.52: Warning (ranges_format): /fr=
agment@0/__overlay__/pci-ep-bus@0:ranges: "ranges" property has invalid len=
gth (40 bytes) (parent #address-cells =3D=3D 2, child #address-cells =3D=3D=
 1, #size-cells =3D=3D 1)
> ../drivers/misc/lan966x_pci.dtso:50.17-174.6: Warning (avoid_default_addr=
_size): /fragment@0/__overlay__/pci-ep-bus@0: Relying on default #address-c=
ells value
> ../drivers/misc/lan966x_pci.dtso:50.17-174.6: Warning (avoid_default_addr=
_size): /fragment@0/__overlay__/pci-ep-bus@0: Relying on default #size-cell=
s value

Ah, yeah, I realised that after I sent the mail.  That's the hackiness
of the overlay design showing itself again.  There's a limit to how
well the checks can work on an overlay alone - and even when it can
theoretically work, not all the checks have been written with that in
mind.  Duplicating the #address-cells in the overlay is a reasonable
workaround under the circumstances, but it's pretty ugly :(.

> > 2) The PCI<->simple-bus bridge must surely have at least the normal
> > configuration space registers, and so should have a 'reg' property as
> > well as 'ranges'.
>=20
> This I don't know about.
>=20
> > > > > Suggested-by: Rob Herring <robh@kernel.org>
> > > > > Link: https://lore.kernel.org/all/CAL_JsqKebRL454poAYZ9i=3DsCsHqG=
zmocLy0psQcng-79UWJB-A@mail.gmail.com/
> > > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > ---
> > > > >  checks.c | 10 +++-------
> > > > >  1 file changed, 3 insertions(+), 7 deletions(-)
> > > > >=20
> > > > > diff --git a/checks.c b/checks.c
> > > > > index 6e06aeab5503..76fdee2ed030 100644
> > > > > --- a/checks.c
> > > > > +++ b/checks.c
> > > > > @@ -1217,9 +1217,7 @@ WARNING(avoid_default_addr_size, check_avoi=
d_default_addr_size, NULL,
> > > > >  static void check_avoid_unnecessary_addr_size(struct check *c, s=
truct dt_info *dti,
> > > > >  					      struct node *node)
> > > > >  {
> > > > > -	struct property *prop;
> > > > >  	struct node *child;
> > > > > -	bool has_reg =3D false;
> > > > > =20
> > > > >  	if (!node->parent || node->addr_cells < 0 || node->size_cells <=
 0)
> > > > >  		return;
> > > > > @@ -1228,13 +1226,11 @@ static void check_avoid_unnecessary_addr_=
size(struct check *c, struct dt_info *d
> > > > >  		return;
> > > > > =20
> > > > >  	for_each_child(node, child) {
> > > > > -		prop =3D get_property(child, "reg");
> > > > > -		if (prop)
> > > > > -			has_reg =3D true;
> > > > > +		if (get_property(child, "reg") || get_property(child, "ranges"=
))
> > > > > +			return;
> > > > >  	}
> > > > > =20
> > > > > -	if (!has_reg)
> > > > > -		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells wit=
hout \"ranges\", \"dma-ranges\" or child \"reg\" property");
> > > > > +	FAIL(c, dti, node, "unnecessary #address-cells/#size-cells with=
out \"ranges\", \"dma-ranges\" or child \"reg\" property");
> > > >=20
> > > > ..also this message needs updating to reference child "ranges" as w=
ell.
> > >=20
> > > I'll change it to:
> > >=20
> > >   "unnecessary #address-cells/#size-cells without \"ranges\", \"dma-r=
anges\" or child \"reg\" or \"ranges\" property"
>=20
> Done in v2.
>=20
> regards
> Philipp
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+kPLeSgrheh19MEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmcr3JsACgkQzQJF27ox
2Gf+pBAAlBTOs0/SG4W4wP6r/v6vMfEUCxSPYLMCY1gW0tg9E7h7Kf/jk1bErIBq
1kvZ1XSZgKXhFGE1+L6LtInD4ZXkTbxrnyljTlMz6MlDpceC5lTinZAUb+h1VEKP
GP8Z+ICdBoxx6+iL/ttF4Ei18PRc7arOAU1tO9BYGO8wVxgYrFV/d+VX91uUGHeL
eIOAGmOo7FQfxpc6e0AwK/VwPHflTwDHdem6R79Xr1x0pca0xFC/as/PMzzysAzZ
zoGxMW78N5YNud+IdebNq26VBXODvusdmvsCkwvZNBJfPCoKZ/T70PcBrNCHAuyh
Vmj0GEBtL0TiaQJKxhEcIZDKdJXOT536khlXFDG6oyYi1wJaxVR/C5Wf5Hoo4581
TkwcZ9qjNqJkTVoDp08DB3xcfF9kWrmytdEcAXlVDikvHZogEKP0mOeSBBs82cSd
g1xsAqe6QEp7aQyV38/++9+SSYcAtBD1MXv7wy4ozPtmfN6l0LMXMzttMu0u3akd
Pov7LRG9sGP7DJTruxIkVw5U5FeZbq7Lqs+AxsO3Flppi6Khl+YZqOLe/QGBeh+x
tkI6kAHGT+MN98WvzzwRgjbCe5NiZMfdC/CdWKV0nxQWDBIeUL4Wg5KYI/gtquUI
m7zqzpJZ4xVxwsm7zp5BKoAxgC9O9LdoWqvZhcvfvR8x/Wu7BQc=
=sWTi
-----END PGP SIGNATURE-----

--+kPLeSgrheh19MEp--
