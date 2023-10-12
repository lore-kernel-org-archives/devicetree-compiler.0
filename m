Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF4E2B759
	for <devicetree-compiler@vger.kernel.org>; Thu, 12 Oct 2023 04:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="lwgKVQ0e"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE0F3A9
	for <devicetree-compiler@vger.kernel.org>; Wed, 11 Oct 2023 21:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1697085379;
	bh=uTsvE+s++OrCtTZqkqEqnbQhjTsNuR9bq1h8J3TlOLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwgKVQ0ebn2FVkJHbJneZOdAzKQqdhMiC2uMDrEZ+gtvrPdnXt7OgXfvnrYskBy8d
	 /RkB101ikeXVUFyJIuqHKUCg5MpgICVGMIkXP30pqg53XYjEHWTkctBJ5ul6qRlcgB
	 pvs1xFqTSTmd588+tpJCqeuZP1BVDDU5ycwC8dUc=
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4S5cKH0pWQz4xYR; Thu, 12 Oct 2023 15:36:19 +1100 (AEDT)
Date: Thu, 12 Oct 2023 15:23:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] libdft: fdt_next_tag: Harden offset overflow check
Message-ID: <ZSd00IlSvvV2JeyK@zatzit>
References: <20231011172427.g4tlsew3wsjtddil@google.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lySumXhJm6of9g/c"
Content-Disposition: inline
In-Reply-To: <20231011172427.g4tlsew3wsjtddil@google.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--lySumXhJm6of9g/c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 06:24:27PM +0100, Pierre-Cl=E9ment Tosi wrote:
> As 'offset' is obtained through various paths within the function by
> adding user-provided values to 'startoffset' and as we validate its
> final value by substracting it from the initial one, there is a risk
> that one of the paths might have lead to an overflow, making the check
> validate a "negative" (wrong) length, potentially causing fdt_next_tag()
> to report an invalid offset as valid through 'nextoffset'.
>=20
> For example, when parsing an FDT_PROP, we currently validate that
>=20
>     offset =3D startoffset + len + FDT_TAGSIZE
>=20
> doesn't overflow but then assign
>=20
>     offset =3D startoffset + len + sizeof(struct fdt_property)
>=20
> so harden all paths by validating the offset in the very last check.
>=20
> Signed-off-by: Pierre-Cl=E9ment Tosi <ptosi@google.com>

The intended purpose of fdt_offset_ptr() is that you can give it
otherwise unvetted values, and it will only return non-NULL if those
correspond to a sane range of bytes within the dtb.  If the test
you're adding here is necessary, then fdt_offset_ptr() isn't
accomplishing that job.

So, it seems like it's fdt_offset_ptr() that should be hardened
instead, which may fix other places as well as this one.

> ---
>  libfdt/fdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 20c6415..dda342d 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -213,7 +213,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  		return FDT_END;
>  	}
> =20
> -	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
> +	if (!can_assume(VALID_DTB) && (offset <=3D startoffset
> +	    || !fdt_offset_ptr(fdt, startoffset, offset - startoffset)))
>  		return FDT_END; /* premature end */
> =20
>  	*nextoffset =3D FDT_TAGALIGN(offset);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lySumXhJm6of9g/c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmUndMkACgkQzQJF27ox
2GdYwA//XidxMOPS8wl6gJji/+/uzl6JKAFtH6TfOYcbWxuogqSWMBy1xP9HD2t5
vxOOomysYXPnsnkaYbU7OmUtEhVzLvEXBWy60CanGX8F3dJuxb+ODiMxmkNuvT71
nO0em8QL9HIuqE1475E8gvvFLL74MFQEaEOsxayPYpv1Fuh5T1kMW9DofKFa0NC9
JVheKo/w6yJ+9SAuF83ofxDwliNX2iKcMtEx/b4U2yBcFXO3DkWyMVui85HNIzIm
X8TIdn89viB7ZOqYCsYUH2K1ZYlQP2jA2B8Z3uHBCobYlqGlMmYutp+kxnXxkZPn
Z6zH0ysrnAWYd6anXBvhe9V3WDigIH/XXy8ga/WNK4YSiphaWKrEjPsyFIhN0Kc5
s7Fv4emtIOfWGpG/Sn3rHf2Xj5SIvN7xP1c8m+d4WkWPuP3wrPnT2CGuIMRg1xSW
g+v5FbURuKnFvSjxIaly7jQEFy0Mq0mNpjV3FrInr0AScsBhHWX8scxK2CYpfcRo
cuHFpus98ngfywzFCsU7ZOnvLrHnh5xW2TYLofR9w21iGfWXPmiM9nRajA3NKtY7
km+VV+oWiaxgWdxNaMVlGACjeT9vZjxXl9+Nc7JQFfWnQiVBuot9IHVVjgvARzZW
9cdIaOOehNdhZs6X6IcPbdc2UEsRMXBLN22qG2PoSamvQFhyIuc=
=ROYo
-----END PGP SIGNATURE-----

--lySumXhJm6of9g/c--
