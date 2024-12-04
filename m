Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0151A1373
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733272451; cv=none; b=na0ncOz9XmScr6r1RIcCejfkXzyIzLuJRvntMN6iIQi+bOfBA4faA6iaGMOVFPXXYW1sUOU0pfrhT1szr+SU1w4iwACwNqcrAJO5yECt3VdOygBv2XKyvYQavgqTbD8JlfUFErfTaloJbfqG2/BVAj4WUQeWt7l3ICVx0Utq2r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733272451; c=relaxed/simple;
	bh=Qxm5/pvAiWXngJja0OYzLPBkoQCccziy55lEcqCBh7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elhpqD3xgCMg2b9vF/VF9t+QHAeyOQ0J+7qAAIZUenJS1fUTgHgOyS97TVNwBjysaylm1H1sYMdzdxtcmWxFjAyITVOF1lDW3jLk4G7/uCgOaI7sErSOpVNLtJK8wmuaYSMRAx+KZ9efAbKFu3Tlqw9+dG3vXh3FvHT0/wOMItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Y4v/usp0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Y4v/usp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733272442;
	bh=8y73v07bS5KlBHeO3lpwN4DMbrdprY/FIZYQPqNyW6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4v/usp0sAj4ruyv5tr4dnv8UuqiSAn4L/gJ/YplqJr1Edet8ABoF3rqylFry5ELI
	 OlyMmrhVY7FsoOO35zkGXilrEEycHrSzgbuUM92M6K0QhEGJOHXFDmJHvHROtZtlGH
	 isR9509VUJn02w+CA6JsPjhqbnBSQrbWalFvIujmljbYd/0AqhwFrIx5umczsVRxnJ
	 O173n4PvcCeU79E91VXDKq40G1afqpKOuX+KUaNpVhanychWwILhIE0dz/Lfkbx4Sg
	 YR0u2E911WfNWFULUB7n5ndcEfLwzpiDNjm2SdUqU2IEIq7qH/JHt08yxqxv7+tQ/B
	 W9YXIAH2KJoIA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2z6L1RXNz4xfl; Wed,  4 Dec 2024 11:34:02 +1100 (AEDT)
Date: Wed, 4 Dec 2024 11:21:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/4] libfdt: add fdt_get_property_namelen_w()
Message-ID: <Z0-gn5ec92IpHKNc@zatzit>
References: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
 <20241203-setprop-namelen-v1-1-d1ea333fbd6c@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r92RkOTMPcTz6WE4"
Content-Disposition: inline
In-Reply-To: <20241203-setprop-namelen-v1-1-d1ea333fbd6c@beagleboard.org>


--r92RkOTMPcTz6WE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 11:59:59PM +0530, Ayush Singh wrote:
> Similar to the non-namelen variant, it is implemented in terms of
> fdt_get_property_namelen()
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  libfdt/libfdt.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 2e182ea3314d44f30e5362ad1ca62431c0bf663b..7d0c252a34970f4ca841935f8=
088410a3970127a 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -712,6 +712,13 @@ const struct fdt_property *fdt_get_property_namelen(=
const void *fdt,
>  						    int nodeoffset,
>  						    const char *name,
>  						    int namelen, int *lenp);
> +static inline struct fdt_property *
> +fdt_get_property_namelen_w(void *fdt, int nodeoffset, const char *name,
> +			   int namelen, int *lenp)
> +{
> +	return (struct fdt_property *)(uintptr_t)fdt_get_property_namelen(
> +		fdt, nodeoffset, name, namelen, lenp);
> +}
>  #endif
> =20
>  /**
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--r92RkOTMPcTz6WE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdPoJoACgkQzQJF27ox
2Gc+kw/+InM8oRUmSZ2W5pdID4YdFUBZtUkHZT4dmDWT43aJq+459uqf6AFVeqBF
RqAw/MDw149I7LosroAfLVJiaXXT6FN0rp4EQpjk76q1T+P3bqHnehk7dftGJXOd
kybbv/5UfDZ4fTzSwXeCG+Ym1UaCky0UEJiTaIlXAk3TyjMCr4nv1P0tCev8Grjo
f99Z1f0cSa3E+1JK3z2dsTG/UD9bbUxCzwFHHwXTfV7TojwBFeLRpu1ymtIXazUA
SUjT4JUyEGPrn+EhwTLhB7HEfduG0loLKoU3nQsMtMd60HdK1AWEd6mPYSLi1eZh
qKxSOCeU178EwNbHn6BO5H+z4Ij96Uub6UccRdVmmKekSWQMoR3HjwPxmOpPTI63
o/9ksOSoRlGeeDeCVXZnpJW0rF4KXDE4GcUUinb1bcCBDC0YLtR+ef+/r6YJ0OBp
zTLf/3/uY0dCfoQSRPolpuTpZhsDAXk6lBDDpga74SYu4ZLHsGA97V/zKsTdBBii
PV2+c2Qx9OtWIngTVnzBrSjbZxs+p14x4IRsEgmHP+/E5rGjOln7S1LvXhFB3Deb
7OfkKgoUwdFdOMHEA+IXDgm2whqkiT+B6FIGI37R63WF7JAYecX4OMzAo+txAfIO
Me0wTU/KxOjB2vGd18onqGl9br1X9qcPQBjRBCOI8MRNN+skc2s=
=SpmD
-----END PGP SIGNATURE-----

--r92RkOTMPcTz6WE4--
