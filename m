Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA55A36921B;
	Mon, 21 Sep 2026 06:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971611; cv=none; b=HE1VT8bIhdYfZEw0t+s3nyDewfQ+d1r0Xo8q92BB3DSljoNyt1Ja1ZeWjiYHX2n+tucM50lmpkzqzvPpvkyctCfw9IKINlsPUCskcPbEiXrDcCR3B5i67iOnJmOJXCgFhmSCznMcDhajsx+ZnmZRcYR0svBnXVN6eLvQJ3PPXaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971611; c=relaxed/simple;
	bh=0eyAyYtj1yPBQa8EKTsSJLg9vkwrmodpRRgmU5CrtYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ks6OYIOe2K2WuzpIHYAbU/X/xsSdmi/yvAtpObTX0kMATVgfTIaLLw6m0eS2awVNmdEorMDB1zhcj+pcZHyheFa1VMscpSgrUfTgQHC7Qtd+ZIE5tPPFXhTgtMy9FzAeEJN8Lww5RoNhf26ObJyRhEkwhy/5u6VybGzuSg0LXjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=jZPDdF25; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="jZPDdF25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789971584;
	bh=qgUyjdaf3oEe2lnrXPkAqyXKHpJ4TARIWWJvHrNZmRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZPDdF250dFM5kHDYva43MunfO2PaB3Ra+gTlhqsX/PDSR3pXfLk0upvbrT71r4xJ
	 7mlluydpL57iSk19pRu/e6gsimM9g//IriDWdNknhA+C9rjdUATWkHqIXZIy5JzoYQ
	 ilE72cQW6M0nrAGhwPyo1yQxy0RrkOjkPZe9OEGeClSTrJR8V3UzYgXIPS43dr6rxM
	 9abLTx7EyeF8t1ASnod6kegMk+Kbx9IECrtm6/u4a/s6CRPUvh1O5pPAF+fmfcxJPI
	 HfFoyFldt+lDi6/ByhZSysiDvo7nvQMH8jxteWIJTjyPEMeFRxWiXH7LmQQvTosuub
	 HUGs31OcbuWjg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hpCkS5QDSz4wT1; Mon, 21 Sep 2026 16:19:44 +1000 (AEST)
Date: Mon, 21 Sep 2026 16:20:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
Message-ID: <arDMhoNNXcPi81sR@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-16-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xs+5cyipjS5taYwE"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-16-herve.codina@bootlin.com>

--Xs+5cyipjS5taYwE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:
> This v18 version will add support for
>   - Structured tags.
>     Those tags value definition will allow "old" libfdt, dtc and other
>     tools to skip unknown tags if encountered in future dtb version.
>=20
>     libfdt, dtc and other tools implementing version v18 will be able to
>     skip unknown tags available in dtbd generated with later version of
>     dtc.
>=20
>   - dt_flags header field.
>     For now this flag field is set to 0. It is a placeholder for future
>     dtb version and could be used to store some dtb related information
>     such as the kind of dtb. For instance, the future addons format will
>     use this field to clearly identify that the dtb is an addon dtb.
>=20
>   - last_comp_version_w header field.
>     This field is similar to last_comp_version but for writing.
>     It contains the lowest version of the devicetree data structure with
>     which the version used can safely perform modifications (taking into
>     account following rules related to unknown tags).
>     If this lowest version is greater than the last known supported
>     version, modification are simply forbidden and lead to a
>     FDT_ERR_BADVERSION error.
>=20
> For modification, when an unknown tag that can be skipped is involved
> and last_comp_version_w allows modifications, the following rules
> apply:

"last_comp_version_w allows modifications" is a bit hard to
understand.  What exactly is the version number against which we're
comparing that value?

>   - When a property is modified, tags related to this property are
>     removed and the dtb version is downgraded.

We need a definition of what "related to" means somewhere.

>   - When a property is removed, tags related to this property are
>     obviously removed. The dtb version is kept unchanged.
>=20
>   - When a property or a node is added, obviously no unknown tags are
>     added and the dtb version is kept unchanged.

Again, this rule doesn't make sense to me at the same time as the
property modification rule.

>   - When a node is removed, tags related to this node are obviously
>     removed. The dtb version is kept unchanged.
>=20
>   - Adding, removing or modifying a property is not considered as a node
>     modification and so, those operations have no impacts on unknown
>     tags related to the node. Those node related tags are kept
>     unchanged.
>=20
>   - The only modification considered as a node modification is setting
>     its name. We consider that this operation has no impact on tags
>     related to the node. Here also, those node related tags and the dtb
>     version are kept unchanged.
>=20
>   - Global (dtb related) unknown tags are kept unchanged regardless the
>     modification done.
>=20
> In all cases, if unknown tags are not involved in a modification, the
> dtb version is not downgraded when the modification is made.
>=20
> It is worth noting that with this v18 version, the dtb version is not
> downgraded for any modification but only when unknown tags are removed
> due to a property modification. In v17 or older version any modification
> led to a dtb version downgrade.

