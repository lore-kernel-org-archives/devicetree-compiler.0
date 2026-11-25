Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795568457;
	b=q8NShv3Min0S4qgL/HNGtb9WbcxuELp+Pn/+ecG3gbKOfXjM6PoRsRQDdD7HONLpR9V/
	 ehmKQrzsI9xPjLMBAwm2xKdIHS4Y654eOYuPbLjEeNjtOraVfLUy8tTw451yN99QzA/sD
	 XhoT1ZxlLbKJT1702fwd4jvUOD648WPowM5tLW7fBnPPHaiRipwuTQrr2U4so/KaqV/Pn
	 xeVK6Gcbf7dAWclW/kEne+pDPpVWxyaVzoTvZUFTFK+lYnO69c9eOu6Jei2HYXXDfgvKc
	 JbrUS3TAHijFLNwapBpfzZWLJNcONAYAqmc9mI9uk+A7xPTDhvJWvthKMhnwDpbCEYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568457;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=mZ9QKHRfzHyGchl+4Wd/KAUSNQawzXobrsRjU/yalPA=;
	b=SufQ6F9vvKnPTMQLx/tq8eBX6sUALI2vtjPr/f4GVUQyvIlhLGDGiIqJ3TQpbELl83yt
	 6uZfpDFptkPLys/QbNfGdMZANOX+YV63oOsU7xaGqs3f88WLUlSS0Jf9uc8S8ri8x3ViB
	 x0Hg4StB9PE1nixmKe+s0Ou61aG5cGHuauxJmEnsJ6TdqUfiocCh7P6P1CPfC49qZ5iGK
	 aquYGjIzx7dm/04d34YjJDcEg57cYHTLEZ3+B9xg+QwdrBMdMZmq3Eio6+2YEFKV6wdcl
	 zoArPsa65EafJaKWywfLmH3cHfyCSG4yKP63eqBkLf27AxIHDh7c7ic+SYQxvRWq+Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=JmQWN+po;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A47606A321
	for <devicetree-compiler@vger.kernel.org>; Wed, 25 Nov 2026 01:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A47606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=JmQWN+po
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1795568453;
	bh=mZ9QKHRfzHyGchl+4Wd/KAUSNQawzXobrsRjU/yalPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmQWN+poC6jHekYZ7y9tPPQ7Zl64i2RN8Xt1TTNfgyJoEb80NUmD5ePqa9EhjQ0xJ
	 Efx8Bt/un0TTvkH41/0b8Is0rGYpvkRQsFqW8AjLNRfGDRJYwHiAKF4YM3TAwRbYOt
	 rwau6YFx9JpNsPOTiICcbktTRDVH8H+kDaiPbIwopvmmHPJ5yJCTkD0QvRHf0UTNTS
	 qik9ajQu6gmtJoWG2mxWt/d37n031Ob4WNS5jYaUAoiQYlxucwohKbqg+3+dMejaKw
	 x56CvjofzHhjQSbzQbleySYzksl2Gao+rSawMqgRCSwQaoN8SQUNSBDrsWP823dr7z
	 EFC31VlJ87YhA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jZ1ZY33RYz4wKf; Wed, 25 Nov 2026 12:00:53 +1100 (AEDT)
Date: Wed, 25 Nov 2026 11:48:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 03/10] dtc: Move the /delete-node/ handling out of the
 grammar
Message-ID: <awYwOnMy1Y3OLLsF@gractus.seuss>
References: <20261116235813.935070-1-sjg@chromium.org>
 <20261116235813.935070-4-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="cl4OK3YdHWJUQZUK"
Content-Disposition: inline
In-Reply-To: <20261116235813.935070-4-sjg@chromium.org>

--cl4OK3YdHWJUQZUK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 04:57:57PM -0700, Simon Glass wrote:
> The grammar actions merge each top-level fragment of a dts file into the
> tree as it is parsed, so the merge logic is spread over the rules for
> each kind of fragment. This makes it hard to follow and to change.
>=20
> As a first step towards moving this logic into livetree.c, move the
> action for a top-level /delete-node/ into a new merge_delete_node(),
> passing it a struct fragment for the reference.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

