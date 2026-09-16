Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608CF4D0A06;
	Wed, 16 Sep 2026 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552967; cv=none; b=dJcHNm2S9ul5rfTS4WzmKhNYgYDd6AzFNAu+gsr+NWBG5DMdqK1SsT+q8ImgUbqTGPzD3V/LcfZ/bGoYyBk+7Nb94pi898uZ/DjzQ1a14RhnP3gW5vefIv9klXW2OTEueZXdVaPgZrEd2Jkozt3Mp5s6NaobtVEnnsiPpl+h8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552967; c=relaxed/simple;
	bh=XSzOZYLwzuEsFiDdxISYmHRCvWzGXnp6c1pCedwO9gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTaSQemQk6bA30FFsmNvCR0cuevqV8Bg5QFopryKLDY0Zd9Hw8RgEHZBDqydUCNn+8EAeNJoEaQwITutPCqRGf7d0ZuZgs/ssMCrfjzHZhQ4SxnTK9JbxoG1VYkOr58ODzqSelj72r8CDDc7VwlovSE+wr+k9o2tAlsAKwAuRHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=PVyvKcrW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="PVyvKcrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202608; t=1789552923;
	bh=CfDoltNitGaCSwPK2ctQXlNNC5dInhDCbXSmhZuHk8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVyvKcrWadg+EZm4GgrlW34vEAcYPA1sHbstjJ03Ao1k9s1c6y4b0xfttzhoHpAqF
	 bd7Ut9hmvtDXy1AVHCqi2pUe9CypTlNmxVWGH1Q9scLMVYPfdMvXtuFYVQackiUP4V
	 7plq7oRyvVXmnfB3Bjj6uoz6jqaDN6lfyve5wc0Gs6pWbrmkjAwstB428HPsZhN6D5
	 uy/4/OFKpDf0ayBgxDRTR4j/oHJQvq4FxcTh7BlUpTrPRzozv080bWNvAXGEdv1djp
	 Us6HV9j6AkWTbjlKXg44Ir/f8AAerCMWQs0tB/HCUBzsdem9sCuyJbyL6v7TQff4LM
	 04ZeVbXNeEhFw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4hlDvH05ybz4wLn; Wed, 16 Sep 2026 20:02:02 +1000 (AEST)
Date: Wed, 16 Sep 2026 20:00:40 +1000
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
Subject: Re: [PATCH v3 13/15] tests: Add wip_func utility
Message-ID: <aqpoxzD14OQazE1y@gractus.seuss>
References: <20260826083146.304291-1-herve.codina@bootlin.com>
 <20260826083146.304291-14-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nNKp0wpa/Wf4e7VM"
Content-Disposition: inline
In-Reply-To: <20260826083146.304291-14-herve.codina@bootlin.com>

--nNKp0wpa/Wf4e7VM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:31:44AM +0200, Herve Codina wrote:
> wip_func is a test utility allowing to wrap the write inplace functions.
>=20
> It allows to create tests with custom wip write sequence.
>=20
> Also the modified dtb is saved allowing to perform later checks on this
> modified dtb.

