Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793155285;
	b=BORNqSuYuSB503pRNCbDTjjIz0mXdyTD73U+wydGlHRUJqe0eeVWDkEcEAIpGCM4Arxg
	 HBe2wPXHvH8yTscG0Dh1n9rxJ86hJpXlyrbOMlYjMY+Ja1psyUqVYnAIDX2wU031QK4vz
	 6jUXWMfcpwcRtaZdaGInNY5bIX3NY9BGRyCDxwFluwiQJLKJE1EIOFpioBmHMOKraCOEM
	 zqk1jIXy3Yp2q1Bl594MRH90I0GWoa/9HAvwD0lgEVnqQhj1JZ7Ia4tvOT7Fkkt1IOWme
	 m/3R1CICxlJ7RUW/ATjycV3jCc3zU/+wWPvPGr+25Ezsizau/GNsWyu9jX7FgYspgvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155285;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=QX2W0lQnijfwrGlTgWM1dFah9f2G2nTUmcOGxD8rgv0=;
	b=tK8CwLvP5LGU+WazWRrhxbN3ZF41RusvxJq1n3CqkafcwM3wx/fKgi4D1mO0KrDyxJyg
	 NNar2uKFD/VwbKozNljHeOHICWr/r3+HYsqa0z6yd6jawaHJRF63+TT47N66EEeGjLHPa
	 VvqYn2eNcEGbhum+bnDNC+Ug+jOpNR4aA4/Loj7kmw4/AhTnkAPk9Z1+XxHai9F5dnUy9
	 hg3ZIdxk8KOcgmdto123id/QLDjhSMJaWd7Tbqkv3ipQfD6O+SwsdZ40VjF1F6q3gV6Ky
	 6+6h0YDBxB/NR5XhP/bswfl1jf8q0K1b1sGbCp3UeGkF5uLZFO/fmPPLyq8cBIrcxgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=UNgMn3Om;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC2F606A32A;
	Wed, 28 Oct 2026 02:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC2F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=UNgMn3Om
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793155280;
	bh=QX2W0lQnijfwrGlTgWM1dFah9f2G2nTUmcOGxD8rgv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UNgMn3OmnMkYrjdQPiws9YH9jbOG+rNbqRqZCrjzrat3wJ4fheGgBDcO/Xcfpi4At
	 PpPfMUsIc7pYHDy3ASRuE24PBlDyXMC56COPlDpVGofS9K05qrjJiUIhEkV2lwJSlc
	 XKYtDEUVYTW/Z+QBRNSk7jglD5RxUDORnuNUZdFe4W8uI6tN3Yg9YA4KYP5l6v+XfJ
	 1dqD2gFKnGbDw7rkI6p2gBEpretwbnqdGtslWpYrj0sqfcM++svO0cIXMY8x9KAFG1
	 yvWPBPOQmCwzmlP54f7eOcUhtyHHd0K9UlecDQh69wS99VS8j0R3UAEnFYw+A6EbC4
	 47UwooYXA+//Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jDs7N5XWTz4wTN; Wed, 28 Oct 2026 13:41:20 +1100 (AEDT)
Date: Wed, 28 Oct 2026 13:41:14 +1100
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
Message-ID: <auFgv_f0av-JxMjg@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-9-herve.codina@bootlin.com>
 <atrTn_I_8O6q9QUW@gractus.seuss>
 <20261023181533.0c44a57f@bootlin.com>
 <at6t-l9XYYFfS48T@gractus.seuss>
 <20261026125615.055e7214@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="lpYmQE31+ktOK+HY"
Content-Disposition: inline
In-Reply-To: <20261026125615.055e7214@bootlin.com>

--lpYmQE31+ktOK+HY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 12:56:15PM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Mon, 26 Oct 2026 12:33:51 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Oct 23, 2026 at 06:15:33PM +0200, Herve Codina wrote:
> > > Hi David,
> > >=20
> > > On Fri, 23 Oct 2026 14:25:29 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Wed, Aug 26, 2026 at 11:48:37AM +0200, Herve Codina wrote: =20
> > > > > get_node_by_phandle() allows to get a node based on its phandle v=
alue.
> > > > > It checks the phandle value against value available in internal n=
ode
> > > > > structure.
> > > > >=20
> > > > > This internal phandle value is updated during process_check() and=
 so,
