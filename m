Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A865A23C516
	for <devicetree-compiler@vger.kernel.org>; Wed, 20 Aug 2025 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755689947; cv=none; b=OddA6KZKtreATeU38szp476TfYUdsnPZo+iIIwdOZGnvauqLqllGiEPawIvXREJhGB4du6rXIgCWqAdSXhLg0VzbU3RnJV2+r07LWMK4QiY5cFz+WsPOjefzHiJ37D6dKTrgs94fDTgkhv45TiRfvrmYqBW31MbsyiaKW7MPUMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755689947; c=relaxed/simple;
	bh=FbiS0ZQi8MV1O1H2awKDNXYI+YlbY/7FuQTsqHy/qYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejpp4xpD8Mg0wmUrwzpElbBrcej/jO6PbOIO+rqHnATtUL+acPkOLqlYrNNcf9wSQCowQHFy3VHZ3P1IFhvyDOwQxAxih89rS4jNjIENWARtqHz8HEH/lRsJ/ZmmeTX7g8nLbSMLTrOAyl02agkwO/R9LyyVtUdnt5GsI8pxYUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=LxSZoNUV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="LxSZoNUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755689940;
	bh=Ll9Jw73OYjH4CFLqQBQa0gDzHV2V2BqyEgMVTxNSCSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxSZoNUVKlzizBTi8bEcaRL3Y7Cx+3eP4Z+z9Bm8kP6yhwxxpcZQo92Yctz2Z9zmc
	 Oispn2d9exVUubzJKFkEvWgEMn7LIBv4k+7yB21O4mfvNRKaJs8hx5TnA1gc0VrYav
	 evFlzeoqQwJuX459UMswXF1jcZGBIq8Dl31E9x92YbHsKH9jzmIZt3kWH4BuzR39Gv
	 Ks9wlaoyD7EC/QuNot1EPQ7Jn4qPyukhW+CUrgZf0nrktdHblN68L4XxzqCxyDD2GR
	 aVgJ3s1651v6vkR47wZLRDE+R2uG9liljAXbc0j/pxw9uwOPTxP3FJQpgcefKEVgUE
	 Ow23wCAGbDbOg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c6Pc41FxXz4x7W; Wed, 20 Aug 2025 21:39:00 +1000 (AEST)
Date: Wed, 20 Aug 2025 21:38:52 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v3 2/2] livetree: Add only new data to fixup nodes
 instead of complete regeneration
Message-ID: <aKWzzH4euXyn9y8h@zatzit>
References: <cover.1755512759.git.u.kleine-koenig@baylibre.com>
 <b061ee57157fafbb9d5b9b0b86af760d13a04eda.1755512759.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+13YD9aaB6TUcPlV"
Content-Disposition: inline
In-Reply-To: <b061ee57157fafbb9d5b9b0b86af760d13a04eda.1755512759.git.u.kleine-koenig@baylibre.com>


--+13YD9aaB6TUcPlV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 12:35:46PM +0200, Uwe Kleine-K=F6nig wrote:
> Removing the complete __fixups__ and __local_fixups__ tree might delete
> data that should better be retained. See the added test for a situation
> that was broken before.
>=20
> Note that without removing /__fixups__ and /__local_fixups__ in
> generate_fixups_tree() and generate_local_fixups_tree() respectively
> calling build_and_name_child_node() isn't safe as the nodes might
> already exist and then a duplicate would be added. So build_root_node()
> has to be used which copes correctly here.
>=20
> Fixes: 915daadbb62d ("Start with empty __local_fixups__ and __fixups__ no=
des")
> Closes: https://github.com/dgibson/dtc/issues/170
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Merged. thanks.

Note that I generally prefer negative values for error codes (-1
instead of 1).  I altered that on merge.

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--+13YD9aaB6TUcPlV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmils8IACgkQzQJF27ox
2GecTg/8DLHCtGUp3eB+FLF4V2QDlEIWZPTVwvo3NE3v6q38qoW/zSWhY6S3NO2G
4dv0Fx91adFpp9sYqaP7RWN72WDx8vCjcrQhtsXku1vPH1ftVRsgqsySyrAt+I8E
/VSnH5Kq3e4L0btbhNT6bABNy5VXFfY+jEhrv0YR9xtizjmJGXMNKKJo55QoxSDd
EdbKVxWgGoHtTWykFKNgK1LcYZDWrAlZA3Z9wgISStnbkRSaBPunSY4vKGD/rx96
gRvUeQ8yd+OmOBwjYbb9PzyyBjCEkVISsJd0AIC/GuYbVL7OCtwXfzx5jKtWQRWV
acN1PWobPctgGTde38URohJPI/zQTDIGoP7xxD0Ok3FqvNyW+CIjQB5RLm+hJ85b
3pONcp+8Vmc9pmF6hyevLk73ateQNl02SIwDIlT7zz6qPDReD8DwoPiSJ3h+gy2v
efJrkTQNfeY9Ytkrd8CQ0/pJ0txtbVZefaw4bt5ERKkIU1zd/ihNIcv+2wHDj1tS
J838pPca28+x0DdqvFQfACaUApVpF0fyTiSIVqdjTCZ027HP55qslVPT33BXFwfB
68KaZbhgU2inidjuToX6JPES2U9dCL8X2NC8W2+CFWyT84UwIZ2KVsUIEV8WrJhc
ewO3ergUHGLzTc/wDUci2/cOdkmZ5PMOSf/u+DgOoN7dSMirxEc=
=Kpdi
-----END PGP SIGNATURE-----

--+13YD9aaB6TUcPlV--
