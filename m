Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4772DC781;
	Thu, 15 Jan 2026 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460719; cv=none; b=GlRaB25N3fCSwBxKHSjJ5WlieeeV59KHODash1YkXUu02z8Ei9lFTEhoU89h0GZeOrgiiuIz0rJPkkBkqmbaBid7wd2+4xJoHOz38QkXLDMYQGto7ekT1Mg4YpnNqQl0V3dB675fKai4wbft+oQtC//onEmuCJfx8IP/A8bu0eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460719; c=relaxed/simple;
	bh=t94hy6TYU8/83BVFilV/U5P1RrswKHTMeFjGdH+LtpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXVWSwPHHezFiYhxq1qf+iWGweBtdAUbmTpwcFO1HUeBwJlHwhBExquSF0vA/Dsd++oM68z2pHziN5AfZUOV35dXhJCg72ZjjjjhtVPWd9SsH8n0KOEDrZaXUPT0UJqkRCMmh9W15xBNDF4dxtpwUln68yBBeEDwMiqO+YA5Yi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Rnm90M0B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Rnm90M0B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768460715;
	bh=FvPfE7dEWZemmuJqgy4/9hDQmDelsnLzzN4g/RRsfG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rnm90M0BnMu4utWsTQY1xyaowyf9Esr9AFcF8e/h4OVJQGa3j0dVeOCE62a2YlBj1
	 6Oew3HRzk09R5DHIQP6wxYuIqdf9SsQUBPulI8J3soO8BFLdrFicE0Y3qASzo/j8ft
	 Ov94VmC4M2y6RA+MYgYeIIH62QaOCrry09KXVA2M3PIN3pMabR6GcFCkAat+KtHnTY
	 iwj+AqZbQxjNru+B5ZTwGZEl9v3UhbUE20R9IMYwZ/7qkocVGyVJVXp5FFOEdNyaXo
	 OaTSqJSjHQU72aR/HN2ijkmVzrfJVWvad8+NCzkjooSwh7FV3CXPkqK5iZoNCJsewT
	 +rdpvZ8B66hyQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsDWv6Q9bz4wM5; Thu, 15 Jan 2026 18:05:15 +1100 (AEDT)
Date: Thu, 15 Jan 2026 17:56:07 +1100
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
Subject: Re: [RFC PATCH 51/77] dtc: Avoid NULL fullpath for nodes in orphan
 trees
Message-ID: <aWiPhz92DBQImUw1@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-52-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/V7AOZv4r4IZse5l"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-52-herve.codina@bootlin.com>


--/V7AOZv4r4IZse5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:41PM +0100, Herve Codina wrote:
> Orphan nodes have been introduced recently.
>=20
> The process_checks() function uses fullpath in several places and
> crashes due NULL pointer dereferences if fullpath is NULL.
>=20
> In order to have process_checks() function running without crashes with
> orphan trees (i.e. trees based on orphan nodes), the fullpath of node
> available in those orphan trees must not be NULL.
>=20
> Fullpath values are built by dti_fill_fullpaths(). Update it to handle
> fullpath in trees based on orphan nodes.
>=20
> Use a simple "__orphan__/" prefix to avoid the NULL pointer and to be
> distinct from the root node ("/" prefix).
>=20
> It is worth noting that this "__orphan__/" prefix is a temporary prefix
> and it will be change later when support for reference by path involving
> nodes in orphan tree is added.

It might be simpler to eliminate the fullpath field entirely, and
instead have a function that calculates fullpaths at the point you
need them.

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index 59f4d77..5cf8f31 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -47,9 +47,14 @@ static void fill_fullpaths(struct node *tree, const ch=
ar *prefix)
> =20
>  static void dti_fill_fullpaths(struct dt_info *dti)
>  {
> +	struct node *orphan;
> +
>  	/* Fill fullpaths for the root node */
>  	if (dti->dt)
>  		fill_fullpaths(dti->dt, "");
> +
> +	for_each_orphan(dti->orphanlist, orphan)
> +		fill_fullpaths(orphan, "__orphan__/");
>  }
> =20
>  /* Usage related data. */
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--/V7AOZv4r4IZse5l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloj4cACgkQzQJF27ox
2GdeEA//QngfyJtHSGb7EzSYkD/tdMl7RFk2CaOHxwGkLLZYL79i5AjbBYZM/L7F
pCtdCmtyEhRRN0N58Jd3OTGYf+WGIC3DpzzpwJ3XbwUANVoL98SoATxJNtiyJNVh
hvgy5j4OHuxXknFgY5kOXZ9GtPxec+PvXyp6frDpPJNIBxSsi4r1IWRInNatupIR
qQa9DVDFCsD3P6UL/VK0EacF+hrq8YzK5qANmzjJE4l9gX8ADWR6AVMVfM75/nmn
KotTaSBBEBcP1NSv292hYF/C21eyKZGIiwfeY6ypA/BNzBOqFbomtWwVn+brL2YP
H4+0s/CwYJ8HKzYyBNrih6n9zyEev7GpP1pjQJGSgh6hWK52NeoL9uigSj+6vx9f
7eBQEdk/am3pdPKSEZ03SC+ZnqP6tmnpYIaloVbMxCHAYkJvrjiqtmjN5Mtmzls9
mXEqDGniE0voIeqDar8gXDSCSWzReZLGoHv5/PYJDUUCp9FKg35Ggilpja9w34Ea
CBkEIVyrrWUPmA9dSoUWVFVCmF4WsM9FZVkYj6WEfvTvB5axXKKq/8Md2NeXpfpR
37w8BeBSPaAWh051vDZBpuugwv4F6pdq1lVoHeV6p0Wex4XaiI4c9u29roNpOQiD
CcXRTUeAtRFqDyxm8V1w4ECBNGEp6h6Jzs6DyWb3YtjD5x0bQ34=
=CdWX
-----END PGP SIGNATURE-----

--/V7AOZv4r4IZse5l--
