Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542959;
	b=WmBAWnBWY7Z1QRk/T3na61NPTmCEK2okm/GpxnJBuGzKORkWPyvaAUR3bdVcf7M95TNJ
	 1GqeXVxBeUR19gahi58BPGZkOENN8Vrqx2BD9tNhgsv7+LQFGvD4kVvQiwvZUIFFoKhGV
	 O8doG7f19OS0MaNEZ7u57tm7X7gD7fBj0xqMou8eDQomzxJ6p/YyxpXYrZEFm1G+8D6KS
	 qGTp4Y0cRuUaz24fYMoi8sKuNn60lKN1aZB/LaBTeGez/e5bh6tL+RrDBeDCYrh63Lg3E
	 r7R33Tw+dZ+xMLiF9bvOvZj6TY2WTvWh+xsmpRnDNyYrbo15gaT3fbL5XJshZwRBRfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542959;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=cXbJ/hDE993yzb6CDm1xUff6BQBntK/zGx6aJT11UKo=;
	b=EHQ2yVqn6Ahwfv/rLlnwkn4x4IBoznRMWF2DN1KwLT1PjGh6KdPaYfp/GeBx4Y10lfpU
	 quFA/emH2uW9Bc7QeQP+OA+nY3y4p1peGU7bc9GI3zHUkNBDx86ixLMVxZTt+8SGYfLnA
	 zoiTIABkvC5LM5r04T96vBpjjD619eGpXJBAS1WfhXo+ajntwsAkoE6j6BWwEF65c1wTw
	 lRMnThPkmg1EcDADvfNcchMFRdAsabSYcV9xqm5GW4s6hBUd3xJUx9SgdoA4qkwtzp/UK
	 LQ4+xArWSJ30CATkW9rfwbGHChKw70I2mgDhaDO8/tdxYPeGRBg8WJQF6dzbkAN9rCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=O3bh5U93;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B83606A323
	for <devicetree-compiler@vger.kernel.org>; Fri, 13 Nov 2026 04:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B83606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=O3bh5U93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794542956;
	bh=cXbJ/hDE993yzb6CDm1xUff6BQBntK/zGx6aJT11UKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3bh5U93c1mcNGIZOxSlhRafkil0MIEjeFVuF0xKqLdyFyOvnvXETtmHvODDuJEPJ
	 DpB5+/LsXgINEgN+NvQixdv8pvbfLQ3KAJGOHVsiTcZJQwD2Svj+lqfBGBIHx0df+m
	 JZwcTVNXLkwtV+VWHQEjtVC3EegqaTsGFIp3judXYrGNLFEEffnZb7r2sNOVtzlOLY
	 fQpjgaQlA2dcg+dV1FkOJMExh8IbrEAZz1/ZzO3mGcaeSJJC2Pjd1EuilbM9iObd3T
	 XvtXT48/ZE/+63/TdG7cr/zxfaKIyeBRX7qG5anRBigenikWH4+JEU+UHyJx+xoTKT
	 fpovHuQ7fAzaQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jQkKS0ZvFz4wTW; Fri, 13 Nov 2026 15:09:16 +1100 (AEDT)
Date: Fri, 13 Nov 2026 14:55:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 06/18] dtc: Move is_ref_relative() to livetree.c
Message-ID: <avaKQ9-7icxHKpiE@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-7-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="se1bXrDC3KStIbsf"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-7-sjg@chromium.org>

--se1bXrDC3KStIbsf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:33PM -0700, Simon Glass wrote:
> The remaining grammar actions which merge a fragment use
> is_ref_relative() to reject a label-relative reference in a plugin.
>=20
> Move it to livetree.c, so that it is available when these actions move
> there too, and add a comment.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

This makes sense independent of the reset of the series.  Merging.

> ---
>=20
> (no changes since v1)
>=20
>  dtc-parser.y | 5 -----
>  dtc.h        | 1 +
>  livetree.c   | 6 ++++++
>  3 files changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 1aaff42..9b9b6db 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -24,11 +24,6 @@ extern void yyerror(char const *s);
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
> =20
> -static bool is_ref_relative(const char *ref)
> -{
> -	return ref[0] !=3D '/' && strchr(&ref[1], '/');
> -}
> -
>  %}
> =20
>  %union {
> diff --git a/dtc.h b/dtc.h
> index 22a050a..8c4d7bf 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -372,6 +372,7 @@ struct fragment *build_fragment_omit_if_no_ref(char *=
ref,
>  					       struct srcpos *ref_srcpos);
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
> +bool is_ref_relative(const char *ref);
>  bool merge_delete_node(struct node *dt, struct fragment *f);
>  bool merge_omit_if_no_ref(struct node *dt, struct fragment *f);
> =20
> diff --git a/livetree.c b/livetree.c
> index a54009c..3ff4e14 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -567,6 +567,12 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  	return dti;
>  }
> =20
> +/* Check whether a reference is relative to a label, e.g. &{label/node} =
*/
> +bool is_ref_relative(const char *ref)
> +{
> +	return ref[0] !=3D '/' && strchr(&ref[1], '/');
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

--se1bXrDC3KStIbsf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr2ikMACgkQzQJF27ox
2GeiXQ//cs8BkwetBYPz+NsR/QKNv/D2lPZVSh9zfV13/9RDpmNlYOzfVUT8if6Z
nHLHeb7aYRdu6SgSh/HfCUnbILiiXWGLSxXEpE5JbWDPHjKn3hn59QPq75yl57/m
oFgArZ4O6dkbX/wL/0i7NGoSP83jK8rstxWBJamnAXp+VvLQtFIxo+Y/dQsUmJ3D
AbAe10IfDg+vUASQGl98cGRUR+ksavX4ywbZZ6i8g/Qd9AgXCwESM3oa+vFJr2Y2
ED726UpPujLONFwroQH2T+LOeX9ASplA+inOuP5AniVAVoR2vAuEtK0T5aRgNjjN
0SNlZ6KWS0B1oLF0YwYiM91QYeFvj74jsuMQ0UMryt0UyIZIUwVQsQ5W/w4220Sw
XLX2QKRGdUQYz5bbVXe52mP9ke3AVaHWJJJSyK17yKwqLh2vQwPa6K9BsgDG0Eza
Rt8Q3mfziVEGpz/AEUyxVaDatl5L7i/+8MCmU0tlGs+GTh3BBXNl+xnMajGrk+kI
qsR9gz9KpX8GjvBjU9+WK2ylcRKYbVZKnCzsUqfmAuOUm7v5i4uc0U76w83gPVUz
rsDgxw4aQLS1mNNcWHV/yYrKHmVz2hUv+b1g3/dvtFsjpI7wxlH71/J/0tWU2UCL
sf1AMtZtfS6Yh527CTV7OQo1BEW2bLjXKZiPF4p7sUuxX3a34yU=
=XkbR
-----END PGP SIGNATURE-----

--se1bXrDC3KStIbsf--
