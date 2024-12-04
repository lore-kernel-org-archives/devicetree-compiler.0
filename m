Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014FA1372
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733272451; cv=none; b=Ih6cL7PTDCcyrqvKXfUxPQ5jntndyOEGrkIkmk4aKffOWJLRVYeJZhNBCKzlPAE8BPN/DtXqUEHgdYm+k40sZxgMq0YQiZHkKT0BcqFgewUZs1LIPHHEyuJqdik+8Ia8lBQv3uwG2+WEEqeebSqIwdn0nLDEHTQoIm5eI4Ud5zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733272451; c=relaxed/simple;
	bh=a1CeqW0ejKLKFRmvuBTIb7i9rrqliJymEdVZYF05ABw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oshWOZFoRD4icUK+aOCE2vKT0xZ0gB9PbdYo3yArWufe+7v6Qo4bOkzADbkO7JJEOBNpRenkgF86GjvlhhCYpnIukBkKqdeSEIOR9zhS27hBkqIsiEYOvZ2TfKHALQy6ld0ao7grTVVNB/hujueG7db2xPcATVKwM/ZJVuZkjDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Dhr7l7Ar; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Dhr7l7Ar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733272442;
	bh=64db1AXe/fj+x47CVPw0Z0kpAuPJb3f9/J9lZEeIAp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dhr7l7Arz2LU6PD/AIEAEbt93yUX5UsFnu37uGlMfkRDBQtfZPRqe3zQhDTVAuRNG
	 SZWO/GmNpavRWqP4/NDIxQ+fC40DDzVAOB8ZyQXxFbmRBw+qxO+Uc51bxj+Hh+BiyR
	 yAF1gSz6yzohIOWHVdInnFnLKKlH/blUi4TLZ2mjxJgOpaFsz/vwbOavdfwDgIobrh
	 +BmLDdPBjiMbpBWhXME4cSsev7t2Ghrww76VvcKtTsbwaGjGdSRbHZdug81UNX/B5o
	 xhivKYVglzAZWuiX80Ob6BsXZsB13+Q7GF47PeFy129o5/ZM+IBImq2O9i/aQ/ROkn
	 xNGhkjioY3i2g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2z6L1m21z4xfn; Wed,  4 Dec 2024 11:34:02 +1100 (AEDT)
Date: Wed, 4 Dec 2024 11:34:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 0/4] libfdt: Add namelen variants for setprop
Message-ID: <Z0-jeCGR_B925sr6@zatzit>
References: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6p84aCILe5PnK4QN"
Content-Disposition: inline
In-Reply-To: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>


--6p84aCILe5PnK4QN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 11:59:58PM +0530, Ayush Singh wrote:
> Helper functions to setproperty with length of property name similar to
> getprop_namelen variants.
>=20
> This patch series was originally part of overlay-path patch series [0].
>=20
> [0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-=
b47f96dc7710@beagleboard.org/T/#t
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Thanks for responding to the earlier review so quickly.  There are a
couple of tiny things to fix in 3/4, otherwise this looks good to go.

>=20
> ---
> Ayush Singh (4):
>       libfdt: add fdt_get_property_namelen_w()
>       libfdt_internal: fdt_find_string_len_()
>       libfdt: Add fdt_setprop_namelen()
>       libfdt: Add fdt_setprop_namelen_string()
>=20
>  libfdt/fdt.c             |   8 ++--
>  libfdt/fdt_rw.c          |  41 +++++++++-------
>  libfdt/libfdt.h          | 120 +++++++++++++++++++++++++++++++++++++++++=
++++--
>  libfdt/libfdt_internal.h |  11 ++++-
>  libfdt/version.lds       |   2 +
>  5 files changed, 156 insertions(+), 26 deletions(-)
> ---
> base-commit: 6f183c7d9246bde8f05d2edbc31fdd497c4a8702
> change-id: 20241203-setprop-namelen-a94f7f057acf
>=20
> Best regards,

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--6p84aCILe5PnK4QN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdPo3cACgkQzQJF27ox
2Gd/MQ/9Hdp+c5gOXwIcKBRBEKJ7davCAQ9KImVaP57y+F94ClUyCkw8E5iniCCM
P4YTFlxRD2lY/VHATkqg34q68we2Y5EUlbozqag4nOhs7GBsECko/vBNPtQ3H3WN
5PkSbj/CzVyNLGSc6YGF3hGfbWpgKNXk4t2Gc6hOUk7vnDHvZ6hSBb5oN+HNQgWV
S0+c3PLtMsdvzhyeYSR84Ec2zHL1RBiEin/xz/GaO2lz5C/SeajQmBMZgJA99AQ6
bf242Kzr1ye0JTWNzSERWSeyIelmnqRlgx2i3t+/Dw2EQZxiPdsWW9jkt/Hl76NN
mbdHGPabrp2YUQ/NykXoh370RyaLl/b+NwB96GC8BEHX36Db+xmKOVsc88e2x0Oi
tX/s0pYtJVvnbAkJ4447RnHdz8+fu+Ggc0P4b4/5a5gb1FcxTnyeauw35uR9St9w
RbP3PNMxXPrS60yZvAujW2RtYLSRN+Nd9PEn7DPFePKI2Kpa2rK7gu4iDg532Qkt
wn1wVXRMit2QL2+4kbL9bRwHPOClyy1YluSDd62SFzoA/7YPaaYRKOu2c4kNJV3+
Ncja3pFuFDQaKvD5Tyd+AZcjeb3iEV14b9N1R9jxpPODDKmXAhv+LNuE9gbwLfjl
/pnbs6UgLhIxgHfnXqxa8v9m+L0B8/SDJNHNZGEhWgy7NZFTi2w=
=zRIP
-----END PGP SIGNATURE-----

--6p84aCILe5PnK4QN--
