Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543577;
	b=HIaFms4xrio+dcsQEc6zEYELfHHbwfzj2LUCAyF6v2D90o2G1hO2XEciWATcUFWqCMoA
	 I5+k172Rg8K2iSfeV1i8/+/bjUZ//L1KXrczSCYRwpV/JAZfyunKeRWo0RXTCx7XBgIjb
	 IUomXCNpiDzAk8V8KhwQLn3uF9VfnhZdfB+yRmqm0BcLOA9M33TCHMSbOISy4SzEQJPXv
	 saA1e+U/W8VLhgzg8++9zIz4OvbHCzyy68H/Us6+aLEG1vlVN1Ot7xCTejyC6TMF9kqv0
	 VVfGqGKAGSh9ZytEyTtE/INALhvZZwnaL41e9u9ujc5QWHF6mLZLz56fuJcQUf24jcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543577;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=uV2WfLMkDJXhPKo1qyXULefW68T21ENzXEyQ829xdkA=;
	b=doqIJegX5Q5DdKSZigXi/ByAn4NgznpKT79/+f+ZpI11pBrp0KY6gqrdRxMURrHPrvoK
	 jI5QjBJonOnEE30YTxXqRFf8i3PoE3Xi2WR6EZIIuvRK2AN6jzhaCJlLm1sq0OeizZw+9
	 S7HKT66ljAIj0mSWh0Hdy8XfycQO/GezpUGyPE0/DYHb9hWTPWhtbwpZcFuRYbioGZh28
	 pqsSD6rwUGH00wNP4CCxNZK2W84nawfTDRZykauPObZsdaRd9iVf9bB9ZNV4k6hCZtqIZ
	 FB+aQycc+xlMfOSTIbWNErTqamj1ajlM9GbjlHlc7fIbXnja+JU9EliP8wx+2AIkofQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=l8kJNXEb;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3C1606A323
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 04:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B3C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=l8kJNXEb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794543574;
	bh=uV2WfLMkDJXhPKo1qyXULefW68T21ENzXEyQ829xdkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8kJNXEbBBV1SuV8wpQhiRV9fVI65MRRGPfYVEDgOQGp68Nct6ygbyYWPzQethUih
	 lFIg310JW9MEm1P7GB8Me1ZMr+FCYPAlCJBrKE83HaYZSPoJLedl5vojeudj9nFunl
	 gUyZ+oMGkuOieApHAd2Gcfk5T5mzq1JiJo5kelLZMyaN1BphI8Ur3xG76XqRTYOu1M
	 /eozMapKxvi76N0WBvbZHtCZ36GZBKyhpNYtXIJ9/3ILHCIS/23jbKGwj6r2z5Bj4m
	 ArS9uM8IKW6Qh+NzHsl5xnN1l98VDL6YbPBy2v9SWAp3qDC1yZ/s/F9/MftXRDQOIi
	 gGwFpdsVwaI8w==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkYL6b1Fz4wTN; Fri, 13 Nov 2026 15:19:34 +1100 (AEDT)
Date: Fri, 13 Nov 2026 15:19:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 11/18] dtc: Move first-reference handling out of the
 grammar
Message-ID: <avaPzn8RJMGiOWZA@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-12-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="TSBHqCebxsqtKdyN"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-12-sjg@chromium.org>

--TSBHqCebxsqtKdyN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:38PM -0700, Simon Glass wrote:
> In a plugin, the first top-level fragment can refer to a label or path
> instead of being the root node. The grammar action for this holds its
> merge logic, which makes an overlay fragment in a new tree.
>=20
> Move it into a new merge_first_ref(), passing it a struct fragment for
> the reference and node. This is the last user of is_ref_relative() in
> the grammar, so make that function static.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>

I hope the first fragment will be less special cased than this in the
end, but this looks fine as an interim step.