> > > > > get_node_by_phandle() cannot give correct results before the
> > > > > process_check() call.
> > > > >=20
> > > > > Improve get_node_by_phandle() to look at node phandle properties =
when
> > > > > the internal phandle value is not valid.
> > > > >=20
> > > > > This allows to return a correct matching node even if process_che=
ck()
> > > > > was not called yet.   =20
> > > >=20
> > > > The idea is sound - it's always been kind of clunky that we need the
> > > > process_checks() pass to fill the phandles before we can use them.
> > > > But, there's at least one significant catch:
> > > >=20
> > > > [Aside: you might notice the way it's done violates the principle I
> > > >  stated elsewhere of avoiding structures where you must know where =
you
> > > >  are in the flow to know which parts are populated.  My type
> > > >  discipline has improved since I first wrote this code :)]
> > > >=20
> > > > We need to gracefully handle the case of malformed phandle /
> > > > linux,phandle properties; that's actually the reason for the weird
> > > > placement of this in checks.c.  By treating it as a "check" we hand=
le
> > > > this case by failing the check.  Other checks that rely on phandles
> > > > then have the 'explicit_phandles' check as a prereq so they don't n=
eed
> > > > to verify this again.  We can still report errors for other checks
> > > > that don't rely on that (which is the whole point of the checks
> > > > mechanism).
> > > >=20
> > > > That's not the only way to do it, of course, but we need something =
to
> > > > check for that error case.  Further notes on the code.
> > > >  =20
> > > > > With the recently introduced FDT_PROPDATA_HANDLE dtb tag, this wi=
ll be
> > > > > needed to update internal phandle references before the call to
> > > > > process_check(). Indeed, this tag allows to identify phandles and
> > > > > internal references need to be updated based on the phandle value=
 before
