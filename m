Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330205;
	b=A4sQiwUqbR5QMxUBSApr7B1Mhwf24Ly2e6doLaEAfX58rwpoD7IbB6CaSwov+XMQve5f
	 QXEbYdSY5+XC6eVxYM5Y2m+e+itwKzvzf5fPCITURvIhqYjkh/ByXZh9TsTR1EM0fCXF3
	 etluNQfC2pw0p0/OmJqqSWOS7SDB0Tz79sP4hFDHTpYXlweV7tOvH+0FaqdcL6pff0ad8
	 qsdhJdn79K+dzn0ZrVPFAvvvr3qMrfM0jDmbjqox4AvAnEvVaBV4GvKPGZyAea6LO15UH
	 Dxy9dUyC+hTn21QwUhc/q8fmgTMzpWpBCzsrd5zJPbDdDrF1plJKO8x4xnofSnzJFIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330205;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=oJ3JMCA1SnTjwmvydPR0MiFtA62+grLIzQTfEfyKrN8=;
	b=XFTplsJgjQ9wXPisuF95/67GlNYF2DMuZo0jaH8L/UQZdYFdx3NjOMA96n7UW6POb3Nr
	 S6PAzUVGDqQE9IPSfCUgwTiFtNQ63MIp/kvDOcFVcMUzzRAyzDrc80Ap+wBoFjEDzXvai
	 hD2oHT7prHJIn2clwbP0ADJwIzYPupws+1LzMDUIgsBaOqrObmqd8kpW/HcpJk6bvpTCF
	 bqr4gdAoW49fFBLbsDWjaFwXS3mmOdPe9tJFSKWgI3ElIUpq0YC9fNNVJi1iPVPFuA80K
	 Ud4vZKAV2Cs6trTDWP8UU35MXLBnHZ910KkJiZvqUNqGM2y7kkQskdBhpdU62p4Q++A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=KRQRfe+1;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C6606A31C
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 03:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=KRQRfe+1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793330194;
	bh=oJ3JMCA1SnTjwmvydPR0MiFtA62+grLIzQTfEfyKrN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRQRfe+1/Ld8pBDDmCuP5SbrIjthFHhgIYk2MZmXx2GEl9GikZPAnqeRkpHsCBqs/
	 8HjABvuS1sW6ASDJ+K+8OJj64gr+DuVGda6NH3IIeIZ7C/WNz4saB0IZQZjzmv6COM
	 D7iSCKZ6qzYk+3lAxMe4g9GnLCogKjvqXTZ9m0fEDYcnqEBX02SNxpnMyPud39Hp4e
	 ZSkEqA5Tv47HL3nY6GtT/UxCWCJ4IIpvCq+VtAVXjYH4dObRh31NnvHB6Ct4MbgmYC
	 zmB4JxvW3eSsOklKj4OkiiaBfUW2nc4WNF3UIITswGRX+JzMGeYYru2RNz8j3Ewz9e
	 ulaD1DLp4w5KA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG5q638CQz4x4k; Fri, 30 Oct 2026 14:16:34 +1100 (AEDT)
Date: Fri, 30 Oct 2026 14:15:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] doc: dts-format: Correct what happens without
 /dts-v1/
Message-ID: <auQLzk-0BZcy3Pbi@gractus.seuss>
References: <20261029093115.3647778-1-sjg@chromium.org>
 <20261029093115.3647778-5-sjg@chromium.org>
 <20261029123359.0bfd11d6@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="WH+8spqneFhW9sCa"
Content-Disposition: inline
In-Reply-To: <20261029123359.0bfd11d6@bootlin.com>

--WH+8spqneFhW9sCa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:33:59PM +0100, Herve Codina wrote:
> Hi Simon,
>=20
> On Thu, 29 Oct 2026 03:30:57 -0600
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > dts-format.txt says that dtc treats a file without /dts-v1/ as the
> > obsolete version 0 format. That has not been true since commit
> > 4e1a0a0129b3 ("Remove support for the legacy DTS source file format."),
> > and dtc now gives a syntax error instead.
> >=20
> > Say that dtc does not accept such files.
> >=20
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> > Changes in v3:
> > - Add new patch to correct the description of /dts-v1/
> >=20
> >  Documentation/dts-format.txt | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/dts-format.txt b/Documentation/dts-format.txt
> > index da0783b..87d3d8e 100644
> > --- a/Documentation/dts-format.txt
> > +++ b/Documentation/dts-format.txt
> > @@ -137,9 +137,8 @@ Version 1 DTS files have the overall layout:
> >  	};
> > =20
> >  * The "/dts-v1/;" must be present to identify the file as a version 1
> > -  DTS (dts files without this tag will be treated by dtc as being in
> > -  the obsolete "version 0", which uses a different format for integers
> > -  amongst other small but incompatible changes).
> > +  DTS. dtc does not accept files without it, which would be in the
> > +  obsolete "version 0" format.
>=20
>      obsolete and no more supported "version 0" format.
>=20
> Just to be clear about the "version 0" format.
>=20
> With that done:
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>

I'm merging this with a slightly updated version of that change.

>=20
> > =20
> >  * Memory reservations define an entry for the device tree blob's
> >    memory reservation table.  They have the form:
>=20
> Best regards,
> Herv=E9
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--WH+8spqneFhW9sCa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkC84ACgkQzQJF27ox
2GdjZQ//TKdKtUo0dLSe8DSxsPQcm+CfAiIDGe2hTpXOaekmXTHXJeVF0FJMUjYv
lK3gcGUYZm79Lfe6WTrmXnlyYuW4qRjS+OzvxppSPRCcJPkjI3oFTjnJYUtkMVrq
PplrTtiwhH73MQkAstj7gJXVWkrSTZtPNhs1FndE7iwJAwH6BMw5i4BpGhgClsnn
ttNjDUy5OiB6a20Xvk2BsTqJmAr54m0VA080QYuty/k51OCo5KYKhJrw2XH7ceHW
8N0+10WFHDzhn9ypuR2F5Q4EIFbpaTHQwn9KO1CHk087OLCsVczobLDH7QiRoINo
W6w467pQUAn/WC78bsjv3f1J45q3YcDeMVAIcx/qKe6Qx8uFe0Sz9mriXdOBMOCQ
RdKH9x5oiWYtmco0Uhoxi+Q9LAqegPj6KPCIaGmVpSp2V88d+Fp/niqtcx95ZImY
LUN/G5tX+IgFCPNtU2LVzytrjnnw72jWmqcpW4uqztqewsymnD80gQJX4lQ7Ng5L
wyJ2uQmds6eAkQfIVk45g7MT/4788Z8xB9DT6DGzGLmNiiid/9BlZevdX33Qm3a4
FsjGyz+HEGBFpIGhuhqn5Sc1hMGoAmUNiQvsaxckVGDC4WcCCh8v+KWth+G8wNJu
U6yqDfaRzmkbCJvmototX61p35W5g6bfy8tR1OV2/Vccp4QhFNI=
=gag2
-----END PGP SIGNATURE-----

--WH+8spqneFhW9sCa--
