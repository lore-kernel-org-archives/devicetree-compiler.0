Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793239670;
	b=xsrYLLWHbwbZ/dlarXPxPR3ZCypkaBW2DtbXonY6t3ApUUyPIJ+WygUXwwTsPZk7sYaw
	 Z6ikzPxhw/5PnpYv4ddFSe2YdUvJMbWg98GDUnhG9kxQ6L71AZEYcEXen2mfd3/dcUhD+
	 DMy4VMfpMqoTVSMkF7W22qu6EYzkyXkyzE1Twp2CRubd2VAp0MdekAoW2w1sTOtzMMq18
	 EK4f2vCvbskF6HcEXTuItQ1wTCqmslvDSo4AMBJboiY3AyOQoWdBx2PLIx0LmX8iLGiHi
	 yz6FNnxfyJNGDTwLtr3z/PPoIyu95QNhIT8DJ4EzCD5r/XprA5tFH+xPraG5VHvRA2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793239670;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9ijhctDH4jEz+TzkcUNfcvK3OolqgkBwfsnkaQdnHDU=;
	b=V/LgdLfB/TA8std9EzVPgZ+mOfSZjYRmqRwjJrKM74FOHEUy/8cT7SDIZNJ+E6zUNADZ
	 u/v+Ah9fSAOEoO5LZTgkQhuqDVAjTnZOvv3WgLaz2sgIAcU4rhigfh5YKSO5tPwtxFRs7
	 EUliIZOQZZK5QgMQH2xL3Uv0OkbXF8aJVpqrI5GFJk5zKxP0SrKF5/lmW/GavuGYjj2lO
	 RPbgqlqGErpPw9cT5Kcu+ioFnHKPViEoye05fiPgPpNNbKhIcie3xCy4kMjl4ocG8tTQ/
	 unc2bGmrYNd/34KKLFDB0hMPa9aOoQr8o3b0tVWjNsMM27ThpMaAH41swher7a/H9Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="BfR/9KlE";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D9B606A31D
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 02:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D9B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=BfR/9KlE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793239662;
	bh=9ijhctDH4jEz+TzkcUNfcvK3OolqgkBwfsnkaQdnHDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BfR/9KlEJnXS80EAgceA78JjMjUyQnjI+QE5+Th8rb/EkxL9jUl9kFXDH/80ZCxkM
	 ypf/WShxSf8JErIhfQF25pAWyGOGjmwes5y4KIMM37BSWUgQkx3hXYFVVrBCAqIPZz
	 lerUynKM3Qwa16XcSbwZTr76mFehWjGnxg4bx7XOWD4Cdg2zGJxa70UxRnbuiCqag0
	 Zbbe2uy+bcZhVLsZ8S9nEPwwJktMWU6tuYFiJVpo6wh/lO0oE06hukpXxXljDYrY5T
	 gIitom+imVzc6BSUbKvqLokjXNYcuIMHi6rtYyVte5luzKUT6X1C/7naKfnZqvys0r
	 3vFPfXpn/mMjw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jFSL61BHQz4wb4; Thu, 29 Oct 2026 13:07:42 +1100 (AEDT)
Date: Thu, 29 Oct 2026 13:07:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] fdtput: Require a leading '/' with -p
Message-ID: <auKqW836NgeMQu9L@gractus.seuss>
References: <20261028073440.3327687-1-sjg@chromium.org>
 <20261028073440.3327687-2-sjg@chromium.org>
 <20261028211449.261fadb5@bootlin.com>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uo7xwmR12mJKYRz"
Content-Disposition: inline
In-Reply-To: <20261028211449.261fadb5@bootlin.com>

--4uo7xwmR12mJKYRz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 09:14:49PM +0100, Herve Codina wrote:
> On Wed, 28 Oct 2026 01:34:17 -0600
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > With -p, a path which does not start with '/' is created from the root,
> > so a mistyped path silently adds nodes at the top level:
> >=20
> >    $ fdtput -cp test.dtb foo/bar
> >=20
> > This creates /foo/bar. The same happens for a path which starts with an
> > alias, such as serial0/sub, which creates /serial0/sub rather than
> > adding to the node which the alias points to.
> >=20
> > Without -p, fdtput rejects such a path, since fdt_path_offset() treats a
> > path without a leading '/' as starting with an alias:
> >=20
> >    $ fdtput -c test.dtb foo/bar
> >    Error at 'foo': FDT_ERR_BADPATH
> >=20
> > Report an error with -p too. The next patch allows such a path to start
> > with an alias.
>=20
> I would reword "The next patch allows" using "A future patch could allow"=
 or
> I would simply remove the whole sentence ("The next patch ...");

As a rule, that is a better way of phrasing a commit message, so that
it doesn't become inaccurate if this are reordered.  In this case it's
not worth a respin, though.

>=20
> Indeed, this current patch can be applied without the next one.
>=20
> Other than that:
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
>=20
> Best regards,
> Herv=E9
>=20
> >=20
> > This changes the behaviour of -p, so a script which relies on creating
> > nodes this way must add a leading '/'. Do this for the existing test
> > which relies on it, and add a test for the error.
> >=20
> > Fixes: f807af192828 ("fdtput: Add -p option to create subnodes along en=
tire path")
> > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--4uo7xwmR12mJKYRz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmriqlsACgkQzQJF27ox
2GfdUw/8DC3178T0zCzu0SrMU6Qp6BjLIrKUCgsBKn3MXOpjlgr+DM1YpuzKk8Pr
YyIwNOccTXtwaM8IBskU5u0gW34ovS+URpx6WqdfLTQgqRnSAfUxpFL7kIYMSH/7
2gaM6T4oocMvayauSO++F6NNGJnisvf5SCq5LENcMeEAaH1Wo+ueu2uKw+s+3Ax8
EYAa7eiNqAMv97eYcXRTvUROpb/VtfrzJjQ809I6RhLn1oGXcbkEXokfl+X6QiQX
T8WHGdaihysIcL8XNW9bWkglvKCfsliWyo9z7cP4TK738nWqoncLeQFwofpdNXH/
MfaNHni1FweRctWPSkYMP2s+/f1ItCQ5c16KnLVacUZdgjVVoj+Rfy2XVejZ90KH
lBGVLY/Tf1m20GBmGzJnHT/zT5e49a4YtDdi+qxKCD6cdvfX3r7mQWxSYrbno3Fo
Ms0sBXIqBOB+swmQYHCj/PypR5qRjBOpPILHdYug3Rn/TzPnnp5a497mw7G43ecy
cKRNsKtxh2d6/qfFh4rocQfO2HqicUc4U6LDFidwWebKinycP+B1HLAMKJ7oxzbS
RdjIFJ2YawWeIrobNiHcH6WNNLG2vo0hG0YoR9ZVqYeHOjVTKWzBXG6h3jTK6zQS
/wRY4gt2HfuFU82X/MdqyLVTMv4kOXp3x4fETuplRK1HxyXiZfI=
=XYNT
-----END PGP SIGNATURE-----

--4uo7xwmR12mJKYRz--
