Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE593C1D7E;
	Fri, 16 Oct 2026 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139469; cv=none; b=fr1gRIBdi0aSOBszpC2AHoeGUFHFVb1X+HFR9m5qipafKAwapEPofvwFIOTTPvBStZZedSeGrQYxgp2nG/5ReEu3Tm4YwmcIbhI0EseFUyJ6ufg7t8eNk7NdeOZ8PZZ1w2N1s7IVg589RHDCdydJbKyTwV2J5lGjETZaaI+gil8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139469; c=relaxed/simple;
	bh=bv0hrGVOqCaH204CjXPz/gBlXU9tjF+kdNXvADeJ2nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AarrjJDMUv6YykImraaqwKq3Sz9jpzg79hfegMRHVf/DgoBVi4zum4QVeaejRcEJ+G048g+iwJK/CRKovilYSNvOOLTLdsXLl0vAsiLsL47OzfQC5qnyQ4LPPFcJ9UcLGrXcYPnC2FqDRrCMSe5Sc8/WJDxV4puZYvzy4CDGP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=fT2ILQPL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="fT2ILQPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792139464;
	bh=ZMaupso8FOIVeAQhJc/34g5G+QjneYYxiM9Hc4moI1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fT2ILQPL4CLYKVIu/GfplVP8OPCUwv4HYm+3taOdGtYYJ0VGmLebg8qMynW1fPjiP
	 ZjcdpypA2oLwvnZjeeAs9DGuxT8+UnK6VvGUim+OWfU27ySNRB0yjNB333qln08LXI
	 vtg0dBKxtN7CeBqMMf7MUyu6VvLBTWs7lxpPNrGIB4G96S6wTw1aIJHXSmzd1eiaUh
	 YSnE7UnmL6RD3O4DnmSKpYGk8VgBbjxUvFjtgDNfSTid7Um4iu3DdSQH9fnn+Qi2xq
	 APxARRKtyP6J1h2Y7AwZGyAeTiPW/gi4gcLarvXVpei0upIRc5D8fvhciveOiPlAaQ
	 4Dr/bk+aWGmeQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j5dSS6Hbqz4wBD; Fri, 16 Oct 2026 19:31:04 +1100 (AEDT)
Date: Fri, 16 Oct 2026 19:30:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 03/74] fdtdump: Introduce get_structured_tag_data()
Message-ID: <atHgwFocPW-iL19-@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4l8L3oJ0HN4NVEr"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-4-herve.codina@bootlin.com>

--t4l8L3oJ0HN4NVEr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:32AM +0200, Herve Codina wrote:
> With structured tag, data len can be encoded in the tag itself (no data,
> 1 cell data, 2 cells) or with a dedicated cell (varlen) added between
> the tag and the data.
>=20
> In multiple places, getting the data related to the tag will be needed.
>=20
> In order to avoid code duplication, introduce get_structured_tag_data()
> which purpose is to get the tag data part and its length based on the
> tag value.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

This might as well be folded into the initial implementation of
structured tags in the earlier series.

