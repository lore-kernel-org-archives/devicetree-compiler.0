Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014C67F9
	for <devicetree-compiler@vger.kernel.org>; Wed,  4 Dec 2024 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733272451; cv=none; b=HxR5Wc1bioIrRshiaMJM/iOjX8bq5u3n+H+RasAC9g8HatLYQBYU1IJMFy/ueho/eNcCVL9g7ZXYWvby51/FLiGLDUQ1KYF67xWNBuJvxhKPMjg9eb13Q7a6RJ6r4usz1Aiqw16hq5uCEIptY6IUZur/OnwUUJ119xeorkZS94o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733272451; c=relaxed/simple;
	bh=jE3umIUF6RVHrKiukMWd5wIiieCtm1Hh7BttbQwwMyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2vuqopaXA0vTKHt224CfUmTGDJsNPlvFns+6lHHXlrNDoUABZ1GHUdLU1ba/BokPUUHRf4/Mhj/oI/H12QQnXU/qJ3JgvNRsoPRPLaOiiqC52c7oNIa5MDvzbmYt4zAlK3O2hbVmalrndgliw4W6jPJKU/m948LRoi6IfFt/W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=OMDu1L1W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="OMDu1L1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1733272442;
	bh=Kvbz7HCTa0Rw0UgxblXO8FMnyHYRb54hWQ+81plzk1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMDu1L1WCthiVdnJjc9HWYZkfPh4P9Hs+aDiiIlZ+z+PMeRQtDzxOcVeWSXXSdqQn
	 E4tJgKM5SVqSW/4bQ69Xvl97yVQtg13Tr33kvEG3oDWOweA17bMXjJg60QJufd5Jux
	 QQLZ8E5mLGzZBEp3bRSF1NOuEF1pOQGHznVp9H78L51Tcml4UgjgcKtRt94Mh1fZFs
	 UizS+NdcFtuAPjGw58V4gDi7mzxtUWAt0jLR7Jelv4M1fQxoeidiAO/GAj2xk8QFL0
	 kJ7z0pDwKlrw+pJWqjUMGM3yy/8SRUD/+mlBo6hSIFmZ+sK2S6JympwtJGpCn0/w0H
	 1nrqor5pN2dDw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4Y2z6L1qK2z4xfq; Wed,  4 Dec 2024 11:34:02 +1100 (AEDT)
Date: Wed, 4 Dec 2024 11:32:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 4/4] libfdt: Add fdt_setprop_namelen_string()
Message-ID: <Z0-jOg1MiD7yv035@zatzit>
References: <20241203-setprop-namelen-v1-0-d1ea333fbd6c@beagleboard.org>
 <20241203-setprop-namelen-v1-4-d1ea333fbd6c@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Puzv9m53WsTTh/M7"
Content-Disposition: inline
In-Reply-To: <20241203-setprop-namelen-v1-4-d1ea333fbd6c@beagleboard.org>


--Puzv9m53WsTTh/M7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2024 at 12:00:02AM +0530, Ayush Singh wrote:
> Macro using fdt_setprop_namelen() internally similar to
> `fdt_setprop_string()`.
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  libfdt/libfdt.h | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c9c81f039365b6d244932786a84a05f065e67c33..5c79c7150d196062246319735=
b36a6111978ad56 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1919,6 +1919,38 @@ static inline int fdt_setprop_cell(void *fdt, int =
nodeoffset, const char *name,
>  #define fdt_setprop_string(fdt, nodeoffset, name, str) \
>  	fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
> =20
> +/**
> + * fdt_setprop_namelen_string - set a property to a string value
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of the node whose property to change
> + * @name: name of the property to change
> + * @namelen: number of characters of name to consider
> + * @str: string value for the property
> + *
> + * fdt_setprop_namelen_string() sets the value of the named property in =
the
> + * given node to the given string value (using the length of the
> + * string to determine the new length of the property), or creates a
> + * new property with that value if it does not already exist.
> + *
> + * This function may insert or delete data from the blob, and will
> + * therefore change the offsets of some existing nodes.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
> + *		contain the new property value
> + *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_BADSTRUCTURE,
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_TRUNCATED, standard meanings
> + */
> +#define fdt_setprop_namelen_string(fdt, nodeoffset, name, namelen, str) =
   \
> +	fdt_setprop_namelen((fdt), (nodeoffset), (name), (namelen), (str), \
> +			    strlen(str) + 1)
> =20
>  /**
>   * fdt_setprop_empty - set a property to an empty value
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--Puzv9m53WsTTh/M7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmdPozkACgkQzQJF27ox
2GcLdA//Xv2baJ5lAZfvKEvQayNXIUhnLaGTbdBx84YDass3PY62NpTmFc2NdN5x
tlQIY8PoacwkQHK2n1wNxyyu1teEdeMPxwR7e2LOvlekHbMGdD/QY+xraAf6C6Pk
te/fnqvnBaVe7zXuffmI21wyasY4NCfvOsPniQPtGUv9BL/oXfyVKetF/sgbI9Dc
hkq6NhFpQJVCE1OAFiJrVuThsTKf4Y7WKr7flg2ZDIX/wf4hp3N6tO4rm/seeDUw
JSXcvTfvF4wiPO9Ks5Ovl7Ng2xcxVXQzdOa19hh6+DW6DwGuGt12A+PJ+t8/pvqQ
LEMXddR0/nRjtrhCEOK2sHD5vliHOtLMeW0SBoflqeeGf4Nor+yY08DjeeKl4PEb
OvSOMtVKjFUEjOU1nbYD+waIQ+5ezE9kcoDhhA5+5474RTDtBd4meL/ElkvVUehW
eZjel7RrFFvkGhAzTJYHHy7DdE+xWA4ovvbMpyfNaC4BFs+21Jz8ZDnuDopYTY++
b/bG4QSrhD1sy7NHiD7S0Dv0PEZgHA13hpu2P5/QoFML4PBfwhpssTxmKjEsoy8I
93y5Vnx62U7R/YqBtEr16ihPCDvu6XOR3SUT3YJ5LGLVyUfxCFOy7GNsU8SEbNi/
vlY00xdendF5xPLyVShiDU7g8O/InOP+aNL053HPV284AO63rpM=
=XO8n
-----END PGP SIGNATURE-----

--Puzv9m53WsTTh/M7--
