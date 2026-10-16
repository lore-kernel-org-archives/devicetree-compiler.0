Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784A3BED06;
	Fri, 16 Oct 2026 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139408; cv=none; b=oNTdWhzfbilWgBEYkxJgXanYs0CHR7uYrl4s2MTgM6rlVnsOy0qhsfctMdXm6UviYb2DazhaKBDLb2XKKc6w1nrJ6KNWQYan+IzgbyjhCPGTVP1b5xR739hA3cxAtO0LAEFihwHS2mybsj12IwTcp7vrL9/uxQXMsrlje7YngWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139408; c=relaxed/simple;
	bh=VByZRhmKIWkoPuTIbOhEJ9bm0KuqgWa5l/9iBDaFsUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h18PH3gCPFxFUZEUGOZ2cUoxWi7rw1pCw/yI1dKKz8mQI0rT2mL8xmbNjBFPT2BUpI85WzcoEZGxOd1d6Oo3XnUI12SjoWrvFqBZE6ZRzlYTldIDZNyT/flIBNgQVSw7kOovJtzEVh4dQvWYUfdd3HSLcgdGQt3zOjfc7cOLx7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=pwIll4Hf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="pwIll4Hf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792139395;
	bh=dlDkM2uPQbaUlGr03WjNXbMMR5iSKYaMFcoSYB8lX6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwIll4HfII1NxvtKdWCPDzV9qa2+YWbi6VQtHByd34sOn0sZChODlFMhnNz0K7Baz
	 tergk/mEGg/HkqA8ovlZuSL844nXVjKIAKqin3EDGgk78cBl3e1zk3331p2yph0nXB
	 JyIROcazZysdIqajWufNJ98dibMc4rLGgA1O5tnEycHGFOalE+n8ZQfPr14Iaqgo9n
	 8bm/SRSx0tvyZBfVlI6Iag254E6pauGLN2tCwmUlBsc4MDvhnCnfCWJa0gEho7tf1r
	 KXrJBBKlaY3U/G+MZD2VFsgj8JSnVVt7NG3eUqee3hkA8nPHPV2gjWTOvT4bV+Sc9G
	 dv5RrSbjlkjmQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j5dR739Jkz4wDh; Fri, 16 Oct 2026 19:29:55 +1100 (AEDT)
Date: Fri, 16 Oct 2026 19:29:50 +1100
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 02/74] Introduce v20 dtb version
Message-ID: <atHgbyhXeck9z6L6@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QlmFhJ6Pdyfe62RR"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-3-herve.codina@bootlin.com>

--QlmFhJ6Pdyfe62RR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:31AM +0200, Herve Codina wrote:
> This v20 version will add support for
>  - metadata in device-tree blobs in order to have a better handling of
>    phandles and unresolved references.
>  - Addon device-tree blob (successor of device-tree overlay)
>  - Import and export symbols feature
>  - multiple trees in an addon device-tree blob (i.e. root device tree
>    and orphan node tree)

Where to put the actual version switchover is always tricky, because
unless all the implementation is small enough to go into a single
patch, it will leave a number of revisions that advertise the new
format without actually implementing it.

