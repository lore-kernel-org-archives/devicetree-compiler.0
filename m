Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587386;
	b=njWIIXZYk9yup1lnDrk1OfJdXv/ery84DlXnSbcrBRJiufPaVibbhHIUtqYguFnfwn/h
	 B/PijpJZNtQiNbQmpfOTSINLE2IV1w6QUf5xMtdS2gSOSLuXbOdSI6zY2qkkLRRY+G8jy
	 /baQrDnSzi4njPofnOjxFLLlR6fRm8MEJ75FPO+vRyZV/+wJyfQt5xnYUirjbqrajy+EJ
	 i8r+PIdAM9Ebe6jFL/mYK5dK+S/BkpS5xQX1SkxYTjnFTtt1e7swnTJ8Y0YOBTwttwcLh
	 cpM8TVrV4PPhWb50VYYngVqkbCSKn1i7wGpOxfPOww3t0MK+YsgPAl2K9KynMzeu68Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587386;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=e2TYNWrcuzgRr4pqKxVXqa5r2/z666SeEYeAyYopiAw=;
	b=V9MNEPHrEDb0SkCEOi5nr/h8mMjRlaRJhbQV3bWLYXp/W05CAvjKQUPNverOqUaUMG5n
	 Wb+ZQcoLKrwCQw4GgcXHqqtkymy2iK1XxdE8IQJJstk94mIch0H0YBuF8eripoY6FQ5bx
	 KRO00knFJ+aIyoKXIHf+TPVLFkE39nFHXppBCnxtCx+prw/sFpjxTF23kXTzknCpdG17F
	 +ClKt3say+ODjU0Yl23Stn61l6W4LvvD8+1PSCNkxZKhxQDhHhAMznDKMUBrFFUFEMw2R
	 2gY/PQqU44FJxyWiZClI+Q6E29ZxYc2p3JaCKLiktuCUiTyArMa0EiHZXfeHankRN8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=dZYrjRQD;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C876070263
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 06:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C876070263
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=dZYrjRQD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795587384;
	bh=e2TYNWrcuzgRr4pqKxVXqa5r2/z666SeEYeAyYopiAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZYrjRQD6LuX2lHtuQ0UL9h5U/WT5zaNZ6fNkaGjfoy/k1SWBTCVZ3ctA7F+RwNsn
	 gbthxsUzOWafJN8YQWDOWV83enS0zwIhS8z4gk9xTVuNO9V/tQ2C1NRxt379wcinh7
	 ukGyc9JVYm0/gUDkhOFQqlFP+zb1sJrc5+hgHbJnSwq9MeHGJ05mZtbmHsjEicbUle
	 qef0/XfT/XcuWiR8GHJTY/2sAmwHP6N7FxkBGNHEEFVPgsNvRke1yrh8RNi5re9FWw
	 Cv0n2As90yTzIpvF3GNG6xj9X/Yf8sgbS+ztMwnBDtdIKGlFNozmuNLvCgKRtegYcS
	 g38anVYWk/wNw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ8Zc37msz4wSn; Wed, 25 Nov 2026 17:16:24 +1100 (AEDT)
Date: Wed, 25 Nov 2026 17:16:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 07/10] dtc: Merge &{label} in a plugin as with &label
Message-ID: <awZ9MovrRs5q_sv-@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-8-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SRz3y8J5zTssC0xz"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-8-sjg@chromium.org>

