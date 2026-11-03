Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691272;
	b=F84UL3ABKlr03NSUqbrcaSmBQBJHM4VgqB/fs2J6DAa+IzKA+gGT3FLyG1gCdmkCofbF
	 mbdFR9MRhzqp2RU+kDnnGyw4sVsWCPPW/3HSC3Uc2tacmzBYvQroIGRS2AHeL2Rvu6ODn
	 QF+8umzXf5Vxvz9jltGZDOTPBfW1KjOnuxGKpF3jjMfhCr6taxP5lr9kRga23VJdoPEcK
	 wsVJMAVpOOwV5CCnTJ+vIrsRtFxOrGLZxIhWogW+u0CwZ1LoT/PbebEwFXwsCU1n+yRIJ
	 tG0yDe3xCzqNiidDNIRQBkudG24K8GoVDgS0cUsxJuXwfyiSOdYTSEEg3eIlho6voWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691272;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=gcsVUblf8yWn6jsY6xprOSGYT5nkWjVqLl8aLtVWaKM=;
	b=po5fprNNSBUy+cYhgTQXQxyl2uwi3G/6E6nQpycdLpjw16MqgS8ZPFSsiP3nnvkskoIQ
	 +ZEHkg/G2VLS7ocHNBcgPoRQcRzd+huk3OR1egzPxc7GpLb0bwhXPKn0A4bf8qrxgeA0T
	 uwCLN2YTCHkWBfvfRTtdcfRhA3l4UCWPfXFYoWZ+wr7LqtUrkD+Oehi73fEjx059WkGZz
	 +D2Ei+y3P9TER+B1tG6j4Kk1GtEJgB99YrfWeYYDA59jY3ANGX/oxZvFx/pudbiawmiLm
	 Cg1oHhJvuMgXr2uzqVKST6pvqIs8q3OOnrcote6MV0RDMoKcxmqUwJmnuBx1XKoqklw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Q+3HbZCR;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECA4606A32F
	for <devicetree-compiler@vger.kernel.org>; Tue,  3 Nov 2026 07:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ECA4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=Q+3HbZCR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793691256;
	bh=gcsVUblf8yWn6jsY6xprOSGYT5nkWjVqLl8aLtVWaKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+3HbZCR1a8j8jdpMV+HmEiSvvfC2wLfrfwuiIg+AtfyqCtQar2sAuS6qjCu0tyq2
	 0ZIrJkIj8Eruf80spM/OrF0eRDQi8uCrfjJtGNs7czWcgR5JC60B9FOgylNBMBSPET
	 F/fKmETs2z8KrSN2VstgkUkpjr+713IZMCcJkTa1WCJCrozvR+7G3jn5dZBViryIC/
	 hQhFMT0wTKkKfxhbuBLpHJpWQlNkMORjrcvyEQInHD6niVJH3WKBLWHDsIt+JE7FgZ
	 MMWgQl0xwH6ZxXQF9roj2rqU1uepL/BQUe5apu8cmBU/Q5+/qv2rPjLLKPI4TIE2NG
	 YtuM3qQQiP4IA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJgLc62gYz4wDm; Tue, 03 Nov 2026 18:34:16 +1100 (AEDT)
Date: Tue, 3 Nov 2026 18:27:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>
Subject: Re: [PATCH 07/13] dtc: Move path-reference handling out of the
 grammar
Message-ID: <aumM-E78VxAcglyO@gractus.seuss>
References: <20261101163721.2458982-1-sjg@chromium.org>
 <20261101163721.2458982-8-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="BdIX7Wos1BcYZJaS"
Content-Disposition: inline
In-Reply-To: <20261101163721.2458982-8-sjg@chromium.org>

