From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 5/5] treesource: Maintain phandle label/path on output
Date: Mon, 11 Oct 2021 16:21:43 +1100
Message-ID: <YWPJ5y9nMlW43pbd@yekko>
References: <20210727183023.3212077-1-robh@kernel.org>
 <20210727183023.3212077-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wbM4VMEH1miXs86P"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1633936793;
        bh=9nnNNmWLOwBxK1FCmHkAGKbNfqq+2VxKgK8lxTMZVzs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DR2l1PqoOaziSfTVDga3plssHI79Id6rRNn/KxUH2okKUtroCUYooAdlRndL7NRZF
         FlcPQ2qtqzYb413hI1IHsBRq5NMechHE/kHTtZkCcPypRaEJ8htsd9kjvaioKr/oPH
         pDumT88FsVZAd0d7LDV86byLEWHDr2euNi0feTZs=
Content-Disposition: inline
In-Reply-To: <20210727183023.3212077-6-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--wbM4VMEH1miXs86P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 12:30:23PM -0600, Rob Herring wrote:
> The dts output will just output phandle integer values, but often the
> necessary markers are present with path or label references. Improve the
> output and maintain phandle label or path references when present in dts
> output.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I actually like this one, regardless of the rest, so I've applied it.

> ---
> v3:
>  - Add phandle properties to type-preservation test
> v2:
>  - New patch
> ---
>  tests/type-preservation.dt.yaml |  3 +++
>  tests/type-preservation.dts     |  3 +++
>  treesource.c                    | 25 +++++++++++++++++++------
>  3 files changed, 25 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/type-preservation.dt.yaml b/tests/type-preservation.dt=
=2Eyaml
> index ee8cfdebe9be..a0cc64cc4b69 100644
> --- a/tests/type-preservation.dt.yaml
> +++ b/tests/type-preservation.dt.yaml
> @@ -13,8 +13,11 @@
>      int64: [!u64 [0x200000000]]
>      int64-array: [!u64 [0x100000000, 0x0]]
>      a-string-with-nulls: ["foo\0bar", "baz"]
> +    a-phandle: [[!phandle 0x1]]
> +    a-phandle-with-args: [[!phandle 0x1, 0x0, 0x1], [!phandle 0x1, 0x2, =
0x3]]
>      subsubnode:
>        compatible: ["subsubnode1", "subsubnode"]
> +      phandle: [[0x1]]
>        subsubsubnode:
>          compatible: ["subsubsubnode1", [0x1234], "subsubsubnode"]
>  ...
> diff --git a/tests/type-preservation.dts b/tests/type-preservation.dts
> index 3e380ba6c8a5..921ea21172d1 100644
> --- a/tests/type-preservation.dts
> +++ b/tests/type-preservation.dts
> @@ -16,9 +16,12 @@
>  		int64 =3D /bits/ 64 <0x200000000>;
>  		int64-array =3D /bits/ 64 <0x100000000 0x00> int64_array_label_end:;
>  		a-string-with-nulls =3D "foo\0bar", "baz";
> +		a-phandle =3D <&subsub1>;
> +		a-phandle-with-args =3D <&subsub1 0x00 0x01>, <&subsub1 0x02 0x03>;
> =20
>  		subsub1: subsubnode {
>  			compatible =3D "subsubnode1", "subsubnode";
> +			phandle =3D <0x01>;
> =20
>  			subsubsub1: subsubsubnode {
>  				compatible =3D "subsubsubnode1", <0x1234>, valuea: valueb: "subsubsu=
bnode";
> diff --git a/treesource.c b/treesource.c
> index db2ff69f5ccb..33fedee82d58 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -208,26 +208,39 @@ static void write_propval(FILE *f, struct property =
*prop)
>  		size_t chunk_len =3D (m->next ? m->next->offset : len) - m->offset;
>  		size_t data_len =3D type_marker_length(m) ? : len - m->offset;
>  		const char *p =3D &prop->val.val[m->offset];
> +		struct marker *m_phandle;
> =20
>  		if (is_type_marker(m->type)) {
>  			emit_type =3D m->type;
>  			fprintf(f, " %s", delim_start[emit_type]);
>  		} else if (m->type =3D=3D LABEL)
>  			fprintf(f, " %s:", m->ref);
> -		else if (m->offset)
> -			fputc(' ', f);
> =20
> -		if (emit_type =3D=3D TYPE_NONE) {
> -			assert(chunk_len =3D=3D 0);
> +		if (emit_type =3D=3D TYPE_NONE || chunk_len =3D=3D 0)
>  			continue;
> -		}
> =20
>  		switch(emit_type) {
>  		case TYPE_UINT16:
>  			write_propval_int(f, p, chunk_len, 2);
>  			break;
>  		case TYPE_UINT32:
> -			write_propval_int(f, p, chunk_len, 4);
> +			m_phandle =3D prop->val.markers;
> +			for_each_marker_of_type(m_phandle, REF_PHANDLE)
> +				if (m->offset =3D=3D m_phandle->offset)
> +					break;
> +
> +			if (m_phandle) {
> +				if (m_phandle->ref[0] =3D=3D '/')
> +					fprintf(f, "&{%s}", m_phandle->ref);
> +				else
> +					fprintf(f, "&%s", m_phandle->ref);
> +				if (chunk_len > 4) {
> +					fputc(' ', f);
> +					write_propval_int(f, p + 4, chunk_len - 4, 4);
> +				}
> +			} else {
> +				write_propval_int(f, p, chunk_len, 4);
> +			}
>  			break;
>  		case TYPE_UINT64:
>  			write_propval_int(f, p, chunk_len, 8);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wbM4VMEH1miXs86P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFjyecACgkQbDjKyiDZ
s5IQWQ/+OOHn8uFUPt9Du1vVg+bI7AVb18vNfwVmMjq/jBZNM2lysAm0J9SdBNxY
jj97aIVMSpfRPZiILa35mVFW7IWICCwzVyPsrlFGfY5SvDPJOjNEiTZIxYd9j7lM
QJFKaSKEpnRiZiR0LeWKSWf6lXLB9Ly4nnRV3vIqBXCNrGn5KFHuuF0BGT9VOuSd
FjaZccKso3X6TUSxOCi5GQVEqXCNIdSPpz5YpOiMDaodcCermExMFeic5jdViy8z
dxTfBXID/9NplwKwezRZt1UJdQ7LBI57OTzXkoKTd3v8qSxbQlYar5gGgg1kznaM
T9yyAYLg1hSqlNWCUGTly+LLChwI9AqO1LxHRjYDWTgqjpVY1fzd1YFHbOTupOV1
58xiC4bFajJkdtmR1Abw1Lr1JkFEYBBz6Hph0/viwNhyUF/3de/v4+mrYb/QDYPG
qOtY+Y0MTiKOVdLikOwQGKzV4IBXPvwspo/MvpxJAjjSmJoJC3dvmdNy5ObR1vTT
ywm1vckgVbSdMdGg1tqnTDA2Ab9t25HN6r8OKE123waCDJr1k9wfirJ/XM1CGmEI
t2pehK0mPbMu81z/oLpRVR3QqycSkSX2KU7CAbDn+zbQwp6oVrpdbmokWeYFrM3O
jDQx/hVeDeQZv2jFLyvPqoqsaRdKw2xbKiknY7mvX20GIcA2lfQ=
=JDd5
-----END PGP SIGNATURE-----

--wbM4VMEH1miXs86P--
