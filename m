Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330209;
	b=idDi9xn5hIuByet5tVUbT+FwPYlM8KQiXWSWdGWmZqHr5MG2M5HZd0U5yt8VYYZ38MVG
	 G6ahctQdC2cenH39Nn1iBTxOrN0b8F1beg+8WRJVbWRcnglJaRP6yidwCWqAtQSf5ymkA
	 GE1jHFuvIzzoChO3D7AEMqELA1KRoIuiJUCHUTj47GRP+wjtvTqaXtAIYULU9p7AVEfnZ
	 Z2JEuqul/0U3sszSfU1paMYI4eqxVNdmBqvJ2ICScLoJu+IJHRQ9dH/96NeWBX2GWa8Bj
	 Anw8qyA6WIcD9kQNQCrYrGeAAe93evNjmJM4MmXOT1HlwLAAgz/cZUk1YFs6Cf3fEGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330209;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=s8m4NxaQ3DC7irczVBVNTcAPEHRS/PbcdK6vxxSw350=;
	b=GMAguosizH2v1zjVmVucMxfsY0gBmOPSLpWoLXFeeqQAvigeyskEhPbgMR1P5hlMGPXQ
	 ePYrxfmNx40GBGv2du4tZS30n1A37byj647urdbnm3lhpabfLMM80cBYlU09h2tPU2OOV
	 HGKhrGQv3mG3c1uv/1KR+G5TZ1sFoFycqE7UwHHVOQznhOHCg6LeA89eYI0GQF/DqrwMP
	 +fNATwTdckvNaF8aZ+OpEc7G3sCvZ0qNAu4iqzp2VrU1C8drMFtn8XxecgFXlBmWlnr3L
	 8i8zCrCRIM1xwTSCIbjC/yQZenwFRT4ue1/zox/D9tuprL/mOaNRUwizIJTDL4nHrPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2807606A31D
	for <devicetree-compiler@vger.kernel.org>; Fri, 30 Oct 2026 03:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2807606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793330194;
	bh=s8m4NxaQ3DC7irczVBVNTcAPEHRS/PbcdK6vxxSw350=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSWYZp52D6quPWNsDCmDMhvTACWS1OvZNyt9KcDUXkdT0I7ta5yfPFOKc3neuvu+X
	 JvZwGxy9lNdSbc76o4vVusC+jkYC29hEZlo1U4XwJNzc+x0Tz8s2Quh11VFPudTdnb
	 0Qy4KarvyoZfLUB0VHX2ntvMsqLTeEBG6UPfxXWkln/MzIpfWGEYW9XSynpb/gnuOk
	 2GIq2aA+9gCVQs7irvK9HIdIRo+FEgbA8s6ZUrJUU+Tz/uyQxQEJ19g5uBy0COzQyY
	 Pc/mJ2DLun52BFjs1sSqrSxg6/yRJJd+zY+c8fQ7U+dkn8OAUTlfN01bJrx6YNPadx
	 Pku7j49og/seQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jG5q63DGXz4x4j; Fri, 30 Oct 2026 14:16:34 +1100 (AEDT)
Date: Fri, 30 Oct 2026 14:16:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>,
	Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] dtc: Check fatal error messages and document
 deletes
Message-ID: <auQMCah-V5aVTNPo@gractus.seuss>
References: <20261029093115.3647778-1-sjg@chromium.org>
 <20261029121738.4b298023@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="++TWtVJmVldZ+dYi"
Content-Disposition: inline
In-Reply-To: <20261029121738.4b298023@bootlin.com>

--++TWtVJmVldZ+dYi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:17:38PM +0100, Herve Codina wrote:
> On Thu, 29 Oct 2026 03:30:53 -0600
> Simon Glass <sjg@chromium.org> wrote:
>=20
> > Tests which expect dtc to fail check only its exit status, so they pass
> > just as well if dtc fails for some other reason. Also, dts-format.txt
> > does not describe how a node defined more than once is merged, nor
> > /delete-property/ and /delete-node/, and it wrongly says that dtc
> > accepts a file without /dts-v1/ as version 0.
>=20
> Hum, got the feeling that the two different topics in this series could be
> sent in two different series:
>  - dts-format.txt update
>  - dtc-fatal.sh removal

Theoretically maybe, but when both parts are this small it's fine.

> Except if David applies patches 3 and 4 (dts-format.txt update) from this
> iteration.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--++TWtVJmVldZ+dYi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrkDAoACgkQzQJF27ox
2GdkwhAAntzCVOzX1x8/T3h64BhmbCuwU734pZ0E2pjDK/kAKvVh5tY73DR0vcWR
TDdm/NTM6dvETyzvkp/MZroQNxlSWEwk8LvD+OCdNMifo35LH4/XgWJtIGQXaWsX
qkf4sFQwsKD0e955o8O9gfrzIJZP4Y3l6//266+tYRwu523FPzz/t/q0hQDe6zrg
rMw9bNDahC32j5GvmihmCgREgt1sq5M8X60CwBh+nMNlHNRrVFqxLkjLNRM3ARUh
IGTKYLX8fzx1dfjlKrudRO5snAQmyG+oCP12m4yCRQCUlzs/h3YZVjKj6FXFGNQ4
qDWVw47c09ceWvXGaPJuFDc7roaitNZU9xas8oCj1e2I2WEjwsYj33+6IKkXDyJP
jqb3jYLISiWvRRsYyTmVNuMxjGg9w66WLZLFWHLmOnUJuzsJu9T1KvviT4JnnrN/
O2mMRvAD7/bvo63yjmnv5Yu4NCLjyMJ75LAgPSd4DRJAmMswmgDe/vDr4vNGFtQp
4OCYTeW5C0W/CRIyCzrLl43nvKk5etB8ezn/nye0qdRZpHUmL4AKJw+5YqsmL7CA
lyVB11OHMEdD/Yt4+UMoWNCewKNeqgJ48eqhe8VDEHay4mY8VJlQv5lDyIEwAz6g
uUS1qLAQFcE2oQRKC0OtHqIo4FKLHQ56vTX3hynxBYKG7SR/5Bk=
=gFwT
-----END PGP SIGNATURE-----

--++TWtVJmVldZ+dYi--
