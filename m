Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25DF3D76;
	Thu, 15 Jan 2026 00:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768436853; cv=none; b=fEY+s7u2Qx8NbecgdM4cMM10mYm4GzAXqbQkgifGteTmjnVJtOmH1mLQfmKnrCW1uxzwgxLJqGVuuUJpjVcf514l0paUDDuDLSgIYJUYO/D4jSuHjJrBmcCHiJ7w7qQE+l72Cnuk1UY/3eyLQI5UjmTak1ORktbEwMtt+FSHh0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768436853; c=relaxed/simple;
	bh=jo6930eHjLxGjELQRRTm9F+fO8SP3cYUy7uGUGvRz6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuXMtPgtMzdz5OfFaZgdiIZBz8mXUg1AmxJcivpGccVntFr4qCNjfm4hwRtcZQ+dVujPMa6ghjjSSFA9dNw1qG+3X0AoKIVBIoDNoOFMdNLIwXbHvvY01wXNMmb8ujVFR4zWs8FVAbLVrmeFWcdP2GJjw3TWOtpOKwEh7xS/0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=k6DidPhu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="k6DidPhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768436849;
	bh=y61pMPZOeNjR8Ai2THVert4MWKchb8iKsCguXuy16Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6DidPhuMvU3qeefrX/vcGxjYhyxHXiCey3sJBSyTwrsIRRIHFRzudurPUvI6YrK8
	 VQHwJS7r424+kY18CCi3hlCFC77QABgGEmAt2ztmErck4VQi9t12mN5dwZznTkcKWr
	 aARxv8ND5et9AaQTL2a/fxO8rQh2e0zUezl4J25hQwPDtfP4VQ0sZ8vX9eP5euga5W
	 jGn754YUJgiXGECZH4+5QHgTZGm289A8hRiRoWrIOu4knFMee92mn1vCMBgo/os6M8
	 0aMaAzgS2fONbxrU55SgOh9s8GaH17vfdKupdKCUayhV4sVx6Uf9tsUtcCx5f81PD1
	 RIZUYoOLps5wQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds3hx1zH7z4wGs; Thu, 15 Jan 2026 11:27:29 +1100 (AEDT)
Date: Thu, 15 Jan 2026 11:18:11 +1100
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
Subject: Re: [RFC PATCH 04/77] dtc: Allow to use data_append_markers() out of
 data.c
Message-ID: <aWgyQ1JcKB6AyHn9@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-5-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3vX8t/RsZ8AGzbBp"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-5-herve.codina@bootlin.com>


--3vX8t/RsZ8AGzbBp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:18:54PM +0100, Herve Codina wrote:
> With meta-data available in dtb, markers can be set as soon as a dtb is
> parsed. This will be done in flattree.c using data_append_markers().
>=20
> Prepare this usage allowing this function to be used out of data.c

Trivial enough I'd suggest folding it into the patch that needs to use
data_append_markers() elsewhere.

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  data.c | 2 +-
>  dtc.h  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/data.c b/data.c
> index 5b25aa0..11b2169 100644
> --- a/data.c
> +++ b/data.c
> @@ -127,7 +127,7 @@ struct data data_insert_at_marker(struct data d, stru=
ct marker *m,
>  	return d;
>  }
> =20
> -static struct data data_append_markers(struct data d, struct marker *m)
> +struct data data_append_markers(struct data d, struct marker *m)
>  {
>  	struct marker **mp =3D &d.markers;
> =20
> diff --git a/dtc.h b/dtc.h
> index 186caad..3bbd97e 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -187,6 +187,7 @@ struct data data_insert_data(struct data d, struct ma=
rker *m, struct data old);
>  struct marker *alloc_marker(unsigned int offset, enum markertype type,
>  			    char *ref);
>  struct data data_add_marker(struct data d, enum markertype type, char *r=
ef);
> +struct data data_append_markers(struct data d, struct marker *m);
> =20
>  bool data_is_one_string(struct data d);
> =20
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--3vX8t/RsZ8AGzbBp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloMkIACgkQzQJF27ox
2GffuQ//awLrsSmaXvPKBBTpQBTWUeVJjoJVLNz4aCgCBC0H5zUwYG7Z+cDtCKP2
DVVhUFuwd+qt9IUuJ/mEg9AWmr9dia1keTW84fpgqlGVsCWXu9pDwVR7IGxx4tuZ
2tLRnh1t4JKJfdMDBOpYDM4tR+bgnziyrJkUrRkhg/7+ccfE1meFPZLdkBtJBotF
ZsY9odL+2WLuBn6ZSOXwyj/cmc3+H9ycn8mTuCC3ExSBT/AGzbZizPm8A05FFv96
wEaODSqkN5bbIEqWAxogQ3UBDwXCel388I87EDu1ALOQ9++FFvT77+1d4LPT67c+
5goc9IpBs8uNlhwjDGTci4pdq+8zO66ipFPds+awSGF1lP1JfvHEQJVeBWd+0In6
yxk4PwrMF3zLqOc73DFW9QRdV2Fj8yMW/4IuXURE3tXw5hNHdDGUZG9I6geD91KU
hH3w6GDGDWRjZTLbX8ew6UcnAOH9IfvRaXxKydnNgddy/LY447PJtg3AoBRzE4vm
Jtw7rjCl28BEVaABjL67lONNDvkYwCiifvvP1zFCaRR/JhUuVT8jSHTwxXXdBPVu
qx9mTyD5LcWJGRMpf1v8UCpSA0Ti6Mtq1scdzlg0blFAzwCAb9zgUwNJKVQ+JYZJ
XoZRNylDjHl24dtzBx+PJ1HWX5Guc4vxz2p2JQYyVJutnYqgE34=
=7mnC
-----END PGP SIGNATURE-----

--3vX8t/RsZ8AGzbBp--
