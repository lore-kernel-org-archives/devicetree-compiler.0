Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3E933D6CA;
	Thu, 17 Sep 2026 04:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620760; cv=none; b=PfBSComhbVZRASyPGRxc4RcgvtRyAHbSs17RMs7CHL/OEyK1fxcH0otrLgqKfVk7Ap9JKOzvBSmb9+RbvTBbznZ2vhPw+S17aUlea8omR50ixsaRS9JV/x5m6+eTX9J824C9gEqeOluWpcff2ni1krQIGywaibbh9zli65BDL9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620760; c=relaxed/simple;
	bh=idkb2dRONIy2UgdCWckJNGqi1MN1xT1FjdFYs02nKas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7umnUo/lrhVmcXrzO6y6NOYtURiKZfte3orxV/qw904Nx+Qnv+hGWtMqbiLgltetCHsWMdvo6ZOAEi5cZwZKnb9gmS4X3NVlpuW/roovic/Rx20GNlfcnjgQa727OiwBBSRsdMJBJ2CtW1/dYS7JpXDmiQHXoIt+gvF7WwyOKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=QNVT42yB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="QNVT42yB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789620736;
	bh=3VIP5hVzvfITfbDZtEh+RJyN8pwzQznkKQCSl/Lj8AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNVT42yBizVrRGGsX1g89LRdWRfG5Rp5iUVKsHfpqMC45MEZle3xmMl1UzCUpCadV
	 85wuZDSHg0z10sPzyxUfusLDFlBIdPVHxnydQR8CEo3Y/sV18F1iZ6+QTJzXRTZxsB
	 L4SJD1l5rhkacCDzXIO8vJ9CmkM6XoR3hngrpV8ENFXnU1H36b1cjfWjJoaztJHhYh
	 Sbeq3NRR23HfLdiYgxodgw2hw60oNEzo9iGLWQIDy6nEFrDhnjzcUtN7l7PPULKCbv
	 ncVPVwWvaiJIOii03wzuIRBmGuansPbFVkSR6NPOQJ9AGD466U5xbAjfLQ0gcxmJ/E
	 NOaX0kV6dJJWQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hljzN0McNz4wFT; Thu, 17 Sep 2026 14:52:16 +1000 (AEST)
Date: Thu, 17 Sep 2026 14:52:28 +1000
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
Message-ID: <aqtx_MzOsc3q4Gev@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-12-herve.codina@bootlin.com>
 <aqpnzXyR_k4fs7Jk@gractus.seuss>
 <20260916124205.28a71859@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ieFxzV6kdIZnBYUR"
Content-Disposition: inline
In-Reply-To: <20260916124205.28a71859@bootlin.com>

