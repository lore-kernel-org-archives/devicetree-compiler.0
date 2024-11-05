Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29609149C53
	for <devicetree-compiler@vger.kernel.org>; Tue,  5 Nov 2024 23:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730850939; cv=none; b=iN+5UE93M6T1M+3kDJSx/RSWApsfVFtc0Ld1gadblAYaUrOtn3m+nmO6xxSNeLt4UJ6s8zRFFC4KWilCoN40T+2Xyjb/an8r1mUNswsBcasTkCxgSb+gQjlvyjsp/IH/L7srP6e9AOGIGVEDWjkp1EWfA+xkaujTeH0gtrSf7lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730850939; c=relaxed/simple;
	bh=bMJRl7KG4USR8A40j5J/8la2BKPE3+XZ8eGUrNrzBgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpQnQRYfD6ekM8P//Kms0FkfNCW691YbDeccFHL416C6j0A7WgaN05C+N+w7urMNzSTFBc2yBJaK3vBM34iiz1lBkTJ9ZZb0nYDLgH+FKmXaGWBtt+wP7zbboOogM0wRnOtwCjZX/VcGNdR0AY4wbt5LFpeC6sJjBLooOr8HOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ayIxSYkt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ayIxSYkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1730850924;
	bh=mzCP+REkSE4qNiSUT8ODNQF31XDK8QWQAjd1PsGoPXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ayIxSYktqlZVpX81iAz6BnrYK4XvGAJnUZEcDUFeeu/7LeAdKfLMikLLJ0Mfs0lhj
	 CpeHPbWWyNBm+m6xDbVVl4pKz2liR8UPNtjmg/k9z6t6PYX8/xXV7ZOcOwnRNlcoYm
	 LTZSGkxrrYrlanqYawbXA2+ZkqUBBivRmxgyfXrJohLQ3kadOX72xXBvOWrQhihZCC
	 ACkIiapZcKQ8Xw98vP0OfYISVrV5NkNY9/IAGpsQu15UJAXrDfwG7PGw8l4c/MY+oD
	 BflHm6xAWu5Gq20wE54mZzH1CejxdXr62eh9nw+aCe3KR4ro0/1DPZCEmSYVvjGcsP
	 hfF9b7aUbJaVg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XjlZh5Mbwz4x2J; Wed,  6 Nov 2024 10:55:24 +1100 (AEDT)
Date: Wed, 6 Nov 2024 10:55:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] checks: Relax avoid_unnecessary_addr_size check to allow
 child ranges properties
Message-ID: <ZyqwZzxn_45bLlK1@zatzit>
References: <20241025161307.3629901-1-p.zabel@pengutronix.de>
 <Zx75-Y1WfBran1nV@zatzit>
 <0d2ccf80d7cc8ba85ac379c99860bda02f29845c.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gGbWLS13b8lbcCYq"
Content-Disposition: inline
In-Reply-To: <0d2ccf80d7cc8ba85ac379c99860bda02f29845c.camel@pengutronix.de>


--gGbWLS13b8lbcCYq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 02:32:54PM +0100, Philipp Zabel wrote:
> On Mo, 2024-10-28 at 13:42 +1100, David Gibson wrote:
> > On Fri, Oct 25, 2024 at 06:13:07PM +0200, Philipp Zabel wrote:
> > > Do not fail the unnecessary #address-cells/#size-cells check if any
> > > children of the node have a "ranges" property.
> >=20
> > I think this is correct, but I had to think abuot it for a while,
> > because it's subtler than it looks.
> >=20
> > If there is no 'ranges' in the node itself, then the child devices'
> > address space is not mapped into the parent bus.  Of course, you can
> > still establish a local address space for them that (e.g.) could be
> > accessed indirectly via registers in this bridge device.
> >=20
> > Having a child device which acts as a bridge from this local address
> > to another subordinate address space, but no children with any
> > registers directly on the local bus seems odd... but it is logically
> > possible.
> >=20
> > Given the subtlety, it would be pretty nice to add an explanatory
> > comment about what this is check for and what some of the edge cases
> > are.
>=20
> Thank you. Can I steal your wording and add the following comment
> inside the for_each_child() loop:
>=20
>  /*
>   * Even if the child devices' address space is not mapped into
>   * the parent bus (no 'ranges' property on node), children can
>   * still have registers on a local bus, or map local addresses
>   * to another subordinate address space. The properties on the
>   * child nodes then make #address-cells/#size-cells necessary:
>   */

Sure!

