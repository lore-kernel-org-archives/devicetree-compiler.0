Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803692;
	b=DBTSqG56gAhhS874L0ZwK5e8XQV96fLd0VDCYZGohryZnw0RLMOVbAwBZ2UpFq4VxLjV
	 Rb5hSWG/B8Hn/VjqT2mbQIT84Gve6PuxWLUNYnPxgdTjP8tEsJAC/KC7E8slAWkAJn0IN
	 0FUXsHA5Sv4osQ4UVyXE2yDO+p7die3UDnrmFY7hKGg+GhD+pEirf5SV/8952lTp2RWLS
	 7cGl1E5ySWDDhfxVGlSfwifEckYc6BWeJeRtp24AhRZjBXWJtzNBTxsl26TWyeDd2KqhY
	 890AQLLXod3ZbtfIrrjBrW5ek4mKQU8davntf9DfXG6q05nHB9SJRssmg1pKwgPkYLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803692;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=7X+qy9T3oGGdD6efVmPsEVY+dCxd6H9k+PznF1fIUnI=;
	b=OVOMu4ypzGm7f+IsJIWStF0m19Kk9I5lwIZjTJ82wv0cJAc1OQpDo4uYLSGBSnzAcjkF
	 EqFQDcqnXYo7yelUgmOsor4hjAEDobi80pJiXiYe1zWZS94AYNrgQdXRahzJns3URrdCE
	 BorEnXKzjaGbJ4LhHHUTCJSVfZxZ3BCQg1IW6ye0nfDsfs+dtkdCok56uD7427a0LsCxQ
	 XJYJ2VeWqPmFPoQe2CdRZ/ChHkSKWxW14SMolwv+eqUcugyH9H9uPmLu2fEIkF0YOSXQ5
	 mKp4hWhOQ4N1IYKKB9nv2QDUa3Y1dbStK1L2JHbv7C2tuB6NwpMdJxzVQHMd2u/1uNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=EZxZCsVf;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B98606A882
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 04:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B98606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=EZxZCsVf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794803680;
	bh=7X+qy9T3oGGdD6efVmPsEVY+dCxd6H9k+PznF1fIUnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZxZCsVfuRS3U1DpBFxAmy1kXXqw5LwabcynixOK2v43SF2PkgaX4NYrcqyXIuLK0
	 OITdi/+6GzqiImkzQdGcYF7ZCoXyThKzqzw9IpP0dMamemNmEwjdapJ3h5AWtTMAFq
	 j89owXAbJHdWx9pcHjUkWCn7EqtrtxQM/LfLO93+1GrgIkVwfFIKImHsL2jS+XVgL6
	 fu6Wdp5MvTuo8w5QJoEbsCB3S0nr/r6d3y1haVSXsmgv69yqMZXFlew4EaP+LSJBa0
	 +EGummkPQkuBFgdO1v0fSHcu9rzsfGB8jOD+1d28YxYy8WmZlD+Ipy05NTn8Ppd/9j
	 9vJxt7FcXqb7Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jSZlN21Zjz4wSc; Mon, 16 Nov 2026 15:34:40 +1100 (AEDT)
Date: Mon, 16 Nov 2026 15:08:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 15/18] dtc: Merge the fragments of a dts file in main()
Message-ID: <avqButGgNI9ohbBy@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-16-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="rk1DSQJye3UT6ni+"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-16-sjg@chromium.org>

--rk1DSQJye3UT6ni+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:42PM -0700, Simon Glass wrote:
> We would like to run checks on each fragment of a dts file before it is
> merged, but that requires dt_from_source() to return the fragments
> unmerged, so that main() can decide what to do with them. At present
> they are merged at the end of the parse.
>=20
> Call merge_fragments() from main() instead, once the input is read. It
> does nothing for dtb or fs input, which has no fragments.
>=20
> When a reference cannot be resolved, dtc now reports 'Unable to merge
> input tree' rather than 'Syntax error parsing input tree', since the
> file was parsed successfully. Check for this message with
> test_label_ref.dts, since no test checks it at present.
>=20
> If the parser reports an error, dt_from_source() gives up before main()
> can merge the fragments. Merge them first in that case, so that any
> errors in the fragments are still reported. The merge-parse-error.dts
> test checks this, with a fragment which refers to a missing node,
> followed by a division by zero. Also check that dtc still gives up with
> 'Syntax error parsing input tree' in this case.
>=20
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractu=
s.seuss/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

This patch and the last are moving the merge in two stages.  Is there
a specific reason for that, or could they be folded together?

