Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598525;
	b=S4qpebgpCy9qetM9+mQbQz+URhMOAIOUlFpZnP3NASGXOMevFcarQt9p71ebDSkl6oCj
	 EpZNnVyOBgU6BQYrk4SN7J0tWSYN/kdl4b5vehdf2a/cwCvjkthSlNceOA20Tj8GPvqrv
	 3K9je1hYXXEOU2eFthXBMonT9j4XkIkuGu+Xz2CfAVln9appQMCAaMJFn6BszEUgykwOH
	 9p1/8DEOPP1YNXvSVVrvJt1c5lGESJwLMN/vDBKKen1+PTKRUBkuwp+PcvUyJHOop76k6
	 jwULFP6XawDjbBVUJpA7vqU0V7HjcxVK53g8Wfi81CvOuFxZxGiVgGcSnVHiZrSea5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598525;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PunH/L6wVNaqKqeGn2TP7UZUdIhfbFcugtY3ublafg0=;
	b=n/Txz9gmxut7KljEqDGCfJ4chR47MGILC37f86KWVRiOl7bdSz6XG12O31Qxu6Wm3HvS
	 jfRqJqKTzbcaBLUAHF5ZyXkiKIPri1icTeu82ltDewyWJZf7zaOg7nNd2SeADm7UTAXT7
	 mtHVIJA5NQLm034r1wYR8NUM640cN0FOBNrSjsBgFp0bZRNk+BUWxvgTO7XRjbkZziBOv
	 jURR42lPyvM0GN8DdHHCkhcho7mJqzWCfLHstrg/qsWgjJE1F1wNIxUHKTq1vLlvgzyac
	 W+/wEnxOErWl7Ww2LIz7IdwbmiCGSgUzmTHdkDI7n8l0tzYwyGgJ0SEQKcEkrUJxC2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=DcwQm3cA;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81A7606A338;
	Wed, 25 Nov 2026 09:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D81A7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=DcwQm3cA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795598520;
	bh=PunH/L6wVNaqKqeGn2TP7UZUdIhfbFcugtY3ublafg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DcwQm3cAZjn3GHY/iYie2TrrVik7YPT2+Q4X841YE3z31AV645iRD7cmjyYR/l1FF
	 aeTLHd5ljrUtccGG2BVljFLyETfzlSTUFN/pL4ZLTJ5TOwJ/TEkOFn2dSasyXqp2Om
	 GRMqvPlBZwSqfOdy3EM03E2CmfP/Y+jO4y1JOPX2ggyUHsgoFpoLot4s6aVs0So/7v
	 i1wlXfgndft/NrVIDbUQii3CpRhZVRZK4oorGIsBO63tzWVO8m+4BE282hs6SnwOgn
	 poPhhQUnTqEwhzsBiw5KkbNsSge+EMjMMOAIvd5T6OnEh44a75uIG36bMnrBXjfH83
	 6szTZuqzobMFw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZDhm5rkhz4w1k; Wed, 25 Nov 2026 20:22:00 +1100 (AEDT)
Date: Wed, 25 Nov 2026 20:19:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 35/74] checks: Get 'chosen' node using
 get_subnode()
Message-ID: <awan_SrUGC7OEMIL@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-36-herve.codina@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="3jprAG2JFq9k7Hup"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-36-herve.codina@bootlin.com>

--3jprAG2JFq9k7Hup
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:49:04AM +0200, Herve Codina wrote:
> get_node_by_path() is going to be updated in order to handle orphan node
> support for addon device-tree.
>=20
> The 'chosen' node is a subnode of the root node and can perfectly be
> retrieved using get_subnode().

The change certainly shouldn't break anything, but I don't really
understand the rationale for it.  AIUI, get_node_by_path() should
still work, even if it's (trivially) more expensive.


> In preparation of the future change related to get_node_by_path(),
> replace its usage to get the 'chosen' node by a call to get_subnode().
>=20
> The modification doesn't introduce any functional changes.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  checks.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/checks.c b/checks.c
> index 13e8b121..1332acc4 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -1349,8 +1349,7 @@ static void check_obsolete_chosen_interrupt_control=
ler(struct check *c,
>  	if (node !=3D dt)
>  		return;
> =20
> -
> -	chosen =3D get_node_by_path(dt, "/chosen");
> +	chosen =3D get_subnode(dt, "chosen");
>  	if (!chosen)
>  		return;
> =20
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--3jprAG2JFq9k7Hup
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGp/0ACgkQzQJF27ox
2Gffhw/+KaRgfelohIL2M87zaarQirCSjwXDY0ljvudPyFlkCWrYuSnU03JIOx+e
l15Gt8SDx8hTGhVBTAwXjXA3h4LZIzM6EvzrHM5cAquwkAyuDXQX5n8nFxQeSdlb
lDbUOHWS5rCGUBR3gjrqTBbxCda2wiWExFGkUFkEa4+VgSeQ0Ip3xDljM4HznpMf
qOoUSsHbPQWr9U3u4j4P/w7jHm5QLD/G+QUqWMBKRq6Stq+/0I3Pxsmz+mdK9VMA
mNlRh6qvqUaauntFR5VgZG6GJ5g4Tfro/InDjELzPjQvdlqzYI8p5MVwkZXEjPDV
MxAitl/8NMgnzEW1GgaeVQtVs8gDKTRezipFd/zXODpjDDywMjW6oirHQB2tbuNB
V0BGMC8seYic8Dj8OzVSFBcN/PxG/B/upaaUWTUn+esa58ovEYw21xWUAsQEG8oL
oBNfSMdi3Z+gGv+PBOlJXZV+ZXMQBi7m4amp0bv0XU9WerpAUiGvZ3UAEV9aCkjw
lsYNyMA0ZICfxmHWhkaJNMGtU2nu4keUmTks+GOP/hly/16jTyWqpkOeutdObxdx
rToX/tyoH6V2PC8MWbdLD1Mn0RKYvrf2eGFMyMycj3vlsSOUjKbkHYffSerQysC1
XksKmg+Rcx895hXijufkBWpQlt1YZcUgxDlbX4PndYkvbrR0m60=
=JjUm
-----END PGP SIGNATURE-----

--3jprAG2JFq9k7Hup--
