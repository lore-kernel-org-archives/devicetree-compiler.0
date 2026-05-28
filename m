Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1FF2EA172
	for <devicetree-compiler@vger.kernel.org>; Thu, 28 May 2026 02:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779937010; cv=none; b=g6nzqvGJerIjld5g/eEGD1uMtkWngWGgYJK0olELmMhdcehTnaHcabRrAOnFDE+W+LHIQdTfWek3yx3+roKLNNB7VG1wVcGKbhKThAbl9wUVyBSQkMh+zqnMdFZI8ltHPg4Q8x3W+EvPvsy1hs8l9SjATZGQs7OI2EG0bY+DcvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779937010; c=relaxed/simple;
	bh=k7bPVpLMvrAHY2UyHeNSG/erUwSN8zLWrOVIm5BKNjQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8+74zCz0HOWedUxMSqo4rp02J+sw0MXcs5xn/DRwr7l30Ta3yjZqKuetX+kKj5dOdRXAapQ7W/Av3LZ1vPX2bSAhBxqGs6IRhUZJuyrb5Bs4/4Ib3NfZCXo/11EOBfcRKalFNV2ie5AC5hDuIbg/Qg5x6DkxO1pgYq2S3jiIKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=BeY/H1+h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="BeY/H1+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202602; t=1779937004;
	bh=5eo5LUJiyzIcBkm0iQAs/TDiAL+rLv2ENsfEr1NAYf8=;
	h=Date:From:To:Subject:From;
	b=BeY/H1+hcuHwO6SOzTObGGASJUXTpSfplseAUyJkV2BzoHWoz7rePvd6INvROtHnA
	 kSj39LN+llFxqhGzAPY1F0KNbekgZlO/jqmBM234ilXDZIoYoy7+O6VqetlDHPr+6I
	 66WtWGOI/B1zpdDbexT/CHpROFHlNsMZKsyNJtvyWcqaC/lsTkEH+D4CWOnCxSWWcD
	 /XF285YrP09o5z9AZRCuGEnGWXstpSE0Z+k0TZV7PmA1O9UnmFaY2BTDu3PbnEhDvw
	 zZ0UIcLvtiwkMxYzv8Iwad1CD5vUSvZ64D4r+UnWC+L4hHQjo6bkxwoCLdnCBFiFiy
	 uEf+IB/fTAVtg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4gQrjm5glQz4wL5; Thu, 28 May 2026 12:56:44 +1000 (AEST)
Date: Thu, 28 May 2026 12:56:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: devicetree-compiler@vger.kernel.org
Subject: DTC 1.8.1 release (don't use 1.8.0)
Message-ID: <aheu6GBknHJ2LMg8@zatzit>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YlOeroAfMANzxv8s"
Content-Disposition: inline


--YlOeroAfMANzxv8s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

DTC 1.8.1 is now available.

Unfortunately v1.8.0 which I released yesterday contained a nasty
accidental ABI breakage.  This is fixed in 1.8.1.

Git tree:
  https://git.kernel.org/pub/scm/utils/dtc/dtc.git

Tagged release (v1.8.1):
  https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.8.1

Tarball:
  https://kernel.org/pub/software/utils/dtc/dtc-1.8.1.tar.gz

Changes since v1.8.0 include:
 * libfdt
   - Revert accidental ABI breakage from fdt_setprop() and
     fdt_setprop_placeholder() being changed to static inlines

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--YlOeroAfMANzxv8s
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmoXrucACgkQzQJF27ox
2GeeRw/+NqvXzslz/CF5FeGps8/OaLuQ4CLmkI4xbVd/9vPiCTHwGTJeJbupHmi2
M7bLWRmpV6x00waR5lkpeRSBdm0vZKIsixfbygyksFyNEhHhzurVM8Sn34iGCx+J
utNaAZR/0opduU9nbRShBYNzD1J0ArLsm9oxVh4nq0w29VkJXSEJJPbNuxFlM9Vs
ZWBq5BFpHqdnNMkfUL6iQteIpgo/Sr9RBENQrLSg29tWlm6I1tfCZRIKf8rQbS7P
7cVqMXbbr/O3Y/tqPEGnxNeRWF6v3q9jreDRhLhY+nkgQQONBp59hx7DGp9LIph3
/eO5TXvbxfZBAqOi3QPcazMe38/HrW2EGsgtAHxVvTGSArfMRfOWiZYAIIZTcZNF
27s1NK9XTYZqKc/s4xAsdPB3hA5f12f1HWDWWG88pcIm76DqHfZpp3vX2LCO7ccW
JQVl+NO+OA5MoWeOe/yRZIz1yheiy0Wmz6kd8NC5Z0NOsUF3d2fYYfIu0DRKaFt/
sEyRI/c172Dbzgze7ICVrGqWlxj/N3hvRdywd2NzIaZWflmHfyj7vwuECkI8sA6Y
hvEd3JNwB7GvUr8fqEb2n9YpidWyXADBifyEIuML7by8DUtq38Ob9DrguZbvKAnF
9JB78f1Hq+IbA+EW/LeGgxQwzSp3B1W3rPwlAw3/Z0wX8qxPNrk=
=yhqi
-----END PGP SIGNATURE-----

--YlOeroAfMANzxv8s--
