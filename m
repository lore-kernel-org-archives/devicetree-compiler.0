Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D8364A
	for <devicetree-compiler@vger.kernel.org>; Sun,  8 Oct 2023 02:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="jdKrBhX/"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEEEBC
	for <devicetree-compiler@vger.kernel.org>; Sat,  7 Oct 2023 19:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1696732461;
	bh=VnSTOgnIpiSFM11YXW4gLNSmoquo6vSyR7OrqySu2v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdKrBhX/AYNBppgHJAMUlR0fTFu1HlSxgR6y/ZICsxK/9ixv+s3GelcM4EsH6NK7R
	 z12nqfKIRCDKP8H6C7Cj6ONuaBObhXUWRmy9L++zfFa0W7jV4x2yj0l70ZzAPbUfzd
	 ydweg4wE/c9V06BJKoDkyafzJVkplpqYD0NE9vOM=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S35pP0fcDz4xGT; Sun,  8 Oct 2023 13:34:21 +1100 (AEDT)
Date: Sun, 8 Oct 2023 13:32:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libfdt: fdt_path_offset_namelen: Reject empty path
Message-ID: <ZSIUvZxNh7OuZD3/@zatzit>
References: <20231006124839.z7auhc3mk37gxios@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9IKhuGZQ9ptiTrYl"
Content-Disposition: inline
In-Reply-To: <20231006124839.z7auhc3mk37gxios@google.com>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--9IKhuGZQ9ptiTrYl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 01:48:39PM +0100, Pierre-Cl=E9ment Tosi wrote:
> Make empty paths result in FDT_ERR_BADPATH.
>=20
> Per the specification (v0.4-rc4):
>=20
> > The convention for specifying a device path is:
> >     /node-name-1/node-name-2/node-name-N
> >
> > The path to the root node is /.
> >
> > A unit address may be omitted if the full path to the
> > node is unambiguous.

As Rob noted, I don't really see how this quote is relevant to the
change at hand.

The change itself looks like a good idea, though.  Without this, we
will at the very least do a one byte bad access in the next line.  If
someone does path a negative value it will do... something bad,
probably.

> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi@google.com>
> ---
>  libfdt/fdt_ro.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index c4c520c..46b4ef5 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -255,6 +255,9 @@ int fdt_path_offset_namelen(const void *fdt, const ch=
ar *path, int namelen)
> =20
>  	FDT_RO_PROBE(fdt);
> =20
> +	if (namelen < 1)
> +		return -FDT_ERR_BADPATH;

It would be better to make this:
	if (!can_assume(VALID_INPUT) && namelen <=3D 0)

This allows the test to be optimised out in builds where we can assume
always valid parameters.

>  	/* see if we have an alias */
>  	if (*path !=3D '/') {
>  		const char *q =3D memchr(path, '/', end - p);

It would also be really nice to add a testcase for behaviour in the
namelen =3D=3D 0 and namelen < 0 cases.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9IKhuGZQ9ptiTrYl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUiFLMACgkQzQJF27ox
2Gfoxg/8DpGURwJm4G13xKPWrGWQA52ZcFWZyIvzGsKB5h4plevbPbbGEI9h1rpQ
IPwjxjhulin526kVVIAdNliiHT9A0xFh37ZmfPG98sbUbVu3SsCwsiEgn8PKEUcu
9x5YVhkIBzpmb5A1EwsjCNJtUYYKIwrazVx38QoqK/emdLH/5TdmtIl000aKtsZP
I0c+mU4Csz5G2Zu8YZyCtKnvb9XOWfE6GBaZcbbPAT5GF8jtY3ccoNcNQUk1Bbbl
O8aIgs0PTlsjXMfLnD0/44afXesYHerDknaxI4GSX6uHfQDd0m+hBNzBp1do4b8o
A/M0CMCL25obCZSkIRfx5E8kmjEQmDQDE6ORM/ztGC6JN6f4SrbA2icZA65N/4Ew
FFa/0y1o8N/aadD3CY6uDcSb6i5DvAnux+sGtt8unHDShoT0gdZOOgQfc9SYqriR
3dJG+3Ydo4FzV7mw3W5ZfpfZx0NNuZXLsmhCES+clLLCWdPZAzNwTvg9SVUcJDpd
aUDsqgA3ZDcEYZB7RXwsgL8KfCmUBH1W1ZovATIVRenjpIHHKJaXA0amGBl7/mKa
ZfyT6/nJwiXqLHVOnqg9wB4FweLnsV7rIjUJ9I91Vz8u3yzAETTIv5WhWtubVYMR
LPgUKnGGqDi24RgWgDSwIybt8Zp9asIakI+q2/VE/NHfCpBHmdU=
=sem2
-----END PGP SIGNATURE-----

--9IKhuGZQ9ptiTrYl--
