Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751408;
	b=hP4kCBRBJlhAg1WuIdrXoVfwFfYANgIdcjj9WF7bbIA0LC+Mq+8zf0Ow5BFmM5z3bYsl
	 Zc6eH3qbf4tz8aQMtTpUVQr15GT5P8r1LKWM2G2xryoKEmpjgqZGIC6mPVzXQziHvgAIs
	 z5cd4VjxkQCdVz0xMkbl5En2CtSf8L8RZIoYHkYTJXY+r7DiudIvqkcN7oa8vTXKrjsjD
	 /M1T+pL6PxUPd1umYXy8Du/huCnLhPYXijxPLKWMpT+IXrJ/cYEuemHgdlBWtHthk6t6a
	 fOHqy0YcPWnrTVxhdJDBAiIpbne/5GRWZzw2OxucOF5qc5oMEawMBXcBJlCHR4RvcjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751408;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=YZsYAkn2o6JkZx6DIaits+Ab92FZZfQc1sFu70I6/XE=;
	b=OXE5ZcEnXeAyHlqAnor4Au0rpqREx7E4duG8kaHFJNkxZVOD2aIVGcpForaTcQLH2EO3
	 WFNLR0QoNXHYUltExmGBIp1mo1on443tbcwVxGcEwcAGMmtUvltrko0+/aIxZupr2ozQV
	 vh9mEuvIWLFpseAhcIVi02zZ2qxDwq9aXod/ss+qG039EN/EYTWbEDqmfz3AyKJoYsRz4
	 egOUsPW/JKCV/9LqvCsNRIhTntmSVcQCeCjsgGezk3yDw94rRe02EOtvx5UCWNB0pMDPS
	 JMW3ErTcooXJydNMD0wZ8JZnHEGH0qhzBgj7uB3LhZx57RiKyNgY+7rAf89LPotfPLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=SrW4j42d;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901DB606A31C
	for <devicetree-compiler@vger.kernel.org>; Fri, 27 Nov 2026 03:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=SrW4j42d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795751404;
	bh=YZsYAkn2o6JkZx6DIaits+Ab92FZZfQc1sFu70I6/XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrW4j42dHMjBqSWRK0t84i06Ztxw/Nc7uAwMcLCIKEmvYZwxzilMq4ZjqnznYPm+F
	 HrwO0lBL1myuAiu/1dhrMGlfMFhqBywiOpneLBT2UXJ056SV06eFqYDRlhMPdb+f/T
	 KXbCu5GDghIkSNBBGmP5to0T3W4cADp3rBb99FjvJnvyz/UUNbHZF9cooqthUA4nTT
	 LHsp9dMXBcoExNDRc14F+yxqhSf3whR0yZoC2iyPIJYEmw2Rfv6yTT0KvXEMMUfMAS
	 Ch4elAjft6qWjFcMgvivr1oyKj382eJe7igZfkPoZbVNDi4vZ6l+gSKUn+PQFNvsWB
	 gyYvHn0fvr/vg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jbKDr2Km3z4wG8; Fri, 27 Nov 2026 14:50:04 +1100 (AEDT)
Date: Fri, 27 Nov 2026 14:43:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 09/10] dtc: Move labelled-reference handling out of
 the grammar
Message-ID: <awj8MGUjqkTZTOsR@gractus.seuss>
References: <20261126184126.1472738-1-sjg@chromium.org>
 <20261126184126.1472738-10-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="3HVjSLa76lCiMIVh"
Content-Disposition: inline
In-Reply-To: <20261126184126.1472738-10-sjg@chromium.org>

--3HVjSLa76lCiMIVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 11:41:08AM -0700, Simon Glass wrote:
11;rgb:1c1c/1c1c/1f1f> The grammar action for a top-level label: &ref { ...=
 } holds its merge
> logic, which adds the label to the node referred to.
>=20
> Move it into merge_ref(), passing it a struct source_layer with the
> label.
>=20
> The output does not change. In a plugin, the error for a label-relative
> reference now gives the position of the reference rather than the label,
> since the problem is with the reference. Update the
> merge-labelled-relative.dts test to match.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

So, while reviewing this, I realised there are a couple of additional
buglets here that would be nice to fix (which reinforces my feeling
that this refactor was a good idea).

I think I may have implied earlier that it wasn't possible to handle a
construct like:
	newlabel: &oldlabel {
	};

in a plugin.  But that's not the case.  An overlay *can* add symbols
to the base tree, by labelling /fragment@XXX/__overlay__ - AFAICT
that's already supported by libfdt/fdt_overlay.c.  The support in dtc
has odd gaps though.

- That construction is rejected at the grammar level as the first
  source layer.  That really doesn't make any sense.
- If given as a later source layer, it parses but gives a non-existint
  label "oldlabel" error, which doesn't make sense in a /plugin/.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--3HVjSLa76lCiMIVh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsI/DAACgkQzQJF27ox
2GcwCg//cFDqYhyURIdIgw/ETTzqvhMcSCkpJ227MiOfK2c/TmtRPSD1Qw6AKZnG
oYOYDmIHitpIpQX9qh8spLkCDWUfxAklPKJDVWEVjYvXl7bavdB4rkn9u956G7r9
fii1KQaNOYbNCa6eSYwiavu5/cD4NdfOb+v8CJG5DUuN99f3HK1ksrDYEPienRNS
UmuRTJPXUAmqA5P2uzcVIy91L+Zgn6hKRpcnKANSAcCRdLMtxe5SOb88lGUYbZYG
Kwm1yEQQXxYLkkXQiHPKpccDq/hEQGfiSZMIp2Q76V3ibKRigvVwXRNTpz5Jv9S0
+A9x8fRwlvHRDcfQPWPsFev88QXx3QcopBaLA3CjD0RFgoZNigjFhuXgWF8dymYH
7VM7vKKj0olB0FMmhG2cudKuLQhShjETkElRs8pMLSiDpW70x7D+nzOhHlx54KTf
6yoEXPO91H7SMcmWJYZhh1xo7+5U/zh0qDBkw+gH0a586TNXIdpz1NAsjoeuff/i
ZuPrTdmjEDCVfqAL2jErUMqXMNGxHyElLP6+aK3EbqTGSkNAqihi2j+RQkKpTlXD
geEXbRr4LsSZ+C3txr1r2IOywOtMZte04MCJtgILVej4HhQAJ4OUK2otWT9aqsHe
spXfBeo70y1eluzpkSpxy8spM/ejPB4+E+4gjxpxOCtltnTHLNk=
=RJHJ
-----END PGP SIGNATURE-----

--3HVjSLa76lCiMIVh--
