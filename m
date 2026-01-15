Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836EA314D2C;
	Thu, 15 Jan 2026 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460719; cv=none; b=el10S3+5NFEhQEM+c6s/NrJ+mhAhbkkgRmD6Qgg/iTUkZ3IDOX6vsjxS/hO3g7jOgg2qs8WLRuS8Hw56IN1UETJHFbISz/tQH1bEQD5YGiweKmot07SLHP6hQuNL6gdH+uq7yu21jGasJHUIEUZPi9tSqbyTcSWrSKL+a7P3JzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460719; c=relaxed/simple;
	bh=14tD626VSBQS9WQnUq+jogJiYFPVbbAHagLFSSmcCqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7cDfd9fxAUm5Qp5gTbBKMJ0AUQx1zqqbYVHAaNWJSc+KskrHjVaeSfKC+R1PitrscdVbpktnzKbIbz7vAI5gN4r5TV/pp6zhzDCbwbP/3tvdN17/ffNCep+HpQX3FoVnkmOOhNlL2RVKz+Znz4vjhe/JbDh8jL7/Spdpde5mHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=uxFjTZov; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="uxFjTZov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768460715;
	bh=QFbmpcb6+uRAeZk0qLtLeo+8v0gNGAgR25lCeETvMLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxFjTZovbQui0LM7q+RiX238U6w2SRL22fmn8L2DEwf/9KS9iG6rGiLkBtFgrvbKS
	 Ek5mz5MLMYH0RixSRDSLv2JnC36zTiKItmUdQOabz5vThqClCaSgCJwbEFiyqtO5Mc
	 gjYJN8DJbQtPqTak4nEj1WtSSEZKnY3IRaI31o2vJcf3iunuusUTIKOr1w9Bh0tyJG
	 GzghUcfDoQsX2k2CyIl5S9OMYcLf3dskAwuA5mEFPmDsyGHxtwOXNLxTP06369rvbu
	 5uPBs+UTN6uaaeCzP6u5agscCZry/4qbsszhBBP5CQiNu4ljvkWCSs6jFnIy1Ux+Sk
	 CWlLabpzvLueQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsDWv6YzBz4wMF; Thu, 15 Jan 2026 18:05:15 +1100 (AEDT)
Date: Thu, 15 Jan 2026 18:01:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 64/77] dtc: Add support for references by path
 involving orphan nodes
Message-ID: <aWiQ05zlfPfcIaZk@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-65-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pibeh0ZI2CBpThH0"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-65-herve.codina@bootlin.com>


--pibeh0ZI2CBpThH0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:54PM +0100, Herve Codina wrote:
> Referencing a sub-node from an orphan node using a path is needed.
>=20
> Indeed, using the following snippet:
> --- 8< ---
> /addon/;
>=20
> &node1 {
> 	subnode {
> 		foo-phandle =3D <&foo_label>;
> 	};
> };
>=20
> &node2 {
> 	foo_label: foo {
> 		prop =3D <1>;
> 	};
> };
> --- 8< ---
>=20
> Even if node2 is an orphan node, foo is a local node. foo-phandle
> references the foo node using a label.

Another option would be to eliminate the idea of local references, and
require a symbol be attached to things that you want to reference by
label.


