Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81266146D57
	for <devicetree-compiler@vger.kernel.org>; Wed, 18 Dec 2024 05:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734499265; cv=none; b=GjclHLqIoRtgca7w8YoC37k68ZIDWrFEnL1tZ0dAF/rRRFlbAXayhbKcHr+kGUBe9l8Iz0C2WbYFYsnYoF41jv6GIsXT/7no2NObIqtWY4CxA5ERx+cj6g7Njw6+pq3q+85Iy/fE6kzg4LyMvZ7QTjYn2HHmLF9GgDcsunaIFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734499265; c=relaxed/simple;
	bh=XdmOZBKo5VXu5fy9gfP3PKpNZ0IWY02cHAqR8bLO4gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0aulnR3JlQ13+3k17GjOL5Cd2ThCCxPlhMHz/RCT/gkrZhXLWsazXE9gmOqggRrTdZtVoCwbxdcRMpp2yVNUnJxQLqa+qcwdWZiUO7kiN2hSs9ADzdjztlr07vDrDKKCibZZITGoqZA6NiBnMYbluy/nzW3g36C7WcJ2dW0lfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=nFSsdxmd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="nFSsdxmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202412; t=1734499255;
	bh=NeinaPZVXlwfRXQM7QzGdk0I4L3SLvKQa77A9O98ZCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFSsdxmdSJJckJH5yCmOFYgb4npuOvqPpQbVpndPdUhTUyjhUYpHW33p5A/GbYzKf
	 8lPnWvj+6XMlmLyOK9t3AGlr7smi4gt5dnzQW0lyhzaZvwm0YGJWDFsWRO4rQPqFSM
	 JIEuzDJB5r18Mh3kQIQwLMzHyf4kZ1WcDU7+BdMfgIGQVKJ8wLC5KRwl7dcxFgXAjt
	 JxWBB8KupZOvQ3qC2lw58PD29cJ3wZW7MyVqddVvN4UyuUpP5ureFVaE1mkcS9UWev
	 aXGKfb0mjJyzcg+yADef9ZS6Ew0JKeKbsuTIbvgY1mVMI053k+zbWyBzm8QoPsTMZ+
	 2wYqfly8amwDg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4YChpv614bz4xdP; Wed, 18 Dec 2024 16:20:55 +1100 (AEDT)
Date: Wed, 18 Dec 2024 16:07:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	devicetree-compiler@vger.kernel.org,
	Brad Griffis <bgriffis@nvidia.com>
Subject: Re: [PATCH] checks: Warn about missing #address-cells for interrupt
 parents
Message-ID: <Z2JYlybB2TditOhj@zatzit>
References: <20241213141438.3616902-1-thierry.reding@gmail.com>
 <CAL_JsqLrttpfXyDBteq98NMp3WLbmoQwa6JaGkbX4hiT1y2k4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JDldw/tcehqevtau"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLrttpfXyDBteq98NMp3WLbmoQwa6JaGkbX4hiT1y2k4A@mail.gmail.com>


--JDldw/tcehqevtau
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 01:37:01PM -0600, Rob Herring wrote:
> On Fri, Dec 13, 2024 at 8:14=E2=80=AFAM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The device tree specification (v0.4) suggests that #address-cells is
> > mandatory for interrupt parent nodes. If this property is missing, Linux
> > will default to the value of 0.
> >
> > A number of device tree files rely on Linux' fallback and don't specify
> > an explicit #address-cells as suggested by the specification. This can
> > cause issues when these device trees are passed to software with a more
> > pedantic interpretation of the DT spec.
> >
> > Add a warning when this case is detected so that device tree files can
> > be fixed.
> >
> > Reported-by: Brad Griffis <bgriffis@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Applying this to Linux' copy reports on the order of 1300 issues that
> > originate from 29 .dtsi files. If this proposal is acceptable/useful, I
> > volunteer to patch those up so we don't get spammed by them.
>=20
> I could have sworn I did a check for this, but it seems not.
>=20
> > ---
> >  checks.c | 4 ++++
> >  1 file changed, 4 insertions(+)
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Makes sense to me.  Applied.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--JDldw/tcehqevtau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdiWJYACgkQzQJF27ox
2Gd7VA/+IicOGmnzPFLo1kezPzaLvmN8+mP0qA9/BkGWI5kbusgp3B52WL920sEq
EU99gHAH3/BukjL8/Kg1f4dHEey96OMA0sYkMxZSDCKcwRbZnPGF7QOoOmn73JJV
YHSyvRSy7S6gsRZDYj+XmFY3Zr2hJVhXCHK5XvahfM8qYFWfMKei2a2tGiwsH3hB
uD8+n8Nl2XvOnxXfijbwkcnUDcaymfrnw9czmZ3na1kZCmq3wco08Mv59yqnSsPM
cXD/fA7xnKEENTHVBGLuMjJqeo4ENiqWDln2DxXYw1Ysc26z6MGzva1+0CyIkx/Y
2Ghd1Xo+1rDjxEuuFtPasBZ/5ETzWxl0bsNiGGKd1hVSSMxg6Q1eTdxU2C6rSsBN
Zd7Sv65Oqz51ZdiZdnWRTmBzVo23pEhG5LiVqmDeLUVMgZBH+J9wjEFMi23wGGMw
r2PQaSlURlI2p5Sg0X/5R81O8LPfO8neBWde8sxzsJBiFG+xZniOhkebAs1iYUqt
uxz0ENPrgxMwBfPnQDLL7TxgV2CEA3z3Ac8OZtG1cxWa3Ua5S+BIUyCNumsLoQeD
+JS9g6uSPpRH2WD7n3sECkrrR+xepVdM3kqLX3+BDMtABl1QMjVcLyL9PB4YcOv1
1zXAnLKo4k1CPS8SJQe0OMsPJBlKF8g881Bxo7A5+W5YJhWmtLw=
=4/ez
-----END PGP SIGNATURE-----

--JDldw/tcehqevtau--
