Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED4326921;
	Thu, 15 Jan 2026 07:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460732; cv=none; b=bqdPpNPj/l/EdvAKxwObXCTlwwtlVNYjMHMdGw6yY7OM4nDrJxX+0C9y2FzBopsQtjoyIU9+EWKqA57mZps4e/fwj239uAf3n4FYKLE2FfqBG7Vt8Kn2PQ+/654T+ERO4gBxG+eTdWAxhjurHcYiT1OoXhLU8jXi8/pEgKc/vz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460732; c=relaxed/simple;
	bh=KGiFEB6mubZPpp7UBu9OM8q/heXEWKy5xvc99hjMkJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaL3gyymPefkQwQmHisQwNJubo7be0O6WH3dpW06+Yi9Fym8lP7Y8rxqJBPH1hgf9uzN/YvLT0XyeiH73FJlJBc/IywTBuR35MXGlkTNWoWPfbqD85FYjXnVcMzdfg/Gwj86rEsv62zBCS4t8Aq7PEtC8b9uagpYgyGUVbfjoak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=eoQr9fnF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="eoQr9fnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768460715;
	bh=ATkwAo6Dj0PMhMM2u7eZ2GaJ3q0Psh3oc6n/q3NMfzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoQr9fnF2oIEyAsp0O9klzhu1bZsc/LaqSTqXb6aZ/4bOsyH5163FoFEBjunw04HA
	 H/0afDVlmCryrT2lA+f6fxmDQJqgYYnFy08hZY4u1TflfeZcoq9XCAk30U4Ym9fSXy
	 eCnNjexQ3Utv/KS8n6QlO8GCWYTaD0eX7OAl4KpzjkNyf9hTjBl49uH+x3p+2UtgtJ
	 BtNHV41AqzBzx1Zka2YlbSS11sXX+7XDgcLsGUR57aovWeJiKZvXuYzTSWdKQQq8+k
	 qyO0L4qjbiXr7HYRLR3ErT+5QEmjZYw3sDAcBmF/UWIXOzxSuY5YtpqxXSMAd3Z3A2
	 nsNaGiYe5Tvxw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsDWv6h4Dz4wMG; Thu, 15 Jan 2026 18:05:15 +1100 (AEDT)
Date: Thu, 15 Jan 2026 18:05:06 +1100
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
Subject: Re: [RFC PATCH 68/77] libfdt: Introduce fdt_getprop_by_offset_w()
Message-ID: <aWiRomw0BdWPddZ1@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-69-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FdvQvkUhQwC5Gvde"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-69-herve.codina@bootlin.com>


--FdvQvkUhQwC5Gvde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:58PM +0100, Herve Codina wrote:
> The future support for applying a addon on a base device-tree needs to
> modify properties retrieved by their offset.
>=20
> fdt_getprop_by_offset() already exists to get a preperty by its offset
> but the property returned is read-only. A writable returned property is
> needed.
>=20
> Fill the lack and introduce fdt_getprop_by_offset_w(), the write enabled
> variant of fdt_getprop_by_offset().
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Add a testcase, and this could be merged regardless of the rest of
the series.

> ---
>  libfdt/libfdt.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 37459a6..0c654b1 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -858,6 +858,12 @@ static inline struct fdt_property *fdt_get_property_=
w(void *fdt, int nodeoffset,
>  #ifndef SWIG /* This function is not useful in Python */
>  const void *fdt_getprop_by_offset(const void *fdt, int offset,
>  				  const char **namep, int *lenp);
> +static inline void *fdt_getprop_by_offset_w(const void *fdt, int offset,
> +					    const char **namep, int *lenp)
> +{
> +	return (void *)(uintptr_t)fdt_getprop_by_offset(fdt, offset, namep,
> +							lenp);
> +}
>  #endif
> =20
>  /**
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--FdvQvkUhQwC5Gvde
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlokaEACgkQzQJF27ox
2GfL+w//Y7Ye9X8sukmMAsKoBLRlzCDDoO9VJFGEw+hNH6klsCuS3ZnV8h/p6hhr
CUQnspBNXArVL+VCOQPaogNlmPHrvwjS+ScJuesoBbB8Cao+4hfO5WHMzaYmyPyC
lsygOuiOPTFrlssDEf1dF2OKIqlaTAPVlC08p31sndcDjcfDg1WnPl0/KpmhV+Qe
kCJgXFHIK1l9w5BxKYHbIfkppx0gvLWIrKaI5PEuQIzzFW7/HSx2sI69qTDyHZvy
Uu27+QSc7LZm9zIlwmSAnohLY+GDIujG0P5mQ9EPN76o+QC7dfflJi1vzejELofT
5pScfBPiLMACPZ8WUSpuVtUt61UulpCYnJRH1p1gK8cZa6Dxh+UcKDuPl/02g71b
cv3wMJiNNFBHDqDqWhlAkRpb6gU/GZgH2JZAoQa9roLuPdmIVPnk0OnFoHdnJSng
hvv0MLxddRCEBsYPGsOz9nmUcIValI/sgISdPInDvff4yvtDlEnEBQT8VLAzIbHt
RcNNnKrKA6oEalsB967R33l0YXrBAnfjE4bbqW6B8GI0m7yh6RD7eiKp6Zj6Ay8G
JCn2hN0leXHStPasA8NnU2b30XxRWa3qr6rfnPlSQS3RpDD+RghZv/IOYdlydaLy
zdSFa/MDGLet02zPeu2BV+j0qBJRazpa7PyQJLkwaFfWw7548Ig=
=BUav
-----END PGP SIGNATURE-----

--FdvQvkUhQwC5Gvde--
