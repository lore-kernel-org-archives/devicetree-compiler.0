Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775115;
	b=dnYyq488VNm0Y6zdNFk8igCfAlTspUTREukBvBjZ6KhZUPrKgX+M2OK3xInWhIg0EnSi
	 eqP0QtX16js+4H4n+jCCbXUR/ayptVgkh86JDA/dJxvoBlPdy6ymP8LFCMUXVqxRVQnSC
	 8eaP/GBusOtgSO5iMtHFNJDkE0VfAbGALRRBdXoUdBY2s7mHOg7qTp5OHTJ+9iPjP5dk4
	 k9HTLDJCkQ2+7QEODWiRbwe30YWCM+milEPu7C03F32BisCXTHhUWvIyYoLN54+gv+Hka
	 Mu3LPRjblAEKYaXrntPuk5ETTCyLrXfroJnTfFRoBHhkvAyAhDhniKh7x7X6/wdL/0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775115;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=gRmJSdzFwuYFPE+WfGhkrOHy68BfTunweNLMld5lqno=;
	b=XfKArN0gTrMBFxXNBv+Fx9D/epjnjq/m3aewZL8aU9YQNTg2dZy+EGd6md5dfDMdFtGy
	 1P1GyFLjy35UG9TVUwPRf9Nq6nZHEJ59T9y8E5gupcdEDAoljQFQEFff56/LRM2jZOlP7
	 knHb54Oq8N+aimqWYi1UvIrSZyDTx7XtCj1vQ0uoTYpTAyj7jyWx3/yhxgNFEFIZf4XpL
	 s+8GRDLG/FPIsB12iGfYgMaBgDOeWE8M6Z9aYfQYkeu9oP5c/NZLXOrLSmc63dfoStA9r
	 1QcbIrmwcv1+kA8Nx9CPBWeSb2bgChxWCGQSk+dNsrJcKfurIiNgyedl1CViQB0JF4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=M1TDSgQO;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED60606A328
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Nov 2026 06:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED60606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=M1TDSgQO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793775111;
	bh=gRmJSdzFwuYFPE+WfGhkrOHy68BfTunweNLMld5lqno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1TDSgQOP9A1jyQUO3kt/bVjV5Juy75KJG6FCGwiHEzmFJq+oTGkLCvnP35f1wqRj
	 Cz2RM8PZqQP1uW5dK89QOlIX1nFljOGCTorAt9aDRTuWoE3JFNJiCxqyd1jckGBx2l
	 /cFrEtJsRkHo45eVr9bpb6f+rFAbQGZPkFtK3uFAcGyeyUCsHr/I371dTjXbDT1Tuu
	 84fxZ5ZpRNQbB8kRTUJsyj2vH0VuiRLsaDCuCA+Hi8m3B8qHMfEKGxUbHg2/51K5BT
	 XRof3zx92v3P9VMfp4mQqpK+cwwphagVgwScAKaRr8+pe7pKcN/7rPfNfZg3jpNAAV
	 RkIyjIVX9WDgA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jKGMC5b47z4wDg; Wed, 04 Nov 2026 17:51:51 +1100 (AEDT)
Date: Wed, 4 Nov 2026 17:51:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 13/13] dtc: Merge the fragments of a dts file in main()
Message-ID: <aurV_EO8OpYad26x@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-14-sjg@chromium.org>
 <20261103180803.416e25c7@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="+attQhFZWbFrtoxk"
Content-Disposition: inline
In-Reply-To: <20261103180803.416e25c7@bootlin.com>

--+attQhFZWbFrtoxk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 06:08:03PM +0100, Herve Codina wrote:
> On Sun,  1 Nov 2026 09:37:07 -0700
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > We would like to run checks on each fragment of a dts file before it is
> > merged, but that requires dt_from_source() to return the fragments
> > unmerged, so that main() can decide what to do with them. At present
> > they are merged at the end of the parse.
>=20
> Why running checks on each fragment instead of the dt where fragments are
> merged ?

This is part of the aim of the series.  Some checks make sense on an
individual fragment, others don't.  Allowing both kinds lets us
address several longstanding problems.


--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+attQhFZWbFrtoxk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrq1fwACgkQzQJF27ox
2GeyZxAApcfmippApVXamFgBpP//29ZKoBzlXPWkgc+FwUvK3Wx4WUJ6Iu1FwBWk
Vy/aMz1MEcgLbQqk6cZInDskEgeGEI1pKvmNWP17Ba3k/P5okA+ZX4CvjBdXn4BT
BrLJj+IqzQLNlk/kdPM3jHQFbCua//X4tJuOhXxLjCDNwFCLyWUGCWsM/3QV219c
GJHnxCQzKRq8ci4T8g8jVfHsJpYKaZCluntGULoGkWbw569mDqeoEETcfDT/PJyV
ihml/Fy5AV1z9s4BEOvOEElFYXUskxnkvMroDAgOLSfTxeZURBotLcqhtriZw8yK
sb7QnhyIAS0RkMIL56NCvPKC6kPIrrz92jPSsflDp+7ITNdMx3ZjXkf6vDGo+DyW
2WVCi1gBHYKfxQs8POvyiarffujD7o9w55lSIOT0yB1l9L6vj8nj9eKGGb09Z8Zw
fn3OpMT7ISo7PNZKP1+07XooO3yHqIWaxY6thcWShN6NUQA+RZWas+jeKk7U1j8O
4JX5SH2r+gwTmDrnoV+QXtrUHyvR+kBaH1Y03wrZGqUGFgSfdsqHS4LFutxMU4HP
qucYm2UFwry1T+AX2GQ2u4Q+S51yPjR7ZIuGIDMKBP0tGQXlCwgypGOnWGrDXVcJ
4/ukFPXmsvmjr/SKIyKND8vxPByjyFQM8lC1dHh4ELJs6h1oHPY=
=NTUC
-----END PGP SIGNATURE-----

--+attQhFZWbFrtoxk--
