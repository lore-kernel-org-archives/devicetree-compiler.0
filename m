Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABAC2745C;
	Thu, 15 Jan 2026 01:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768440908; cv=none; b=sEnKXXhb8kY++cZhduXAPlz0yEbgA8/cIGK1xQgnXYUShnnfDdEVppp/M2NDGsBWHDU2T+C/4BsDfDft5P+Bi7u3/aRkKx7yU9Di6wSMPO5gLZKzjr8SzyTdc8FhPtQto2iFvkyqREygmsgvyFR/yhTGkdUjdONcLJ/jW1TQ/xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768440908; c=relaxed/simple;
	bh=+DJg1jcATNVA8kLsWlEzfr/bGOQK9GB+/cqWZycCsXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4F8SREsINKg6/mP0UpkiSMYXZtFnqyY6+UqSJsS5OWAKN1KjWe8xMySAnVQGn0reIQGuetwV/TrMrFf8qN7PDJEW7aWg1KCxqWl+mhtDf1v9KKnroe2yQMwm4uHwur6jwGhe4Xf8syGiWspvaa3cQ4voGOvongUrKlifdmmdnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=OTSh3Zo6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="OTSh3Zo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768440903;
	bh=eBNYcLyNRCY5pJXL78Xd2S1UNmWkAFXwuYItmxc3rZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTSh3Zo6EOJM9fyBq9w2SfHfRcB1J6ro/OCGKQVyei6x7rAgEvyH7y64HZPhNuZJR
	 uB59nPOmdIPboGFYTxduBrTHwmT5/MQh6tOsco7G31Qo3/USs8S6gHANKzTzyNAtjy
	 vFebzKy3GgnpvpXVp6jS+WlJ/MMGN3azASlGlUBKPc4wRJw+FEozDqC9UEadoPhRhV
	 57aDxWWytItfiitCBVejF2BMbiBd2SZkfDaVXiq794KZvakM7C4jNQSYG59cbl43cj
	 KSdJ7RlADqY5ckAxTXSxD9T5xs8NKxGffePz2t9X7rTv/ElZ1KmNUxHcYUWJ4MFNAS
	 uWGyXId+Ib7dw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds5Bv2Mymz4wCJ; Thu, 15 Jan 2026 12:35:03 +1100 (AEDT)
Date: Thu, 15 Jan 2026 12:29:33 +1100
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
Subject: Re: [RFC PATCH 13/77] Introduce dt_flags field in dtb header
Message-ID: <aWhC_ZDT6KpYfADC@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-14-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DV7zaRGLtZjjFuhi"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-14-herve.codina@bootlin.com>


--DV7zaRGLtZjjFuhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:03PM +0100, Herve Codina wrote:
> There is no simple way to identify a kind of dtb.
>=20
> A dtb can be a "standard" device-tree blob but with the future support
> for addon dtb, a dtb could be an addon dtb.
>=20
> Whereas, looking at node structures and name, we can identify if a
> "standard" dtb is a pure base device-tree or an overlay device-tree,
> this will be no more possible with addons. Indeed, specific node such as
> __local_fixups__ and/or __fixups__ present in overlays will be no more
> present in addons.
>=20
> In order to avoid any complex and error prone searches in the dtb
> structure to identify whether or not a dtb is an addon, encode this
> information directly in the dtb itself.
>=20
> This is the purpose of the dt_flags field.
>=20
> Prepare the support for 'addon' flag introducing the dt_flags field
> in the dtb header.

Do you have any more flags in mind?