> ---
>=20
> Changes in v3:
> - Check the final message when the parser finds an error
>=20
> Changes in v2:
> - Update for merge_fragments() returning true on success
>=20
>  dtc-parser.y       | 2 --
>  dtc.c              | 2 ++
>  tests/run_tests.sh | 5 ++++-
>  treesource.c       | 5 ++++-
>  4 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 0ff04c7..33a0078 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -103,8 +103,6 @@ sourcefile:
>  	  headers memreserves devicetree
>  		{
>  			parser_output =3D build_dt_info($1, $2, NULL, $3, 0);
> -			if (!merge_fragments(parser_output))
> -				treesource_error =3D true;
>  		}
>  	;
> =20
> diff --git a/dtc.c b/dtc.c
> index e506837..73e5d76 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -299,6 +299,8 @@ int main(int argc, char *argv[])
>  	else
>  		die("Unknown input format \"%s\"\n", inform);
> =20
> +	if (!merge_fragments(dti))
> +		die("Unable to merge input tree\n");
>  	dti->outname =3D outname;
> =20
>  	if (depfile) {
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 0aaa29c..8391717 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -741,7 +741,8 @@ dtc_tests () {
>      run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.tes=
t.dtb
>      run_dtc_test -I dts -O dtb -o dtc_tree1_merge_path.test.dtb "$SRCDIR=
/test_tree1_merge_path.dts"
>      tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
> -    run_wrap_error_test $DTC -I dts -O dtb -o /dev/null "$SRCDIR/test_la=
bel_ref.dts"
> +    run_wrap_error_msg_test "Unable to merge input tree" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/test_label_ref.dts"
> =20
>      run_dtc_test -I dts -O dtb -o dtc_relref_merge.test.dtb "$SRCDIR/rel=
ref_merge.dts"
>      run_test relref_merge dtc_relref_merge.test.dtb
> @@ -805,6 +806,8 @@ dtc_tests () {
>  	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
>      run_wrap_error_msg_test "merge-parse-error.dts:15.12-15 Division by =
zero" \
>  	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
> +    run_wrap_error_msg_test "Syntax error parsing input tree" \
> +	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-parse-error.dts"
> =20
>      # A labelled reference to a node in a plugin adds the label to it
>      run_dtc_test -@ -I dts -O dtb -o merge-labelled-plugin.test.dtb \
> diff --git a/treesource.c b/treesource.c
> index bf648bf..3fb9d83 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -25,8 +25,11 @@ struct dt_info *dt_from_source(const char *fname)
>  	if (yyparse() !=3D 0)
>  		die("Unable to parse input tree\n");
> =20
> -	if (treesource_error)
> +	if (treesource_error) {
> +		/* Report any errors in the fragments as well, before giving up */
> +		merge_fragments(parser_output);

Not really sure if this is worth it.  It's not really *any* errors in
the fragments, just target errors and the like.  I'm pretty
comfortable not getting to that if there are more basic syntax errors.

>  		die("Syntax error parsing input tree\n");
> +	}
> =20
>  	return parser_output;
>  }
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--rk1DSQJye3UT6ni+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr6gboACgkQzQJF27ox
2GemhA//TWCG9evUzdXk1xC3rvQPEU0xZL5vZZD6OMVb5HG+4MD/os1zElu/NjTc
m3qvNEu9K1281Kcg6UNe3Eky9xQBSeLb5FfuO6JQIyEhYQu+tIwNxHrYjSf1t6Uc
hHvbW0+QvGeE4Ga+aeMXYdt9XS3LlHYh/tsYLVh8EgkfLrQff5I/IIZ4JkgOwMU3
IId/Uqcyztc4pAUSqxcRI/q1UF2dURb/1gBkAPKQWfIObkF6iB4xoYYyOUc2SwDF
jtjsZog6Dwf0MYObIYI0XDFSNIGgxB6RA0pVaVSBvppZ3AkvCZIRou8rxQCF5a/b
Aw4NG0uM75Erk9sY2ypY8P2KWYwhnxuZZoorbHJqLSvY4uXOk9iFf+xqaOLFvVSP
IN0KjH2AKEhwtdrnB52dLyaNSU/nQQh7rjup0xKtmkP2d7dqAYd/7dsiZ3TRideq
5j+a3yz6nXfJ52YNc+LSg3HFcHCmNu5uNxvgsp2miFxkliieJZjr4mvesGOL5xAn
K7nQx3my1hgYOK+hPMcoCRItg2ZKHdy2CIsUmJWI4X4RBCl6Miuqdi7+HAFyzAIY
sdbMS1LBtiXWmf0ckFkxhwWPlpIMLu5VoqahaqHPMxAOD6yxGDELDxwIKWyisGo4
VXe5vHKGr5ICP/V+029TFatEfwtUsrm+/3zT2P9XCr0FeLWbuYU=
=dOWS
-----END PGP SIGNATURE-----

--rk1DSQJye3UT6ni+--
