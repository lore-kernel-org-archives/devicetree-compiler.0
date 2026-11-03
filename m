Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691268;
	b=Bl6FwzSm80PMlRdir+TJ9WVeFM4v1eaVaT3uEo8kG29sSYhdolAWyyFekH9xjdhQPJzL
	 QkH7UWi+9XOtTf7aZ3hD/KZrtz+YBXUbQx/TW0/PB7k21oxc0LQBeJDGG61XP6QNmd9x3
	 hCyaGXXkuHxtGZJZ298YdYdaHzsNYRxDpusfS76yjLRMw2p/L+4yyeHM9AEW78CIdJ5MQ
	 9XWHCLzjXSZq8I393lwWrKb0RB0ssCX2RtXfF+3cRLn0HpspQeZpSmCorqRoFtGp0+Ddo
	 ODtlh7GdiKcow8On8tLjHaSCDkrzHbyk4Ht8f2wDJfNkbX+r7jtjldNhDp8PPiolWtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691268;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=8C8G9bE5KMu32ARkWMm3xcR8slVktkVyskz061XY3ko=;
	b=nmTMOHHPIacRam+vCzufpXq1OYOSHIBzHMuhGcNZJxCaX9V6AOWeBhiKhKvRRhKkdxwY
	 HxMNJEiAIXk0hqfOX9P/WcYEE/nMQyY7wLnjPwNBApkstLuC8XztDPedbNuR/HuaCxme+
	 Mqw5oTnCqJnSr4PCZT/VpIm4tQLiyVRbROXy++ywd/CgBK3/5VrlcfBCSg5tgiYjJD3y0
	 q5zDM0x8jo9iHoETT3h+P/jtHDMUMyPB4t6F9UczAkuJ9D6R6KokJU38KQnkgnVoodT/V
	 +u4vRzh19j+Npltg5fzt58Chcc3sWnWADQ8c38ExpdYfC1h0GfRVxxY4RwH7jS/7tJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gPSX1wv5;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECDB606A330
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 07:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ECDB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=gPSX1wv5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793691256;
	bh=8C8G9bE5KMu32ARkWMm3xcR8slVktkVyskz061XY3ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPSX1wv5W3K9luXdwfzgSyxKrV+tGDlkRwvyvj2xTn1qCbvTTtZsrc/i3PcLSSCzX
	 TY1q/zgH3tsXUSPQjLphapEO3imqJJfabZkWb+o2xjGAzqIzwSP20KBCnLSd/KzX2R
	 oORRbVbsoELlEpySf3P5o/9J8sUbeKLhiPKh/8vdX4J3P31c9UpZR2q5HyZWltX9Qs
	 Us2U4+N1pnFxxh29AP74u2OjT1QNlDzHpS4OUrhI0/oZDhK6c5bzp9fWlEkBeLEcGk
	 vMLpIRcorguXfEItDGHqg3ZusYivSmt/+LigzLswS4c5Su4KB5Z2Ab4XcJQY3bBKPF
	 FCzKuFsPSo8wg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJgLc5wShz4wCM; Tue, 03 Nov 2026 18:34:16 +1100 (AEDT)
Date: Tue, 3 Nov 2026 18:25:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 06/13] dtc: Move label-reference handling out of the
 grammar
Message-ID: <aumMd9lWB2yZHHKT@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-7-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="VvGs3EIGQmXvJW5v"
Content-Disposition: inline
In-Reply-To: <20261101163721.2458982-7-sjg@chromium.org>

