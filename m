Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FB917C9E
	for <devicetree-compiler@vger.kernel.org>; Mon,  9 Sep 2024 05:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725859624; cv=none; b=Y8ipybgNc0ZFwhH8H1RHMH6ywkguCAJ3OdRhzPEthrZMkMoKHPtxgVyrceyIiTJS9viF5xFsllHnE5uxmzRXPHEvD+JQWeKz1CdZcV3aH54vMUTa30Lr/0xTCKGf29dJp22eE6wDU9TuVXlYuKJSrLiKtvpRznm87fzLjekL7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725859624; c=relaxed/simple;
	bh=j6fljpwwCZg+/vidwol8FEXrC6wBc3Ee6FZm5iWU5K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNJeI3S0JxIxRy7VQpFobFR1rAbgGEblT7NG1NOZ/s97XaDON41xGiDXL6/80b5DIF3RhmOFdCl7fgAeLxrKUJuzuHXC9hQ5y56qENQUFbOwPpyuPbgInasaieKqRbZloOeKEWB1s/h364lviSJwhOthGuXgNaElBazllBoWF7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=qJPxilUR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="qJPxilUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202408; t=1725859617;
	bh=CffQoAZusuBUtV6e/vpEl2Jkz2Uzd6zzLnwMT5x/4Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJPxilURufPAcs1iUST7onudK0gmdgAbEG/Uq3xUEQvMUdClZteI8fPcVYRq5hDEX
	 52B6Iz0CoTLvh9uW5BizgAjeb7XKEje2qogX3jB3Ilm1RQ9mEc/SCoK6AbbJW2PfmO
	 YIiephV4dnpxU7w3XCE+1tk/4zwryyLCpnilpuvbGxE0T4uVNhpemY2FYPgUwTVNMu
	 U3zqeaDQ7dgl+Ynb7UFs7E3+oRU9OKvnxVta2KNjSkHmyhZlBhh/gcGfC8PzF5Jz2O
	 a3Kn6g94bXhm3gdUaly2GOP+AMV8JI3HgF11einex8hVRhKmlqlGuur+SMWwqAToZW
	 BaiVz9n3+QLvQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4X2Fh13mmLz4wd6; Mon,  9 Sep 2024 15:26:57 +1000 (AEST)
Date: Mon, 9 Sep 2024 15:03:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Ayush Singh <ayush@beagleboard.org>
Cc: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
	robertcnelson@beagleboard.org, nenad.marinkovic@mikroe.com,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 1/2] libfdt: overlay: Allow resolving phandle symbols
Message-ID: <Zt6Bog4Fqcb89ivO@zatzit.fritz.box>
References: <20240902-symbol-phandle-v1-0-683efb2a944b@beagleboard.org>
 <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4B7s0vY6SsxNqDT9"
Content-Disposition: inline
In-Reply-To: <20240902-symbol-phandle-v1-1-683efb2a944b@beagleboard.org>


--4B7s0vY6SsxNqDT9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2024 at 05:47:55PM +0530, Ayush Singh wrote:
> Add ability to resolve symbols pointing to phandles instead of strings.
>=20
> Combining this with existing fixups infrastructure allows creating
> symbols in overlays that refer to undefined phandles. This is planned to
> be used for addon board chaining [1].

I don't think this "autodetection" of whether the value is a phandle
or path is a good idea.  Yes, it's probably unlikely to get it wrong
in practice, but sloppy cases like this have a habit of coming back to
bite you later on.  If you want this, I think you need to design a new
way of encoding the new options.

>=20
> [1] https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@t=
i.com/
>=20
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  libfdt/fdt_overlay.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index 28b667f..10127be 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -395,12 +395,16 @@ static int overlay_fixup_phandle(void *fdt, void *f=
dto, int symbols_off,
>  	symbol_path =3D fdt_getprop(fdt, symbols_off, label, &prop_len);
>  	if (!symbol_path)
>  		return prop_len;
> -=09
> -	symbol_off =3D fdt_path_offset(fdt, symbol_path);
> -	if (symbol_off < 0)
> -		return symbol_off;
> -=09
> -	phandle =3D fdt_get_phandle(fdt, symbol_off);
> +
> +	if (prop_len =3D=3D sizeof(uint32_t) && symbol_path[0] !=3D '/') {
> +		phandle =3D fdt32_ld((const fdt32_t *)symbol_path);
> +	} else {
> +		symbol_off =3D fdt_path_offset(fdt, symbol_path);
> +		if (symbol_off < 0)
> +			return symbol_off;
> +		phandle =3D fdt_get_phandle(fdt, symbol_off);
> +	}
> +
>  	if (!phandle)
>  		return -FDT_ERR_NOTFOUND;
> =20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--4B7s0vY6SsxNqDT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmbegZ0ACgkQzQJF27ox
2Gd0+Q//UVfENwYepvUxg7eerIvfmv246KwH5QHWBLx3vRxMibAS5S7ORnKHCyeb
UllVUXpysVeZbacp+zePJWmvWDIiegsKSjutHzjrOC5yzBoDvd9CADGIcqecxRm0
ZNviKwCslItdcuUt7lb/XPyrQ/14H7XgA16MQGOo1XHbpsAf4BckkRfKInbop+J1
6sBAGn7rSiI3nt6/m2Dd9mxbEPBrVw9BIaGJnZPK6+YnybyLGOevTanAgzw6h7aJ
CoMmNjPaSxQ1u+Z37CkN931tNb+UZSa1TGSwWnag+38n+Bij849qiPRZVJ3EGYSU
BLtHhKjvz17poSqeIcKYVQWJ5veJtZbNQhiS4MqLDoxLg+TtGkDwWRcyaB6fZmQl
pMPA3Gm2JwM+xjd/SeMxac/QF2JDRrD6v4YykF3t+fAdvLslC1j4QaApMwaAWOIv
n2LWWwcMxwzyLZwzr/y9jMUIHhmtz468gMtn6YclV/X9PS8KCt1UoEIdL3wVLxMY
JA4Ln6EtNlEMl8/FnsgAgoNMjGyan7+bFeYBAERfI6Bz2Ts4yTMf1JXH1Ql2Y20o
rZa4sLWNaIlYG+zvXJjcf7CairgCaF0QL9IA8LtD77XkJc1XL6F4fJ0pSSm4EQPE
u019hJwitTrdnMBYuZ+sS57VxF6T9i/NCL/M35Poj4sn1K2OuMw=
=sEtX
-----END PGP SIGNATURE-----

--4B7s0vY6SsxNqDT9--
