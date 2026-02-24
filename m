Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEC02356BE;
	Tue, 24 Feb 2026 06:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771913382; cv=none; b=SUx56ndcxlruhu35gmm0PtlyZzQA1ouT4uCBcjp10HLJL8Dd+qtv4+5SplbZ1qfTo0sqCFfRq0iIKZ6A0U7K4rM6dj2e0X5OoffSkiWslCHveL8fJ5VXZQFSOA2UdpG6WjbSaXwq3s9c696rg6cbFikPgCTqFbhUXhmFzJX0DuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771913382; c=relaxed/simple;
	bh=bRTq22QNPCVeVaVwNqSyMna+FWHmaHv2B0p5ASJdjKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V19WftQvUohTf1Ksj2q3mmaKfdZmL0PfNxyhhDanjzIGfLFBLKhMwE2pd/e2q5ogAh72UDP+7oaWkBWFf0IcsQOdlQ9vjtLvdb9etzywLu8u8Dsl0npX75avVcOursN4S8cSBmSv9B1O9r9fUFnOsCv3hg2fSqOQyrmp0Xnecug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=biv5n02i; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="biv5n02i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1771913378;
	bh=KUlCkHgkBKkR1W5BhBDTlHCRqZjIxvKO4sN6dU/LI2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biv5n02i25/yybC0qSQYCbFOPwJvWtcq37PYqLuks6YAVzcLzL7xC1fG4ut7KsveB
	 T0urMfE3Z8n3RCK723TsHNqKVIztxpgkGlWemIDAUCiPZNSTM0oVTQk0KjTISwssED
	 t8Tvi6VFjJwsLKLzJGaRXhoQIsyo0xIl1QE1HMgZ7n7m8gIhWeJT4aLWwkvuqt7oc1
	 eZuhAdzdNM6Tt6RkJ7u0yUobwT/JRCMcqoyTcvc/JJcVuvpxsf76d/dluii9SzDeTw
	 wkx00VfykEVuPMwgPzWWDSKtElqa+NubgUuB+zKd3SsSascLmqVn10RH7oXCvxuXyX
	 fupw3uA3lwwhw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4fKnPG4xtrz4wBF; Tue, 24 Feb 2026 17:09:38 +1100 (AEDT)
Date: Tue, 24 Feb 2026 17:09:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 04/15] libfdt: fdt_rw: Introduce
 fdt_downgrade_version()
Message-ID: <aZ1AnegwzQgc6jrS@zatzit>
References: <20260210173349.636766-1-herve.codina@bootlin.com>
 <20260210173349.636766-5-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+aZuU0lW6KaY+/DK"
Content-Disposition: inline
In-Reply-To: <20260210173349.636766-5-herve.codina@bootlin.com>


--+aZuU0lW6KaY+/DK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 06:33:32PM +0100, Herve Codina wrote:
> Current code perform a version downgrade at one place only, the end of
> fdt_rw_probe_().
>=20
> In order to offer a finer grain and choose to downgrade or not depending
> on the exact writes done, introduce fdt_downgrade_version() to perform
> the downgrade operation.
>=20
> The modification doesn't introduce any functional changes.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Applied, thanks.

> ---
>  libfdt/fdt_rw.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 7475caf..90ea14e 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -22,6 +22,12 @@ static int fdt_blocks_misordered_(const void *fdt,
>  		    (fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt)));
>  }
> =20
> +static void fdt_downgrade_version(void *fdt)
> +{
> +	if (!can_assume(LATEST) && fdt_version(fdt) > FDT_LAST_SUPPORTED_VERSIO=
N)
> +		fdt_set_version(fdt, FDT_LAST_SUPPORTED_VERSION);
> +}
> +
>  static int fdt_rw_probe_(void *fdt)
>  {
>  	if (can_assume(VALID_DTB))
> @@ -33,9 +39,8 @@ static int fdt_rw_probe_(void *fdt)
>  	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
>  				   fdt_size_dt_struct(fdt)))
>  		return -FDT_ERR_BADLAYOUT;
> -	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
> -		fdt_set_version(fdt, 17);
> =20
> +	fdt_downgrade_version(fdt);
>  	return 0;
>  }
> =20
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+aZuU0lW6KaY+/DK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmmdQJcACgkQzQJF27ox
2Ge1kBAAoY71JJX2y6MHlw5qrt1xYB00QiIkTsfRr5JNZlxpb1gkoCcI+0eWfiuT
wzqF2fcqcctRiEXZrWv+Y1GhAGiDNIeCO1rM6eY9RtvyDxOnI4Yh5PaSwrBUpuPN
ITNnIhCcKdl/OUFCKtIRIgIFKqP6jnk+4jKFWVBvLbRN9fb4kVQY9yELYQ3t/Sjr
hg7IZZE2lGyWKgIW+CHENyoZnhVKTo/uL8L0rf1YIuWhp6x0Erhe7AyTsZiefHgd
Wbbq6JaPng3Snqh3atLjhvLPMwXpI9XSQcIGfzWGQlV0ilLKCAOW41jqWk5aLIqV
h/qhg8hAMGORPo99wIhWD+3n7BL9QPcQSAzRx1mWaZgQy3/LXseN588pIROJYkT0
tOQjBfD08ALrP+EbKT0Z3XZLGHdSY2HevjhT5f0FK6RCypurWZMqMZmYnXQFiLo3
34CqSa7P1K/5CNgIliTOrcKVzTUpkq07z58F26YfqY9II76Z7DTl4kJ6haI6AhjB
nd+BQSUc3Xu753gYUGgK7ap26WbIrdb+qj/FUVkhqzIwFwAtrejfeW/buAJxRP5G
7FKaCfdv5evEaU8U1WZaJBVHG2mh2txKv81qaJe5AYkMacVju8qiravZQgLmnZso
3lATXyxkEaG/bKjHjnr8jZ3dsJUK5J4CxIAhWRIBdDoXCwZfquQ=
=ALya
-----END PGP SIGNATURE-----

--+aZuU0lW6KaY+/DK--