--BdIX7Wos1BcYZJaS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2026 at 09:37:01AM -0700, Simon Glass wrote:
> The grammar action for a top-level &{/path} { ... } holds its merge
> logic, including making an overlay fragment in a plugin.
>=20
> Move it into a new merge_path_ref(), passing it a struct fragment for
> the reference and node, built in the same way as for a label reference.
>=20
> The output does not change.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>=20
>  dtc-parser.y | 17 +++++------------
>  dtc.h        |  1 +
>  livetree.c   | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 12 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 1a5ad12..cca3ce1 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -206,23 +206,16 @@ devicetree:
>  		}
>  	| devicetree DT_PATH_REF nodedef
>  		{
> +			struct fragment *f =3D build_fragment_ref($2, true, &@2);
> +
> +			f->node =3D $3;
>  			/*
>  			 * We rely on the rule being always:
>  			 *   versioninfo plugindecl memreserves devicetree
>  			 * so $-1 is what we want (plugindecl)
>  			 */
> -			if ($<flags>-1 & DTSF_PLUGIN) {
> -				if (is_ref_relative($2))
> -					ERROR(&@2, "Label-relative reference %s not supported in plugin", $=
2);
> -				add_orphan_node($1, $3, $2);
> -			} else {
> -				struct node *target =3D get_node_by_ref($1, $2);
> -
> -				if (target)
> -					merge_nodes(target, $3);
> -				else
> -					ERROR(&@2, "Label or path %s not found", $2);
> -			}
> +			if (merge_path_ref($1, f, $<flags>-1 & DTSF_PLUGIN))
> +				treesource_error =3D true;
>  			$$ =3D $1;
>  		}
>  	| devicetree DT_LABEL_REF nodedef
> diff --git a/dtc.h b/dtc.h
> index 256017f..5af1d1f 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -369,6 +369,7 @@ struct fragment *build_fragment_ref(char *ref, bool p=
ath_ref,
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
>  bool is_ref_relative(const char *ref);
> +bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin);
>  bool merge_label_ref(struct node *dt, struct fragment *f, bool plugin);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
>  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> diff --git a/livetree.c b/livetree.c
> index 2a01d49..b0362e4 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -548,6 +548,42 @@ bool is_ref_relative(const char *ref)
>  	return ref[0] !=3D '/' && strchr(&ref[1], '/');
>  }
> =20
> +/*
> + * Merge a fragment which refers to a path into the node at that path. I=
n a
> + * plugin, the fragment becomes an overlay fragment instead.
> + *
> + * Returns true if there is an error, which has been reported.
> + */
> +bool merge_path_ref(struct node *dt, struct fragment *f, bool plugin)

It would make more sense to me for merge_path_ref() and
merge_label_ref() to be combined, working out which they need to do
=66rom the contents of the ref itself.

I suspect that will also allow the grammar rules to be combined for
the two cases.

> +{
> +	struct node *target;
> +
> +	if (plugin) {
> +		bool error =3D false;
> +
> +		if (is_ref_relative(f->ref)) {
> +			srcpos_error(f->ref_srcpos, "Error",
> +				     "Label-relative reference %s not supported in plugin",
> +				     f->ref);
> +			error =3D true;
> +		}
> +		/* Add a fragment@N node which applies the node at the path */
> +		add_orphan_node(dt, f->node, f->ref);
> +
> +		return error;
> +	}
> +
> +	target =3D get_node_by_ref(dt, f->ref);
> +	if (!target) {
> +		srcpos_error(f->ref_srcpos, "Error",
> +			     "Label or path %s not found", f->ref);
> +		return true;
> +	}
> +	merge_nodes(target, f->node);
> +
> +	return false;
> +}
> +
>  /*
>   * Merge a fragment which refers to a label into the node with that labe=
l. In
>   * a plugin, a label which is not found becomes an overlay fragment.
> --=20
> 2.43.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--BdIX7Wos1BcYZJaS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrpjPgACgkQzQJF27ox
2GdBtw/9GsBRYw2kBd/uFwmy8YHw2EvV9CBMeG1jaTYdFHi88hK893orx/mWsLas
x0v2OlIVNstHiLdO0e81w94TmSOCl7tneUivhw2iZ64p2TkXkI0vAFUrVTYu70Qr
2ngmp+cwfQNJt01Gclc/R0/pVTmltBpwKG2JjYK5q6SIn6XhQBY4W3Pu8HWVN3Zb
Vg7lU2S+Q1lN35eiZbO0XuXOsuaZxEPRNdqJovLYN/rApXp8Cdj1WRn7m5mqDpXK
g5BxV08FEHq4X2mmQATxNuhbZ6jLzYs0Lx3/YypIAPVkvIjedDnUZwg36KUBlYWx
qU/HQAs5VBMJB1nD8eRUHQvojAuwaZHyaoF7SYNAAKLbOWHV33VyQdOw1mzBAkpN
tzDTTSniw7/oBqEVh8yG1YA2prVQllEf18Ivlz/I5ld8nqiq6joEgVtlzv7YD7I9
YM/I+OVIkPapF0anC1hIe/QjryCbNn8M9C+FcPDraHTtueivEBrTqYKa4oTTLhGD
NPOnO6jw5zsIPOWWqUOpUX0mD4jtNfXmlDavJOoHpwDBzhs7Ro5IrkfyqK5cyhzb
K7doqimjphM9vgavznPyFAfV0zR4s1pZD6H4Kpaeff7dqtb/4D54zccd6rzmHGyc
QjGwotKPeexCJbs4eBkG6wksX3Cx5i8Wum9Qjg28Ngw/yUVuDJ0=
=XQni
-----END PGP SIGNATURE-----

--BdIX7Wos1BcYZJaS--
