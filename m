Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725946;
	b=Qkyd/HTGCEbLHiI/6ZF3oHF6K+yAVDFrNIv5woNpJGxTS73Dfn6A9LvbawfyuQtEJTHM
	 rF8/EVanbynMKsFtKMIK349Q2H9+/y9vxtUEyl2elpetnU2ZL3B3edhqoSUXpFjCWtz98
	 IZ+PKI4eQKbvDNAxARXj8Q/CJuhYFm8L0xNtDA3M3xOTC6YQA4wyKoqNldn8wT0cQK4Io
	 I+kZlTug41CvvlqeGwfYOXYUG0WZOlQkq73LuAru/3zbaFYTY9YM7nxeETZUEi8NxUSX9
	 XzkmKtHVokISpMyRP5uccIEBfCOmOvQi5oKvoZqggIE6Db0qVZxZKUPjUs5WA+LaJWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725946;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8aGeedHzUEF0b4HOKqY8QqZNQHGftmFLkNiMFc+pgKM=;
	b=HI4Pva7zp2Mo0ws01feeo6R74Xo8n2RvK4Qf7Fz47B6eeRWRncdSM6moTW9pr6Vn4G2S
	 a6r+84U31dlV4vv6Re8gt1pPxOf/mpx+XwyqlLoMuNsEHZpOFZbwevV1pzS4Y0Vq2/B6T
	 cHOp0+tV11b7FmG2fuzlF5JMsTZOSIBw6D3jpGNU9wWzr49vEycRZcn1sdkZnIk5KBo4X
	 s4WOrNP8bMzdLGiF5E2fCOIaIT2Z+U7g9YSbVxxsBPcP+eoJc2KZ6Z1hF+NZSi02AKgL6
	 Ldu5+NRnPxYJetTwMEE/zPPXYkeMzyag51xMtmYiBMaIkRHQNqJI6T4qUzWo7/zwgdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=YNHpzND+;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA390606A326;
	Fri, 23 Oct 2026 03:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA390606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=YNHpzND+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792725937;
	bh=8aGeedHzUEF0b4HOKqY8QqZNQHGftmFLkNiMFc+pgKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNHpzND+apnMh9YvHi+xVUFThwqsZUYls8nM3oWScVJiE8dDAEXC68jji5LrBbvtT
	 AV0FjgIL8rvzeb4lyK/jPVfo8rOYwvo/e2lgsnk0tDgD5ZrvXR8gK3ewOKXlsF02I6
	 uJVdaoN4AZk+G22449/Cv8aRhlicifE0BrLPIu442t883ZhD3bmvg1uu2TqwanynjI
	 BG1MidmaXOstNWK+B9JHuFjm+6Sp5LyEKEVoidmh52SWSYmYSllQlL5MId7eM1DTci
	 p59baXTH+Ti8Z1WOJvF0yaM3OnCNcTOIykN9kJXpndWhfH5rLFpSbkmBULimi86Y1s
	 NYrtk0IiNNZ3A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j9pLn4ZXGz4wBB; Fri, 23 Oct 2026 14:25:37 +1100 (AEDT)
Date: Fri, 23 Oct 2026 14:25:29 +1100
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
Message-ID: <atrTn_I_8O6q9QUW@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-9-herve.codina@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="lz/gZO3uSfdIiUAi"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-9-herve.codina@bootlin.com>

--lz/gZO3uSfdIiUAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:37AM +0200, Herve Codina wrote:
> get_node_by_phandle() allows to get a node based on its phandle value.
> It checks the phandle value against value available in internal node
> structure.
>=20
> This internal phandle value is updated during process_check() and so,
> get_node_by_phandle() cannot give correct results before the
> process_check() call.
>=20
> Improve get_node_by_phandle() to look at node phandle properties when
> the internal phandle value is not valid.
>=20
> This allows to return a correct matching node even if process_check()
> was not called yet.

The idea is sound - it's always been kind of clunky that we need the
process_checks() pass to fill the phandles before we can use them.
But, there's at least one significant catch:

[Aside: you might notice the way it's done violates the principle I
 stated elsewhere of avoiding structures where you must know where you
 are in the flow to know which parts are populated.  My type
 discipline has improved since I first wrote this code :)]

We need to gracefully handle the case of malformed phandle /
linux,phandle properties; that's actually the reason for the weird
placement of this in checks.c.  By treating it as a "check" we handle
this case by failing the check.  Other checks that rely on phandles
then have the 'explicit_phandles' check as a prereq so they don't need
to verify this again.  We can still report errors for other checks
that don't rely on that (which is the whole point of the checks
mechanism).

