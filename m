Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54DE13AD11
	for <devicetree-compiler@vger.kernel.org>; Wed,  6 Nov 2024 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730899418; cv=none; b=JFO5LuwAIsp9UPocB3qoT9AfAVfSEQ/T1H8MuORBkmwCcwAAmpP92qZmCj/1emRLeJR2mdiKZodR27BYHQlA6HIM3rYVYmDmGIcyKA2xrsWdU8QRWVsxnp7LwxVcPIqNNffDvS0Hp1pwfMRx6taAcH5gCowdOWK5TN25+PDU1So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730899418; c=relaxed/simple;
	bh=oIY+sNpq4QZposy19q7JYgEBwwYYqWj0MSPLSeRfwJQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n6I9UHQpuOfwGttBvFEtaQSn6+3mKNlsl+KVGEvKC42pqbQINzO3IZTskeBKiyiIHQxIqYF3Ypu4TSPJ0PoiNzALSZafwN8eNKClJvJxRLm3+lH9FyfU+pB5zBOYsTusqoCnkOEdEJVAw6Jx13TMgV46CSf4WSSCxKbVQ9X0/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t8g0U-0007Ne-5T; Wed, 06 Nov 2024 14:23:34 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t8g0T-002JBz-2v;
	Wed, 06 Nov 2024 14:23:33 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t8g0T-0009L0-2i;
	Wed, 06 Nov 2024 14:23:33 +0100
Message-ID: <bd387296c82f0c649f70aa2189df8c9be1156742.camel@pengutronix.de>
Subject: Re: [PATCH] checks: Relax avoid_unnecessary_addr_size check to
 allow child ranges properties
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>
Date: Wed, 06 Nov 2024 14:23:33 +0100
In-Reply-To: <ZyqwZzxn_45bLlK1@zatzit>
References: <20241025161307.3629901-1-p.zabel@pengutronix.de>
	 <Zx75-Y1WfBran1nV@zatzit>
	 <0d2ccf80d7cc8ba85ac379c99860bda02f29845c.camel@pengutronix.de>
	 <ZyqwZzxn_45bLlK1@zatzit>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree-compiler@vger.kernel.org

On Mi, 2024-11-06 at 10:55 +1100, David Gibson wrote:
> On Mon, Nov 04, 2024 at 02:32:54PM +0100, Philipp Zabel wrote:
> > On Mo, 2024-10-28 at 13:42 +1100, David Gibson wrote:
> > > On Fri, Oct 25, 2024 at 06:13:07PM +0200, Philipp Zabel wrote:
> > > > Do not fail the unnecessary #address-cells/#size-cells check if any
> > > > children of the node have a "ranges" property.
> > >=20
> > > I think this is correct, but I had to think abuot it for a while,
> > > because it's subtler than it looks.
> > >=20
> > > If there is no 'ranges' in the node itself, then the child devices'
> > > address space is not mapped into the parent bus.  Of course, you can
> > > still establish a local address space for them that (e.g.) could be
> > > accessed indirectly via registers in this bridge device.
> > >=20
> > > Having a child device which acts as a bridge from this local address
> > > to another subordinate address space, but no children with any
> > > registers directly on the local bus seems odd... but it is logically
> > > possible.
> > >=20
> > > Given the subtlety, it would be pretty nice to add an explanatory
> > > comment about what this is check for and what some of the edge cases
> > > are.
> >=20
> > Thank you. Can I steal your wording and add the following comment
> > inside the for_each_child() loop:
> >=20
> >  /*
> >   * Even if the child devices' address space is not mapped into
> >   * the parent bus (no 'ranges' property on node), children can
> >   * still have registers on a local bus, or map local addresses
> >   * to another subordinate address space. The properties on the
> >   * child nodes then make #address-cells/#size-cells necessary:
> >   */
>=20
> Sure!

Done in v2.

