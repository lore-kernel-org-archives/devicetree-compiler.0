Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F7126BF1
	for <devicetree-compiler@vger.kernel.org>; Mon, 25 Aug 2025 01:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756087084; cv=none; b=W3fYch++kQdByuVldyAZJHcTOklc0AIKMs8BmrpswBlaRbtUa2BnkrH+CldGkbLaAPYuCy+EyknancJuVsEjZeukqPu0nY2hkAGzjpx4sOczQQtWXOOeavLTxlJDKaV9Op0Uo68MpOraeepfoelmCnJXTAlVlHOyNZbyxTlhVwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756087084; c=relaxed/simple;
	bh=TUMP0sHhNevc9c3dXKO76bbH953891CQ0jTEwBNuzI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqJpOq2TsIF8JpaulKmvyq7APkeNluvAdtYmjk2VlN/5Jgg85gEA7+kelNDaiHs8lIUmqpgYxXWuJtMoX1aYYJRm1wGyS0yvhCzyb4w6FrHu1MBEJow6ZgSpKtW/pAtOOIBsTVUfB8lLK1aN+kzEWDe3tD8HqpGiP28+NjJfnFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=kyScKP92; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="kyScKP92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1756087079;
	bh=wK0JP7JaqVltFLsVTaxL+X/F3mrP099pvZ+ZlbJUVn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyScKP92b/AcB072YNhHcLTfLcs1yn9E39XD/Xv1IGtt3BUVVztqhjMTdFNMNrmTP
	 rnwiNyvHVCAVjyO5uUU1CWou7y9KMZwIKyyyIpArPC6mvmSDigJ6QD4v3m20Mvd9bA
	 gftTtGwUxaSqK5OeGJEccNKJHcsj0l/stVvF2DCpUgQIg1lVZDMEEra0yY92oG7xjJ
	 Ot2mvaT+mv6sfueSFsWcVZumV7viLRnbAy6iYWMfOR0f2tGKBxkTE+GQ7h1TzjQV1x
	 U6VtA5zIgmynOa5a1rac02fgYCvG8bexyX4Tr3pSo9+/3JUnpChWvCgX1R19/cfxtU
	 qJ3wkfvxAaYcg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c9DTM5JQGz4x3L; Mon, 25 Aug 2025 11:57:59 +1000 (AEST)
Date: Mon, 25 Aug 2025 11:56:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Davis <afd@ti.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] checks: Do not check overlays for alias paths
Message-ID: <aKvC6Puxv8mGEE4w@zatzit>
References: <20250822171038.190122-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8PfcMa1OWg48vptN"
Content-Disposition: inline
In-Reply-To: <20250822171038.190122-1-afd@ti.com>


--8PfcMa1OWg48vptN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 12:10:38PM -0500, Andrew Davis wrote:
> The path given as an alias inside an overlay can be a path to a node
> in the base DT. The path check searches only the overlay as that is
> the only tree available leading to false check failures.
>=20
> Skip this check when checking an overlay.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>

Applied, thanks.  If you have a chance, adding a testcase for this
would be nice.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--8PfcMa1OWg48vptN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmirwucACgkQzQJF27ox
2Gf+tg//cWfZMRdubZMLFq51MSjmtAre0BOnUDTADdtbttU8yamBtaGF4nDqOzfP
KKBOfKq7F4+MrEBJzdFycPkUFuprUXfHFEvZ8/tsGrbeqNT3CgBmrPT4t+shin6s
5sSvpPCJWIK+HDH8S5VzNlCZzyvfEZ6mEc1ULGzewOzP6fJS8awnyBLQXigoiYEv
n4oxUS1yGFiXjSs926hJdxJjhRMKmW14BcJOGYFxv4J50V50mgKbMxNTljYUBS/v
RlagXUw7vBw3J44EmvaFg6Q3E1iO+4WktJsKP/S0PR2P8qaca21rgJ9VR96xskUj
x5TlmOvcm0ih2YUhkEGGpHgPddfuOiCG+/d3kGvIG7fDUGoEXhdT4Ov0xRcQgU9k
NIgWbXYNiNUb2voXbzhufPyf1Mie+k/AthbAwoP/G6dPuzbPiQJLaNlBByoMYmeT
MynsEwiy8B9EaF4lkSq1WqFhZ2gyCXYCQbbCkIWqF0N7XTwD2ccUtCB0qawFw/S5
F5duNH5WlEs85h761fug70JNJ0LxoWJUco5sTn9AhOC9vJxjJowo6VXlyfmgwa0D
xAOsrRub6LXCO6QRmTQYkZvLbr9Jj4Vd2sCgAqcch4IZYP5+rKG6G4BmpQLYwVnv
9LUDRPjb+AI+Kw5j6tTZZEhaIE1VO/0aduAxONuG3gqIwDp3fGw=
=mxuM
-----END PGP SIGNATURE-----

--8PfcMa1OWg48vptN--
