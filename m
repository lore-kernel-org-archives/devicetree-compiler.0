Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613834;
	b=urbqDMjKimYtKYi3xl2E2Rh0VGGPkOuJ7meatsXmRuWhjGLQTVL2ARU5l0rcBXusQf3+
	 +aidyOKL4x4DWdv7hEvEdRmY5tqGIt8xCJvp58F6K/qLz9kpU25DU/6DpeAaZrlJBCMlK
	 7tBqYSsZmlksGpq73PkQ/gYtqUCEtlKUIKbf7twldySzj7AMUdfx68HvzHKPSLgaHjWiB
	 md1itYbuJ7MgHywIWmXZAPDyoZHuOWKg3sbVlyKVq1KXD6VpE4jbGH8w3uKcDFxh244F1
	 9sVBxHXT+loRLZHwxZzbXcw7gU9PxJTAuSJFZ1ICnyO/E12c8ke4cF8qJHAWLaG2IgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613834;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qKBtrnKt3S1a1L+9j5UERscu/cXV+OV6WBvKD895sjE=;
	b=GJZSEN1EO6kbpEdTpq9X3PAhEBYl7vUeWQGDfE+4m2iox67QiXAiJBGabCTPvTcstzH6
	 RSGNkJBvWgpw15zYu7zAYTZMpqxY5iTQ4yKLttgW6LtVlCinor6WQFT9p5rtSoFhYenEY
	 LBTDojyg7fyD+x6yRWUWPpFx9ePQoyZM7SWA54xb+MB/+V410AeAlDVq70gdSGnY2Is2G
	 uuH4yzFDLkFln/km3ujsDKskpohP60bSNGjoQY1Mht30fXHCKyz3pY/F+5497fQ6BmXZt
	 9HqaonoMKJTYaIP0CWQTOdc1mwgUxcqgUjC4VXTjln3gcMIulwsao6vkt9+PVuJrJ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Dm7NPkz8;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A29606A33E
	for <devicetree-compiler@vger.kernel.org>; Mon,  2 Nov 2026 10:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A29606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Dm7NPkz8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793613830;
	bh=qKBtrnKt3S1a1L+9j5UERscu/cXV+OV6WBvKD895sjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dm7NPkz8LbqxOB2hO41rA2a6dY7sny/EyCnA1Gm/PKvm7px6Ggp7TcER8MkjoO4Iw
	 W3iveXpezWDKXG59zDAJelydwgZc63b0u1CqHiluIw+59inpLz+9tQOFukCGTY/yG2
	 +ef7p0HoUyM3VN2tKgoegfsYm+54cDsFhCxMEjYZD3yIrkj3yMpB/iCGh8N7ydv0R7
	 GmP4Ziy4LuUn3qsSDeBF4DNhL0JSYb4/fEdMPvoZhhyaA2hjav7iCtVBAU4QPgpHsW
	 RLFJRPS93ylD3lSSZRN/dfbym0rlxUFF92QYVZjhm0Ykuvgv3ycJYm2L0RIJZworeO
	 X1G2dmlwmaNgw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ6jf5Tftz4wDg; Mon, 02 Nov 2026 21:03:50 +1100 (AEDT)
Date: Mon, 2 Nov 2026 21:03:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 04/13] dtc: Move the /omit-if-no-ref/ handling out of the
 grammar
Message-ID: <auhf83NDY96w-GVi@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-5-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="jZL1jIQZuyuxnNrG"
Content-Disposition: inline
In-Reply-To: <20261101163721.2458982-5-sjg@chromium.org>

--jZL1jIQZuyuxnNrG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 09:36:58AM -0700, Simon Glass wrote:
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
> ---
>=20
>  dtc-parser.y | 13 ++++---------
>  dtc.h        |  1 +
>  livetree.c   | 20 ++++++++++++++++++++
>  3 files changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 61301a6..089ab55 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -256,16 +256,11 @@ devicetree:
>  				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
> -	| devicetree DT_OMIT_NO_REF dt_ref ';'
> +	| devicetree DT_OMIT_NO_REF fragment_ref ';'

As in the previous patch, the fragment_ref nonterminal doesn't make
much sense to me.

>  		{
> -			struct node *target =3D get_node_by_ref($1, $3);
> -
> -			if (target)
> -				omit_node_if_unused(target);
> -			else
> -				ERROR(&@3, "Label or path %s not found", $3);
> -
> -
> +			$3->type =3D FRAGMENT_OMIT_IF_NO_REF;
> +			if (merge_omit_if_no_ref($1, $3))
> +				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
>  	;
> diff --git a/dtc.h b/dtc.h
> index 9f9076d..e747dc0 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -369,6 +369,7 @@ struct fragment *build_fragment_ref(char *ref, bool p=
ath_ref,
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
> +bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
> diff --git a/livetree.c b/livetree.c
> index 5c9ec48..5ed2085 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -561,6 +561,26 @@ bool merge_delete_node(struct node *dt, struct fragm=
ent *f)
>  	return false;
>  }
> =20
> +/*
> + * Mark the node which an /omit-if-no-ref/ fragment refers to, so that i=
t is
> + * dropped if nothing refers to it
> + *
> + * Returns true if there is an error, which has been reported.
> + */
> +bool merge_omit_if_no_ref(struct node *dt, struct fragment *f)
> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);
> +
> +	if (!target) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return true;
> +	}
> +	omit_node_if_unused(target);
> +
> +	return false;
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

--jZL1jIQZuyuxnNrG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroX/MACgkQzQJF27ox
2GeXERAAldy3CNZ/7Qi8ygwWYvZXqxmzrqSxHF7hsog2m5IgdhVzgEX7KjGtakaY
4pEiadKRsQP5J1JA28XozSXO1KqpSKttnO5vdHdAAY9Fq4ey+VxwJMqPqlXIWnfo
64i8e3DbXoJKx3d8SZw+trgSVhdHlPhsDvYyr8ae5efyWrFiO/Pzobzi40zo/a5S
Old9QhipPfjTusqkemWRCTdruiFN4OTFDKKT74BpVij2Y74V19E4K82CB2MeRBZ1
/I1R4NaGb8T7BUax66SL2jVGaqnKBWk0Do+EPBK/786+K4o7oXdiw3Rt3UU8E9IY
Tj/68iJWJx+X8prh17dcRaUXm4cwsODk4m9nt7K1wOJqOKqBGQtIdeFCD1hte3Bh
kesnSev5oh0r/xfX3fBb885Rls43qGrAFZh9Tq+ufakVOoREcXJmrxrNwdTf8iuE
BtY2eQzwCH7MIfLAmwT+Uurcv94st1IPoPvuk8GQNfw5f/YXZkG+bW44c0ZAFvoV
eHMkcno6iMvAOQMFvDpZk0GCs/niv1AQyQEPQCWcNNSiVfXZ/rm2ds11D8uYmTZj
fkXc6/37R9DaLVnKeXkoqaaoF0HNTmwRickAMDzMpF8ske8jNb7NX3m4OX+byc7Q
+znHVL+4733l/Hg0d8D2Be+XBT7YrEa4WZuIiMJPWk0vg3Z81VA=
=qNbu
-----END PGP SIGNATURE-----

--jZL1jIQZuyuxnNrG--
