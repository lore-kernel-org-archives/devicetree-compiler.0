Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793337902;
	b=0tZIpdm63nTO4I+R0yIs+le+qTeHuq9gLIJ8V9eug8KfD9mVd7jXBVcmiH3feQ2h2dlg
	 +j8Ai6ePfAzqff+PeqWpKRDU/OjdQtQ9d3LWGpjuMcBQDA82DEcEyPLTQPl/QGyi23taX
	 c8y2KTJnrxRnegfwRSVsrymU0bBJzb+BuJnXv+2Lsgufbg/XF16U8czdv8R4lEiBntPM6
	 hJYbqVWyWMK5wcg9JDdzwJMInRmUswhmwlbsIEjOzY6UNc/23uEhcAivzfrIAuZeetSWT
	 LxelhreDDsPTIKfljSrWJHfQ01xPnbTsLMJgQaXK+OBAt3R9nvDoiuvFAFhuGyQiLYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337902;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=BX44yvedu2n7SVy4HP0k0HwEn1jUnYsfAMHU21sBq+M=;
	b=r78ObzAUrb3TbFNQ6OVqSCgqvp9Vi33GKL+eS6LziDNSeoRzNIeF6i4DARnJRxOQjyxU
	 nDPvx+8x1RSJIdZMvXf/cDVPFBUKnKj69lQu2sondF15MsTHj54G4FSqx7WD26banCbA5
	 drfILLQxyHBg52WuJF2U6pTTtoivm8iLeT3+rPWdWjmVT4L7CeslFbzGfa/XHPh9i+P/G
	 eknZVvL0iS2PE6/fqJxVZwMQaKjb2UEmuwgblFNsW8N0i1y9AsSF5awVxwpwSQ8fxYsuu
	 TdT48SuDFwveBUSWqQPTZFvjFcrWJ3FCPzHuQQu20vtLs+a0VPUwVcRKfgPN45PyFPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=rs8edMnI;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4991606A31A;
	Fri, 30 Oct 2026 05:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4991606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=rs8edMnI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793337898;
	bh=BX44yvedu2n7SVy4HP0k0HwEn1jUnYsfAMHU21sBq+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rs8edMnItoCVFbTM1xhB0ufUJDlHqMde69Mow6NRQVF6A/rUlGAaalslZ8UDR/T9M
	 smRNMW4Xyukl+3yXkNFOShtw00XCbwV1NBtHiFJY0iKq/KIaYXo30WDfp82cH3x/k+
	 bYWewoWJonCe5j6ME3T1u1pmKBLl5P8fJU946PwLlDZEYVG+SBBRUKVaL9PPHcLo1Z
	 nC9aRiouEpEpg5MqvtyTXGzUWdq9qFyua73ctV5NrOqOMTQfDtONl85GrtdVxQiTKN
	 gIwjaA7eZ2BAbni42IcUJlL2CiALkJoG5i6Xtx4YqoYZMNMfuh7n1W25lHQ2Hw4+3c
	 xqgB7s36gqvkg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG8gG651xz4xGc; Fri, 30 Oct 2026 16:24:58 +1100 (AEDT)
Date: Fri, 30 Oct 2026 16:22:20 +1100
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
Subject: Re: [RFC PATCH v2 09/74] dtc: Complete REF_PHANDLE markers with ref
 strings and is_local flags
Message-ID: <auQpi8LGNldeNdK-@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-10-herve.codina@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="oZ2CD4XZ0ek/pmqc"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-10-herve.codina@bootlin.com>

