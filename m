Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691267;
	b=1HyzIx0rOYZjs5utkMznDqitWQneagl0/VmHWSoFnQW0AoWLM6MM5QbnDuqH4FscZnTo
	 jH3Um+uwT7x2yjo6t9L0VFN3qqKtmiBs/3xjbmS0e33qOgWe3hsFipgLzcxOntJlCjCzL
	 LhjUIF4SKspKJHKVSFQW7p+elucePzgdsf6P+zwL/wL+9H/yNW8Yd5OEzqJTjgW9viGNS
	 KCsLKiVFJUKFU8rVu8LhNw2UI7+TT94RdNaxxL4MFMfNl2NN++5XS8D9/CVICIMzfppT/
	 5w07GKE5NRx8Hgo+sPIIh5knvO0giEqxG0OtfJfYn/R0Gc4wNCHq3EeNkZrbOUveWoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691267;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=0SAnJaAZCsnxQMn30YL2MkaywE8kTX4dBNamJw3cHx0=;
	b=jVk+O3SHUMp29Jx+8MRELCCePHJKrHEHqBNHQMln/47oacxgBHqmC1JJWAEgRH04otlZ
	 KFexewP4lOsiiA+uxv7qGf2kHZygktRkqIVczOMmbG53u+MiUiJRQAtnLacb968gZYjuL
	 QJUN/BRbE1tOUxe0OyuAY+n2jybv6ziApKo63sFcjEji0gOCfeTQGxTP5msd983HklUhu
	 C5TAsVfRM0o3E0LoO/SEI+mBcMt0JArwcTWLWsJ/CN8qYLSPCSNzbexL/HUPlWL9/cIjD
	 yDrsDBhEnSiHSNkjw2pBwLvf4qvio4+93Buq+CjUUvgzNUyWoHvjvsf8PhBrgASplGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=rrwHarIM;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC89606A32E
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 07:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC89606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=rrwHarIM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793691256;
	bh=0SAnJaAZCsnxQMn30YL2MkaywE8kTX4dBNamJw3cHx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rrwHarIMDN0Oho9+mD5ioWJh411YtAheIXDARYjf32F1aFrrUYBDNiIWbKJxMyi3c
	 XuNYLOHZP3cyoWknI9xIwvJmwLnxl7RtfYx2sHJBYHWGFZXjIALnRnbi9qY+IVpYGe
	 1RuWo/506bD8j6LXm93O75DR7ZBR/8YcSWOQeJvz7RvsGTcASXUqV7jUAso81rdcud
	 Q7WX3YzX9gv8ivnegSY5fok31IB+O4A3BB2eJqhu+Bu8oYDr/8TMobxE5QwJf5lL9O
	 goTJ+j+c2k+O1Xr4LG0Bix1nqRvtwNqlEFAC1bRE5mUxAabwxuJpotSXExKBjaTbPa
	 26WjkTnAx4gvA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJgLc67hlz4wDk; Tue, 03 Nov 2026 18:34:16 +1100 (AEDT)
Date: Tue, 3 Nov 2026 18:29:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 08/13] dtc: Move labelled-reference handling out of the
 grammar
Message-ID: <aumNU6YhSTKzkmGi@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-9-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="yxXQGKgJzSIbuKaO"
Content-Disposition: inline
In-Reply-To: <20261101163721.2458982-9-sjg@chromium.org>

--yxXQGKgJzSIbuKaO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 09:37:02AM -0700, Simon Glass wrote:
> The grammar action for a top-level label: &ref { ... } holds its merge
> logic, which adds the label to the node referred to.
>=20
> Move it into a new merge_labelled_ref(), passing it a struct fragment
> from fragment_ref, with the label and node added.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
>  dtc-parser.y | 18 +++++++-----------
>  dtc.h        |  2 ++
>  livetree.c   | 28 ++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+), 11 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index cca3ce1..0e6c4c2 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -190,18 +190,14 @@ devicetree:
>  						  ""),
>  					$2, $1);
>  		}
> -	| devicetree DT_LABEL dt_ref nodedef
> +	| devicetree DT_LABEL fragment_ref nodedef

Usual comments on fragment_ref.

