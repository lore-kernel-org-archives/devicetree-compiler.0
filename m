Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6BF1C07E7
	for <devicetree-compiler@vger.kernel.org>; Wed, 16 Oct 2024 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071192; cv=none; b=b6RTeX05Jyen+sPnrdj0x+tYMurYIRIHT9Z/Io5xwv7ZgViMNW8yWlI1dqC+g024c29DNvzxQUdy8IO8WDxnbYVV06sAX9T0RZdLXh93SDIxeb4/lUbNjKikU6DCy6ao7fuOM7rZwI/FBEcSae5AqyAyalt2G9pw38xKoroHPQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071192; c=relaxed/simple;
	bh=E3t4smhNd/HPyyBDKPpmnBSGjjUthkH71w5q11gOHIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSmFSNbSgiaHOuLqmu5SmmuEW+moOHnJd30vJMQnALw1bwRATEee48HXUJg9baslbAmuzms0cqCkPqFS3611rooo70DyXLZ6BBn3A1YnAi9KyJjJ8uZsYIQmrtQgw9zsCMHkA3Vvogd06VPa+5MjQB6glzyqxVC3zlslFcnIa4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=HZvtaaEK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="HZvtaaEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1729071183;
	bh=bGG0ogrOJzUE5Y9DQU8galy7Lzxa5Hi21dufQDXMz8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HZvtaaEKt+0s2Pfqc2bDoKYks3gaPMzOIGKS5iHPcRCMtW6Tj+9OVb+qq1oouu0sU
	 ly50KfGFfHCru+AyYgelPvwDZ7GJ7yx4Q2lmz/t/b/Ie2ayWLsCyoS3zGvh+v2ib1C
	 EEvTrjQl5z1ZN4vUYnH8PGSA9SjG0UhMsPOxGCgwS1U8ui8wkwD+odycuVmutjid2F
	 +/DqJ+2puqNoIXA31zozU7uc06FmwaV8iIB5f4j6yWBn/VScOgLKfgwRLL+5EOF/+X
	 rOVKE8iuN31mdSlY9otpKL0pv/AdTupaNM10Ml5hBNt4cXVW6fJdLZL0In1FnRsOj1
	 Cv5dTcocg3k5A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XT5Nv60qLz4x2J; Wed, 16 Oct 2024 20:33:03 +1100 (AEDT)
Date: Wed, 16 Oct 2024 20:32:43 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Mayer <mmayer@broadcom.com>
Cc: DTC Mailing List <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 1/1] Makefile: only use compiler flags when supported
Message-ID: <Zw-IO_MFYm9L-Hxu@zatzit.fritz.box>
References: <20241008214134.171436-1-mmayer@broadcom.com>
 <20241008214134.171436-2-mmayer@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dtuOO+iFFCfA+iYe"
Content-Disposition: inline
In-Reply-To: <20241008214134.171436-2-mmayer@broadcom.com>


--dtuOO+iFFCfA+iYe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 02:41:32PM -0700, Markus Mayer wrote:
> We need to check if some compiler flags are supported as not all
> compilers may do so. For instance, "-Wsuggest-attribute=3Dformat" is
> supported by gcc but not by clang.
>=20
> Using a compiler option that is not supported will most likely cause the
> build to fail, since we are building with "-Werror" and the compiler will
> issue a warning about the unknown option.
>=20
> As a result, we only use the option if the compiler understands it.
>=20
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Hrm.  So, I can see the use, and the logic looks sound.  On the other
hand, I'm not especially keen to have a tiny little project like dtc
carry around a complex configure & build system with lots of compiler
knowledge.  This can be worked around by explicitly overriding CFLAGS,
and if using clang you're presumably already overriding CC.

This is perhaps another impetus to deprecate the Makefiles in favour
of the meson build system which we already support.  AIUI meson has a
fair bit of built in knowledge about compilers and their capabilities.

> ---
>  Makefile | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index f1f0ab368cd3..febdca5742c5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -3,6 +3,26 @@
>  # Device Tree Compiler
>  #
> =20
> +# try-run and cc-option were stolen from the Linux kernel
> +TMPOUT =3D .tmp_$$$$
> +# try-run
> +# Usage: option =3D $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwi=
se)
> +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> +# automatically cleaned up.
> +try-run =3D $(shell set -e;		\
> +	TMP=3D$(TMPOUT)/tmp;		\
> +	mkdir -p $(TMPOUT);		\
> +	trap "rm -rf $(TMPOUT)" EXIT;	\
> +	if ($(1)) >/dev/null 2>&1;	\
> +	then echo "$(2)";		\
> +	else echo "$(3)";		\
> +	fi)
> +
> +# cc-option
> +# Usage: cflags-y +=3D $(call cc-option,-march=3Dwinchip-c6,-march=3Di58=
6)
> +cc-option =3D $(call try-run, \
> +	$(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> +
>  #
>  # Version information will be constructed in this order:
>  # DTC_VERSION release version as MAJOR.MINOR.PATCH
> @@ -18,9 +38,12 @@ CONFIG_LOCALVERSION =3D
>  ASSUME_MASK ?=3D 0
> =20
>  CPPFLAGS =3D -I libfdt -I . -DFDT_ASSUME_MASK=3D$(ASSUME_MASK)
> +# Warnings where we need to check they are supported
> +OPT_WARNINGS =3D $(call cc-option,-Wsuggest-attribute=3Dformat)
> +# Regular warnings
>  WARNINGS =3D -Wall -Wpointer-arith -Wcast-qual -Wnested-externs -Wsign-c=
ompare \
>  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow \
> -	-Wsuggest-attribute=3Dformat -Wwrite-strings
> +	-Wwrite-strings $(OPT_WARNINGS)
>  CFLAGS =3D -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAGS)
> =20
>  BISON =3D bison

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--dtuOO+iFFCfA+iYe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmcPiCoACgkQzQJF27ox
2GdioxAAjdIu7XPTtCNlyqM+uqUFcBtjTyJO1hVfltN6uKC7HdgLBI8dGv/lU+uN
qTcfK771B+RY7RkLYSrBZNM9APL8OeXBjxxHkjh21GWJGcRqMEFIy13c+6oyvsbV
KOcvuf3c1lxQmLi7bD9hDWWEM3v6GQGpDzmElqB/QEfM4aOtHBq06Li4Xgw0UQwu
klqpTAiucvbJQRn9p1Wf1dM7CHwOcJHbdTv8hIMVKVc7wSnc/7CxWhj3XTB7jY5E
mKTmb6a480zKZBMl5y8EbidD1Us1b24/dRSY0w54p20bcxfcxLlyFwlO6NRpycHD
1apwP7CwtoHiXsmv0ELuAf2VivnCLfUlvdek9iYFQCTdgr0PN8+XS/Q2Sm+y8KQh
1mT5s1zfMD9VfBkKjqxoYqLRsAcJgF5p2dXFHfRRRwlpA2sbCJ/e2sLc7nEUMAYp
RXMwuzWfXeCbCFgYII/CK7Nuy/SJmC4Ijz8fZ6lLmbQ4UBlASRugwho8iW5UzTt3
3aVQlLdSZCvDyikLEBKWc9J7e3EHgT1xbgZF0LLHPP2DBi8iTx1KAyETIUQe/NhV
cZPfPeCtiFHg2+1E34Aigi8Whk4T9YkuC3FN7Z5+Nqv/OvowKdgmxHOYr7JJan5z
vVi3Y7giHeps3349iLOcQKNkNtpVZYa52dK+COALg1k7J0ehdFY=
=jL5M
-----END PGP SIGNATURE-----

--dtuOO+iFFCfA+iYe--
