Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABCC28F3;
	Mon, 18 Nov 2024 03:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731900740; cv=none; b=KHg1dI5pt5Rbvw84uDUrJP9xxnulNKoyHNVkMARQYLdj++VqY/FCOMxD9lu4nAPoQndolijsBBryOo/2BdzbOSYNNA3whYGhAMi6JjsBBDxtqBTjrl9jebtUFqw2XvzJO3KE7TWtXGT1/3UwVrDo5Ok8suCut6H6dbuXGivXy0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731900740; c=relaxed/simple;
	bh=LuFwiX2Z0ViARSZW5RiVJmLZvHPp65fzlGyuBeM4f8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0znTpXLDhTdi+NlmlhUVhuX/UaKOvdRKyJZ1M2nplrsaQAGk1kgi4li4yKFyPJHK5ZC3cFXfDNfVqTLCI5zBcDDd7UihKNGbbxdYkVWc2LBByQT3llnyxb4S/cO9mLWFhHZIFaW1h/PaQOKN+kVNMzFcmLa0DZDZHOzzM0Q7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=b9YfLoaO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="b9YfLoaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202410; t=1731900731;
	bh=2wAwZ1m51Kgr6Eab71YbNifsvar/cL3WY25wpReXaik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9YfLoaOGXTKzGsIRIkz9mnOaSknta6QtfThD3L8w8MzddY+fmSz6nn1AXc7Ld7hR
	 x4JddqPU/d7UesOnAFhgBjU2QgsOIfJ0zeUniM8Svvba/AciLi/ulUajMS78VPVYUA
	 hqMq2dGr+6uyF3GIbzXIoPlgGr7db+0c8ISbXb3b6PMAq9A6qVpgQAr2pBb4BSp+24
	 mdDbVMu03Fy0GafEfPW5sxggxyiVTmVOcSvQMt0Pq0Ssx3TMTaqrHleTN3r1t4Nxyj
	 uMYW8KdxHpDVy/JgdVCw2r+Nw6ygh+x6tMHZmn4kLJ0/Di0/xOZS9t+d8+F1E4jo0T
	 4QyjfeQF7SpcA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4XsCqH30RKz4x9F; Mon, 18 Nov 2024 14:32:11 +1100 (AEDT)
Date: Mon, 18 Nov 2024 14:32:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bingwu Zhang <xtex@envs.net>
Cc: devicetree-compiler@vger.kernel.org,
	Bingwu Zhang <xtexchooser@duck.com>, devicetree@vger.kernel.org,
	~xtex/staging@lists.sr.ht
Subject: Re: [PATCH 2/2] libfdt: Remove extra semi-colons outside functions
Message-ID: <Zzq1N-LqqKhe-8IN@zatzit>
References: <20241116101228.164707-4-xtex@envs.net>
 <20241116101228.164707-6-xtex@envs.net>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="20aUlfIcDWMjwN2i"
Content-Disposition: inline
In-Reply-To: <20241116101228.164707-6-xtex@envs.net>


--20aUlfIcDWMjwN2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 06:12:28PM +0800, Bingwu Zhang wrote:
> From: Bingwu Zhang <xtexchooser@duck.com>
>=20
> When compiling with -Werror -Wpedantic, both GCC and Clang fails, saying
> that these semi-colons are redundant, so remove them.
>=20
> Signed-off-by: Bingwu Zhang <xtexchooser@duck.com>

Applied, thanks.

> ---
>  libfdt/fdt_overlay.c |  2 +-
>  libfdt/libfdt.h      | 20 ++++++++++----------
>  2 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> index f9be13865807..1b098e61c270 100644
> --- a/libfdt/fdt_overlay.c
> +++ b/libfdt/fdt_overlay.c
> @@ -352,7 +352,7 @@ static int overlay_fixup_one_phandle(void *fdt, void =
*fdto,
>  						   name, name_len, poffset,
>  						   &phandle_prop,
>  						   sizeof(phandle_prop));
> -};
> +}
> =20
>  /**
>   * overlay_fixup_phandle - Set an overlay phandle to the base one
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 96782bc57b84..2e182ea3314d 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -263,16 +263,16 @@ int fdt_next_subnode(const void *fdt, int offset);
>  		struct fdt_header *fdth =3D (struct fdt_header *)fdt; \
>  		fdth->name =3D cpu_to_fdt32(val); \
>  	}
> -fdt_set_hdr_(magic);
> -fdt_set_hdr_(totalsize);
> -fdt_set_hdr_(off_dt_struct);
> -fdt_set_hdr_(off_dt_strings);
> -fdt_set_hdr_(off_mem_rsvmap);
> -fdt_set_hdr_(version);
> -fdt_set_hdr_(last_comp_version);
> -fdt_set_hdr_(boot_cpuid_phys);
> -fdt_set_hdr_(size_dt_strings);
> -fdt_set_hdr_(size_dt_struct);
> +fdt_set_hdr_(magic)
> +fdt_set_hdr_(totalsize)
> +fdt_set_hdr_(off_dt_struct)
> +fdt_set_hdr_(off_dt_strings)
> +fdt_set_hdr_(off_mem_rsvmap)
> +fdt_set_hdr_(version)
> +fdt_set_hdr_(last_comp_version)
> +fdt_set_hdr_(boot_cpuid_phys)
> +fdt_set_hdr_(size_dt_strings)
> +fdt_set_hdr_(size_dt_struct)
>  #undef fdt_set_hdr_
> =20
>  /**

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--20aUlfIcDWMjwN2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmc6tTYACgkQzQJF27ox
2GdrPA//RxiH+FAuk2IvBvdq2ZyqqxBnqPzpOfDAUZtXoODSNGKm/rmhapw4nOUJ
03UvzI5bFvLakKdJFWLYATe7Zn07nVdTXAr2qdJaXfIJgTITMOIwr1pcap+Qnnez
RPKnS4IYre9x6YISnbQTA9IOnoybHz1wyiUvoIpGDJveJhv488X1fVr1usVMDKyD
enrDXhURbBp+N2w3+hWKmXZcn5yCNDtQgGqjRjO6rnLVmyOX6GmPHOjSo4s17WiI
zLurGvbctOZ9JrLvny0ETBV/LmGPYJdwuYDrP3iTHZTVaMcTm4RbqK6GO9FBJSZJ
VZt09JEvPDxYHSus6h7LNIKJ5LJpr1gJiqmjycfep22wAWFN6r8rI3HmQtVqM1+s
i+AhDeGzoaAINNPeyxal7PDL/Axns2t4GZEY9EUoa1KooxAy6YHe/nmBdcbCE6Uk
WsVSNRqmAApctGCsrdaUx7XKO3ebY7qQ6MPdn3MJtXO8wpbqs0tquXRQb7ayVokA
jB8iM+arLeVA4ZRCFjrm0GIkiqYTUxIcPb1qaXF9pm/NPkmhDCAJUM3TnRbO74dj
ZKXk7JsgDyZnWLy9lNUYXv1AISGNIai6z4eqWrbJ6sbTd51n6eN93OKIt+BRVw22
//r3X9Pd5h/xVDsNu4Q/aF1d0AsUnM5fP1QpeWJX5wm1OXNkh6M=
=tVO8
-----END PGP SIGNATURE-----

--20aUlfIcDWMjwN2i--
