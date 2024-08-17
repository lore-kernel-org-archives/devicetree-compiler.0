Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E7F881E;
	Sat, 17 Aug 2024 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723887570; cv=none; b=AiaOhbxaeJQbFxvEFkIbJ1xJwkPm1ju/p2mZ7DnzuULuTFNDoetnAFwpquu+wf88M8Vmf12C6ddODKc8JPxFT+vi2/Hnq+Bg9RpPGWa0zBO3drz1QZO05mCBD8f7QQ5Q/CxPM8XP+5X6FSO+2sEJqM9dLjbp4Z9bDPgzx9zK1Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723887570; c=relaxed/simple;
	bh=NwHxnvFXiBEHVX4wkLA805xaDKdcIG6rsyP1PxTXagg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNJk0KX2Uz0V/HxBPAQqui6AzII61o16ZiZiqu1bcXLJLslIE9XSIEIyXKt+GHOE93HSBUpTCatn5KEZzZJvMbqCMtuUbZkAXu4uRdoq3mDih9TLWEvrlV0fkUF+n3eDp1qCUg7MnZvj5fR2gXuRQJMLpFeI9uMECIUOLdeaOmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=fail (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=r0iflny2 reason="key not found in DNS"; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="r0iflny2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1723887556;
	bh=HCLJ05LKVk8qMy56162LwCE+Js/bpwEDdUsiylXDByk=;
	h=Date:From:To:Cc:Subject:From;
	b=r0iflny2pEDgPWnHo5wlF4hN7ra+oL++684bkDKmVDsC8Dq4t5L6+vVKBWvBx7WFL
	 F0We+YVRhCqjXSx0zfkaQi1sgtRWJlaE5Ol8w9BP2fIaD+4xZohpYOQlN8XjNjgaOK
	 Bfe98UPep9/9jssCoQKFeHNbwzb/k4JA9/PnRZGbSu5dIvQDgjzOvTVrOvTP3mAMB4
	 RMSsgqsN1nUFEX3K6FZuSaH+XQdfQdPLnSFRSF9TQr9a96j2WV93TCs+8YIeOvJrnS
	 1Xg+ilX6QRQ+BZpjrN7M0BLwrArAW6iKmctBJlI2UVQEUXoo1Y+MX25MFi1UV4whA1
	 0VO0nQVf2dJtA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4WmDMm2CJyz4wbv; Sat, 17 Aug 2024 19:39:16 +1000 (AEST)
Date: Sat, 17 Aug 2024 19:38:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: devicetree-compiler@vger.kernel.org
Cc: devicetree@vger.kernel.org
Subject: Device Tree Compiler v1.7.1
Message-ID: <ZsBvsq5pVv9xEPmp@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3XuU5i8a2qRevCQa"
Content-Disposition: inline


--3XuU5i8a2qRevCQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rob Herring pointed out it's been a year and a half since the last dtc
release.  There haven't actually been any headline changes since then,
but there has been a steady stream of small updates.  So, I've rolled
up a new release.

As usual, the git tree can be had from:
	git://git.kernel.org/pub/scm/utils/dtc/dtc.git
and tarballs can be had from:
	https://mirrors.edge.kernel.org/pub/software/utils/dtc/

DTC 1.7.1

Changes sinve v1.7.0 include:
 * dtc
   * Fix check for 10-bit I2C addresses
   * Improve documentation of -@ option
   * Update to libyaml >=3D 0.2.3
   * Improvements & fixes for device graph checks
   * Add -L / --local-fixups option
   * Add check for length of interrupt-map properties
 * libfdt
   * Add fdt_path_getprop_namelen()
   * Add fdt_get_symbol() and fdt_get_symbol_namelen()
   * Correct documentation of fdt_path_offset()
   * Correct documentation of fdt_appendprop_addrrange()
   * Validate aliases is fdt_get_alias_namelen()
   * Don't overwrite phandles when applying overlays
   * Require Python 3
 * pylibfdt
   * Support boolean properties
   * Fixes for current Python versions
 * General
   * Assorted bugfixes
   * Assorted build improvements
   * Assorted typo fixes in docs
   * Some additional testcases
   * Move to GitHub Actions based CI

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--3XuU5i8a2qRevCQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbAb6EACgkQzQJF27ox
2Ge0fRAAiIFH14WWrVJJmQBvzE0/+6okIRdaWgLh7evO2h4l6MNeJPk16GGtzgY6
8j9FW9uH8wjy6ItHPIacP3+jkqIgaezoKx3yvoACkiigWWcc+T0Rmp0GcYepMteE
sascc9/fEJ3fYi2+8kcnwHFwTmgAkEo6jepKWMxGam6EX0D6E9XyNg4Y3pVAmMmm
hJR5AJl5B3QRBN41+AKyxBFbRzl6Y1frgpzxMmIx7jUDdPR7mC/b/KmuP9bUrLK7
vFJBYmEGlFc6nOn6m0qVRJdsKW4x9IX7Gu5jVgYnSlKdtIRtxEZgusyJU5+UGIcm
mq4ZCIAePC8T6iHDcoahuu3OZ+wcsK58ZZ9r64k+cgmVIRfm1TzzY2uc7UIqrrEC
vnFcU4efmQ6OAriw7XRlemxuQxlUJArY6YsADc37zyJAWXizG9jvvtvi8Ft879bO
RcSodAeaHcfLZUWkR/T6FRAzpRTqME3mac5WquDR9s3ukgpxYHj3C51ZhNT6ToqJ
aBZQBJEhj83THxahwu80zDOb2WM/FN+zLngvnFZ7zfA0NlmDJyeAuj5BYoFz9H3x
vqMye0RGMslH4zqqZ6v9weMKrX+IZN5p8a32ID4PXk1KXiLVzS4VLfTRG/lFPDfA
1w1RriyyN6hPOl1D8Kd9SB2/Di1dPNk8s6NZBPRVIXcSG+fBpJI=
=EfXn
-----END PGP SIGNATURE-----

--3XuU5i8a2qRevCQa--
