Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2252E266C;
	Mon, 19 Oct 2026 02:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375975; cv=none; b=iNivxWU6piL20jZGeRs/H2aGkgjbALIN1X2Q0QzOuVCOOLfADWrK6wI7E2/dzZ9i+ERGGk0lSlXF/yF0GpkDC3wvrPyuMyCr+3MggWwrrHwXVrM8xL0lTl/Lbco2EqUZyxGw9ljxqT8DPpezLMoHjsvARzGbs7VIduVN7qX1dWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375975; c=relaxed/simple;
	bh=bGqlz5cBHrHXBrQ6NnmaZgdhO1kC0yfueLXmcKZAixU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsEIbXXq7Htg7d1jmcmCXB7kTij0DNOVq7iadFiW63m8bRl6dqpupVcoqo8SQ9lskGFsrgXvm+R2h+C6UHJs234kYhw4GbflTpSDOzP091fExyu+NO5ToOnKLl1eLP/+eGnKwIQ+gGzHBj5Vd5aguNvvoXMTWjt84z2zMzBsJdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=dea22Ug6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="dea22Ug6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792375967;
	bh=OB1MoZD5HIeqlKWyggxYNOuX3XR1hccsZRuPmfAhQXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dea22Ug61H0AdMSjWd59Ub3A1aKxxigchzKsJgt+hOg0fghOmobqG2BY7/3QFTi7E
	 ubbsfUr590AnupLUBHpNf4OVHV5uu7Oxv8to54vgjHIwf6oAQhSnxWMkTbZecFp/p+
	 O9UyTrg/8zd8iywyH1y51BfgdqOgd6vPk8/nV9dxLMK+aTYper5yWCZxAvV67XaX+O
	 DANZci+wOlzZProSL8OtG3bIFemxY320VH2QMJyGskSiWXBylpejFpMKzc/9Psrg16
	 reg8S26PQWG2eTsnVJNHOZwuLbc8R7ti+z87rB3IkXNFgw3zMO1eqh9STxlxpo/XMx
	 rAlb6jGOFRn+w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j7Jwb63DKz4wSr; Mon, 19 Oct 2026 13:12:47 +1100 (AEDT)
Date: Mon, 19 Oct 2026 13:12:40 +1100
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
Subject: Re: [RFC PATCH v2 06/74] dtc: Move fill_fullpaths() into
 build_dt_info()
Message-ID: <atV8jpAnPNNvmitA@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t1fP9h2zFa7Ehq4F"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-7-herve.codina@bootlin.com>

--t1fP9h2zFa7Ehq4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:35AM +0200, Herve Codina wrote:
> fill_fullpaths() is called unconditionally after parsing to set the full
> path of each node in the parsed device tree.
>=20
> There is no reason to call it outside build_dt_info().
>=20
> Furthermore, future metadata support will need post-parsing operations
> in build_dt_info() to produce a fully consistent dt_info. Those future
> operations will need the full paths filled by fill_fullpaths().
>=20
> Move the fill_fullpaths() call into build_dt_info() in preparation.
> No functional change expected.

This seems like a good idea, independent of the rest of the series.
Applied.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--t1fP9h2zFa7Ehq4F
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrVfI4ACgkQzQJF27ox
2GcZ0hAAlCCHjMxGcKUi8Hef3cUYeUEoiRv/iXVIvatULeOlLWNGf+MvOmj3918z
SFv/iLS/0CWmWyXUAEVQy4ZvladcD5vXnkDCGvWu+vlX1XwDlttxtH98gjWRy7fB
uwWtJnRSWH76MlCaxbYe/YzgDplM/wAkpZdecwq7JFu29YjJu1ZphA2BKPmo5nlE
hNLN+pHL6Oz7PZ3E5taV2QnXiKCcduD7sq4wjarw+ZBwLeteJDuGSDdag8zCqT4C
cOMtNrVOZJ1eS3+QkAdPlRKqAtuPLl+n+clR1AgW+c8gEbuRpfHCueUzUKojcHb9
Bv480p6vvc6TvXPEElkWnVaHGQt8C7eDGuNj3rbV6htaEd8TpncOvkXgBdYqQx5V
HnItqUzH/TXB5PevOCFstM/0Frt/1AQ2NlfuD3C3Vjb3dpZRg87oWqvvZvGY3jJv
OihWZQoznbqifa0x93vTtALpTEnH3dYRmOIwkj+FSMz4256VUQ5ziCykp1XvFzKJ
/ZTLLYs3EgrYFo8bLaceWcveelbYrXRM7/LCSUIgw/7R8zi1fuRqTjdUHcQ2H90G
Q1+q1zAVdTggLHrUcQAFxHlh7d7DZ2YHaYaQ9qeOFoo6lE225Pmgg506naAmLYS2
Rs3R99e8t39Nmqzxts3SIApwUzfYg4kJ77zusq2LO7aiYkSgJZ8=
=Qrxl
-----END PGP SIGNATURE-----

--t1fP9h2zFa7Ehq4F--
