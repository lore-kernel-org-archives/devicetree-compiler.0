Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951EF19F135
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Jun 2025 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481852; cv=none; b=rpmFO7oriuBByXnFF6h39ZR2t+bO5YMostW60gNOisZhchSbEdRVV3upd6JAygZ2BJNBA5ikzQXnLplAJPuzlJgiGY/BrClX8F8DzpVRDAY3vE1hPMKNYCSA6U2Xl/lTl+YPfQcRJPIk7gA9nhBE1fOXb6+a+hFlWnJ6WUHNUWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481852; c=relaxed/simple;
	bh=VpcQfbIy4sy9KzxSezE3kjDRg8jjTCMMDpS1exgNlI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI6cvjGd+Co/SOiM7ImaCG7Bwf/iF+NlK4CeDgTavRl569ucHfN+onKSq66U6GV+08oJ/iLxl96PGY6Gsxb2QD5wy3mrHCqc8xV/RivQehKX+2rzc38lnkdnPaYSLRAFI5T8qjDaPWjc4/UVyZdhOWvkYut495SxKeLHZjxcSXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=HpYIIY2S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="HpYIIY2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1749481846;
	bh=J53SIOc6b+3jH0awSCzPiDPb2BUUUgmxgtEhCdKImA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpYIIY2SJs4HpL5aFRdzV/tH9IbztgpLgCiPgoJkdyDC5AQy36vWklOzxUYJ+5Mjx
	 nTYyAxBtWzDaSRsVm4t1jk8WE06JeirnXRrnLdJ+QAFOaaQwcFIOKzcQEftiw6Mxid
	 DRiLl6M9emwo8xsopnJD2tibMis1JhGcC0kuqzffOjYfOHic9/sxMGIRURtqPQucCj
	 Qa5mZblFYclfQjSY0EHwE6pLO+Gca9OFaiJyfqy6RfbE5L/gNvgC7/yux0huTxRNum
	 0II3OrZvI8LBvLtTHtcPfjlSu2wDdM2AY076HA4K+hOTbNWKoKJWj40yRkV6+RvxA9
	 e4jT81YMOd3FQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4bGFjf37wTz4wbv; Tue, 10 Jun 2025 01:10:46 +1000 (AEST)
Date: Mon, 9 Jun 2025 22:39:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Glass <sjg@chromium.org>, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v3 1/4] srcpos: Define srcpos_free
Message-ID: <aEbWD5VSvX7X3_OK@zatzit>
References: <20250605-previous-value-v3-0-0983d0733a07@beagleboard.org>
 <20250605-previous-value-v3-1-0983d0733a07@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sNIRaGHrusg46oHU"
Content-Disposition: inline
In-Reply-To: <20250605-previous-value-v3-1-0983d0733a07@beagleboard.org>


--sNIRaGHrusg46oHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025 at 04:18:06PM +0530, Ayush Singh wrote:
> srcpos can be chained together using srcpos_extend. However, in such
> cases, we need to free all the chained nodes.
>=20
> srcpos_free is a helper to recursively free all the linked srcpos.
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

Merged, thanks.

> ---
>  livetree.c |  2 +-
>  srcpos.c   | 11 +++++++++++
>  srcpos.h   |  1 +
>  3 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/livetree.c b/livetree.c
> index 93c77d95a320ec05aa355e12920cef9e1c91c26a..d51d05830b181476ddbab878e=
f8b556230b58e2b 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -174,7 +174,7 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
> =20
>  				old_prop->val =3D new_prop->val;
>  				old_prop->deleted =3D 0;
> -				free(old_prop->srcpos);
> +				srcpos_free(old_prop->srcpos);
>  				old_prop->srcpos =3D new_prop->srcpos;
>  				free(new_prop);
>  				new_prop =3D NULL;
> diff --git a/srcpos.c b/srcpos.c
> index 5e2f7dd299184ff86b00b280dc31498cb9830e28..5bb57bf6856c6ff6b8eb993af=
f5d216c63bf5ecb 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -287,6 +287,17 @@ struct srcpos *srcpos_extend(struct srcpos *pos, str=
uct srcpos *newtail)
>  	return pos;
>  }
> =20
> +void srcpos_free(struct srcpos *pos)
> +{
> +	struct srcpos *p_next;
> +
> +	while (pos) {
> +		p_next =3D pos->next;
> +		free(pos);
> +		pos =3D p_next;
> +	}
> +}
> +
>  char *
>  srcpos_string(struct srcpos *pos)
>  {
> diff --git a/srcpos.h b/srcpos.h
> index 4318d7ad34d91d2ada1a5d7f92d2c84148fec366..4d60b50e31197c2da6a7fa885=
1c5e5a6717d78a6 100644
> --- a/srcpos.h
> +++ b/srcpos.h
> @@ -88,6 +88,7 @@ extern void srcpos_update(struct srcpos *pos, const cha=
r *text, int len);
>  extern struct srcpos *srcpos_copy(struct srcpos *pos);
>  extern struct srcpos *srcpos_extend(struct srcpos *new_srcpos,
>  				    struct srcpos *old_srcpos);
> +extern void srcpos_free(struct srcpos *pos);
>  extern char *srcpos_string(struct srcpos *pos);
>  extern char *srcpos_string_first(struct srcpos *pos, int level);
>  extern char *srcpos_string_last(struct srcpos *pos, int level);
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--sNIRaGHrusg46oHU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmhG1gIACgkQzQJF27ox
2Ge7EA//ZNZLSUJL9nDNMgk8AqneoA12Yv7Ed9t1Sg0ITfmLU8dhEoKx4n9crBoq
81Tt7xzFKhTnUN/0uIuHvmyGIrrkqGm1JYpUKgU0OA8u1kHYAR9nlswcWR7a+Z+T
LOl2Nij4MMISdPZ4MUHlxJvjouqFBIKZQzTXnrLqcurOlxl6ehRVp6RLO/3pmZJf
TPfOw/KKYUkyNCtF3h38UM9sjbKfrJJJtfW8yrW5zoguRoHQFmzGoHC4cYoccKDg
IfZjCQC/4ZRTgpljBvdY5vpydVOcCdFlcrhdyhWR939eUM73X+YuaR5riY44K1Fq
RxRr8UZkdDI+T2g/si5ZjBSzLNgCEmKGvz9EZTH/Lzjs8EW5FKZBjmx0BdZF1BBT
6Zq3i0XhSVHLxAuV2Er7pgTYu13vxRAiQ3KXMLtLrWL1xeHW1FrpUmoXq7enKDrq
b2xx+bB9nXlEd0viX8FaIRdhYCB9rf3uP7wtgwLReyoOaQA1hjzmcmKIppWNHbg0
54j3Do5kxzrER1+oM1yNnNvX6C8uas29SlYYs4hqUBFySMaisiqmH5RjPPAzHkWQ
ROvZXSjhGn+Zag78UWOyJWqRDo8AVnTAtKiZAkIw0L2X+4yQW/vkYHaBeQe3zvA/
kUdBpfuwYtnSoXrXCD+55s1YMdKELUYIGhnbzS5/6Y2zUAXmQuA=
=FFR9
-----END PGP SIGNATURE-----

--sNIRaGHrusg46oHU--
