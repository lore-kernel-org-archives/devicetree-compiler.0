Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5329C2505AF
	for <devicetree-compiler@vger.kernel.org>; Thu, 21 Aug 2025 04:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755750708; cv=none; b=TWGnnyqBoj/Vv8uN+6x77XaMHJomt/aerBIJCe5YhQ3Mz2dmgTcm2GxYR3+20egJauJ1qvBChxJmW4jq+wNpokKJ94/fzgMeQtfAd0L7PI+1DZm89sxniWUYJZsyN9TprBurHKbLcaKpoERUvb3U+VR7L67tZbNCiPbwdJRHaDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755750708; c=relaxed/simple;
	bh=RLl9KLOqaR9hddUME01Pcrl8qJvNF5pmRFmTDsqK3F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pehNvJLFie8yHuTaZspJFvvqV2fVCARGw3jWXHvM1keYJLNFjbqfp93RMIBkZHh+B82yUho3hgb9YKDoSvAgm9yYyKf7lJ09jis5jBzhTIoCQiNTDO9myFAuBmKFET0JwcvxTl126hiI9QIr6ZUwtPuZEvGHa50hRPZwLYWz0jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=OO+QuPLB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="OO+QuPLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755750703;
	bh=ukNUCarVEdUvJuuomBZzbpK9hNJ8o1p+qG5ZwORiBz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OO+QuPLB8wo6KCmtkCIIGt8FbcWkTHRQKt8m65keq4l3vo68UuDTYMgoC+nmQ7c33
	 AHQEVtGap7pvLuVtegQuHaU9X69vAl7DrlVAW7DSiTs3X2GbdYhnYRiqM1/CQ38OIV
	 Du5BqhbQjf17kCbzo6sn/wZrHHWISG2bINgUkkAo1WzZP2BKMpu0mViqcmwvvzDaZ/
	 yL2oH1pFy7MyS1VSJRQ4z6TeiiqrDMYwsvBFtEPAY1v56k3Zdi5WcfbkQ/RD+8uIaz
	 gzu5rH3sflnC4cInz7S9RvSVofGWwg0azIPEGwZqgQecT7z6VE3SdLJ95pqOmaRUum
	 Q6YVzFl0hggyA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c6r4b5dnjz4x7B; Thu, 21 Aug 2025 14:31:43 +1000 (AEST)
Date: Thu, 21 Aug 2025 14:24:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/6] Emit /plugin/ when compiling to .dts with
 DTSF_PLUGIN set
Message-ID: <aKafc7z-7yklmm5d@zatzit>
References: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
 <3dff5b0db7c17aa388010222d36946fe9177f69b.1755692822.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qx2hpweafLlIvlYZ"
Content-Disposition: inline
In-Reply-To: <3dff5b0db7c17aa388010222d36946fe9177f69b.1755692822.git.u.kleine-koenig@baylibre.com>


--qx2hpweafLlIvlYZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 03:11:27PM +0200, Uwe Kleine-K=F6nig wrote:
> This fixes `dtc -I dts -O dts` to make the file a plugin if the source
> file is one.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  treesource.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/treesource.c b/treesource.c
> index d25f01fc6937..72d1cb5508b5 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -369,7 +369,10 @@ void dt_to_source(FILE *f, struct dt_info *dti)
>  {
>  	struct reserve_info *re;
> =20
> -	fprintf(f, "/dts-v1/;\n\n");
> +	fprintf(f, "/dts-v1/;\n");
> +	if (dti->dtsflags & DTSF_PLUGIN)
> +		fprintf(f, "/plugin/;\n");
> +	fprintf(f, "\n");
> =20
>  	for (re =3D dti->reservelist; re; re =3D re->next) {
>  		struct label *l;

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--qx2hpweafLlIvlYZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmimn3IACgkQzQJF27ox
2Ge3oRAAg4p5iT5nGsKiVL1ophV9SR4xdQL4J/igPYX2U+TIkzgFbYjkBNMumoAY
T0Ci38ZLK/ARZibrva0ATBPgX1s1wsv8hkV210iFdEro+uoZqpnIncdofg6JEVpS
RLMH+LKFjOQes3B1gDJ/pQyzvjBbVRWi7yAhxl134aixsFFP9tJXLkf9UOYS07Tp
9NsUwhdgp+CwwLEPpUEkKvt1bvzRfjXSEF0yP+WZsdmCR9yBm3ftcwgADH9ABrVN
eZ2eL2HXbRRxUe2hG2xajbQgnVXV4Dgh17WxNwwWtPXKUZJvssE1bttdWLrDEkM3
sRtGNEz1nzRVEN1oA9GVhp6H5q6ygr9HRs0t5OOJmv/OWQiNDLi0pURTkfhAz6Po
6a6HE6Q1XCnvOxFT1dN5TZiE+GJ3qa6OKUAwsbJDmzbSLf21xvAFrRTJh7Yobmwq
v2B6521BIKbDHbWUdHE55DfCmIiWnWbh2nzzbP9jt9meS7Nq/8reje9/V92aKgdz
8Q7Ja9xyUMSbIleauUkKRJXXIdBf5KJsDW7F4Ac5i6vGPLTlp9qmRZ3sniGfZqAZ
rKwEPtNDPA641EOJapLHZEwrf/3hamYUbig91s2xAuhakaBLJwOUB0vao+hNtckR
nsspDAu6b6GGalGUkaepzmzLk1oEaq5K2U7i8tcdoPagsfT/SIQ=
=8tw2
-----END PGP SIGNATURE-----

--qx2hpweafLlIvlYZ--
