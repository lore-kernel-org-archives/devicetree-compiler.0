Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E716FCC;
	Wed, 18 Sep 2024 00:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726618887; cv=none; b=S057Ci44nSw25CFzhEWBH+nJED8Eabl+/BEtw7flvxO7C73j/kH/OEuCGmSW4URvjKyoVYZu6P2g8qzDn1pzKWnKx/0AzZZp55yWxtE0JrwaIrCYh5xKXn6GR8PBLczJPlksNOqpla8BBU0Krfr7+JUUJVKkNIPAxYmqMlIHKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726618887; c=relaxed/simple;
	bh=MKObxFK0lZEzF3DefsNkKzAO6cok9TF3JLf5CsJ/Y3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohp8EivltZuZKGs2eZFqz9XVuMglv8Fvslzy5r4W0zQ6ufzABKp/OxQilIwq052iVmVAccMuNwx3fw7mQhk3eB2sRQ190a2IHBb47CdpO8uP3YJxWRYly1uUxpJj2Ct5mMu1p76Z1BmLWB0Hymjq2ejVATDlJNhkgkLimhT43B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ZrV+7MPR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ZrV+7MPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1726618880;
	bh=kDIQPtJBnJ4JlLezWtx/jbGHo5RRyzLSjUiQyanVuJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrV+7MPRMCayslM2gWBrNxhP+/fVmXdd9PT9oXCBI9oBmnvVNkz7mQoOKSmkaL1Tb
	 2bogM5nUFOyz+cPRlX5wOQPFhqOVOxwG+INcgu7LyJtM3sXK/TmBe5e6s5MK5JI4fi
	 H95eKlEq3fWcKRj8enLIBYOGZkfdffYl/839hURqlYqmiU1WMoGcDGnXDo2zFDIW7y
	 lo9CKa0arGbtmWuyNMgDgBh1ZRN0RIdDzwu0I8W7Dz7oPoG9t0muCSxVtSQRVPJ7MT
	 R9X5LmSBW4ADtmtC7yoxQ6YstOFmzvaQQysEgZo6W3d+hU78k5ZTN/nRHapGpjJ+VP
	 QQDq/CAcMXXIg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4X7fTD6Drvz4xSZ; Wed, 18 Sep 2024 10:21:20 +1000 (AEST)
Date: Wed, 18 Sep 2024 10:03:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: Device Tree Compiler v1.7.1
Message-ID: <ZuoY62Bt6UEwkBYh@zatzit.fritz.box>
References: <ZsBvsq5pVv9xEPmp@zatzit>
 <CAL_Jsq+P6j70L=Sr=a5cBrGEMswZN0fYdaeOeDxGFG-VJgWNbg@mail.gmail.com>
 <ZujKoLT9VBHATtyP@zatzit.fritz.box>
 <CAL_JsqJ2dcng7xZoua-iAGi2FtPhddxgr9TJ5JdfC_wticW3cQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O0khoidLjHP33lln"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ2dcng7xZoua-iAGi2FtPhddxgr9TJ5JdfC_wticW3cQ@mail.gmail.com>


--O0khoidLjHP33lln
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 01:22:45PM -0500, Rob Herring wrote:
> On Mon, Sep 16, 2024 at 8:24=E2=80=AFPM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Mon, Sep 16, 2024 at 02:45:23PM -0500, Rob Herring wrote:
> > > On Sat, Aug 17, 2024 at 4:39=E2=80=AFAM David Gibson
> > > <david@gibson.dropbear.id.au> wrote:
> > > >
> > > > Rob Herring pointed out it's been a year and a half since the last =
dtc
> > > > release.  There haven't actually been any headline changes since th=
en,
> > > > but there has been a steady stream of small updates.  So, I've roll=
ed
> > > > up a new release.
> > > >
> > > > As usual, the git tree can be had from:
> > > >         git://git.kernel.org/pub/scm/utils/dtc/dtc.git
> > > > and tarballs can be had from:
> > > >         https://mirrors.edge.kernel.org/pub/software/utils/dtc/
> > >
> > > The tarballs are there, but it doesn't look like you pushed the tag
> > > to git repo.
> >
> > Oops, sorry.  FIxed now.
>=20
> Partially. The tag is there, but main/master don't include the tagged com=
mit:
>=20
> 99031e3a4a6e (tag: v1.7.1) Bump version to v1.7.1
> 3d5e376925fd (HEAD -> master, origin/master, origin/main, origin/HEAD)
> setup: Move setting of srcdir down to the bottom
> e277553b9880 setup: Collect top-level code together

Oh dear.  Ok, try now.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--O0khoidLjHP33lln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbqGOoACgkQzQJF27ox
2Gc2+Q//Uxf/erybjv4KpDkQUTBP+7IzaLeEnD1rSiW/EGvTbrv0ANs57OPJos1J
Da2D10tlmot8QOVhDBQHkNF2Fo4+4fRyXtaf2PbgAKIsotD13U4I2CUsh5cjSiVe
ZitRIBneMOcDTc/KxvIYdeY+7iX6nvgJkot6a0MqhUZnWpHoBn09Rg2P0OzygYsl
AC9lRc07gcHQvNLuM7H7Td+X7SA6OrXKAmio0lar7VNqNKrc+uPAh0CRZ5o18RK6
+koSVHSVOIvNX2zIpHpiXppgpM9BIyhFpsGN7CfaWCaCww1t0ec0o8P++7pb/fza
wiQgf34PXahmql7Twvco60mSNnPTUunrRVeduxVrPdjT0rb/ToQMPJkbBcny/y4y
9NVmZ/FzQImOIu8PZaPwDVIn4Liv8CJ+qELoOBdg3NMiQWMpyi/Q0LmV8MK8weIb
f4oYnGitzZpFqjy93+YWKf32H5K/Gq/2XSDpusvLbQIAq5YxsxrCXko99wuY/gkJ
/xqSGvss0gelLI1/rH6P6XB7rumgQgqt5rkKTFkzwV95++Nl6JCXseu6+bAI+X6o
BE/7OkG/R4PnxdvLblGVIF/C1I6YvQi1xn/c9D0G6pNyU6yqB8q4718gQ0ULVauy
kAWQN92FHwe31UB4+mKZBN+DthsDTU1L71iISAV2VVIvvFsjL5g=
=OgIV
-----END PGP SIGNATURE-----

--O0khoidLjHP33lln--
