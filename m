Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792990316;
	b=aJ/rBMCusHBW6JiIp6jgF5Ay1YwZQmazZFLaYebQXGfsPkGmpOTlfi60Ryd/BOf9gXZ6
	 pBOQhN1t9o2Shi/rd/Hdy4W7Gn7BHdLzYND9mhqbFFCgFEmq4xqPwWHcHYYm9LLOYLAyp
	 Ttqz4OPNczL38NbVn6lgcEt4BNIIrpSXV3Mj3c4mfx16tX10fn4Abp6MwR0uPUUozxu+u
	 aNl6514/4p6ePjefjGQeDmf1z2B1w437bmPBao5liDDJYAM+TGkAXIlw1/TtPOLIEh8gM
	 Dp0IZ/zJ8fr9gTmXW+XmYcK+UMZTPV4vuuqqKrpHTCBTBhYlvBfLOnGP8ew8MkLIkMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990316;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=CHthpTQQZ9sGbZv3eMYNrP/2BiwvzD4xW9hS+MDiu4E=;
	b=NH6zL0YqpfcRmqgPJlr6UOdm9SzDK7Hbjj1705ZqBaK1SItqtYF5qUY8KbKU8Mbw/XXp
	 f1dQSiPmak8Q2Yffnr/Wvf1fCuwD2uJB8LXE/q29uuQBKNgfzBuwU+9ByFIovyf1Xsn7t
	 fRybP0xzca63BORCcpqBiCbkuf8b7bRarZ5jMUShBrj0Hdq/urkDKKeaKhRUEG2ALZCbI
	 bK7ey3hET6PFIqygHaQr6G0K0Zvhhvr0VmvJoxQsaM9qMAObooa6gV4eB3g9C1w+9XXdb
	 QJ+yC/hVMPiL0fIxRSow5gL47xidsjYhykjCBfEm9Qd6wQMbfD8v4dE9HCMpHhLpdCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=nqcQH6qO;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287A4606A320;
	Mon, 26 Oct 2026 04:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287A4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=nqcQH6qO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792990301;
	bh=CHthpTQQZ9sGbZv3eMYNrP/2BiwvzD4xW9hS+MDiu4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqcQH6qOHu80jttG8Gxn8wYoMCh+xxT1PzhNjXc+0GaPX6w6HWo9LoPcE0O/YXarS
	 l6LQID6yIc8feO+6wUBvb1wfv9ZF9WrZEls/UKzSWDo6cx7rJMCyUZr6XMWGQRgb19
	 FF9bXOFxhGSXreA2ZVm2W2uF8s2Etuu72wbq4pMXGsbeIOUkK+IZZ4++jOrv4eC3WL
	 51rEjqAOC2lSBYdUfTKQ2WHD0la0uwGi0M/m1vZFZ/rUDgNF3us20iQAxgiUrCKzk6
	 SVRCvmFA8CVh5rAC0PI9tgkv/bjReo4LfeEkKari0fwJ8+M3CSe3kMYw0f5p4J0BrY
	 HOOTk8h/0d3bQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jCh6j3hQKz4wCC; Mon, 26 Oct 2026 15:51:41 +1100 (AEDT)
Date: Mon, 26 Oct 2026 12:33:51 +1100
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
Message-ID: <at6t-l9XYYFfS48T@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-9-herve.codina@bootlin.com>
 <atrTn_I_8O6q9QUW@gractus.seuss>
 <20261023181533.0c44a57f@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="U416GTGFp8OvSBTQ"
Content-Disposition: inline
In-Reply-To: <20261023181533.0c44a57f@bootlin.com>

