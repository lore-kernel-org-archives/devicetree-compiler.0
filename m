Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236657;
	b=y4+UGmo9Vzs2TekbRnyDSbh6bzUf5AwfUR2QhqwPBxnS7M9DFQBrt+OlgotXoPD+YMZG
	 KK0/j2NzUiM8F+lne85xQwBtC7sBG0Ps5Dl8ShSU1bhbTd67aIoDcOdkWLu6Oylz4qQfL
	 fLiCx1pJESYd1uoZNYaNHCXgdtDdl8u0Ue/GbQ3hGG2LmNN5OpRUuvDtKwiDtPmm0w77Y
	 pEo9NwMqM+q+rVCNsw3+/JfUj9QCI/0mVJRkPIe31pAdyHDcjxWE7KsGKhyDOyKutPTKP
	 RMiudCXNZP+fCtaXXUPFfFr6l4zcFNW/IE0qhSFi47VulA1YL5wesfLjyCORKMBXkgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236657;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=E5ZefzU/VG98sEYv3Nj78q32podPl97wEzrlzHFU2Us=;
	b=fDwj0UmWy+fVZVBfNNOi8nRJMNXkTNrd/3N2r+DUxsbSc14jaWrhOPHs6/NGiJZ0AN9H
	 FhuxiZfNUB0kYsj+WR1R61zGszljvzDcMw81AX/f6GHKoEBDnEGztifRi/EdforFupy1/
	 63XJW7OOlfIW0tpDAZ4MQYAsgRahhGs8wT/VTOYa7yQIJas/+e826pQYabaAK9pC+qmad
	 r+wNOO23t9zDTgz78ywpi1OvZCVeQpchJn0MvewSzw5HOkhZRP02nKm3K0ovAmUEVnyIB
	 9MmEh0t8g5iXopc68rCwN4NLw6gzdWuNcKlO7yZwL8Aq/ozxDyiSX9oiIgYHkdfeb4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=jbu3pHDE;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0BF606A31C
	for <devicetree-compiler@vger.kernel.org>; Thu, 29 Oct 2026 01:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=jbu3pHDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793236654;
	bh=E5ZefzU/VG98sEYv3Nj78q32podPl97wEzrlzHFU2Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jbu3pHDEhTBdj6ybuA0cOEdR/v3Onwm7af9hVB/OUBj0sgDRFuGEkPzOBLoN61RcK
	 nFuMYSY1I8SK2aspNLJp5a1JSDwF1oasLuRl+Q4vAg1LMt++rKmdZYXQTIgTWwL9kV
	 cMe9167sE28FI42y6oqW11VWn3CTbGmPi8dSAiAshYNAr4wne6ZxbLe1UFny1QD4rE
	 Dk50zDF6wc0ZB+BHLakLvTGIjopM7P8zy10W60/O15qLGO0jibmxJbag6cmmlDBWzv
	 beAQdZ9RurBfZBXn5+/gzcPl8eS/p+RLDsXQ9LXZjalKDTTMb2BTJBfh76EEFrI5BM
	 khDWhcq9988Qg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jFRDG3G3pz4wSk; Thu, 29 Oct 2026 12:17:34 +1100 (AEDT)
Date: Thu, 29 Oct 2026 12:17:08 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 1/2] README: Explain how to build with meson
Message-ID: <auKeh8KVIeaxW9Pp@gractus.seuss>
References: <20261028112007.3980089-1-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G3kOAg4FJHhr0AsO"
Content-Disposition: inline
In-Reply-To: <20261028112007.3980089-1-sjg@chromium.org>

