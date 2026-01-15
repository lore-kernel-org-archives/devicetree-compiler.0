Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593A92BF3E2;
	Thu, 15 Jan 2026 06:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768457469; cv=none; b=BG8O00j0SLWkLeIMxllBA8CDASJwuFyBxm0uoyet63b/O4lOx8eiHPmlxYDF+rvuKOOOTAMUyXZZR35xRjKk0VNjMHdv11BtKUpxlbWR0RGlFy/gWJ3x89tb611/rf56NAhhiuyUbr2j7lnz9h4y72MZocRdfHpwLvzd/3t9X1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768457469; c=relaxed/simple;
	bh=deuyGtkR0fzb3Qh2OCewDd44P1zRCYVEjSp2WWaOVJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyFieBEEfjM72LfbxbJKjD1GkfeH17FBZLiO1pzn57bTBro0aVqgkYG6E5eSwUESKi1NCWnvCoqafPtPZqx6jc1zYeQMuM4lLzbZVnFMCyijYNoS2GsUrHDyeGv1Y6YGTwX2x3O1d3sjEtXGYflG8/yyXmreKL8N3L9fEl0W4gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=P5kfWY60; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="P5kfWY60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768457464;
	bh=RL6KQvPZCiHd+6lYFi1oFrd4+a0mwGyFM3/+gplWADw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5kfWY60aXnXExWwIP5dXQHV9uUDbxgl8TpdJbKWZhM8hH5cWvVyGo6GyNTrSGMtS
	 hjVPknCwbv/wDK4KaPYxiIYboTiu3lNCRttpilB38btFd+I+rgKiTccMjlpk402EI5
	 gff2diqktcEFhyCpg3IR+V67u/86V8aEuCBPl8EugBEvIoDD2bJ0wCVQ/OK+YkIJnq
	 mX4Hhcajt5HSP7uSZeavL2kDSTrUOWXnYb8krADP+AP/moAWW8V5KlchsIM6LitcTm
	 b1rvQPdBu1x60ErpOcibJRTTjKHVU3s7hogiJ+DlBrpD7ddhyF7hoW5pkPDC69N+oF
	 kxNxdmStjt4rg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsCKN52Xlz4wBD; Thu, 15 Jan 2026 17:11:04 +1100 (AEDT)
Date: Thu, 15 Jan 2026 16:57:50 +1100
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
Subject: Re: [RFC PATCH 20/77] dtc: Add support for /export/ dts keyword
 parsing
Message-ID: <aWiB3pDx4owt-70D@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-21-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nQ4PGTChdYHrGjAy"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-21-herve.codina@bootlin.com>