> > The specific reason for this patch is a PCI device tree overlay [1]
> > where the '#address-cells'/'#size-cells' properties are on the
> > __overlay__ node and a child simple-bus node contains the 'ranges'
> > property mapping between BAR space and the local bus.
> >=20
> > [1]
> > https://lore.kernel.org/all/20241014124636.24221-2-herve.codina@bootlin=
.com/
>=20
> Hrm... two things strike me as suspicious about that example.
>=20
> 1) The __overlay__ node is the PCI bus root... which should already
> have #address-cells and #size-cells in the base tree; it's PCI so
> those values are known and standard.

dtc doesn't know about this when compiling the overlay.
Removing the #address-cells/#size-cells properties from the __overlay__
node would cause these compiler warnings:

  DTC     drivers/misc/lan966x_pci.dtbo
../drivers/misc/lan966x_pci.dtso:59.5-60.52: Warning (ranges_format): /frag=
ment@0/__overlay__/pci-ep-bus@0:ranges: "ranges" property has invalid lengt=
h (40 bytes) (parent #address-cells =3D=3D 2, child #address-cells =3D=3D 1=
, #size-cells =3D=3D 1)
../drivers/misc/lan966x_pci.dtso:50.17-174.6: Warning (avoid_default_addr_s=
ize): /fragment@0/__overlay__/pci-ep-bus@0: Relying on default #address-cel=
ls value
../drivers/misc/lan966x_pci.dtso:50.17-174.6: Warning (avoid_default_addr_s=
ize): /fragment@0/__overlay__/pci-ep-bus@0: Relying on default #size-cells =
value

> 2) The PCI<->simple-bus bridge must surely have at least the normal
> configuration space registers, and so should have a 'reg' property as
> well as 'ranges'.

This I don't know about.

> > > > Suggested-by: Rob Herring <robh@kernel.org>
> > > > Link: https://lore.kernel.org/all/CAL_JsqKebRL454poAYZ9i=3DsCsHqGzm=
ocLy0psQcng-79UWJB-A@mail.gmail.com/
> > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > ---
> > > >  checks.c | 10 +++-------
> > > >  1 file changed, 3 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/checks.c b/checks.c
> > > > index 6e06aeab5503..76fdee2ed030 100644
> > > > --- a/checks.c
> > > > +++ b/checks.c
> > > > @@ -1217,9 +1217,7 @@ WARNING(avoid_default_addr_size, check_avoid_=
default_addr_size, NULL,
> > > >  static void check_avoid_unnecessary_addr_size(struct check *c, str=
uct dt_info *dti,
> > > >  					      struct node *node)
> > > >  {
> > > > -	struct property *prop;
> > > >  	struct node *child;
> > > > -	bool has_reg =3D false;
> > > > =20
> > > >  	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0=
)
> > > >  		return;
> > > > @@ -1228,13 +1226,11 @@ static void check_avoid_unnecessary_addr_si=
ze(struct check *c, struct dt_info *d
> > > >  		return;
> > > > =20
> > > >  	for_each_child(node, child) {
> > > > -		prop =3D get_property(child, "reg");
> > > > -		if (prop)
> > > > -			has_reg =3D true;
> > > > +		if (get_property(child, "reg") || get_property(child, "ranges"))
> > > > +			return;
> > > >  	}
> > > > =20
> > > > -	if (!has_reg)
> > > > -		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells witho=
ut \"ranges\", \"dma-ranges\" or child \"reg\" property");
> > > > +	FAIL(c, dti, node, "unnecessary #address-cells/#size-cells withou=
t \"ranges\", \"dma-ranges\" or child \"reg\" property");
> > >=20
> > > ..also this message needs updating to reference child "ranges" as wel=
l.
> >=20
> > I'll change it to:
> >=20
> >   "unnecessary #address-cells/#size-cells without \"ranges\", \"dma-ran=
ges\" or child \"reg\" or \"ranges\" property"

Done in v2.

regards
Philipp