--ieFxzV6kdIZnBYUR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:42:05PM +0200, Herve Codina wrote:
> Hi David,
>=20
> On Wed, 16 Sep 2026 19:56:46 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Aug 26, 2026 at 10:31:42AM +0200, Herve Codina wrote:
> > > Future operations, such as handling unknown tags on dtb modifications,
> > > need to modify properties retrieved by their offset.
> > >=20
> > > fdt_getprop_by_offset() already exists to get a preperty by its offset
> > > but the property returned is read-only. A writable returned property =
is
> > > needed. =20
> >=20
> > Since we already have fdt_get_property_by_offset_w() this is an
> > obvious gap and I'd be happy in principle to apply this independent of
> > the rest of the series.
>=20
> Nice :)
>=20
> >=20
> > > Fill the lack and introduce fdt_getprop_by_offset_w(), the write enab=
led
> > > variant of fdt_getprop_by_offset().
> > >=20
> > > Add also its related test.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  libfdt/libfdt.h           |  6 +++
> > >  tests/.gitignore          |  1 +
> > >  tests/Makefile.tests      |  2 +-
> > >  tests/get_prop_offset_w.c | 84 +++++++++++++++++++++++++++++++++++++=
++
> > >  tests/meson.build         |  1 +
> > >  tests/run_tests.sh        |  1 +
> > >  tests/tests.h             |  1 +
> > >  tests/testutils.c         | 18 +++++++++
> > >  8 files changed, 113 insertions(+), 1 deletion(-)
> > >  create mode 100644 tests/get_prop_offset_w.c
> > >=20
> > > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > > index 7a1915a5..82965e32 100644
> > > --- a/libfdt/libfdt.h
> > > +++ b/libfdt/libfdt.h
> > > @@ -856,6 +856,12 @@ static inline struct fdt_property *fdt_get_prope=
rty_w(void *fdt, int nodeoffset,
> > >  #ifndef SWIG /* This function is not useful in Python */
> > >  const void *fdt_getprop_by_offset(const void *fdt, int offset,
> > >  				  const char **namep, int *lenp);
> > > +static inline void *fdt_getprop_by_offset_w(const void *fdt, int off=
set,
> > > +					    const char **namep, int *lenp)
> > > +{
> > > +	return (void *)(uintptr_t)fdt_getprop_by_offset(fdt, offset, namep,
> > > +							lenp);
> > > +}
> > >  #endif
> > > =20
> > >  /**
> > > diff --git a/tests/.gitignore b/tests/.gitignore
> > > index 69693129..1091174a 100644
> > > --- a/tests/.gitignore
> > > +++ b/tests/.gitignore
> > > @@ -30,6 +30,7 @@ tmp.*
> > >  /get_phandle
> > >  /getprop
> > >  /get_prop_offset
> > > +/get_prop_offset_w
> > >  /incbin
> > >  /integer-expressions
> > >  /fs_tree1
> > > diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> > > index 63e201ae..0d4d399f 100644
> > > --- a/tests/Makefile.tests
> > > +++ b/tests/Makefile.tests
> > > @@ -16,7 +16,7 @@ LIB_TESTS_L =3D get_mem_rsv \
> > >  	sw_tree1 sw_states \
> > >  	move_and_save mangle-layout nopulate \
> > >  	open_pack rw_tree1 rw_oom set_name setprop del_property del_node \
> > > -	appendprop1 appendprop2 propname_escapes \
> > > +	appendprop1 appendprop2 propname_escapes get_prop_offset_w \
> > >  	string_escapes references path-references phandle_format \
> > >  	boot-cpuid incbin relref_merge \
> > >  	extra-terminating-null \
> > > diff --git a/tests/get_prop_offset_w.c b/tests/get_prop_offset_w.c
> > > new file mode 100644
> > > index 00000000..dbfa5dd7
> > > --- /dev/null
> > > +++ b/tests/get_prop_offset_w.c
> > > @@ -0,0 +1,84 @@
> > > +// SPDX-License-Identifier: LGPL-2.1-or-later
> > > +/*
> > > + * libfdt - Flat Device Tree manipulation
> > > + *	Testcase for fdt_getprop_by_offset_w()
> > > + * Copyright (C) 2026 Bootlin.
> > > + */
> > > +
> > > +#include <stdlib.h>
> > > +#include <stdio.h>
> > > +#include <string.h>
> > > +#include <stdint.h>
> > > +
> > > +#include <libfdt.h>
> > > +
> > > +#include "tests.h"
> > > +#include "testdata.h"
> > > +
> > > +#define SPACE		65536
> > > +
> > > +int main(int argc, char *argv[])
> > > +{
> > > +	const void *exp_val;
> > > +	const char *name;
> > > +	char *modif_val;
> > > +	void *propval;
> > > +	int proplen;
> > > +	int exp_len;
> > > +	int poffset;
> > > +	void *fdt;
> > > +	void *buf;
> > > +	int err;
> > > +
> > > +	test_init(argc, argv);
> > > +	fdt =3D load_blob_arg(argc, argv);
> > > +
> > > +	buf =3D xmalloc(SPACE);
> > > +
> > > +	err =3D fdt_open_into(fdt, buf, SPACE); =20
> >=20
> > You shouldn't need an fdt_open_into().  You're modifying the contents
> > of a single property, but not moving tags about or (specifically)
> > expanding the tree as a whole.  This is a "write in place" operation
> > rather than a "read/write" operation in libfdt terms.
>=20
> Ok, I will update in the next iteration.
>=20
> >=20
> > > +	if (err)
> > > +		FAIL("fdt_open_into(): %s", fdt_strerror(err));
> > > +
> > > +	free(fdt);
> > > +	fdt =3D buf;
> > > +
> > > +	/* Retrieve the offset of the 'prop-str' property */
> > > +	poffset =3D get_poffset(fdt, 0, "prop-str");
> > > +	if (poffset < 0)
> > > +		FAIL("Property 'prop-str' not found") =20
> >=20
> > Introducing get_poffset() seems a bit awkward compared to using an
> > fdt_for_each_property_offset() like get_prop_offset.c does.
>=20
> Ok, will use fdt_for_each_property_offset() directly here and remove
> get_poffset() in the next iteration.
>=20
> > > +
> > > +	/* Get the property value for modification */
> > > +	propval =3D fdt_getprop_by_offset_w(fdt, poffset, &name, &proplen);
> > > +	if (!propval)
> > > +		FAIL("fdt_getprop_by_offset_w(%d): %s", poffset,
> > > +		     fdt_strerror(proplen));
> > > +
> > > +	/* Check original values */
> > > +	if (strcmp(name, "prop-str"))
> > > +		FAIL("Name mismatch : %s instead of prop-str", name);
> > > +
> > > +	exp_len =3D strlen(TEST_STRING_1) + 1;
> > > +	if (proplen !=3D exp_len)
> > > +		FAIL("Original size mismatch on property \"%s\": %d instead of %d",
> > > +		     name, proplen, exp_len);
> > > +
> > > +	exp_val =3D TEST_STRING_1;
> > > +	if (memcmp(exp_val, propval, exp_len))
> > > +		FAIL("Original data mismatch on property \"%s\"", name);
> > > + =20
> >=20
> > You could re-use check_get_prop_offset() from testutils.c to perform
> > these tests before invoking fdt_getprop_by_offset_w().
>=20
> I wanted to test that the value returned by fdt_getprop_by_offset_w() is =
the
> correct one. check_get_prop_offset() calls fdt_getprop_by_offset() and not
> fdt_getprop_by_offset_w().

Ah, fair point.

But.. rather than checking the retreived values the same as
get_prop_offset.c, it would be both simpler and more complete to
explicitly check that fdt_getprop_by_offset_w() returns the same
pointer as fdt_getprop_by_offset().

> I know it doesn't matter with current implementation
> of fdt_getprop_by_offset_w() but I am not supposed to know about this
> implementation here in the test. Also, this implementation could change i=
n the
> future (not planned on my side).
>=20
> >=20
> > > +	if (exp_len < 4)
> > > +		CONFIG("Property \"%s\" should be at least 4 bytes", name);
> > > +
> > > +	/* Modify the property value */
> > > +	modif_val =3D xmalloc(proplen);
> > > +	memcpy(modif_val, propval, proplen); =20
> >=20
> > Why malloc() and memcpy()?  The whole point of
> > fdt_getprop_by_offset_w() is that you get a writable pointer into the
> > fdt which you can modify in place.
>=20
> I want to keep the modified value for later comparison.
>=20
> - modif_val : Current property val + modification.
> - Update propval: Current property val.
> - Check reading the property with check_get_prop_offset() that the
>   property has been really updated.
>=20
> If instead I use only propval, I use only one buffer and so
> - propval =3D modified value
> - check that get check_get_prop_offset() which will also return the=20
>   propval buffer matches the propval buffer.

Ah, missed that, that makes sense.  Personally I'd probably go with a
static buffer with the value to write in (and then compare), but
either way is fine.

> In check_get_prop_offset();
> --- 8< ---
> const void *check_get_prop_offset(void *fdt, int poffset, const char *exp=
_name,
>                                   int exp_len, const void *exp_val)
> {
> 	const void *propval;
> 	...
> 	propval =3D fdt_getprop_by_offset(fdt, poffset, &name, &proplen);
> 	...
>  	if (exp_len && memcmp(exp_val, propval, exp_len))
>              FAIL("Data mismatch on property \"%s\"", name);
>         ...
> }
>=20
> Using a pointer returned by fdt_getprop_by_offset_w() as exp_val parameter
> leads to something like:
> 	memcmp(propval, propval, exp_len)
>=20
> This is always successful even if the propval buffer doesn't contain the
> data expected by the test. If for whatever reason the propval buffer is
> wrongly modified by some internal libfdt function called by
> check_get_prop_offset(), we cannot see it.
>=20
> With the additional buffer (modif_val) which is never passed to libfdt,
> and contains expected data, we can see any wrong proval modification.
>=20
> >=20
> > > +	modif_val[1] =3D (modif_val[1] !=3D 'A') ? 'A' : 'a';
> > > +	modif_val[3] =3D (modif_val[3] !=3D 'B') ? 'B' : 'b';
> > > +	memcpy(propval, modif_val, exp_len);
> > > +
> > > +	/* Check that the modified value is taken into account */
> > > +	if (!check_get_prop_offset(fdt, poffset, "prop-str", exp_len, modif=
_val))
> > > +		FAIL("Modified property 'prop-str' not found");
> > > +
> > > +	PASS();
> > > +}
> > > diff --git a/tests/meson.build b/tests/meson.build
> > > index 779e6bc7..dae6a941 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -50,6 +50,7 @@ tests =3D [
> > >    'get_path',
> > >    'get_phandle',
> > >    'get_prop_offset',
> > > +  'get_prop_offset_w',
> > >    'get_next_tag_invalid_prop_len',
> > >    'getprop',
> > >    'incbin',
> > > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > > index 225c22f8..419a24d8 100755
> > > --- a/tests/run_tests.sh
> > > +++ b/tests/run_tests.sh
> > > @@ -419,6 +419,7 @@ tree1_tests_rw () {
> > >      run_test setprop $TREE
> > >      run_test del_property $TREE
> > >      run_test del_node $TREE
> > > +    run_test get_prop_offset_w $TREE =20
> >=20
> > This belongs with the other write-in-place tests in tree1_tests(), not
> > as an rw test.
>=20
> Ok, I will move it.
>=20
> Best regards,
> Herv=E9
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ieFxzV6kdIZnBYUR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqrcfwACgkQzQJF27ox
2GfDCBAAnbt026NPtFG+27UiZ0l40m/tP8eKpTLPIst0aVLc9syoC6LpG5fr34Ls
nY58GEMxdzwF1AfJ+qlPUoUpVBdl9yMrF1510r4ZnitH4lhxxY1Be+H0vEcuOqmL
BEra8pfwPQUaRTb26k+rZ3nrI2PKF1VcvlEHZ4MCiYQwlPtut+NtfB0RWiGOdXKu
kunw2uhi72pJiM2iqVQ3HrRVnl7iyfrP7g0Y0PaAXTGkpwiZhTv+RYvX+ZkZ6pgF
m39DkN3zEokrvgfY+dF6uGFxtan/PwZ/LyVIs2n7ijbi+PiZeSmMWfxheACCdlvo
///Xq8TwK5O6Q9ItvBfqCi1bYkOvPi3qnDiHQaBnqYLARNJ/G4y4TKUowkRf7vAT
8YQnvp5kyopKKMGaFM8N7VRKRfRjNh0Xa4rXkbQGzE1OEgP1mXDmYlR3lo4l90O3
j4xJudfCNjFxehvKRkCzNjxrdJnh1gnkexpSrg8i77iuMbSSj/Y7LXwRGWqqLdAU
V/egN7WNK70zMlv6QrY7F325I1esxB39futJ6eUwnTPNUol+s5xCyteQ9QchNVSm
svbaIJVimnf/e7vn/UmAx9JlwKpzwL4Ho4WnE02mr5MBk2x3/vhx3aGrfGHcm5x2
3OIVC101S+37cjYeBZgG0U5CMt+f5BhSDB7Wef32bz2wg4Tbg6Y=
=VYZb
-----END PGP SIGNATURE-----

--ieFxzV6kdIZnBYUR--
