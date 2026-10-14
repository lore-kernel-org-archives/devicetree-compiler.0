Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4050255F;
	Wed, 14 Oct 2026 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982700; cv=none; b=Tnqf1D0NZnLbzljKs7KVvZ8BC/rgNcjEkyftgJUqrqdh8MrkrjY3JQMbT0RYGEFusgW4nZyadna2UrgYf/LkPCERAa8XrfSyNoHgUIDsgsDkTzJbHBbjfVvQL5ZV0wQgVtTTzUvzJ6ssuSlrcGJlm+9wvnqbG85KcKoP6MxLP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982700; c=relaxed/simple;
	bh=g66sw7cji6ke5ytudnA3lyLgKdR5SMPNgiCxqUnXQls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmUe/axUGdY9ZKgvjPQ/IxI/qym0AfnDBNRh9MXKDpx3bPG/cSqzgnHq/PvV7913bmUZnYtyKEk23XUK5kxEG5Ox1UM9qc96OcNKhSr/P5z2wgZWHrN/yZFgpX2gd+7W4lFCD/znZSkT8Wv04c1012YVMDf8ZCMCEEWPHX24W00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Nxn1J/jf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Nxn1J/jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1791982682;
	bh=Hnb0TFHCS9y8DoSAxbCduAjbuEi6l2n1yWrvVNzkwJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nxn1J/jf5yDisnHn9Eay9ixEQ2MJZmt06it1It+WdRS2sc0F3jqZ5T+fiRGMAZEV6
	 F1PBnBFULajUM5+e+T38eFCCxFVNDK/BB9q9VW7KrOJF/qIUm98CkQKlpiIe1ligFe
	 nWCYr88Jhepj8u5wlwEM2y3662SKSkRkWMKcusEVNGFhg3E6f2S69KERY18lN7sXnB
	 mb4OddRLy9A8oW4U5g8eVQrBUaEp4m/hgNB5PEpDAGOpFAmPnoNWQc/lzLbgAqBQul
	 jCc6qQrFuwmpN4Z13g39Q/ELvtFKxGhvs6q7vqEbObqh4cU2n+k5vT2EJEE/Z95MCg
	 9VVW1hFifPsyQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j4WTQ175fz4wDK; Wed, 14 Oct 2026 23:58:02 +1100 (AEDT)
Date: Wed, 14 Oct 2026 20:25:54 +1100
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
Subject: Re: [RFC PATCH v2 01/74] dtc-parser.y: Avoid an empty proplist
Message-ID: <as9KnCZ3qLlcbjxK@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1WnaBS/CEOiEAkg9"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-2-herve.codina@bootlin.com>

--1WnaBS/CEOiEAkg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:30AM +0200, Herve Codina wrote:
> In the dts parser grammar, a nodedef is defined by
>   '{' proplist subnodes '}' ';'
> with both proplist and subnodes that can be empty lists.
>=20
> Having multiple possible empty list can lead to Bison warnings such as
>   warning: 4 shift/reduce conflicts [-Wconflicts-sr]
>   warning: 1 reduce/reduce conflict [-Wconflicts-rr]
>=20
> This will happen as soon as a new list (which also could be empty) is
> added in the nodedef definition.
>=20
> The simpler way to remove those warning and thus have a robust parsing
> is to avoid multiple empty lists.
>=20
> Update the proplist definition and nodedef definition to avoid those
> multiple empty lists. Instead of allowing a proplist to be an empty
> list, force the list to be a non empty one and update the nodedef to
> handle explicitly the absence of the proplist to support the case where
> no properties are available, i.e. the case of a node composed only of
> sub-nodes.
>=20
> This doesn't change the functional behavior.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

This seems a reasonable change in isolation from the rest of the
series.  Applied.

Note, that if it comes to it, I'm not necessarily opposed to adding
the %glr-parser option to Bison.  We used to use it in the past, until
we figured out an easy way to avoid it in 7b3fb789d2cd ("DTC: Remove
the need for the GLR Parser.").  The Tomita GLR algorithm is well
established and the computational cost is pretty much irrelevant in
context, so I'd generally prioritise keeping the grammar simple to
read for a human and convenient for the rest of the code over making
sure it's stricly LALR(1).

> ---
>  dtc-parser.y | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 4d5eece5..e47f80d4 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -267,12 +267,16 @@ nodedef:
>  		{
>  			$$ =3D build_node($2, $3, &@$);
>  		}
> +	| '{' subnodes '}' ';'
> +		{
> +			$$ =3D build_node(NULL, $2, &@$);
> +		}
>  	;
> =20
>  proplist:
> -	  /* empty */
> +	  propdef
>  		{
> -			$$ =3D NULL;
> +			$$ =3D chain_property($1, NULL);
>  		}
>  	| proplist propdef
>  		{
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--1WnaBS/CEOiEAkg9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrPSpwACgkQzQJF27ox
2Gd3sg//bRFMNk05u0HQ+VPz9XN2Zz7ju5kqt1BOc1/ZKJ+4nP1cCCinxw+Z7ng9
6hJpBymULD1+GqphMtjjEWY9hypgEByps2/RchZoAdiTAm/H5VP7WsqhOPF9PKnl
ioiobgGr3Xai4nxoCnD1BIrxEsvFnbTW35dgccaHg2jNbrP897mUw6yDkcu16VGh
veDKb7DlcWlmftxcSHFhL4rVXnYvTiCVT/oySqpGFiWrwScedv3VrvMAnzTwdYPD
N4i+eX6ZPoLXREt4M2cvf1GrjaNaA+4XcPvkScOu7Av+ws6VfylPAy5bAtGdUNn+
lbe1uHTLIOuhmAMviXIGs/4cV+6dQE2QPyxNbrmfzloKWAm7CbYpcJonZT+HmFMZ
5gGAQMowtdaxM4lU0898k1zp+CRdwWtzyExf/OTWuCsHNfLG6HBikwj5xpJYGc68
iNJRRf+OgyJaVHcz4O/LGsnZKTYB+kEBv5psT4RqmNy5TVqBpayzXFIKzskmZQgA
m7zS51+/eMk22Fc3BzUed5BhmxbPlJ/+YAb+aWbgbhqtNsEDCnq7ujroWWZU3jqh
ox3PdYkWcrlEikfyqxLgdy6SMPtl1p9iCbZMkAZASqnLoXTEMf8natFUH+1tIxby
t/5lcDyZ/q9hmWxDj1BZg+1423XTdWpvXrWZ4Mnm6sRX3DL36Zo=
=AFqx
-----END PGP SIGNATURE-----

--1WnaBS/CEOiEAkg9--
