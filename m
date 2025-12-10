Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF1D1F3BA4
	for <devicetree-compiler@vger.kernel.org>; Wed, 10 Dec 2025 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349443; cv=none; b=gbU5cn9n5dxylyg1+IwbFea6T4lT74y7WiFLoSeNYf1ewRas4tzLJzalDkbNHGaPbx4GMaFCgacr/brwtTRDAGOrAq7Cdz6p66COLb5LvvxIbBTLPdvZaf96M42Y0eff7WhDzdDSVN6zyv5VUbhbmU3YsOTYakFjQqdO2SPIX/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349443; c=relaxed/simple;
	bh=qTW48N1lSLdoynTuZSpeKKOGBLTGQkAqOCctT+WygEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXQrKZx8GXyHkAiV4ukQ9d0FA3ZUuKBoyg6uBnrd501CrkwS7F2MjFxSJwj9mWHjqHjd1WPgt5E6RdS2CrLHgOd0F9QwGq7KmfuXq+MYm1V0I8fAcXXHBN/dxS/NL+ootrj7+n3/lyDBesILBgGVo5psdioRvfOgJwzKtWHQDRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=PRwB9EMm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="PRwB9EMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1765349437;
	bh=+AcU613WBAJo7S5qRzAv+ar/SwwKBTihQaVuG/D7mrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PRwB9EMmzVgZdLIJ7rXvqfM8IuhHt1/wyfe5ula9TEO1KK9FWWeq+Xoe1MObE7oNI
	 Sfsyk41byTWrLQyfjue5diQIOBBtqKrC/Kq31MF1J/FeKX3tWqd87VmEJFNW/J1C+C
	 vPFEdnV68o4O6PBPZhee8OT0sBm+KdG7wfSqdWDuKb+zX8ib6BlA+ar2eZQZx4p9pm
	 HAHvAYmmeIxgIPR6DnLY3lfGGaEDnorAr7uIGSyfGZKQw2ABxCLEwn97NdfXrHNxVk
	 j5Dd9FduyHCII1D5YZYA/3E2XBQ9A9kh2raJAg3b7u6jDFrH2rnjPLn8GRURty+W0F
	 PzHRFqJHgp98g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dR5vd6vLTz4wQm; Wed, 10 Dec 2025 17:50:37 +1100 (AEDT)
Date: Wed, 10 Dec 2025 17:47:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Tom Rini <trini@konsulko.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 3/3] libfdt: fdt_get_name: Add can_assume(VALID_DTB) check
Message-ID: <aTkXnnYkjvPbN3Yd@zatzit>
References: <20251210022002.3004223-1-trini@konsulko.com>
 <20251210022002.3004223-4-trini@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gBVb/8qG8XkqNaiU"
Content-Disposition: inline
In-Reply-To: <20251210022002.3004223-4-trini@konsulko.com>


--gBVb/8qG8XkqNaiU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 03:50:53PM -0600, Tom Rini wrote:
11;rgb:ffff/ffff/ffff> In this function from fdt_ro.c we have (reasonably) =
some checks of the
> DTB before we begin work. However, we do this in a way that we cannot
> make use of the normal FDT_RO_PROBE macro and instead have a direct call
> to fdt_ro_probe_(). Add a test for !can_assume(VALID_DTB) here first so
> that in cases where we are assuming a valid DTB we can omit the checks.
>=20
> Signed-off-by: Tom Rini <trini@konsulko.com>

Applied, thanks.

> ---
> This is another case which we see in U-Boot SPL, and for the last 6
> years now have had the equivalent check. This change ends up being a
> noticeable size win for us.
> ---
>  libfdt/fdt_ro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index b78c4e48f1cb..63494fb7ad90 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -306,8 +306,8 @@ const char *fdt_get_name(const void *fdt, int nodeoff=
set, int *len)
>  	const char *nameptr;
>  	int err;
> =20
> -	if (((err =3D fdt_ro_probe_(fdt)) < 0)
> -	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0))
> +	if (!can_assume(VALID_DTB) && (((err =3D fdt_ro_probe_(fdt)) < 0)
> +	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)))
>  			goto fail;
> =20
>  	nameptr =3D nh->name;
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--gBVb/8qG8XkqNaiU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmk5F50ACgkQzQJF27ox
2Ge5Kw/+LvXDCx4YQqdAQ7GE6j0LIyTf4rgEBfo7rW29r/QCiRlINg1M7rNg+PVH
nfnnjE6tpqywMIRjaEpvrR2jvLsnqCkN89sIF20LL4qwrqVZRMDtfqVBHt/UEldY
8uWi9YXyRrrKn+XFzVzLCpMwTn+eI9w97x5ZZOsMjYqj3iT7sQoOGahXykpFM3Ox
DbZKfq9oPABAIfT+G4527pbz6tmywRss9nU8j47ueP4J68dHoAO2AtyUj71Cy+Yn
SomKxsjNtvvAVmiUKWnX8hKeou1AbWRyOLsuDCh0XN108XBOSAgW5EEEVHFXeldD
BxCAuovgJfWKcLp70o6/y9mP6mf0TVZDlVgf05bYaMmPda2VsTPkymdzqIy7l00q
srku/XlQ0pC+y0SdzXCcDGV0J69m3wn1M16iaHAg8f0jMdd/MZAeZs2Rp/cCHYDP
TrJ57vXUvdR77f1AxUGTQW9d8unJQadyYZyJUbVf6eD7uzxB55pQEBh2SXNtNJUn
TlPOumEluvRGJ/a0wxEgtpcbnEMDDC6I+W7M+XoFQClrpla4t+gOKcqf4SkSBNAy
CjU8zN8f7934S7k62RP7x9jDe0951f4bR4JNzoR21UoXM12t4lHSmNulo/c3AbKz
CUql7+b5xq203Ks93IK/cZbnYp0l65PP3O7Vo3KnbKBnYGp/S2M=
=C9UN
-----END PGP SIGNATURE-----

--gBVb/8qG8XkqNaiU--
