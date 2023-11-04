Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743D01864
	for <devicetree-compiler@vger.kernel.org>; Sat,  4 Nov 2023 02:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Br6mkdh7"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 862D7D54
	for <devicetree-compiler@vger.kernel.org>; Fri,  3 Nov 2023 19:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1699063421;
	bh=iUTvlU69oqE3sIHhwEda3BSm03M9G8OpPQWjCCBd8OY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Br6mkdh7t9Q34ygGLp01awFgj4RLGe5q3fh7qvZQX8B09ILXsvchEeX1ok8tnEa+H
	 CkbO+djMBXCbCrBTo9LgvmmyIo+998XAlTj1/QEkWt/p0rGuB6rjcvEH+ErpTBCPYb
	 KT4UPX0JRcVVDZkOsRclLc616XEIa4Az7vaqXiZ8=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4SMgrY5XV1z4xWB; Sat,  4 Nov 2023 13:03:41 +1100 (AEDT)
Date: Sat, 4 Nov 2023 12:49:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Rob Herring <robh@kernel.org>
Cc: devicetree-compiler@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] treesource: Restore string list output when no type
 markers
Message-ID: <ZUWjRqzZl+F2cu2A@zatzit>
References: <20231027142901.2536622-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rtFe44Lbjhb1NF1a"
Content-Disposition: inline
In-Reply-To: <20231027142901.2536622-1-robh@kernel.org>


--rtFe44Lbjhb1NF1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 09:29:01AM -0500, Rob Herring wrote:
> When the DTS output has no type markers, we have to guess the type. Prior
> to commit 32b9c6130762 ("Preserve datatype markers when emitting dts
> format"), instances of string lists would be delimited. Since then, a
> single string with embedded "\0"s are emitted. An embedded "\0" is valid
> for DTS files, but that's a rare exception and lists of strings are the
> overwhelming majority. Restore the prior behavior.
>=20
> stringlist.dts is reused for testing this, but needs a couple of tweaks
> in order to match the dts output.
>=20
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thanks.

> ---
>  tests/run_tests.sh   |  4 ++++
>  tests/stringlist.dts |  4 ++--
>  treesource.c         | 24 ++++++++++++++++++++++++
>  3 files changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index c4f8b9b25577..bb2ec959a6e4 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -634,6 +634,10 @@ dtc_tests () {
>      done
> =20
>      # Check -Odts preserving type information
> +    run_dtc_test -I dts -O dtb -o stringlist.test.dtb "$SRCDIR/stringlis=
t.dts"
> +    run_dtc_test -I dtb -O dts -o stringlist.test.dts stringlist.test.dtb
> +    run_wrap_test cmp "$SRCDIR/stringlist.dts" stringlist.test.dts
> +
>      for tree in type-preservation.dts; do
>          run_dtc_test -I dts -O dts -o $tree.test.dts "$SRCDIR/$tree"
>          run_dtc_test -I dts -O dts $tree.test.dts
> diff --git a/tests/stringlist.dts b/tests/stringlist.dts
> index 1e4d3140458f..c06fcd498191 100644
> --- a/tests/stringlist.dts
> +++ b/tests/stringlist.dts
> @@ -2,8 +2,8 @@
> =20
>  / {
>  	compatible =3D "test-strings";
> -	#address-cells =3D <2>;
> -	#size-cells =3D <2>;
> +	#address-cells =3D <0x02>;
> +	#size-cells =3D <0x02>;
> =20
>  	device {
>  		compatible =3D "foo", "bar";
> diff --git a/treesource.c b/treesource.c
> index 9b17b3768a66..ae15839ba6a5 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -139,6 +139,28 @@ static const char *delim_end[] =3D {
>  	[TYPE_STRING] =3D "",
>  };
> =20
> +static void add_string_markers(struct property *prop)
> +{
> +	int l, len =3D prop->val.len;
> +	const char *p =3D prop->val.val;
> +
> +	for (l =3D strlen(p) + 1; l < len; l +=3D strlen(p + l) + 1) {
> +		struct marker *m, **nextp;
> +
> +		m =3D xmalloc(sizeof(*m));
> +		m->offset =3D l;
> +		m->type =3D TYPE_STRING;
> +		m->ref =3D NULL;
> +		m->next =3D NULL;
> +
> +		/* Find the end of the markerlist */
> +		nextp =3D &prop->val.markers;
> +		while (*nextp)
> +			nextp =3D &((*nextp)->next);
> +		*nextp =3D m;
> +	}
> +}
> +
>  static enum markertype guess_value_type(struct property *prop)
>  {
>  	int len =3D prop->val.len;
> @@ -164,6 +186,8 @@ static enum markertype guess_value_type(struct proper=
ty *prop)
> =20
>  	if ((p[len-1] =3D=3D '\0') && (nnotstring =3D=3D 0) && (nnul <=3D (len-=
nnul))
>  	    && (nnotstringlbl =3D=3D 0)) {
> +		if (nnul > 1)
> +			add_string_markers(prop);
>  		return TYPE_STRING;
>  	} else if (((len % sizeof(cell_t)) =3D=3D 0) && (nnotcelllbl =3D=3D 0))=
 {
>  		return TYPE_UINT32;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rtFe44Lbjhb1NF1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmVFoy8ACgkQzQJF27ox
2Gfagw/6A0Dsuo1U99uhFqitQiQzd6U5PazX6j8o6gBnpxA5Hu7bya5abcuyS1Ya
dPLymGNnf8BjEg311YRTxlxs980yNTjYKE4JE1Cbt0ApVBzkvRb8//54pAe11hKX
YRjVVCxs9OKpLLox+lQ9+0CebNAbc75DUCyRlD3pCQ8Pq0bfGvuEgNRj8JcgC2QF
26ldgdqCeU5C6f7LHXIbNtS2eg8UR6c6OoMpiLsq2EuUqNvsLlurbCaqKbiN0qc5
owYlBMIGI75kqeKP0Y3MbHdk8ajK3EH+e4thmufT1EYKqCUcMIXWyZUWUNU814nP
VnyeJaeU0K+5eZm0ugljEGwoZ5SeHKRKcByepKkjj4G5ndd8qVI3C5972ujwz3l9
ufdQSpLbmAqwX2PX9bEhOlOB8yNJMWkrXYgBaBFT/DELBwpZCiCn+GBZZNpZXNyh
cdK5SywjY1Iy9b6Ikc1ctJpQB7tGeHNvJZsC4WkXXf12C5J31uYR47Hrd18LTpKk
jzYMPgWJH1VXv3FbhtVPWC5J+/Bhd+TWOGh/P3o68W0zPNgVo52zEqC1RLAt995W
jOG9mIjYHAlscd6YMVkuegCnC+ZzSJsfO2eXmn7z48yTAemIJluy/zhHclr/zMJ/
l2k095gVtmHcxXQU2NhlAuwMvFyNUTI21UmAObnFt7+3BH/bmUk=
=Bqbs
-----END PGP SIGNATURE-----

--rtFe44Lbjhb1NF1a--
