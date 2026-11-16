Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803689;
	b=gTQTRGQ/3vCnk2GyhNJifhj8xQIaZlK/FPlka0fGgc7tTXCEPdF8DIex4k+cAVPsluo4
	 aaXbeJ+qJw+wNptsWnvNzSh6MwLv4QjoLpprotZg6dp/YVKHsu8U5qOhuX781keYx0ulM
	 zqp74xrGxiEKp7nVp3wMWtAOp0j9ykgtPDqSqhRY4pXqWjar8qZycET4Ch4bvSFhnbbHo
	 5ak0b2yJjUU5odtyH+5x9znIzQgLAmEvtXmduMqlzMYsU5qjQ18yJlB3rHcE/FdgcXfpd
	 PyJeERFOddyydt9n06jHtRnx2j1/9KtI0nV99AmQ3feqB8izawYTVObXeUAIJ72AWnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803689;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=rkHxdpG95xhGO4byGAIPno195GYIgWGPdrZjnXnlTVs=;
	b=SMnlq5/rVhug2OfeOHGICwvqN2NsvgNOtBlG9ySICr6VY0XB357n/UlTbD53kh2F4eUv
	 z7FVDX2aKRgMXkDqoNTtGVOw1b9eDfT5KiMEIBdnVkx6YTncCJBRamjiu+O+fhKNHzjfy
	 s5B/9wqg+CWMuLs27Ilwtg5pxyFCAphGx12yh0Vnm/MFg00jhbv181805P68KdpJh/xhY
	 hH6HLoGQDPfL2ERLidTxa7POPg5jIFRKuVTI+Os3csv0InPpFmFKYzeVKymQL/CoG0rHf
	 a9vzm9g7Ipum9/4/fU/vcvg7OuwjwoMXoPYaq8ExIojXwWmMJSS8X+He+Qi7u+km0xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b="mlZgux/O";
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F2E606A32F
	for <devicetree-compiler@vger.kernel.org>; Mon, 16 Nov 2026 04:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F2E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=mlZgux/O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1794803680;
	bh=rkHxdpG95xhGO4byGAIPno195GYIgWGPdrZjnXnlTVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlZgux/OLbL3cwLp3ixOACnoFi9J2pgnYNIXWtTWXGWTssjpjTCkkfoOgMdRIEpAX
	 e+y86+tK//QPI/hE89CNiyyAE7WZtCTVYWv8cKK7Wdpgu4mqF8HNuhJ4g1c+H45Ss6
	 rFtLi+ayVIon0znp+CH64M1xs3sn4gppDUu4uT6YAQVYvP9Bnuv8Kq6N4tlhgm63j+
	 WprJ+P8MVCepoDft9GLEOCNuwaSXnrqfdJ8azmRdfAHmfHo28/Bfpp9Kqc57kc56er
	 nb6rP6nkjGWZ1OGs+9r9yDDDj7eE2jkyTw8MY25FQsCLWPsqc0yH32ey+q5s2sk8cS
	 X3c+UHPNHcSRA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jSZlN1pDRz4wM5; Mon, 16 Nov 2026 15:34:40 +1100 (AEDT)
Date: Mon, 16 Nov 2026 15:04:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 14/18] dtc: Merge the fragments of a dts file after
 parsing
Message-ID: <avqA1WQy-WUzR_r3@gractus.seuss>
References: <20261106195159.2623314-1-sjg@chromium.org>
 <20261106195159.2623314-15-sjg@chromium.org>
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
	protocol="application/pgp-signature"; boundary="ZesRoZsfs26XyVjE"
Content-Disposition: inline
In-Reply-To: <20261106195159.2623314-15-sjg@chromium.org>

--ZesRoZsfs26XyVjE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 12:51:41PM -0700, Simon Glass wrote:
> We would like to deal with each top-level fragment of a dts file before
> it is merged into the tree, but that requires the fragments to be kept
> apart until the whole file is parsed. At present the parser merges each
> one as soon as it is parsed. The grammar actions also need to know
> whether the file is a plugin, which they find using $<flags>-1
>=20
> Have the grammar build a list of the fragments instead, in source order,
> passing it to build_dt_info() to store in struct dt_info, and merge them
> with a new merge_fragments() once the whole file is parsed. This calls
> merge_fragment() for each one, so the output does not change, and frees
> each fragment once it is merged.
>=20
> The $<flags>-1 term is no longer needed. Within a devicetree action it
> reaches back up the parser stack to the value of headers, i.e. the flags
> from /dts-v1/ and /plugin/. The sourcefile action passes the same value
> to build_dt_info(), which stores it in dti->dtsflags, so
> merge_fragments() can use that instead.

