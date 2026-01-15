Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C02823DD;
	Thu, 15 Jan 2026 00:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438269; cv=none; b=rFo8uBmYLd7B+8hJYTLMt7b52q3Fbrhq/OUwLQxZSIB9Sfvi+KleQFWV+RiSgA88kJwbnijlt1NXGD1HEVaW+gm8+fNhfZEI36NyHBRcnnCtui06f51xipn/LJXZ5irUdF/jOOqjaOc5y/DgsTjCLPusWCSe3k/bQ2SprwHx3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438269; c=relaxed/simple;
	bh=FndGVNyHtrUgA2eGHCd95ssRDQlk+bQYfiw9+7dO9yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBkqRc5Debcd7Y4YjTy28BtF9yU0n3Qq9wDrFnM/Tk99wZopiJyfci2rML+6UEqqwWexdAZIc90he0PNUD/E82hkbW0Qux029Cexwuc1GFgfpBzCbItiWWeuREQ2MJvdy25k3t9gwzqUd6D//S8a7sLsXACjSCmMAMdJD49UU8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=gqe+WnBC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="gqe+WnBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768438265;
	bh=5e7c2cx46YMQulYUC7Opy+GRIimu7x79TfYLrV1s4lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqe+WnBCHz7mO2WWixaPjUUk6A1n/bqGqcrZsmZNoDmnkWtVxt3Ubnv9W2+nb8Mf+
	 fO2QsEGZzyYLrAg0J38hMD72XebXKNQkZT6SkVLxGaWLbmnj5tL2sLPTawavCDfPjw
	 nR54EdjPhDpVV/QPVH9cHXDtPHGbt8ubT3UNg3QdQ7q8HvYJm+vRI8zRt5SxbbTnGU
	 t8HPLCRCriuVmODtm8Bmqqvo08ys2rRhRom+4urvR2lhuTLvORb55voZYBVilnLKoY
	 AnI/XZEH0sMgFxQesl8RiYp8Tg+U5QmrJ4qGutypO5K8uU2c71Xzz0UX/jeZHQNQ6T
	 zLuIHtTBA7ZUg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds4D96C3cz4wHX; Thu, 15 Jan 2026 11:51:05 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:41:32 +1100
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
Subject: Re: [RFC PATCH 07/77] livetree: Improve get_node_by_phandle()
Message-ID: <aWg3vOBK4uKwyRp4@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-8-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rQdjRyBtDHl8HglO"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-8-herve.codina@bootlin.com>


--rQdjRyBtDHl8HglO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:18:57PM +0100, Herve Codina wrote:
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
>=20
> With the recently introduced FDT_REF_LOCAL dtb tag, this will be needed
> to update internal phandle references before the call to process_check().
> Indeed, this tag allows to identify phandles and internal references
> need to be updated based on the phandle value before the
> process_check() call.

Having two entirely different paths for get_node_by_phandle() is
really ugly.

I suspect a better approach would be to special case updates to the
internal phandle field as we parse the phandle properties, rather than
doing it as a batch during the checks.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  livetree.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/livetree.c b/livetree.c
> index f328824..9b67934 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -609,16 +609,35 @@ struct node *get_node_by_label(struct node *tree, c=
onst char *label)
>  	return NULL;
>  }
> =20
> +static cell_t get_node_phandle_existing(struct node *node)
> +{
> +	struct property *prop;
> +
> +	if (phandle_is_valid(node->phandle))
g> +		return node->phandle;
> +
> +	prop =3D get_property(node, "phandle");
> +	if (!prop) {
> +		prop =3D get_property(node, "linux,phandle");
> +		if (!prop)
> +			return 0;
> +	}
> +
> +	return propval_cell(prop);
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

It's especially nasty that we call the expensive version first, then
fall back to the cheap version...

> +	if (phandle_is_valid(tree_phandle) && tree_phandle =3D=3D phandle) {
>  		if (tree->deleted)
>  			return NULL;
>  		return tree;
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--rQdjRyBtDHl8HglO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloN7sACgkQzQJF27ox
2GdNaRAAhpnDwX3t8VCtnkOFwRc2B5dUhP8EmHgH5lOmcwZwM7Uh5O4/48tQXM9v
z5T4Fvnl7eOQj0IpP2cLOreRODu2X2PLtZljnfo9Ywe7plQ+UL2ou891Oozv1A4E
j6HPXjofjNwkNqwxx7am3pNJTWG9F9+TnTMd7rEln3BIC/yVHeQoTIT3qCYriSzj
fpxxf+A0qsHsTKKtG/kPRxRz0Pzapx7mxIjcM5IBlSkqPwwApvAccRzq8TeVDEvn
6mZuWrI+M5ueK5ZArCBkXc8h0MLY23rTraCM8LzXVU8wjy+OZJ2dV16vUEhU194M
SYT1bjCRAW/DFWWcLgpUJ877IdXHulIoN7DDeNEeNhPBCA7OfNFsk1ntVQaAHWB8
UowVJo3+roGHzLOlrJ1S/t46z6yOfgAhFJnWl99Amk/sBCfD6YAZWKI6ui2+mScs
iLDfopkkBgK1ieytY564xpyDWmP66pB9h5XkwsK8zYjtu9xSuruc46i4ITTPreoF
4TWexNwN2ox4Lrccx1N9eIqwcALYgK3ABjxPGXCIRsYG8LNRBVCoKYfAwhhUXu6t
WAToCBr9bhhHQFjxEguhc+G+B6UednLmxZOnNRwk0FRqOyHfFKcBhqkesiuUwBus
ezwNK3e2pjd4s3pMNB+ZksCkGeJFviuGwdQ+/4Bd4dt+p4kKk70=
=psHe
-----END PGP SIGNATURE-----

--rQdjRyBtDHl8HglO--