> The specific reason for this patch is a PCI device tree overlay [1]
> where the '#address-cells'/'#size-cells' properties are on the
> __overlay__ node and a child simple-bus node contains the 'ranges'
> property mapping between BAR space and the local bus.
>=20
> [1]
> https://lore.kernel.org/all/20241014124636.24221-2-herve.codina@bootlin.c=
om/

Hrm... two things strike me as suspicious about that example.

1) The __overlay__ node is the PCI bus root... which should already
have #address-cells and #size-cells in the base tree; it's PCI so
those values are known and standard.

2) The PCI<->simple-bus bridge must surely have at least the normal
configuration space registers, and so should have a 'reg' property as
well as 'ranges'.


>=20
> > > Suggested-by: Rob Herring <robh@kernel.org>
> > > Link: https://lore.kernel.org/all/CAL_JsqKebRL454poAYZ9i=3DsCsHqGzmoc=
Ly0psQcng-79UWJB-A@mail.gmail.com/
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > >  checks.c | 10 +++-------
> > >  1 file changed, 3 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/checks.c b/checks.c
> > > index 6e06aeab5503..76fdee2ed030 100644
> > > --- a/checks.c
> > > +++ b/checks.c
> > > @@ -1217,9 +1217,7 @@ WARNING(avoid_default_addr_size, check_avoid_de=
fault_addr_size, NULL,
> > >  static void check_avoid_unnecessary_addr_size(struct check *c, struc=
t dt_info *dti,
> > >  					      struct node *node)
> > >  {
> > > -	struct property *prop;
> > >  	struct node *child;
> > > -	bool has_reg =3D false;
> > > =20
> > >  	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
> > >  		return;
> > > @@ -1228,13 +1226,11 @@ static void check_avoid_unnecessary_addr_size=
(struct check *c, struct dt_info *d
> > >  		return;
> > > =20
> > >  	for_each_child(node, child) {
> > > -		prop =3D get_property(child, "reg");
> > > -		if (prop)
> > > -			has_reg =3D true;
> > > +		if (get_property(child, "reg") || get_property(child, "ranges"))
> > > +			return;
> > >  	}
> > > =20
> > > -	if (!has_reg)
> > > -		FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without=
 \"ranges\", \"dma-ranges\" or child \"reg\" property");
> > > +	FAIL(c, dti, node, "unnecessary #address-cells/#size-cells without =
\"ranges\", \"dma-ranges\" or child \"reg\" property");
> >=20
> > ..also this message needs updating to reference child "ranges" as well.
>=20
> I'll change it to:
>=20
>   "unnecessary #address-cells/#size-cells without \"ranges\", \"dma-range=
s\" or child \"reg\" or \"ranges\" property"
>=20
>=20
> regards
> Philipp
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--gGbWLS13b8lbcCYq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmcqsGYACgkQzQJF27ox
2GcGLg/+JPbG7R8QLQ7HXrwJ19LXf/yzlRo3f9/eLDrqKlFW5lH4eVukyv0EdIM5
8MZSiPwUDUy37Ldz3gGjytjfyJLbw77YMEPNdXZWxXV4NBEyr1eg580KxoxUatL1
hbWni4WiOZqkmXrftMouqBGjv76Q3WIO2kvq77BN3twwjTtN5RkIopx7NForqyyq
yy86L96AlWTSfjcJmZ2083W8043lWcb+5dAmFn9TsA99MR9o4/zw5UJxGRABz+GE
nmH6mXInflfysY62yvwLnbiKypo0/iLNzYaI3HnbqCfFy1Xx4Hb0//b057Lr0X03
Vce0CzX8zBNTwt9Jcu3Ld4EfxosH62ybgnOsWE3QzwqdFN/965M0CHVIKh3ss+a+
jfWTEDwbQEWELHH5GmnPFRrC9zwI9U1KPy97k6sH9FIfJ3ZJZVZ8/iREt3qTjGpx
P96M5sO6I6FVO+6ZGWFdrz1ISKVPtmcoRGxoQrxvv+fltUvzigc2GUEO54DaUCAD
6lxh9N45enDQafgOdmKVcfTbhMCptirROiDOYGnk3nB70YKPA00gmBGqBsUemqXE
6Q3OgSo6O7i3ujv29UDECu7IE4D5IPWp1j7YsLaJNNeg5au/ud8dwB3CaEP+/flh
WYPrlcuWqlsINyEph8kRAWxZJVyCldNCjW+99mK8Ilnyui2Zi9w=
=LNgO
-----END PGP SIGNATURE-----

--gGbWLS13b8lbcCYq--