--SRz3y8J5zTssC0xz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:58:01PM -0700, Simon Glass wrote:
> In a plugin, &label { ... } is merged into the labelled node if the
> label is in the plugin, as of commit 0fcffda15e9f ("Merge nodes with
> local target label references"). But &{label} { ... } always becomes a
> separate fragment@N node, since anything in braces is lexed as a path
> reference. This adds a fragment which is not needed, which that commit
> aims to avoid, and fails with FDT_ERR_NOTFOUND if the label is not
> within a fragment.
>=20
> Treat a reference as a path only if it starts with '/', so that both
> forms are merged into the node. This changes the output for such a file.
> Applying an overlay which already works gives the same result, apart
> from the order of the properties and that a later &label { ... } now
> overrides an earlier &{label} { ... }, as the source order suggests.
>=20
> Other references are not affected. An absolute path still becomes a
> fragment@N node, as does a label which is not in the plugin, since it
> may be in the base tree.
>=20
> This also means that dtc does not need to record whether a reference is
> written in braces. The merge code, which is about to move out of the
> grammar, can tell a path from a label by looking at the reference.
>=20
> Add the merge-label-braces.dts and merge-label-order.dts tests to check
> this.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Excepting the name change.

> ---
>=20
> Changes in v4:
> - Add the &{label} tests here, rather than in the first patch
>=20
> Changes in v2:
> - Add new patch for &{label} in a plugin
>=20
>  dtc-parser.y                 | 10 +++++++---
>  tests/merge-label-braces.dts | 12 ++++++++++++
>  tests/merge-label-order.dts  | 17 +++++++++++++++++
>  tests/run_tests.sh           | 12 ++++++++++++
>  4 files changed, 48 insertions(+), 3 deletions(-)
>  create mode 100644 tests/merge-label-braces.dts
>  create mode 100644 tests/merge-label-order.dts
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 2d4dcb6..7e1e6c7 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -194,6 +194,8 @@ devicetree:
>  		}
>  	| devicetree DT_PATH_REF nodedef
>  		{
> +			struct node *target =3D get_node_by_ref($1, $2);
> +
>  			/*
>  			 * We rely on the rule being always:
>  			 *   versioninfo plugindecl memreserves devicetree
> @@ -202,10 +204,12 @@ devicetree:
>  			if ($<flags>-1 & DTSF_PLUGIN) {
>  				if (is_ref_relative($2))
>  					ERROR(&@2, "Label-relative reference %s not supported in plugin", $=
2);
> -				add_orphan_node($1, $3, $2);
> +				/* A path is in the base tree and a label may be */
> +				if ($2[0] =3D=3D '/' || !target)
> +					add_orphan_node($1, $3, $2);
> +				else
> +					merge_nodes(target, $3);
>  			} else {
> -				struct node *target =3D get_node_by_ref($1, $2);
> -
>  				if (target)
>  					merge_nodes(target, $3);
>  				else
> diff --git a/tests/merge-label-braces.dts b/tests/merge-label-braces.dts
> new file mode 100644
> index 0000000..569e7f8
> --- /dev/null
> +++ b/tests/merge-label-braces.dts
> @@ -0,0 +1,12 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +	label: node {
> +	};
> +};
> +
> +/* A label in the plugin itself is merged, however it is written */
> +&{label} {
> +	prop;
> +};
> diff --git a/tests/merge-label-order.dts b/tests/merge-label-order.dts
> new file mode 100644
> index 0000000..40fa668
> --- /dev/null
> +++ b/tests/merge-label-order.dts
> @@ -0,0 +1,17 @@
> +/dts-v1/;
> +/plugin/;
> +
> +&basenode {
> +	label: foo {
> +		p =3D "first";
> +	};
> +};
> +
> +/* The last definition wins */
> +&{label} {
> +	p =3D "second";
> +};
> +
> +&label {
> +	p =3D "third";
> +};
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 146d288..7f9a24a 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -804,6 +804,18 @@ dtc_tests () {
>      run_fdtget_test "/node" merge-labelled-plugin.test.dtb /__symbols__ =
newlabel
>      run_fdtget_test "value" merge-labelled-plugin.test.dtb /node prop
> =20
> +    # In a plugin, &{label} is the same as &label
> +    run_dtc_test -I dts -O dtb -o merge-label-braces.test.dtb \
> +	"$SRCDIR/merge-label-braces.dts"
> +    run_fdtget_test "" merge-label-braces.test.dtb /node prop
> +    run_fdtget_test "node" merge-label-braces.test.dtb -l /
> +
> +    # The last definition wins, with no fragment for &{label}
> +    run_dtc_test -I dts -O dtb -o merge-label-order.test.dtb \
> +	"$SRCDIR/merge-label-order.dts"
> +    run_fdtget_test "third" merge-label-order.test.dtb /fragment@0/__ove=
rlay__/foo p
> +    run_fdtget_test "fragment@0\n__fixups__" merge-label-order.test.dtb =
-l /
> +
>      # In a plugin, / { ... } and &{/} { ... } are not the same thing
>      run_dtc_test -I dts -O dtb -o merge-root-plugin.test.dtb \
>  	"$SRCDIR/merge-root-plugin.dts"
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--SRz3y8J5zTssC0xz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGfTIACgkQzQJF27ox
2GfVww/+JAmzzkDwsjlr/5GM1lebOFUOizGJOIVRtwO5Nbi8Vrkp+A6DkyTbOh0W
CL1Lojb3GPrx2fE/glKnXBoHGuJM/vEZvVGUnj+67TB/gqekl7AvIvla1RQGqN3R
bZ/erpGkfVnvftWfQ+46s9plpNLcZ4TPtLn2iDG3MpMAOv7xFm87/m3kJywbAoLb
CeQcRHuHGV8zDJpD2kX9v3dCW6mYaPg0czFykku9r+P/R+9+s9kiXdk9RUn7LEG2
WDxtD599KEU6mq+ZRCYJFCbpFK01EGniyjESJJGDXlW7nzjzP0H03cHgPR3/jiAU
e4F0YJbpgJomInyVbIe+dpEpFbufqNr6R7Bdd+MP1VBzh8vrHgNa3Mp1ikfSoZ5I
idQz0b1wLwDFOUY6H3KA1Opfwi6+yueZvGR2WnZ6k53YpLUT+FqX2Ef9/GxFOIQL
xVOWB/YxVCXad11sivpjsRocr5j9xLwJAERsrbqkIFTDt+mvtp/lubO3p7mYaE7L
K5uWnB0WuZ3+DXF0DuACPY3sXhKseqOLLpQ7LIno+R0sqIvCujiPW00YwG5LsEH7
zW5PCBMxUw2qL0h+Lbh41aPu1VldgHzyfSqjhTJGOJz+QHxBVtZQhST2x08w8sy6
HbKrg2x4/+ics2oCXFe5cMxhESi3D/3HqwiP/4K3RLelXT5DQSU=
=as4b
-----END PGP SIGNATURE-----

--SRz3y8J5zTssC0xz--