> > > > > the process_check() call.
> > > > >=20
> > > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > > > ---
> > > > >  livetree.c | 21 ++++++++++++++++++++-
> > > > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/livetree.c b/livetree.c
> > > > > index abe73de1..a9f8c5d2 100644
> > > > > --- a/livetree.c
> > > > > +++ b/livetree.c
> > > > > @@ -628,16 +628,35 @@ struct node *get_node_by_label(struct node =
*tree, const char *label)
> > > > >  	return NULL;
> > > > >  }
> > > > > =20
> > > > > +static cell_t get_node_phandle_existing(struct node *node)
> > > > > +{
> > > > > +	struct property *prop;
> > > > > +
> > > > > +	if (phandle_is_valid(node->phandle))
> > > > > +		return node->phandle;
> > > > > +
> > > > > +	prop =3D get_property(node, "phandle");
> > > > > +	if (!prop) {
> > > > > +		prop =3D get_property(node, "linux,phandle");
> > > > > +		if (!prop)
> > > > > +			return 0;
> > > > > +	}
> > > > > +
> > > > > +	return propval_cell(prop);   =20
> > > >=20
> > > > In the case of a malformed property, this could SEGV. =20
> > >=20
> > > Ok, will update to
> > > --- 8< ---
> > > 	if (prop->val.len !=3D sizeof(cell_t))
> > > 		return 0;
> > >=20
> > > 	return propval_cell(prop)
> > > --- 8< ---
> > >  =20
> > > >  =20
> > > > > +}
> > > > > +
> > > > >  struct node *get_node_by_phandle(struct node *tree, cell_t phand=
le)
> > > > >  {
> > > > >  	struct node *child, *node;
> > > > > +	cell_t tree_phandle;
> > > > > =20
> > > > >  	if (!phandle_is_valid(phandle)) {
> > > > >  		assert(generate_fixups);
> > > > >  		return NULL;
> > > > >  	}
> > > > > =20
> > > > > -	if (tree->phandle =3D=3D phandle) {
> > > > > +	tree_phandle =3D get_node_phandle_existing(tree);   =20
> > > >=20
> > > > This means that every time we search for a phandle, for every node
> > > > scanned before the destination with no phandle, we do a full proper=
ty
> > > > scan to check that no, it still doesn't have a phandle.
> > > >=20
> > > > I don't care that much about dtc performance, but that's still a bit
> > > > much to swallow.  I think we need to cache negative lookups to avoid
> > > > that.  Happily, since there are two invalid phandle values this
> > > > shouldn't be too hard.  We could, say, use tree->phandle =3D=3D 0 t=
o mean
> > > > we don't know if there's a phandle, and tree->phandle =3D=3D -1 to =
mean
> > > > we've scanned the properties and we know there isn't one.
> > > >=20
> > > > In fact, caching property lookups might be the better way to do thi=
s.
> > > > Rather than having an explicit pass where tree->phandle is populate=
d,
> > > > we could have get_node_by_phandle() cache its property scan (success
> > > > or failure) in tree->phandle.
> > > >=20
> > > > I think that's a more elegant approach than the current one, but we=
 do
> > > > still need to handle the malformed property case. =20
> > >=20
> > > Well, get_node_phandle_existing() can be improved:
> > > ---- 8< ----
> > > static cell_t get_node_phandle_existing(struct node *node)
> > > {
> > > 	cell_t phandle1, phandle2;
> > > 	struct property *prop1, *prop2;
> > >=20
> > > 	if (phandle_is_valid(node->phandle))
> > > 		return node->phandle;
> > > 	if (node->phandle =3D=3D ~0UL) {
> > > 		/*
> > > 		 * We've already looked at existing properties and no valid
> > > 		 * phandle value were present. Avoid looking at them again
> > > 		 * and just return the invalid phandle value.
> > > 		 */
> > > 		return 0;
> > > 	}
> > >=20
> > > 	/* Try to get it from the 'phandle' property */
> > > 	phandle1 =3D 0; /* Assume invalid */
> > > 	prop1 =3D get_property(node, "phandle");
> > > 	if (prop1) {
> > > 		if (prop1->val.len =3D=3D sizeof(cell_t))
> > > 			phandle1 =3D propval_cell(prop1); /* Well formed -> Get it */
> > > 	}
> > >=20
> > > 	/* Try to get it from the 'linux,phandle' property */
> > > 	phandle2 =3D 0; /* Assume invalid */
> > > 	prop2 =3D get_property(node, "linux,phandle");
> > > 	if (prop2) {
> > > 		if (prop2->val.len =3D=3D sizeof(cell_t))
> > > 			phandle2 =3D propval_cell(prop2); /* Well formed -> Get it */
> > > 	}
> > >=20
> > > 	if (prop1 && prop2) {
> > > 		/*
> > > 		 * Both property are present. They values must be the same
> > > 		 * and valid.
> > > 		 */
> > > 		if (phandle1 =3D=3D phandle2) && phandle_is_valid(phandle1)) {
> > > 			/* Ok, Cache this correct phandle value and return it */
> > > 			node->phandle =3D phandle1;
> > > 			return phandle1;
> > > 		}
> > > 	} else if (prop1) {
> > > 		/*
> > > 		 * Only the 'phandle' property is present.
> > > 		 * Check its value validity
> > > 		 */
> > > 		if (phandle_is_valid(phandle1)) {
> > > 			/* Ok, Cache this correct phandle value and return it */
> > > 			node->phandle =3D phandle1;
> > > 			return phandle1;
> > > 		}
> > > 	} else if (prop2) {
> > > 		/*
> > > 		 * Only the 'linux,phandle' property is present.
> > > 		 * Check its value validity
> > > 		 */
> > > 		if (phandle_is_valid(phandle2)) {
> > > 			/* Ok, Cache this correct phandle value and return it */
> > > 			node->phandle =3D phandle2;
> > > 			return phandle2;
> > > 		}
> > > 	}
> > >=20
> > > 	/*
> > > 	 * No valid phandle value were found. Cache this information and ret=
urn
> > > 	 * the invalid phandle value.
> > > 	 */
> > > 	node->phandle =3D=3D ~0UL;
> > > 	return 0;
> > > }
> > > --- 8< ---
> >=20
> > That looks good to me.  But the "existing" in the name no longer says
> > anything useful - this can be the standard way to get a node's
> > phandle.  In fact it might be worth changing the name of the
> > node->phandle field to make sure we don't have any stale users rather
> > than going through the get_phandle() function.
>=20
> Ok, I will rename node->phandle to node->phandle_ and add a comment saying
> that phandle_ field must not be accessed directly.

You can even switch it back after you've checked there are no stray
accesses to it.

> Related to existing users, I can see check_explicit_phandles() available
> in the checks.c file.
>=20
> check_explicit_phandles() could use the new get_node_phandle_exising() wi=
th
> the caching feature. The only problematic part will be
> --- 8< ---
> 	if (linux_phandle && phandle && (phandle !=3D linux_phandle))
> 		FAIL(c, dti, node, "mismatching 'phandle' and 'linux,phandle'"
> 		     " properties");
> --- 8< ---
>
> Indeed, this check is done in get_node_phandle_existing() and the function
> returns 0 (invalid phandle) when both properties are set with a different
> value. A value other than 0 should be returned by get_node_phandle_existi=
ng()
> to identify that mismatching properties values.
>=20
> This should not be a big deal if we introduced a new invalid phandle valu=
e:
>   - 0:
>     Invalid value. Can be returned by get_node_phandle_existing().
>=20
>   - ~0:
>     Unresolved value (phandle value in properties) or value cached in=20
>     phandle->node_ for "mismatch 'phandle' and 'linux,phandle' properties
>     values". Can be returned by get_node_phandle_existing().
>=20
>   - (~0)-1:
>     Invalid value in properties and or value cached in phandle->node_ for=
 Invalid value.
>     Will not be returned by get_node_phandle_existing().
>     When this cached value is found, 0 will be returned.
>
> In phandle_is_valid(), those 3 values will be checked to determine if the=
 phandle
> value is valid or not.

Alas, we can't do that.  Which phandle values are valid is long
established from the IEEE1275 days, and we can't really change it.  I
don't _know_ if there are existing trees out there using 0xfffffffe as
a valid phandle, but there could be.

*thinks*

In some ways it would be elegant for get_node_phandle_existing() to
report the various different error conditions separately, but I think
the awkwardness of passing that information back to the checks is
going to outweigh it.

So, I think we're actually better off separating lookup of phandles
=66rom validation.  So get_node_phandle_existing() (or whatever we call
it) will return 0 if there's no valid phandle, whether that's simply
because it's missing, or there's something malformed.  Separately
check_explicit_phandles() will report specific types of malformed
phandle properties.

It does result in a little redudant logic, but I think it's the best
overall approach for now.

> Now last point, renaming get_node_phandle_existing().
>=20
> get_node_phandle() already exist. It get a phandle but also if the node d=
oesn't
> have a phandle, it allocate a new phandle value and set node "phandle" or
> "linux, phandle" property to this allocated value.

Ah, sorry, I misunderstood what the "existing" was referring to.

> IHMO, get_node_phandle() should be renamed to set_node_phandle() and
> get_node_phandle_existing() should be renamed to get_node_phandle().

Right, the existing name is bad.  But let's go with
get_or_assign_phandle() for the existing one and get_phandle() for the
new one.  (The "node" added no useful information and this way they're
two new names to reduce confusion).

> Does all of these make sense?
>=20
> I so, I will try to implement that and maybe I will see other issue I mig=
ht
> have missed.
>=20
> Worth noting that if you're ok to rename get_node_phandle() to
> set_node_phandle(), I will do it in a dedicated patch. Indeed, this will
> ensure that get_node_phandle() has been renamed everywhere (compilation
> without failure) and so I can safely rename get_node_phandle_existing() to
> get_node_phandle() in a next patch.
>=20
> >=20
> > > In get_node_by_phandle(), no change compared to my proposition and so=
 the
> > > full function is:
> > > --- 8< ---
> > > struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
> > > {
> > >         struct node *child, *node;
> > >         cell_t tree_phandle;
> > >=20
> > >         if (!phandle_is_valid(phandle)) {
> > >                 assert(generate_fixups);
> > >                 return NULL;
> > >         }
> > >=20
> > >         tree_phandle =3D get_node_phandle_existing(tree);
> > >         if (phandle_is_valid(tree_phandle) && tree_phandle =3D=3D pha=
ndle) {
> > >                 if (tree->deleted)
> > >                         return NULL;
> > >                 return tree;
> > >         }
> > >=20
> > >         for_each_child(tree, child) {
> > >                 node =3D get_node_by_phandle(child, phandle);
> > >                 if (node)
> > >                         return node;
> > >         }
> > >=20
> > >         return NULL;
> > > }
> > > --- 8< ---
> > >=20
> > > Caching should work correctly without any other modification.
> > >=20
> > > I let you double-check on your side. Let me know about your opinion. =
=20
> >=20
> > Yes, I think that should work.
> >=20
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--lpYmQE31+ktOK+HY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrhYL8ACgkQzQJF27ox
2Gc8xxAAm0qhmdEl/r4H+AvrqxTUYfa97hm7LpvCEusXFEcbb+KfKSxLCSb86ach
wZIZXqPZ7aaOCqbbuJBs0LP7X3gjebYg73/p9c1OjCpNb+266VW5C+514bc1Hygz
kW8o4X4dsrEnoIa35DJCu5c1JZ4tBrpRx8nyuL+D5+FtlMEiBgG5i1YZRwdcz4Lv
bhfZdLg+FNNIoZ8ABdxjJ7TStPR6FMKtflPQPksZtg+btJxuXS4OccpdKlELtACl
fECpqjQtlZu9IeW/bFAcreCTyMGNuqB/jhfMiDiIbDQSYOjrNRHUtz540aemulJ/
j3pmz3DIKvNjiZ6MN2O1akxA5r0jKtaUGT7Xb1JEUTe/ekXbkH1FP4/4TdZnpMsw
Rzniw0t0F8j5CS4MOC8g3u1NnHYzVUBG/qfm+BhJqXji42blouWaYuY/dCv28dR7
Pn+HTc25lqa3ks2chBdgwG92NK8X1n4j1RXjwJ+leV68suF0tz7x27DcB6Z0YoFS
6lkxOfaTTpP4z306AUo33l8buqNdmH7DY9jywMRNFJbITmPD7XFZxBsyI8hi1Ett
EFPyKXOfw+p77UMFUUvHCK+WfCE8iz1wNnnb23VvTQYWczP5uQwCOfyYDt57Xuk5
Ft29GU/GgbyDPNzGJDslgNKa6vFvMJKqIIC9plARkXiCpIDZtTI=
=L/7v
-----END PGP SIGNATURE-----

--lpYmQE31+ktOK+HY--
