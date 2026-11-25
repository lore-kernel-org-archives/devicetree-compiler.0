Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588821;
	b=fAZPT2uBw4HYkvkUZxhMSi+3CosopRtpJvQqHj67hOrlHiixQiSHFFNGJibaqDRp4jql
	 nDmj1gzWFiJ9sqwoBZ0AyjKf3O8wU7AEj1KtW2++0vovvI1Br1In1JIDx4EWoCsu6OZEO
	 5nqjz2VA7XJWjxklstaPCgferzsxmYs8itdJKJvt531z97hBHAC80XneWtmUPBdJDgzyK
	 31Azp70IqWg7ctatUL1Cm7H8o3Maw8U69fLw1bS4SlaYY+Ayp7v6kxrQJo8tfgWVPGAO4
	 2mXk7VDBED3Ct5JqPgoWdcWu65YWTmDA6+xXSyPK5+TEapbhmnKHLcfgpZ/pUPDbJVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588821;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Ck3XqZJ7l7BJ9nzxihF5h0fwqysmv8ReIYGknbGuS20=;
	b=3DP/RyCgqv3GL27b+2nD0qwKMxo1ODWtvLI4etoI0yKVreqnnaKcC66Ld0mM6xLJoXOp
	 HrXgjrYm9TeemRa8mdSBawLYfwWPctunAPGUg9dWSJk2Qa7m2JFpjjyD719U1VQcr+6IQ
	 yCl49yleJ+sMXRbzJ8By2TNkNR0hOdtewRxTQ+j2Ml+5KELWDt/NGodzmH84RqpywD5KY
	 gt73NjcwGbXyPxQ6lnMUqeworRWzarpp1gSQ9+3xYIu3nTM5rn30xMl2pKBGSFNW0AKlC
	 jBSmNX/gfR87Y6pXn1UD8iDJU4PCFfHKpjnZ/rwuDWIRJn8b6djaXDCrnnP/U/wJWZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=jhLakLoc;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5912B606A326
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 06:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5912B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=jhLakLoc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795588818;
	bh=Ck3XqZJ7l7BJ9nzxihF5h0fwqysmv8ReIYGknbGuS20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhLakLocH5qsZLV0mI8p2FGAcR8JvHH3WmgTC5M0ezIkcj+3DxHSuMLPYzJj+iakI
	 1Og/qsaTKjPB4TtmBI0Ahv8M5T0vfp4GDXhgv8Behs9kV+caDBKJgE/tdiFKfErNF2
	 24ZPAl9nsC5HVKi8lX/vE6nKbP93yTfja1SJkBr3FH6TKBMb2dMNUkw2BKpgWM0WVb
	 5lig4ErAGozJjNaJS/wdlo/1q2I1MGZA1hPfM09+zpQlUEB3nuZ7esnFD8WCRiFb7V
	 5EcRyb0jhF6N97NYUyfYnpk6PpSDAeh9Sjk39nsN/RhT1OX2vQgQQKdcPcdbTB4fr4
	 t67XZJA+ykV+Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ96B3ffMz4wMC; Wed, 25 Nov 2026 17:40:18 +1100 (AEDT)
Date: Wed, 25 Nov 2026 17:21:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 09/10] dtc: Move labelled-reference handling out of
 the grammar
Message-ID: <awZ-fxjHSD-ITpug@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-10-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="ou0ZeF3et8B4xlPU"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-10-sjg@chromium.org>

