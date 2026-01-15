Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610C252F88;
	Thu, 15 Jan 2026 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458692; cv=none; b=O+RDc4II30t5cSNfCoRrWaQPIdBMdbtJJAors3jB8L/ckumwRQGZuqJTn1vGB2npuMDMuESgqXSgILMkxqQY2AMayKRBnIzPLL4gW5ZqhPVpT2CSG3USkVx3HI+vAu5/vqKm5c2wgLUTIQB2eGoPDaJ8T0AAAB0jjSZNRogliVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458692; c=relaxed/simple;
	bh=ceUxetXiTurLKkUxemEQlUbs/dabOA01twWLWr98Otw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ty6f+qoBSZPdxXDYNEHvK+dsWmZ3uM4tw8jTDjDXoNmX/Sco/Il+LqhANRsbWIK/yd5FyJwkQGumxoc6dmwtRduqm16WKfZ+kJ7gh2HcUzvMxct3ArhERiwbBrPsfWetZUGRmsATnT64H+cgTKBwqpJ6ICBryHO6CuDRXv2/s0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=CbSf+18g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="CbSf+18g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768458687;
	bh=MgfLKjYtbYxPY6Z5qQCL8xm6L93d+xbg15oG4xUEG80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbSf+18g/fPK4j1E/NlUD0u46gOguWURGgdZs2DY4TVOSAlrfmijHo+IOW2HgkEqT
	 RVvBENMxlEODCbd5xcepUtXgptA6ZxQJqIlkfszwZ5N6CweYNvLdYJnaHUePb+jRok
	 2XtRTZcua/SIyD2XdPQZb563BSKW64gvzImvtiU37riqkJFkEiJdbqXr2k76DwUyVZ
	 vyt+6suZwkiyVZCg5BG2i5912tpLEDYGxK0dsKOV9WXftbesPxim41xs1RP5+EQJKE
	 s5Igvd3gfdQK8jLVtGE48uyc16TWlEeDCByUkg/cjNCWlrcTTGW5EyXziEpMmsU7Ou
	 8ZV2QRKKmds9w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsCmv64slz4wM0; Thu, 15 Jan 2026 17:31:27 +1100 (AEDT)
Date: Thu, 15 Jan 2026 17:31:24 +1100
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
Subject: Re: [RFC PATCH 32/77] dtc-parser: Introduce last_header_flags
Message-ID: <aWiJvEEgjl44h6vd@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-33-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qK889M/ljeeqkpAy"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-33-herve.codina@bootlin.com>


--qK889M/ljeeqkpAy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:22PM +0100, Herve Codina wrote:
> The parser needs to get header flags value in different places.
>=20
> It relies on the fact that the rule used to parse the dts file is always
>   headers memreserves devicetree
>=20
> With that only rule to parse the file, it uses '$<flags>-1' construct to
> get the flags value.
>=20
> With the future introduction of import symbols parsing, this rule will
> change and the parser couldn't rely anymore on '$<flags>-1' to get flags
> value. Indeed, import symbols parsing will add a new optional symbol in
> this rule leading to two possible rules (with and without the new
> symbol) to parse the source file.
>=20
> Introduce the last_header_flags variable to explicitly keep track of
> flags while also being agnostic of the rule structure and use this new
> variable instead of '$<flags>-1'.