It's not clear to me what this is useful for that's not already
covered by the existing write-in-place tests (nop_node.c,
nop_property.c and setprop_inplace.c).

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  tests/Makefile.tests |   3 +-
>  tests/meson.build    |   1 +
>  tests/wip_func.c     | 127 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 130 insertions(+), 1 deletion(-)
>  create mode 100644 tests/wip_func.c
>=20
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index 0d4d399f..a71c4cbf 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -31,7 +31,8 @@ LIB_TESTS_L =3D get_mem_rsv \
>  	check_path check_header check_full \
>  	fs_tree1 \
>  	truncated_property truncated_string \
> -	truncated_memrsv unterminated_memrsv
> +	truncated_memrsv unterminated_memrsv \
> +	wip_func
>  LIB_TESTS =3D $(LIB_TESTS_L:%=3D$(TESTS_PREFIX)%)
> =20
>  ifneq ($(STATIC_BUILD),1)
> diff --git a/tests/meson.build b/tests/meson.build
> index dae6a941..e7a88936 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -96,6 +96,7 @@ tests =3D [
>    'truncated_string',
>    'unterminated_memrsv',
>    'utilfdt_test',
> +  'wip_func',
>  ]
> =20
>  test_deps =3D [testutil_dep, util_dep, libfdt_dep]
> diff --git a/tests/wip_func.c b/tests/wip_func.c
> new file mode 100644
> index 00000000..3becc4f1
> --- /dev/null
> +++ b/tests/wip_func.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: LGPL-2.1-or-later
> +/*
> + * libfdt - Flat Device Tree manipulation
> + *	Wrapper wip functions family
> + * Copyright (C) 2026 Herve Codina, Bootlin.
> + */
> +
> +#include <inttypes.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <ctype.h>
> +#include <stdint.h>
> +#include <errno.h>
> +
> +#include <libfdt.h>
> +
> +#include "tests.h"
> +
> +struct args {
> +	char *dtb_path;
> +	enum {
> +		NOP_NODE,
> +		NOP_PROP,
> +		SET_PROP,
> +	} op;
> +	char *node_path;
> +	char *prop_name;
> +	int index;
> +	char *value;
> +};
> +
> +const char *usage_txt =3D "Usage:\n"
> +	"  - wip_func <dtb> nop_node <node_path>\n"
> +	"  - wip_func <dtb> nop_prop <node_path> <prop_name>\n"
> +	"  - wip_func <dtb> set_prop <node_path> <prop_name> <index> <str>\n"
> +	;
> +
> +static void parse_args(struct args *args, int argc, char *argv[])
> +{
> +	char *endptr;
> +
> +	memset(args, 0, sizeof(*args));
> +
> +	if (argc < 3)
> +		goto fail;
> +
> +	args->dtb_path =3D argv[1];
> +
> +	if (!strcmp(argv[2], "nop_node")) {
> +		args->op =3D NOP_NODE;
> +		if (argc !=3D 4)
> +			goto fail;
> +		args->node_path =3D argv[3];
> +	} else if (!strcmp(argv[2], "nop_prop")) {
> +		args->op =3D NOP_PROP;
> +		if (argc !=3D 5)
> +			goto fail;
> +		args->node_path =3D argv[3];
> +		args->prop_name =3D argv[4];
> +	} else if (!strcmp(argv[2], "set_prop")) {
> +		args->op =3D SET_PROP;
> +		if (argc !=3D 7)
> +			goto fail;
> +		args->node_path =3D argv[3];
> +		args->prop_name =3D argv[4];
> +		errno =3D 0;
> +		args->index =3D strtol(argv[5], &endptr, 0);
> +		if (*endptr !=3D '\0' || errno)
> +			goto fail;
> +		args->value =3D argv[6];
> +	} else {
> +		goto fail;
> +	}
> +
> +	return;
> +
> +fail:
> +	CONFIG("%s\n", usage_txt);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	struct args args;
> +	void *fdt;
> +	int node;
> +	int err;
> +
> +	test_init(argc, argv);
> +
> +	parse_args(&args, argc, argv);
> +
> +	fdt =3D load_blob(args.dtb_path);
> +
> +	node =3D fdt_path_offset(fdt, args.node_path);
> +	if (node < 0)
> +		FAIL("Fail to get '%s': %s", args.node_path, fdt_strerror(node));
> +
> +	switch (args.op) {
> +	case NOP_NODE:
> +		err =3D fdt_nop_node(fdt, node);
> +		if (err)
> +			FAIL("fdt_nop_node('%s'): %s", args.node_path, fdt_strerror(err));
> +		break;
> +
> +	case NOP_PROP:
> +		err =3D fdt_nop_property(fdt, node, args.prop_name);
> +		if (err)
> +			FAIL("fdt_nop_node('%s', '%s'): %s", args.node_path,
> +			     args.prop_name, fdt_strerror(err));
> +		break;
> +
> +	case SET_PROP:
> +		err =3D fdt_setprop_inplace_namelen_partial(fdt, node,
> +			args.prop_name, strlen(args.prop_name), args.index,
> +			args.value, strlen(args.value) + 1);
> +		if (err)
> +			FAIL("fdt_setprop_inplace_namelen_partial('%s', '%s', %d, \"%s\"): %s=
",
> +			     args.node_path, args.prop_name, args.index,
> +			     args.value, fdt_strerror(err));
> +		break;
> +	}
> +
> +	save_blob(args.dtb_path, fdt);
> +
> +	PASS();
> +}
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--nNKp0wpa/Wf4e7VM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmqqaMcACgkQzQJF27ox
2GfQNw//RTnbBmUzvy/7wfrFcY01yeMEArA/sYJq33vM80UxUH/yUT6Q0hf00v8E
vR0Zdj3iLUGJc31ZlrC1MxYJ9bUWzxNpihOChLnMdK46GtAOot2W9u4G/oHsKmvH
Jx4ZezhJC0SYTkgl1RkT9ZPEfd396I7faNsqg8aPtk9JnRgSFDLKhiFz1v+Yuzph
pEaSH/1Sj+H1b0Luz8pNJN1ABbkrhWc3+NKKeTaCXZc/t1zh43bopBjzEpZ8x2Ze
9DAYzCf6+SqS40OUl2T+WKG+uHP8TYz9+rVsTHbYCSUdYNqhyrzHR8iFoR411jUe
9aAqat0DgI88GdmkigODOubMozvxwntufQjRQuDo71RtNfc5XXV9jlDGCkXmtT2S
30yXgGHj4TVZc9OeR8OTkX5BJHmIH+AQ743kMkiVSns9zYhkOkrIlygRd9CspyFy
Gcq3FPJ0WrO/W2c0BdszmPfHw5vVh+QxtmUGeTTBP6DsA3mxgEd+aTMTNwNbUc5H
ekvAVULZ9c20wD1vDNJqwR2u8udHkKvKkPwoqLT32SFwqyBg8fiMKtV69wrtSLbE
Z10KaLL2vb/52LzLe6f8LplkRuqvJvtCC0CHOb3f03iEX27aXaKmUmYsW5w4+mRy
XF57RIWTw+IusdTwayq36+6PncG7N2bEgG5wLvJeX67YXJ3ETWk=
=wWHd
-----END PGP SIGNATURE-----

--nNKp0wpa/Wf4e7VM--