If this is just for identifying addons, I'd suggest using a different
magic number, instead.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  fdtdump.c               |  4 ++++
>  flattree.c              | 17 +++++++++++++----
>  libfdt/fdt.h            |  5 ++++-
>  libfdt/fdt_rw.c         |  4 ++++
>  libfdt/libfdt.h         |  1 +
>  tests/pylibfdt_tests.py |  6 +++---
>  tests/testutils.c       |  2 +-
>  tests/trees.S           |  1 +
>  8 files changed, 31 insertions(+), 9 deletions(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 7300280..5c78559 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -87,6 +87,10 @@ static void dump_blob(void *blob, bool debug)
>  	if (version >=3D 17)
>  		printf("// size_dt_struct:\t0x%"PRIx32"\n",
>  		       fdt32_to_cpu(bph->size_dt_struct));
> +	if (version >=3D 18) {
> +		printf("// dt_flags:\t\t0x%"PRIx32"\n",
> +		       fdt32_to_cpu(bph->dt_flags));
> +	}
>  	printf("\n");
> =20
>  	for (i =3D 0; ; i++) {
> diff --git a/flattree.c b/flattree.c
> index 07f7545..2e2ffcb 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -14,6 +14,7 @@
>  #define FTF_STRUCTSIZE	0x20
>  #define FTF_NOPS	0x40
>  #define FTF_REF_XXX	0x80
> +#define FTF_DTFLAGS	0x100
> =20
>  static struct version_info {
>  	int version;
> @@ -32,7 +33,8 @@ static struct version_info {
>  	{17, 16, FDT_V17_SIZE,
>  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
>  	{18, 18, FDT_V18_SIZE,
> -	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_REF_XXX},
> +	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_REF_XXX|
> +	 FTF_DTFLAGS},
>  };
> =20
>  struct emitter {
> @@ -370,7 +372,7 @@ static struct data flatten_reserve_list(struct reserv=
e_info *reservelist,
>  static void make_fdt_header(struct fdt_header *fdt,
>  			    struct version_info *vi,
>  			    int reservesize, int dtsize, int strsize,
> -			    int boot_cpuid_phys)
> +			    int boot_cpuid_phys, uint32_t dt_flags)
>  {
>  	int reserve_off;
> =20
> @@ -397,6 +399,8 @@ static void make_fdt_header(struct fdt_header *fdt,
>  		fdt->size_dt_strings =3D cpu_to_fdt32(strsize);
>  	if (vi->flags & FTF_STRUCTSIZE)
>  		fdt->size_dt_struct =3D cpu_to_fdt32(dtsize);
> +	if (vi->flags & FTF_DTFLAGS)
> +		fdt->dt_flags =3D cpu_to_fdt32(dt_flags);
>  }
> =20
>  void dt_to_blob(FILE *f, struct dt_info *dti, int version)
> @@ -424,7 +428,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int ver=
sion)
> =20
>  	/* Make header */
>  	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
> -			dti->boot_cpuid_phys);
> +			dti->boot_cpuid_phys, 0);
> =20
>  	/*
>  	 * If the user asked for more space than is used, adjust the totalsize.
> @@ -555,6 +559,11 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int ver=
sion)
>  			symprefix, symprefix);
>  	}
> =20
> +	if (vi->flags & FTF_DTFLAGS) {
> +		fprintf(f, "\t/* dt_flags */\n");
> +		asm_emit_cell(f, 0);
> +	}
> +
>  	/*
>  	 * Reserve map entries.
>  	 * Align the reserve map to a doubleword boundary.
> @@ -980,7 +989,7 @@ struct dt_info *dt_from_blob(const char *fname)
>  	}
> =20
>  	if (version >=3D 18)
> -		flags |=3D FTF_REF_XXX;
> +		flags |=3D FTF_REF_XXX | FTF_DTFLAGS;
> =20
>  	inbuf_init(&memresvbuf,
>  		   blob + off_mem_rsvmap, blob + totalsize);
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index 530d2e5..128e7bc 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -26,6 +26,9 @@ struct fdt_header {
> =20
>  	/* version 17 fields below */
>  	fdt32_t size_dt_struct;		 /* size of the structure block */
> +
> +	/* version 18 fields below */
> +	fdt32_t dt_flags;		/* Ored value of FDT_FLAG_XXXX */
>  };
> =20
>  struct fdt_reserve_entry {
> @@ -65,6 +68,6 @@ struct fdt_property {
>  #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
>  #define FDT_V16_SIZE	FDT_V3_SIZE
>  #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
> -#define FDT_V18_SIZE	FDT_V17_SIZE
> +#define FDT_V18_SIZE	(FDT_V17_SIZE + sizeof(fdt32_t))
> =20
>  #endif /* FDT_H */
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 00e32bb..1528b33 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -457,6 +457,8 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
>  			return err;
>  		fdt_set_version(buf, 18);
>  		fdt_set_last_comp_version(buf, 18);
> +		if (can_assume(LATEST) || fdt_version(fdt) < 18)
> +			fdt_set_dt_flags(buf, 0);
>  		fdt_set_size_dt_struct(buf, struct_size);
>  		fdt_set_totalsize(buf, bufsize);
>  		return 0;
> @@ -487,6 +489,8 @@ int fdt_open_into(const void *fdt, void *buf, int buf=
size)
>  	fdt_set_totalsize(buf, bufsize);
>  	fdt_set_version(buf, 18);
>  	fdt_set_last_comp_version(buf, 18);
> +	if (can_assume(LATEST) || fdt_version(fdt) < 18)
> +		fdt_set_dt_flags(buf, 0);
>  	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
> =20
>  	return 0;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index d1a9cd5..9777f32 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -319,6 +319,7 @@ fdt_set_hdr_(last_comp_version)
>  fdt_set_hdr_(boot_cpuid_phys)
>  fdt_set_hdr_(size_dt_strings)
>  fdt_set_hdr_(size_dt_struct)
> +fdt_set_hdr_(dt_flags)
>  #undef fdt_set_hdr_
> =20
>  /**
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 373e11a..7d5ab0b 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -285,9 +285,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          """Test that we can access the header values"""
>          self.assertEqual(self.fdt.magic(), 0xd00dfeed)
>          self.assertEqual(self.fdt.totalsize(), len(self.fdt._fdt))
> -        self.assertEqual(self.fdt.off_dt_struct(), 88)
> -        self.assertEqual(self.fdt.off_dt_strings(), 652)
> -        self.assertEqual(self.fdt.off_mem_rsvmap(), 40)
> +        self.assertEqual(self.fdt.off_dt_struct(), 96)
> +        self.assertEqual(self.fdt.off_dt_strings(), 660)
> +        self.assertEqual(self.fdt.off_mem_rsvmap(), 48)
>          self.assertEqual(self.fdt.version(), 18)
>          self.assertEqual(self.fdt.last_comp_version(), 16)
>          self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
> diff --git a/tests/testutils.c b/tests/testutils.c
> index 54da2e4..2d5cfb3 100644
> --- a/tests/testutils.c
> +++ b/tests/testutils.c
> @@ -344,7 +344,7 @@ void *open_blob_rw(const void *blob)
>  {
>  	int err;
>  	void *buf;
> -	int newsize =3D fdt_totalsize(blob) + 8;
> +	int newsize =3D fdt_totalsize(blob) + 8 + 4;

Kind of pre-existing, but a comment explaining where the 8 and the 4
come from would be nice.

>  	buf =3D xmalloc(newsize);
>  	err =3D fdt_open_into(blob, buf, newsize);
> diff --git a/tests/trees.S b/tests/trees.S
> index ecd43bc..56c1002 100644
> --- a/tests/trees.S
> +++ b/tests/trees.S
> @@ -22,6 +22,7 @@
>  	fdtlong	0
>  	fdtlong	(\tree\()_strings_end - \tree\()_strings)
>  	fdtlong	(\tree\()_struct_end - \tree\()_struct)
> +	fdtlong	0
>  	.endm
> =20
>  	.macro	rsvmape	addrh, addrl, lenh, lenl
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--DV7zaRGLtZjjFuhi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloQvwACgkQzQJF27ox
2GczKA/+NJtAT86IPukuSV0yU8c0EqKuJ+ZZJrhkxOd+Kg4LtmXd4iBO6F+eEAQN
n8b+Jx/tApSs/CP2huDvhDAjHdBoEVhc9oUSgB5Zn9PRGZ36mNDGeW4nI2mEIIRm
5W2KWwIsCudytZKuczUTaRhejAHvJyBYcU5LcJmxMHtoyeP0JJqEV3SmkCOR7pFY
x2AiUZd4qLNzIw5xRgSyC+n5sh8QHAJTKi2IgcuGBZB2pEQapqNcI15pXAMm1hv8
6WtOoteU9oZRDWgP5wtyDAtB81Pm42v93hD52qJcBa+f6yUIgUHFQdu7Kv+pBANn
dtm4GLwOhg/eJulTTD9Y0kKHiFIskATTkaB4ypn6sH2wBULMLTMNrnfWTzFOKuFq
TbhnICwUEkFhUZsX/VOudV4BPVku+NT9oDSOxE3V8bYUH4ouflawDqJoAcXY3dbX
eZJMt+LAATSPpKym9V9lmZaEr1VN235t08Oi3lWEsm+jZIkpT/9vHYLUEq5lE4vS
28Rvb6JU4ByIKVNQROCsyvS1QAFtu3q+HBae513F8PXzLaeVKYTyJxJ4DWYeILQa
1a/KyY9slkEAxuo2SGi14DeSWKicTAPGEdYaRFIZ0BHpvmAjjiDDvOZ+la0T8MLD
Ol9QnxMNf67dnPPLSy66qmpNP5d/CrQJm7XQumieTWdwyx4aOwk=
=rInC
-----END PGP SIGNATURE-----

--DV7zaRGLtZjjFuhi--
