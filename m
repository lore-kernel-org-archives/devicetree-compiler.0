Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9A5194
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 04:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="iOX+sViP"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC78A4
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Oct 2023 21:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696913787;
	bh=BscMtaqhNO624/S+3WVSuxdtObuZTkcJ1SjcfTJiAOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOX+sViPBGkKMBtGA0YK3979F/CSrwigj5mgrZqP5XhS4bMODzdvP7yMXjxoHVgOR
	 x6lzJj/yo08zsDnlBCS2R26CV7vE9s1jnLTTRqGjEOB7kH0BNod5/ZoCPtlJaFTRUl
	 MmoYwSW2TS9xLAlujA8uubs/GL3X0erOIunis+Fo=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S4NsR2ftNz4xQm; Tue, 10 Oct 2023 15:56:27 +1100 (AEDT)
Date: Tue, 10 Oct 2023 15:56:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: devicetree-compiler@vger.kernel.org,
	Mike McTernan <mikemcternan@google.com>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2] libfdt: fdt_get_alias_namelen: Validate aliases
Message-ID: <ZSTZc6exEXIaVf3X@zatzit>
References: <20231009142004.m4af5c2utpzoll2e@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EdoQfaOM/917V6wI"
Content-Disposition: inline
In-Reply-To: <20231009142004.m4af5c2utpzoll2e@google.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--EdoQfaOM/917V6wI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 03:20:04PM +0100, Pierre-Cl=E9ment Tosi wrote:
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
> calling (if 'path' contains no '/')

Uh.. this still seems confusing, or at least misleadingly specific.
Having a self-referential alias doesn't really have anything to do
with whether the path has any '/' or not.

>     fdt_path_offset(fdt, fdt_get_alias_namelen(fdt, path, namelen))
>=20
> leading to infinite recursion on DTs with "circular" aliases.
>=20
> This fix was originally written by Mike McTernan for Android in [1].

Urgh... I don't love the idea of merging something that doesn't have a
Signed-off from the original author.  I guess it's probably ok with
something this small.

> [1]: https://android.googlesource.com/platform/external/dtc/+/9308e7f9772=
bd226fea9925b1fc4d53c127ed4d5
>=20
> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi@google.com>
>=20
> ---
> v2
>   - replace memchr('/') with check on last character
>   - add test coverage of a self-referencing alias
>   - drop redundant test case on alias to non-absolute path
>   - reference the DT spec and AOSP patch in the commit message
>   - rephrase the infinite recursion case in the commit message
> ---
>  libfdt/fdt_ro.c   | 11 ++++++++++-
>  tests/aliases.dts |  4 ++++
>  tests/get_alias.c | 14 +++++++++++++-
>  3 files changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index c4c520c..39b7c68 100644
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
> +	    !(len > 0 && alias && alias[len - 1] =3D=3D '\0' && *alias =3D=3D '=
/'))

I'd be more confortable with the alias test before the len > 0  test.
It's probably fine either way: if !alias, then len should be an error
code < 0.  However, the point is len has a different interpretation
depending on whether alias is NULL or not-NULL, making (len > 0) a
slightly ambiguous statement if we haven't already established which
case we're in.

> +		return NULL;
> +
> +	return alias;
>  }
> =20
>  const char *fdt_get_alias(const void *fdt, const char *name)
> diff --git a/tests/aliases.dts b/tests/aliases.dts
> index 853479a..b880176 100644
> --- a/tests/aliases.dts
> +++ b/tests/aliases.dts
> @@ -5,6 +5,10 @@
>  	#size-cells =3D <0>;
> =20
>  	aliases {
> +		empty =3D "";
> +		loop =3D "loop";
> +		nonull =3D [626164];
> +		relative =3D "rel/at/ive";

Since you're only testing fdt_get_alias() here, rather than the full
path_offset(), this is probably ok, but there is a bit of ambuguity
here in what's wrong with this.  What you're testing here is that this
is disallowed as an alias-to-an-alias.  But if you were resolving this
with path_offset(), you'd expect NOTFOUND even if aliases-to-aliases
were allowed, both since the alias it's relative to doesn't exist, and
the rest of the path won't resolve anyway.

I think it would be clearer and more robust to use a case here where
the *only* thing wrong with the alias is that it involves another
alias.  e.g.

		relative =3D "s1/subsubnode"

That would be an alias resolving to the same thing as 'ss1', if it
were not for the alias-to-an-alias prohibition.

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

--EdoQfaOM/917V6wI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUk2W0ACgkQzQJF27ox
2GeECg/9HiNwkNXXVvzxpczjryhTS1I3gsU3iDCb1MwKDd6/Ax1xF4Wtk1pBb1/q
PRG1rdZEn98DUaM/qcITJC1Ec2pdqeNBHE8bcN1R77QZHNhbuZHN4Ead6ov+UiCL
8uUi6aM4HaNXcRr91d2xwkGxOQccS7UJOH5f77+KuhwSBZJSQvQ8pMxgYvLb/GYs
E29PMkk8PQQu20rKErpkp1ITdcMkNpX3DoN5m4Cm1Jl1P2ZUb7tYLULwCYW6noMl
elu6VRUVVh0voGOlZS1Wz4njAi0L5XrXQiAsuMPqHLzCGe73bg91GXizrX4VLWdB
NBz9bJ+a4lnUjSP79bQFgDPaj78wt5wQt/crypiMV7eZZa3ph8lKbX96qWwVe8Ny
aC1pgAWPmwBV0mmR6xOpURxqRNYAYLDUE3ttWrsV7QZJVWQ9cVMY8YVkpE5mlDkr
Q6SU7Uf75x+yqEeRG7Nes24XPhU5WpIFFHsI7YwtdPbWCkb/pDgE0hsrP2Gsbr69
71/CbHplFy0Z06D+H5f/bEPk7EsBi5BaZ+18ChPtrJsHf/wDJPpDoUuf8sHXS8G6
PGTsll7YCk7sZkOPZC87VMsNNC5J80vntGS0jfOYx6qFQwzG1O2MfUx5Tmi4WPRi
iM77LuCKtYLQGw5DC6awWKQBgfjTzeyMh9lh495yK7j6r8zPHq8=
=eq3A
-----END PGP SIGNATURE-----

--EdoQfaOM/917V6wI--