That's not the only way to do it, of course, but we need something to
check for that error case.  Further notes on the code.

> With the recently introduced FDT_PROPDATA_HANDLE dtb tag, this will be
> needed to update internal phandle references before the call to
> process_check(). Indeed, this tag allows to identify phandles and
> internal references need to be updated based on the phandle value before
> the process_check() call.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  livetree.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/livetree.c b/livetree.c
> index abe73de1..a9f8c5d2 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -628,16 +628,35 @@ struct node *get_node_by_label(struct node *tree, c=
onst char *label)
>  	return NULL;
>  }
> =20
> +static cell_t get_node_phandle_existing(struct node *node)
> +{
> +	struct property *prop;
> +
> +	if (phandle_is_valid(node->phandle))
> +		return node->phandle;
> +
> +	prop =3D get_property(node, "phandle");
> +	if (!prop) {
> +		prop =3D get_property(node, "linux,phandle");
> +		if (!prop)
> +			return 0;
> +	}
> +
> +	return propval_cell(prop);

In the case of a malformed property, this could SEGV.

> +}
> +
>  struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
>  {
>  	struct node *child, *node;
> +	cell_t tree_phandle;
> =20
>  	if (!phandle_is_valid(phandle)) {
>  		assert(generate_fixups);
>  		return NULL;
>  	}
> =20
> -	if (tree->phandle =3D=3D phandle) {
> +	tree_phandle =3D get_node_phandle_existing(tree);

This means that every time we search for a phandle, for every node
scanned before the destination with no phandle, we do a full property
scan to check that no, it still doesn't have a phandle.

I don't care that much about dtc performance, but that's still a bit
much to swallow.  I think we need to cache negative lookups to avoid
that.  Happily, since there are two invalid phandle values this
shouldn't be too hard.  We could, say, use tree->phandle =3D=3D 0 to mean
we don't know if there's a phandle, and tree->phandle =3D=3D -1 to mean
we've scanned the properties and we know there isn't one.

In fact, caching property lookups might be the better way to do this.
Rather than having an explicit pass where tree->phandle is populated,
we could have get_node_by_phandle() cache its property scan (success
or failure) in tree->phandle.

I think that's a more elegant approach than the current one, but we do
still need to handle the malformed property case.

> +	if (phandle_is_valid(tree_phandle) && tree_phandle =3D=3D phandle) {
>  		if (tree->deleted)
>  			return NULL;
>  		return tree;
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--lz/gZO3uSfdIiUAi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmra058ACgkQzQJF27ox
2GcVGxAAqVsqw74rGD8w0m9ospZ0NsC5yBuq2l2/26gjHs4tL6qdl7Op1Ibxv6b2
NA87Sll7xzM2pS5YOgQiU02aVB3otmNsS5bd9M8xhXbLrK8amvSf0evWU/bMgQok
E8WwqkRtXMWfbl0xNXsqSLahtXdTPhFi4/eBiOywcBqLQ2Nzs9/SFG3L+Uc57TA6
c2/yzxEMHhpJz8nIh2qyWwSCIDX4cocH0QhIUEMv4IDju7Qwdx/S4y1KbLUUIWmF
f0AbbVyB6G/lEZp6BMXD/82mZazmwtFIDSH+stPDqbN6i8VS+OsFqYz0tG2+xW/2
F83MjCB+WIyGFriEnnBEsNNkRWRu3gY84xWTIYGwwMdDYw3NkmkHOnJkODmqYayv
JwOrfO9YE/s9UFXaESG3ZWvP9gtHSyhL2mSl+EY6KV4UkCkjAoZzk0cJIiqaE2GT
yvwWXXtDPXbCpvx59Pmce+LPzcM9FY8OpmwO3Gu78zYzS43YxVFXpxqxHXoie0NO
WBtOA79prvPTJebdCl67YzWGjKrhvucum71Ry+wQnAc27494VYMJtL+eEZvqdY5q
B6rxkFzKjwsl7xyRY6/DW3vyLvEZdQyvoiJK2IZynnhtOjk9cc47Uiyn7V+envl2
f6NycJ7ymQ4PNmwSVHbvJOZNdLO6qpejG14waebE261wxSYIdAE=
=+sPE
-----END PGP SIGNATURE-----

--lz/gZO3uSfdIiUAi--
