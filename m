Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53413280325
	for <devicetree-compiler@vger.kernel.org>; Thu, 21 Aug 2025 04:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755750708; cv=none; b=tsa60SSSbSskhfGYq3sqriQqD1WUmLNFqgYc/eNm2S7LRkcctUIKf9AaayyyO3HH+NLMLhCPpVetOFp+wjWku1tR2QctkCd/0PT3apEgv18qUI1y16SCGQzPa7D5mEjZJh+Dgk1M73LIhNQd8PJmdKp4Gteh6thVXLk3sgUPYK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755750708; c=relaxed/simple;
	bh=DwZQwYyw/CAH3xLvTyoyIs2Za27a2SA7U5Ko1TKhNxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bebG0KdAlLCNPHe8CLHKEerfLUaJrLqueCLOJj6glJGCsYC33PqMlPwamxEnI2lNWh0lo9NXHAXtQLs3w/mphRo8ibTo4kA1Hm+oxbjqBWQrBHo3feqSEfvazg5rYmH+ArWS5mptb817Z5SxeilSJvI6//ECDuVdPMgHSvucuic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=VuH8K7LK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="VuH8K7LK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202508; t=1755750703;
	bh=bxe66g6LgXKBEpb/sDH7GzsFbNP2BBHKCJZF/KAdBKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuH8K7LKFbU7kXdLDTtnuBq8pYLgYTZRiM7L01oiFHFmaLrFGlYi4SD7hoWnvDhDA
	 QMU7V7FrHFgiy2B0xy7nIUWaMtyJwFdnaB5Gk/97hyq1MAOsTWS7sjEtFhC7aVX3+V
	 9aBOj0SF3ww2WsvKHCPSzg9MP77pA1OGOBEtQ/8MD/CluY7hRPOq6mtLWyDkOWLoOm
	 LLF4eA+h+dIaNzr4sVahgUhGtDMWtjaWtSvOUmXc/04FY18OqQBU6XWnVM8iBtSFJM
	 lY+MLXt6tjOrRf4nCf7BtFU5Ci8otHMh5cMU6cLLx78FlFag37sOif5TmjpQJSdMDM
	 PWlJU8CnNjZGQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4c6r4b64Xfz4wbY; Thu, 21 Aug 2025 14:31:43 +1000 (AEST)
Date: Thu, 21 Aug 2025 14:24:50 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree-compiler@vger.kernel.org
Subject: Re: [PATCH 3/6] Improve type guessing when compiling to dts format
Message-ID: <aKafkjp1r5fUKYEF@zatzit>
References: <cover.1755692822.git.u.kleine-koenig@baylibre.com>
 <e3584b641b6c81199716d5ff745de821fe4446a3.1755692822.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GE+B8QMabGBPSgbV"
Content-Disposition: inline
In-Reply-To: <e3584b641b6c81199716d5ff745de821fe4446a3.1755692822.git.u.kleine-koenig@baylibre.com>