That's a nice bonus.

> There are two differences in the errors. A syntax error later in the
> file now stops dtc before any earlier reference errors are reported, and
> reference errors now come after any other errors which the parser
> reports, such as a division by zero, rather than in source order.

I think that's acceptable.  Continuing to print reference errors after
syntax errors would be nice, but it's not worth spending a lot of
effort on it.  I think doing this well would require error productions
and/or other techniques for handling parse errors more gracefully.  We
have very little of that because that likewise has just never been
very worth it.

> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Link: https://lore.kernel.org/devicetree-compiler/auK0ERvxGCJGSc3p@gractu=
s.seuss/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> Apart from the two differences in the errors, dtc gives the same output
> and messages as before for every .dts and .dtso file in Linux
> v7.3-12284-g3799eeb906c9, and for the dts files in tests/
>=20
> (no changes since v2)
>=20
> Changes in v2:
> - Pass the list to build_dt_info(), adding it to struct dt_info here
> - Return true on success from merge_fragments()
>=20
>  dtc-parser.y | 65 ++++++++++++++++------------------------------------
>  dtc.h        |  6 +++--
>  flattree.c   |  2 +-
>  fstree.c     |  2 +-
>  livetree.c   | 40 +++++++++++++++++++++++++++++---
>  5 files changed, 63 insertions(+), 52 deletions(-)
>=20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 9cda518..0ff04c7 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -24,22 +24,6 @@ extern void yyerror(char const *s);
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
> =20
> -/*
> - * Merge a fragment into the tree as soon as it is parsed. The flags come
> - * from the actions using $<flags>-1, which relies on the rule being alw=
ays:
> - *   headers memreserves devicetree
> - * so $-1 is the value of headers
> - */
> -static struct node *merge_parsed_fragment(struct node *dt, struct fragme=
nt *f,
> -					  unsigned int flags)
> -{
> -	if (!merge_fragment(&dt, f, flags & DTSF_PLUGIN))
> -		treesource_error =3D true;
> -	free_fragment(f);
> -
> -	return dt;
> -}
> -
>  %}
> =20
>  %union {
> @@ -58,6 +42,7 @@ static struct node *merge_parsed_fragment(struct node *=
dt, struct fragment *f,
>  	struct node *node;
>  	struct node *nodelist;
>  	struct reserve_info *re;
> +	struct fragment *fragment;
>  	uint64_t integer;
>  	unsigned int flags;
>  }
> @@ -92,7 +77,7 @@ static struct node *merge_parsed_fragment(struct node *=
dt, struct fragment *f,
>  %type <proplist> proplist
>  %type <labelref> dt_ref
> =20
> -%type <node> devicetree
> +%type <fragment> devicetree

I'd suggest adding a 'fragments' or 'fragmentlist' entry to the
%union.  Even though struct fragment has a built in next pointer, it's
useful to mark which semantic values are logically a single fragment,
versus which are a list.  We already do this for prop vs. proplist and
node vs. nodelist.

>  %type <node> nodedef
>  %type <node> subnode
>  %type <nodelist> subnodes
> @@ -117,8 +102,9 @@ static struct node *merge_parsed_fragment(struct node=
 *dt, struct fragment *f,
>  sourcefile:
>  	  headers memreserves devicetree
>  		{
> -			parser_output =3D build_dt_info($1, $2, $3,
> -			                              guess_boot_cpuid($3));
> +			parser_output =3D build_dt_info($1, $2, NULL, $3, 0);
> +			if (!merge_fragments(parser_output))
> +				treesource_error =3D true;
>  		}
>  	;
> =20
> @@ -171,50 +157,39 @@ dt_ref: DT_LABEL_REF | DT_PATH_REF;
>  devicetree:
>  	  '/' nodedef
>  		{
> -			struct fragment *f =3D build_fragment_root($2);
> -
> -			$$ =3D merge_parsed_fragment(NULL, f, $<flags>-1);
> +			$$ =3D build_fragment_root($2);
>  		}
>  	| devicetree '/' nodedef
>  		{
> -			struct fragment *f =3D build_fragment_root($3);
> -
> -			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
> +			$$ =3D append_fragment($1, build_fragment_root($3));
>  		}
>  	| dt_ref nodedef
>  		{
> -			struct fragment *f;
> -
> -			f =3D build_fragment_ref(NULL, NULL, $1, &@1, $2);
> -			$$ =3D merge_parsed_fragment(NULL, f, $<flags>-1);
> +			$$ =3D build_fragment_ref(NULL, NULL, $1, &@1, $2);
>  		}
>  	| devicetree DT_LABEL dt_ref nodedef
>  		{
> -			struct fragment *f;
> -
> -			f =3D build_fragment_ref($2, &@2, $3, &@3, $4);
> -			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
> +			$$ =3D append_fragment($1, build_fragment_ref($2, &@2,
> +								    $3, &@3,
> +								    $4));
>  		}
>  	| devicetree dt_ref nodedef
>  		{
> -			struct fragment *f;
> -
> -			f =3D build_fragment_ref(NULL, NULL, $2, &@2, $3);
> -			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
> +			$$ =3D append_fragment($1, build_fragment_ref(NULL, NULL,
> +								    $2, &@2,
> +								    $3));
>  		}
>  	| devicetree DT_DEL_NODE dt_ref ';'
>  		{
> -			struct fragment *f;
> -
> -			f =3D build_fragment_delete_node($3, &@3);
> -			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
> +			$$ =3D append_fragment($1,
> +					     build_fragment_delete_node($3,
> +									&@3));
>  		}
>  	| devicetree DT_OMIT_NO_REF dt_ref ';'
>  		{
> -			struct fragment *f;
> -
> -			f =3D build_fragment_omit_if_no_ref($3, &@3);
> -			$$ =3D merge_parsed_fragment($1, f, $<flags>-1);
> +			$$ =3D append_fragment($1,
> +					     build_fragment_omit_if_no_ref($3,
> +									   &@3));
>  		}
>  	;
> =20
> diff --git a/dtc.h b/dtc.h
> index e223bc2..437efbc 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -372,13 +372,13 @@ struct fragment *build_fragment_omit_if_no_ref(char=
 *ref,
>  					       struct srcpos *ref_srcpos);
>  struct fragment *append_fragment(struct fragment *list, struct fragment =
*new);
>  void free_fragment(struct fragment *f);
> -bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin);
> =20
>  struct dt_info {
>  	unsigned int dtsflags;
>  	struct reserve_info *reservelist;
>  	uint32_t boot_cpuid_phys;
>  	struct node *dt;		/* the device tree */
> +	struct fragment *fragments;	/* not yet merged into dt */
>  	const char *outname;		/* filename being written to, "-" for stdout */
>  };
> =20
> @@ -388,7 +388,9 @@ struct dt_info {
> =20
>  struct dt_info *build_dt_info(unsigned int dtsflags,
>  			      struct reserve_info *reservelist,
> -			      struct node *tree, uint32_t boot_cpuid_phys);
> +			      struct node *tree, struct fragment *fragments,
> +			      uint32_t boot_cpuid_phys);
> +bool merge_fragments(struct dt_info *dti);
>  void sort_tree(struct dt_info *dti);
>  void generate_labels_from_tree(struct dt_info *dti, const char *name);
>  void generate_label_tree(struct dt_info *dti, const char *name, bool all=
ocph);
> diff --git a/flattree.c b/flattree.c
> index f3b698c..aa183a0 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -923,5 +923,5 @@ struct dt_info *dt_from_blob(const char *fname)
>  	if (get_subnode(tree, "__fixups__") || get_subnode(tree, "__local_fixup=
s__"))
>  		dtsflags |=3D DTSF_PLUGIN;
> =20
> -	return build_dt_info(dtsflags, reservelist, tree, boot_cpuid_phys);
> +	return build_dt_info(dtsflags, reservelist, tree, NULL, boot_cpuid_phys=
);
>  }
> diff --git a/fstree.c b/fstree.c
> index 0f9a534..88ff4ba 100644
> --- a/fstree.c
> +++ b/fstree.c
> @@ -72,5 +72,5 @@ struct dt_info *dt_from_fs(const char *dirname)
>  	tree =3D read_fstree(dirname);
>  	tree =3D name_node(tree, "");
> =20
> -	return build_dt_info(DTSF_V1, NULL, tree, guess_boot_cpuid(tree));
> +	return build_dt_info(DTSF_V1, NULL, tree, NULL, guess_boot_cpuid(tree));
>  }
> diff --git a/livetree.c b/livetree.c
> index a70a7ba..f2c7703 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -552,7 +552,8 @@ static void fill_fullpaths(struct node *tree, const c=
har *prefix)
> =20
>  struct dt_info *build_dt_info(unsigned int dtsflags,
>  			      struct reserve_info *reservelist,
> -			      struct node *tree, uint32_t boot_cpuid_phys)
> +			      struct node *tree, struct fragment *fragments,
> +			      uint32_t boot_cpuid_phys)
>  {
>  	struct dt_info *dti;
> =20
> @@ -560,9 +561,11 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
>  	dti->dtsflags =3D dtsflags;
>  	dti->reservelist =3D reservelist;
>  	dti->dt =3D tree;
> +	dti->fragments =3D fragments;
>  	dti->boot_cpuid_phys =3D boot_cpuid_phys;
> =20
> -	fill_fullpaths(dti->dt, "");
> +	if (tree)
> +		fill_fullpaths(dti->dt, "");
> =20
>  	return dti;
>  }
> @@ -710,7 +713,8 @@ static bool merge_omit_if_no_ref(struct node *dt, str=
uct fragment *f)
>   *
>   * Returns true on success, false on an error, which has been reported.
>   */
> -bool merge_fragment(struct node **dtp, struct fragment *f, bool plugin)
> +static bool merge_fragment(struct node **dtp, struct fragment *f,
> +			   bool plugin)
>  {
>  	struct node *dt =3D *dtp;
> =20
> @@ -738,6 +742,36 @@ bool merge_fragment(struct node **dtp, struct fragme=
nt *f, bool plugin)
>  	return true;
>  }
> =20
> +/*
> + * Merge the fragments of a dts file into a single tree, in source order.
> + *
> + * Returns true on success, false on errors, which have been reported.
> + */
> +bool merge_fragments(struct dt_info *dti)
> +{
> +	bool plugin =3D dti->dtsflags & DTSF_PLUGIN;

Hrm.  Will this coerce correctly into a bool, or do we need a !! in
front?

> +	struct fragment *f, *next;
> +	struct node *dt =3D NULL;
> +	bool ok =3D true;
> +
> +	if (!dti->fragments)
> +		return true;
> +
> +	for (f =3D dti->fragments; f; f =3D next) {
> +		next =3D f->next;
> +		if (!merge_fragment(&dt, f, plugin))
> +			ok =3D false;
> +		free_fragment(f);
> +	}
> +
> +	dti->dt =3D dt;
> +	dti->fragments =3D NULL;
> +	dti->boot_cpuid_phys =3D guess_boot_cpuid(dt);
> +	fill_fullpaths(dti->dt, "");
> +
> +	return ok;
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

--ZesRoZsfs26XyVjE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmr6gNUACgkQzQJF27ox
2GdxKA/+PLb70Jlg+N3TnTTRTd8uU/U9Xuwz7wl/VPBLoNovVo6qAqqCQp+gbt/f
Kn1cyWwPUjM2dlr0XrhayAYiCbVM6uaIcOlLHiCRd0Ud6CNMBljusedU5mgvEpWK
x5pULYuJJHP/ewZipK28vExy52TcTMsvxBO0Otr9brfTkQxF7lwib8a/l6KUbY4f
191iGXxKzrWytdD87a4buXUNJi+CBs0EIgu0/0RqRhvDQPf2PFzJViravebN0nBu
6fZTTXlwib/f2ctXvvqG3L+FbDutpMukhRMLyh+iIj60md2C6YD87LhaKZ2pzLi8
RAEEtZQVNJ/4WD73I7mHUSRakmTNOiZoXTmnPNBc8Ytx7r0P/xpl3xIfCEb/r4Cm
+H6br+IOal0eaWzCj0Fit3V83PLxXtEeMp8UC+w4PZUDxpRFsRsChO3Tg9BmlFAk
esoTzKYk1Af4N4lXIB2wC8+hZo9WqyV8UEsQbMZ+FZiSDe/GjAHc+cmENnhDzSX6
lhS7S/gUC3RN7PpAcjtX3nf5Hv9tf20H0ABlzXfK3AvXjGYqrtKGuh6JMlyfR5cX
g4e1uj/vUZQVtiI2EnmoJWmuHhWW1mR1Co7ZO49HGKkF4SMrtD4mtU++WS8j0CM4
cJPd1DUYSqCIO8g1EME/bAHeFiU0klHdSgfZEq8bM7FJLOSfENM=
=7QNP
-----END PGP SIGNATURE-----

--ZesRoZsfs26XyVjE--
