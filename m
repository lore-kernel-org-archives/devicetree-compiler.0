Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A0379
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Oct 2023 00:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Ooo4ccEJ"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA498F
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 17:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696984847;
	bh=FjQOaiBOEn4/Zl2mBf0bGkpK0HEADqFw9/KXBveD2Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ooo4ccEJHZ3L/WOYIzXvAio6M2LPHBaUJvB+hb7VujRdNs51DZptuD7Bz3mmABUlA
	 A4SmLgSf2AV7z9offRvfISUot8Sfa/XtB3/x+NIeRmDqINXGYeOpwUkbbQ+XIm8ese
	 xaXoWqWfXV7D6gYfEjvD4PmN/714MF8e6bLmBzvs=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S4v7z0Q5kz4xWf; Wed, 11 Oct 2023 11:40:47 +1100 (AEDT)
Date: Wed, 11 Oct 2023 11:40:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: devicetree-compiler@vger.kernel.org, Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3] libfdt: fdt_path_offset_namelen: Reject empty path
Message-ID: <ZSXvABeOnFmWbeGA@zatzit>
References: <20231010092822.qo2nxc3g47t26dqs@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ov8q3RkyckRk/5H7"
Content-Disposition: inline
In-Reply-To: <20231010092822.qo2nxc3g47t26dqs@google.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--ov8q3RkyckRk/5H7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 10:28:22AM +0100, Pierre-Cl=E9ment Tosi wrote:
> Reject empty paths and negative lengths, according to the DT spec v0.4:
>=20
>     The convention for specifying a device path is:
>         /node-name-1/node-name-2/node-name-N
>=20
>     The path to the root node is /.
>=20
> This prevents the access to path[0] from ever being out-of-bounds.
>=20
> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi@google.com>

Merged and pushed out, thanks.

> ---
> v2
>   - allow the check to be optimized out when ASSUME_VALID_INPUT
>   - add test coverage for empty paths and negative size
>   - remove redundant part of the quote in the commit message
> v3
>   - simplify condition in check_path_offset()
> ---
>  libfdt/fdt_ro.c     | 3 +++
>  tests/path_offset.c | 8 +++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index c4c520c..7567f52 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -255,6 +255,9 @@ int fdt_path_offset_namelen(const void *fdt, const ch=
ar *path, int namelen)
> =20
>  	FDT_RO_PROBE(fdt);
> =20
> +	if (!can_assume(VALID_INPUT) && namelen <=3D 0)
> +		return -FDT_ERR_BADPATH;
> +
>  	/* see if we have an alias */
>  	if (*path !=3D '/') {
>  		const char *q =3D memchr(path, '/', end - p);
> diff --git a/tests/path_offset.c b/tests/path_offset.c
> index 8e657af..ad8db83 100644
> --- a/tests/path_offset.c
> +++ b/tests/path_offset.c
> @@ -48,10 +48,13 @@ static void check_path_offset(void *fdt, const char *=
path, int offset)
>  	verbose_printf("Checking offset of \"%s\" is %d...\n", path, offset);
> =20
>  	rc =3D fdt_path_offset(fdt, path);
> +	if (rc =3D=3D offset)
> +		return;
> +
>  	if (rc < 0)
>  		FAIL("fdt_path_offset(\"%s\") failed: %s",
>  		     path,  fdt_strerror(rc));
> -	if (rc !=3D offset)
> +	else
>  		FAIL("fdt_path_offset(\"%s\") returned incorrect offset"
>  		     " %d instead of %d", path, rc, offset);
>  }
> @@ -102,6 +105,7 @@ int main(int argc, char *argv[])
>  	check_path_offset(fdt, "/subnode@2/subsubnode", subsubnode2_offset2);
> =20
>  	/* Test paths with extraneous separators */
> +	check_path_offset(fdt, "", -FDT_ERR_BADPATH);
>  	check_path_offset(fdt, "//", 0);
>  	check_path_offset(fdt, "///", 0);
>  	check_path_offset(fdt, "//subnode@1", subnode1_offset);
> @@ -110,6 +114,8 @@ int main(int argc, char *argv[])
>  	check_path_offset(fdt, "/subnode@2////subsubnode", subsubnode2_offset2);
> =20
>  	/* Test fdt_path_offset_namelen() */
> +	check_path_offset_namelen(fdt, "/subnode@1", -1, -FDT_ERR_BADPATH);
> +	check_path_offset_namelen(fdt, "/subnode@1", 0, -FDT_ERR_BADPATH);
>  	check_path_offset_namelen(fdt, "/subnode@1", 1, 0);
>  	check_path_offset_namelen(fdt, "/subnode@1/subsubnode", 10, subnode1_of=
fset);
>  	check_path_offset_namelen(fdt, "/subnode@1/subsubnode", 11, subnode1_of=
fset);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ov8q3RkyckRk/5H7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUl7voACgkQzQJF27ox
2GfUUBAAn2XcAJ3QfyMbwtikdRcKxYea5pN28FUAWZ+EV5iEadfDgE01H7JqU5HB
A0ZU8dEIxyKL9wAHLt41eqrIWHtYSP1Mdv2L66Sd0mpsTuSXjY+MD8HHhEfCoGTH
RA+waapwsojK8LxKegQomoBd/Et8rAqL4KXvI7yyTy9IKTIKqJ+ZXCoGemebm4MT
0g0WygMiXVcdZPw8FOtmjmOuMQ1e2Rv94Dnv1WCfPOHxZMLwgHvgrE/hoKaJ5pIW
k09A8kVYd5FpNgcowDnI4BYyGQnodRseP7k1aVPv/Eo4I+k+wofgabDD8gzchMx4
PQz3iET5aeXLEy2EsAVpVEwrEEZ9+9DyUSd28D3unLwPpGwdTohraEahIhUp5Eo+
qI2/ckWnqPCdDsk3SE7bSeiJ/yU9fbrJqMHh8XeZSQOv97dqXDgSr7V7jTZz3ooO
ZBs7eM4iC7ioh5eq3WPuHXEghni2IRSMp71OE/kBTmWfBEEY/64pyQYiEbLOsuCn
fzvGw4jGFXfFqtmIAZFbykJhO/k4A4NEz9w9BOBpJXRAz7t0l5PPQlSetRL/CtPH
DfQY8weUSY28P8y4emHb+jVTNc78iR79PYvhCCbNemuKbnL3e7mNtd3cmwDFnmCi
HzNzI52j+uJftebJ6VNDdD+eB1TmeEW5e5IiY0siunj9vTSgzLM=
=R5NG
-----END PGP SIGNATURE-----

--ov8q3RkyckRk/5H7--
