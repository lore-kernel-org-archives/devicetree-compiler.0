Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4359039BFFA;
	Thu, 12 Mar 2026 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314013; cv=none; b=NdK5sdGqCXXZwjI+j1P2N0hv7DheEO3sAenQx2skADngh6OX6GHY7ZRARRcxESHRK07GxE/O4PpdPn8n5IRhFzqJuOjPn3ID3TOiUUtim0cFu6Frsn4SisbYMFtNtetDluVzeNyeid9HV/dIAZdWw7R3eajcLt4F19jBWqKslCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314013; c=relaxed/simple;
	bh=fK30BnDAuRRayEMvtHyRyZWywfWn5YVhU+eYCu1d6Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FM84gU6I0ehEfJzSk0zGBgZIeziKxCU2UoVwt+YNG2US9/0XCyifRU3trODJCiW7ynoQjMwAPTV363T5RcHZ7Ojbm0qTNGj8SbDg+jrYqV0fnimFPT/mm7s/UiAFR5LR36Y8aK8Mc6nlIvyaoJvgU13P1zat65mvK8Ns09OufS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=WVwnyp97; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="WVwnyp97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1773314008;
	bh=ogOJuVgEOyNp7MYF1N10yAHFemHK4vJfX9srTkNa9xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVwnyp97UgwtuixzV0wWHSJmJO7OW5Hpy1AZe1WcygRzuHG8pGOh34y0bbodyTeTl
	 rWgaUqU3P8yDARHx1ih5gthLUP7ZpheVtyJGAR/CvTuZ1EnNmkay9sy7tvlDdHy+zI
	 cmm3hK2sgRcfzRUjH4wZ/cVjVAW5Diho2TQORkk4fZPTNdEH9dm9MY3Ycgnh9BvDpQ
	 mdO9f0DiL2+C1rXUzGnIT1PDbpgEw6wAPB1hLhHM3fxhSNP0HsZp2QtP+kgxBkt9s7
	 bOYjzL59L7rDbXDcMwXOhR2lng203jFjeXLKqlPb86IYBju0F8shL6Y3SsK84FrDkx
	 j2djh4KIRBysw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fWlNS4M7Dz4wGX; Thu, 12 Mar 2026 22:13:28 +1100 (AEDT)
Date: Thu, 12 Mar 2026 21:21:45 +1100
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
Subject: Re: [RFC PATCH 00/15] Add support for structured tags and v18 dtb
 version
Message-ID: <abKTueGkoFYpOwap@zatzit>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260312085400.3a11df8b@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d439fW6Annuy2nfv"
Content-Disposition: inline
In-Reply-To: <20260312085400.3a11df8b@bootlin.com>


--d439fW6Annuy2nfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 08:54:00AM +0100, Herve Codina wrote:
> Hi David,
>=20
> On Tue, 10 Feb 2026 18:33:28 +0100
> Herve Codina <herve.codina@bootlin.com> wrote:
>=20
> > Recently, I sent a RFC series related to support for metadata and addon
> > device-trees [1].
> >=20
> > During the discussion the concept of structured tags and "unknown" tags
> > emerged as well as the need to have them handled as a prerequisite of
> > support for metadata and addon.
> >=20
> > The conclusion was the need for a new dtb version (v18) with support
> > for:
> >   - Structured tags and based on them, "unknown" tags.
> >     Those structured tags allow to have an standardized definition of
> >     tags with the capability of skipping a tag and its related data
> >     when a "unknown" tag is incountered by a given version of libfdt,
> >     dtc and tools. Those "unknown" tags are tags defined in future
> >     versions. Even if they exact meaning is unknown for an 'old'
> >     version, they structure is understood and the 'old' version can skip
> >     them without any errors if allowed.
> >=20
> >   - Flags in the dtb header (dt_flags).
> >     The goal of this field is to have a placeholder to specify the
> >     type of dtb we are dealing with. For instance, addons dtb will set a
> >     flag in this placeholder
> >=20
> >   - A last compatible version for writing purpose.
> >     The goal of the new dtb header field (last_comp_version_w) is to
> >     disable globally any modification. It works similarly to
> >     last_comp_version but for modification. It can be used to avoid any
> >     modification that could be done by an 'old' version and could lead
> >     to inconsistencies between the modification itself and some
> >     "unknown" tags.
> >=20
> > This RFC series implements those features and leads to the v18 dtb
> > version.
>=20
> I sent this series a month ago.
>=20
> I know some patches have been applied but what's the plan for the remaini=
ng
> ones?

Get to them as time permits, which I do not expect to be soon.

> Is there anything I can do to help move things forward?

Usher forth a world where small projects get sufficient support to
have apprentice maintainers?  Other than that, not really.

> Let me know if you want some rebase and/or modification and so a new vers=
ion
> of the series or if you need anything else that can help in moving forwar=
d.

I will when I can.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--d439fW6Annuy2nfv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmyk6oACgkQzQJF27ox
2GfnPw//RpwvbzMuQROnh5UoDdsdrkZWylGx2xKuoMVMg0aMpnRBDMJ54FZQ9OZx
zcJUjdqeuhb4LxUtGwZmmjo6Ab+WonINGFIZmGURXzBQrFTu2tWa2QVsAz7XXBe0
7LBcj1YaadQe4cgZS/xhr5aDz1efJhKwWI2CNi+0xWajNdt7wX0Wsi+jMy2CLnDr
VTkDmCwzQ3OWlVFaZQ99e/hL1JhdywEVtBCCEeinLZwYLy7+IA7fFfHTsDGbvmaO
obsIx6nKKE8YWk71J72scdDeajdngmKOzW9xuKCtWcTKMPO0RZUfkdz262rX2isf
8dExCWERYXr0M/nmLnCu1tHU7kDTH0AF7sRzaugTwrupG6MOI5g0ivK3iWX2yBTR
KDfzcDkMV/BoHH2OaA1Sc0DUX3oCAXtXN51p2PhotZKNtDNOzdYrK/2u4P89GSjt
YtVkvWC6bV4bh5JDgnSLKGzL3ys6r/nWhDnmZrbeNPUfo4uWa/QHQ57fhgdgO0x/
zJv+GB0MOOhJlR1jajYDXm2o7UAr5ehV1ZnT9XpXaoactOnzkQG3uTrQWu9ibB6e
TYnVQGk9zkzzFMFjq7/uvFNc2kaxDRoQcesHaOBh4cDu40FRDbK6TJ5uYU1MvwgI
W/3GaSqhX5IUZHPuDD4++rJVkjGG6Jf2Q6mshVwCvciI06OWa88=
=XoO0
-----END PGP SIGNATURE-----

--d439fW6Annuy2nfv--
