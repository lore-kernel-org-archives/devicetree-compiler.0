Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795569425;
	b=14TK+CN+yJR8CEO7EqFM4WoUjy5iAxTuHrf36F1fFbmvalFS8TN6nHETTiFqaEH80ay6
	 olqDKYOSGrhvN4tZT+zAVlwPVWEuKs1HHXC3wc0vL9XGBcODFtOlbu5t7SiliGY3HZMVP
	 rfvSD7pHOhqvoJLo1BUDECrOpJmVx+/7vgnsU2cHMxqHTplNLBNEwNJbe77mNONzK5y9q
	 PldiL1wpPNOXCaH7GdmbL1MXErNKaJOMRvKwEr5b1OUxTDmGQbN0C049/Smpplr3Wqs1r
	 8H0LFFtt2DzeoZQQ3EeMdp13MNu9oq+rPr3qoNQg4DftPgbNvPLstw/wj/79tAoU2wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569425;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MKPk4JDPVZeig6c2LWuEzS9Vy5Sg8CHmaUiPOaDfwHc=;
	b=WLieA4HJJ4Gh9LvXOJjheBVmhDuRXrkNePHSTD2h5XFie0jrMmiI3LKrMym21Oheh70H
	 7sIUKh5muI1zknwtETX0UGyv2L7xW24/46H0HB3CEkC5zWEkKsaLKdifMQmmNwLzwzfxD
	 dYVjjtq1xVliL/MJGUjhEy310S4EpqAwd69YvEnh3f1FbYCYKTVGZ8GY6kyVN14QrP4Wl
	 4OLbb7oH+BxZ567RrwlqCN1ubfy4e4O6tDOZHDKzereui8eQ26yJ2I8pko90Yd3/dZLgC
	 V5C79PnpGmazDGusWyrLXkl7TrT3d2Y2QLMMe26DhmCaPy8C0oO/Zwnm9V0l25HR3Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=tTlzl6uV;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07DD606A31E
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 01:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=tTlzl6uV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795569423;
	bh=MKPk4JDPVZeig6c2LWuEzS9Vy5Sg8CHmaUiPOaDfwHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTlzl6uVochE+HIsIR7/FaEi5ExbEGpxQOZExy3sJg7FuaaF7ZtkGP8ubkqdRiP6q
	 NQjbzDQC6TC4ZjYuFS7bTBGt1uLIf29SyPRIjCJIVvH1ZWnTwY8VBFv2cPSZE9g4Q9
	 TifPZJ39AhdUf62EtMzIZN6103nFHFvxUfxqoKXpHl9Q+vh+V9HvZYGfz7QXcAII0n
	 e4//6uiEMp6YgwlAJx3gLLMZcEgkTeVbKE+t6xZh3KauwlteK9hBXM1uBXRz+8ghiR
	 j0wHp4GGqMqtKV5F89rM+dyqNU5OpKM5Ib+4yUVzcufoxfVapVJF6BxW8ZCJAKcWJy
	 1aqsLLsm08ZKw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ1xC1bNxz4wJr; Wed, 25 Nov 2026 12:17:03 +1100 (AEDT)
Date: Wed, 25 Nov 2026 12:16:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 05/10] dtc: Move is_ref_relative() to livetree.c
Message-ID: <awY3ACvWuYiKdNJ7@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-6-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="NRXyfhaVbx+TM3WW"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-6-sjg@chromium.org>

--NRXyfhaVbx+TM3WW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:57:59PM -0700, Simon Glass wrote:
> The remaining grammar actions which merge a fragment use
> is_ref_relative() to reject a label-relative reference in a plugin.
>=20
> Move it to livetree.c, so that it is available when these actions move
> there too, and add a comment.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

I already merged this, you need to rebase your series.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--NRXyfhaVbx+TM3WW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGNwAACgkQzQJF27ox
2Ged4w//SQA159vV4dO9cTxp53iXeGqy33GsBdDT1loYEp0cVk/UTsy76MfxR2wq
H1Jt5scDDXpGpcxLZPWRmrn+J0pnuTIC8fNPtETCFfwGEAofOw1tU8PJekSASQcK
VIYn8u7bJM/RT+nKImt8IPE5S+JAlf37Z9MfuSeqQRa876B7xJglgddqjPymcHmc
GQZShU7QPgki3bfiPWW89XYq2UrTwhBlXajBCC82Re3qhMVy+/ESvcEbFmD0G9I9
sr85KLQRAlHX5qB30mbz9UJjap5tnscZG5XtzxgEQE0oweWIO732MfDJj1mi/mhr
Lfao3I5PihpfQLHXzFoNkMSpzd1UnPfFLDWlCLwUuqfvDCio6bC3KS3yRT2W5KMc
xTPps5D56TrwMkS4QgUOMf2H0hjCD6M1OStuhtBGnVSCl/VqLxJmgCBXrwBxEFau
AyRR/DExoSduXYSLizsFVF9ovD9uPyUYs2TZI1z//+ri9O5stx3mMr8z1dROeugR
8hK3Z020dBtONIKhC/HBGGH0qGRUx8MgwHzsTwr9UaOwLUsp3C8H21RgPlIckwzD
P/MyNpycC/rNiFLQhvWDls17hf9EYDz2xlmz9ENi0FBAIW+3W7wPgdesjEoPqpa3
P+TKnCSTDs64guu937+PLTYf1khsR7+WDYE1OTvZx6yqTlCGFpI=
=xijV
-----END PGP SIGNATURE-----

--NRXyfhaVbx+TM3WW--
