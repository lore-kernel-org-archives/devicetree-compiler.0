Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C6199931
	for <devicetree-compiler@vger.kernel.org>; Wed, 28 May 2025 05:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748410546; cv=none; b=eaX2XhTaLq2bGr0uedOXodDnfLW4DPSCtx0nE2znSXpDK6Peg/9bUGulQx833TgWk1g5w7ClexbcW7uiGKlFYsPG/ar3GeXVrBpHt/JGb42p/kiwkwFRemNOrVA7qW3gl67VnpG4xUcsod8Qw5A07GurPyMA5x4oqsBO9rkr770=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748410546; c=relaxed/simple;
	bh=6ReVDccA3LiQV1fvPhXqiGVkJdWAB2fNjzPgObGkwLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ty+v44ZzTCW9c/jjPeSTno0GzEceDyK7iZ8BbPQ9Irdmbvz03zsgPCWs9QhY/0fyvwsGC+gSAMrFjcAga3/9gwdn2l0t9WESatDDdQZ6PDHueYQI4LhXC+S2gvBfx21Pr7SfLrjNWujLdMd0uPUNlLY9J4rNvTdw2URMdHghWQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=mN+zXUqP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="mN+zXUqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202504; t=1748410540;
	bh=twIgd35xltCDou0aYCcKElLXQ7NRmrUYlMmhyOx0inc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mN+zXUqPTmXu3GtiIMYJLTjaZA8OM07+WEJa9Rc91siauC8T8ybL2QgvgjJlpAgcP
	 SI/yFm1vgZrE7PX8atUg9XMcaOFl0YJvADFkBRBoyOnw2wrw+QpuKdswR7zcZrsiza
	 KVFfQvowDafThU1tBZSwiMsULsCIBvEJT1o1Wmvo5pySwfBo59ugh8P0aF5m32exZp
	 1bTy8BBKve2FVanUyP0Owm95Rpol/0wTbA+OEDqyIpEnujLs28buY0OgLrXP7TQje4
	 gVPR+frcJdJLlnmPddZzdRG3o/qLKRlDEbgI3UQ5MjtOgqGuZjrARKvfjj6CrJW6Hv
	 RbkPXdYmusrnA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4b6dWc5Kgxz4wcg; Wed, 28 May 2025 15:35:40 +1000 (AEST)
Date: Wed, 28 May 2025 15:13:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>, d-gole@ti.com,
	lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Glass <sjg@chromium.org>, devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH v2 1/4] Add alloc_marker
Message-ID: <aDabZokq7CMAUNaa@zatzit>
References: <20250311-previous-value-v2-0-e4a8611e956f@beagleboard.org>
 <20250311-previous-value-v2-1-e4a8611e956f@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxTazOUpTrjdK9jd"
Content-Disposition: inline
In-Reply-To: <20250311-previous-value-v2-1-e4a8611e956f@beagleboard.org>


--oxTazOUpTrjdK9jd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 09:05:37PM +0530, Ayush Singh wrote:
> - Add helper to allocate new marker
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

This is a reasonable cleanup regardless of anything else.  Applied.

> ---
>  data.c | 20 +++++++++++++++-----
>  dtc.h  |  2 ++
>  2 files changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/data.c b/data.c
> index 14734233ad8b7ebd38c3e62442b81aae66601806..913796f2e664d07cdc48e0cbf=
2ab5d6fe9978072 100644
> --- a/data.c
> +++ b/data.c
> @@ -228,11 +228,7 @@ struct data data_add_marker(struct data d, enum mark=
ertype type, char *ref)
>  {
>  	struct marker *m;
> =20
> -	m =3D xmalloc(sizeof(*m));
> -	m->offset =3D d.len;
> -	m->type =3D type;
> -	m->ref =3D ref;
> -	m->next =3D NULL;
> +	m =3D alloc_marker(d.len, type, ref);
> =20
>  	return data_append_markers(d, m);
>  }
> @@ -254,3 +250,17 @@ bool data_is_one_string(struct data d)
> =20
>  	return true;
>  }
> +
> +struct marker *alloc_marker(unsigned int offset, enum markertype type,
> +			    char *ref)
> +{
> +	struct marker *m;
> +
> +	m =3D xmalloc(sizeof(*m));
> +	m->offset =3D offset;
> +	m->type =3D type;
> +	m->ref =3D ref;
> +	m->next =3D NULL;
> +
> +	return m;
> +}
> diff --git a/dtc.h b/dtc.h
> index 4c4aaca1fc417c9d93e904e64b2c40216ee1b093..86928e1eea9764fe5d74d6dbb=
987589d65d54b66 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -183,6 +183,8 @@ struct data data_append_byte(struct data d, uint8_t b=
yte);
>  struct data data_append_zeroes(struct data d, int len);
>  struct data data_append_align(struct data d, int align);
> =20
> +struct marker *alloc_marker(unsigned int offset, enum markertype type,
> +			    char *ref);
>  struct data data_add_marker(struct data d, enum markertype type, char *r=
ef);
> =20
>  bool data_is_one_string(struct data d);
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--oxTazOUpTrjdK9jd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmg2m2UACgkQzQJF27ox
2Gfdfg/+JkJQT8x13niCy0ykx8Fmh7fef2U2Wd5t40kfjYLPKd4EP/JKUB861Mwv
vQlRMXC/g+hqklFNf3rNHslV+ygvdcF/7Iceyt0Fk25aYUQQpuVeiZtc3TcHNq29
wEWC6Py1zx5vZ0JP70owoKs7elV4xOKMI9RRHml52o8PTPMs7gWl6EQnZ9r8RNha
ej1RCqTC/fSvRe4JidZgXaqVnn7M18MBYvvEFGBNbJ4dABb1ZsVVoz9JO6YTcY8p
NTTMgn6GzX3czqUwYpJtFq29352XGCjg2mD5YAf8whTPo/7+Yvb/1AiNNbwqolUQ
IRkUQZ9LHGwMiaWQnmbDolFOaxBfnRLgXVpFSk0kRuAh+nLkj3HuxZFaij7Jxl8K
MOPKzY1yFEKCTdG/0SLpg5Fe8n3wJYDX08yRWBgnPvJ3m57O8DD+oXSxsvozNQcG
/KIds2Veb/1DXFhCdeykxBDzf4d4jhMFczb1SmoOubttFf6nzoAFzYKQO6bKBNfX
2Hlg5RqPRs17lUY41AOB2U6PAtENBMDZYwcOJdhRDfBX6bhnq9V1+F+44EeFMsuB
do0GcicZvCDTEnAJDqKDCtW//ossMHuc+n9eWbqWtbhKzCi8vuOvC3w9w4sEPQRP
BY24pzF0MBZtJpejjVEsKVEroPVaVrvegki23SRfDSS36c5Xhuc=
=CogS
-----END PGP SIGNATURE-----

--oxTazOUpTrjdK9jd--
