Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074454399D0;
	Thu, 27 Aug 2026 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823439; cv=none; b=Oc+FTzV0kHUUWX/+v0ZB1HE7KbIZvwIw0KmdsHe89Z+LHnQhwebGLlGv4tXV1Q5c+356lqCXqIKxI8Xv67hvbx0Ve3swtw66ju35rBKgbwjfdVmaWH7TFNM7w/KEtiGb4ODw+8T0zc4KhfVfdlvuy79KduzPJgXMWrhb/UXFtUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823439; c=relaxed/simple;
	bh=Ulp7fjlDiH/NLh7PI3530EdULLeh0kw2lAh1u+NzR+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RW5QKhdWc26BWHogLkDcTgjRCDwXQ8mm39aA2qx/5pv13tJabdZL3N9uMfT2Tt+b4Xzkr5kbQms0AQAcWDT3wC0SZ0v1heJxlUsGIpCC0FmPPd8Q/C/aN2oGruTfXw5dbhpRcMEWfXI5w9qXXnmPLOBocETcCUH7OvNRsQdxtgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=vAONMtrE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="vAONMtrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1787822969;
	bh=ai1xYp5emqk2YpS2O6a4Jw7jIO6yNdgWU2U7WUgZugM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAONMtrEyhxnZ5eFAY8RFiswUVw8/SxrPvViNPlmSPKe62b1c473v1LhuC/K3tpDv
	 sEtJnEVA0mhr43H/LWzuHXmENAMJM2YnRTCyw0IjEhvMOb54dG5lcREvXQNpcpnGvQ
	 6ofvkOP26P0Fxfud2hHTo624ts8phFUiL9yJPMh+pWeR11DbFTVddtuv1aB8ZKQBAe
	 WxHzESBMunbZHLSuSiZy8CFvhM4UiH5RqSed2wgrrXs+MeR+nAhR9wu3sEMasG6hpy
	 y6MKkAYJvraJNKTJ8fjgTqvB8d6vs2P6njOLu1/l/H5xYg0sb+guI9vHnbc++UR6cZ
	 kmw6BCv5wTc3Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hVx6x154Qz4w1d; Thu, 27 Aug 2026 19:29:29 +1000 (AEST)
Date: Thu, 27 Aug 2026 13:55:14 +1000
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
Subject: Re: [PATCH v3 01/15] fdtget: Use libfdt iterators instead of open
 coded loops
Message-ID: <ao-1FMFyANQVwy9K@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3c5wEsAoZhgnQUpy"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-2-herve.codina@bootlin.com>

--3c5wEsAoZhgnQUpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:32AM +0200, Herve Codina wrote:
> fdtget uses directly fdt_{first,next}_property_offset() with a while(1)
> loop to iterate over node properties.
>=20
> It also uses the low level primitive fdt_next_tag() with custom tags,
> level and depth handling to iterates over subnodes.
>=20
> It is worth noting that FDT_NOP can be returned by fdt_next_tag() and
> this tag is not taken into account in the fdtget open coded loop. This
> will lead to an incorrect error if a FDT_NOP tag is encountered.
>=20
> libfdt provides iterators to iterate over node properties and subnodes.
> The subnode iterator provided by libfdt is robust against FDT_NOP tags
> and will be robust in the future when new tags are introduced.
>=20
> Replace fdtget open coded loops by iterators provided by libfdt and
> designed to perform those operations.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Nice cleanup, merged.  A test case to prevent any regressions on that
FDT_NOP bug would be a nice addition.

