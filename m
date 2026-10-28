Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152040;
	b=g7LXV1+950BrT0S1di1nUTKFGeb1XDijk4KZvH3lqeIeGxZmU9TL07xwRrlckDgqmVhp
	 RQbentqBDMhzjn0v3a8H9BEcsPgFb/lzFI6TJ1m4eZBTVeDFK1gql17KtmAyKIC4B4Ozg
	 1R22e+whWdmfwLjdU3pYnaotqesvpW/zbwzSFLv8rXBZ474Y7zF7N39ehW1anQs9UFB30
	 56k14JqeXbALfvv2hNqnRL5PeoZGOXOrXk1J/yMuUyAZAoLY7Verdc7wx42WCDSpkZpov
	 8ylKPKtkGbBp7mM+mxSouv0Y6hUBNuMgEcAnbnJwll30PYm4uVmaEWyNVXWcuhUSDuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152040;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bsDJ4qOVwFtBjHx903dthyI2X+cfzv2blNlpTI0sbUg=;
	b=2A5FUubep2IYel8yxR//eiV23oVS9McDyOBvhmuSpbO6G8N1S7GrpbuBegB9ZQATRkaQ
	 S6YSmCX5MlFTMIK1t3xThkZRPaG+1ORO+XKShcf4Qvh44ZivYVxE6liRsnlgUnuQuw5L7
	 A7emE7cAKWezGi405AwmhgcWiY5sYDNw71fSu0fW3t+B8U9rVHthzsMwUoDYhtb4XHdu5
	 eGdH23hMZXJpHDa/xtcx8KYhOWNOlSumv8Vu4DNAxcxNvMO/NbxUJInIo/uze/r3hf9NI
	 ibJVMPRrAgrNRZC/5/KNHAbgTB1t7W9IyHPvjIfsI+rj5xUIzFDt15upt2C7Oe959hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="Xl/NN9ck";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB29606A31A
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 01:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB29606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Xl/NN9ck
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793152029;
	bh=bsDJ4qOVwFtBjHx903dthyI2X+cfzv2blNlpTI0sbUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xl/NN9ckcczZXm0Efsn53tGDlqGdwYqkBbniYOqf0IczEgfcbrUmSs9APIVwZ7/BZ
	 MnkpM/Kvd1CUXIicH00ZNSH/i3u1rPVJ1a6IFIGhSRbdV1jSdOPXHE4fDgQjysbN/H
	 UVzrbp5e6l5cmhE8/r4dLu3AGEkr+L4k0ZJJ2z4AXkxf2hNfolcvrfflUe0Ppd2J+4
	 HF4d3syqUtJbAcNJA2ARebldJh3XrCuJ9jyFJwKC2uHC/c7NOlbqdvtzZT7um/y1wj
	 ORYsjFzwnYtJU0iS45hRJdVq9W82J3t6g5WLiTVrfBou/sFBuemEtIZS0/I3FoOtw1
	 Y0F91VnRJb6lw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jDqws10Ckz4wTM; Wed, 28 Oct 2026 12:47:09 +1100 (AEDT)
Date: Wed, 28 Oct 2026 12:39:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 3/5] fdtput: Suggest -p when a node is missing
Message-ID: <auFST7UJccNIHAIU@gractus.seuss>
References: <20261027120126.2613353-1-sjg@chromium.org>
 <20261027120126.2613353-4-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="t2IH5Sn3z5O1Boyj"
Content-Disposition: inline
In-Reply-To: <20261027120126.2613353-4-sjg@chromium.org>

