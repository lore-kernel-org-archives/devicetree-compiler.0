Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23BA348C75;
	Tue,  1 Sep 2026 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249957; cv=none; b=dpRF+ueWpYePQo1g+fifo1c6ZFp+8EqxACmlPT1VK+tbBCiKmM+LrA1Z0tD+gZ4UbHk2ZP0BwBJN1kG1SRHx3cpSCs4VYHqTmReojgVdL68382G7NxqHa4stNQCT/LYzLg2EJya73gz593RZGNN8rn60eeW3dws+wU/sQLPsQnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249957; c=relaxed/simple;
	bh=ExPnDUzTDLVMgGc21rYFTFGXJnS3cVzqEDJbNJJZVoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PneQXcxBVzrEuIgZRt7yZ+zJTxtUpS4qNAaGRLBufco0vR22GghXXB3h4EAWovxha6t6YcVcRrtPyGENrnuFIW3kQ+yxqk/e/PtSL8i2nGpOesGG1CCDV1jQgDmGVsqJOLH3YKIpWkp10OJOS02G0mA3nvkOEUk9yJR7vOWy3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=V/PMwb/s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="V/PMwb/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1788249952;
	bh=ZqX0HihvPlM/ubj3zj+A/sf2EJU05yIHJuZ4nx80q70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/PMwb/sXdlIOnTMOvsbdSnpu3m1iD0LsIxe3a3RL66wNIsM4QIlO8FUeOyRQP6aa
	 xnEXyR2xQYGECUNApzq7aFZVIm8kRV1L9fMczMAB9BeD+ub6oG27fgodAjC3fKk8BV
	 VUe1cqIat2atExIEHw1LSNr2Ml5rWI47a5e7kX3+mnVVW/+fR4hqOoZ8hXnVpyyaJ+
	 BZ7Bsp8FpVTR9jedC4yyxBabuSD/uAWTafB4cbH+NIOzs1hwIzIHsnR+oWxx37IrUU
	 BOCYA4R2OiFOLM+5mG9abmKW3McXyTYnVDdllYEr8TYPkhfhrya3PKO/XUynqPF4L/
	 8v0MhZR5SkBfQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hYz286cKCz4wJq; Tue, 01 Sep 2026 18:05:52 +1000 (AEST)
Date: Tue, 1 Sep 2026 18:05:44 +1000
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
Subject: Re: [PATCH v3 04/15] tests/nopulate: Add a FDT_NOP before the root
 node
Message-ID: <apaHV3UOsmUygRr6@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-5-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tER3Rb5WdtAKqEsI"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-5-herve.codina@bootlin.com>

--tER3Rb5WdtAKqEsI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:35AM +0200, Herve Codina wrote:
> A FDT_NOP tag can be present at the offset 0 and so before the root
> node. This is a legit case.
>=20
> The nopulate tool adds FDT_NOP tag after each tag encountered but it
> doesn't add a FDT_NOP tag at offset 0.
>=20
> Improve nopulate to fix this lack and add a FDT_NOP tag at offset 0.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  tests/nopulate.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/nopulate.c b/tests/nopulate.c
> index 06f8369a..050e69fb 100644
> --- a/tests/nopulate.c
> +++ b/tests/nopulate.c
> @@ -22,7 +22,10 @@ static int nopulate_struct(char *buf, const char *fdt)
>  	uint32_t tag;
>  	char *p;
> =20
> +	/* Add a FDT_NOP before the root node (first node) */
>  	p =3D buf;
> +	*((fdt32_t *)p) =3D cpu_to_fdt32(FDT_NOP);
> +	p +=3D FDT_TAGSIZE;
> =20
>  	do {
>  		offset =3D nextoffset;
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--tER3Rb5WdtAKqEsI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqWh1cACgkQzQJF27ox
2GdqdA/8Chhkn4LwkpbPO03kMqhpXpRggor2B9KNK7OQr76RV9JegwQ8ttXiAA2i
Gi3mKaZgFDBXLn9rgHgYgSedtHQtDgbB35YfFi2qbc0aNuhfCwy1xSwGAT6RBL0w
c06cBt7CPmQaXyBrKJnNBE7AQLRZ1aEyKPAYPODT0l7ApiW9mvkO9XXG7rKKQvbh
2/1VAjpq3Z4GuIXYC2IMqKrySZoNZc61KPVwjy+5nKFpeD0onshN4WgcS8CCyAsR
05iQ/wgklWPDH7K9O+0ODU4NYC1NCK/QUM7NA0pO8FrVuqQ26hgmcxfcOFbMA6rV
qvmK4WWG5xFbrlliUj57RAWMEeiI8/qEplFCF65AjjgFtn5MFO4YrtMsc+AD77IR
xkU8w2FVh8GKKJPyLEMU0nQZv9pV5Bw+8gUqpKVSIAJQ+h7jF2amK/VUIY71/JjD
x1AryTBj4fjdaurM93oTuui5iyR6dc4KozUe4ZG0kRUg9jKZqXNffGcgidZuH2ae
7e7lpvFpFRE8EjFTglUb+/e3bXlFNN2uKbCVF4k4fHrfW3NTzFMxmqfzLubuKVbl
vDO7l5A+BlNUD0iWzY3ste2EhrlAhlq/cVOvPNf7UezQ/Wqh90RLadVDkGiBgSyB
0OhonDeQ73IbQ70FgWgLKtQnyDx1c+Kex07VhMRIRRBMw3/aMnk=
=V+/H
-----END PGP SIGNATURE-----

--tER3Rb5WdtAKqEsI--
