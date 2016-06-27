From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 12/12] tests: Introduce DT overlay tests
Date: Mon, 27 Jun 2016 15:26:58 +1000
Message-ID: <20160627052658.GL4242@voom.fritz.box>
References: <20160624142757.32735-1-maxime.ripard@free-electrons.com>
 <20160624142757.32735-13-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I4VOKWutKNZEOIPu"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1467005117;
	bh=MctOXax3vM2DMBz+j8OA2RI2S52VfSkn9jLOFp8RoxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMAAMnL+/kgHXCkmF+N9UFwgQe6gf3SVsYQ2Q6YAi7uozlNLTQ04KgvzbiIONmdg2
	 I1GV/Pvk2MRttnMNVS4mDhuCsolGmqVxNYpwwvq+dz5cJdFEoSzyvVyA/jBcWUsTrn
	 m4UYeA0U2lbA/vD6OwMWMU9o2cxFysSNH501QJPo=
Content-Disposition: inline
In-Reply-To: <20160624142757.32735-13-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>


--I4VOKWutKNZEOIPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 04:27:57PM +0200, Maxime Ripard wrote:
> This adds a bunch of unit tests for the "fdt apply" command.
>=20
> They've all been run successfully in the sandbox. However, as you still
> require an out-of-tree dtc with overlay support, this is disabled by
> default.
>=20
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

These tests are geared for the u-boot tree, but for upstream
application we really need testcases that fit within dtc/libfdt as
well.  It would be good if you can adapt some or all of these tests to
work in that context.