I'm not sure this approach is safe: I'm not sure bison guarantees that
semantic rules will always be executed in the same order, so using
global variables is risky.

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc-parser.y | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 4e46e9d..48c40e8 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -24,6 +24,8 @@ extern void yyerror(char const *s);
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
> =20
> +unsigned int last_header_flags;
> +
>  static bool is_ref_relative(const char *ref)
>  {
>  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
> @@ -122,14 +124,17 @@ header:
>  	  DT_V1 ';'
>  		{
>  			$$ =3D DTSF_V1;
> +			last_header_flags =3D $$;
>  		}
>  	| DT_V1 ';' DT_PLUGIN ';'
>  		{
>  			$$ =3D DTSF_V1 | DTSF_PLUGIN;
> +			last_header_flags =3D $$;
>  		}
>  	| DT_V1 ';' DT_ADDON ';'
>  		{
>  			$$ =3D DTSF_V1 | DTSF_ADDON;
> +			last_header_flags =3D $$;
>  		}
>  	;
> =20
> @@ -179,12 +184,7 @@ devicetree:
>  		}
>  	| dt_ref nodedef
>  		{
> -			/*
> -			 * We rely on the rule being always:
> -			 *   versioninfo plugindecl memreserves devicetree
> -			 * so $-1 is what we want (plugindecl)
> -			 */
> -			if (!($<flags>-1 & DTSF_PLUGIN))
> +			if (!(last_header_flags & DTSF_PLUGIN))
>  				ERROR(&@2, "Label or path %s not found", $1);
>  			else if (is_ref_relative($1))
>  				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1=
);
> @@ -197,7 +197,7 @@ devicetree:
>  		{
>  			struct node *target =3D get_node_by_ref($1, $3);
> =20
> -			if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
> +			if ((last_header_flags & DTSF_PLUGIN) && is_ref_relative($3))
>  				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3=
);
> =20
>  			if (target) {
> @@ -209,12 +209,7 @@ devicetree:
>  		}
>  	| devicetree DT_PATH_REF nodedef
>  		{
> -			/*
> -			 * We rely on the rule being always:
> -			 *   versioninfo plugindecl memreserves devicetree
> -			 * so $-1 is what we want (plugindecl)
> -			 */
> -			if ($<flags>-1 & DTSF_PLUGIN) {
> +			if (last_header_flags & DTSF_PLUGIN) {
>  				if (is_ref_relative($2))
>  					ERROR(&@2, "Label-relative reference %s not supported in plugin", $=
2);
>  				add_orphan_node($1, $3, $2);
> @@ -235,12 +230,7 @@ devicetree:
>  			if (target) {
>  				merge_nodes(target, $3);
>  			} else {
> -				/*
> -				 * We rely on the rule being always:
> -				 *   versioninfo plugindecl memreserves devicetree
> -				 * so $-1 is what we want (plugindecl)
> -				 */
> -				if ($<flags>-1 & DTSF_PLUGIN)
> +				if (last_header_flags & DTSF_PLUGIN)
>  					add_orphan_node($1, $3, $2);
>  				else
>  					ERROR(&@2, "Label or path %s not found", $2);
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--qK889M/ljeeqkpAy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloibsACgkQzQJF27ox
2GctTxAArIaYcAx5BfzErPm2b3uAnq05+14OaemloPupBOCsIIkR8y50t4lu68S/
LVKUI4lXfa29dixnh7nHiM1YN/EZYvsu4EbuERaxXSMYbYdzJ6NFAvgPYQ5vDLFS
rcVjOHB8RIW46VXX/IkdFAgbEk+Z9oIl+D0bDGe37v7EGRdHycHKf/aP11iXr+qK
YJ+DX0ijqBKtBPm3/LgRiLTjKAjMLQph1YwJEc2K79YhiUz5slRJV9rIBJ0397n+
3LRi+ToWvze5HRMXCcxLPqE/v7pv3ONLldkDI109rZpFoNECzLvHFLS+9yiX0Rg7
Oan8JrELq4E7ylrmqmDP3EwG2k/Y4wVJ1BtQaOtuuse3hd1VM9ibl5pz5MKXPj5N
lMJv12od9rDuQU8TZctPELVkkPx5vqgDid+jezNEoudQQNhajMw2ARSps/2yjNKk
tVlBzIAPpEom/rCe3oT82e5lm59wG7y90LTgJsyqiNKweIflDPsKoHaGntwsXTLD
QnZzZ4pRD/cjVmhUBC9QBwW28K6Mozryv5lBamnmNKn8aQn52kb9huzguvEujCpl
fhCmNZgXcfbca1LzDpg0D3rCmnw1vijzs272mYXSFYYRv98fEAJIVRKju8M8wMx5
/XIawOht6ZLmgqFIyDkldNi06jonW8Pi6WPGkRnopwCeYpmw5LU=
=r0Kz
-----END PGP SIGNATURE-----

--qK889M/ljeeqkpAy--
