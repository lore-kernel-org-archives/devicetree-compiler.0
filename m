Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152746;
	b=2Gw3kTg4CMmOp0230meLaRGcAK6tVMd4hqWL/vdwIMwxiSflk9+PEY+pNmILzDRNVrEi
	 7AkKAOigpJAqLdWorKW+8gTeW0O0+hA1ZW9w+Op/ixXVBei6JYoNsHs184HJQse194u4C
	 /A635sJybyDlYAlRx0WmkBSenztFy5NvSb6jYSk9UbR3l6QDRd++EoO4oDw0I0WR/IYDT
	 HC8xH3yBh9ce0GPbEzxuAXLiibiEsHi+vzGA0Vdzxw6ZZ585sLQTYn29Jepvg7dMx3uUR
	 rQ7I4lCldT4hjcFeyanvXtE4FI1WwDZUtW02abiT0CV6RgYFKPyx5TSw6xHqZZAOZGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152746;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=yf82R2A3pBfv+fjVEvg2KdGcLkXRXoMq3Qztn7Y1HCA=;
	b=Txwx+syvoell67c0sWSepbQ3lrfu/J4ib7lpQHK/Yj/ZSGXtCxdugxW+92qENQfy5I1e
	 h0rUfcVQ+XUji/U4kgFuO0Zs9sH2H3sVUK7bKdDFgyEjZhnZWiZt6pACiYWJjasrpZYkW
	 cCdV/SlEy381sfnuSLiTIt8QopguSwRoGzbsRr87QklzwiL86FB1ilJ/77YWJskQhe/Gk
	 Nk/zFhRYE7Djxt5EJWIr71bXmj2GLws5yjG2+cgV1cp6CG6SAmbu8WkKeTy4bvV/XW5BF
	 qPauHPlp63IQlsnKRC7IDOFHBBGX9mQ9oAaJa2opM46AZv0SHdzflmqebWXeA4I82dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="eKXJn5A/";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3B1606A32F
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 Oct 2026 01:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C3B1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=eKXJn5A/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793152743;
	bh=yf82R2A3pBfv+fjVEvg2KdGcLkXRXoMq3Qztn7Y1HCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKXJn5A/QqbnhI7WAxfdVZd5y3v/FCcSonbMb98raCL0saEM0Cq7CsFzopum0G3K4
	 IxPHjjPnouMIlbednahGliDZMlUFFgcL5I/2nrhD2d0n4qGvNcH7XmyJTe15Gb4CAc
	 BaMhV29+KzbNCB+Bb9xTZnM0g3uWwymqDYFW+H31tC7uZ31Hhb/q52dO0AAHQs2ZDL
	 PKYs8o2WniNsaPKtJjS3uOgqxjNgXGUjZ7/mH0slNfJUyOy+53vwX8Uq/ydFO69bjE
	 IeI0RPO2YrOkKh5d+eVCsvUNDAs3TcHCJ/HyGrwjskrYPAncdLSA9fXNalndz0YXLs
	 JjR4eITYTwS1g==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jDrBb2Yz7z4wTM; Wed, 28 Oct 2026 12:59:03 +1100 (AEDT)
Date: Wed, 28 Oct 2026 12:58:56 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 0/5] fdtput: Make it clearer how to create nodes
Message-ID: <auFWwlb3Wbun6WR0@gractus.seuss>
References: <20261027120126.2613353-1-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="bQclYlvYHoljgsm3"
Content-Disposition: inline
In-Reply-To: <20261027120126.2613353-1-sjg@chromium.org>

--bQclYlvYHoljgsm3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 06:01:14AM -0600, Simon Glass wrote:
> fdtput can create nodes with -c, and -p creates any missing nodes along
> the way, but this is easy to miss. A user has asked for a way to add
> nodes, not realising that one exists.
>=20
> The first patch explains in the help and the manual how to create
> nodes. The second fixes -p for a path which starts with an alias, which
> creates a stray node at the top level. The third suggests -p when a
> node is missing, naming the parent which is missing. The fourth names
> the property, rather than the node, when it cannot be deleted. The
> fifth corrects the manual's description of -t.
>=20
> Link: https://github.com/dgibson/dtc/issues/49

I've merged patches 1 & 5.  I think 2 & 4 need some refinement.  3
looks good to me, but I haven't merged since it may depend on 2.

>=20
>=20
> Simon Glass (5):
>   fdtput: Explain how to create nodes
>   fdtput: Follow an alias when creating nodes with -p
>   fdtput: Suggest -p when a node is missing
>   fdtput: Name the property when it cannot be deleted
>   fdtput: Correct the description of -t in the manual
>=20
>  Documentation/manual.txt | 38 ++++++++++++++++++++++++++++++-----
>  fdtput.c                 | 43 ++++++++++++++++++++++++++++++++++------
>  tests/run_tests.sh       | 11 ++++++++++
>  3 files changed, 81 insertions(+), 11 deletions(-)
>=20
> ---
> base-commit: 9a712e0c7fb7eec14cc83a06d7a2ff7910f49b97
> branch: fdtput-nodes
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

--bQclYlvYHoljgsm3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrhVtkACgkQzQJF27ox
2Ge1XBAAgCXlftxVSpT8Q3Y6xYQv/06B8416VRvyvwZ7YYdmRkq2q1hk8nkr2afd
KPOiRFW2VsY8in0kIg14YG5D4aQCJVyiEalii+E/hDzT/w/aSpYj8Jfic2mudr7g
5EDDzgWfwxM+sYXt8fN+C3yNYFRc/0CsEkH6MPXsddwJcqo031wEKqQ3TvCX/693
FDWiQNlyP04WyVVP5XK5Ixl5jUENc5us1429o9SP4T1iN+uBBXMqHOMnqe2tSTwd
tZwksjMsdz55EbfyVrS+Ggb6JTjRRL20QkTTcqQqBIm4NMSy6VKU6opYIAKJ2EbT
FZ9iOXcirhctjAl8F5DA8UjfkPK3aBmmCWBYscqVMwtZxXmx63P5RvkI7U/Sv3F0
/aE2MF6n+UxSCCae9UrB/FiHXq+i5tgGGowrOJuPhk0gbOZ4Y/sR+kg5O7B+Tx0F
Wujxt05HdMcFaf7cfQB4ivvVCwjYDwtgJilVt5Y0FWIsD8iuZPBlx2btYGmo35j2
+d2KVCvVBmmOzjmO0H4SqJbEXiHLUXuklcCjpBjK8lAkiheECaZKUNeS3tbFtZEj
IdM0VHB0KM64+J9w/2XFlm6I+Y3QUkXwRzdRr1GSXWa8owW0tgSR1GxLnce3I1pc
VVVbxUk+sYGgUa02pyDpHo1FOcgcEWvjQvC+OyiJEG9h2mUjia8=
=x4Un
-----END PGP SIGNATURE-----

--bQclYlvYHoljgsm3--