--GE+B8QMabGBPSgbV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 03:11:29PM +0200, Uwe Kleine-K=F6nig wrote:
> In the presence of (non-type) markers guess the type of each chunk
> between markers individually instead of only once for the whole
> property.
>=20
> Note that this only gets relevant with the next few commits that restore
> labels and phandles. Note further that this rework is necessary with
> these further changes, because phandle markers are currently not
> considered for type guessing and so a phandle at an offset that isn't a
> multiple of 4 triggers an assertion if the property was guessed to have
> type TYPE_UINT32.
>=20
> Now that guess_value_type() is only called for data chunks without
> markers, the function can be simplified a bit.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  treesource.c | 70 ++++++++++++++++++++++++++++++----------------------
>  1 file changed, 40 insertions(+), 30 deletions(-)
>=20
> diff --git a/treesource.c b/treesource.c
> index 72d1cb5508b5..576495902f0d 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -173,23 +173,20 @@ static struct marker **add_marker(struct marker **m=
i,
>  	return &nm->next;
>  }
> =20
> -static void add_string_markers(struct property *prop)
> +static void add_string_markers(struct property *prop, unsigned int offse=
t, int len)
>  {
> -	int l, len =3D prop->val.len;
> -	const char *p =3D prop->val.val;
> +	int l;
> +	const char *p =3D prop->val.val + offset;
>  	struct marker **mi =3D &prop->val.markers;
> =20
>  	for (l =3D strlen(p) + 1; l < len; l +=3D strlen(p + l) + 1)
> -		mi =3D add_marker(mi, TYPE_STRING, l, NULL);
> +		mi =3D add_marker(mi, TYPE_STRING, offset + l, NULL);
>  }
> =20
> -static enum markertype guess_value_type(struct property *prop)
> +static enum markertype guess_value_type(struct property *prop, unsigned =
int offset, int len)
>  {
> -	int len =3D prop->val.len;
> -	const char *p =3D prop->val.val;
> -	struct marker *m =3D prop->val.markers;
> +	const char *p =3D prop->val.val + offset;
>  	int nnotstring =3D 0, nnul =3D 0;
> -	int nnotstringlbl =3D 0, nnotcelllbl =3D 0;
>  	int i;
> =20
>  	for (i =3D 0; i < len; i++) {
> @@ -199,30 +196,49 @@ static enum markertype guess_value_type(struct prop=
erty *prop)
>  			nnul++;
>  	}
> =20
> -	for_each_marker_of_type(m, LABEL) {
> -		if ((m->offset > 0) && (prop->val.val[m->offset - 1] !=3D '\0'))
> -			nnotstringlbl++;
> -		if ((m->offset % sizeof(cell_t)) !=3D 0)
> -			nnotcelllbl++;
> -	}
> -
> -	if ((p[len-1] =3D=3D '\0') && (nnotstring =3D=3D 0) && (nnul <=3D (len-=
nnul))
> -	    && (nnotstringlbl =3D=3D 0)) {
> +	if ((p[len-1] =3D=3D '\0') && (nnotstring =3D=3D 0) && (nnul <=3D len -=
 nnul)) {
>  		if (nnul > 1)
> -			add_string_markers(prop);
> +			add_string_markers(prop, offset, len);
>  		return TYPE_STRING;
> -	} else if (((len % sizeof(cell_t)) =3D=3D 0) && (nnotcelllbl =3D=3D 0))=
 {
> +	} else if ((len % sizeof(cell_t)) =3D=3D 0) {
>  		return TYPE_UINT32;
>  	}
> =20
>  	return TYPE_UINT8;
>  }
> =20
> +static void guess_type_markers(struct property *prop)
> +{
> +	struct marker **m =3D &prop->val.markers;
> +	unsigned int offset =3D 0;
> +
> +	for (m =3D &prop->val.markers; *m; m =3D &((*m)->next)) {
> +		if (is_type_marker((*m)->type))
> +			/* assume the whole property is already marked */
> +			return;
> +
> +		if ((*m)->offset > offset) {
> +			m =3D add_marker(m, guess_value_type(prop, offset, (*m)->offset - off=
set),
> +				       offset, NULL);
> +
> +			offset =3D (*m)->offset;
> +		}
> +
> +		if ((*m)->type =3D=3D REF_PHANDLE) {
> +			m =3D add_marker(m, TYPE_UINT32, offset, NULL);
> +			offset +=3D 4;
> +		}
> +	}
> +
> +	if (offset < prop->val.len)
> +		add_marker(m, guess_value_type(prop, offset, prop->val.len - offset),
> +			   offset, NULL);
> +}
> +
>  static void write_propval(FILE *f, struct property *prop)
>  {
>  	size_t len =3D prop->val.len;
> -	struct marker *m =3D prop->val.markers;
> -	struct marker dummy_marker;
> +	struct marker *m;
>  	enum markertype emit_type =3D TYPE_NONE;
>  	char *srcstr;
> =20
> @@ -241,14 +257,8 @@ static void write_propval(FILE *f, struct property *=
prop)
> =20
>  	fprintf(f, " =3D");
> =20
> -	if (!next_type_marker(m)) {
> -		/* data type information missing, need to guess */
> -		dummy_marker.type =3D guess_value_type(prop);
> -		dummy_marker.next =3D prop->val.markers;
> -		dummy_marker.offset =3D 0;
> -		dummy_marker.ref =3D NULL;
> -		m =3D &dummy_marker;
> -	}
> +	guess_type_markers(prop);
> +	m =3D prop->val.markers;
> =20
>  	for_each_marker(m) {
>  		size_t chunk_len =3D (m->next ? m->next->offset : len) - m->offset;

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--GE+B8QMabGBPSgbV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmimn5EACgkQzQJF27ox
2GeSrg//U0QD+plMJmMequRh1elE9Ar3t79KHToctlTnhqBfr7WrsAAv074pHVXi
H1U73blBMMfR1U2UYRL8bcnaoKQZl/w1yCqc6OzS+3Ap17tKBdGd/AsDz6LpvG+K
C58dy76155pEZX3gkgwHPN8BD9mLrDIL3CeJ7jUY7Fo51jyrhTs+JcLOkr3l85Vm
kZRTBIKVFFu8crGuTrCBiy/hAJ0uuH3iwwtOtTs06GM6Ui1DQ78yQmLyoGchZq9s
Ypue9wCUa+S9d6rolrGtauxfPd9QOfXmMasSD2QTOszA4NXYt6whz7i3ZBiavrGM
FrDPq733HoRv5y+goXe1y2qwgF3ok1d1aq8JGSFtTSWjue+yBtx7qKIPyLtJhMLw
xiWHPzpIhUFotuxekceF94C1WYu/8ogHKr5WKOS0v1AK5axYuf4jVVkoKCCHn2Xw
fpKZYmsuA9rA/OVnB6Q1PY4GK3EmT7/BvXP88iNXPqdj8TXrgGUbjrzlUK+IL0Gg
i+9jfid2PcQ0Vj1WH7sx2ko/zqsyAWaV3wHjvTp3jl6NxWUTmuahVSXu7tB61R99
WHnv2y8CCmpTFAx4NlmtpiAN53vfuu67b7GDusj19w1eKcRkgGsuDde/j0zxDqV0
SBV2PdmsLE3BKp/ewRiYr7RAMIbKuiOylbKaab362jiPzTivXmk=
=9gjW
-----END PGP SIGNATURE-----

--GE+B8QMabGBPSgbV--
