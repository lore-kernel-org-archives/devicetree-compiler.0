Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FCD23AB9F
	for <devicetree-compiler@vger.kernel.org>; Thu, 12 Jun 2025 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725971; cv=none; b=rnyhfFaafIwJ68yAW2DCXufZZmXMVQ1CcLvR/Ar4ODcUwC1NBiJUzjX49SQl/Nj6GKQNpk5NKCppEkriXfPH0MUROp8i2PrG8vfultRVNoWjsaG8p1RQYrrCsdci7mX5rYyvvoQk8Mwj4qLBwoiOmNDiJnuowCSpviR8J+/Oa+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725971; c=relaxed/simple;
	bh=2MsVEo3BeA/Mufe7MqvT6dZTG3aDzV3VA6EOC7k9TXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfKDHaDuDsYKtZ8ACMGjWTXYFO36xg9ySAmdYvpSEp3QuY5rjBvufKe1kmPR9Sw4tUEeDfYD6Eg66ENTJpf4rCsIoZ2QZkjf2XhFrAuTQyj/N161gK7khMRyATkof1yFUUVjVoVxTi7iiT73h3KbUGdthhhw8R+ptXwe9h20gXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=DQ10K8gI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="DQ10K8gI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1749725966;
	bh=QkbZuaXWNpobjekeAy7ib2g90jbX42qpPsCtNf7fHhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQ10K8gIWGBltXofM2M7ngdY3E6Nm0RoV1MnM+1KhnC1d2sh+CQ/pqvg/ivdKiuIb
	 cLKfDK4sEkdnSk/av5H+GFku8M1/HEpx/p3Sc/ITX9hu0ZtGtUezza2z+9GPSgtJFB
	 RX166fj9eMOfcoNmJ5HIIdvTsRJ5OPYIcgmzzJmImZbpGJ8M1y0aVI57LQrAoMYneH
	 UsCxWwktoGDjgeioA2upIZ0CjxcmgMiaDODGh6Q4tgcM1seNmO9fWdAzWwQgRbkCRL
	 Ew/01FJIFV5RSJTHKwhoNnL1GmKVuRtJ4F7nq10Qjxa8jEPxxi8OkhMWz6+EoA929O
	 T6WQCt4tL/RfQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bJ00G662fz4wyY; Thu, 12 Jun 2025 20:59:26 +1000 (AEST)
Date: Thu, 12 Jun 2025 20:56:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Glass <sjg@chromium.org>, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dtc: Add data_insert_data function
Message-ID: <aEqyQ1scjqvq1NVF@zatzit>
References: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
 <20250605-previous-value-v3-2-0983d0733a07@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oCLc26yMB6SnSXcT"
Content-Disposition: inline
In-Reply-To: <20250605-previous-value-v3-2-0983d0733a07@beagleboard.org>


--oCLc26yMB6SnSXcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025 at 04:18:07PM +0530, Ayush Singh wrote:
> Add helper function to insert a data struct into another.

Applied, thanks.

>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  data.c | 27 +++++++++++++++++++++++++++
>  dtc.h  |  1 +
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/data.c b/data.c
> index 913796f2e664d07cdc48e0cbf2ab5d6fe9978072..5b25aa060416134be430aebe3=
3c9cce49515297f 100644
> --- a/data.c
> +++ b/data.c
> @@ -251,6 +251,33 @@ bool data_is_one_string(struct data d)
>  	return true;
>  }
> =20
> +struct data data_insert_data(struct data d, struct marker *m, struct dat=
a old)
> +{
> +	unsigned int offset =3D m->offset;
> +	struct marker *next =3D m->next;
> +	struct marker *marker;
> +	struct data new_data;
> +	char *ref;
> +
> +	new_data =3D data_insert_at_marker(d, m, old.val, old.len);
> +
> +	/* Copy all markers from old value */
> +	marker =3D old.markers;
> +	for_each_marker(marker) {
> +		ref =3D NULL;
> +
> +		if (marker->ref)
> +			ref =3D xstrdup(marker->ref);
> +
> +		m->next =3D alloc_marker(marker->offset + offset, marker->type,
> +				       ref);
> +		m =3D m->next;
> +	}
> +	m->next =3D next;
> +
> +	return new_data;
> +}
> +
>  struct marker *alloc_marker(unsigned int offset, enum markertype type,
>  			    char *ref)
>  {
> diff --git a/dtc.h b/dtc.h
> index bd803397449a4b71ff89944ea125cefb96c4dd21..3a220b9afc99f92ea57d50d34=
8eb0872bc779818 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -182,6 +182,7 @@ struct data data_append_addr(struct data d, uint64_t =
addr);
>  struct data data_append_byte(struct data d, uint8_t byte);
>  struct data data_append_zeroes(struct data d, int len);
>  struct data data_append_align(struct data d, int align);
> +struct data data_insert_data(struct data d, struct marker *m, struct dat=
a old);
> =20
>  struct marker *alloc_marker(unsigned int offset, enum markertype type,
>  			    char *ref);
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--oCLc26yMB6SnSXcT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmhKsjwACgkQzQJF27ox
2GcaNg//VwXIZ5iUVfsVvTvbDADYkkoVlFDEKoyA/diD6fXnrc8/77JbaLoKZPwR
lhVPZx9j9PGgvlgingMondw5rtaTY3+x3if/3weBS2t2qu3vpipvi0YoxGsHfFPV
BgNyXAOfM7h2lEJzzBnpdiESSfQA+CT7vEVrjJqT306ymBLJB3j7GpwMJDyqvDcW
s28eD9wNWeIN0zhaThuRAiwRdd33YiNeJeoXobGI4XdARYN91Z0zsnfaGUvDoWhs
CWBjcqMBM8u+z21FUssC59uKTY2xupVfsJs8m0iame2+uzMcyVyGsSCPtGJ2+Q4L
5FYcTV57woRoQ8AlYNE7h5xd/CarLbCcXZf3kyc+YqROcwGglqVK6o8/4bnm0g48
QX5RiR2fEcQ1oAzIvkUjOHSJ/pfABF5CQeyY5q7WyMe0JBmCkG1JRhcIQD6X0ctd
XGSsiPEq6p4qFi+tclGL8KNCtFB59jZpne5RZnDPIMhneYx8zsTJd67SLAyX5qqp
51G3hVxmSoP5FS1Z4U2vtbeouH0bHry297Q/qC04IIa0E41MlYWoQURqLZEGmzx/
yK6iBGaR0Hc6Xd2/YBPpMfSj+Dl8SQpQuLRfTfdHsj7JDA2ZtWx8Xp/NTcz7V5n/
SRWIV/0f8nJKDy1BaI8RDPh4iLkVgAn/ZFjc4Ek4m6t9HRxewUs=
=ou4A
-----END PGP SIGNATURE-----

--oCLc26yMB6SnSXcT--
