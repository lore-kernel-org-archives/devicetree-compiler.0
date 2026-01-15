Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33907404E;
	Thu, 15 Jan 2026 00:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436854; cv=none; b=Ar3Gqg+WjdQ/TEktwxHjVbCaYSFHAPsg3SeK1KTZ8jiZvzzBxkTTLqmQ8uzjcFaRtQKIP+aIlsb8ZRARh6O0+4LBv/xLnqcYDXHl2mJKK8X1+qH32T9TeNxtlk3zLB4aQSNQpZLE8FV6RsZLxZafAPzNXGD5YKdOVTNZ/oZC4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436854; c=relaxed/simple;
	bh=2/fW8fcaXzuWEU3wePjLbXn7goHL/ZeCjtAGsshndlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8CMF/OmMTmRfUmG6ZCkZnC4201RQWqJrNo9CxRn2XtJvALWFjnFoIvVwu0TTPOZvJmrXlALNT1977T/pm3SiTD+bJ4Gm/LpAzQphxs26Wx+nEupB+TMlHvowsIGDBNcDzRsU0qDKGqbgNUAiDCFJ6o3j0iSja8V9kc/HPnMoPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=j41L6sAr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="j41L6sAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768436849;
	bh=bZXBBeEg9S7Cr9U62C9QvGbttv2zLDuJJJVAT+8rGw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j41L6sAr2p+n8G/BAnYl1lNUrthv05WE3eKXc1uN0un5/1Gw8esEyoqMUi5a0IQoS
	 f0R3Eo6j/PF0RM69my2rso5/2iimf88PTzm2sPOnoTOlFSC28FYx3nDGSMz4Hiuz7j
	 IOh5gLaBB45N6hE9ZRCdySM2nCk1Ksvmx+iKSiF5D6D7dr6KKikvMj+0PlyIjhJLm3
	 75dICYrqh+cWsix+Uc8RKmBa3gkYA/GSB1RMer8DMg70jiNVRrONOKVcJUVi2t0S/y
	 DfU9zVUBNAQg7LqnjrtdCeul78+UScdnO31hMZ5krum/7T/xu7M42BJKUDKKcAFEuv
	 PeKknN6ByAjxg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds3hx1QXhz4wCY; Thu, 15 Jan 2026 11:27:29 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:12:49 +1100
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
Subject: Re: [RFC PATCH 02/77] Introduce v18 dtb version
Message-ID: <aWgxAVfUYMUy9mz1@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eGoa9Xh4npm+1n05"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-3-herve.codina@bootlin.com>


--eGoa9Xh4npm+1n05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:18:52PM +0100, Herve Codina wrote:
> This v18 version will add support for
>  - metadata in device-tree blobs in order to have a better handling of
>    phandles and unresolved references.
>  - Addon device-tree blob (successor of device-tree overlay)
>  - Import and export symbols feature
>  - multiple trees in a addon device-tree blob (i.e. root device tree and
>    orphan node tree)

So, once this patch is applied, the rest of the series pretty much has
to be applied "atomically" - otherwise a version built in the interim
will be lying in saying that it supports v18.

I therefore suggest moving any changes that *can* be moved before this
patch, should be moved before this patch.  That will assist in
reviewing and merging the series piecemeal, rather than as a single
giant blob.


Regarding the content itself.  It seems like this is a pretty major
change to the dtb format - maybe that would suggest bumping the
version by more than one (e.g. like we went from v3 to v16 in the
past).

