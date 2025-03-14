Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D223F510
	for <devicetree-compiler@vger.kernel.org>; Fri, 14 Mar 2025 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741921428; cv=none; b=usSKHD1zf5coW+hu1UEoEW3QiOAerXc4XNQllk+SlKKoRoVCpMbMK6npyH9JZEecrNM7++5124MMvzF1NnlokAhNWbEyUDTGVx6llqY30NjogKNA8hPTisyPL1c1MlPJlNcsAk0aABoS8RkrUczxxPimFms53eqJjAsNSGX+tyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741921428; c=relaxed/simple;
	bh=Uo3XhCvqwlJNk/3UnQJ4k8Lo0cUtatgHzxm0/kkZiGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulOCDNJKH7N9u2xh2Nd1F3wHcS5m5hqeRTcCdMda2tBpaloNjWJu3Nvr+7fXoJ0za6inFg/Cu4V6FFaTayvGuL4ALW3YFIq6yzwSVMPuxVQwfJ14tYCc9JDIFSvbiBIUw++fzSVO3zE89zqzpgzUmrYRkjHeMqAUr78CWpQPb1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=eXUfbXAi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="eXUfbXAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202502; t=1741921418;
	bh=Cl3ept0BM4LnQM8IwnZuknhGaH/zxSG3SozsMgHGsNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXUfbXAisFjPrW97C5Jsk3odczf5LvDXDYwDuhPiQvcQnE/eIIA7KbJe7mBrrjAFR
	 G+yOybcBetiyX+r6vZBfcw6RAN+3feufit8E9fm1XOXwSLp9dT5Rp5mQeblL94SiD0
	 pMXNerqT4tvZmK4KZlqppBbaqOy2cDxNWqEFNp4yxYdY6XvhRIyN2y1OayoTX8HhTn
	 w0513xz3PzHa+sYIiWxCPLrRqDFtkWvdxL8g7e5evuB21pRPae9vVpZ+jJNX9cBv4W
	 AerpxrkiUn5+ph7GyFpGkQbPcn5yg+gNbmsmMBpDeVi2Rr4Dqgp7EAj9yyP15xaZNd
	 /G7TG9VVGuzGQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ZDThp3TpBz4xDy; Fri, 14 Mar 2025 14:03:38 +1100 (AEDT)
Date: Fri, 14 Mar 2025 14:02:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH] Use __ASSEMBLER__ instead of __ASSEMBLY__
Message-ID: <Z9OcVSSNJGn7gZAo@zatzit>
References: <20250313192718.1561683-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+j2takG1jwrvb1Ty"
Content-Disposition: inline
In-Reply-To: <20250313192718.1561683-1-thuth@redhat.com>


--+j2takG1jwrvb1Ty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 08:27:18PM +0100, Thomas Huth wrote:
> Both, Clang and GCC define __ASSEMBLER__ automatically when
> compiling .S files, so this macro is a much better fit for
> fdt.h - programs that want to use it from .S files don't have
> to manually #define __ASSEMBLY__ that way.
> While we're at it, also change it in testdata.h, then we don't
> have to define __ASSEMBLY__ in the Makefile / meson.build file
> anymore.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied, thanks.