--oZ2CD4XZ0ek/pmqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:38AM +0200, Herve Codina wrote:
> REF_PHANDLE markers lack either the ref string or the is_local flag
> depending on the device-tree input format used.
>=20
> When the marker is created from a dtb blob (via FDT_PROPDATA_PHANDLE),
> only the raw phandle value is available. When created from dts source,
> the ref string is present but the is_local flag is not set.
>=20
> Add complete_references() to fill in the missing information.
>=20
> Call the new function from build_dt_info() in order ensure that a
> dt_info is always fully complete and consistent.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  livetree.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>=20
> diff --git a/livetree.c b/livetree.c
> index a9f8c5d2..2ad7fd09 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -465,6 +465,82 @@ static void fill_fullpaths(struct node *tree, const =
char *prefix)
>  		fill_fullpaths(child, tree->fullpath);
>  }
> =20
> +static void complete_ref_and_is_local(struct dt_info *dti, char **ref,
> +				      bool *is_local, cell_t phandle)
> +{
> +	struct node *refnode;
> +
> +	/*
> +	 * When created from a dts, the reference is available but the is_local
> +	 * flag is not set.
> +	 *
> +	 * When created from a dtb, the is_local flag is set (and a valid
> +	 * phandle value is available) but not the reference.
> +	 *
> +	 * Complete both ref and is_local based on existing values.

The two cases share essentially zero code in this function, which
suggests to me they'd be better as different functions (each of which
could then have a more natural signature).

> +	 */
> +
> +	if (*ref) {
> +		refnode =3D get_node_by_ref(dti->dt, *ref);
> +		if (refnode)
> +			*is_local =3D true;
> +		else
> +			*is_local =3D false;
> +		return;
> +	}
> +
> +	if (*is_local) {
> +		refnode =3D get_node_by_phandle(dti->dt, phandle);
> +		if (!refnode)
> +			die("Node not found for phandle 0x%"PRIx32"\n", phandle);
> +
> +		*ref =3D refnode->fullpath;
> +		return;
> +	}
> +
> +	die("Cannot have a non local reference without a reference\n");
> +}
> +
> +static void complete_references_internal(struct dt_info *dti, struct nod=
e *node)
> +{
> +	struct property *prop;
> +	struct marker *m;
> +	struct node *c;
> +	cell_t phandle;
> +
> +	/*
> +	 * In order to have a complete state, a REF_PHANDLE marker needs to
> +	 * have a reference set (either a label or a path) and the is_local
> +	 * flag must be also correctly set.
> +	 *
> +	 * When created from dtb, references are not present in REF_PHANDLE
> +	 * markers created from the FDT_PROPDATA_PHANDLE tag. Indeed, only a
> +	 * phandle value is available with this tag.
> +	 *
> +	 * When created from dts, references are available for REF_PHANDLE
> +	 * markers but 'is_local' flag is not set.
> +	 *
> +	 * Completing a REF_PHANDLE marker consists in setting those fields.
> +	 */
> +	for_each_property(node, prop) {
> +		m =3D prop->val.markers;
> +		for_each_marker_of_type(m, REF_PHANDLE) {
> +			phandle =3D propval_cell_n(prop,
> +						 m->offset / sizeof(cell_t));
> +			complete_ref_and_is_local(dti, &m->ref, &m->is_local,
> +						  phandle);
> +		}
> +	}
> +
> +	for_each_child(node, c)
> +		complete_references_internal(dti, c);

Of course the change suggested above would mean that you need two
different cases in the callers as well.  I think that's worth it:
treating this as symmetric when we should know going in what direction
_all_ the fixups will go seems odd to me.  Or more concretely, I'm
concerned that if some bug means we get a marker in bogus state
(e.g. ref valid when coming from dtb) this approach means we'll carry
on sort of working, when it would be preferable to catch the bad state
and die earlier.

> +}
> +
> +static void complete_references(struct dt_info *dti)
> +{
> +	complete_references_internal(dti, dti->dt);
> +}
> +
>  struct dt_info *build_dt_info(unsigned int dtsflags,
>  			      struct reserve_info *reservelist,
>  			      struct node *tree, uint32_t boot_cpuid_phys)
> @@ -479,6 +555,12 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
> =20
>  	fill_fullpaths(dti->dt, "");
> =20
> +	/*
> +	 * Complete references (REF_PHANDLE).
> +	 * Set ref strings and set is_local flags
> +	 */
> +	complete_references(dti);
> +
>  	return dti;
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

--oZ2CD4XZ0ek/pmqc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkKYsACgkQzQJF27ox
2Gd8+BAAgxtgIYCVpTBdwyTn6N4L4w/8bUqtWbZJrbJw0n7WGipiXPoWx9P3Eydo
PvpSYRh88ZyVMKF+BEGykX80gbhq3pLXjIGmyNWYR1VcSYSSIuDN1Kerb76n6bVE
6VJCYXPf2bMCAl43z5x7idUE0WGS6mDzVDtVKmttYfukv0BlReoloDI2AdiIbzES
GvHv5HFxGFZX5y6bgp4mDPHgDprAm6+2P7Ff4Wdp0k1QMIbHg0+AfUl1I28DUGHK
4q/TTsC9G0emdr8wSmOiKY2gXv1mu4QNIe2P7nIlilkFHz8PO+O/6bM+WaBngH0P
1oSnZHJOFw/cpJyo9QxVOBFyI7HX8lEQmqEXpiEG0LI4HpgPm11cZir3esww03ze
hMWeBwYY7T+P2b4OwvoN4KW2ClrqqjAcLs+5GtPD9dLY2KQR6DSR/LPBBNFE0nls
oCnKOT2NH3XXe8g83jBNEZNcdpuV8PdED4JuZ0MxL2pOJjgAjn46/K0zKhgEE1KB
K6JPEsYXQ0S9c1Fjk5rgBA5QTztf2/0DVcOnJqJI8Qy/b7Lb0UX0Xx5s9vEhNJJe
THIXH0T+5Wq27zWS2GilfUx3geYB/z0d8t4Pzo/XB7LnMY36HLKxh7syz04Gt6YH
nX/2KdB23+JcjY7qlLs6l2ssmUS0MWNzLfZNR2eaCUE6k67gkew=
=MaZq
-----END PGP SIGNATURE-----

--oZ2CD4XZ0ek/pmqc--
