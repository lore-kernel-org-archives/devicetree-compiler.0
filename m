Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239EF388
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Oct 2023 00:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="QN8hLEae"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F99A92
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 17:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696984679;
	bh=dfdWf/CJnuK0pSGcuk+ZXXt0lFedfN5HRbtxXlUoGlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QN8hLEaeQ6KUbjAHV0N7D8VSxrQmT3EtOaZBuHecPJV2J83UhKAPetcf8SaYcrpmO
	 rnjDpBgSBjay7yy4MMjCFBYnD2jyCnb0oorCF0Ga2ODI7BzAUExRDGmaMxcP1cu8BG
	 OI+uYMyacegRCcFcXDfgd+dp3KSgd080LdrWmxGc=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S4v4l4Gcfz4xWY; Wed, 11 Oct 2023 11:37:59 +1100 (AEDT)
Date: Wed, 11 Oct 2023 11:35:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v3] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <ZSXt6HtGt78uGQl5@zatzit>
References: <20231010092725.63h7c45p2fnmj577@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KCfbeTsRwzuN58D+"
Content-Disposition: inline
In-Reply-To: <20231010092725.63h7c45p2fnmj577@google.com>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--KCfbeTsRwzuN58D+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 10:27:25AM +0100, Pierre-Cl=E9ment Tosi wrote:
> Ensure that the alias found matches the device tree specification v0.4:
>=20
>     Each property of the /aliases node defines an alias. The property
>     name specifies the alias name. The property value specifies the full
>     path to a node in the devicetree.
>=20
> This protects against a stack overflow caused by
>=20
>     fdt_path_offset_namelen(fdt, path, namelen)
>=20
> calling
>=20
>     fdt_path_offset(fdt, fdt_get_alias_namelen(fdt, path, namelen))
>=20
> leading to infinite recursion on DTs with "circular" aliases.
>=20
> This fix was originally written by Mike McTernan for Android in [1].
>=20
> [1]: https://android.googlesource.com/platform/external/dtc/+/9308e7f9772=
bd226fea9925b1fc4d53c127ed4d5
>=20
> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi@google.com>

Thanks, applied, with Mike McTernan's ack folded in.

