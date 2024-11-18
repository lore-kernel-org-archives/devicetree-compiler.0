Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC094437;
	Mon, 18 Nov 2024 03:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731900739; cv=none; b=trYCHxEG9nSk1ecBldWCTsklj5L0C6qlEdOBg4cJ5pTKOpcoPdA5USrcQluylT33Ntn5nmw+3egmkERHZy0PnF3rXhjlYtvEECkJvhQnQFZ1Rn82cf+H2NzrGmbJPp7seNTTU6Nm1Dw0BrSp6nxZ0Ja6Fsl08sV2lZfAJGT/xBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731900739; c=relaxed/simple;
	bh=0u7yDsHGFJyMzOlKi0WGtNXNWNfeREdP2WD+6OvRHYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U489fHDvwtCzGOnj/ApA86QKWIXnYM5uHaaqG7LCThU+ulTTDlGzrVtQ5/vZnqyTQN8evjuDDHC+GTx35dmHCgKVWLqv7WQjQa+qbyOYLl1WRIx8FruehxSv1lBWjLeytA3hmuTqjJ36aywPyk2ZmYltWeglr0jZrKFzZ+9Vt70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=AoQpSVKz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="AoQpSVKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1731900731;
	bh=D43X3QvRrAmFqdP17B+xkq4jj0l1y1h5gWQPgEIK+Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AoQpSVKzT9Yc12X672+TB9WNwIsnIH+5c3joM8mGnXkPtWISt/eWPZUcYD8Uelqk3
	 FPjQi9lOABGrLAu5IWT3j/lVvl+JsuNY+iBvFcXySZ39K5A0vNUWQ9gv42Y4g1KMqZ
	 EkeyVcUhjzZWKPoY2zo43/d/xEdn8iSZD2PRqSYeQhGdzpeRbJnGH5a9VCEtUIW6R7
	 lXLQOPfhKM6afYY1pdMOE6IvnsyHUZysiTTDHnSiwF/RFuuWw/9zNnSUYQpFEv+pMK
	 cWhoM2PPoVm4yzQlgVdMUWYVCRw5DEFBO8Y9XsPrQcJwOtTRKFPWyhMKgsLQVBmMJe
	 +roxSrGKU0A1Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XsCqH2wDFz4x8g; Mon, 18 Nov 2024 14:32:11 +1100 (AEDT)
Date: Mon, 18 Nov 2024 14:25:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bingwu Zhang <xtex@envs.net>
Cc: devicetree-compiler@vger.kernel.org,
	Bingwu Zhang <xtexchooser@duck.com>, devicetree@vger.kernel.org,
	~xtex/staging@lists.sr.ht
Subject: Re: [PATCH 1/2] libfdt: Suppress a unused parameter warning in
 overlay_fixup_one_phandle
Message-ID: <ZzqzwCBrSPVhYIwe@zatzit>
References: <20241116101228.164707-4-xtex@envs.net>
 <20241116101228.164707-5-xtex@envs.net>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6Xml9q9aIjx5ZMD9"
Content-Disposition: inline
In-Reply-To: <20241116101228.164707-5-xtex@envs.net>


--6Xml9q9aIjx5ZMD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 06:12:27PM +0800, Bingwu Zhang wrote:
> From: Bingwu Zhang <xtexchooser@duck.com>
>=20
> When compiling with -Wall -Wextra, the unused fdt parameter becomes a
> warning. With -Werror, it becomes an error that fails the build.
>=20
> Thanks to Icenowy Zheng for pointing out the solution.
>=20
> Signed-off-by: Bingwu Zhang <xtexchooser@duck.com>

AFAICT this parameter is *really* unused, it's not just the compiled
being confused.  So I'd prefer to actually remove the parameter,
rather than suppress the warning.

> ---
>  libfdt/fdt_overlay.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 28b667ffc490..f9be13865807 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -334,6 +334,7 @@ static int overlay_fixup_one_phandle(void *fdt, void =
*fdto,
>  				     const char *name, uint32_t name_len,
>  				     int poffset, uint32_t phandle)
>  {
> +	(void)fdt;
>  	fdt32_t phandle_prop;
>  	int fixup_off;
> =20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--6Xml9q9aIjx5ZMD9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmc6s78ACgkQzQJF27ox
2GcRdg//b3BCsKNb5qKz3/bIHcZkxxrDWznTyPS+nSX0rYbUQynumhETETM79R56
rE0XmJpYMQUYz8ROyfDOf+biDxB4kS6Rc8FhHAZvACXc0E16BzzPX3JzO2hShdmL
PshCEFR2k2HYKfuxlruV/afLli6/YnWT1RGt7JaHLIgr8z8oZIyQS83yZckRhVBy
qDT6zxuYd9qbFsVP7RZTUptzceGx5ILyi47R3LdYuONFu4k3Vi4tKgOXlJTcV00w
1wmYy3SKZVhXGle48gPy9Sbk7gF0nf2f+jodeWjehkvQQsBtnJyz4/dq2weixzRl
i+tQkrdVAl7V7guTlcDV5cri/wnCFfZ3YqwWdUAWDIdJyPPcGVRtyb6V651pH5NY
te+zpYqGvVumJ8SX3aqz5od6hGEC7qAOzQTSIlrxEzrTCx6EW5RNS/jYybO2k5tW
3bFTZe48M2Ptnj5Oq01ZEACX7oqEXAfSezw/O2detWM2WZHOY14grSEby3k23klj
9sXSLtCcdbFWDr1l3EW83Ww+OdQuIkiLBKiDtJQ4SsVjbbS1jMzuSCf5vUvDZsj6
C4edlo8HiO6PXSEPExoHxNo8hbNoWHKH7Uj5DmQzhMgr3bgnEyynVQO6KqwZ9Gh8
d77Mqz0Zuk+RfNmOZM8qb+r6xpbhjxIj8/lnLXgLpJslV4n3nM8=
=JY5T
-----END PGP SIGNATURE-----

--6Xml9q9aIjx5ZMD9--
