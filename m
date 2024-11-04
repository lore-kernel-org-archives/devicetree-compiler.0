Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004911C4A0E
	for <devicetree-compiler@vger.kernel.org>; Mon,  4 Nov 2024 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730727181; cv=none; b=hF6HK7OLBpAj+0WwhID3POjjV1HhwWgawcd4LBxmAk9DOuXDnn0s5Mfo6dkMSu7eATLebkJjJubwtt1nuzekielsD9WgGR7Od90MQ4Z2QL6jx20gOxOl/7kzdtg14YlLDMsfpCA7sQGez3eYZ3Y/ckXQZ1DffS9s4OdMT5NVV2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730727181; c=relaxed/simple;
	bh=FoeBESgRZkZSO6+e5IedKmhNhyHKpDcm6CqXIaS/lGg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gbEd/6oUtzsen9Qwy8dLbUTyAcTGLByWA5+TTD52gcuCU2+OCdoKBpaCAcaUKoSvoSBL8m7RRfgqyA7sVjG9zFe1FnOFv47Fb97IByWf81RV3HknW/yFyKWBoi8EFXJ1CNlNM8lwHJ8XLXVoVb7QM4b7lXH7vJTHw4d3K6Y/gVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t7xCR-0003OU-Vr; Mon, 04 Nov 2024 14:32:56 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t7xCQ-001zSg-14;
	Mon, 04 Nov 2024 14:32:54 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t7xCQ-000E61-0s;
	Mon, 04 Nov 2024 14:32:54 +0100
Message-ID: <0d2ccf80d7cc8ba85ac379c99860bda02f29845c.camel@pengutronix.de>
Subject: Re: [PATCH] checks: Relax avoid_unnecessary_addr_size check to
 allow child ranges properties
From: Philipp Zabel <p.zabel@pengutronix.de>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>
Date: Mon, 04 Nov 2024 14:32:54 +0100
In-Reply-To: <Zx75-Y1WfBran1nV@zatzit>
References: <20241025161307.3629901-1-p.zabel@pengutronix.de>
	 <Zx75-Y1WfBran1nV@zatzit>
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

On Mo, 2024-10-28 at 13:42 +1100, David Gibson wrote:
> On Fri, Oct 25, 2024 at 06:13:07PM +0200, Philipp Zabel wrote:
> > Do not fail the unnecessary #address-cells/#size-cells check if any
> > children of the node have a "ranges" property.
>=20
> I think this is correct, but I had to think abuot it for a while,
> because it's subtler than it looks.
>=20
> If there is no 'ranges' in the node itself, then the child devices'
> address space is not mapped into the parent bus.  Of course, you can
> still establish a local address space for them that (e.g.) could be
> accessed indirectly via registers in this bridge device.
>=20
> Having a child device which acts as a bridge from this local address
> to another subordinate address space, but no children with any
> registers directly on the local bus seems odd... but it is logically
> possible.
>=20
> Given the subtlety, it would be pretty nice to add an explanatory
> comment about what this is check for and what some of the edge cases
> are.

Thank you. Can I steal your wording and add the following comment
inside the for_each_child() loop:

 /*
  * Even if the child devices' address space is not mapped into
  * the parent bus (no 'ranges' property on node), children can
  * still have registers on a local bus, or map local addresses
  * to another subordinate address space. The properties on the
  * child nodes then make #address-cells/#size-cells necessary:
  */

The specific reason for this patch is a PCI device tree overlay [1]
where the '#address-cells'/'#size-cells' properties are on the
__overlay__ node and a child simple-bus node contains the 'ranges'
property mapping between BAR space and the local bus.

[1] https://lore.kernel.org/all/20241014124636.24221-2-herve.codina@bootlin=
.com/

> > Suggested-by: Rob Herring <robh@kernel.org>
> > Link: https://lore.kernel.org/all/CAL_JsqKebRL454poAYZ9i=3DsCsHqGzmocLy=
0psQcng-79UWJB-A@mail.gmail.com/
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  checks.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/checks.c b/checks.c
> > index 6e06aeab5503..76fdee2ed030 100644
> > --- a/checks.c
> > +++ b/checks.c
> > @@ -1217,9 +1217,7 @@ WARNING(avoid_default_addr_size, check_avoid_defa=
ult_addr_size, NULL,
> >  static void check_avoid_unnecessary_addr_size(struct check *c, struct =
dt_info *dti,
> >  					      struct node *node)
> >  {
> > -	struct property *prop;
> >  	struct node *child;
> > -	bool has_reg =3D false;
> > =20
> >  	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
> >  		return;
> > @@ -1228,13 +1226,11 @@ static void check_avoid_unnecessary_addr_size(s=
truct check *c, struct dt_info *d
> >  		return;
> > =20
> >  	for_each_child(node, child) {
> > -		prop =3D get_property(child, "reg");
> > -		if (prop)
> > -			has_reg =3D true;
> > +		if (get_property(child, "reg") || get_property(child, "ranges"))
> > +			return;
> >  	}
> > =20
> > -	if (!has_reg)
> > -		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \=
"ranges\", \"dma-ranges\" or child \"reg\" property");
> > +	FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without \"=
ranges\", \"dma-ranges\" or child \"reg\" property");
>=20
> ..also this message needs updating to reference child "ranges" as well.

I'll change it to:

  "unnecessary #address-cells/#size-cells without \"ranges\", \"dma-ranges\=
" or child \"reg\" or \"ranges\" property"


regards
Philipp