--G3kOAg4FJHhr0AsO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 05:20:01AM -0600, Simon Glass wrote:
> Building with make is deprecated in favour of meson, but README.md only
> gives instructions for make, in its Python section, and CONTRIBUTING.md
> says to use 'make check'. The meson commands only appear in the warning
> which the Makefile prints.
>=20
> Add a short Building section to README.md with the meson commands for
> building, testing and installing, pointing to the Meson quick guide and
> to scripts/install-deps.sh. Use meson for running the tests in
> CONTRIBUTING.md too.
>=20
> Closes: https://github.com/dgibson/dtc/issues/83
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
>  CONTRIBUTING.md |  4 ++--
>  README.md       | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 9742dc3..caf0210 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -17,8 +17,8 @@ works with pylibfdt. If it cannot be supported, put the=
 declaration in
> =20
>  ## Tests
> =20
> -Test files are kept in the `tests/` directory. Use `make check` to build=
 and run
> -all tests.
> +Test files are kept in the `tests/` directory. Use `meson test -C build`=
 to
> +build and run all tests (see [README.md](README.md#building)).
> =20
>  If you want to adjust a test file, be aware that `tree_tree1.dts` is com=
piled
>  and checked against a binary tree from assembler macros in `trees.S`. So
> diff --git a/README.md b/README.md
> index 8f1a5d2..ed9039d 100644
> --- a/README.md
> +++ b/README.md
> @@ -8,6 +8,25 @@ dtc and libfdt are maintained by:
> =20
>  * [David Gibson `<david@gibson.dropbear.id.au>`](mailto:david@gibson.dro=
pbear.id.au)
> =20
> +## Building
> +
> +dtc and libfdt are built with [Meson](https://mesonbuild.com/):
> +
> +```
> +$ meson setup build
> +$ meson compile -C build
> +$ meson test -C build
> +$ meson install -C build
> +```
> +
> +`meson configure build` lists the build options, e.g. `-Dpython=3Ddisabl=
ed`
> +to skip the Python library. See the
> +[Meson quick guide](https://mesonbuild.com/Quick-guide.html) for more,
> +such as installing with `--destdir`. `scripts/install-deps.sh` installs
> +the packages needed on common systems.
> +
> +Building with `make` still works but is deprecated.
> +
>  ## Python library
> =20
>  A Python library wrapping libfdt is also available. To build this you
> ---
> base-commit: 1d50f3f8fa8bf9429eebb0769dafa5df37381ae1
> branch: readme-meson
>=20
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--G3kOAg4FJHhr0AsO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrinocACgkQzQJF27ox
2Gcl4w//VJeK1G9+PohD/HTSSZb8aJmYJOmiPx2MM1V1o7GZ0lvsGWUoBVDEuUPn
K5grkpWMxQ4scAO8j33M+DgsakB9w8AXWdaTn3I+orN3f82TU72BFSGFg04gdIeI
PZNUQk5WsZwHC1QYffl2cKdyoFqDH+K0WhnFFEBlnk0Saj8+hIqh9hx3CJX9rd6U
HlIuDacV2h/tXmotQnpwEgJpzobV7YspfNiQ63jvUGUdTX0ByVIeC94jCx7JOEiB
rAAu8qsQhXrkcl9Khy7GUqTGA0m/+n9PHLD2oDGxjmo/g19CW8oMYM//zPwta90L
+4n7BqS1kidTaq5ajvGvGsVJMZ0wRc3Cq83vRQB4tzetMUA5k1IZ0946puUBlLkm
BAdQvwXWu05/eNdm1WS/Ink+pJY+a3WYBXHgVxCwU3O0AXc02hUUeHoDPuh55cGH
PmeSaAZufdawv2xZls2uHW4g19EyOLjQxxFYoqacGwY/phE2PgE3rOHVATGurAhx
/tQ8c9Y9FFT5KoRZLA5hsu0ANuWvHaDzzlVl3IydX/DLAFxZGdSyXQ9F28xCjGXm
OCgAjBQesN8o2/9RSeJ7qOR1zaRuhKbq+QcgDEcNKhCrgsLFd1bT7wlRL7qEbMuH
g8+xu/XSIMjaMYo22THFM97qxe96z18ZhBuljxymKGp0hyxR5O4=
=nv0Y
-----END PGP SIGNATURE-----

--G3kOAg4FJHhr0AsO--