There's kind of no avoiding that, but it can be mitigated.  This patch
should at least be moved as late as it can in the series - I can see
there are several preliminary patches that don't need the version
changed.  The idea is to keep the "critical section" of commits which
only partially implement the new version as small we can.

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc.h                                               |  2 +-
>  fdtdump.c                                           |  2 +-
>  flattree.c                                          |  3 +++
>  libfdt/fdt.h                                        |  1 +
>  libfdt/fdt_rw.c                                     | 13 +++++++------
>  libfdt/libfdt.h                                     |  6 +++---
>  tests/pylibfdt_tests.py                             |  6 +++---
>  tests/treegen.c                                     |  2 +-
>  .../unknown_tags_can_skip.fdtput.test.dtb.1.expect  |  2 +-
>  tests/unknown_tags_can_skip.wip.test.dtb.1.expect   |  2 +-
>  10 files changed, 22 insertions(+), 17 deletions(-)
>=20
> diff --git a/dtc.h b/dtc.h
> index f0c2cde6..ef3f2682 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -29,7 +29,7 @@
>  #define debug(...)
>  #endif
> =20
> -#define DEFAULT_FDT_VERSION	18
> +#define DEFAULT_FDT_VERSION	20
> =20
>  /*
>   * Command line options
> diff --git a/fdtdump.c b/fdtdump.c
> index 5994e1d7..20854752 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -18,7 +18,7 @@
>  #include "util.h"
> =20
>  #define FDT_MAGIC_SIZE	4
> -#define MAX_VERSION 18U
> +#define MAX_VERSION 20U
> =20
>  #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
>  #define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
> diff --git a/flattree.c b/flattree.c
> index ff57fc5d..dd451f0c 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -36,6 +36,9 @@ static struct version_info {
>  	{18, 16, 17, FDT_V18_SIZE,
>  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
>  	 FTF_LCVERSW},
> +	{20, 18, 18, FDT_V20_SIZE,
> +	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
> +	 FTF_LCVERSW},
>  };
> =20
>  struct emitter {
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index a43b85c1..7c59fed2 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -90,5 +90,6 @@ struct fdt_property {
>  #define FDT_V16_SIZE	FDT_V3_SIZE
>  #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
>  #define FDT_V18_SIZE	(FDT_V17_SIZE + 2 * sizeof(fdt32_t))
> +#define FDT_V20_SIZE	FDT_V18_SIZE
> =20
>  #endif /* FDT_H */
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 005efde8..1c6ce0a3 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -628,10 +628,11 @@ int fdt_open_into(const void *fdt, void *buf, int b=
ufsize)
>  		err =3D fdt_move(fdt, buf, bufsize);
>  		if (err)
>  			return err;
> -		if (can_assume(LATEST) || fdt_version(fdt) < 18) {
> -			fdt_set_version(buf, 18);
> +
> +		if (can_assume(LATEST) || fdt_version(fdt) < 20) {
> +			fdt_set_version(buf, 20);
>  			fdt_set_dt_flags(buf, 0);
> -			fdt_set_last_comp_version_w(buf, 17);
> +			fdt_set_last_comp_version_w(buf, 18);
>  		}
>  		fdt_set_size_dt_struct(buf, struct_size);
>  		fdt_set_totalsize(buf, bufsize);
> @@ -661,10 +662,10 @@ int fdt_open_into(const void *fdt, void *buf, int b=
ufsize)
> =20
>  	fdt_set_magic(buf, FDT_MAGIC);
>  	fdt_set_totalsize(buf, bufsize);
> -	fdt_set_version(buf, 18);
> -	fdt_set_last_comp_version(buf, 16);
> +	fdt_set_version(buf, 20);
> +	fdt_set_last_comp_version(buf, 18);
>  	fdt_set_dt_flags(buf, 0);
> -	fdt_set_last_comp_version_w(buf, 17);
> +	fdt_set_last_comp_version_w(buf, 18);
>  	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
> =20
>  	return 0;
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 8e99e644..5e1e0d06 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -14,9 +14,9 @@ extern "C" {
>  #endif
> =20
>  #define FDT_FIRST_SUPPORTED_VERSION	0x02
> -#define FDT_LAST_COMPATIBLE_VERSION	0x10
> -#define FDT_LAST_COMPATIBLE_VERSION_W	0x11
> -#define FDT_LAST_SUPPORTED_VERSION	0x12
> +#define FDT_LAST_COMPATIBLE_VERSION	0x12
> +#define FDT_LAST_COMPATIBLE_VERSION_W	0x12
> +#define FDT_LAST_SUPPORTED_VERSION	0x14
> =20
>  /* Error codes: informative error codes */
>  #define FDT_ERR_NOTFOUND	1
> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> index c3aaf00f..bae52406 100644
> --- a/tests/pylibfdt_tests.py
> +++ b/tests/pylibfdt_tests.py
> @@ -277,13 +277,13 @@ class PyLibfdtBasicTests(unittest.TestCase):
>          self.assertEqual(self.fdt.off_dt_struct(), 96)
>          self.assertEqual(self.fdt.off_dt_strings(), 660)
>          self.assertEqual(self.fdt.off_mem_rsvmap(), 48)
> -        self.assertEqual(self.fdt.version(), 18)
> -        self.assertEqual(self.fdt.last_comp_version(), 16)
> +        self.assertEqual(self.fdt.version(), 20)
> +        self.assertEqual(self.fdt.last_comp_version(), 18)
>          self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
>          self.assertEqual(self.fdt.size_dt_strings(), 105)
>          self.assertEqual(self.fdt.size_dt_struct(), 564)
>          self.assertEqual(self.fdt.dt_flags(), 0)
> -        self.assertEqual(self.fdt.last_comp_version_w(), 17)
> +        self.assertEqual(self.fdt.last_comp_version_w(), 18)
> =20
>      def testPack(self):
>          """Test that we can pack the tree after deleting something"""
> diff --git a/tests/treegen.c b/tests/treegen.c
> index b0730ef6..36cb5508 100644
> --- a/tests/treegen.c
> +++ b/tests/treegen.c
> @@ -127,7 +127,7 @@ static size_t emit_fdt_header_vers(struct buf *b, uin=
t32_t version,
> =20
>  static size_t emit_fdt_header(struct buf *b)
>  {
> -	return emit_fdt_header_vers(b, 0x12, 0x10, 0x11);
> +	return emit_fdt_header_vers(b, 0x14, 0x12, 0x12);
>  }
> =20
>  static void finish_rsvmap(struct buf *b, size_t hdr, size_t rsvmap)
> diff --git a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect b/tests=
/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> index 6d750f88..204d3d23 100644
> --- a/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> +++ b/tests/unknown_tags_can_skip.fdtput.test.dtb.1.expect
> @@ -1,5 +1,5 @@
>  /dts-v1/;
> -// version:		18
> +// version:		20
>  // last_comp_version:	16
>  // last_comp_version_w:	17
> =20
> diff --git a/tests/unknown_tags_can_skip.wip.test.dtb.1.expect b/tests/un=
known_tags_can_skip.wip.test.dtb.1.expect
> index afd8a4af..a3f9307f 100644
> --- a/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
> +++ b/tests/unknown_tags_can_skip.wip.test.dtb.1.expect
> @@ -1,5 +1,5 @@
>  /dts-v1/;
> -// version:		18
> +// version:		20
>  // last_comp_version:	16
>  // last_comp_version_w:	17
> =20
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--QlmFhJ6Pdyfe62RR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrR4G8ACgkQzQJF27ox
2GfA7xAAgKlGQB+5dda2IEg9Au14engChSmL3zANzg/jYymqi6GbGEGd3z9M9jqR
511UtdUUGWBkYqAZ8Ja3k9h4hFH0AZqS9kNFd9eGsfFTugC1WBl9glr8JY/hJZMB
dewH7RUnt3JjqlmnW570wGtee9WQL1TOQnpRK5qW3RYy8UXqYEWlbNFlxpd2pxip
R/Zl232J0EoMVVhvaDCDcSVv+KwbURidc/vI22fAcIBAlxEeje4xXJp9xoY9rwAq
N6ysOLtVT+AGq32u4tApybBvVeMwMai7xBB80COx8JtJ32aFcscrG4HUZvW2fbRP
rCXZ9hIQ1QY2bHZYry66YOlLMg8WSkIbmd2spGz3dX+hn8jO9bpqs1aDHTjbC3GT
vL8IsnvxobrFpcsf0i8fh6gdsxI9+7sYoNldELRBUPLME02b3eLMJZudB2qlaQ8+
ket8et3SPC9bpkkTiB6irw37UBJYhTbMwkA+XM9ys04qKHWylqj+ANKEqyNsLmZD
/9ddnbWzAotNt1WGpZnhNC633ry7+mKC7WQtLSKI8t949XqG00DSmN7gd1dkkMqZ
3BDgARpU8I4W16p6Z29ZtbSA15e43Z8ar6CYZBHiztEsR+R3qwSv2VCraiegfu5g
Z8vqXJu1irsfpGrTso3n7addSjx5wzzWFsonLXuXZ1szIc7FrOg=
=4ZVr
-----END PGP SIGNATURE-----

--QlmFhJ6Pdyfe62RR--