--U416GTGFp8OvSBTQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 06:15:33PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Fri, 23 Oct 2026 14:25:29 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 11:48:37AM +0200, Herve Codina wrote:
> > > get_node_by_phandle() allows to get a node based on its phandle value.
> > > It checks the phandle value against value available in internal node
> > > structure.
> > >=20
> > > This internal phandle value is updated during process_check() and so,
> > > get_node_by_phandle() cannot give correct results before the
> > > process_check() call.
> > >=20
> > > Improve get_node_by_phandle() to look at node phandle properties when
> > > the internal phandle value is not valid.
> > >=20
> > > This allows to return a correct matching node even if process_check()
> > > was not called yet. =20
> >=20
> > The idea is sound - it's always been kind of clunky that we need the
> > process_checks() pass to fill the phandles before we can use them.
> > But, there's at least one significant catch:
> >=20
> > [Aside: you might notice the way it's done violates the principle I
> >  stated elsewhere of avoiding structures where you must know where you
> >  are in the flow to know which parts are populated.  My type
> >  discipline has improved since I first wrote this code :)]
> >=20
> > We need to gracefully handle the case of malformed phandle /
> > linux,phandle properties; that's actually the reason for the weird
> > placement of this in checks.c.  By treating it as a "check" we handle
> > this case by failing the check.  Other checks that rely on phandles
> > then have the 'explicit_phandles' check as a prereq so they don't need
> > to verify this again.  We can still report errors for other checks
> > that don't rely on that (which is the whole point of the checks
> > mechanism).
> >=20
> > That's not the only way to do it, of course, but we need something to
> > check for that error case.  Further notes on the code.
> >=20
> > > With the recently introduced FDT_PROPDATA_HANDLE dtb tag, this will be
> > > needed to update internal phandle references before the call to
> > > process_check(). Indeed, this tag allows to identify phandles and
> > > internal references need to be updated based on the phandle value bef=
ore
> > > the process_check() call.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  livetree.c | 21 ++++++++++++++++++++-
> > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/livetree.c b/livetree.c
> > > index abe73de1..a9f8c5d2 100644
> > > --- a/livetree.c
> > > +++ b/livetree.c
> > > @@ -628,16 +628,35 @@ struct node *get_node_by_label(struct node *tre=
e, const char *label)
> > >  	return NULL;
> > >  }
> > > =20
> > > +static cell_t get_node_phandle_existing(struct node *node)
> > > +{
> > > +	struct property *prop;
> > > +
> > > +	if (phandle_is_valid(node->phandle))
> > > +		return node->phandle;
> > > +
> > > +	prop =3D get_property(node, "phandle");
> > > +	if (!prop) {
> > > +		prop =3D get_property(node, "linux,phandle");
> > > +		if (!prop)
> > > +			return 0;
> > > +	}
> > > +
> > > +	return propval_cell(prop); =20
> >=20
> > In the case of a malformed property, this could SEGV.
>=20
> Ok, will update to
> --- 8< ---
> 	if (prop->val.len !=3D sizeof(cell_t))
> 		return 0;
>=20
> 	return propval_cell(prop)
> --- 8< ---
>=20
> >=20
> > > +}
> > > +
> > >  struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
> > >  {
> > >  	struct node *child, *node;
> > > +	cell_t tree_phandle;
> > > =20
> > >  	if (!phandle_is_valid(phandle)) {
> > >  		assert(generate_fixups);
> > >  		return NULL;
> > >  	}
> > > =20
> > > -	if (tree->phandle =3D=3D phandle) {
> > > +	tree_phandle =3D get_node_phandle_existing(tree); =20
> >=20
> > This means that every time we search for a phandle, for every node
> > scanned before the destination with no phandle, we do a full property
> > scan to check that no, it still doesn't have a phandle.
> >=20
> > I don't care that much about dtc performance, but that's still a bit
> > much to swallow.  I think we need to cache negative lookups to avoid
> > that.  Happily, since there are two invalid phandle values this
> > shouldn't be too hard.  We could, say, use tree->phandle =3D=3D 0 to me=
an
> > we don't know if there's a phandle, and tree->phandle =3D=3D -1 to mean
> > we've scanned the properties and we know there isn't one.
> >=20
> > In fact, caching property lookups might be the better way to do this.
> > Rather than having an explicit pass where tree->phandle is populated,
> > we could have get_node_by_phandle() cache its property scan (success
> > or failure) in tree->phandle.
> >=20
> > I think that's a more elegant approach than the current one, but we do
> > still need to handle the malformed property case.
>=20
> Well, get_node_phandle_existing() can be improved:
> ---- 8< ----
> static cell_t get_node_phandle_existing(struct node *node)
> {
> 	cell_t phandle1, phandle2;
> 	struct property *prop1, *prop2;
>=20
> 	if (phandle_is_valid(node->phandle))
> 		return node->phandle;
> 	if (node->phandle =3D=3D ~0UL) {
> 		/*
> 		 * We've already looked at existing properties and no valid
> 		 * phandle value were present. Avoid looking at them again
> 		 * and just return the invalid phandle value.
> 		 */
> 		return 0;
> 	}
>=20
> 	/* Try to get it from the 'phandle' property */
> 	phandle1 =3D 0; /* Assume invalid */
> 	prop1 =3D get_property(node, "phandle");
> 	if (prop1) {
> 		if (prop1->val.len =3D=3D sizeof(cell_t))
> 			phandle1 =3D propval_cell(prop1); /* Well formed -> Get it */
> 	}
>=20
> 	/* Try to get it from the 'linux,phandle' property */
> 	phandle2 =3D 0; /* Assume invalid */
> 	prop2 =3D get_property(node, "linux,phandle");
> 	if (prop2) {
> 		if (prop2->val.len =3D=3D sizeof(cell_t))
> 			phandle2 =3D propval_cell(prop2); /* Well formed -> Get it */
> 	}
>=20
> 	if (prop1 && prop2) {
> 		/*
> 		 * Both property are present. They values must be the same
> 		 * and valid.
> 		 */
> 		if (phandle1 =3D=3D phandle2) && phandle_is_valid(phandle1)) {
> 			/* Ok, Cache this correct phandle value and return it */
> 			node->phandle =3D phandle1;
> 			return phandle1;
> 		}
> 	} else if (prop1) {
> 		/*
> 		 * Only the 'phandle' property is present.
> 		 * Check its value validity
> 		 */
> 		if (phandle_is_valid(phandle1)) {
> 			/* Ok, Cache this correct phandle value and return it */
> 			node->phandle =3D phandle1;
> 			return phandle1;
> 		}
> 	} else if (prop2) {
> 		/*
> 		 * Only the 'linux,phandle' property is present.
> 		 * Check its value validity
> 		 */
> 		if (phandle_is_valid(phandle2)) {
> 			/* Ok, Cache this correct phandle value and return it */
> 			node->phandle =3D phandle2;
> 			return phandle2;
> 		}
> 	}
>=20
> 	/*
> 	 * No valid phandle value were found. Cache this information and return
> 	 * the invalid phandle value.
> 	 */
> 	node->phandle =3D=3D ~0UL;
> 	return 0;
> }
> --- 8< ---

That looks good to me.  But the "existing" in the name no longer says
anything useful - this can be the standard way to get a node's
phandle.  In fact it might be worth changing the name of the
node->phandle field to make sure we don't have any stale users rather
than going through the get_phandle() function.

> In get_node_by_phandle(), no change compared to my proposition and so the
> full function is:
> --- 8< ---
> struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
> {
>         struct node *child, *node;
>         cell_t tree_phandle;
>=20
>         if (!phandle_is_valid(phandle)) {
>                 assert(generate_fixups);
>                 return NULL;
>         }
>=20
>         tree_phandle =3D get_node_phandle_existing(tree);
>         if (phandle_is_valid(tree_phandle) && tree_phandle =3D=3D phandle=
) {
>                 if (tree->deleted)
>                         return NULL;
>                 return tree;
>         }
>=20
>         for_each_child(tree, child) {
>                 node =3D get_node_by_phandle(child, phandle);
>                 if (node)
>                         return node;
>         }
>=20
>         return NULL;
> }
> --- 8< ---
>=20
> Caching should work correctly without any other modification.
>=20
> I let you double-check on your side. Let me know about your opinion.

Yes, I think that should work.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--U416GTGFp8OvSBTQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrerfoACgkQzQJF27ox
2GeSww//Z5180hHqKm0lTbB2rhPEhdSbrpF47kP1k1uvc9ho+/fHRlZXHYrRIkDz
fNAZ/rZKHf4O8mqNCwIDtU9etV2kqv0Q5gUFPid+mSRx8DbJcWjI7E/S8Z8NpCfB
C5ZQ2Z05kLrVBrGhnJ8DsZGfAXfK4Uvq6BmBDAqZYJMnkALwLZN/1H3OSAYsR5wk
Rnf22NuIY5oTYHLkneJHc4089wDpGybMUggdiz4rAkJ3e7vnl1EddxAIIb8cWl7i
cLhNrENAAR2RmNY6+Tw6roqNnbjF5O0ruglWTI9thOdiI9xxovabv/4XRGvbb+Bq
A0ACFVz0vE/QZuf8glt2eUJmbHoscOP3HnjAlyvqKyyvGK+sDRz2GfBEN+vwmqyj
Xh5jyuGDDXTLD+x9gZ7PXBa2xi8Y5XWW3lvveBo/vfRmr2D4LUmLMWQWPSQl5dCa
WhU9EOqUKKZcFjOzxGRF44lwHDNNfF+2W9YR7nmIb5KZPC0uxV7MujAa8VSR8OVw
vHjYGqKXxzuK5RnnDdz8LUfcEYFOrYz0K7aeBgJZqmr47kuXCgUK/Io9S/VvjncJ
jRKkQI6QYkeuk8CYGgj4tKTOIV0ZEaEo9/wuQ2oIpS0LI0AunesN81tWSc67lsuF
7FmZwWSx1rreoss1u7qDj6qN7ahE2nJPRjlhdmgCiA48ncQGsSY=
=BrSe
-----END PGP SIGNATURE-----

--U416GTGFp8OvSBTQ--
