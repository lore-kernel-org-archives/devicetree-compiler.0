Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01B54AF9D8;
	Wed, 16 Sep 2026 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552626; cv=none; b=J+X/keo/GOIJmlZTRSJjHsiXQJAxRcwDvLbsPZi2leVDyHIJXM6AZrD8uZo/ZU0VkhYMSKY9KxPDQKMXL6j4Q1rKOxoehwD77DkBrpu984N73VpcoqteuslWybpRBgWiAyskxJMzkjSeH+LoozoAzSCYounH9LZNBRUBc64ZUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552626; c=relaxed/simple;
	bh=F4j9n1pu0Pj/Ha82+DqNnTXh59IQa5vo6+1HswHe0O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwpyHaxUf0fD/bExNG1M5dTCRPGXEFu7aPp86c+wh3mf13sJGA9JL380gk4YFiOKzqpalw4OHzHfhIC0drO4Vqr1uJW5As6sUzW/v9MbKdQdpYr6PlXnexIrs2JRnpE0uWgT3AVYLpL0Q+PrGe8mDLyALxhU+r5l3lyGd1J1Dps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=AHWcHN7e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="AHWcHN7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789552596;
	bh=1G2Cr0dn2Fan1swHrG6sKSChQ6e5dX/LwMCH2sO1IXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AHWcHN7ee70/vJVnqxVFurM05xlcJMRxqoJTh6uGc6Sa8aEdgPuxkzhVJLOoNOe6s
	 ohOuaTZmk+naDBqq6ApAsqTo9eYEpdCeFEQDS6PG+VDyhl8w33zp+kIReE31mDSUMW
	 6eiGylPZ+i/2zaqgx6Iq3CLWL0fNZJL2vk7G4oNex25PhrUxd2BB3JwcoPusg4FgR8
	 1n/3Gj7XNwMcnWFJmQ1eYYBiY4jkIrRen4Nwx69sxwTPtGqvhbAWywoivNi1VV5rJ7
	 70y6BDh/Jt6BhqKA3gpsoQp9nojyXDbzXRnsthAiBs90L3dppbni6lQgHQNLfq96Ls
	 xjjeIHVdIEKjQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hlDn007T7z4wHY; Wed, 16 Sep 2026 19:56:36 +1000 (AEST)
Date: Wed, 16 Sep 2026 19:56:46 +1000
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
Subject: Re: [PATCH v3 11/15] libfdt: Introduce fdt_getprop_by_offset_w()
Message-ID: <aqpnzXyR_k4fs7Jk@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-12-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P03FdlUDL0G3IatT"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-12-herve.codina@bootlin.com>

--P03FdlUDL0G3IatT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:42AM +0200, Herve Codina wrote:
> Future operations, such as handling unknown tags on dtb modifications,
> need to modify properties retrieved by their offset.
>=20
> fdt_getprop_by_offset() already exists to get a preperty by its offset
> but the property returned is read-only. A writable returned property is
> needed.

Since we already have fdt_get_property_by_offset_w() this is an
obvious gap and I'd be happy in principle to apply this independent of
the rest of the series.