Apart from the name change suggested earlier:

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> Changes in v4:
> - Free the fragment after merging it
>=20
> Changes in v2:
> - Check the fragment type with assert()
> - Return true on success from merge_delete_node()
> - Use dt_ref instead of fragment_ref
>=20
>  dtc-parser.y | 12 +++++-------
>  dtc.h        |  1 +
>  livetree.c   | 20 ++++++++++++++++++++
>  3 files changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 45a699a..6bf96a7 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -239,14 +239,12 @@ devicetree:
>  		}
>  	| devicetree DT_DEL_NODE dt_ref ';'
>  		{
> -			struct node *target =3D get_node_by_ref($1, $3);
> -
> -			if (target)
> -				delete_node(target);
> -			else
> -				ERROR(&@3, "Label or path %s not found", $3);
> -
> +			struct fragment *f;
> =20
> +			f =3D build_fragment_delete_node($3, &@3);
> +			if (!merge_delete_node($1, f))
> +				treesource_error =3D true;
> +			free_fragment(f);
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_OMIT_NO_REF dt_ref ';'
> diff --git a/dtc.h b/dtc.h
> index ac18616..41ba438 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -351,6 +351,7 @@ struct fragment *build_fragment_delete_node(char *ref,
>  struct fragment *build_fragment_omit_if_no_ref(char *ref,
>  					       struct srcpos *ref_srcpos);
>  void free_fragment(struct fragment *f);
> +bool merge_delete_node(struct node *dt, struct fragment *f);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
> diff --git a/livetree.c b/livetree.c
> index 4231c64..ce47fe2 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -534,6 +534,26 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  	return dti;
>  }
> =20
> +/*
> + * Delete the node which a /delete-node/ fragment refers to
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_delete_node(struct node *dt, struct fragment *f)
> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);
> +
> +	assert(f->type =3D=3D FRAGMENT_DELETE_NODE);
> +	if (!target) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return false;
> +	}
> +	delete_node(target);
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

--cl4OK3YdHWJUQZUK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmsGMDoACgkQzQJF27ox
2GeAmw/+K0R7zhyB9r5o+xpcW6NZAv3OudeWiW0DHNIWRHUDReDvQejGz0GNgZwG
PwiEph6+DfGcKedA2GoTcpT4atM6PW1FQzjKfdRnQqsoMzVBFE+yeQScgOpAmHJs
L1X8zUVFxw9Ao0KhNv5r5ylerkG1tSs64OYtf6Jsy9JTUoeQXMo60BlJh5hCj16Z
oOBHATcHL0ZhRsopAaKUWAE4Co7/n6HKIL0i+HioV1B9oz2RmdJ31wj8g91HUny0
uui8tPScctxFCBIijOLf8V89g/9JxrTRcVRwRKrbjK1CTK90jQYPh1EtZ0zxPcjH
js9FRH2zl9OVcnxYbKHL1fm36vMP1vxJSd0d4taHY3riKeKGa28MkHwqpsCVLPAs
wGiMm4u51SW5Iv56jDRacdURetPY1gxr/R8mCtko+kcn5RfgXYwnsQ/qNXVvrjlX
uPe8w4Hmi7FjO+NKw7AVOwFikqYv07toa4icGTiKj3f+P3vhIN3fV6ROOFe3NEJj
y/5I7IoYaYIrQOVngUG4uuoubRbdxOr+NEXhMuF1wUn2VLfaUbT0e7ty3h1uC2Gs
xoG8/UtMW2druXN16O5XASZEAZWv+3R55W3EZgoNGDKJ/mVFL9FwUGEYiLMn86GA
k+iAiywwqq3zViSf0/CbLhcRnCBIpjU0ToVc+6m/eHMMLwvvCu8=
=zyyz
-----END PGP SIGNATURE-----

--cl4OK3YdHWJUQZUK--
