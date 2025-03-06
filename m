Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3029429CF0
	for <devicetree-compiler@vger.kernel.org>; Thu,  6 Mar 2025 05:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741239399; cv=none; b=I5eSiMIbcEL1Abjwl+0N/zh6kFK3ZzH0NptGX1BXKQFxl6AeIYl2us7UoV2LIrpY9Dfws5RSV8Mu+ipPDv7L6R6Ab3rh5NPaG5W6rajgWCh86tR/tW4HRdqWGlOURCYvDjN8cfDWqB++rZBC2SFgbKhpCW/uKKvr9ZHvO3PJffw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741239399; c=relaxed/simple;
	bh=MgdwaCxU77hYwf9idkA4yLxQsMi1XOgAEeYaQw3b0iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPvxRH0BfKcXfkAjnP1CdHmvveNp2ataneJfDW9qzZ5YFW1WHPhIaksc/Tnsox7gu5V3gqw6oT+2veWi1IE2ZnyWlxdENcydF5w66F9opPHYuFJmT/gKAykmAf8SxkFBarEMf2Fz7UI9N44sMc3XqbOQznyRSNC9yFJ+VIb0nhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=N6+BQBuQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="N6+BQBuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1741239391;
	bh=RKn13bWOjvnR0DaS2x3Da46bhssuEZQHRB1e/Ks8bCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6+BQBuQj7g9cf6BDR48dGOftCRjdfUylQKF9nw8wxGwgACqIyVB2MqGg3XzX/9FF
	 daooxyR8lABJVEnpOWrCTKE04lBtYHe9i2D6yjuxeNBRB79jI7IG4O6fZetKR7jQ7x
	 8w4s29WolXA42W1vWkQkaHp/k7xYIoF887WCU/XhhW8D3pAgnpG/8ifPH7NU5SNAHf
	 keRpsfqzm+/3ezDIVlDB8+IZcsjPBNOouokFmUZA6MaDfo2UNE6COedznruyA+1jY3
	 u6wKQ3OZkEHHEWZwLT1one9taP5LPxo/8lDtQHdmzi5ULfcoSU6+ORBeY7ctaDJbuQ
	 yaX7C7xHjaa9g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Z7dSv0Vx3z4x2c; Thu,  6 Mar 2025 16:36:31 +1100 (AEDT)
Date: Thu, 6 Mar 2025 16:36:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Herve Codina <herve.codina@bootlin.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Add support for export-symbols
Message-ID: <Z8k0VeNXbuJ3kFj3@zatzit>
References: <20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A3ExWLaJCVZMNBeL"
Content-Disposition: inline
In-Reply-To: <20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org>


--A3ExWLaJCVZMNBeL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 11:18:55PM +0530, Ayush Singh wrote:
> The export symbols node adds some additional symbols that can be used
> in the symbols resolution. The resolver tries to match unresolved
> symbols first using the export symbols node and, if a match is not
> found, it tries the normal route and walks the tree.
>=20
> Contrary to symbols available in the global __symbols__ node, symbols
> listed in the export symbols node can be considered as local symbols.
> Indeed, they can be changed depending on the node the overlay is going
> to be applied to and are only visible from the current node properties.
>=20
> export-symbols are phandle based as opposed to global __symbols__. This
> allows for much simpler use with overlays as opposed to __symbols__
> where paths require resizing of overlays as show in [0].
>=20
> [0]:
> https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f9=
6dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed

I'm not sold on the concept of export-symbols in the first place.  But
at the very least this commit message needs to explain what actually
needs to be done within dtc to handle them.  It's not obvious to me
why it needs to do anything here, as opposed to in dtc consumers.

>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
> As discussed in the export-symbols kernel patch series [0], the
> following patch series adds support for export-symbols in the base
> devicetree compiler.
>=20
> This patch series is mostly a prototype for the functionality. Depending
> on the direction, next revision of the patch will add tests.
>=20
> Support for export-symbols in overlays will be part of a seperate patch
> series.
>=20
> [0]: https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@boot=
lin.com/
> ---
>  checks.c | 42 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 123f2eb425f4a2f8ac22bfe10a842bf08e296ba1..e577f30a3ed9b762aee073fa1=
ff9d866f5de60b6 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -600,11 +600,37 @@ ERROR(name_properties, check_name_properties, NULL,=
 &name_is_string);
