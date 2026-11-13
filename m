Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542959;
	b=gccioEzhL8XLsVnzVtxvkQC+EqEQ5iyQpBStAO/vpoznI+sSL4ip9R9E1SiNEkXLggb0
	 eeLkMP1XOK2IWp0yCiGVwkZn3w/CUE+HP+bRkmW9EMjdWOEZIdu4LZv0PYVH/sI+BmysM
	 kEzLs58LTUtIGxy9a6zHoXttv/RVOWYHH2YF+Q7vy1I8QkN7bhSiFiDV/JGBdUy4MpQZL
	 td94grbWNq4GKm2RqRS+520QU98ZnCwt2nlUO3b3bD+5qWbsP1aghkNn4MHgLEC1iqmr+
	 7tn6YOiMTjDjKyFtxnoX2+vsQfNtCGk1wcebTlaUpgPwTK0qbJNmwW64yuQXenXQ6ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542959;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=oxJwdV6GudRORS6+xCkHpUBq7wrbsMuF8vchiDDcCUg=;
	b=bwnoKksKZIpOZwpD9e2yOIizi3tlV5Swl/Fe7bhKwCMpnryWvyN8ylBd/J1Q+u/f/DD0
	 T7Tf8NXdrKuqyX1/tDDpu5SRXNNSh41h4ZZQV1zWNG0xb3n9HbEGCQWbywzP+pIP58eT8
	 tgli3NYn7w29gvGpAlvgs4TTYm3cPrABPvnSGNnzyFTTpEnYI2M4o0gVDd81JFxvQn6Gj
	 5Psx1hvhFowVsm6h4fKhRGz+QbbdIEIz8aDyjR7wyXKNJo3lI07r1KhCd/gU73f1ii4Do
	 hDT9zzDvcR1Qi8ToIQUR7dy+9w+SHA890OZNlzCRQcJYgCrGDwmoTUt2HW60KL0jTCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=SMakmhsV;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C08606A327
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 04:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C08606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=SMakmhsV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794542956;
	bh=oxJwdV6GudRORS6+xCkHpUBq7wrbsMuF8vchiDDcCUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMakmhsVVrkFRYwAXsTDP4feyIFTNU5E6tv4YBQ2zaQW0UxgzyvoxAc/6151EV7Et
	 9PbY22hHU1yycnAFJDFN/ODChDiwmd2HRyzgdfpFbyn+8W+zMfjhin+dclbXHAsn4c
	 b9BgpzIwImHyfVAR1DAyaebqHr5ZU/J1C1HVHGESmUB1d2wPmbt+IuI0vacEbBS/gw
	 82nB4X2kk4zey3H2XTOIQ9NHpCg4enwEZY8GTl60cCODjyCis1C5F6IEPP4TsKMGMu
	 PVz8Hcgt7VGx0/5E4pPIeOa7i8tIhumOfnNWM9kOzskpEIfhCgvMGt5C7DIYR5z+Vm
	 0kBxQNP/M68Qg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkKS0R9rz4wTk; Fri, 13 Nov 2026 15:09:16 +1100 (AEDT)
Date: Fri, 13 Nov 2026 14:50:52 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 05/18] dtc: Move the /omit-if-no-ref/ handling out of
 the grammar
Message-ID: <avaJGzg0hUAb9jyh@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-6-sjg@chromium.org>
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A0Qd4TN82K5E42B3"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-6-sjg@chromium.org>

--A0Qd4TN82K5E42B3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:32PM -0700, Simon Glass wrote:
> The grammar action for a top-level /omit-if-no-ref/ still holds its
> merge logic.
>=20
> Move it into a new merge_omit_if_no_ref(), passing it a struct fragment
> for the reference.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Use dt_ref instead of fragment_ref
> - Return true on success from merge_omit_if_no_ref()
> - Check the fragment type with assert()
>=20
>  dtc-parser.y | 11 ++++-------
>  dtc.h        |  1 +
>  livetree.c   | 21 +++++++++++++++++++++
>  3 files changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index bba98b6..1aaff42 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -247,14 +247,11 @@ devicetree:
>  		}
>  	| devicetree DT_OMIT_NO_REF dt_ref ';'
>  		{
> -			struct node *target =3D get_node_by_ref($1, $3);
> -
> -			if (target)
> -				omit_node_if_unused(target);
> -			else
> -				ERROR(&@3, "Label or path %s not found", $3);
> -
> +			struct fragment *f;
> =20
> +			f =3D build_fragment_omit_if_no_ref($3, &@3);
> +			if (!merge_omit_if_no_ref($1, f))
> +				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
>  	;
> diff --git a/dtc.h b/dtc.h
> index 5dca8bc..22a050a 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -373,6 +373,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *=
ref,
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
> +bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
> diff --git a/livetree.c b/livetree.c
> index 35beee0..a54009c 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -587,6 +587,27 @@ bool merge_delete_node(struct node *dt, struct fragm=
ent *f)
>  	return true;
>  }
> =20
> +/*
> + * Mark the node which an /omit-if-no-ref/ fragment refers to, so that i=
t is
> + * dropped if nothing refers to it
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);
> +
> +	assert(f->type =3D=3D FRAGMENT_OMIT_IF_NO_REF);
> +	if (!target) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return false;
> +	}
> +	omit_node_if_unused(target);
> +
> +	return true;
> +}
> +
>  /*
>   * Tree accessor functions
>   */
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--A0Qd4TN82K5E42B3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2iRsACgkQzQJF27ox
2GcGYw//Rh4y0TNZAkwWmk6Ar4vR5MavppuH8lzIZS6NoNGCXr9jblyetnWl52ke
qfKfc6NjS08Kkoqpmideiv5YQrFczQB6UEREd+a0YDGnKpewXxoWl+zrVOSk5R75
eFRNjywLa/SZT7oj3QYb6u7FFrOA7GcnaoFVYNjhGAjQlnyppDoyq2IAsLcTHQT0
dKvlKFWt1HTK02SlwPeQvg6RAZvyG/7pA8u/yhVmQvPnUlwuvW0XNQg9iaS2vwj5
t6GRcUwiClr/Xdm5QHwKiNOR5foUAANq7ys/9rCcf9+ey6Y5Bav6D+I41N4SJt9I
SI2Vgj8wyapZ3tGSCM2mrq6c5a1JEfbxA3Lr5kZwGFuJb/nA5zztryjaU6EygL1/
hlA4Hofui9wHOZkWAt2zhoXftrBlkT+LZ5y0qV3u7v07PiMgYECnjZZKbSg5nsRk
ULV9iBEKlxfSQQAwNkmsXIvG4oTYACtkvNkIhP6MavvniCrdpjcsLTs7meEiF5lm
C1hjq78ceTgPibEEuz3CDTPpc2V9MMVtqtH3Mo8xKVGM4HSMJCCpT5zScRGrTxvc
r+/R1ZAPh6iptoQUWwRh0HshZJLKdzlo+G7ZYHViBb544BcUkjfYneVA+doZyzZx
ViNXdcloPGTJpioTFkQVRFICoWBFn0nXnAMhVeFUQxZBCQe0jps=
=Fvtm
-----END PGP SIGNATURE-----

--A0Qd4TN82K5E42B3--
