Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABF013DDA4;
	Thu, 15 Jan 2026 01:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768440908; cv=none; b=GNihydpwDw/9Kbasumq5pB4mW5mdzt6Rz9YIl2Uc5bfV3d2nL+Mtov3pkzcx7xIc+qxkhoiQgDoSkkXNG+U3mGFxEgM0JNKQs66v9lIsODpVvb1hHM13EH6+0aEmyG1D4lQkaFcZcxvlsDOatJX+oh7RFr4Yi5WZzPY+TFpVMkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768440908; c=relaxed/simple;
	bh=IIB6rmdHxnDD/EDjUiYO6oeknBj93toh21EVwc1DyN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHmgrIEiezMt+lqKKvHX7afrcPwmUGSGseHj3VsFbI+G3/yZfLm2GanOZ8T1jMdRUYDWay4I7yrkBLBa/5FTalZV7s3811LsqhmVyQcopK5PXwy0XXmQErM2fiBpKvX7Rcs5/Vo53Z83jznsrKALYoCUna8e3rkDkEOp2+ZXk0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=t/Q/pFrG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="t/Q/pFrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768440903;
	bh=Tih6SqZBzUB8yjh9hV3mhUeB91oHajBg2c04LaCkF00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/Q/pFrGFRTT98o6FNNfxyifD7mRhIy/dozbIU2yXIBS6U4vkwfziX9ICWQ8JvUn3
	 VbpouMWDspyZOdKd+Ds4n21AEfUz8bjhRjC4YDfK8h+rxRD18+YoaOXT6hYLqskpY+
	 L2743M3/vfSh+BsAkohNbzluORtN0IzD1ZhIuo0h/w01W80kx2iRbU/N7X+TVem56q
	 rqTcv777tUYXnEqSuGBU0+oLZXhgELQ5DJkiA5YiywDxF0oqHWoHklBXPliv0NtSu4
	 N71Njz/JcIneUhkyyBoTyzZ2jZyPcOwFCdvPqaWxpMQ497xL7EWfdh5S5rkDcsNKTR
	 Y8ghvrhldHkEg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds5Bv2dwSz4wDG; Thu, 15 Jan 2026 12:35:03 +1100 (AEDT)
Date: Thu, 15 Jan 2026 12:34:19 +1100
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
Subject: Re: [RFC PATCH 18/77] dtc-parser.y: Avoid an empty proplist
Message-ID: <aWhEG0GQp04wjcLs@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-19-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3QZY+H69MhpiO3O4"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-19-herve.codina@bootlin.com>


--3QZY+H69MhpiO3O4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:08PM +0100, Herve Codina wrote:
> In the dts parser grammar, a nodedef is defined by
>   '{' proplist subnodes '}' ';'
> with both proplist and subnodes that can be empty lists.
>=20
> Soon a new list will be added in the nodedef related to export symbol
> list.
>=20
> Having all those lists with support for empty lists will lead to some
> Bison warnings:
>   warning: 4 shift/reduce conflicts [-Wconflicts-sr]
>   warning: 1 reduce/reduce conflict [-Wconflicts-rr]
>=20
> The simpler way to remove those warning and thus have a robust parsing
> is to avoid those empty lists.
>=20
> Update the proplist definition and nodedef definition to avoid those
> multiple empty lists. Instead of allowing a proplist to be an empty
> list, force the list to be a non empty one and update the nodedef to
> handle explicitly the absence of the proplist to support the case where
> no properties are available, i.e. the case of a node composed only of
> sub-nodes.
>=20
> This doesn't change the functional behavior.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

I think it makes sense to apply this on its own before the rest of the
series, but the commit message will want rewording for that context.

> ---
>  dtc-parser.y | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index d8914d2..2e152b0 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -272,12 +272,16 @@ nodedef:
>  		{
>  			$$ =3D build_node($2, $3, &@$);
>  		}
> +	| '{' subnodes '}' ';'
> +		{
> +			$$ =3D build_node(NULL, $2, &@$);
> +		}
>  	;
> =20
>  proplist:
> -	  /* empty */
> +	  propdef
>  		{
> -			$$ =3D NULL;
> +			$$ =3D chain_property($1, NULL);
>  		}
>  	| proplist propdef
>  		{
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--3QZY+H69MhpiO3O4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloRBoACgkQzQJF27ox
2Gd4JBAAgAIzlV/ggBtlSdHGn3PxECYpJUqGJNlb47ISIL0ebOUqBqV0/81DcatR
rV6TTBirPJdGntpeWcMMKZvPo7pBMOH8bwi5Os5N/F32vA5KiT3Ozp/s1EnoDJI5
SD7LbQ2/vSpVvWEaPYCoe8nO7km0HBcozVuqy1fzhcmNgKN4Qp3CljD6eWMzamjJ
3z5su+B34UrFF3MC2yN3Arm3ekCFyBB0nANSAGKJR3Ige8TTdWNFYGn41yU/YMZH
aPA8mFmCbxRMZEO3nm4GreO9hf+WBeZAtpmvaFerdMol6Za1aBjWoxKu399jsjpj
yh0hM/UXvy/cxtI7JpO6in1Jpg9zC/TPMzR4HWpNcMYWAAW3A+Go2BIsAiSxEIP+
KmjDNpxA2iO/ire45kFHtRni3egiCA9IfZtRUUKaqJ4FSvzcfApn9qSNuXCeQ4DR
QvlhXxQP3cuUxQ/szsTHzgSl67/vFkL3RJjZNVcPdJYdsJqskUNmb1osRwcJb929
4ql4kcZEHJJ2OfaKnB3qmiSeyQkz2FfXlDeqLHqf22zG8orYRqOzBItXVR/UkrUe
FLMllpbxtZEVo5JVpaPm3Wl2MD00O/3iZNBWdVrOvjN59DTxAmtjNYr/qSHAyn7V
ty2mQNJ7T1QHRImvxtKdkwVho0107nzCG1dNfENN2/GtbPI/n5g=
=Dz7q
-----END PGP SIGNATURE-----

--3QZY+H69MhpiO3O4--