> ---
>  fdtdump.c | 50 ++++++++++++++++++++++++++++++--------------------
>  1 file changed, 30 insertions(+), 20 deletions(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 20854752..f26d3a89 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -44,6 +44,33 @@ static const char *tagname(uint32_t tag)
>  #define dumpf(fmt, args...) \
>  	do { if (debug) printf("// " fmt, ## args); } while (0)
> =20
> +static const char *get_structured_tag_data(uint32_t tag, const char *blo=
b,
> +					   const char **data, int *data_size)
> +{
> +	int sz =3D 0;
> +
> +	switch (tag & FDT_TAG_DATA_MASK) {
> +	case FDT_TAG_DATA_NONE:
> +		break;
> +	case FDT_TAG_DATA_1CELL:
> +		sz =3D FDT_CELLSIZE;
> +		break;
> +	case FDT_TAG_DATA_2CELLS:
> +		sz =3D 2 * FDT_CELLSIZE;
> +		break;
> +	case FDT_TAG_DATA_VARLEN:
> +		/* Get the length */
> +		sz =3D fdt32_to_cpu(GET_CELL(blob));
> +		break;
> +	}
> +
> +	*data_size =3D sz;
> +	*data =3D sz ? blob : NULL;
> +
> +	/* Skip the data bytes */
> +	return PALIGN(blob + sz, 4);
> +}
> +
>  static void dump_blob(void *blob, bool debug, int dump_unknown)
>  {
>  	uintptr_t blob_off =3D (uintptr_t)blob;
> @@ -58,7 +85,7 @@ static void dump_blob(void *blob, bool debug, int dump_=
unknown)
>  	uint32_t version =3D fdt32_to_cpu(bph->version);
>  	uint32_t totalsize =3D fdt32_to_cpu(bph->totalsize);
>  	uint32_t tag;
> -	const char *p, *s, *t;
> +	const char *p, *d, *s, *t;
>  	int depth, sz, shift;
>  	int i;
>  	uint64_t addr, size;
> @@ -153,21 +180,7 @@ static void dump_blob(void *blob, bool debug, int du=
mp_unknown)
>  		}
> =20
>  		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
> -			sz =3D 0;
> -			switch (tag & FDT_TAG_DATA_MASK) {
> -			case FDT_TAG_DATA_NONE:
> -				break;
> -			case FDT_TAG_DATA_1CELL:
> -				sz =3D FDT_CELLSIZE;
> -				break;
> -			case FDT_TAG_DATA_2CELLS:
> -				sz =3D 2 * FDT_CELLSIZE;
> -				break;
> -			case FDT_TAG_DATA_VARLEN:
> -				/* Get the length */
> -				sz =3D fdt32_to_cpu(GET_CELL(p));
> -				break;
> -			}
> +			p =3D get_structured_tag_data(tag, p, &d, &sz);
> =20
>  			if (dump_unknown) {
>  				printf("%*s// Unknown tag ignored: 0x%08"PRIx32", data len %d",
> @@ -175,13 +188,10 @@ static void dump_blob(void *blob, bool debug, int d=
ump_unknown)
>  				if (dump_unknown > 1 && sz !=3D 0) {
>  					printf(" ");
>  					for (i =3D 0; i < sz; i++)
> -						printf("%02hhx", *(p + i));
> +						printf("%02hhx", *(d + i));
>  				}
>  				printf("\n");
>  			}
> -
> -			/* Skip the data bytes */
> -			p =3D PALIGN(p + sz, 4);
>  			continue;
>  		}
> =20
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--t4l8L3oJ0HN4NVEr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrR4MAACgkQzQJF27ox
2GfmOxAAiBEbaJnlqwC7l4M8DMV0WxgCKN7hsTBEC1uLYVKj3HWYhWQdNBmeycAK
swHlh1ZEVTuNFt4ZYgLLgPfU8LbECXBbJ96Dr8csYhuKP59d/dnO4jC/mi+hnNeb
8C+s8t0utkNxJG+YcWfCq74LdGi8A0zMNhVHJdILCGpx+/CZOhR75xW9DHbi3S4R
fRGTasSDbK0jUamU50XYpEjMn5183LwO7TyzLclm0QydWMcRfXw+MvXo3pHdkNvX
Yd78Po9YY7xgUurgTZmnhS87BaLqyUHwNh0OR3AEXhqystFjgMLOG48DdADCF1WE
n4xopQid57zrOv2m4Yoz9cIBdOH95N93tbbXn87DAI4VtYQHe+Omq6bUUjh6m3Iz
jGEf1fx83vWauOT5MWUMMALWdJ/oQzNWGmRoOBMkTPV0UzAqU+tXt9msSlfk+RUw
OhdK+ZOQaISxqzBgvdibKWfT5jT0utCWYGigtumSbtIL5P3qy5JEEktFvPT7ujDc
S2i9yRRSU8tNe+x+ZIp0HhltNAugsNTf+gtm7QU1bZzf0UQy3t4c8C+jaUXtsAwl
8Lvb8bJb5G4xD1zwibwCnyZGpmDKKobgGo3K93lii3vwXgRRqP8As+LYOqAal785
l+d/fq57MO52I2JuMR88wOTgvY4RKtm+jxc+cHwmXvaymvB+jUU=
=NnO0
-----END PGP SIGNATURE-----

--t4l8L3oJ0HN4NVEr--