--VvGs3EIGQmXvJW5v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 09:37:00AM -0700, Simon Glass wrote:
> The grammar action for a top-level &label { ... } holds its merge logic,
> including making an overlay fragment in a plugin when the label is not
> found.
>=20
> Move it into a new merge_label_ref(), passing it a struct fragment for
> the reference and node. The rule cannot use fragment_ref yet, since a
> path reference still has its own rule, so it builds the fragment itself.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
>  dtc-parser.y | 23 +++++++++--------------
>  dtc.h        |  1 +
>  livetree.c   | 25 +++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 14 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 7545895..1a5ad12 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -227,21 +227,16 @@ devicetree:
>  		}
>  	| devicetree DT_LABEL_REF nodedef
>  		{
> -			struct node *target =3D get_node_by_ref($1, $2);
> +			struct fragment *f =3D build_fragment_ref($2, false, &@2);

As noted previously, having this build *some* of the fragment, but
then requiring it to be completed...

> -			if (target) {
> -				merge_nodes(target, $3);
> -			} else {
> -				/*
> -				 * We rely on the rule being always:
> -				 *   versioninfo plugindecl memreserves devicetree
> -				 * so $-1 is what we want (plugindecl)
> -				 */
> -				if ($<flags>-1 & DTSF_PLUGIN)
> -					add_orphan_node($1, $3, $2);
> -				else
> -					ERROR(&@2, "Label or path %s not found", $2);
> -			}
> +			f->node =3D $3;

=2E..here is pretty ugly.

> +			/*
> +			 * We rely on the rule being always:
> +			 *   versioninfo plugindecl memreserves devicetree
> +			 * so $-1 is what we want (plugindecl)
> +			 */
> +			if (merge_label_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_DEL_NODE fragment_ref ';'
> diff --git a/dtc.h b/dtc.h
> index d145b03..256017f 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -369,6 +369,7 @@ struct fragment *build_fragment_ref(char *ref, bool p=
ath_ref,
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
>  bool is_ref_relative(const char *ref);
> +bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
>  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> =20
> diff --git a/livetree.c b/livetree.c
> index 027682a..2a01d49 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -548,6 +548,31 @@ bool is_ref_relative(const char *ref)
>  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
>  }
> =20
> +/*
> + * Merge a fragment which refers to a label into the node with that labe=
l. In
> + * a plugin, a label which is not found becomes an overlay fragment.
> + *
> + * Returns true if there is an error, which has been reported.

I generally prefer bool-typed functions to return true on success,
false on error, whereas for int-typed functions 0 for success, -ve for
failure is the convention.

> + */
> +bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin)
> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);
> +
> +	if (target) {
> +		merge_nodes(target, f->node);
> +		return false;
> +	}
> +	if (!plugin) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return true;
> +	}
> +	/* The label may be in the base tree, so add a fragment@N node for it */
> +	add_orphan_node(dt, f->node, f->ref);
> +
> +	return false;
> +}
> +
>  /*
>   * Delete the node which a /delete-node/ fragment refers to
>   *
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--VvGs3EIGQmXvJW5v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrpjHcACgkQzQJF27ox
2GcvJw//WwYKQpskP7PiTXw1A8MVlv39lDpF9sF5rEsDKKf8LSAo9fy9VQPnGU9N
hq0nR4tJsnmcBPIMJpoVFk76qkyzlP1Nt0NVavxyCjVg1zQUn8pF4QRESbjNk3QA
vEPpZwKnbQnUN7d9X6s56XgdYeP9KcTJcrxAUbSA9JvJU7zb/+AfhwOThKTBdjNn
xh/3nVa4Lpkyims5FDqhAZvWj06vrruXZ6TzBl0CQ/FKd8jaa6nvORUcH/jSsmIX
in6FsEcOv3kyWEIBbz0zka6Op3GHNUKCKNSxkJkzQKRYWrAMP0FBh8ptBAXgKokn
AaOFX3Zj/JDGWHUfCnMacg1F9Yll9vxLVD9C+XsY9xIsHHGTYuErySozzpQeIDim
96XX/gWdziq70UIJGYsKpYjY8rH4V9puz1D1DJuuS6kRLPY0Gl7vyZEnQs7twzqs
q81Agkklgj3sUZY1UZEMDQwReMvp3J4Jyj1tj1IZEYI0tWnrSHr5fqJcPX0+w7oc
YuDU66RFVz+a61jErilMi8VZ8AuAXWJev+msrPUpdPJA6QMAdgOt0GxPWcXX9bCp
j8oMFc0YHu1RI5TJwgpkcaLAvh3tFjX1/Oa3sW5xeKS4K+OzHrB+JNF/ADzUEfOk
5JOI4jGCtvA6xQMoFe+RWJiDhreKS73g1FtOMLAOVl7B9lMulLA=
=YXf1
-----END PGP SIGNATURE-----

--VvGs3EIGQmXvJW5v--
