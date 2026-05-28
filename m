Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11331D5170
	for <devicetree-compiler@vger.kernel.org>; Thu, 28 May 2026 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779931993; cv=none; b=t4U2FJOS+eBINCW0nHziXsaVCGhzLsJwjVrQ8rneHAjQ249r9g4ZKI39CvaQCJsSKTdzbGXIwf0ZZ7nkUt+yncsBeqmIiDXfBAa2nH7FhpV1CfYGt4hxVS2OARE/HumAmtnOP9GLrE42UN3nTqEp51M4WyuG0D5z/4nWylCalOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779931993; c=relaxed/simple;
	bh=23XlWZYpS0vvkvEB8f1UTlFW+921KCk7OuUCRNtuuhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGKy6yz9Kivnert7cRxZPd/aYyDTltyIAeTIFswXUAb1yU/sKcw871AaYv6N7ah5cOqI0mCCvxQC6NSz422LrE03PZQU7EoDOACPaE4bNSm8GzpnZl+Wm5qZ1ZL1aU0H3ChZNg3fxDpHbOjRa3uhinaMzSEMGT1THEykxnFNGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Nw7lY61G; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Nw7lY61G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1779931982;
	bh=PrZHY/lGC0hubcar4pY5fp6fatq5P24nef42YO8dtjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nw7lY61G3HmeKLmqwe8M9WKKqclEWAhnjxKOcdWZh326DWu8AH2tcdi0cMXHRKOtB
	 Z95HoU6n0C/drDC5jl9U888NWx/X7ZwP9m9wbiZx1w2pRNqci6SfYV8WwsDfi53ued
	 JWqQKSwK9/+JikyL0Ax5stCDkLpp36ZFeT4vSmzk96nWSF5kNVFvY8Y2aD1eGsqrKc
	 3RHq587g9h2EpGUBpSKywANkm4OW/cbPFL61tkWjeVtJlFQM5672ADkjFjj/m0cioG
	 A6oqWIipWPVRDRorKOkcMO2FJpJ0BO5C4zxZksiIYE2mwoFUTGjGrtXG+m7MlqH3OJ
	 z94pR1L1Og+7Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4gQpsB4RTvz4wL5; Thu, 28 May 2026 11:33:02 +1000 (AEST)
Date: Thu, 28 May 2026 10:58:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: Tag a new dtc version?
Message-ID: <aheTSZ-W5kHgVTnD@zatzit>
References: <CAHuF_ZqwfZ9U5FBG+BQdmcVzESfKWvghCL5nc8sqzzzO0VBDYg@mail.gmail.com>
 <ahZyT0glgYg0783m@zatzit>
 <CAHuF_ZofH9r2je2s+jy+PF8rsZUAQMU45sKrYdh6u4OrE=RCFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6dRSjEZs53Bnhxie"
Content-Disposition: inline
In-Reply-To: <CAHuF_ZofH9r2je2s+jy+PF8rsZUAQMU45sKrYdh6u4OrE=RCFw@mail.gmail.com>


--6dRSjEZs53Bnhxie
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 04:51:32PM +0300, Yedaya Katsman wrote:
> On Wed, May 27, 2026, 07:25 David Gibson <david@gibson.dropbear.id.au>
> wrote:
>=20
> > On Sun, Mar 08, 2026 at 03:39:34PM +0200, Yedaya Katsman wrote:
> > > Hello,
> > > I had some issues with the python bindings from fedora, and it seems =
they
> > > are behind the ones published on pip, since there wasn't a release of=
 dtc
> > > for a while. Is there a plan for a new tag to be released?
> >
> > I pushed version 1.8.0 yesterday, sorry it's taken so long.
> >
>=20
> No worries, thanks for your work. Did you mean to also push a tag to
> github?

Yes, yes I did.  Done now.
>=20
> > --
> > David Gibson (he or they)       | I'll have my music baroque, and my co=
de
> > david AT gibson.dropbear.id.au  | minimalist, thank you, not the other =
way
> >                                 | around.
> > http://www.ozlabs.org/~dgibson
> >

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--6dRSjEZs53Bnhxie
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmoXk0gACgkQzQJF27ox
2GcXHg/+PuwQbpdNjDS//NV94AX3lfr1UFTzuhTQSh06PPT0vBTtib0GROoDi9hw
kEldLZTHRUjOx+QMvt5yGFrzdGhNT9kC5cDeVRyWQfmhdbYAYWWSJIkZAeuJIH1Q
yB/Eo430lPXWPeihCOSagMppmeDn4Uy11AvGcpLaWZB8DUmlYFLomHSdvEvFcEXh
YomeYN6i5a+114oaeTjPAk0QxBsq9QtgHzgW+RJuptUY5493DcHEcFafhITyyS/5
H6kGSHU+Vrc5KXyKi2W9Xq9VvcC9X2alR6okqmgKnVHM81ILjg5iOl5Wfv3/GCTe
nBx8BN0bEl//D+94D5Q2dSCArPcP82h/CsC0dD5yoT5dXd5WyBy5C9BvbTZ6a2/s
MIrHN5UX10eZH4QIk7YveC8HtBj4+fUwVpeS4tGZIt1zsZAY2obOW+wPhxlFJ47a
uXHpf2AajTmA+7YimxuqCd73mW3iKLpduenW3U9mWj2yJL6LV4CqLO1YMfvD3YWx
J4ofkRjoRobvX0vh0BBzxh8hNzGnGtISoMkq4mxJrz6/j9AayDAeF56Cby9qQms4
JEAeqDvVHYI2FnjlnLwVZQtArbVIyyBY1Qh6J51Xzv2rkxww2rT28jN7mpHGiMPv
MBfgj4CO15fTPrnt7wiSXO0Ulpb47TopIZ22mbVZSTeR+Q/gKjo=
=bSDY
-----END PGP SIGNATURE-----

--6dRSjEZs53Bnhxie--
