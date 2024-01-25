Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5264B6FC3
	for <devicetree-compiler@vger.kernel.org>; Thu, 25 Jan 2024 03:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706154338; cv=none; b=i32HMqnooEYAT8UsR66rqUriJ0ecAppMF/c8lIRHrmXSNz/6kbmtiJD3MFdp6ftyGqZXYiTmNFCi7yxtetDmw1i8tmSB2/Z5SsdaT6PyOGlFG3jvA7Qu+L6P4D3Bs77os6EZN1xiw52PEkHAw6DLn8AP8wYPkhIc6WpZ8KMDd6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706154338; c=relaxed/simple;
	bh=yDtRFhqYXqdgT87WM+fPdg7eEgwEdGbRhPAZCBkBiOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Velsz87DYYnvypSH0+CONMO+w0J5T3Z+6gDnYp7Rk5gUZPgJuK/3njN8mhX9fsqtZ8VkLeGJl3uFNlVoz3/cdjXrmmdVw0yL8Sajo1UBtbza+Pd/DuUUROtNYrBWjUdodNYWxFLglB9l+YuTbQRJ2W1mUXxu2KaOHEBaP5S2Bm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=joABCLn/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="joABCLn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202312; t=1706154332;
	bh=FuOqRqLJD975lU/TmZOqZ5mwC9whACk1QxOIfq6C8Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joABCLn/NuAZxyXSabnHCRMg0wY+9OuAULBXA5RsrZzSoXEWjqMOJjHRXtmUkr4lp
	 r6Bl47Wd3iWeDsZIaOEAjskEjFGiA8fWLklk52PKPzJ7HhpVUwLnttaczQSPRCP0dI
	 RSzt2rjaUgANbHt6lLTW7CcRUCXm7KXrQ9lBZxmWRbkgIv4oXemQurUasT/8w6qC+v
	 8QNWyGGisSTvdCbtdBgfOe1MeNLbpgg1+6l00bYbkBdqVMkx922qeB5PkaeLiVDbU3
	 uqCgPmjBZ09UsNgo7QnlFJukT82Svh7jpWUCRhZQuKM+xt9oes1Af51pDrimk52vPw
	 kKSZqgztIFWNA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4TL6DD3Y5Lz4x5K; Thu, 25 Jan 2024 14:45:32 +1100 (AEDT)
Date: Thu, 25 Jan 2024 14:45:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Charles Perry <charles.perry@savoirfairelinux.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dtc: ensure that command line options arrays
 length match
Message-ID: <ZbHZVVsXh8M16frL@zatzit>
References: <20230904143104.1941715-1-charles.perry@savoirfairelinux.com>
 <20230904143104.1941715-2-charles.perry@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BnzLuMlw15te51gL"
Content-Disposition: inline
In-Reply-To: <20230904143104.1941715-2-charles.perry@savoirfairelinux.com>


--BnzLuMlw15te51gL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2023 at 07:31:04AM -0700, Charles Perry wrote:
> usage_long_opts and usage_opts_help should always have the same length.
> Since these are fixed length arrays, this can be checked at compile time
> with _Static_assert (requires C11).

Sorry I've taken so long to reply.

I like the idea here, and I'm ok with C11 being required for dtc
(although I'd prefer to keep libfdt to c99).  But, because this does
introduce a new dependency I'd like to see it come after a patch
making that a bit more formal - adding compiler flags to enforce it,
for example.

> Signed-off-by: Charles Perry <charles.perry@savoirfairelinux.com>
> ---
>  dtc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index 0655c2e..1f38b97 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -112,6 +112,8 @@ static const char * const usage_opts_help[] =3D {
>  	"\n\tPrint version and exit",
>  	NULL,
>  };
> +_Static_assert(ARRAY_SIZE(usage_long_opts) =3D=3D ARRAY_SIZE(usage_opts_=
help),
> +		"usage_long_opts and usage_opts_help length differ");

Also, IIUC, C11 also requires the less ugly 'static_assert' macro
which amounts to the same thing.

> =20
>  static const char *guess_type_by_name(const char *fname, const char *fal=
lback)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BnzLuMlw15te51gL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmWx2VQACgkQzQJF27ox
2GdVeg//eRHCi7Qcm13uCzZvawklENCLHcVd2ADRNthS1PIi+S8vaBM5I4/nwoWK
Sp9/I4WQvbPf2Z42dUaVfOg6yyJbtYAy1IDOPcqceevmTOz45f4ZEeApO5csDZd0
C8/Hxq7+8HLcWnGLqrl2fXLVQ6B9tvdbmljU9kGBrdOj1cg03DFWMo4y3KBKaiSZ
XCpIJ77aJBbAOq6NJnTWxsYmDyDy/aNczE5/+ObhwGDLIcad5ZIJG3dpWbZ7sf0W
PvwsgFmF/2XTKopTb0bAG/XCGvbh0fki1KKw+phpki8qqSDb1wNgJaGkZMMUmjng
KELSgqXsVUecUkI80hHnJux0Dw6vG0+73jfisHJHTdTRgSpSgzlQVswDPBFxw6iR
e8sIxG3T0b8sNLsDr+p8DOvkFNUTSTZfwwzlaQ/hEHf/ijNTrh/FQddtudsWa/JJ
D+DRxmg8ycWXEiZA7VVHpubcLwt9NKDZq4snbNijklMRq+kFvj0McYM4f/5kpcyw
wG3l6j2E7Pewx1RrFOk/bTUMdbI+0YQxc6gCG3iVIRuTHZ3COar8UDq4ZDbgp/XO
oKZHsD7cwf9oo8uW3WMAm9WDTFmHbkjcdFRB0QD8oYb1+zU9NBl7X/LHvUGKZpXX
glKs9g0Xo1RZPFrRd16P1LS4DOWukwCnrirg9X7e8WRrntY5hVI=
=2aVt
-----END PGP SIGNATURE-----

--BnzLuMlw15te51gL--