>=20
> Once converted to a dtb, the label is lost. Only the phandle of the foo
> node is used in the foo-phandle property and this property is marked
> FDT_REF_LOCAL.
>=20
> Converting back this dtb to a dts, the marked local phandle should be
> translated to a path to the related local node.
>=20
> The issue is that this local node is not in a root device tree. We need
> to identify the orphan node the foo node belongs to.
>=20
> We cannot use a path starting by '/'. This kind of path identify node in
> the root tree.
>=20
> This new syntax allows to identify the orphan node in a path:
>   $<orphan_name>/<path>
>=20
> This leads to a reference by path in the form &{$<orphan_name>/<path>}.
>=20
> Using the previous example, those both phandles points to the same node:
>   foo-phandle1 =3D <&foo_label>;    /* Reference by label */
>   foo-phandle2 =3D <&{$node2/foo}>; /* Reference by path */
>=20
> When the dtb is converted back to a dts, the marked local phandle
> involving subnode available from orphan nodes can be translated to a
> reference by path thanks to the new syntax.
>=20
> Add support for this &{$<orphan_name>/<path>} syntax to reference by
> path a local node from an orphan node.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc-lexer.l  |  7 +++++++
>  dtc-parser.y | 19 +++++++++++++++++++
>  dtc.c        | 22 ++++++++++++++++++++--
>  livetree.c   | 14 +++++++++++++-
>  treesource.c |  3 ++-
>  5 files changed, 61 insertions(+), 4 deletions(-)
>=20
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index cb616f9..540bfdf 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -239,6 +239,13 @@ static void PRINTF(1, 2) lexical_error(const char *f=
mt, ...);
>  			return DT_PATH_REF;
>  		}
> =20
> +<*>"&{\$"{LABEL}([/]{PATHCHAR}*)?\}  {	/* orphan path reference */
> +			yytext[yyleng-1] =3D '\0';
> +			DPRINT("Ref orphan path: %s\n", yytext+1);
> +			yylval.labelref =3D xstrdup(yytext+2);
> +			return DT_ORPHAN_PATH_REF;
> +		}
> +
>  <BYTESTRING>[0-9a-fA-F]{2} {
>  			yylval.byte =3D strtol(yytext, NULL, 16);
>  			DPRINT("Byte: %02x\n", (int)yylval.byte);
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 7f8c294..9d619cd 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -111,6 +111,7 @@ static struct node *parser_get_node_by_ref(struct nod=
e *dt, struct node *orphanl
>  %token <labelref> DT_LABEL
>  %token <labelref> DT_LABEL_REF
>  %token <labelref> DT_PATH_REF
> +%token <labelref> DT_ORPHAN_PATH_REF
>  %token DT_INCBIN
> =20
>  %type <data> propdata
> @@ -589,6 +590,24 @@ arrayprefix:
>  				ERROR(&@2, "References are only allowed in "
>  					    "arrays with 32-bit elements.");
> =20
> +			$$.data =3D data_append_integer($1.data, val, $1.bits);
> +		}
> +	| arrayprefix DT_ORPHAN_PATH_REF
> +		{
> +			uint64_t val =3D ~0ULL >> (64 - $1.bits);
> +
> +			if ($1.bits =3D=3D 32) {
> +				if (!(last_header_flags & DTSF_ADDON))
> +					ERROR(&@2, "Orphan path reference %s supported only in addon", $2);
> +
> +				$1.data =3D data_add_marker($1.data,
> +							  REF_PHANDLE,
> +							  $2);
> +			} else {
> +				ERROR(&@2, "References are only allowed in "
> +					    "arrays with 32-bit elements.");
> +			}
> +
>  			$$.data =3D data_append_integer($1.data, val, $1.bits);
>  		}
>  	| arrayprefix DT_LABEL
> diff --git a/dtc.c b/dtc.c
> index 63725bf..72d85e4 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -48,13 +48,31 @@ static void fill_fullpaths(struct node *tree, const c=
har *prefix)
>  static void dti_fill_fullpaths(struct dt_info *dti)
>  {
>  	struct node *orphan;
> +	struct node *child;
> =20
>  	/* Fill fullpaths for the root node */
>  	if (dti->dt)
>  		fill_fullpaths(dti->dt, "");
> =20
> -	for_each_orphan(dti->orphanlist, orphan)
> -		fill_fullpaths(orphan, "__orphan__/");
> +	/* Fill fullpaths for orphan nodes */
> +	for_each_orphan(dti->orphanlist, orphan) {
> +		if (orphan->name[0] =3D=3D '\0')
> +			die("orphan node has an empty name\n");
> +
> +		/*
> +		 * An orphan node name is set with its reference.
> +		 * Its name is in the form "&xxxxxx".
> +		 * For its full path, we use "$xxxxx" to make a clear
> +		 * distinction between a reference (&xxxx) where a resolution
> +		 * could be involved vs a "simple" path where we just need to
> +		 * identified the orphan ($xxxx).
> +		 */
> +		xasprintf(&orphan->fullpath, "$%s", orphan->name + 1);
> +		orphan->basenamelen =3D strlen(orphan->name);
> +
> +		for_each_child(orphan, child)
> +			fill_fullpaths(child, orphan->fullpath);
> +	}
>  }
> =20
>  /* Usage related data. */
> diff --git a/livetree.c b/livetree.c
> index 59b912d..263da1f 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -804,7 +804,19 @@ static struct node *get_node_by_ref(struct node *tre=
e, const char *ref)
>  			path =3D slash + 1;
>  		}
> =20
> -		target =3D get_node_by_label(tree, label);
> +		if (label[0] =3D=3D '$' && tree->name[0] =3D=3D '&') {
> +			/*
> +			 * We search for an orphan and the given tree is an
> +			 * orphan. Use the given tree only if it matches the
> +			 * expected orphan.
> +			 */
> +			if (streq(label + 1, tree->name + 1))
> +				target =3D tree;
> +			else
> +				target =3D NULL;
> +		} else {
> +			target =3D get_node_by_label(tree, label);
> +		}
> =20
>  		free(buf);
> =20
> diff --git a/treesource.c b/treesource.c
> index 71dbd5f..44de0db 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -278,7 +278,8 @@ static void write_propval(FILE *f, struct property *p=
rop)
>  					break;
> =20
>  			if (m_phandle) {
> -				if (m_phandle->ref[0] =3D=3D '/')
> +				if (m_phandle->ref[0] =3D=3D '/' /* Root node */ ||
> +				    m_phandle->ref[0] =3D=3D '$' /* Orphan node */)
>  					fprintf(f, "&{%s}", m_phandle->ref);
>  				else
>  					fprintf(f, "&%s", m_phandle->ref);
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--pibeh0ZI2CBpThH0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlokNIACgkQzQJF27ox
2GfW7A//bfWPutOealZSddCNE40ylqEjvnjmn3FYB7MsRaXcMNjzF4lTziEPmx7U
6Mcs+fLEifoplX3o2/pJXNJrELfKe8IpM5EbbHs8XJ5jrv50oJOGfnzu/jzyUgGL
0+Vx/6tMcUnusoF68Rttg7fFwKlupcXYKnX7CTfQgCX+tUXdGSIETBeoRVRuYvM2
xSE1QQrtT4L1y4ykvRuVNY6MieXeUYKFlqM7Azgi5JuVjY2UR/uR/dIgZowoE/kl
plSjQr3t19+EEmANGENKc4ewht9thuQKkeEeYBvNu1AfxZvRV+FmtI/Gy78f+FBX
OHFbP7rIMJ7qXTzWAjV3lPYfWE/OI7CTjeRqLvdjdbkF2LXBAkW2/vfbMjg3JIwv
4e38cfsMPy59ETuFCl7Q/9/gajY+QnYkTvlZeRemJ/hqGS4dXa1Yeq7nJNmkcMcc
yPTv9tCASAW7wQ3ndIZisa/yWEYQOy6/6orr65xlJWVtmUHFMqeuKqapDs9TDmAV
OuDMHZHNzZDRIFc+gxiK81nf98XGQtd+MGc1qwMsGpncmkm9sjTIsUvQK71PF4G+
v9yksgM8BvwAPDT/+XqFltHsr9sA2tv6ctPRFF2KpY2Tgg6Vlf8Nuly4S8B4Wcc4
y2H8rEr3ggMdIKNfVJPrEAidyGFocmV7IVJr4KtCDPBCT62qbHQ=
=gW9P
-----END PGP SIGNATURE-----

--pibeh0ZI2CBpThH0--