>=20
> ---
> v2
>   - replace memchr('/') with check on last character
>   - add test coverage of a self-referencing alias
>   - drop redundant test case on alias to non-absolute path
>   - reference the DT spec and AOSP patch in the commit message
>   - rephrase the infinite recursion case in the commit message
> v3
>   - swap (len > 0) and (alias) checks to better align with the API
>   - point the "relative" alias to a path that exists in the test DT
>   - simplify the infinite recursion case in the commit message
> ---
>  libfdt/fdt_ro.c   | 11 ++++++++++-
>  tests/aliases.dts |  4 ++++
>  tests/get_alias.c | 14 +++++++++++++-
>  3 files changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index c4c520c..9fe2f49 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -537,7 +537,16 @@ static const void *fdt_path_getprop_namelen(const vo=
id *fdt, const char *path,
>  const char *fdt_get_alias_namelen(const void *fdt,
>  				  const char *name, int namelen)
>  {
> -	return fdt_path_getprop_namelen(fdt, "/aliases", name, namelen, NULL);
> +	int len;
> +	const char *alias;
> +
> +	alias =3D fdt_path_getprop_namelen(fdt, "/aliases", name, namelen, &len=
);
> +
> +	if (!can_assume(VALID_DTB) &&
> +	    !(alias && len > 0 && alias[len - 1] =3D=3D '\0' && *alias =3D=3D '=
/'))
> +		return NULL;
> +
> +	return alias;
>  }
> =20
>  const char *fdt_get_alias(const void *fdt, const char *name)
> diff --git a/tests/aliases.dts b/tests/aliases.dts
> index 853479a..03ed675 100644
> --- a/tests/aliases.dts
> +++ b/tests/aliases.dts
> @@ -5,6 +5,10 @@
>  	#size-cells =3D <0>;
> =20
>  	aliases {
> +		empty =3D "";
> +		loop =3D "loop";
> +		nonull =3D [626164];
> +		relative =3D "s1/subsubnode";
>  		s1 =3D &sub1;
>  		ss1 =3D &subsub1;
>  		sss1 =3D &subsubsub1;
> diff --git a/tests/get_alias.c b/tests/get_alias.c
> index fb2c38c..d2888d6 100644
> --- a/tests/get_alias.c
> +++ b/tests/get_alias.c
> @@ -21,9 +21,16 @@ static void check_alias(void *fdt, const char *path, c=
onst char *alias)
> =20
>  	aliaspath =3D fdt_get_alias(fdt, alias);
> =20
> -	if (path && !aliaspath)
> +	if (!path && !aliaspath)
> +		return;
> +
> +	if (!aliaspath)
>  		FAIL("fdt_get_alias(%s) failed\n", alias);
> =20
> +	if (!path)
> +		FAIL("fdt_get_alias(%s) returned %s instead of NULL",
> +		     alias, aliaspath);
> +
>  	if (strcmp(aliaspath, path) !=3D 0)
>  		FAIL("fdt_get_alias(%s) returned %s instead of %s\n",
>  		     alias, aliaspath, path);
> @@ -36,9 +43,14 @@ int main(int argc, char *argv[])
>  	test_init(argc, argv);
>  	fdt =3D load_blob_arg(argc, argv);
> =20
> +	check_alias(fdt, NULL, "empty");
> +	check_alias(fdt, NULL, "nonull");
> +	check_alias(fdt, NULL, "relative");
>  	check_alias(fdt, "/subnode@1", "s1");
>  	check_alias(fdt, "/subnode@1/subsubnode", "ss1");
>  	check_alias(fdt, "/subnode@1/subsubnode/subsubsubnode", "sss1");
> =20
> +	check_alias(fdt, NULL, "loop"); // Might trigger a stack overflow
> +
>  	PASS();
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KCfbeTsRwzuN58D+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUl7eEACgkQzQJF27ox
2Gd6pA//UyUyb+hOe88w7h//VHeiQ+7dXL8yEVM/S93riompDjgoTa5vVJl7c7qc
sPcYj3SPSuPsK1h4UBheVNySIGoeToaMyU2poc7tPVJ7Q6TeoG1G69dPZ+j2Z/N5
pYXUKWd9EgaZgwZ3tu1SGXyyCp9nWDXYviYAHgEfy9b03BNztCKQuPVd9WyRRDs9
J139eUJ4BwBmdpJPgXnpGTZrpEEvnsVTX/vdA4jla9vTpzQPhcxAzjtyixS2rBH1
8WJyqS/bn1RnP9EZBb81V4D3DgvUNmi6tNYvPS+gGphVZLyhxGa0hnUvlCTbCRsG
AbgpmRSRHiRao2owr/uqW7N31CMvS0TZxrmEUew1BEGySaHHvvOpaCbB7tqAkge2
yt8QpYo9Ziw2gYFzIpdb0EkHn8hAZnAGsLUEBhd3cSRgr3aRjx1C6Bz8igOm2YNR
iUxhCZBwlxoJEoDidNyhOPoJ39cQ9Z42/Z81UYIrnTYpJPZEZgXJVRvEytTK08+7
jhLHKXtJJxfWOH9E8ADYTSkCImr87N1ZyDK2YaJ6CheHxGDwSMCfyMW13cpZ2grG
fczqxIAxeIAPQnIi9YfeMVTbsd0Cy7Qqu+ySaFJ7VxX4yQFZaxTdWlSsI5wixVgj
igUytD2bRiCujbAcQ7MA0OOQRW+nI4IRTBqg+vCH3I5RZyRylfw=
=ybVI
-----END PGP SIGNATURE-----

--KCfbeTsRwzuN58D+--