I don't think removing that behaviour is safe.  Even if the rules
above make sense specifically for the metadata tags (which I'm not yet
convinced of), that's not sufficient.  If nothing else, future
versions could add extra header fields.  If we modify the tree, those
header fields could be stale, or even removed.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  dtc.h                                         |  2 +-
>  fdtdump.c                                     |  8 ++-
>  flattree.c                                    | 37 ++++++++++---
>  libfdt/fdt.h                                  |  5 ++
>  libfdt/fdt_rw.c                               | 20 +++++--
>  libfdt/fdt_sw.c                               |  3 ++
>  libfdt/libfdt.h                               |  7 ++-
>  pylibfdt/libfdt.i                             | 18 +++++++
>  tests/Makefile.tests                          |  2 +-
>  tests/dtflags_default.dtb.expect              |  1 +
>  tests/dtflags_default.dts                     | 10 ++++
>  tests/meson.build                             |  1 +
>  tests/pylibfdt_tests.py                       | 10 ++--
>  tests/run_tests.sh                            | 42 ++++++++++-----
>  tests/testutils.c                             |  2 +-
>  tests/treegen.c                               | 53 +++++++++++++++++--
>  ...own_tags_can_skip.fdtput.test.dtb.0.expect |  1 +
>  ...own_tags_can_skip.fdtput.test.dtb.1.expect |  3 +-
>  ...own_tags_can_skip.fdtput.test.dtb.2.expect |  3 +-
>  ...own_tags_can_skip.fdtput.test.dtb.3.expect |  3 +-
>  ...own_tags_can_skip.fdtput.test.dtb.4.expect |  3 +-
>  ...own_tags_can_skip.fdtput.test.dtb.5.expect |  3 +-
>  ...own_tags_can_skip.fdtput.test.dtb.6.expect |  3 +-
>  ...nknown_tags_can_skip.wip.test.dtb.0.expect |  1 +
>  ...nknown_tags_can_skip.wip.test.dtb.1.expect |  3 +-
>  ...nknown_tags_can_skip.wip.test.dtb.2.expect |  1 +
>  ...nknown_tags_can_skip.wip.test.dtb.3.expect |  1 +
>  27 files changed, 202 insertions(+), 44 deletions(-)
>  create mode 100644 tests/dtflags_default.dtb.expect
>  create mode 100644 tests/dtflags_default.dts
>=20
> diff --git a/dtc.h b/dtc.h
> index 473552eb..f0c2cde6 100644
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
> index 7a8b2784..5994e1d7 100644
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
> @@ -86,6 +86,12 @@ static void dump_blob(void *blob, bool debug, int dump=
_unknown)
>  	if (version >=3D 17)
>  		printf("// size_dt_struct:\t0x%"PRIx32"\n",
>  		       fdt32_to_cpu(bph->size_dt_struct));
> +	if (version >=3D 18) {
> +		printf("// dt_flags:\t\t0x%"PRIx32"\n",
> +		       fdt32_to_cpu(bph->dt_flags));
> +		printf("// last_comp_version_w:\t%"PRIu32"\n",
> +		       fdt32_to_cpu(bph->last_comp_version_w));
> +	}
>  	printf("\n");
> =20
>  	for (i =3D 0; ; i++) {
> diff --git a/flattree.c b/flattree.c
> index 88dbfa7e..ff57fc5d 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -13,23 +13,29 @@
>  #define FTF_STRTABSIZE	0x10
>  #define FTF_STRUCTSIZE	0x20
>  #define FTF_NOPS	0x40
> +#define FTF_DTFLAGS	0x80
> +#define FTF_LCVERSW	0x100
>  static struct version_info {
>  	int version;
>  	int last_comp_version;
> +	int last_comp_version_w;
>  	int hdr_size;
>  	int flags;
>  } version_table[] =3D {
> -	{1, 1, FDT_V1_SIZE,
> +	{1, 1, 0, FDT_V1_SIZE,
>  	 FTF_FULLPATH|FTF_VARALIGN|FTF_NAMEPROPS},
> -	{2, 1, FDT_V2_SIZE,
> +	{2, 1, 0, FDT_V2_SIZE,
>  	 FTF_FULLPATH|FTF_VARALIGN|FTF_NAMEPROPS|FTF_BOOTCPUID},
> -	{3, 1, FDT_V3_SIZE,
> +	{3, 1, 0, FDT_V3_SIZE,
>  	 FTF_FULLPATH|FTF_VARALIGN|FTF_NAMEPROPS|FTF_BOOTCPUID|FTF_STRTABSIZE},
> -	{16, 16, FDT_V3_SIZE,
> +	{16, 16, 0, FDT_V3_SIZE,
>  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_NOPS},
> -	{17, 16, FDT_V17_SIZE,
> +	{17, 16, 0, FDT_V17_SIZE,
>  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
> +	{18, 16, 17, FDT_V18_SIZE,
> +	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
> +	 FTF_LCVERSW},
>  };
> =20
>  struct emitter {
> @@ -314,7 +320,7 @@ static struct data flatten_reserve_list(struct reserv=
e_info *reservelist,
>  static void make_fdt_header(struct fdt_header *fdt,
>  			    struct version_info *vi,
>  			    int reservesize, int dtsize, int strsize,
> -			    int boot_cpuid_phys)
> +			    int boot_cpuid_phys, uint32_t dt_flags)
>  {
>  	int reserve_off;
> =20
> @@ -341,6 +347,10 @@ static void make_fdt_header(struct fdt_header *fdt,
>  		fdt->size_dt_strings =3D cpu_to_fdt32(strsize);
>  	if (vi->flags & FTF_STRUCTSIZE)
>  		fdt->size_dt_struct =3D cpu_to_fdt32(dtsize);
> +	if (vi->flags & FTF_DTFLAGS)
> +		fdt->dt_flags =3D cpu_to_fdt32(dt_flags);
> +	if (vi->flags & FTF_LCVERSW)
> +		fdt->last_comp_version_w =3D cpu_to_fdt32(vi->last_comp_version_w);
>  }
> =20
>  void dt_to_blob(FILE *f, struct dt_info *dti, int version)
> @@ -368,7 +378,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int ver=
sion)
> =20
>  	/* Make header */
>  	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
> -			dti->boot_cpuid_phys);
> +			dti->boot_cpuid_phys, 0);
> =20
>  	/*
>  	 * If the user asked for more space than is used, adjust the totalsize.
> @@ -499,6 +509,16 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int ver=
sion)
>  			symprefix, symprefix);
>  	}
> =20
> +	if (vi->flags & FTF_DTFLAGS) {
> +		fprintf(f, "\t/* dt_flags */\n");
> +		asm_emit_cell(f, 0);
> +	}
> +
> +	if (vi->flags & FTF_LCVERSW) {
> +		fprintf(f, "\t/* last_comp_version_w */\n");
> +		asm_emit_cell(f, vi->last_comp_version_w);
> +	}
> +
>  	/*
>  	 * Reserve map entries.
>  	 * Align the reserve map to a doubleword boundary.
> @@ -955,6 +975,9 @@ struct dt_info *dt_from_blob(const char *fname)
>  		flags |=3D FTF_NOPS;
>  	}
> =20
> +	if (version >=3D 18)
> +		flags |=3D FTF_DTFLAGS | FTF_LCVERSW;
> +
>  	inbuf_init(&memresvbuf,
>  		   blob + off_mem_rsvmap, blob + totalsize);
>  	inbuf_init(&dtbuf, blob + off_dt, blob + totalsize);
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index f41a355f..a43b85c1 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -26,6 +26,10 @@ struct fdt_header {
> =20
>  	/* version 17 fields below */
>  	fdt32_t size_dt_struct;		 /* size of the structure block */
> +
> +	/* version 18 fields below */
> +	fdt32_t dt_flags;		/* Ored value of FDT_FLAG_XXXX */
> +	fdt32_t last_comp_version_w;	/* last compatible version for writing */
>  };
> =20
>  struct fdt_reserve_entry {
> @@ -85,5 +89,6 @@ struct fdt_property {
>  #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
>  #define FDT_V16_SIZE	FDT_V3_SIZE
>  #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
> +#define FDT_V18_SIZE	(FDT_V17_SIZE + 2 * sizeof(fdt32_t))
> =20
>  #endif /* FDT_H */
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 87776609..005efde8 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -34,13 +34,17 @@ static int fdt_rw_probe_(void *fdt)
>  		return 0;
>  	FDT_RO_PROBE(fdt);
> =20
> -	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
> -		return -FDT_ERR_BADVERSION;
> +	if (!can_assume(LATEST)) {
> +		if (fdt_version(fdt) < 17)
> +			return -FDT_ERR_BADVERSION;
> +		else if (fdt_version(fdt) >=3D 18 &&
> +			 fdt_last_comp_version_w(fdt) > FDT_LAST_SUPPORTED_VERSION)
> +			return -FDT_ERR_BADVERSION;
> +	}
>  	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
>  				   fdt_size_dt_struct(fdt)))
>  		return -FDT_ERR_BADLAYOUT;
> =20
> -	fdt_downgrade_version(fdt);
>  	return 0;
>  }
> =20
> @@ -624,7 +628,11 @@ int fdt_open_into(const void *fdt, void *buf, int bu=
fsize)
>  		err =3D fdt_move(fdt, buf, bufsize);
>  		if (err)
>  			return err;
> -		fdt_set_version(buf, 17);
> +		if (can_assume(LATEST) || fdt_version(fdt) < 18) {
> +			fdt_set_version(buf, 18);
> +			fdt_set_dt_flags(buf, 0);
> +			fdt_set_last_comp_version_w(buf, 17);
> +		}
>  		fdt_set_size_dt_struct(buf, struct_size);
>  		fdt_set_totalsize(buf, bufsize);
>  		return 0;
> @@ -653,8 +661,10 @@ int fdt_open_into(const void *fdt, void *buf, int bu=
fsize)
> =20
>  	fdt_set_magic(buf, FDT_MAGIC);
>  	fdt_set_totalsize(buf, bufsize);
> -	fdt_set_version(buf, 17);
> +	fdt_set_version(buf, 18);
>  	fdt_set_last_comp_version(buf, 16);
> +	fdt_set_dt_flags(buf, 0);
> +	fdt_set_last_comp_version_w(buf, 17);
>  	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
> =20
>  	return 0;
> diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
> index 96d4cf57..caafd60a 100644
> --- a/libfdt/fdt_sw.c
> +++ b/libfdt/fdt_sw.c
> @@ -137,6 +137,9 @@ int fdt_create_with_flags(void *buf, int bufsize, uin=
t32_t flags)
>  	fdt_set_off_dt_struct(fdt, fdt_off_mem_rsvmap(fdt));
>  	fdt_set_off_dt_strings(fdt, 0);
> =20
> +	fdt_set_dt_flags(fdt, 0);
> +	fdt_set_last_comp_version_w(fdt, FDT_LAST_COMPATIBLE_VERSION_W);
> +
>  	return 0;
>  }
> =20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 82965e32..8e99e644 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -15,7 +15,8 @@ extern "C" {
> =20
>  #define FDT_FIRST_SUPPORTED_VERSION	0x02
>  #define FDT_LAST_COMPATIBLE_VERSION	0x10
> -#define FDT_LAST_SUPPORTED_VERSION	0x11
> +#define FDT_LAST_COMPATIBLE_VERSION_W	0x11
> +#define FDT_LAST_SUPPORTED_VERSION	0x12
> =20
>  /* Error codes: informative error codes */
>  #define FDT_ERR_NOTFOUND	1
> @@ -284,6 +285,8 @@ int fdt_next_subnode(const void *fdt, int offset);
>  #define fdt_boot_cpuid_phys(fdt)	(fdt_get_header(fdt, boot_cpuid_phys))
>  #define fdt_size_dt_strings(fdt)	(fdt_get_header(fdt, size_dt_strings))
>  #define fdt_size_dt_struct(fdt)		(fdt_get_header(fdt, size_dt_struct))
> +#define fdt_dt_flags(fdt)		(fdt_get_header(fdt, dt_flags))
> +#define fdt_last_comp_version_w(fdt)	(fdt_get_header(fdt, last_comp_vers=
ion_w))
> =20
>  #define fdt_set_hdr_(name) \
>  	static inline void fdt_set_##name(void *fdt, uint32_t val) \
> @@ -301,6 +304,8 @@ fdt_set_hdr_(last_comp_version)
>  fdt_set_hdr_(boot_cpuid_phys)
>  fdt_set_hdr_(size_dt_strings)
>  fdt_set_hdr_(size_dt_struct)
> +fdt_set_hdr_(dt_flags)
> +fdt_set_hdr_(last_comp_version_w)
>  #undef fdt_set_hdr_
> =20
>  /**
> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> index b41c03f4..462fe28a 100644
> --- a/pylibfdt/libfdt.i
> +++ b/pylibfdt/libfdt.i
> @@ -281,6 +281,22 @@ class FdtRo(object):
>          """
>          return fdt_size_dt_struct(self._fdt)
> =20
> +    def dt_flags(self):
> +        """Return flags from the header
> +
> +        Returns:
> +            flags value from the header
> +        """
> +        return fdt_dt_flags(self._fdt)
> +
> +    def last_comp_version_w(self):
> +        """Return the last compatible version for writing of the device =
tree
> +
> +        Returns:
> +            Last compatible version number for writing of the device tree
> +        """
> +        return fdt_last_comp_version_w(self._fdt)
> +
>      def num_mem_rsv(self, quiet=3D()):
>          """Return the number of memory reserve-map records
> =20
> @@ -1287,6 +1303,8 @@ uint32_t fdt_last_comp_version(const void *fdt);
>  uint32_t fdt_boot_cpuid_phys(const void *fdt);
>  uint32_t fdt_size_dt_strings(const void *fdt);
>  uint32_t fdt_size_dt_struct(const void *fdt);
> +uint32_t fdt_dt_flags(const void *fdt);
> +uint32_t fdt_last_comp_version_w(const void *fdt);
> =20
>  int fdt_property_string(void *fdt, const char *name, const char *val);
>  int fdt_property_cell(void *fdt, const char *name, uint32_t val);
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index a71c4cbf..857e4899 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -46,7 +46,7 @@ TESTS_TREES_L =3D test_tree1.dtb bad_node_char.dtb bad_=
node_format.dtb \
>  	bad_prop_char.dtb ovf_size_strings.dtb truncated_property.dtb \
>  	truncated_string.dtb truncated_memrsv.dtb unterminated_memrsv.dtb \
>  	two_roots.dtb named_root.dtb unknown_tags_can_skip.dtb \
> -	unknown_tags_no_skip.dtb
> +	unknown_tags_no_skip.dtb last_comp_version_w_future.dtb
>  TESTS_TREES =3D $(TESTS_TREES_L:%=3D$(TESTS_PREFIX)%)
> =20
>  TESTS_TARGETS =3D $(TESTS) $(TESTS_TREES)
> diff --git a/tests/dtflags_default.dtb.expect b/tests/dtflags_default.dtb=
=2Eexpect
> new file mode 100644
> index 00000000..cefed4d6
> --- /dev/null
> +++ b/tests/dtflags_default.dtb.expect
> @@ -0,0 +1 @@
> +// dt_flags:		0x0
> diff --git a/tests/dtflags_default.dts b/tests/dtflags_default.dts
> new file mode 100644
> index 00000000..3ef867e8
> --- /dev/null
> +++ b/tests/dtflags_default.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2026 Bootlin
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	prop =3D <1>;
> +};
> diff --git a/tests/meson.build b/tests/meson.build
> index e7a88936..fcc73982 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -19,6 +19,7 @@ treegen_dtb =3D custom_target(
>      'named_root.dtb',
>      'unknown_tags_can_skip.dtb',
>      'unknown_tags_no_skip.dtb',
> +    'last_comp_version_w_future.dtb',
>    ]
>  )
> =20
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index 0e166075..c3aaf00f 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -274,14 +274,16 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          """Test that we can access the header values"""
>          self.assertEqual(self.fdt.magic(), 0xd00dfeed)
>          self.assertEqual(self.fdt.totalsize(), len(self.fdt._fdt))
> -        self.assertEqual(self.fdt.off_dt_struct(), 88)
> -        self.assertEqual(self.fdt.off_dt_strings(), 652)
> -        self.assertEqual(self.fdt.off_mem_rsvmap(), 40)
> -        self.assertEqual(self.fdt.version(), 17)
> +        self.assertEqual(self.fdt.off_dt_struct(), 96)
> +        self.assertEqual(self.fdt.off_dt_strings(), 660)
> +        self.assertEqual(self.fdt.off_mem_rsvmap(), 48)
> +        self.assertEqual(self.fdt.version(), 18)
>          self.assertEqual(self.fdt.last_comp_version(), 16)
>          self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
>          self.assertEqual(self.fdt.size_dt_strings(), 105)
>          self.assertEqual(self.fdt.size_dt_struct(), 564)
> +        self.assertEqual(self.fdt.dt_flags(), 0)
> +        self.assertEqual(self.fdt.last_comp_version_w(), 17)
> =20
>      def testPack(self):
>          """Test that we can pack the tree after deleting something"""
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 980ed6a0..42b74e05 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -578,7 +578,8 @@ libfdt_tests () {
>      run_test dtbs_equal_ordered cell-overflow.test.dtb cell-overflow-res=
ults.test.dtb
> =20
>      # check full tests
> -    for good in test_tree1.dtb unknown_tags_can_skip.dtb; do
> +    for good in test_tree1.dtb unknown_tags_can_skip.dtb \
> +		last_comp_version_w_future.dtb; do
>  	run_test check_full $good
>      done
>      for bad in truncated_property.dtb truncated_string.dtb \
> @@ -592,27 +593,27 @@ libfdt_tests () {
>      cp unknown_tags_can_skip.dtb $dtb
>      base_run_test wrap_fdtdump $dtb $dtb.0.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.0.out
>      base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
> =20
>      run_test wip_func $dtb set_prop / prop-str 0 "vwxy"
>      base_run_test wrap_fdtdump $dtb $dtb.1.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.1.out
>      base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
> =20
>      cp unknown_tags_can_skip.dtb $dtb
>      run_test wip_func $dtb nop_prop /subnode2 prop-int1
>      base_run_test wrap_fdtdump $dtb $dtb.2.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.2.out
>      base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
> =20
>      cp unknown_tags_can_skip.dtb $dtb
>      run_test wip_func $dtb nop_node /subnode2/subsubnode
>      base_run_test wrap_fdtdump $dtb $dtb.3.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.3.out
>      base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
>  }
> =20
> @@ -917,6 +918,14 @@ dtc_tests () {
>      run_dtc_test -I dtb -O dts -o unknown_tags_can_skip.dtb.dts unknown_=
tags_can_skip.dtb
>      base_run_test check_diff unknown_tags_can_skip.dtb.dts "$SRCDIR/unkn=
own_tags_can_skip.dtb.dts.expect"
>      run_wrap_error_test $DTC -I dtb -O dts -o unknown_tags_no_skip.dtb.d=
ts unknown_tags_no_skip.dtb
> +
> +    # Tests dt_flags header field (default value)
> +    run_dtc_test -I dts -O dtb -o dtflags_default.dtb "$SRCDIR/dtflags_d=
efault.dts"
> +    base_run_test wrap_fdtdump dtflags_default.dtb dtflags_default.dtb.o=
ut
> +    # Keep only lines containing 'dt_flags'
> +    sed -i '/dt_flags/!d' dtflags_default.dtb.out
> +    base_run_test check_diff dtflags_default.dtb.out "$SRCDIR/dtflags_de=
fault.dtb.expect"
> +    run_test check_full dtflags_default.dtb
>  }
> =20
>  cmp_tests () {
> @@ -1074,32 +1083,41 @@ fdtput_tests () {
> =20
>      # TODO: Add tests for verbose mode?
> =20
> +    # Not allowed to modify a dtb due to last_comp_version_w
> +    # FDT_ERR_BADVERSION error code is returned
> +    dtb=3Dlast_comp_version_w_future.fdtput.test.dtb
> +    cp last_comp_version_w_future.dtb $dtb
> +    run_wrap_error_test $DTPUT $dtb /subnode prop-int -tu 123
> +    run_wrap_error_test $DTPUT $dtb -d /subnode prop-int
> +    run_wrap_error_test $DTPUT $dtb -c /new-node
> +    run_wrap_error_test $DTPUT $dtb -r /subnode
> +
>      # Modify a dtb containing some "unknown" tags that can be skipped
>      dtb=3Dunknown_tags_can_skip.fdtput.test.dtb
>      cp unknown_tags_can_skip.dtb $dtb
>      base_run_test wrap_fdtdump $dtb $dtb.0.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.0.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.0.out
>      base_run_test check_diff $dtb.0.out "$SRCDIR/$dtb.0.expect"
> =20
>      run_fdtput_test "vwxyz" $dtb / prop-str -ts "vwxyz"
>      base_run_test wrap_fdtdump $dtb $dtb.1.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.1.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.1.out
>      base_run_test check_diff $dtb.1.out "$SRCDIR/$dtb.1.expect"
> =20
>      cp unknown_tags_can_skip.dtb $dtb
>      run_wrap_test $DTPUT $dtb -c /tst-fdtput
>      base_run_test wrap_fdtdump $dtb $dtb.2.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.2.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.2.out
>      base_run_test check_diff $dtb.2.out "$SRCDIR/$dtb.2.expect"
>      run_wrap_test $DTPUT $dtb -c /tst-fdtput/n1 /tst-fdtput/n2 /tst-fdtp=
ut/n3
>      run_wrap_test $DTPUT $dtb -r /tst-fdtput/n1 /tst-fdtput/n3
>      run_fdtget_test "n2" $dtb -l  /tst-fdtput
>      base_run_test wrap_fdtdump $dtb $dtb.3.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.3.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.3.out
>      base_run_test check_diff $dtb.3.out "$SRCDIR/$dtb.3.expect"
> =20
>      cp unknown_tags_can_skip.dtb $dtb
> @@ -1107,21 +1125,21 @@ fdtput_tests () {
>      run_fdtget_test "prop-int" $dtb -p  /
>      base_run_test wrap_fdtdump $dtb $dtb.4.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.4.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.4.out
>      base_run_test check_diff $dtb.4.out "$SRCDIR/$dtb.4.expect"
> =20
>      cp unknown_tags_can_skip.dtb $dtb
>      run_wrap_test $DTPUT $dtb /subnode2 prop-tst-fdtput -ts "Test fdtput"
>      base_run_test wrap_fdtdump $dtb $dtb.5.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.5.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.5.out
>      base_run_test check_diff $dtb.5.out "$SRCDIR/$dtb.5.expect"
> =20
>      cp unknown_tags_can_skip.dtb $dtb
>      run_wrap_test $DTPUT $dtb -r /subnode2/subsubnode
>      base_run_test wrap_fdtdump $dtb $dtb.6.out
>      # Remove unneeded header fields (keep those related to versions)
> -    sed -i '/^\/.*\(magic\|off\|size\|cpu\)/d' $dtb.6.out
> +    sed -i '/^\/.*\(magic\|off\|size\|cpu\|flags\)/d' $dtb.6.out
>      base_run_test check_diff $dtb.6.out "$SRCDIR/$dtb.6.expect"
>  }
> =20
> diff --git a/tests/testutils.c b/tests/testutils.c
> index d35a1978..7df80f7c 100644
> --- a/tests/testutils.c
> +++ b/tests/testutils.c
> @@ -354,7 +354,7 @@ void *open_blob_rw(const void *blob)
>  {
>  	int err;
>  	void *buf;
> -	int newsize =3D fdt_totalsize(blob) + 8;
> +	int newsize =3D fdt_totalsize(blob) + 8 + 2 * 4;
> =20
>  	buf =3D xmalloc(newsize);
>  	err =3D fdt_open_into(blob, buf, newsize);
> diff --git a/tests/treegen.c b/tests/treegen.c
> index f07c8963..b0730ef6 100644
> --- a/tests/treegen.c
> +++ b/tests/treegen.c
> @@ -106,7 +106,8 @@ static void fill_prop_name(struct buf *b, size_t strs=
, size_t prop, size_t strof
>  /* FDT structure helpers */
> =20
>  static size_t emit_fdt_header_vers(struct buf *b, uint32_t version,
> -				   uint32_t last_comp_version)
> +				   uint32_t last_comp_version,
> +				   uint32_t last_comp_version_w)
>  {
>  	size_t off =3D emit_u32(b, FDT_MAGIC);
> =20
> @@ -119,12 +120,14 @@ static size_t emit_fdt_header_vers(struct buf *b, u=
int32_t version,
>  	emit_u32(b, 0);	/* boot_cpuid_phys */
>  	emit_u32(b, 0);	/* size_dt_strings */
>  	emit_u32(b, 0);	/* size_dt_struct */
> +	emit_u32(b, 0);	/* dt_flags */
> +	emit_u32(b, last_comp_version_w);	/* last_comp_version_w */
>  	return off;
>  }
> =20
>  static size_t emit_fdt_header(struct buf *b)
>  {
> -	return emit_fdt_header_vers(b, 0x11, 0x10);
> +	return emit_fdt_header_vers(b, 0x12, 0x10, 0x11);
>  }
> =20
>  static void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
> @@ -720,7 +723,7 @@ static struct buf make_unknown_tags_can_skip(void)
>  	size_t p_sn2_int1, p_sn2_int2;
>  	size_t p_sn2ssn_bool;
> =20
> -	hdr =3D emit_fdt_header_vers(&b, 0xffffffff, 0x10);
> +	hdr =3D emit_fdt_header_vers(&b, 0xffffffff, 0x10, 0x11);
>  	emit_align(&b, 8);
> =20
>  	emit_rsvmap_empty(&b, hdr);
> @@ -833,7 +836,7 @@ static struct buf make_unknown_tags_no_skip(void)
>  	size_t hdr;
>  	size_t p_prop_u64;
> =20
> -	hdr =3D emit_fdt_header_vers(&b, 0xffffffff, 0x10);
> +	hdr =3D emit_fdt_header_vers(&b, 0xffffffff, 0x10, 0x11);
>  	emit_align(&b, 8);
> =20
>  	emit_rsvmap_empty(&b, hdr);
> @@ -867,6 +870,47 @@ static struct buf make_unknown_tags_no_skip(void)
>  	return b;
>  }
> =20
> +/* Tree with "unknown" tags that can be skipped
> + * Use a really future dtb version to check version downgrade on
> + * modification.
> + */
> +static struct buf make_last_comp_version_w_future(void)
> +{
> +	struct buf b =3D buf_init();
> +	size_t hdr;
> +	size_t p_int;
> +
> +	hdr =3D emit_fdt_header_vers(&b, 0xffffffff, 0x10, 0xffffffff);
> +	emit_align(&b, 8);
> +
> +	emit_rsvmap_empty(&b, hdr);
> +
> +	{
> +		size_t ss =3D start_block(&b);
> +
> +		emit_begin_node(&b, "");
> +			p_int =3D emit_prop_u64(&b, 0, 0x100000002);
> +		emit_end_node(&b);
> +		emit_fdt_end(&b);
> +
> +		finish_struct_block(&b, hdr, ss);
> +	}
> +
> +	{
> +		size_t strs =3D start_block(&b);
> +		size_t s;
> +
> +		s =3D emit_string(&b, "prop-int");
> +		fill_prop_name(&b, strs, p_int, s);
> +
> +		finish_strings_block(&b, hdr, strs);
> +	}
> +
> +	finish_totalsize(&b, hdr);
> +
> +	return b;
> +}
> +
>  /* Tree table and main */
> =20
>  static struct {
> @@ -884,6 +928,7 @@ static struct {
>  	TREE(named_root),
>  	TREE(unknown_tags_can_skip),
>  	TREE(unknown_tags_no_skip),
> +	TREE(last_comp_version_w_future),
>  };
> =20
>  int main(int argc, char *argv[])
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.0.expect
> index 75883593..42167271 100644
> --- a/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.0.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
>  // version:		4294967295
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> index b4d3ae29..6d750f88 100644
> --- a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
> -// version:		17
> +// version:		18
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.2.expect
> index a196bed3..83bbfd1f 100644
> --- a/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.2.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
> -// version:		17
> +// version:		4294967295
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.3.expect
> index 52faa1dd..77b00d1d 100644
> --- a/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.3.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
> -// version:		17
> +// version:		4294967295
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.4.expect
> index 1ddc694b..93c7b750 100644
> --- a/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.4.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
> -// version:		17
> +// version:		4294967295
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.5.expect
> index f955ac1c..7ee385aa 100644
> --- a/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.5.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
> -// version:		17
> +// version:		4294967295
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.6.expect
> index 59247478..777443f3 100644
> --- a/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.6.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
> -// version:		17
> +// version:		4294967295
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.0.expect b/tests/un=
known_tags_can_skip.wip.test.dtb.0.expect
> index 75883593..42167271 100644
> --- a/tests/unknown_tags_can_skip.wip.test.dtb.0.expect
> +++ b/tests/unknown_tags_can_skip.wip.test.dtb.0.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
>  // version:		4294967295
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.1.expect b/tests/un=
known_tags_can_skip.wip.test.dtb.1.expect
> index 2a0dd4a0..afd8a4af 100644
> --- a/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
> +++ b/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
> -// version:		17
> +// version:		18
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.2.expect b/tests/un=
known_tags_can_skip.wip.test.dtb.2.expect
> index bc08885b..53403228 100644
> --- a/tests/unknown_tags_can_skip.wip.test.dtb.2.expect
> +++ b/tests/unknown_tags_can_skip.wip.test.dtb.2.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
>  // version:		4294967295
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.3.expect b/tests/un=
known_tags_can_skip.wip.test.dtb.3.expect
> index aa6e9394..89fde625 100644
> --- a/tests/unknown_tags_can_skip.wip.test.dtb.3.expect
> +++ b/tests/unknown_tags_can_skip.wip.test.dtb.3.expect
> @@ -1,6 +1,7 @@
>  /dts-v1/;
>  // version:		4294967295
>  // last_comp_version:	16
> +// last_comp_version_w:	17
> =20
>  // Unknown tag ignored: 0xd0000000, data len 4 00000001
>  / {
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Xs+5cyipjS5taYwE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqwzIYACgkQzQJF27ox
2GdOKA/+OQSagOr0SrILM8+50tJlQa+p44R7VtP0ez0ytzgI6ltHKex68WPpgVHu
IRY4CMU9/PF8Mdjxx29t9iOjcA1irDcmfeh+a+PAcyC6SVLyky0Gi9WLT+WAWEyp
HVB7pVCDB4A1XP3CY09+1E0WjXaGduz9rq1PaMXtK3iCRr6nN1f149OsIPLlUW7d
PLcMhrkfx5AU/taDMQzKFbzVTHMfU2VuOX5YgHq+avNDaAF77WdPvrX2OmKczXts
QQnwz3EEsJimIXTOtoNKizzNpjs28SATWekSYLaSopb/sU73mqni2iDphEkvtw63
ZRIwvpXoTM25iQXVGTHGWhTiuK3Bwzm3hq6h1Znt+VKLUAXm1IdyCFwokMH5XQ3L
p74jAN28UpFK+r++wOwLSwrq6yW6cFNMf4lym/mEoIJ0ge9f8Jq0tXDws5n+M0yB
aP3VPXtFzx4bSqdIgdPf+kNTTIO9xD2a2Q6xxmBIXyp3QrXtl/OlhV2GZm3oPgKi
EoD/+rIBFznuTjv3ZcWFVWadSnGGEkKHKoqsNWLLBZMS9yMtO+Id2842cv34s21F
YSX587OD+tfDANov8J0C/u3yDe/M2EG5g5bSBOO2bJKdsf/gz6ExI8SxbOEKuHvB
LjRRew+tgS7NFmwRVGXNzv3NNkSp0j7gxTb5Th1LWr+2GysfSW0=
=/rcD
-----END PGP SIGNATURE-----

--Xs+5cyipjS5taYwE--