It would also be nice to have some docs for the new dtb extensions
before or at the same time as this.

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc.h                   |  2 +-
>  fdtdump.c               |  2 +-
>  flattree.c              |  2 ++
>  libfdt/fdt.h            |  1 +
>  libfdt/fdt_rw.c         | 13 +++++++------
>  libfdt/libfdt.h         |  2 +-
>  tests/pylibfdt_tests.py |  2 +-
>  tests/trees.S           |  2 +-
>  8 files changed, 15 insertions(+), 11 deletions(-)
>=20
> diff --git a/dtc.h b/dtc.h
> index 3a220b9..186caad 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -29,7 +29,7 @@
>  #define debug(...)
>  #endif
> =20
> -#define DEFAULT_FDT_VERSION	17
> +#define DEFAULT_FDT_VERSION	18
> =20
>  /*
>   * Command line options
> diff --git a/fdtdump.c b/fdtdump.c
> index d424869..ec25edf 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -18,7 +18,7 @@
>  #include "util.h"
> =20
>  #define FDT_MAGIC_SIZE	4
> -#define MAX_VERSION 17U
> +#define MAX_VERSION 18U
> =20
>  #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
>  #define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
> diff --git a/flattree.c b/flattree.c
> index 30e6de2..c3887da 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -30,6 +30,8 @@ static struct version_info {
>  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_NOPS},
>  	{17, 16, FDT_V17_SIZE,
>  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
> +	{18, 18, FDT_V18_SIZE,
> +	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
>  };
> =20
>  struct emitter {
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index a07abfc..9372353 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -62,5 +62,6 @@ struct fdt_property {
>  #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
>  #define FDT_V16_SIZE	FDT_V3_SIZE
>  #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
> +#define FDT_V18_SIZE	FDT_V17_SIZE
> =20
>  #endif /* FDT_H */
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 7475caf..00e32bb 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -28,13 +28,13 @@ static int fdt_rw_probe_(void *fdt)
>  		return 0;
>  	FDT_RO_PROBE(fdt);
> =20
> -	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
> +	if (!can_assume(LATEST) && fdt_version(fdt) < 18)
>  		return -FDT_ERR_BADVERSION;
>  	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
>  				   fdt_size_dt_struct(fdt)))
>  		return -FDT_ERR_BADLAYOUT;
> -	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
> -		fdt_set_version(fdt, 17);
> +	if (!can_assume(LATEST) && fdt_version(fdt) > 18)
> +		fdt_set_version(fdt, 18);
> =20
>  	return 0;
>  }
> @@ -455,7 +455,8 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
>  		err =3D fdt_move(fdt, buf, bufsize);
>  		if (err)
>  			return err;
> -		fdt_set_version(buf, 17);
> +		fdt_set_version(buf, 18);
> +		fdt_set_last_comp_version(buf, 18);
>  		fdt_set_size_dt_struct(buf, struct_size);
>  		fdt_set_totalsize(buf, bufsize);
>  		return 0;
> @@ -484,8 +485,8 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
> =20
>  	fdt_set_magic(buf, FDT_MAGIC);
>  	fdt_set_totalsize(buf, bufsize);
> -	fdt_set_version(buf, 17);
> -	fdt_set_last_comp_version(buf, 16);
> +	fdt_set_version(buf, 18);
> +	fdt_set_last_comp_version(buf, 18);
>  	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
> =20
>  	return 0;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 7a10f66..c5cd35d 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -15,7 +15,7 @@ extern "C" {
> =20
>  #define FDT_FIRST_SUPPORTED_VERSION	0x02
>  #define FDT_LAST_COMPATIBLE_VERSION	0x10
> -#define FDT_LAST_SUPPORTED_VERSION	0x11
> +#define FDT_LAST_SUPPORTED_VERSION	0x12
> =20
>  /* Error codes: informative error codes */
>  #define FDT_ERR_NOTFOUND	1
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index a4f73ed..373e11a 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -288,7 +288,7 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          self.assertEqual(self.fdt.off_dt_struct(), 88)
>          self.assertEqual(self.fdt.off_dt_strings(), 652)
>          self.assertEqual(self.fdt.off_mem_rsvmap(), 40)
> -        self.assertEqual(self.fdt.version(), 17)
> +        self.assertEqual(self.fdt.version(), 18)
>          self.assertEqual(self.fdt.last_comp_version(), 16)
>          self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
>          self.assertEqual(self.fdt.size_dt_strings(), 105)
> diff --git a/tests/trees.S b/tests/trees.S
> index d69f7f1..ecd43bc 100644
> --- a/tests/trees.S
> +++ b/tests/trees.S
> @@ -17,7 +17,7 @@
>  	fdtlong	(\tree\()_struct - \tree)
>  	fdtlong	(\tree\()_strings - \tree)
>  	fdtlong	(\tree\()_rsvmap - \tree)
> -	fdtlong	0x11
> +	fdtlong	0x12
>  	fdtlong	0x10
>  	fdtlong	0
>  	fdtlong	(\tree\()_strings_end - \tree\()_strings)
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--eGoa9Xh4npm+1n05
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloMQAACgkQzQJF27ox
2GdnTw//bDfWNInrpoZDTu8XbIcEQOjVJ/bNazFzV6762BE/Y4l3GkvsF6JgXyRr
SHbZsE7mR5QuMVYx+c4WzUHd9bhVjuWr7mKiBqNcvFBwwoRQjV4CN1fr1qnvsWWI
iDkxmtceZ5gmdCOl6L6ZcXL2deIIRwu2+5pikUb3JCnFwDLA0VzvDXe+rbQWOzXT
Amm2zdUBQjziRju7xlMVa7lmefHQLK+sl4stWLIpgsP7lacK+WrGtOqRDdi83AeW
Dn2l7nC3GOalUzWomYsEvsE+gYQcvLfKU0grXwqTIo1VcRMfat2/GpJsvg5Hme7S
kSI2rb6rzk9iti7No5VXLjpf5o3KMgUJpEuz4G37VCbxfcgaee9tjC/QbteZVrqd
i087ACXipnKFxiAsYSdJL0/3DhWPFVF4wWYhrC+dgF7xGTRHbhLRFxqTkDe9e3KD
dUK658y9Yq9wgw5LhggFFajZnSPBrWr0XcPsiH4+Mpd3C3lGcNESJLJDJfyBaMCa
6/ouEi7jdUdw01TgpRvvCLwao4OAVepnqsGMplTZOrnSJ188NGH+b6vStVsgLybP
Sc2Z7UJLmjxWTpft84RMlx/5ngsaTK9GYYgnhXwcr3BPc9W895o8A0sPO4BgV3SZ
C1TybduPF1MmgCQYuOa4dXnLW9GYX7XQpyiVd7e0I4/QWCWJAsU=
=1t8M
-----END PGP SIGNATURE-----

--eGoa9Xh4npm+1n05--
