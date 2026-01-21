Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6CA3587DF;
	Wed, 21 Jan 2026 09:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986385; cv=none; b=nzlveZAJG7bX6OHgcN6cd9+Z+Hpva8kdQqYNOGIFgn2iI214PWj2NLeRSQNkWKtFSmM3s5x2lbHPanHKJTtBEiAI17GCeJqYcrDiiivfxuAvQ65BZ/Sxp9efiWUZ82BhSLFV2kvelEkcaQdQzv990msVwVL5BGbmZHTdJAb3XEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986385; c=relaxed/simple;
	bh=C0xGf1aMKITpS9K2TEEsbIc2xtGT+LqJvA6yRS6DoPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQ0V6Vytwk2VClKS4kEkYieHEl61ETbEJD43kwdhKtR1EwNk3jQpE9kbeRcDOSX3tVwc9lqWaRuWIPZIkD3wG6VR9i5pUfmAS8vxqDxK96GnPrJkrQixlq5EWEgrHmeSb/Bl/gDp/JosXgp6RhrkubF+f2FtQGVKYKTvgEIVGd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=U26WU+FO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="U26WU+FO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768986381;
	bh=S5peN/Kaw9Rh6xV+jLqOqiw0yd8+tfKZSpvExpJJJM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U26WU+FOY8IJhDYjcMQ8VnvYSHGCDFlo0vmDjWwW9Cjwb9lmBb+WtMOxGvFkiSQeE
	 h0SWcsCxl1chLd/aA5Td920r4603adFY5iU1Bxnx9oTLSnVfv+W41wu7XI5v4w6gn1
	 RhJke1NiWVm/1FBXwAKC4vX81L2vg1lbjeOviJ8iDFmkB7ABaDrbop49r7iyMgN+uA
	 j6entmsjMhPmsuwlgfbGTzmnbD+urQZLaeuDY8Z2AJxRa+GbR05FCqu+nhhlEIsHFD
	 keluW63pG8dQEgOGSNV6JKKv3BKW6RXX6wkYJb4/mUh9wtj220l5y9JWeE8CRM0Swz
	 HYIYcvRPsNy0Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dwyws0505z4wDL; Wed, 21 Jan 2026 20:06:21 +1100 (AEDT)
Date: Wed, 21 Jan 2026 20:06:11 +1100
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
Subject: Re: [RFC PATCH 64/77] dtc: Add support for references by path
 involving orphan nodes
Message-ID: <aXCXAwm34LobcW1h@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-65-herve.codina@bootlin.com>
 <aWiQ05zlfPfcIaZk@zatzit>
 <20260119173831.3341e827@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xSJeV4ZdgrexttyB"
Content-Disposition: inline
In-Reply-To: <20260119173831.3341e827@bootlin.com>


--xSJeV4ZdgrexttyB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 05:38:31PM +0100, Herve Codina wrote:
> On Thu, 15 Jan 2026 18:01:39 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Mon, Jan 12, 2026 at 03:19:54PM +0100, Herve Codina wrote:
> > > Referencing a sub-node from an orphan node using a path is needed.
> > >=20
> > > Indeed, using the following snippet:
> > > --- 8< ---
> > > /addon/;
> > >=20
> > > &node1 {
> > > 	subnode {
> > > 		foo-phandle =3D <&foo_label>;
> > > 	};
> > > };
> > >=20
> > > &node2 {
> > > 	foo_label: foo {
> > > 		prop =3D <1>;
> > > 	};
> > > };
> > > --- 8< ---
> > >=20
> > > Even if node2 is an orphan node, foo is a local node. foo-phandle
> > > references the foo node using a label. =20
> >=20
> > Another option would be to eliminate the idea of local references, and
> > require a symbol be attached to things that you want to reference by
> > label.
>=20
> Hum, new kind of references.

No, I'm trying to remove a type of reference: I'm suggesting using the
same format as for external references on local references as well.
That might mean things referenced need to be both exported and
imported by the tree creating them.  That might be worth it to reduce
the number of cases.

> We have reference by phandle to local nodes. Reference by symbol for
> external nodes (i.e. nodes not present in current dtb).
>=20
> Now new kind of reference for node available in the current dtb but
> in a different tree (orphan tree).
>=20
> For that we need to:
>   - Mark the phandle value in the property as a cross-tree phandle
>     reference
>   - Add the symbol label in the referenced node.
>=20
> When the addon is applied, this new kind of reference need to be taken
> into account in a new way:
>   - The phandle value in the referenced node need to be updated in the
>     same way as all other phandle value in nodes to avoid collisions.
>   - The cross-tree reference needs to be resolved.
>=20
> This adds an unneeded complexity.
>=20
> IMHO, we shouldn't eliminate local references.
>=20
> We need to reference all possible local nodes by path even if cross-tree
> due to orphan tree is involved.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--xSJeV4ZdgrexttyB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlwlvgACgkQzQJF27ox
2Ge0dg//W/TDlG7p0f5PVq5x5rRodgKag2xF8snDWBZey2IBqWk9AfcpiLjNrsfR
focbM1pkcYajLnTRA5AEDiQ1+ycLA3wnESQrb1MuZzkTvE1OLB96PV865HpWXUU4
6IofTNK8uvDVnjfXEjpm7E+gtJaYDyd0MlpzRl5rv9KpxHnsWd5K4wySM+Yy2WdT
V3/jalWMOg0t33ucI2oceYPW7a2coh27m769AadgoP7jWuE6Y/flK3yEgz+EVzkJ
4WFMb7jDUus69j0l35QA2RjuStvcZvCf9mE2uHuQXo/V50pWXtfzu/1Nj1DQHyIK
0oYHNBq46XdZZ3of3dnjxF/L2TYsVg3dFLYl7MGOj3rLWsnz6O5Zg/WjrhF3YBMu
6JHG+8+vlGBDyNb/ls56IdPbX8ioN97coVtyrKrp29c4nHvVSZrmDjfgrwROdVhK
t40xCp9ovFD2OZbixaTf/5C9IPY1Abbu5mwewOz5bD5XXmpD+ge8pwYWi8z4AJQc
8bA2J7gqa4RUGsC0G131OdpqhdLmnX9SmpMxUitT5GvMh3DeewcexuOun1I4BJ5m
2xAzuDspTdABuqMzsZKHOuiL9FFjioTqlxWkryEngBCG4YsOQ8hPSZrmW5X3peZd
HtJxlf/ZHrpriOwKDITdXe+mgeeTvHR5m/8VvJjTKOVwdDzcvIc=
=NkYw
-----END PGP SIGNATURE-----

--xSJeV4ZdgrexttyB--