> Fill the lack and introduce fdt_getprop_by_offset_w(), the write enabled
> variant of fdt_getprop_by_offset().
>=20
> Add also its related test.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  libfdt/libfdt.h           |  6 +++
>  tests/.gitignore          |  1 +
>  tests/Makefile.tests      |  2 +-
>  tests/get_prop_offset_w.c | 84 +++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |  1 +
>  tests/run_tests.sh        |  1 +
>  tests/tests.h             |  1 +
>  tests/testutils.c         | 18 +++++++++
>  8 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 tests/get_prop_offset_w.c
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 7a1915a5..82965e32 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -856,6 +856,12 @@ static inline struct fdt_property *fdt_get_property_=
w(void *fdt, int nodeoffset,
>  #ifndef SWIG /* This function is not useful in Python */
>  const void *fdt_getprop_by_offset(const void *fdt, int offset,
>  				  const char **namep, int *lenp);
> +static inline void *fdt_getprop_by_offset_w(const void *fdt, int offset,
> +					    const char **namep, int *lenp)
> +{
> +	return (void *)(uintptr_t)fdt_getprop_by_offset(fdt, offset, namep,
> +							lenp);
> +}
>  #endif
> =20
>  /**
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 69693129..1091174a 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -30,6 +30,7 @@ tmp.*
>  /get_phandle
>  /getprop
>  /get_prop_offset
> +/get_prop_offset_w
>  /incbin
>  /integer-expressions
>  /fs_tree1
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index 63e201ae..0d4d399f 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -16,7 +16,7 @@ LIB_TESTS_L =3D get_mem_rsv \
>  	sw_tree1 sw_states \
>  	move_and_save mangle-layout nopulate \
>  	open_pack rw_tree1 rw_oom set_name setprop del_property del_node \
> -	appendprop1 appendprop2 propname_escapes \
> +	appendprop1 appendprop2 propname_escapes get_prop_offset_w \
>  	string_escapes references path-references phandle_format \
>  	boot-cpuid incbin relref_merge \
>  	extra-terminating-null \
> diff --git a/tests/get_prop_offset_w.c b/tests/get_prop_offset_w.c
> new file mode 100644
> index 00000000..dbfa5dd7
> --- /dev/null
> +++ b/tests/get_prop_offset_w.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: LGPL-2.1-or-later
> +/*
> + * libfdt - Flat Device Tree manipulation
> + *	Testcase for fdt_getprop_by_offset_w()
> + * Copyright (C) 2026 Bootlin.
> + */
> +
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdint.h>
> +
> +#include <libfdt.h>
> +
> +#include "tests.h"
> +#include "testdata.h"
> +
> +#define SPACE		65536
> +
> +int main(int argc, char *argv[])
> +{
> +	const void *exp_val;
> +	const char *name;
> +	char *modif_val;
> +	void *propval;
> +	int proplen;
> +	int exp_len;
> +	int poffset;
> +	void *fdt;
> +	void *buf;
> +	int err;
> +
> +	test_init(argc, argv);
> +	fdt =3D load_blob_arg(argc, argv);
> +
> +	buf =3D xmalloc(SPACE);
> +
> +	err =3D fdt_open_into(fdt, buf, SPACE);

You shouldn't need an fdt_open_into().  You're modifying the contents
of a single property, but not moving tags about or (specifically)
expanding the tree as a whole.  This is a "write in place" operation
rather than a "read/write" operation in libfdt terms.

> +	if (err)
> +		FAIL("fdt_open_into(): %s", fdt_strerror(err));
> +
> +	free(fdt);
> +	fdt =3D buf;
> +
> +	/* Retrieve the offset of the 'prop-str' property */
> +	poffset =3D get_poffset(fdt, 0, "prop-str");
> +	if (poffset < 0)
> +		FAIL("Property 'prop-str' not found")

Introducing get_poffset() seems a bit awkward compared to using an
fdt_for_each_property_offset() like get_prop_offset.c does.

> +
> +	/* Get the property value for modification */
> +	propval =3D fdt_getprop_by_offset_w(fdt, poffset, &name, &proplen);
> +	if (!propval)
> +		FAIL("fdt_getprop_by_offset_w(%d): %s", poffset,
> +		     fdt_strerror(proplen));
> +
> +	/* Check original values */
> +	if (strcmp(name, "prop-str"))
> +		FAIL("Name mismatch : %s instead of prop-str", name);
> +
> +	exp_len =3D strlen(TEST_STRING_1) + 1;
> +	if (proplen !=3D exp_len)
> +		FAIL("Original size mismatch on property \"%s\": %d instead of %d",
> +		     name, proplen, exp_len);
> +
> +	exp_val =3D TEST_STRING_1;
> +	if (memcmp(exp_val, propval, exp_len))
> +		FAIL("Original data mismatch on property \"%s\"", name);
> +

You could re-use check_get_prop_offset() from testutils.c to perform
these tests before invoking fdt_getprop_by_offset_w().

> +	if (exp_len < 4)
> +		CONFIG("Property \"%s\" should be at least 4 bytes", name);
> +
> +	/* Modify the property value */
> +	modif_val =3D xmalloc(proplen);
> +	memcpy(modif_val, propval, proplen);

Why malloc() and memcpy()?  The whole point of
fdt_getprop_by_offset_w() is that you get a writable pointer into the
fdt which you can modify in place.

> +	modif_val[1] =3D (modif_val[1] !=3D 'A') ? 'A' : 'a';
> +	modif_val[3] =3D (modif_val[3] !=3D 'B') ? 'B' : 'b';
> +	memcpy(propval, modif_val, exp_len);
> +
> +	/* Check that the modified value is taken into account */
> +	if (!check_get_prop_offset(fdt, poffset, "prop-str", exp_len, modif_val=
))
> +		FAIL("Modified property 'prop-str' not found");
> +
> +	PASS();
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 779e6bc7..dae6a941 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -50,6 +50,7 @@ tests =3D [
>    'get_path',
>    'get_phandle',
>    'get_prop_offset',
> +  'get_prop_offset_w',
>    'get_next_tag_invalid_prop_len',
>    'getprop',
>    'incbin',
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 225c22f8..419a24d8 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -419,6 +419,7 @@ tree1_tests_rw () {
>      run_test setprop $TREE
>      run_test del_property $TREE
>      run_test del_node $TREE
> +    run_test get_prop_offset_w $TREE

This belongs with the other write-in-place tests in tree1_tests(), not
as an rw test.

>  }
> =20
>  check_tests () {
> diff --git a/tests/tests.h b/tests/tests.h
> index 578d8c1a..37ed3394 100644
> --- a/tests/tests.h
> +++ b/tests/tests.h
> @@ -109,6 +109,7 @@ const void *check_get_prop_offset(void *fdt, int poff=
set, const char *in_name,
>  const void *check_getprop_addrrange(void *fdt, int parent, int nodeoffse=
t,
>  				    const char *name, int num);
> =20
> +int get_poffset(void *fdt, int nodeoffset, const char *propname);
>  int nodename_eq(const char *s1, const char *s2);
>  void vg_prepare_blob(void *fdt, size_t bufsize);
>  void *load_blob(const char *filename);
> diff --git a/tests/testutils.c b/tests/testutils.c
> index 6d69e872..d35a1978 100644
> --- a/tests/testutils.c
> +++ b/tests/testutils.c
> @@ -230,6 +230,24 @@ const void *check_getprop_addrrange(void *fdt, int p=
arent, int nodeoffset,
>  	return propval;
>  }
> =20
> +int get_poffset(void *fdt, int nodeoffset, const char *propname)
> +{
> +	const char *name;
> +	int poffset;
> +
> +	fdt_for_each_property_offset(poffset, fdt, nodeoffset) {
> +		if (fdt_getprop_by_offset(fdt, poffset, &name, NULL)) {
> +			if (!strcmp(name, propname))
> +				return poffset;
> +		}
> +	}
> +
> +	if (poffset < 0)
> +		return poffset;
> +
> +	return -FDT_ERR_NOTFOUND;
> +}
> +
>  int nodename_eq(const char *s1, const char *s2)
>  {
>  	int len =3D strlen(s2);
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--P03FdlUDL0G3IatT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqqZ80ACgkQzQJF27ox
2Gdalg/+M0sKW3eRdwLPUq5EVEGFNwdEUx5ckbmicraDpqIp8gyS/2wjX56c4M+D
gek1q+AHDFertAwNFlkDseuZSzVIWAEXvDuLg5PBoX695CSwgDwT8pS8OkIxcb7S
PziBRt3F7XOpie96s8MaArUwxHGpXVLkaVyw3Vpdw4/vd8mRCxnh1z8MolKKqS+2
J/XSrNTl5qiTTkht7GQ4OWruVWMI/QO9SLHPBoo8Pr5fVn7fMU+rc6PvEvFc4C3Z
ZX0uxnPamp56k8yQXaGSQoFnrziUZR6/LGLUlA79cFA/aKflbLlBcXun6iXwzS3p
o3RoUYg/jawz1j9kL1y7MVVcG7AUbtWwRhgVuWSkL1OnGgmSqLeNlzd5VHrGArDh
u4azqLaN2LYPRPakcjNY9fr4/Ftu+dCICUctuIcnDoO6ffaC4nIWuBKQj1Hom0Ln
fFtzVgVZZw0637TLesxMv10xjdg4EDmVaemDkEwqEERspwR4ljWJIgx+djDrYna2
MkrdvhL+K8YiijPa7wGzh4VkJjQ+Z4+TI0obFCq366egOelE4pB0uvplwVcNVkd5
XwwFrPg8qdTUd5w6CfEcAe+V7oTY02FTHj/5h7otPhNYec16A7GtSmTidlx9DCWL
hJ4SHq2Qt7+oOvizgAmUDU0iHI3C5tcqVNEV0fUr/LpOQt6zGw8=
=cZRR
-----END PGP SIGNATURE-----

--P03FdlUDL0G3IatT--
