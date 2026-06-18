Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428D2DE702;
	Thu, 18 Jun 2026 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781792241; cv=none; b=kVbf1ZN/UKbwczzKm7dDY1DCKXXWNqTRq+ZYPXWCLFOiy4kaI4ZI/LcZUSrJl04XG7R7HEHEACZZc0CVUZN+5PSKlnCKK/YmekFhZD8bmm5t+yNwypyji6CVgPlMLxdrXKRutBhZacwlSvLNsVaY67CtmOCxlvcutrgAUBJHyIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781792241; c=relaxed/simple;
	bh=A66KX7iZoA25soJuqlFgBN1g0dg8AW1IvBSbx4e4Eco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ar+4gX91J3YLKrWkIy2mdtw1P6DdJbcMMvTqk3UrK7XNWVU+mafC9Gf/DJcalO8IYyLbDq5w07+5F+LfwLfHu6lRSDtxxcqS8xzuo0HN0fDMwhYa/KH9cY5tW/NkZmM1hlKKlCe5S/AU18loYi+Xr2QQrY2/9UmkzHdS1ibD9tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=LHKjJYsX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="LHKjJYsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202606; t=1781792237;
	bh=UiQoFfb8dikde9+2fOtYoRrUSwFDzNxagqL9GEs1+c8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHKjJYsXP0jP/XJhkfFVQ37FP6j+tqoL2IVxy/6ml7r9l1PYqppwrgMJ2aaOSWEnr
	 JVIMDUOZqVEv/2BnTrwW2x+LSQNbReYl1RUEGDDLdpP0YsryS/hjIQSCwpKL7m8AXv
	 APdwAdbxiObNirew9TcNOP3k7RbWHQX9C1wPQF6faSPiuoYHZaXSeAH80ufJnEpP+U
	 o099/fN3Jc+h/FXhE9IrTEjjeXxusgn5iwofRL9dhdoh7LvYGV1wpyMTh7wVpgLs03
	 jkWm98GvSXTfb1p9BTPwNeDcEPKcv725UJ+urWjNi0Ej738nh853Fey+KmsoDhr+RA
	 bTGxpx6cfp+WQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4gh2qK1KWdz58lZ; Fri, 19 Jun 2026 00:17:17 +1000 (AEST)
Date: Thu, 18 Jun 2026 20:15:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 03/10] tests: asm: Introduce treehdr_vers macro
Message-ID: <ajPFLjQ96nmsPLp2@zatzit>
References: <20260409115426.352214-1-herve.codina@bootlin.com>
 <20260409115426.352214-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lns24CUJon2t2BZq"
Content-Disposition: inline
In-Reply-To: <20260409115426.352214-4-herve.codina@bootlin.com>


--lns24CUJon2t2BZq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 01:54:19PM +0200, Herve Codina wrote:
> tree.S is used to generate custom dtbs. It uses the treehdr macro to
> build the header part.
>=20
> The current definition of this macro doesn't allow to set custom
> settings related to version fields.
>=20
> In order to easily generate some dtb with custom version values without
> duplicating the full header computation, introduce the treehdr_vers
> macro.
>=20
> The modification doesn't introduce any functional changes.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

I just killed the not-very-portable trees.S in the main git tree, so
this will need reworking for the new treegen.c system.

> ---
>  tests/trees.S | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/trees.S b/tests/trees.S
> index d69f7f1..4db2b9b 100644
> --- a/tests/trees.S
> +++ b/tests/trees.S
> @@ -8,7 +8,7 @@
>  	.byte	(\val) & 0xff
>  	.endm
> =20
> -	.macro	treehdr	tree
> +	.macro	treehdr_vers	tree vers last_comp_vers
>  	.balign	8
>  	.globl	\tree
>  \tree :
> @@ -17,13 +17,17 @@
>  	fdtlong	(\tree\()_struct - \tree)
>  	fdtlong	(\tree\()_strings - \tree)
>  	fdtlong	(\tree\()_rsvmap - \tree)
> -	fdtlong	0x11
> -	fdtlong	0x10
> +	fdtlong	\vers
> +	fdtlong	\last_comp_vers
>  	fdtlong	0
>  	fdtlong	(\tree\()_strings_end - \tree\()_strings)
>  	fdtlong	(\tree\()_struct_end - \tree\()_struct)
>  	.endm
> =20
> +	.macro	treehdr	tree
> +	treehdr_vers \tree 0x11 0x10
> +	.endm
> +
>  	.macro	rsvmape	addrh, addrl, lenh, lenl
>  	fdtlong	\addrh
>  	fdtlong	\addrl
> --=20
> 2.53.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--lns24CUJon2t2BZq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmozxSkACgkQzQJF27ox
2GewKhAApzipErwNhduZzLZdHtLSD4WtW134EbEGXAmL6VEThToQfwwIofqLymYt
YWSFHskRFNtRfDLttm4Tn1efaLSIhla08X6Suc2fZ9rqJMgCjMWQeThYIHdUOku5
RFzVLAWAIZw6rlX2jiOFiHt+DwzIK0jFsfzWrGNbHzXZMegLPz4r3YENNCQFLmvR
nK9lScYv0uTVz1vuF3VWF9o5r5bubP+AwABol3o3I4bIOOjFktdtjCmyAtWs3p/K
auZcRhkDlTLgzJUcwjgWauGIYcwI0DUf/Lya9ILso7DjEgI1VthR+tYuy0PyMMRv
zzYiIT6ZueKdNm5TQV+iYCudXbCtWJqDztjHtHuBx3X/cNzovKYGh7obLG1gik/r
/8OExqnGAEfskoGdRYJn4BJaL01EYOJrNOVQ/A1KgJi8Fuc+ONwip7aFrfnyk21y
P7jk0EK0axt6o40D+eHuIGyGRWraZ1QUbw1KSnhIRUhkpIAddowwW8k2yRvEX9QL
ptNXGQc2Mlog3o+fbPQjWKcVOhU9FRhq2HPjdlqR2VrYwRMHX5FpQ6tgmnFOedec
uwWp2/IDaKv7VpiXvyFQ4VxV1AoEZO08jz2U4hveBj6xb+XH56HzyKXPFkBnZkt3
SYJgJ1VekxpXEcnj9YtlhxgPoJKRgy14o44BJBd3JmWE1KRs7Z4=
=q0GJ
-----END PGP SIGNATURE-----

--lns24CUJon2t2BZq--
