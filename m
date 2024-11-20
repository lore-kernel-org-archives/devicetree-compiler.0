Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E817F7
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Nov 2024 00:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732064233; cv=none; b=gXSTrcOLw7VdMRutvb69tOYflsPcwKR4W9sM7GmntjkfG4nD991AlB1kOtQG95R8QNRRcCEDEvY5G3AtzlCXoUXdmDSDUOd7ovYxvBdD5nRttwFPPQdaIP/OER+FBlPFkOAhNKphJfSWFIhXZUj3ksIqjNu4p2yx9z0tX0LnoeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732064233; c=relaxed/simple;
	bh=FFjdQ6SFRtaAEK8SF9Eo8U8wfQXB8C2AhKPqoIZuYcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ+7tVxOwBCm5lEG+AqThwq/dvNm4hkyYz8GTZV3Yb0VlHRpru5PrUQ2oXJiIWpn2F1pytK18RCbO+RiFMApdB3hrms2WR4YCUrcViH9oAx3p1hOTCyj2vgE1Z2grdwG1T/Qi3jGdXqkwZv5VM9P1oN2iW1RPY3gnG6BTNsVDd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ZAVZcjfJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ZAVZcjfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1732064222;
	bh=zU+Fz58W0GTzS9KenUljVKKfyLqhFhlpY7NAIaFYjsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAVZcjfJ9TsqPXbxGukE/ttoSNzof1da0PWWPxQarmQGOBZq5UqedC5sXr+0yv0g3
	 zFdDqFMMEZpP2iAU43xZiLiqUq8HuogcfCERAWicrmEnIRyVVPdaJW7wGFTp3ItaK5
	 ubNTRCOgfAGHDaJkaLqyZmSqqxUoxTuWesPjRDZ2AomoHgtCj53kLmB7ZPELedZxVX
	 EVV1PhusSuDpxSMzOYPfcUI9+4HgESTPvtDXtzKexeScmuiZAopT8a9PUMmk//LXqL
	 q8K5ZWs4qQpMrIeKGpsNLivP0RyMera0OpN18Nu/CvGVVHfdMhMFavEwwgkD+EXtFl
	 OZhpcmM0szx8Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XtNHL5ycyz4xqB; Wed, 20 Nov 2024 11:57:02 +1100 (AEDT)
Date: Wed, 20 Nov 2024 11:54:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: AbdelRahman Yossef <abdelrahmanyossef12@gmail.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: ModuleNotFoundError: No module named 'libfdt' after Installing
Message-ID: <Zz0zKViRRXlRXytm@zatzit>
References: <CABwgSGZfb_t0W5DgUJoFNQkbVbupdHmkL4ad-NiY2Y4JtkB08w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uAmsrzLeI9wIX2q7"
Content-Disposition: inline
In-Reply-To: <CABwgSGZfb_t0W5DgUJoFNQkbVbupdHmkL4ad-NiY2Y4JtkB08w@mail.gmail.com>


--uAmsrzLeI9wIX2q7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 12:31:09AM +0200, AbdelRahman Yossef wrote:
> Hi,
>=20
> After installing the dependencies (swig and python3-dev), I still get
> ModuleNotFoundError: No module named 'libfdt'.

There's not much to go on here.  What are the steps you're taking, and
what are the results you're expecting?

>=20
> I install using pip (pip install
> git+git://git.kernel.org/pub/scm/utils/dtc/dtc.git@main) and I got
> that It's "Successfully installed".
>=20
> Thanks,
> Abdelrahman
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--uAmsrzLeI9wIX2q7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmc9MxkACgkQzQJF27ox
2GeejA//QYCMU2FMDMz4ww+sd3esaiTFAru+9QYhrK0Nu4bE47kuD7jS6oNn1GZv
jKVoDuA5AOuktKpqv6iOW59+ZpYHTw4LrpnbZaL2vxePPmuwthUCMi2IFNGs4+4p
B5hrPoDkClfsEw582YTKl/i97x3FFomt9zROjNXx96gqjM1PLmkPwQm+pxW6f0TC
JsELOJxHiJA+KcYJbxIbRdCJCya94o6TnQznGmCKbJ/VSCJt/YS/vpn1z1rTAVIU
zUuJbfpnSSk+pmMU/BYEn9hcKUriq/FFOuJhS1X3sAci3vfRmpFLCtdr7h8cEUwt
g+JggEImUzjqF2T9BlDwALh5SfuaJQLC3FnRlRrnxdYc9PK+QT1ggSj62TvWHIV7
K+INm/V1/5QsxDlZgiRV/4D+PEZ5xX0c9ChqJJADqVfrlh8zyuKMmjytTwi/djLw
yXjgIrepu8TOV0o12S/WxZGD7ZIeRixU/mQL1+R7/D+goImGtzvhazG8dMQHugk9
RLu1hKzfEj1LCbuaLOooqr6vtn6QL/fo3ccrP7RKOkocSxt5G9q3EKdiBVd303Xy
dkTTENdkoebuIdwXi3It4z8s6BtVKXVKpWIjpEd58T3brWqKaMMQMVUGxNig6DEr
LHSvBUn7eUK2Eg9HB+WHcWlTLFpEUJVkBOXJUmv+9sXfOw5j13E=
=hhy9
-----END PGP SIGNATURE-----

--uAmsrzLeI9wIX2q7--
