Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBEC46B8
	for <devicetree-compiler@vger.kernel.org>; Sun,  8 Oct 2023 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="gdWjbVVo"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED5CB9
	for <devicetree-compiler@vger.kernel.org>; Sun,  8 Oct 2023 00:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696749221;
	bh=tjKPWofa7idX/vlMCL/0IoO1lU3doGVoQerlULOmSm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdWjbVVosRvH9zcWSgwQJwpU6Nr1cbBSog6+jcfOWI78OsfMZALPi2XufDoZlmfgZ
	 5qDD+Rw9/QFlXwX+ElCG65OvKgaaznx4VNyQsLBbNWL8dVWNwYPqwuTi7BcPybgkHB
	 xFLxyovr+IL8fuL1GcQKYFneW2QQbyMHTybuaRho=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S3D0j3sSqz4xF5; Sun,  8 Oct 2023 18:13:41 +1100 (AEDT)
Date: Sun, 8 Oct 2023 18:13:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <ZSJWkT3Kr3u5JWdy@zatzit>
References: <20231007110710.i2oj24oirdtyt5m4@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+zAUAMuZPqlYQtqk"
Content-Disposition: inline
In-Reply-To: <20231007110710.i2oj24oirdtyt5m4@google.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--+zAUAMuZPqlYQtqk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 07, 2023 at 12:07:10PM +0100, Pierre-Cl=E9ment Tosi wrote:
> Ensure that the alias found is valid i.e.
>=20
>     An alias value is a device path and is encoded as a string.
>     The value represents the full path to a node, ...

Where's that quote from?  That is typically the case, but I think that
at least back in the old OF days, aliases referring to other aliases
was allowed.  Even if it's not strictly correct in modern usage, I'd
prefer to allow that usage if it's not too difficult to accomplish.

> This protects against a stack overflow (fdt_path_offset_namelen() calls
> fdt_get_alias_namelen() then fdt_path_offset(alias), ...) when /aliases
> has an empty property with an empty name.

It would be helpful to spell out that bad situation a bit more
precisely.  AFAICT the way we discover an alias at the beginning of a
path, it would have to have at least one character, which means I'm
confused as to how something with an empty name gets in here.

> Co-developed-by: Mike McTernan <mikemcternan@google.com>

I've never seen a "Co-developed-by" tag before, I'd suggest just
putting that in the text.  However all developers of the patch should
sign off on it, so I'd expect an S-o-b from both people.

> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi@google.com>
> ---
>  libfdt/fdt_ro.c   | 11 ++++++++++-
>  tests/aliases.dts |  3 +++
>  tests/get_alias.c | 12 +++++++++++-
>  3 files changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index c4c520c..bda5c0d 100644
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
> +	    !(len > 0 && alias && memchr(alias, '\0', len) && *alias =3D=3D '/'=
))

The first three conditions here look good to me.  You could even check
alias[len - 1] =3D=3D '\0' to avoid scanning the entire string - an alias
should be one single string.

I'd prefer not to enforce that the alias in an absolute path (the last
check), if we can avoid it, since, as above, I think historically
aliases to aliases has been an allowed thing.

> +		return NULL;

Pity we can't return a more specific error here.  Oh well.

> +
> +	return alias;
>  }
> =20
>  const char *fdt_get_alias(const void *fdt, const char *name)
> diff --git a/tests/aliases.dts b/tests/aliases.dts
> index 853479a..8820974 100644
> --- a/tests/aliases.dts
> +++ b/tests/aliases.dts
> @@ -8,6 +8,9 @@
>  		s1 =3D &sub1;
>  		ss1 =3D &subsub1;
>  		sss1 =3D &subsubsub1;
> +		badpath =3D "wrong";
> +		badpathlong =3D "wrong/with/parts";

As well as exercising the absolute path test, which I'd prefer to
avoid, there doesn't seem to me that these two cases exercise anything
much different from each other.

> +		empty =3D "";

This one's a good test.  It would be good to test a non-terminated
string too (e.g. nonull =3D [626164];


>  	};
> =20
>  	sub1: subnode@1 {
> diff --git a/tests/get_alias.c b/tests/get_alias.c
> index fb2c38c..4f3f6fd 100644
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

Not sure what this case is for - we never call this with both values
NULL, right?  If we did seems like we shouldn't silently ignore it.

> +	if (!aliaspath)
>  		FAIL("fdt_get_alias(%s) failed\n", alias);

Isn't aliaspath =3D=3D NULL correct for some of these new test cases?
You're failing unconditionally here.

> +	if (!path)
> +		FAIL("fdt_get_alias(%s) returned %s instead of NULL",
> +		     alias, aliaspath);
> +
>  	if (strcmp(aliaspath, path) !=3D 0)
>  		FAIL("fdt_get_alias(%s) returned %s instead of %s\n",
>  		     alias, aliaspath, path);
> @@ -36,6 +43,9 @@ int main(int argc, char *argv[])
>  	test_init(argc, argv);
>  	fdt =3D load_blob_arg(argc, argv);
> =20
> +	check_alias(fdt, NULL, "badpath");
> +	check_alias(fdt, NULL, "badpathlong");
> +	check_alias(fdt, NULL, "empty");
>  	check_alias(fdt, "/subnode@1", "s1");
>  	check_alias(fdt, "/subnode@1/subsubnode", "ss1");
>  	check_alias(fdt, "/subnode@1/subsubnode/subsubsubnode", "sss1");

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+zAUAMuZPqlYQtqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUiVngACgkQzQJF27ox
2Gewvg/+JcIkdiXye3LUnJCZ+ykEEsoKV4yL/CjiaH/lL9phRxfpZokp3NpA/a29
lmz7Kvm50JhkpZA7cusBYQR8fG/PEfpWqCyhUj/pxLx3xmT1Ur/zClGpC3CNtG+S
ZN567MV0Bvcbh//F/ZWjn68zNPxcwGzecaglRRwQzinZVu+nFth3HVtekwNX9ePQ
L8kINUmMnPsWfIVDUF3IAByOrTJjmsVRnV9E57zv/ypw1A91dm3hwxbNl/kSB1QX
qu9INx+TRnQ8RZLu9d6O9jnl5Obk0TcjXnIa0JzkPdFC9gkVXQw/A3Rzh1KA80/5
6RZzzgH5eDd+uO3A5GuUGFrDI35J0CeeFP9aGoXQqGz2dPlaA3HOj9Gkgw6Cfz4j
YT1n/5z/PgoQNSFlvr1/v5d+XjdhmxvPXdb5cHPFlqprGNsUDfGNofEWYCiaEfFe
JQkluIj1DmfZetq9w8WAm+kf7Afp/x1OOYT6cRA4i+fUy9AA+u0yCHr39RzypyG4
qTsnjHs+lgMrJcg9YARaTogkgAlRN9x6t9LPJbI+TbCzGYAoCOHbNzRJ3VCulwyf
xNegxpNL8yAiIj3Q5loqbdla2SBcW10JVCuYNsOxO/po2s2AmtbdguYvuApNqeQg
TzsE5H21v8yc3ZhxT/nsh3dQLgvxu5HRxQ/w+YaLoFdu3zi2lJ0=
=NUAU
-----END PGP SIGNATURE-----

--+zAUAMuZPqlYQtqk--
