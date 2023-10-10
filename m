Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0831C15AE
	for <devicetree-compiler@vger.kernel.org>; Tue, 10 Oct 2023 04:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="QDx8dRvC"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7159D
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Oct 2023 21:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696910661;
	bh=AxVvqAIc6Zd6pQGgoRSmNiGK6EXSFKXwxvAJqPN/pZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDx8dRvCPLvLnSe61iXhqRhrZv3a8o2SSKTDQzoiBBPcmCQtfRlgs9t2kwyZP5N0P
	 XgvOj17ZGGwXwBWC/7+ePzPraJgnyEAAe409Qa5qXabHf+tKcl08ZRjcG8P+n1lta0
	 4H42nD4f6Ig+QE93Pajg6tEebiPESJsFN4acbqmY=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S4MjK1qG8z4xRn; Tue, 10 Oct 2023 15:04:21 +1100 (AEDT)
Date: Tue, 10 Oct 2023 14:50:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2] libfdt: fdt_path_offset_namelen: Reject empty path
Message-ID: <ZSTKFwwmDeFnwsWZ@zatzit>
References: <20231009141643.pgyq3zhuipmoz436@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I0iC/MDf2qQbxkqa"
Content-Disposition: inline
In-Reply-To: <20231009141643.pgyq3zhuipmoz436@google.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--I0iC/MDf2qQbxkqa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 03:16:43PM +0100, Pierre-Cl=E9ment Tosi wrote:
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
> ---
> v2
>   - allow the check to be optimized out when ASSUME_VALID_INPUT
>   - add test coverage for empty paths and negative size
>   - remove redundant part of the quote in the commit message
> ---
>  libfdt/fdt_ro.c     | 3 +++
>  tests/path_offset.c | 6 ++++++
>  2 files changed, 9 insertions(+)
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
> index 8e657af..0193e61 100644
> --- a/tests/path_offset.c
> +++ b/tests/path_offset.c
> @@ -48,6 +48,9 @@ static void check_path_offset(void *fdt, const char *pa=
th, int offset)
>  	verbose_printf("Checking offset of \"%s\" is %d...\n", path, offset);
> =20
>  	rc =3D fdt_path_offset(fdt, path);
> +	if (rc =3D=3D offset)
> +		return;
> +

Since you're adding this test here...

>  	if (rc < 0)
>  		FAIL("fdt_path_offset(\"%s\") failed: %s",
>  		     path,  fdt_strerror(rc));

=2E. you shouldalso remove the (rc !=3D offset) test which comes
immediately after this one.

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

--I0iC/MDf2qQbxkqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUkye8ACgkQzQJF27ox
2GfQvQ/7BcogB3sSxWjbAzVxJlX37oHLVf0Ocdu17VkyQbEUzbBE7nIcTJ7jwC0F
YXN6xNknsQrRDRxd28/NBGX/YXzcgEtgFy0JOrENEF/dX4EGUg7h/GxVVGZBaov+
iPJduCN/MB8ySgTrHF6BEO31cHLXcnixtBDKj3OFg1GZuq9ZRW5TRhz74gI1/m3i
c27BnQD+BgsI23ou3XeQHNnL/PODVzv4JUBsURioe7aWNClCWc04yvlI7htdF//m
6yhvKvWVQ0mommXzx92RU+zldN50NMEagt0HvfRGnCMJeoXn7TyRky/LyORuu6wG
XA5StDzE1zonp9cdgyElPaHVVg2vTW2w9Idwhf/SxYNLWzicOnijfAWvsow9YDVb
8cx1dwDZ1r346AJA5/EbE7IIDvDSERR0QAxyLBdEatK4KKNiuobr0CJ/tm/Z7DqD
r2lgbzG+A2dA2VFep/+GArKJIcYadOQqw+4S7l0ZLZ747SAYCtV8NpyEpIsI8mlw
Ety/PGHkoBAamVeTmqI2EFwP51SkcG3in0uRUFtJ+HxZqFUQ86wt6LpG8JTtwVEL
Zj+NAXRgXCDUy1oRa7jqEI5HYji2WAwAbh0RfQKVJFRbSFGv0b8Tw2giF1ZQSiQX
sFFEfJ0i5y6p8Zu4HBqPOnblhGHCk+NgZNxflvZpnHQBw+lNOrI=
=t/ju
-----END PGP SIGNATURE-----

--I0iC/MDf2qQbxkqa--
