Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8B4400;
	Thu, 15 Jan 2026 00:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438270; cv=none; b=JFRWa/KbiWhnx/faOLxNMq/tgEfhO4pLOwyT7ItOC9+QIR4tMdxyPvQSHYhWszLz9QvwZw8a22J311/kySgn5VpLROQXBuQbJx6RJ1TUAY7D8llBv5gs+z4XJEkvq0iz0vluJTqFQDUiU/S/dt7alzJx6ydKano97UZuWkUspoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438270; c=relaxed/simple;
	bh=qcsfrlEbrfAJnShmwbkX+ob2L+EOUAS1/CAdlZ5Yu10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVOS1TD+AJ9cZa+BCyxfRCMCK30smg1ZpWsg2Df+ZIGPwlQBqDicDZNvVBbvJFYIgd1goORe0jv0jVHHqqTHQACmQOHsqO2KfBp+C4Q8XbYASb00IHgy21Kym0zuRy5YmBKGEDKFNk0vjYvVWjyliC2uhYIwjoO9AV4eMqMgnzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=jua5EOJL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="jua5EOJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768438265;
	bh=PrlWERQodayG8ZLV8qfxzchQJdJJRhkSO0DQZpZ8COQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jua5EOJL13lX6g/CvfTITd1eUuDdv+2TtXc4TryHpAOERuJO2o0xJRuR91cgIpLAQ
	 poNzNpbxn9bvlCIu5xy0+70RHIM+E39fjeqLYh1k40MIpZuW765TUtbKkVaz8D0l6T
	 DaKsAk8T/RJrtdc8cP+5qRKKSIx/MzvjDRPUxrlesDCjv8HGcbu47ENBMJ5HY+i8Z9
	 pd4PBTrLslUZnm+njSalQfzD9PfRvlIA8ZYsaIlyKkTCSaB+c0S/1J9kdQq7f6MB+f
	 CMzYe+lFYZxHI5GQxFYBc9JkcmOPbfA+nJlfccYcclInRrkBddIGQCgLoX4X4i9C3Q
	 JKZfI5/XqGwsw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds4D96Tz2z4wM5; Thu, 15 Jan 2026 11:51:05 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:46:52 +1100
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
Subject: Re: [RFC PATCH 08/77] dtc: Introduce update_phandles_ref()
Message-ID: <aWg4_KIBbUMOdP9C@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ux+HZinrKYpYvbvW"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-9-herve.codina@bootlin.com>


--Ux+HZinrKYpYvbvW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:18:58PM +0100, Herve Codina wrote:
> With the introduction of FDT_REF_LOCAL dtb tag, a local phandle used
> by a property is identify when a dtb is parsed.
>=20
> In order to have consistent internal data, the reference related to this
> phandle usage needs to be updated based on the phandle value.
>=20
> This is done by update_phandles_ref().
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc.c      |  2 ++
>  dtc.h      |  2 ++
>  livetree.c | 38 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index b3445b7..88f03ff 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -333,6 +333,8 @@ int main(int argc, char *argv[])
>  		generate_fixups =3D 1;
>  	}
> =20
> +	update_phandles_ref(dti);
> +
>  	process_checks(force, dti);
> =20
>  	if (auto_label_aliases)
> diff --git a/dtc.h b/dtc.h
> index 965321c..351fe41 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -345,6 +345,8 @@ void generate_label_tree(struct dt_info *dti, const c=
har *name, bool allocph);
>  void generate_fixups_tree(struct dt_info *dti, const char *name);
>  void generate_local_fixups_tree(struct dt_info *dti, const char *name);
> =20
> +void update_phandles_ref(struct dt_info *dti);
> +
>  /* Checks */
> =20
>  void parse_checks_option(bool warn, bool error, const char *arg);
> diff --git a/livetree.c b/livetree.c
> index 9b67934..9e30a63 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -1158,3 +1158,41 @@ void generate_local_fixups_tree(struct dt_info *dt=
i, const char *name)
>  			"Warning: Preexisting data in %s malformed, some content could not be=
 added.\n",
>  			name);
>  }
> +
> +static void update_phandles_ref_internal(struct dt_info *dti, struct nod=
e *node)
> +{
> +	struct node *c;
> +	struct property *prop;
> +	struct marker *m;
> +	struct node *refnode;
> +	cell_t phandle;
> +
> +	for_each_property(node, prop) {
> +		m =3D prop->val.markers;
> +		for_each_marker_of_type(m, REF_PHANDLE) {
> +			if (m->ref)
> +				continue;

IIUC this means that REF_PHANDLE markers can be missing their ref.
Allowing the markers to be in an incomplete state is a footgun.  If
possible it would be better to fully generate the markers when we
create them.  If not, we should use a different marker type when it's
introduced, and convert it later.

I think what's going on here is one type is saying "you have a
reference, fill in the phandle", the other is saying "you have a
phandle, fill in the reference".  Those seem like they should be
different types to me, even if they can be converted once all the
fixups are applied.

> +
> +			if (m->is_local) {
> +				phandle =3D propval_cell_n(prop,
> +							 m->offset / sizeof(cell_t));
> +				refnode =3D get_node_by_phandle(dti->dt, phandle);
> +				if (!refnode)
> +					die("Node not found for phandle 0x%"PRIx32"\n", phandle);
> +
> +				m->ref =3D refnode->fullpath;
> +				continue;
> +			} else {
> +				die("Found a non local phandle without a reference\n");
> +			}
> +		}
> +	}
> +
> +	for_each_child(node, c)
> +		update_phandles_ref_internal(dti, c);
> +}
> +
> +void update_phandles_ref(struct dt_info *dti)
> +{
> +	update_phandles_ref_internal(dti, dti->dt);
> +}
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Ux+HZinrKYpYvbvW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloOPsACgkQzQJF27ox
2GdLRg//ank+7vmxRvu2y58RoQYHGeqi2O9rO+DMrb47RnHGalOErMpWFcwDaMe5
0hkOtxV/P8qNlLOFme/9wA2xOIRr0LwkLvPvuujYwkdvfI4LiYWsKEhV21N/e5z/
FixhhpDO64/BzY6ZG1zUuc4Q9l2XZgSu8FIg8ckuSFviUTwAocyYPuZ067vTuvl0
wVrPB0GWUm3DRJ2eV3be77BbpA4zX9tYTJIlR0XyD7j0d+hy3A4CkqW90jGYbekI
LZtV2pvhhuSA9SG4BN76Yyx9vNgUjX38noSUsySdSg7jV1ULJFlpKYQQrlhoCkPv
a+wMGH+0pTa8j1S/bQM7acofgzKVKx7otAGscU/i42xr3LNZEhjF12XAQkgygyvh
HNcrH1thxAxyE4XJkrD+i9oTp8pMJRAyqs2TlirS5CyasKbxQx5Pa5ahRgZGkUAn
FXAvGEm2gm4wLiXK5x8vuo8amaeapfbUVcm14WDBeMzAkPXTYOjkP3P6gPgDCp/s
u0WMa9aUPt0AsOoX2zZ2TN/RQO93h8QFDeftUAZNy/DslFj0H57yQZIyeTdfS4cY
65irHKlsoA6dShFYFpVEWXcxf8853GqxvMAVbeTN7hhZBNpFaLAdhpsNcx+HnOck
cvviiGR1WZRaek+buPAtlmxoBI7Qdo4CYIJUTFPHlWwlR+8wIr4=
=zO52
-----END PGP SIGNATURE-----

--Ux+HZinrKYpYvbvW--
