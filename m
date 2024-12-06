Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2A18B09
	for <devicetree-compiler@vger.kernel.org>; Fri,  6 Dec 2024 05:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733464112; cv=none; b=LLqPC9AU8Mc3l0UjzVLAdWwju/+n0u1htdFKd10s29B8N9p/A/xqzFiWmYe51VXlkuVsn9Cu+ed0Az2PqiTVcwOpee17WI+1A9pFRqrzVZCIzrZQ7RFjBvxR5VEQyauZbLWDX6bJgibzPEuZsDJcwkctYZIwPTxdonMdw6ObMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733464112; c=relaxed/simple;
	bh=UPWiYtpQGQtRI9V7tU8CxHMgVDzEAJMDkqIt6CPfbmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNV9cy2/B1kFGpChhseT9u9sm42xU3HEwNae8RIPsE2Glu1tn9RMB7G34q+vfoI3XgGMDtkxV4KzEL9ZQjvXETy9iBQbGQfc8C0IRzAE4G0JUZ2UADJcQPTEAfMYVUHhS7Z85xloaKx2SzxlUOYQ+WmnDgG6KBRTSrk54oLyh+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=DP2DkA3b; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="DP2DkA3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733464101;
	bh=5hCBrz8S37WvCAq+8eiOo0iNrGWI5G3BRJW7sZJzuZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DP2DkA3buu1KLykFnJ/6/zhMvg+cmJ9asVLQ7dAZMjNzO8Q8KK5srQqi/8UbWembd
	 KPh2ESH8ppUzse2Q70JiBiYK06cn6sA46WmfAcOybMZItF6zEdTNB1GN4n3XGNi/3H
	 CAoY2nN4Wb3W8qYEoOM9tV1Br5TUQplP8CMUdUOY8inQ1sHcFPAKmVxffY34zMr47N
	 0plMrAsX7xH1QXI8sn20DlL7Vwzytqogu6ZmTwZKwjWG8G5aa2K01Zad0UkAgTdU+d
	 Y8x+ks2ASWQyJTip2AeiSC4X9Aq5AaVt896IM+5/Zax0bTxW9+f2m1yXPUScjgYbPk
	 J8+wB99XUu1/Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y4L055wnBz4x6H; Fri,  6 Dec 2024 16:48:21 +1100 (AEDT)
Date: Fri, 6 Dec 2024 16:48:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 0/4] libfdt: Add namelen variants for setprop
Message-ID: <Z1KQJZpgODVajgd6@zatzit>
References: <20241205-setprop-namelen-v2-0-0d85a3d2e7b1@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TSKJFHkn7+DbR15O"
Content-Disposition: inline
In-Reply-To: <20241205-setprop-namelen-v2-0-0d85a3d2e7b1@beagleboard.org>


--TSKJFHkn7+DbR15O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 10:21:02AM +0530, Ayush Singh wrote:
> Helper functions to setproperty with length of property name similar to
> getprop_namelen variants.
>=20
> This patch series was originally part of overlay-path patch series [0].
>=20
> [0]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-=
b47f96dc7710@beagleboard.org/T/#t
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Merged, thanks.

>=20
> ---
> Changes in v2:
> - Rename fdt_setprop_namelen_placeholder() to
>   fdt_setprop_placeholder_namelen().
> - Some formatting changes in fdt_resize_property_().
> - Add trailers.
> - Link to v1: https://lore.kernel.org/r/20241203-setprop-namelen-v1-0-d1e=
a333fbd6c@beagleboard.org
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

--TSKJFHkn7+DbR15O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdSkCQACgkQzQJF27ox
2GcHWg/+IHULkgzE1SdrA80Tr7305shFE6mxg6oNyOpcvqrZWBlhaqNuX/vHGmtR
M0RiKQm7ha6d4r2ShaIo3aaMm7RJVvQCzfs9Fjz42E9Z78vKohaST+TLawJ618A7
nbgbh6endO9897IjPYA8E65ld5RARsayZtmYR/DR0QFj7N5hGHdpDBpClmb7tkrd
tincJx+M5YZ7cg0cD1PbF62oEuHT9Jm+fR9KQxwU9F26qplm8gzRBuBuIkHOeLQV
7SjApqC5dJEldqkN1B/WF4ZR43zKwgFW35c5KJi9XT/06czq6hpWbIczn4cwMzez
xDv5E783DJ85AEJ/k1iR/SVWdBOrRjAcr+7GbMdy/luDVQqwjPLnZo5VW922QIhd
k8Qqx/utODBsohdNKMuIrt9ZzH3MhgGpKz117g9h/7dB/lEL9k6/x35CX/pM6xMX
XatNXnSp0C3C1FrENO8Vqhk94gtk8ZlgXveTpFhJx4t7+/rkfq8kfCTnCkzUYZ73
CO+sXRqLXsw0LHudxIfRNXtiQOJlq5v2PN05fu+0Gh19UAT8zx+DusnNcNxSHpP/
d6cLZY4Gi8KNse3cz6p89A1IDT6lVBCWPp1meAUbIv1vfpV/Ey7BONdq9Z81j4CE
M3nGJWQ5TT1ijNPZMq8hnKiMkvU/bn4uXd+a53af9IoQHZPW+cU=
=mOF5
-----END PGP SIGNATURE-----

--TSKJFHkn7+DbR15O--