>   * Reference fixup functions
>   */
> =20
> +static const char *fixup_export_symbol(struct node *export_symbols,
> +				       struct marker *m)
> +{
> +	struct property *prop;
> +	struct marker *em;
> +
> +	for_each_property(export_symbols, prop) {
> +		if (streq(m->ref, prop->name)) {
> +			em =3D prop->val.markers;
> +			for_each_marker_of_type(em, REF_PHANDLE) {
> +				return em->ref;

This requires the contents of the symbol to be defined as a reference
to work.  Yes, that's the obvious way to do it, but in existing things
if you really want to hand code a phandle value, you can do that.

This makes it so that trees that would otherwise have byte-for-byte
identical dtb output don't work the same way.

> +			}
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
>  static void fixup_phandle_references(struct check *c, struct dt_info *dt=
i,
>  				     struct node *node)
>  {
>  	struct node *dt =3D dti->dt;
>  	struct property *prop;
> +	struct node *child, *export_symbols =3D NULL;
> +
> +	for_each_child(node, child) {
> +		if (streq(child->name, "export-symbols")) {
> +			export_symbols =3D child;
> +			break;
> +		}
> +	}
> =20
>  	for_each_property(node, prop) {
>  		struct marker *m =3D prop->val.markers;
> @@ -612,13 +638,25 @@ static void fixup_phandle_references(struct check *=
c, struct dt_info *dti,
>  		cell_t phandle;
> =20
>  		for_each_marker_of_type(m, REF_PHANDLE) {
> +			const char *ref =3D NULL;
> +
>  			assert(m->offset + sizeof(cell_t) <=3D prop->val.len);
> =20
> -			refnode =3D get_node_by_ref(dt, m->ref);
> +			/* Check export-symbols if present */
> +			if (export_symbols)
> +				ref =3D fixup_export_symbol(export_symbols, m);
> +
> +			/* If entry not found in export-symbols (or export-symbols not presen=
t),=20
> +			 * search the normal way.
> +			 */
> +			if (!ref)
> +				ref =3D m->ref;

This muddles semantic layers together.  In dtc, the *contents* of
nodes and properties doesn't affect the output other than that node or
property (though it might affect warnings).  Only actual dts syntax
affects output non-locally.  This changes that, which I think is a
very bad idea for understandability.

> +
> +			refnode =3D get_node_by_ref(dt, ref);
>  			if (! refnode) {
>  				if (!(dti->dtsflags & DTSF_PLUGIN))
>  					FAIL(c, dti, node, "Reference to non-existent node or "
> -							"label \"%s\"\n", m->ref);
> +							"label \"%s\"\n", ref);
>  				else /* mark the entry as unresolved */
>  					*((fdt32_t *)(prop->val.val + m->offset)) =3D
>  						cpu_to_fdt32(0xffffffff);
>=20
> ---
> base-commit: 18f4f305fdd7e14c8941658a29c7b85c27d41de4
> change-id: 20250110-export-symbols-e2ea3df01ea9
>=20
> Best regards,

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--A3ExWLaJCVZMNBeL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfJNEEACgkQzQJF27ox
2GeUoBAAjd+GhPJIYEsnKnANsCJwSKPDl5Hft1fU8hVrTeplW0aV2sNqt+RoalfL
nRh8zFzA+L/XtOb4lcRRpefyFxQOOzhJhf1fVeTr5AZQesiUAr++1gg2V5vBpLgk
uTnyGbTrjmPwBewzJLIOtPQJsptqLtY9AsvY5PES6hBhoPgUqOirHHzJkrdwt/8T
JPDqQx0gsyhkm8lIuVHvXKQEknpvQq7L2cCj02JzJ1pijKQZuBQqgldBmQOLngDq
AcOr4zgN5vqawjLU2GpGvdxWK0o0zb/KRY1LbJn0wVcYpi8O6OLXcuGG07E9y6vl
8WU8pr8Diwon7S8te+FNN1I8FszMo7dJ3WKFtrMcmrWsnnvZRL8LISwd19hTn2VJ
nTEGBQ6py0Bm4lHiNgANZl0CFKAQdkVPTKItBCAjM8LsBQnOROSTzHPhNgDy8u/t
dEab0GVTsliZSsjrI4qFhbSojVpjdfCfDLJ2TyssuraeZFTYePEFhRRaIn1VkRP5
ZHOvzWd1fqT+G4SYI4nY7+vCjKG76BY4q7RAWCZCgVE7m90Im6FUyadbqukCqFIU
4LrGOX5K+1Ntd1icjTZtqhuef8NOqxmLI/oLCiZ6OLn6muSvDeuY6AlGPaAMUU5/
spHnUSv5CVtpQo4CAATC4ZhjLcKetAgJz53aHG2tcmJsad+H2yc=
=M2vR
-----END PGP SIGNATURE-----

--A3ExWLaJCVZMNBeL--