> ---
>  Makefile          | 2 +-
>  libfdt/fdt.h      | 4 ++--
>  tests/meson.build | 2 +-
>  tests/testdata.h  | 6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index f1f0ab3..a00123d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -360,7 +360,7 @@ clean: libfdt_clean pylibfdt_clean tests_clean
> =20
>  %.o: %.S
>  	@$(VECHO) AS $@
> -	$(CC) $(CPPFLAGS) $(AFLAGS) -D__ASSEMBLY__ -o $@ -c $<
> +	$(CC) $(CPPFLAGS) $(AFLAGS) -o $@ -c $<
> =20
>  %.d: %.c
>  	@$(VECHO) DEP $<
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index 0c91aa7..a07abfc 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -7,7 +7,7 @@
>   * Copyright 2012 Kim Phillips, Freescale Semiconductor.
>   */
> =20
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
> =20
>  struct fdt_header {
>  	fdt32_t magic;			 /* magic word FDT_MAGIC */
> @@ -45,7 +45,7 @@ struct fdt_property {
>  	char data[];
>  };
> =20
> -#endif /* !__ASSEMBLY */
> +#endif /* !__ASSEMBLER__ */
> =20
>  #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
>  #define FDT_TAGSIZE	sizeof(fdt32_t)
> diff --git a/tests/meson.build b/tests/meson.build
> index 52d657e..37bfd47 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -1,4 +1,4 @@
> -trees =3D static_library('trees', files('trees.S'), c_args: '-D__ASSEMBL=
Y__',
> +trees =3D static_library('trees', files('trees.S'),
>                         build_by_default: false,
>                         include_directories: libfdt_inc)
> =20
> diff --git a/tests/testdata.h b/tests/testdata.h
> index 4f9e3ba..fcebc2c 100644
> --- a/tests/testdata.h
> +++ b/tests/testdata.h
> @@ -1,4 +1,4 @@
> -#ifdef __ASSEMBLY__
> +#ifdef __ASSEMBLER__
>  #define ASM_CONST_LL(x)	(x)
>  #else
>  #define ASM_CONST_LL(x)	(x##ULL)
> @@ -46,7 +46,7 @@
>  #define TEST_MEMREGION_SIZE_HI	0x0fedcba900000000
>  #define TEST_MEMREGION_SIZE_INC	0x1000
> =20
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  extern struct fdt_header test_tree1;
>  extern struct fdt_header truncated_property;
>  extern struct fdt_header bad_node_char;
> @@ -57,4 +57,4 @@ extern struct fdt_header truncated_string;
>  extern struct fdt_header truncated_memrsv;
>  extern struct fdt_header two_roots;
>  extern struct fdt_header named_root;
> -#endif /* ! __ASSEMBLY */
> +#endif /* ! __ASSEMBLER__ */

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+j2takG1jwrvb1Ty
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmfTnFQACgkQzQJF27ox
2Gd1mg//RTYFNIcC9saFcT3W/aoVUbgZAYt/0RQlwUSo2EhM4aTun72B4QFCaVHy
OjbCrjdiOEaAfVA6uPv59mZ6a/32sk+dmZCd2Ws2zM6m+2rBKSdbkatZm0wQEtUV
dBPBfzi0i3yMeNMHQCFVrlqoEd9BODS1/kJtGrrANrOnK3HIbqMh14v3z8tbN4dw
k/ZRNQJGcC80wA2hmTenZKXWrFjgi5oA2SyTJZkE34aNpdrYHOXbxRppj+cuhsTQ
TejClvx0/wNTEBFvwb7NNODmfpyNA0h595YVNDHdHllovpsPPRWEbV1l5EUuNHrS
17JmTa3DgkyqiRuttd3El6q/R0iH3t1fGBPkiAo4gFNG/9X5E2oaZiI+W6HFrSBp
iG/tediKRobvdIQT2tKUdjdY4FY5DISEkswlqkULdhsPC2PdqzCxv28cG9Ow6Aet
yydWL2ZBxSWxmtTqy0Tr3766YnES9CHOAXVga4FWjLoV+ZY48QCwGsZr4HhM/Cmn
rDhs2TDdC4boiocukDrOkfaynSJK5NNOhSoTHs8KjTTMPR2Q/CnzL+i0F+vF0d6V
097BjIqz7jWiPNpp3/A82Nb0aHcEQcUumpgvz7ZwE2PptIk7++QiEgkNpp6z60Ug
sqhjeagzNBM+i/ywABX/Xj5aNDZ/m7nOBrZoGoI+h/T7eupq2Ao=
=h9t8
-----END PGP SIGNATURE-----

--+j2takG1jwrvb1Ty--