> ---
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Use dt_ref instead of fragment_ref
> - Return true on success from merge_first_ref()
>=20
>  dtc-parser.y | 13 +++++--------
>  dtc.h        |  2 +-
>  livetree.c   | 30 +++++++++++++++++++++++++++++-
>  3 files changed, 35 insertions(+), 10 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 8d505a1..abeee0d 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -163,19 +163,16 @@ devicetree:
>  		}
>  	| dt_ref nodedef
>  		{
> +			struct fragment *f;
> +
> +			f =3D build_fragment_ref(NULL, NULL, $1, &@1, $2);
>  			/*
>  			 * We rely on the rule being always:
>  			 *   versioninfo plugindecl memreserves devicetree
>  			 * so $-1 is what we want (plugindecl)
>  			 */
> -			if (!($<flags>-1 & DTSF_PLUGIN))
> -				ERROR(&@2, "Label or path %s not found", $1);
> -			else if (is_ref_relative($1))
> -				ERROR(&@2, "Label-relative reference %s not supported in plugin", $1=
);
> -			$$ =3D add_orphan_node(
> -					name_node(build_node(NULL, NULL, NULL),
> -						  ""),
> -					$2, $1);
> +			if (!merge_first_ref(&$$, f, $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error =3D true;
>  		}
>  	| devicetree DT_LABEL dt_ref nodedef
>  		{
> diff --git a/dtc.h b/dtc.h
> index 9b4389b..1befd5c 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -372,7 +372,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *=
ref,
>  					       struct srcpos *ref_srcpos);
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
> -bool is_ref_relative(const char *ref);
> +bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin);
>  bool merge_ref(struct node *dt, struct fragment *f, bool plugin);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
>  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> diff --git a/livetree.c b/livetree.c
> index 7ab9437..26d39df 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -568,11 +568,39 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  }
> =20
>  /* Check whether a reference is relative to a label, e.g. &{label/node} =
*/
> -bool is_ref_relative(const char *ref)
> +static bool is_ref_relative(const char *ref)
>  {
>  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
>  }
> =20
> +/*
> + * Make the tree at *dtp from a first fragment which refers to a label o=
r path,
> + * rather than being the root node. This is only valid in a plugin, wher=
e the
> + * fragment becomes an overlay fragment.
> + *
> + * Returns true on success, false on an error, which has been reported.
> + */
> +bool merge_first_ref(struct node **dtp, struct fragment *f, bool plugin)
> +{
> +	bool ok =3D true;
> +
> +	if (!plugin) {
> +		srcpos_error(f->node->srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		ok =3D false;
> +	} else if (is_ref_relative(f->ref)) {
> +		srcpos_error(f->node->srcpos, "Error",
> +			     "Label-relative reference %s not supported in plugin",
> +			     f->ref);
> +		ok =3D false;
> +	}
> +	/* Make a new, empty tree with a fragment@N node for the reference */
> +	*dtp =3D add_orphan_node(name_node(build_node(NULL, NULL, NULL), ""),
> +			       f->node, f->ref);
> +
> +	return ok;
> +}
> +
>  /*
>   * Merge a fragment which refers to a label or path into the node it ref=
ers to,
>   * adding any label in the fragment to that node.
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--TSBHqCebxsqtKdyN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2j84ACgkQzQJF27ox
2GfpSw/+L3DT3YEZ3V5N03M2EiNWrubJbsqU6J3Zj2e9xf+TqRZA2k0Lmu0s42CA
H//Rh5IKWg95e/5ehII9Zbe1Y76pMK70uquyI3I0V2a6RMa2xzXfTh02e3WUJeTC
l+IOZjHj7UmAihgnu025Ecrn4y2S4eYGzG/SGNQXaWTIxuOBFw5iCS6Eqd4XsTJR
JU69ptPYvn0dv/1MIQiOEKh+fHs+B+/sgbT/3ewDWSapitXmP3rg4DMqciTbU5Dx
YiXv2OgSVh76AEI2up5jWF5eaP1S/v8PBukvSwfz7ZtJ4igqQ8FH8ICDi9NeQkNk
zaoIs44rsRSSHnkLEPO7pyLK8bYmh0qJKeeo63DJktbuEwvE9iDGG26k2YSagd+Z
WiUZzcxogpAwR6EVWqqzqp3ymkk9Kv1Y0eR9oc8RsYiOJ9567Ha2oWkltyY9HjJi
jaDMvgBRCNNuaqDxUx8HDdPi+gxNUjRKZZUy7YvkUJujaBEDdVFqHSaZJqWs0I22
GpKVjgFSwms921HA+X/OJ2e6SJ+YYevbuYxFFxsb8N8gq9sBNEVaE7l+nRjXdy94
5qXJnLEk11TmpbZrk0GQx+9etgxm/KkwOe4cmE1IDcVWS3Z3drC87kHsEtqHaFb7
dWZZQQ5V30nB44BfD2OK2sRnI7ML94logRjvHb1wkzFIZJABwHw=
=lGxM
-----END PGP SIGNATURE-----

--TSBHqCebxsqtKdyN--