--nQ4PGTChdYHrGjAy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:10PM +0100, Herve Codina wrote:
> The /export/ dts keyword is the keyword used to define an exported
> symbol at a given node level.
>=20
> This keyword can be present in a node definition (after properties and
> before subnodes) to export a symbol. If several symbols need to be
> exported, several /export/ keywords are present.
>=20
> The syntax used is the following:
>   /export/ name: reference;
>=20
> with:
>   name: The name of the exported symbol
>   reference: The reference of a node the symbol is pointing to.
>=20
> For instance:
>   - Reference by label:
>       /export/ foo: &foo1;
>=20
>     The exported symbol foo references the node identified by
>     the label foo1.
>=20
>   - Reference by path:
>       /export/ foo: &{/path/to/foo@100};
>=20
>     The exported symbol foo references the node at /path/to/foo@100.
>=20
> Add support for /export/ dts keyword.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc-lexer.l  |  6 ++++
>  dtc-parser.y | 53 ++++++++++++++++++++++++++++++++++
>  dtc.h        |  8 ++++++
>  livetree.c   | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 147 insertions(+)
>=20
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index a4a8e0b..90fe70e 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -149,6 +149,12 @@ static void PRINTF(1, 2) lexical_error(const char *f=
mt, ...);
>  			return DT_OMIT_NO_REF;
>  		}
> =20
> +<*>"/export/" 	{
> +			DPRINT("Keyword: /export/\n");
> +			BEGIN_DEFAULT();
> +			return DT_EXPORT;
> +		}
> +
>  <*>{LABEL}:	{
>  			DPRINT("Label: %s\n", yytext);
>  			yylval.labelref =3D xstrdup(yytext);
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 9c93673..a0d0aef 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -46,6 +46,8 @@ static bool is_ref_relative(const char *ref)
>  	struct property *proplist;
>  	struct node *node;
>  	struct node *nodelist;
> +	struct symbol *symbol;
> +	struct symbol *exportlist;
>  	struct reserve_info *re;
>  	uint64_t integer;
>  	unsigned int flags;
> @@ -60,6 +62,7 @@ static bool is_ref_relative(const char *ref)
>  %token DT_DEL_PROP
>  %token DT_DEL_NODE
>  %token DT_OMIT_NO_REF
> +%token DT_EXPORT
>  %token <propnodename> DT_PROPNODENAME
>  %token <integer> DT_LITERAL
>  %token <integer> DT_CHAR_LITERAL
> @@ -80,6 +83,8 @@ static bool is_ref_relative(const char *ref)
>  %type <data> bytestring
>  %type <prop> propdef
>  %type <proplist> proplist
> +%type <symbol> exportdef
> +%type <exportlist> exportlist
>  %type <labelref> dt_ref
> =20
>  %type <node> devicetree
> @@ -276,6 +281,49 @@ nodedef:
>  		{
>  			$$ =3D build_node(NULL, $2, NULL, &@$);
>  		}
> +	| '{' proplist exportlist subnodes '}' ';'
> +		{
> +			/*
> +			 * exportlist is created with chain_symbol() and so it
> +			 * is created in reverse order. Reverse it now to have
> +			 * it in correct order
> +			 */
> +			$$ =3D build_node($2, $4, reverse_symbol($3), &@$);
> +		}
> +	| '{' exportlist subnodes '}' ';'
> +		{
> +			/*
> +			 * exportlist is created with chain_symbol() and so it
> +			 * is created in reverse order. Reverse it now to have
> +			 * it in correct order
> +			 */
> +			$$ =3D build_node(NULL, $3, reverse_symbol($2), &@$);
> +		}
> +	;
> +
> +exportlist:
> +	  exportdef
> +		{
> +			$$ =3D chain_symbol($1, NULL);
> +		}
> +	| exportlist exportdef
> +		{
> +			$$ =3D chain_symbol($2, $1);
> +		}
> +	| exportlist propdef
> +		{
> +			ERROR(&@2, "Properties must precede exports");
> +			YYERROR;
> +		}
> +	;
> +
> +exportdef:
> +	DT_EXPORT DT_LABEL dt_ref ';'
> +		{
> +			$$ =3D build_exportsym($2, $3, 0, &@$);
> +			free($2);
> +			free($3);

I mostly don't bother with free()s in dtc, on the grounds that it's
generally a short-lived process - essentially using the process
context as a crude pool allocator.

> +		}
>  	;
> =20
>  proplist:
> @@ -576,6 +624,11 @@ subnodes:
>  			ERROR(&@2, "Properties must precede subnodes");
>  			YYERROR;
>  		}
> +	| subnode exportdef
> +		{
> +			ERROR(&@2, "Exports must precede subnodes");
> +			YYERROR;
> +		}
>  	;
> =20
>  subnode:
> diff --git a/dtc.h b/dtc.h
> index 6508694..0bf5ba5 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -273,6 +273,9 @@ struct node {
>  	for_each_child_withdel(n, c) \
>  		if (!(c)->deleted)
> =20
> +#define for_each_symbol(s0, s) \
> +	for ((s) =3D (s0); (s); (s) =3D (s)->next)
> +
>  void add_label(struct label **labels, char *label);
>  void delete_labels(struct label **labels);
> =20
> @@ -282,6 +285,11 @@ struct property *build_property_delete(const char *n=
ame);
>  struct property *chain_property(struct property *first, struct property =
*list);
>  struct property *reverse_properties(struct property *first);
> =20
> +struct symbol *build_exportsym(const char *name, const char *ref, cell_t=
 phandle,
> +			       struct srcpos *srcpos);
> +struct symbol *chain_symbol(struct symbol *first, struct symbol *list);
> +struct symbol *reverse_symbol(struct symbol *list);
> +
>  struct node *build_node(struct property *proplist, struct node *children,
>  			struct symbol *exportsymlist, struct srcpos *srcpos);
>  struct node *build_node_delete(struct srcpos *srcpos);
> diff --git a/livetree.c b/livetree.c
> index 0050492..4458437 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -36,6 +36,57 @@ void delete_labels(struct label **labels)
>  		label->deleted =3D 1;
>  }
> =20
> +struct symbol *build_exportsym(const char *name, const char *ref, cell_t=
 phandle,
> +			       struct srcpos *srcpos)
> +{
> +	struct symbol *new =3D xmalloc(sizeof(*new));
> +
> +	memset(new, 0, sizeof(*new));
> +
> +	new->name =3D xstrdup(name);
> +	new->ref =3D ref ? xstrdup(ref) : NULL;
> +	new->phandle =3D phandle;
> +	new->srcpos =3D srcpos_copy(srcpos);
> +
> +	return new;
> +}
> +
> +struct symbol *chain_symbol(struct symbol *first, struct symbol *list)
> +{
> +	assert(first->next =3D=3D NULL);
> +
> +	first->next =3D list;
> +	return first;
> +}
> +
> +struct symbol *reverse_symbol(struct symbol *list)
> +{
> +	struct symbol *p =3D list;
> +	struct symbol *head =3D NULL;
> +	struct symbol *next;
> +
> +	while (p) {
> +		next =3D p->next;
> +		p->next =3D head;
> +		head =3D p;
> +		p =3D next;
> +	}
> +	return head;
> +}
> +
> +static void add_symbol(struct symbol **list, struct symbol *new)
> +{
> +	struct symbol **s;
> +
> +	new->next =3D NULL;
> +
> +	s =3D list;
> +	while (*s)
> +		s =3D &((*s)->next);
> +
> +	*s =3D new;
> +}
> +
>  struct property *build_property(const char *name, struct data val,
>  				struct srcpos *srcpos)
>  {
> @@ -144,6 +195,7 @@ struct node *merge_nodes(struct node *old_node, struc=
t node *new_node)
>  {
>  	struct property *new_prop, *old_prop;
>  	struct node *new_child, *old_child;
> +	struct symbol *new_sym, *old_sym;
>  	struct label *l;
> =20
>  	old_node->deleted =3D 0;
> @@ -217,6 +269,34 @@ struct node *merge_nodes(struct node *old_node, stru=
ct node *new_node)
>  			add_child(old_node, new_child);
>  	}
> =20
> +	/* Merge exported symbols. If there is a collision, keep the new one */
> +	while (new_node->exportsymlist) {
> +		/* Pop the symbol off the list */
> +		new_sym =3D new_node->exportsymlist;
> +		new_node->exportsymlist =3D new_sym->next;
> +		new_sym->next =3D NULL;
> +
> +		/* Look for a collision, set new value if there is */
> +		for_each_symbol(old_node->exportsymlist, old_sym) {
> +			if (streq(old_sym->name, new_sym->name)) {
> +				old_sym->is_local =3D new_sym->is_local;
> +				free(old_sym->ref);
> +				old_sym->ref =3D new_sym->ref;
> +				old_sym->phandle =3D new_sym->phandle;
> +				old_sym->fullpath =3D new_sym->fullpath;
> +				srcpos_free(old_sym->srcpos);
> +				old_sym->srcpos =3D new_sym->srcpos;
> +				free(new_sym);
> +				new_sym =3D NULL;
> +				break;
> +			}
> +		}
> +
> +		/* if no collision occurred, add symbol to the old node list. */
> +		if (new_sym)
> +			add_symbol(&old_node->exportsymlist, new_sym);
> +	}
> +
>  	old_node->srcpos =3D srcpos_extend(old_node->srcpos, new_node->srcpos);
> =20
>  	/* The new node contents are now merged into the old node.  Free
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--nQ4PGTChdYHrGjAy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlogd0ACgkQzQJF27ox
2Ge7zw/+N0RL5tJk8HBBELcIhBnbpOoTzjiFD/jX6IDtZ8yB4UHnEf2JP5PPg0ou
VHQ2Yp0ncRo7sASQB03MR0XOllhvNm1TWG/SVyUMYttozfUP/a/DCmdOI3f2Qsc6
zaZFzG/VY6tZIoOtY93HXXSrLrwxLWMKNyDQ13Dd8n2+JmmYBqwHnUOvP9mTKkyi
JmbEXJVFkk1Zvn7yMyN0iaqBs2yF+qqnxhASJBKolO5b9pLysgJP8+S9XKBfMtco
ivXuHFu/1Bc/RGFZ3LyLGMLjuVoYERzZosSclhoffTPNFqj4/toC4++SfhG27h1G
URJg/sggB8W039KzvvSJY12K1J4mmz6xPZXQdjJmyoESP2f1OKtPg3XEm/19pFUb
hOLeItpc/dp1PN1W+LIS8CRgNE6UdpitIp61TXVTXt9eAj0timQvStKdEjRAUPGR
+pAo8IahciFb+ol7K3KIC0QQfllXuFPlNciFeyuWu+WG5bNrNdYlwvynnvbVrE+c
+008Ha7NC+0dsJJ0inLRqGXUWufLL6aY+Eqlt306Aoh+F8u7dPJ4+n1IrB/Bn4Dg
UiYFqpT9/QNRbFg6pS7yKcB0hIOBgMKx3N6rbYY812Zl5xx+qF0+TutjSmgkbL60
IbqVo/HtDckJFG/SG9PF5HI2wWuQUDgMg1BspD7/am69DQeHXcc=
=MWZe
-----END PGP SIGNATURE-----

--nQ4PGTChdYHrGjAy--
