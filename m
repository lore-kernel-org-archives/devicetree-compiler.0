Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06EF64D
	for <devicetree-compiler@vger.kernel.org>; Wed,  6 Nov 2024 03:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730863394; cv=none; b=k5cwT+iXw/oqpGW98fv2K9mzXM9+Ux1QdfmrRF2jXh8DMydWPjuBaykhM9ANRO/3nhbRw/A23SEvVp7gD35QANouuGbD9yQbLI45hxkHyp7/7V0o4vNS1PaKQZpw00m0NXoFGC7eQaMx9cMPfKuYOVh+6gBTpM2mMH6MEV5cV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730863394; c=relaxed/simple;
	bh=gVK+Glo0g1BdF12fsVwChn2/hiJvoByQXxkl4khqA7c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0oC4mreDR/BTjgiRgmZKjuTeXy36Utl3pmEjn45NzZ/MchgoyFztpYUdsy2pwEs5pjujKVIChc05m6YDRM8SWBJvzzhrKNutA+9DCDb4Mv+yGTrcXHPgudN9yVNOQZjTMaS7irFUTkcw1n9GhlPBbzA7FUg/bZItJBYMZN+iYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=OKRUcFzL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="OKRUcFzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1730863385;
	bh=ZWOHFaGcBFgepm2xqvMkt6abJnsosW6tHAEmPhyUet0=;
	h=Date:From:To:Subject:From;
	b=OKRUcFzLOEUshan1WdNTzKXnSOS8pHyru/T+BvgZtlOPz+SsUhVrmEADCZ7Ne4yjP
	 P3uLfcKrzz59XdtGob0AVo4LD7BqpQUwzTvNx8eGQzzVcZ8DBgCAnr7ndOICcUXhNl
	 iasCPzycGPlALONkEISchHxWgucoSQG1ghAGjR9jIY0Ou9iDi0GNMDpDUn1kGfC/bi
	 orO2QTXR1VIPIW3gsoKGFeDRK/A2IJaZQWq+KFjp8taZ98/Rfw25hBnYPUovJz9zT3
	 JFG0F6/2bsF4RoMSJQREDI07uM5U6N7MCofPthpWuqF98aZyUDJOKfbTlVlLHeKQnl
	 Mrb2lyjEI82LQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XjrBK6PLJz4x7D; Wed,  6 Nov 2024 14:23:05 +1100 (AEDT)
Date: Wed, 6 Nov 2024 14:23:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: devicetree-compiler@vger.kernel.org
Subject: Device Tree Compiler v1.7.2
Message-ID: <ZyrhFOUYIoR2xpnQ@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9+1uQTwu66L871q3"
Content-Disposition: inline


--9+1uQTwu66L871q3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It hasn't been that long since v1.7.1, but several people have
reported a compile breakage with swig 4.3.0.  Building this release,
primarily so distros can easily get the version with the fix.

As usual, the git tree can be had from:
	git://git.kernel.org/pub/scm/utils/dtc/dtc.git
and tarballs can be had from:
	https://mirrors.edge.kernel.org/pub/software/utils/dtc/

DTC 1.7.2

Changes since v1.7.1 include:
 * Build
   - Fix automatic dependency handling for paths with spaces in them
   - Fix to allow compilation with swig 4.3.0
   - Disable pointless warnings on swig generated code
 * fdtoverlay
   - Improve error message with missing /__symbols__

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--9+1uQTwu66L871q3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmcq4RMACgkQzQJF27ox
2Gd2wg/9Ht6S3vVkx635quRdi7hJ9SyFYLxYeQEIynn4IkSuJr6eKgODqq4Ooznl
RoyKXaoUVbBycDhB22Rj2fpfdUASCBhx5o7NhgIWXJtQn6KoixRhDThLUYG4mbVU
/h8dimqBMTHdg06WH11y9eVT8Mkx6s1cwD2b3ZhoQXTTUiUIZbhQtGHR06ndgq6S
20Z9W9b8Yej49/xy8ZLXsHnJ14IwVIXJpXpUgg3r48DH3Sqx76o3jwQGz663wNIi
Xu6OXruYqB9RU+IN8lPmny9tyIv/tEiS23WFJUXKpBKcn6oSYNxgIUe4PdCEe2uA
VvS16mNyEmxtrjpcJamJtxClyrGqc5P+XRjGneD2kl1fOkMcD+kpKdhsDTAsRuXU
ue2+poiM1xxz7HHSuBwKcvqB/g+qsjdli8fgeVMi98dBdq7S6kzhRK374iEDihnD
VKD9ni/hrP9IwOdXQHUSGizrFOWeROV9ldcIRbU3xwjw9kVzlcXtHuY35/WjY6IT
SXfXymQTcDqKO/xI7b1lGsk7iB2SOiwmo0MPy/y/58a82wSBfuK2eZEGnFoKd9yA
Ijc6qIiIA6a79cs24frazruRoe7u8BSB4ztIuGI+ZOm6fFmRwj8HRgVSR4sOZHyU
mFP79VNxFJlVdUBlcIlpgrWc9JiTi3x6m4J2D9QsGPeUoD32ftQ=
=/pmM
-----END PGP SIGNATURE-----

--9+1uQTwu66L871q3--
