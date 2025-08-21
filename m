Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5332527A108
	for <devicetree-compiler@vger.kernel.org>; Thu, 21 Aug 2025 04:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755750709; cv=none; b=HOPaAnT2zuUYkLsRAcno3R2aAux6Ct+MNY32UDe197GA5T7jqkIsGx2q215XCocmpJ5xsokk6IdUQTrF9eN/S830TtTzuePCv98tSuztZHoAjf2M1h01EDOChbfjaAZ5FGaQBDL9V1XhFE+kvpjOxJrx89UzKp4+Ps+TTjJNjCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755750709; c=relaxed/simple;
	bh=8SfA5rNUGQMkvfB5nmS4sUzwkFSgNsoqH8prkVVqD+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3KPMbedJbY1PUPon3jv8KXujRvI6Z1IYZzWnChNTEpsvLmEKFNDMCmsr3BsGUj0ckcibSnWoif4FRRAjkZN6MO6xdJGAtoDlIFQTkEk7WOzSgjaRko9/zNZlBOJGvKEqoeA5nMOZ6PSLcwPp0FfVHcAyeENSsKoF6b1dLv3hOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=k1Xyi1Nx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="k1Xyi1Nx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755750703;
	bh=VbLaqDmby/KflDMy4yYxm3x/XuQ3J2/BORJK/OkuMhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1Xyi1Nxc+oCQpzxz97nJwnEwfs6I5eV5HQQByoZzq/dVYbg2s1kYVO9P85Ii77ff
	 PikPvxlWRgw1DCeaOy3yT5TfuNXhFX0lHe1qTyOWtoH/6ZIH9phUWLdnfNcdz8WdxE
	 J3MjA5kAVG85PzsOIukLeyvWJXILRC0WktW1y2jQ0koLKSo21U3ZVDHE7CS+X6e5yO
	 XJetbLxx3bg+29m9DrNyXUFuh2yhRXC7SKbRwcvP4XYP4XnTzaY9QgO1wODQjaP3+D
	 Y2Gdl6q3NdXB4IdnIbgnp935ehKGPEVHdt9ycpiik9ZlLDuFAqgYPH5UwxvMJIH7c9
	 iUVYmwfSvS5nw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c6r4b5sQSz4xPd; Thu, 21 Aug 2025 14:31:43 +1000 (AEST)
Date: Thu, 21 Aug 2025 14:24:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 2/6] Set DTSF_PLUGIN if needed when compiling from dtb
Message-ID: <aKafg3Y4fzQ210JY@zatzit>
References: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
 <03075deef27a7474914093282be9bb4e27dbce81.1755692822.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qrVZ8DjWaSVjA04r"
Content-Disposition: inline
In-Reply-To: <03075deef27a7474914093282be9bb4e27dbce81.1755692822.git.u.kleine-koenig@baylibre.com>


--qrVZ8DjWaSVjA04r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 03:11:28PM +0200, Uwe Kleine-K=F6nig wrote:
> The need for the plugin flag is determined by the existence of __fixups__
> or __local_fixups__.
>=20
> This is a bit simplifying because if __fixups__ or __local_fixups__
> exist but don't have properties, the plugin flag isn't needed. But in
> practise the test should be good enough such that this corner case
> doesn't matter.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>


> ---
>  flattree.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/flattree.c b/flattree.c
> index 30e6de2044b2..f3b698c17e89 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -807,6 +807,7 @@ struct dt_info *dt_from_blob(const char *fname)
>  	struct node *tree;
>  	uint32_t val;
>  	int flags =3D 0;
> +	unsigned int dtsflags =3D DTSF_V1;
> =20
>  	f =3D srcfile_relative_open(fname, NULL);
> =20
> @@ -919,5 +920,8 @@ struct dt_info *dt_from_blob(const char *fname)
> =20
>  	fclose(f);
> =20
> -	return build_dt_info(DTSF_V1, reservelist, tree, boot_cpuid_phys);
> +	if (get_subnode(tree, "__fixups__") || get_subnode(tree, "__local_fixup=
s__"))
> +		dtsflags |=3D DTSF_PLUGIN;
> +
> +	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys);
>  }

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--qrVZ8DjWaSVjA04r
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmimn4IACgkQzQJF27ox
2Gd6EQ/5AeE/CWg3fXFgTHX1zTYwybEiXR4WbrEs2TWlkSfwme9RUO7feg1u7ode
YerSYM5iZsKcUUu4e59CFOIDNNKCGGNlNrUoSYprvj8CByhKF8YIoxQRK4vV4a1q
1dqFzOl4sLlgZaUejukHCmIxu8Nx6+IfYiUCYY9T4wEbNncju/Qas5iWwbJueAzu
FJcqKGXMLzIy3NTw08THBo4Bgau1qXOtOQwaKYDuZUhz78WjsAm2KBl2pMNQAPBE
Y4VqgLGZyzqEaDjI0qPnye+bbCU4frcEIm6B2OR6kcE54+6glIFBj+W4hcprxQ1A
tBMIx/yFDrtQXARgALiqtTBYnq326vHd3+O7scGdFnLRRBOn0wQXyxMJy3cSbjEI
/9htOIBN1EsL2VixisBr1FPa6CIIsW095OOQ57FYyJkqyyx5dQSl8zqL9AdDfYpQ
/bNgF1SD+EDu6dcjCNHbBnzNWLhu07G+K1ehmOdhRrtidJFE1oHv4b0G7MuHEg3E
4UtA3vmZKrgSQFskekebgjcpEjAnzN753ZCrxURKF/hB5fqixGMzidJTEy6t14NG
dKPDDFL9SP9rw4WUDikqIksGDRrsuWOLPtOoci1r5XAGxQmSdZKTHK4gXzGCiM0E
/ghNJXfFqpCJxBj0aYhwjpG8MLi/vbc2pmGScEt4dvGFoK5I/Ng=
=05bk
-----END PGP SIGNATURE-----

--qrVZ8DjWaSVjA04r--