> ---
>  Makefile                          |   1 +
>  include/test/overlay.h            |  16 +++
>  include/test/suites.h             |   1 +
>  test/Kconfig                      |   1 +
>  test/cmd_ut.c                     |   6 +
>  test/overlay/Kconfig              |  11 ++
>  test/overlay/Makefile             |  15 +++
>  test/overlay/cmd_ut_overlay.c     | 243 ++++++++++++++++++++++++++++++++=
++++++
>  test/overlay/test-fdt-base.dts    |  21 ++++
>  test/overlay/test-fdt-overlay.dts |  88 ++++++++++++++
>  10 files changed, 403 insertions(+)
>  create mode 100644 include/test/overlay.h
>  create mode 100644 test/overlay/Kconfig
>  create mode 100644 test/overlay/Makefile
>  create mode 100644 test/overlay/cmd_ut_overlay.c
>  create mode 100644 test/overlay/test-fdt-base.dts
>  create mode 100644 test/overlay/test-fdt-overlay.dts
>=20
> diff --git a/Makefile b/Makefile
> index d0e7a8a4ecc7..88353d091be8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -665,6 +665,7 @@ libs-$(CONFIG_HAS_POST) +=3D post/
>  libs-y +=3D test/
>  libs-y +=3D test/dm/
>  libs-$(CONFIG_UT_ENV) +=3D test/env/
> +libs-$(CONFIG_UT_OVERLAY) +=3D test/overlay/
> =20
>  libs-y +=3D $(if $(BOARDDIR),board/$(BOARDDIR)/)
> =20
> diff --git a/include/test/overlay.h b/include/test/overlay.h
> new file mode 100644
> index 000000000000..392f28ff8405
> --- /dev/null
> +++ b/include/test/overlay.h
> @@ -0,0 +1,16 @@
> +/*
> + * Copyright (c) 2016 NextThing Co
> + * Copyright (c) 2016 Free Electrons
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +#ifndef __TEST_OVERLAY_H__
> +#define __TEST_OVERLAY_H__
> +
> +#include <test/test.h>
> +
> +/* Declare a new environment test */
> +#define OVERLAY_TEST(_name, _flags)	UNIT_TEST(_name, _flags, overlay_tes=
t)
> +
> +#endif /* __TEST_OVERLAY_H__ */
> diff --git a/include/test/suites.h b/include/test/suites.h
> index f5790333ff8e..0e94feb07a79 100644
> --- a/include/test/suites.h
> +++ b/include/test/suites.h
> @@ -10,6 +10,7 @@
> =20
>  int do_ut_dm(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]);
>  int do_ut_env(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]);
> +int do_ut_overlay(cmd_tbl_t *cmdtp, int flag, int argc, char * const arg=
v[]);
>  int do_ut_time(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]=
);
> =20
>  #endif /* __TEST_SUITES_H__ */
> diff --git a/test/Kconfig b/test/Kconfig
> index d71c332eee27..3643761bc6ef 100644
> --- a/test/Kconfig
> +++ b/test/Kconfig
> @@ -17,3 +17,4 @@ config UT_TIME
> =20
>  source "test/dm/Kconfig"
>  source "test/env/Kconfig"
> +source "test/overlay/Kconfig"
> diff --git a/test/cmd_ut.c b/test/cmd_ut.c
> index f6e1f413db7f..14333423a178 100644
> --- a/test/cmd_ut.c
> +++ b/test/cmd_ut.c
> @@ -19,6 +19,9 @@ static cmd_tbl_t cmd_ut_sub[] =3D {
>  #if defined(CONFIG_UT_ENV)
>  	U_BOOT_CMD_MKENT(env, CONFIG_SYS_MAXARGS, 1, do_ut_env, "", ""),
>  #endif
> +#ifdef CONFIG_UT_OVERLAY
> +	U_BOOT_CMD_MKENT(overlay, CONFIG_SYS_MAXARGS, 1, do_ut_overlay, "", ""),
> +#endif
>  #ifdef CONFIG_UT_TIME
>  	U_BOOT_CMD_MKENT(time, CONFIG_SYS_MAXARGS, 1, do_ut_time, "", ""),
>  #endif
> @@ -68,6 +71,9 @@ static char ut_help_text[] =3D
>  #ifdef CONFIG_UT_ENV
>  	"ut env [test-name]\n"
>  #endif
> +#ifdef CONFIG_UT_OVERLAY
> +	"ut overlay [test-name]\n"
> +#endif
>  #ifdef CONFIG_UT_TIME
>  	"ut time - Very basic test of time functions\n"
>  #endif
> diff --git a/test/overlay/Kconfig b/test/overlay/Kconfig
> new file mode 100644
> index 000000000000..13c85428cbaa
> --- /dev/null
> +++ b/test/overlay/Kconfig
> @@ -0,0 +1,11 @@
> +config UT_OVERLAY
> +	bool "Enable Device Tree Overlays Unit Tests"
> +	depends on OF_LIBFDT_OVERLAY
> +	depends on UNIT_TEST
> +	help
> +	  This enables the 'ut overlay' command which runs a series of unit
> +	  tests on the fdt overlay code.
> +	  If all is well then all tests pass although there will be a few
> +	  messages printed along the way.
> +	  Be warned that it requires an out-of-tree dtc compiler with patches
> +	  to support the DT overlays, otherwise it will fail.
> diff --git a/test/overlay/Makefile b/test/overlay/Makefile
> new file mode 100644
> index 000000000000..907f08544619
> --- /dev/null
> +++ b/test/overlay/Makefile
> @@ -0,0 +1,15 @@
> +#
> +# Copyright (c) 2016 NextThing Co
> +# Copyright (c) 2016 Free Electrons
> +#
> +# SPDX-License-Identifier:	GPL-2.0+
> +#
> +
> +# Test files
> +obj-y +=3D cmd_ut_overlay.o
> +
> +DTC_FLAGS +=3D -@
> +
> +# DT overlays
> +obj-y +=3D test-fdt-base.dtb.o
> +obj-y +=3D test-fdt-overlay.dtb.o
> diff --git a/test/overlay/cmd_ut_overlay.c b/test/overlay/cmd_ut_overlay.c
> new file mode 100644
> index 000000000000..4a9b3398d119
> --- /dev/null
> +++ b/test/overlay/cmd_ut_overlay.c
> @@ -0,0 +1,243 @@
> +/*
> + * Copyright (c) 2016 NextThing Co
> + * Copyright (c) 2016 Free Electrons
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +#include <common.h>
> +#include <command.h>
> +#include <errno.h>
> +#include <malloc.h>
> +
> +#include <linux/sizes.h>
> +
> +#include <test/ut.h>
> +#include <test/overlay.h>
> +
> +/* 4k ought to be enough for anybody */
> +#define FDT_COPY_SIZE	(4 * SZ_1K)
> +
> +extern u32 __dtb_test_fdt_base_begin;
> +extern u32 __dtb_test_fdt_overlay_begin;
> +
> +static int fdt_getprop_u32_by_index(void *fdt, const char *path,
> +				    const char *name, int index,
> +				    u32 *out)
> +{
> +	const fdt32_t *val;
> +	int node_off;
> +	int len;
> +
> +	node_off =3D fdt_path_offset(fdt, path);
> +	if (node_off < 0)
> +		return node_off;
> +
> +	val =3D fdt_getprop(fdt, node_off, name, &len);
> +	if (!val || (len < (sizeof(uint32_t) * (index + 1))))
> +		return -FDT_ERR_NOTFOUND;
> +
> +	*out =3D fdt32_to_cpu(*(val + index));
> +
> +	return 0;
> +}
> +
> +static int fdt_getprop_u32(void *fdt, const char *path, const char *name,
> +			   u32 *out)
> +{
> +	return fdt_getprop_u32_by_index(fdt, path, name, 0, out);
> +}
> +
> +static int fdt_getprop_str(void *fdt, const char *path, const char *name,
> +			   const char **out)
> +{
> +	int node_off;
> +
> +	node_off =3D fdt_path_offset(fdt, path);
> +	if (node_off < 0)
> +		return node_off;
> +
> +	return fdt_get_string(fdt, node_off, name, out);
> +}
> +
> +static int fdt_overlay_change_int_property(struct unit_test_state *uts)
> +{
> +	void *fdt =3D uts->priv;
> +	u32 val =3D 0;
> +
> +	ut_assertok(fdt_getprop_u32(fdt, "/test-node", "test-int-property",
> +				    &val));
> +	ut_asserteq(43, val);
> +
> +	return CMD_RET_SUCCESS;
> +}
> +OVERLAY_TEST(fdt_overlay_change_int_property, 0);
> +
> +static int fdt_overlay_change_str_property(struct unit_test_state *uts)
> +{
> +	void *fdt =3D uts->priv;
> +	const char *val =3D NULL;
> +
> +	ut_assertok(fdt_getprop_str(fdt, "/test-node", "test-str-property",
> +				    &val));
> +	ut_asserteq_str("foobar", val);
> +
> +	return CMD_RET_SUCCESS;
> +}
> +OVERLAY_TEST(fdt_overlay_change_str_property, 0);
> +
> +static int fdt_overlay_add_str_property(struct unit_test_state *uts)
> +{
> +	void *fdt =3D uts->priv;
> +	const char *val =3D NULL;
> +
> +	ut_assertok(fdt_getprop_str(fdt, "/test-node", "test-str-property-2",
> +				    &val));
> +	ut_asserteq_str("foobar2", val);
> +
> +	return CMD_RET_SUCCESS;
> +}
> +OVERLAY_TEST(fdt_overlay_add_str_property, 0);
> +
> +static int fdt_overlay_add_node_by_phandle(struct unit_test_state *uts)
> +{
> +	void *fdt =3D uts->priv;
> +	int off;
> +
> +	off =3D fdt_path_offset(fdt, "/test-node/new-node");
> +	ut_assert(off >=3D 0);
> +
> +	ut_assertnonnull(fdt_getprop(fdt, off, "new-property", NULL));
> +
> +	return CMD_RET_SUCCESS;
> +}
> +OVERLAY_TEST(fdt_overlay_add_node_by_phandle, 0);
> +
> +static int fdt_overlay_add_node_by_path(struct unit_test_state *uts)
> +{
> +	void *fdt =3D uts->priv;
> +	int off;
> +
> +	off =3D fdt_path_offset(fdt, "/new-node");
> +	ut_assert(off >=3D 0);
> +
> +	ut_assertnonnull(fdt_getprop(fdt, off, "new-property", NULL));
> +
> +	return CMD_RET_SUCCESS;
> +}
> +OVERLAY_TEST(fdt_overlay_add_node_by_path, 0);
> +
> +static int fdt_overlay_add_subnode_property(struct unit_test_state *uts)
> +{
> +	void *fdt =3D uts->priv;
> +	int off;
> +
> +	off =3D fdt_path_offset(fdt, "/test-node/sub-test-node");
> +	ut_assert(off >=3D 0);
> +
> +	ut_assertnonnull(fdt_getprop(fdt, off, "sub-test-property", NULL));
> +	ut_assertnonnull(fdt_getprop(fdt, off, "new-sub-test-property", NULL));
> +
> +	return CMD_RET_SUCCESS;
> +}
> +OVERLAY_TEST(fdt_overlay_add_subnode_property, 0);
> +
> +static int fdt_overlay_local_phandle(struct unit_test_state *uts)
> +{
> +	uint32_t local_phandle, test_phandle;
> +	void *fdt =3D uts->priv;
> +	u32 val =3D 0;
> +	int off;
> +
> +	off =3D fdt_path_offset(fdt, "/new-local-node");
> +	ut_assert(off >=3D 0);
> +
> +	local_phandle =3D fdt_get_phandle(fdt, off);
> +	ut_assert(local_phandle);
> +
> +	off =3D fdt_path_offset(fdt, "/test-node");
> +	ut_assert(off >=3D 0);
> +
> +	test_phandle =3D fdt_get_phandle(fdt, off);
> +	ut_assert(test_phandle);
> +
> +	ut_assertok(fdt_getprop_u32_by_index(fdt, "/", "test-phandle", 0,
> +					     &val));
> +	ut_asserteq(test_phandle, val);
> +
> +	ut_assertok(fdt_getprop_u32_by_index(fdt, "/", "test-phandle", 1,
> +					     &val));
> +	ut_asserteq(local_phandle, val);
> +
> +	return CMD_RET_SUCCESS;
> +}
> +OVERLAY_TEST(fdt_overlay_local_phandle, 0);
> +
> +int do_ut_overlay(cmd_tbl_t *cmdtp, int flag, int argc, char * const arg=
v[])
> +{
> +	struct unit_test *tests =3D ll_entry_start(struct unit_test,
> +						 overlay_test);
> +	const int n_ents =3D ll_entry_count(struct unit_test, overlay_test);
> +	struct unit_test_state *uts;
> +	struct unit_test *test;
> +	void *fdt_base =3D &__dtb_test_fdt_base_begin;
> +	void *fdt_overlay =3D &__dtb_test_fdt_overlay_begin;
> +	void *fdt_base_copy, *fdt_overlay_copy;
> +
> +	ut_assertok(fdt_check_header(fdt_base));
> +	ut_assertok(fdt_check_header(fdt_overlay));
> +
> +	uts =3D calloc(1, sizeof(*uts));
> +	if (!uts)
> +		return -ENOMEM;
> +
> +	fdt_base_copy =3D malloc(FDT_COPY_SIZE);
> +	if (!fdt_base_copy)
> +		return -ENOMEM;
> +	uts->priv =3D fdt_base_copy;
> +
> +	fdt_overlay_copy =3D malloc(FDT_COPY_SIZE);
> +	if (!fdt_overlay_copy)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Resize the FDT to 4k so that we have room to operate on
> +	 *
> +	 * (and relocate it since the memory might be mapped
> +	 * read-only)
> +	 */
> +	ut_assertok(fdt_open_into(fdt_base, fdt_base_copy, FDT_COPY_SIZE));
> +
> +	/*
> +	 * Resize the overlay to 4k so that we have room to operate on
> +	 *
> +	 * (and relocate it since the memory might be mapped
> +	 * read-only)
> +	 */
> +	ut_assertok(fdt_open_into(fdt_overlay, fdt_overlay_copy,
> +				  FDT_COPY_SIZE));
> +
> +	/* Apply the overlay */
> +	ut_assertok(fdt_overlay_apply(fdt_base_copy, fdt_overlay_copy));
> +
> +	if (argc =3D=3D 1)
> +		printf("Running %d environment tests\n", n_ents);
> +
> +	for (test =3D tests; test < tests + n_ents; test++) {
> +		if (argc > 1 && strcmp(argv[1], test->name))
> +			continue;
> +		printf("Test: %s\n", test->name);
> +
> +		uts->start =3D mallinfo();
> +
> +		test->func(uts);
> +	}
> +
> +	printf("Failures: %d\n", uts->fail_count);
> +
> +	free(fdt_overlay_copy);
> +	free(fdt_base_copy);
> +	free(uts);
> +
> +	return uts->fail_count ? CMD_RET_FAILURE : 0;
> +}
> diff --git a/test/overlay/test-fdt-base.dts b/test/overlay/test-fdt-base.=
dts
> new file mode 100644
> index 000000000000..2603adb6821e
> --- /dev/null
> +++ b/test/overlay/test-fdt-base.dts
> @@ -0,0 +1,21 @@
> +/*
> + * Copyright (c) 2016 NextThing Co
> + * Copyright (c) 2016 Free Electrons
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	test: test-node {
> +		test-int-property =3D <42>;
> +		test-str-property =3D "foo";
> +
> +		subtest: sub-test-node {
> +			sub-test-property;
> +		};
> +	};
> +};
> +
> +
> diff --git a/test/overlay/test-fdt-overlay.dts b/test/overlay/test-fdt-ov=
erlay.dts
> new file mode 100644
> index 000000000000..199aa5797ef4
> --- /dev/null
> +++ b/test/overlay/test-fdt-overlay.dts
> @@ -0,0 +1,88 @@
> +/*
> + * Copyright (c) 2016 NextThing Co
> + * Copyright (c) 2016 Free Electrons
> + *
> + * SPDX-License-Identifier:	GPL-2.0+
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	/* Test that we can change an int by another */
> +	fragment@0 {
> +		target =3D <&test>;
> +
> +		__overlay__ {
> +			test-int-property =3D <43>;
> +		};
> +	};
> +
> +	/* Test that we can replace a string by a longer one */
> +	fragment@1 {
> +		target =3D <&test>;
> +
> +		__overlay__ {
> +			test-str-property =3D "foobar";
> +		};
> +	};
> +
> +	/* Test that we add a new property */
> +	fragment@2 {
> +		target =3D <&test>;
> +
> +		__overlay__ {
> +			test-str-property-2 =3D "foobar2";
> +		};
> +	};
> +
> +	/* Test that we add a new node (by phandle) */
> +	fragment@3 {
> +		target =3D <&test>;
> +
> +		__overlay__ {
> +			new-node {
> +				new-property;
> +			};
> +		};
> +	};
> +
> +	/* Test that we add a new node (by path) */
> +	fragment@4 {
> +		target-path =3D "/";
> +
> +		__overlay__ {
> +			new-node {
> +				new-property;
> +			};
> +		};
> +	};
> +
> +	fragment@5 {
> +		target-path =3D "/";
> +
> +		__overlay__ {
> +			local: new-local-node {
> +				new-property;
> +			};
> +		};
> +	};
> +
> +	fragment@6 {
> +		target-path =3D "/";
> +
> +		__overlay__ {
> +			test-phandle =3D <&test>, <&local>;
> +		};
> +	};
> +
> +	fragment@7 {
> +		target =3D <&test>;
> +
> +		__overlay__ {
> +			sub-test-node {
> +				new-sub-test-property;
> +			};
> +		};
> +	};
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--I4VOKWutKNZEOIPu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcLkiAAoJEGw4ysog2bOSER4P/0GrQ3LWZndBDcW5fffe6gYb
ELHfFachDFOUa8gxV5v7NMpXYZFt86V48oiJy1KJv3yOOm3wnR945gfiT9AL6v94
NN2iuMKqUlWMRdBIH6hmdA4lcKxTpaF877tmh9t/Znnbe7JgRn+b14G8lnmnDUuM
8TIcp3ediNUvH60K/i6UpuLSWGpBKQ4CNNW2AIZjKK4xeT0R5xjPfzKJxf7ru45N
QD5+ASXCdD8Id+QQcxv/c57AWQstuPiDWJb6Orpj2XkTPx4M7voMn4nNv9cJxFP+
MfxyDvPJxopA42pqgKZ58SV1fkIM01DS7HAjiAGYSjAlcK05J9CxYXFMQofrakqa
OSLAcfanaG5/h1GroX3mvQNzDUe2czIOASUd7yxgZnF8nwnf4IejZADuSw20+8Pw
tHjT5EJn8/YjWw2uwUcLESO4XzvTWjuCrgjxCsVCAjV+n2DSH1HQT8s2vObF0meS
0BKqUtqXDUiA6udEQ3HOL9e9R5eefCQvb1hvrRhMp4/8wnGgE7TrUxG5SaWQ71u/
PPeVvZGg+8hhGhsVhwoud75APebdtENKBgFvsQwR6mqRKWzHsu/PBosmGJ7xra5z
1T+slOFx3OWHpAFjmHqecrAZOEr3KS6jYuWmxTL2csF3JTFXuOuVsFttuUt/IK41
+9/hWbyK60a/qZMfKHCY
=LN82
-----END PGP SIGNATURE-----

--I4VOKWutKNZEOIPu--
