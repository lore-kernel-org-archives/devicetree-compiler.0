Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3011F21D599
	for <devicetree-compiler@vger.kernel.org>; Mon, 18 Aug 2025 23:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755560309; cv=none; b=Tq49O8Tp58iuIoeWwVO7SgqboA4MKNzcq5UDYq9PCe4b9/n02PdX6lujWVnRTv4+VrjrSLuAEr1p4nAif81bUoD0iJ2+O8f6UHrk575efvcBLoQQlZNPdyS7OZE2sw2JxkoT4AMZhalkuwVmocqyIOXJTgG7k0YwN/6CnwJDxOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755560309; c=relaxed/simple;
	bh=NWjisVs0CHi9LuhxXYCvBK+6jAHpx+pecClNIUQqAgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7wsfmnIDz2PEf7IbUg+HpHcenD/tboLnuAAVvbbqC29j5MMIXlBbPi3klOWSEpLU0U7CS3g81vmcRjc8Pg0GXN7PdhqzHkWEZH5Q+CTkI19SE5p6lDJuj1lLaFxfoYQ1kV1RlASwxI5U3/V1/FKgGuRrQBLMKePLp/Hr7vatKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=UEwjDyLA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="UEwjDyLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755560304;
	bh=UIH9HLH5Afp78MJa6pGTK8agZcvKQZGF426yQuHSwuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEwjDyLARyaJjlgqqSX0rPDtcxxf/ZlMxszT58Dx1wPfJyw+O/k0nPVMhGATFx/sh
	 bLEpPHDzclvzwa6wwJ6y4GKmA0dBjDE5I7DVSaSlTnFyXrEKmNpBQWtmcmlLXQXTcc
	 kWiuZFK1/zitlrjZ5BG5G3LlXukL33AKv12Q0eTYruPxhSvqfS9Kp4IZJ5EslcI5bS
	 ZImqUaHspKYB9nPXfEs4XczrmXv6Ln95mb4QzHPG97DAzHyULGAjLKWCkk0CggIEl2
	 6/vZ0C2fOTaJAuaXydnOMYfGU0AxHDjDDUxpxiw4fvyDqfhnwS1UcidA5lriS4DsRM
	 UcbD2U5EWL3bA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c5Tg42N9Hz4wxh; Tue, 19 Aug 2025 09:38:24 +1000 (AEST)
Date: Tue, 19 Aug 2025 09:25:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v3 1/2] livetree: Simplify append_to_property()
Message-ID: <aKO2b1OK3eE8-yVo@zatzit>
References: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
 <eef88e559f5b9818c4c2311fa8a75ab6fd4508d5.1755512759.git.u.kleine-koenig@baylibre.com>
 <f3nskwqmfkf5i47qbnt4bfh4bfl4c4mt6lygay5cfethpzddj7@6c5bmfnd7g67>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kCo6d43Zeipr7BM1"
Content-Disposition: inline
In-Reply-To: <f3nskwqmfkf5i47qbnt4bfh4bfl4c4mt6lygay5cfethpzddj7@6c5bmfnd7g67>


--kCo6d43Zeipr7BM1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 12:38:57PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Mon, Aug 18, 2025 at 12:35:45PM +0200, Uwe Kleine-K=F6nig wrote:
> > The two if branches are quite similar. Build the property first (in case
> > it doesn't exist) and then the common parts can be done outside the if
> > block.
>=20
> Argh, I failed to add my s-o-b line here. Maybe b4 picks it up when I
> write:
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Heh, thanks for adding this after.  I'll take it from here and paste
it in.

> here. It's fixed in my working copy know, so if there will be a v4, this
> isn't an issue any more.
>=20
> Best regards
> Uwe



--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--kCo6d43Zeipr7BM1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmijtl4ACgkQzQJF27ox
2Gdbjg/9F6jWJVfej9qYNKfDp0eEtctb4dcWt/wYAqX0QMMG30DyIFgLqC6AMs18
5dhNlweW5aVCzKl15CtLyrr350o5Pl24dlzt4ofBT30M/8Qh68eOkieMZuqAjtMP
S2qPqjGSdVyOZFCBSRhYPoIVFsx475LogffXu0ovLqlS1Japx5f8NCSoh6uSFZcz
NP+6UEBVzY4zaiX3SUFKYXyEzRr0AWe9DqkZGyvKJLMo/UDb4AtlLpgQnEThqnCu
QLgOONAolqubnPiwUP8wIoTnevmxvylFsDjMOE2ZG80IsYhzsxVQb4asZQylWnxO
cbQw6XrFqoQHztuMT9ypFU0MAaFp4iEAwHAbH3+TDpzKTSuO+iYibug8xUKDabSJ
56rQ9NCpWqPLDpfDYFbGzSWnZJoE2q0s9jOXC1fhdS6F0cV9WEGEFP6I9i2WWDb0
4Kjbcq6Z5rtzg0kVRl5Q6Zra66K3J9Zq5G6BpaaEl/OznLCwEviPG0r5b+8G3fsT
PWiyfC8TpH/0RNPf3stoVd6w4ajYPztKHQeRCqkkvcdKGRMBPpKIAUv6A8ZddUae
wHwuyPFWVwbG+qv0CXIkMJv5x8W39rLGnp+JFxlZUFKKuczJ6AzUbytDknDrlaxy
+WHxophrsGPKvhJwk5P9KU9h4WPOXOZun0yEkofb2nC6brBwBeg=
=slX4
-----END PGP SIGNATURE-----

--kCo6d43Zeipr7BM1--