--ou0ZeF3et8B4xlPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:58:03PM -0700, Simon Glass wrote:
> The grammar action for a top-level label: &ref { ... } holds its merge
> logic, which adds the label to the node referred to.
>=20
> Move it into merge_ref(), passing it a struct fragment with the label.
>=20
> The output does not change. In a plugin, the error for a label-relative
> reference now gives the position of the reference rather than the label,
> since the problem is with the reference. Update the
> merge-labelled-relative.dts test to match.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
> Changes in v4:
> - Explain why a fragment which adds a label does not go in an overlay
> - Free the fragment after merging it
> - Report the label-relative error at the reference, not the label
>=20
> Changes in v2:
> - Combine merge_labelled_ref() into merge_ref()
> - Use dt_ref instead of fragment_ref
>=20
>  dtc-parser.y       | 14 +++++---------
>  livetree.c         | 11 ++++++++---
>  tests/run_tests.sh |  2 +-
>  3 files changed, 14 insertions(+), 13 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index c85b77d..6f7ef24 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -180,16 +180,12 @@ devicetree:
>  		}
>  	| devicetree DT_LABEL dt_ref nodedef
>  		{
> -			struct node *target =3D get_node_by_ref($1, $3);
> -
> -			if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
> -				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3=
);
> +			struct fragment *f;
> =20
> -			if (target) {
> -				add_label(&target->labels, $2);
> -				merge_nodes(target, $4);
> -			} else
> -				ERROR(&@3, "Label or path %s not found", $3);
> +			f =3D build_fragment_ref($2, $3, &@3, $4);
> +			if (!merge_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error =3D true;
> +			free_fragment(f);
>  			$$ =3D $1;
>  		}
>  	| devicetree dt_ref nodedef
> diff --git a/livetree.c b/livetree.c
> index 290467f..cf6849a 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -541,10 +541,13 @@ bool is_ref_relative(const char *ref)
>  }
> =20
>  /*
> - * Merge a fragment which refers to a label or path into the node it ref=
ers to.
> + * Merge a fragment which refers to a label or path into the node it ref=
ers to,
> + * adding any label in the fragment to that node.
>   *
>   * In a plugin, a path always refers to the base tree and a label may do=
 so, if
> - * it is not found. In both cases, the fragment becomes an overlay fragm=
ent.
> + * it is not found. In both cases, the fragment becomes an overlay fragm=
ent,
> + * unless it adds a label, since dtc cannot put a label on the target of=
 an
> + * overlay fragment.

This doesn't seem quite right.  It looks like we ignore the label in
that case, whereas we should throw an error, since we can't create a
dtbo which does what was requested.

>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> @@ -561,7 +564,7 @@ bool merge_ref(struct node *dt, struct fragment *f, b=
ool plugin)
>  				     f->ref);
>  			ok =3D false;
>  		}
> -		if (f->ref[0] =3D=3D '/' || !target) {
> +		if (!f->label && (f->ref[0] =3D=3D '/' || !target)) {
>  			/* Add a fragment@N node for the reference */
>  			add_orphan_node(dt, f->node, f->ref);
>  			return ok;
> @@ -573,6 +576,8 @@ bool merge_ref(struct node *dt, struct fragment *f, b=
ool plugin)
>  			     "Label or path %s not found", f->ref);
>  		return false;
>  	}
> +	if (f->label)
> +		add_label(&target->labels, f->label);
>  	merge_nodes(target, f->node);
> =20
>  	return ok;
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 7f9a24a..62732a4 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -781,7 +781,7 @@ dtc_tests () {
>  	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref.dts"
>      run_wrap_error_msg_test "merge-first-ref-relative.dts:5.15-7.3 Label=
-relative reference label/node not supported in plugin" \
>  	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-first-ref-relative.dts"
> -    run_wrap_error_msg_test "merge-labelled-relative.dts:8.1-10 Label-re=
lative reference baselabel/subnode not supported in plugin" \
> +    run_wrap_error_msg_test "merge-labelled-relative.dts:8.11-31 Label-r=
elative reference baselabel/subnode not supported in plugin" \
>  	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-labelled-relative.dts"
>      run_wrap_error_msg_test "merge-path-relative.dts:8.1-18 Label-relati=
ve reference baselabel/node not supported in plugin" \
>  	$DTC -I dts -O dtb -o /dev/null "$SRCDIR/merge-path-relative.dts"
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ou0ZeF3et8B4xlPU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGfn8ACgkQzQJF27ox
2GfTpBAAp8wzM7e2LacUCi9JU6LOESSwxKrrwc1+iBKapW9/xJ5so4sre9WfmX7W
lyo6rkptwnJBWnuMpyUfKIWRikfmvUIarXH54yl5/lPrHkkR8+heHtFkAdhrish0
xXeQHWcRCH/7OMaukzln9u3d6aiOBR8OSh1hnbKVaPDBzMLA1m6kVY1oMGByQY9k
5cwMcQzP7tFGgxisQJsuaCjtVnHQdzi9WZD8ZAnPRtKrW8talHGr4jbCfM9MRCiu
G5coTcv6zR9PZGk5T9uSwqEccOU6eVWtzAvneiZUewra07BQjLDpsjY3xe4pxnx/
jfB8zcflW05ULSKdIYbHsLwmMOElPbFWiS9JnbJTYKhWzeTNT/w5NGsxewPYIy45
TvreD9lSgJQT6wmNxVREw7A8N/9jr1IPP+RYOAlnGzenWm8GysSFg7lYJkfdvJfQ
d+aiuGJH1/zRnSidbk9bQIBxKGCDxlD9FVCYxR6VfiStCVWzys3JReTAzIfXU9WW
mmR1DfyGH8URauq9A9qv1WkGoUhrtUmgrccUDTGXuoTXdpnPO2cfw54wt0Jvj8wA
B65rowSh2WqVsGzxJa3yElczxn3hDn1bbmK76XLyNuid++sL5K3SdZGw77fIkJjY
whlKhMH9lw5MM/kMHS3IspHFik3LIzLax5ihw5e53Qj9222MPoc=
=sTLj
-----END PGP SIGNATURE-----

--ou0ZeF3et8B4xlPU--