>  		{
> -			struct node *target =3D get_node_by_ref($1, $3);
> -
> -			if (($<flags>-1 & DTSF_PLUGIN) && is_ref_relative($3))
> -				ERROR(&@2, "Label-relative reference %s not supported in plugin", $3=
);
> -
> -			if (target) {
> -				add_label(&target->labels, $2);
> -				merge_nodes(target, $4);
> -			} else
> -				ERROR(&@3, "Label or path %s not found", $3);
> +			$3->label =3D $2;
> +			$3->label_srcpos =3D srcpos_copy(&@2);
> +			$3->node =3D $4;
> +			if (merge_labelled_ref($1, $3,
> +					       $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_PATH_REF nodedef
> diff --git a/dtc.h b/dtc.h
> index 5af1d1f..75b1c0f 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -369,6 +369,8 @@ struct fragment *build_fragment_ref(char *ref, bool p=
ath_ref,
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
>  bool is_ref_relative(const char *ref);
> +bool merge_labelled_ref(struct node *dt, struct fragment *f,
> +			bool plugin);
>  bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin);
>  bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
> diff --git a/livetree.c b/livetree.c
> index b0362e4..76474cd 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -548,6 +548,34 @@ bool is_ref_relative(const char *ref)
>  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
>  }
> =20
> +/*
> + * Merge a fragment of the form 'label: &ref { ... }' into the node whic=
h ref
> + * refers to, adding the label to that node
> + *
> + * Returns true if there is an error, which has been reported.
> + */
> +bool merge_labelled_ref(struct node *dt, struct fragment *f, bool plugin)

This again seems like the fragment itself contains the information to
do the right thing for path/label or labelled fragments, rather than
having separate functions for each case.

> +{
> +	struct node *target =3D get_node_by_ref(dt, f->ref);
> +	bool error =3D false;
> +
> +	if (plugin && is_ref_relative(f->ref)) {
> +		srcpos_error(f->label_srcpos, "Error",
> +			     "Label-relative reference %s not supported in plugin",
> +			     f->ref);
> +		error =3D true;
> +	}
> +	if (!target) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return true;
> +	}
> +	add_label(&target->labels, f->label);
> +	merge_nodes(target, f->node);
> +
> +	return error;
> +}
> +
>  /*
>   * Merge a fragment which refers to a path into the node at that path. I=
n a
>   * plugin, the fragment becomes an overlay fragment instead.
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--yxXQGKgJzSIbuKaO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrpjVQACgkQzQJF27ox
2GeEpA/+PeAv9zgGInCAi4lubtQZqOIFAQTd1rH/0forzkiRNjG/PCP+tf+9zAe8
pJJzBcgVq6mxAaTQZCLTKILooue+77YghClmTZ0LyIQo3aj0mFVnpMMI4E+fTKqj
D7wdotsFVM9xmsgddQFhntgeNlRCJsYh1caAI+5avZLIzoS013zd3JNhjah+glds
Bgb0ewUPDdkwkDzwuqR75hYcjVRCzo2+kBMnpcCRiidplgvXzcTQL066LF4bihJx
jNLpObbbLQu92zplNMen1vW7F0mtUh40X81fj+fGJJ2mjwiEPWUfT8U43yeuiOL9
6Pb91TIJMcT6Obribmvrhc2O0m4XHa4h8xQ986Irb4jcrALoXnHfzUEy6ahkPrSN
/63QKn3C9Dg3QDbqBIGY3TgULxx9uldq6ANkaP2phioa+voPC4pDdSK9JhJBpHk1
LZMcvxa0O3bCy6TuQaJ9SiIoqXj2elnoyrSh1Z13wQ7BW09l6VhX2M49KRBWkqaN
z1FApcLDqrHkjx6hEMcWfZgy3fVzysuzpSQsvLSW2ZILsnAIFDMK8KWx2pO3T+xS
U6Ev3GnCwqyNXpgXIn7F9sV4NP/GzDZCZPRxTQCiVlssrgg7iBmrry8SfnfAzgI0
dStmnAHBgwksPxlFr0dCRtbz0hCrhnmzmYZv2q+EpDcL/DT8ZOA=
=A+2r
-----END PGP SIGNATURE-----

--yxXQGKgJzSIbuKaO--