> ---
>  fdtget.c | 73 ++++++++++++++++++--------------------------------------
>  1 file changed, 23 insertions(+), 50 deletions(-)
>=20
> diff --git a/fdtget.c b/fdtget.c
> index dd709854..c6169691 100644
> --- a/fdtget.c
> +++ b/fdtget.c
> @@ -138,21 +138,20 @@ static int show_data(struct display_info *disp, con=
st char *data, int len)
>  static int list_properties(const void *blob, int node)
>  {
>  	const char *name;
> +	const void *p;
>  	int prop;
> =20
> -	prop =3D fdt_first_property_offset(blob, node);
> -	do {
> -		/* Stop silently when there are no more properties */
> -		if (prop < 0)
> -			return prop =3D=3D -FDT_ERR_NOTFOUND ? 0 : prop;
> -		fdt_getprop_by_offset(blob, prop, &name, NULL);
> -		if (name)
> +	fdt_for_each_property_offset(prop, blob, node) {
> +		p =3D fdt_getprop_by_offset(blob, prop, &name, NULL);
> +		if (p && name)
>  			puts(name);
> -		prop =3D fdt_next_property_offset(blob, prop);
> -	} while (1);
> -}
> +	}
> =20
> -#define MAX_LEVEL	32		/* how deeply nested we will go */
> +	if ((prop < 0) && (prop !=3D -FDT_ERR_NOTFOUND))
> +		return prop;
> +
> +	return 0;
> +}
> =20
>  /**
>   * List all subnodes in a node, one per line
> @@ -163,47 +162,21 @@ static int list_properties(const void *blob, int no=
de)
>   */
>  static int list_subnodes(const void *blob, int node)
>  {
> -	int nextoffset;		/* next node offset from libfdt */
> -	uint32_t tag;		/* current tag */
> -	int level =3D 0;		/* keep track of nesting level */
>  	const char *pathp;
> -	int depth =3D 1;		/* the assumed depth of this node */
> -
> -	while (level >=3D 0) {
> -		tag =3D fdt_next_tag(blob, node, &nextoffset);
> -		switch (tag) {
> -		case FDT_BEGIN_NODE:
> -			pathp =3D fdt_get_name(blob, node, NULL);
> -			if (level <=3D depth) {
> -				if (pathp =3D=3D NULL)
> -					pathp =3D "/* NULL pointer error */";
> -				if (*pathp =3D=3D '\0')
> -					pathp =3D "/";	/* root is nameless */
> -				if (level =3D=3D 1)
> -					puts(pathp);
> -			}
> -			level++;
> -			if (level >=3D MAX_LEVEL) {
> -				printf("Nested too deep, aborting.\n");
> -				return 1;
> -			}
> -			break;
> -		case FDT_END_NODE:
> -			level--;
> -			if (level =3D=3D 0)
> -				level =3D -1;		/* exit the loop */
> -			break;
> -		case FDT_END:
> -			return 1;
> -		case FDT_PROP:
> -			break;
> -		default:
> -			if (level <=3D depth)
> -				printf("Unknown tag 0x%08X\n", tag);
> -			return 1;
> -		}
> -		node =3D nextoffset;
> +	int subnode;
> +
> +	fdt_for_each_subnode(subnode, blob, node) {
> +		pathp =3D fdt_get_name(blob, subnode, NULL);
> +		if (pathp =3D=3D NULL)
> +			pathp =3D "/* NULL pointer error */";
> +		if (*pathp =3D=3D '\0')
> +			pathp =3D "/";	/* root is nameless */
> +		puts(pathp);
>  	}
> +
> +	if (subnode < 0 && (subnode !=3D -FDT_ERR_NOTFOUND))
> +		return subnode;
> +
>  	return 0;
>  }
> =20
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--3c5wEsAoZhgnQUpy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqPtRQACgkQzQJF27ox
2GfF3RAArA6maELFSVz2YeMeCLE0nJoK0u4Q4h1nNQG8/rezhsKFDsX1n5HsESP7
4eqfmJXmfXzP84jGRDpXAS8GGYcoGhq63HimuZrcsDwVuAeKNUd8d9aDBecMeaMc
3zv7438WnPrwi2U2/X3zLGjq5zfRafP8YH98X9n1c2vzN7AzJReWGgN1IZWBUZ+4
Ng/1VzyhZJv6OI1AHOCHNS+u28L6IpFkppsXur6yikVl9nfSQN2wg70z03wfD5Vy
hcR8I7KEr3p1JX2RFCfc3NQPBfHzNbRGI8I5hAN7MUDK9YVuaD9tvhSs8eufOQcs
dsd9IEDbkkVABcbG3AajTMuHp337KS8D+htTJaO7oLmvhNaDQPSqr3vXQ6zlhnJF
JuFMTikmpqBNdbnFALS217JpJZWloSza2TTkby02/AkBdM3Bk04i7DXFDTcsu3eR
2JwE3iLA8Uy/Wb+MkotZbRqQRb6PeN38XdAaWIedye06gDMMvl1NVChYxyUV3V01
WTPf5yxVySUhIzdg/L5XYGszYc9ZEhxK2g+6erybLNtJvrUUALWVwn73tIHXYIgc
L1DOa3zXEW35QrwFsDU4aRCi6RuH7SyStyEDvYExNdMU4yCffcv9d3lh/39hxeh0
zeLpcEA/7Q6BOizuAAqyb3g0Q7nokCCisikhP2ESuvmpkZLpmls=
=LIbf
-----END PGP SIGNATURE-----

--3c5wEsAoZhgnQUpy--