--t2IH5Sn3z5O1Boyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 06:01:17AM -0600, Simon Glass wrote:
> When the node being written to does not exist, fdtput just prints
> FDT_ERR_NOTFOUND - nothing points to -p, which creates missing nodes, so
> it is easy to conclude that fdtput cannot add nodes at all.
>=20
> When creating a node with -c, the error also names the full path, even
> though it is the parent which is missing.
>=20
> Add a hint to use -p when a node is missing, both when writing a
> property and when creating a node. Report the parent path when it is
> the parent which is missing.
>=20
> Add tests that writing a property or creating a node fails when a parent
> node is missing and -p is not given.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
>  fdtput.c           | 20 ++++++++++++++++++--
>  tests/run_tests.sh |  4 ++++
>  2 files changed, 22 insertions(+), 2 deletions(-)
>=20
> diff --git a/fdtput.c b/fdtput.c
> index 4094015..c9973d5 100644
> --- a/fdtput.c
> +++ b/fdtput.c
> @@ -47,6 +47,22 @@ static void report_error(const char *name, int namelen=
, int err)
>  		fdt_strerror(err));
>  }
> =20
> +/**
> + * Report an error looking up a node which must exist before writing to =
it.
> + *
> + * If the node is missing, suggest -p, since it creates missing nodes.
> + *
> + * @param name		Node name to report error on
> + * @param namelen	Length of node name, or -1 to use entire string
> + * @param err		Error number to report (-FDT_ERR_...)
> + */
> +static void report_node_error(const char *name, int namelen, int err)
> +{
> +	report_error(name, namelen, err);
> +	if (err =3D=3D -FDT_ERR_NOTFOUND)
> +		fprintf(stderr, "Use -p to create missing nodes\n");
> +}
> +
>  /**
>   * Encode a series of arguments in a property value.
>   *
> @@ -182,7 +198,7 @@ static int store_key_value(char **blob, const char *n=
ode_name,
> =20
>  	node =3D fdt_path_offset(*blob, node_name);
>  	if (node < 0) {
> -		report_error(node_name, -1, node);
> +		report_node_error(node_name, -1, node);
>  		return -1;
>  	}
> =20
> @@ -284,7 +300,7 @@ static int create_node(char **blob, const char *node_=
name)
>  		node =3D fdt_path_offset(*blob, path);
>  		free(path);
>  		if (node < 0) {
> -			report_error(node_name, -1, node);
> +			report_node_error(node_name, p - node_name, node);
>  			return -1;
>  		}
>  	}
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 77f0a81..7254e53 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -962,6 +962,10 @@ fdtput_tests () {
>      run_wrap_error_test $DTPUT $dtb -c /chosen
>      run_wrap_error_test $DTPUT $dtb -c /chosen/son
> =20
> +    # Missing nodes are not created without -p
> +    run_wrap_error_test $DTPUT $dtb -c /blackadder/the-second
> +    run_wrap_error_test $DTPUT $dtb /blackadder/the-second cost -ts high
> +
>      # Automatic node creation
>      run_wrap_test $DTPUT $dtb -cp /blackadder/the-second/turnip \
>  	/blackadder/the-second/potato
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--t2IH5Sn3z5O1Boyj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrhUk8ACgkQzQJF27ox
2GcGuhAAowZD7fIske2Un2tGARjyoYODmADrAC9Ilg67DgOSoyvqRQgI8dMHpYQt
drDhkBf1TVtFOtQUopZjF5rMOTEM04xM9G0pMSUVJn5DNw1KRKnB308cX4UrxR8B
EZHIVVaMexI2c+qxi65EUpnZvkZCenN+iFPiOsHFuC1PnPD3XHHlmje2JHq3tFD3
BAKXJ2Ikrk+VfhyPNoy7ZjVqa7Gs02AvLGGfxx8P/+N2VxtJfX9UKrzLAJr2rEt3
g50S0CxjWsfatKvbFdE6NcsYiT/6LtuvA/uanDNhEg3Sc8Tq4/m84wAGL3lCTEdf
MI8l7PDIgqyBuC6NGbpEBNagf7H3aWULivsQJbEMrysHq1dTD4LJXQVkvEmAS9iQ
JXWqk6Jzmkj6qil4hWTGtiDUQu8aeMa6FDqQuPxNa/mJsKh8RqEUP7xn6XRkyXeb
/U7ODZviyjgfjukAPbVyynaD4vP88jt6CADJMFEDrbPDv3Tr4j4iz8O93wS9ZmQn
uy1jZw0idLipolIsRzNunyycky1AIzgvSo/+47OKrNgS58npzk3A4KGnPRRvEDYX
i5jXupsH9wzD/ms2UkY5L0+R7LQB2bmBo/Yr88EEy8tHtcrQhW+a2mubbtTkQRPr
GEhgMJgbHTKV6HFLZuEOj/Zd/r0hlQ66/IgR11sbuwqvUX8+T6c=
=8mqB
-----END PGP SIGNATURE-----

--t2IH5Sn3z5O1Boyj--
