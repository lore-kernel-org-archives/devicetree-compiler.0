Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A004204E;
	Thu, 15 Jan 2026 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458692; cv=none; b=DXHNMkg5aRHUH74sbJC+pwiU1DTI+Z0iI/OOcyfElf5npOuMu2e6TY5MKK0Mj18vBalnxHdJ+/5oluVK3qsvXM+8ZqkNlppguMcpAeeRzf28vI9hdAIcxURQFZeO9PaxY+H/kUoXtJb64wnNqAYMoBLVZGZQcTEStIrFbnr3S/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458692; c=relaxed/simple;
	bh=ze3QanNhTYE3jpK7SNNNXhwxp1XyK1gQifb/35kTJOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgKsWbwC5l8b4iY6HTZ4g8UWRh46iPUVymCyNDmHN2ZqHm8UoJsn6ImqOXbRFKi7hcGRo2z9iBuYcrdvw8UrllABHv2CsZMP3pRg3CTllk473HKf5MjIbxYEBZfcvaSEAJ+hhFY4nFs1btS5tV6OwkdE4AkuoLrrhGFFkGjaoPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=pAVDydvd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="pAVDydvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768458687;
	bh=UWHXXT7jY9sP6yQUYrJXLukd8qApC+qzOr9sGoNuV1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pAVDydvdWjkSdK1C7G0NwOciHg3L3/1ZGXMb1XncJRB3GMokf7+D4l8TVm7uOkSuc
	 vCcuTCChCKPYxBHrz+fUpWwhzxG03sTTPPb21XH5mndNCAZKDc1yg84/2F3D9fsAzz
	 bPgjFZnUM2cXRHvlBJ52VFCy3dpX1rqwISAgE5qYRIbNncptynDymH01k51jOulYbu
	 0EEtOzUz6+NUYFjqedXoo0hAnfKU7Tp37tWGoP0oR9KozA8hEQTht1Rj4TRs9zKoPT
	 gfhllEiFi4iW8Cho4Ej/LYm1OTzgz+4DlJB+ZS2hgrmQ1K93yeuqDWTBs6YmwMxtIG
	 6M/6q2PZqjNDQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsCmv5fx6z4wHX; Thu, 15 Jan 2026 17:31:27 +1100 (AEDT)
Date: Thu, 15 Jan 2026 17:23:17 +1100
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
Subject: Re: [RFC PATCH 25/77] Add support for FDT_EXPORT_SYM dtb tag
Message-ID: <aWiH1QRmj8rZY2Nk@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-26-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ixZrUEgDavWM5vwy"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-26-herve.codina@bootlin.com>


--ixZrUEgDavWM5vwy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:15PM +0100, Herve Codina wrote:
> The FDT_EXPORT_SYM dtb tag is a meta-data tag defining an exported
> symbol. It can be present in a node bloc meaning that a symbol is
> exported at this node level. The node pointed to by this symbol is a
> local node and identified by a phandle value.
>=20
> The tag is followed by two values and a possible alignment padding:
>   - name (string including \0)
>       The export symbol name. I.e. the name used to reference this
>       exported symbol.
>   - padding:
>       Padding (0x00) added to have the next value aligned on 32bit.
>   - phandle (32bit)
>       The phandle value identifying the node referenced by this
>   symbol.

I'd suggest putting the phandle before the name, to avoid internal
padding.

>=20
> Example:
>   FDT_EXPORT_SYM 'foo1' 0x00 0x00 0x00 0x00000004
>=20
>   This means that 'foo1' is an exported symbol and the node referenced
>   by this symbol is the node with the phandle value equals 4.
>=20
>   This is what is encoded in the dtb when the related dts has the
>   following exported symbol defined:
>     /export/ foo1: &foo;
>   with 'foo' a reference to an existing node where the phandle value is
>   0x0000004.
>=20
> If several symbols are exported at a given node level, several
> FDT_EXPORT_SYM are present. Each of them defining one symbol.
>=20
> For instance, exporting 'foo' pointing to phandle 4 and 'bar' pointing
> to phandle 8 leads to the following sequence:
>   FDT_EXPORT_SYM 'foo' 0x00 0x00 0x00 0x00000004
>   FDT_EXPORT_SYM 'bar' 0x00 0x00 0x00 0x00000008
>=20
> Add support for this new dtb tag.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc.h                    |  1 +
>  fdtdump.c                | 12 +++++++++-
>  flattree.c               | 47 ++++++++++++++++++++++++++++++++++++++--
>  libfdt/fdt.c             | 17 +++++++++++++++
>  libfdt/fdt.h             |  2 ++
>  libfdt/libfdt_internal.h |  1 +
>  livetree.c               |  2 +-
>  7 files changed, 78 insertions(+), 4 deletions(-)
>=20
> diff --git a/dtc.h b/dtc.h
> index 024e172..22816ba 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -289,6 +289,7 @@ struct symbol *build_exportsym(const char *name, cons=
t char *ref, cell_t phandle
>  			       struct srcpos *srcpos);
>  struct symbol *chain_symbol(struct symbol *first, struct symbol *list);
>  struct symbol *reverse_symbol(struct symbol *list);
> +void add_symbol(struct symbol **list, struct symbol *new);
> =20
>  struct node *build_node(struct property *proplist, struct node *children,
>  			struct symbol *exportsymlist, struct srcpos *srcpos);
> diff --git a/fdtdump.c b/fdtdump.c
> index 9b6f41a..d1af5b6 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -57,7 +57,7 @@ static void dump_blob(void *blob, bool debug)
>  	const char *p_strings =3D (const char *)blob + off_str;
>  	uint32_t version =3D fdt32_to_cpu(bph->version);
>  	uint32_t totalsize =3D fdt32_to_cpu(bph->totalsize);
> -	uint32_t tag, offset;
> +	uint32_t tag, offset, val32;
>  	const char *p, *s, *t;
>  	const char *last_prop_name =3D NULL;
>  	int depth, sz, shift;
> @@ -176,6 +176,16 @@ static void dump_blob(void *blob, bool debug)
>  			continue;
>  		}
> =20
> +		if (tag =3D=3D FDT_EXPORT_SYM) {
> +			s =3D p;
> +			p =3D PALIGN(p + strlen(s) + 1, 4);
> +			val32 =3D fdt32_to_cpu(GET_CELL(p));
> +
> +			printf("%*s// [FDT_EXPORT_SYM] '%s' -> phandle 0x%08"PRIx32"\n",
> +				depth * shift, "", s, val32);
> +			continue;
> +		}
> +
>  		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "=
", tag);
>  		break;
>  	}
> diff --git a/flattree.c b/flattree.c
> index 36b795d..bd52e81 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -15,6 +15,7 @@
>  #define FTF_NOPS	0x40
>  #define FTF_REF_XXX	0x80
>  #define FTF_DTFLAGS	0x100
> +#define FTF_EXPORT_IMPORT_SYM 0x200
> =20
>  static struct version_info {
>  	int version;
> @@ -34,7 +35,7 @@ static struct version_info {
>  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS},
>  	{18, 18, FDT_V18_SIZE,
>  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_REF_XXX|
> -	 FTF_DTFLAGS},
> +	 FTF_DTFLAGS|FTF_EXPORT_IMPORT_SYM},
>  };
> =20
>  struct emitter {
> @@ -47,6 +48,7 @@ struct emitter {
>  	void (*property)(void *, struct label *labels);
>  	void (*ref_local)(void *);
>  	void (*ref_phandle)(void *);
> +	void (*export_sym)(void *);
>  };
> =20
>  static void bin_emit_cell(void *e, cell_t val)
> @@ -106,6 +108,11 @@ static void bin_emit_ref_phandle(void *e)
>  	bin_emit_cell(e, FDT_REF_PHANDLE);
>  }
> =20
> +static void bin_emit_export_sym(void *e)
> +{
> +	bin_emit_cell(e, FDT_EXPORT_SYM);
> +}
> +
>  static struct emitter bin_emitter =3D {
>  	.cell =3D bin_emit_cell,
>  	.string =3D bin_emit_string,
> @@ -116,6 +123,7 @@ static struct emitter bin_emitter =3D {
>  	.property =3D bin_emit_property,
>  	.ref_local =3D bin_emit_ref_local,
>  	.ref_phandle =3D bin_emit_ref_phandle,
> +	.export_sym =3D bin_emit_export_sym,
>  };
> =20
>  static void emit_label(FILE *f, const char *prefix, const char *label)
> @@ -243,6 +251,14 @@ static void asm_emit_ref_phandle(void *e)
>  	asm_emit_cell(e, FDT_REF_PHANDLE);
>  }
> =20
> +static void asm_emit_export_sym(void *e)
> +{
> +	FILE *f =3D e;
> +
> +	fprintf(f, "\t/* FDT_EXPORT_SYM */\n");
> +	asm_emit_cell(e, FDT_EXPORT_SYM);
> +}
> +
>  static struct emitter asm_emitter =3D {
>  	.cell =3D asm_emit_cell,
>  	.string =3D asm_emit_string,
> @@ -253,6 +269,7 @@ static struct emitter asm_emitter =3D {
>  	.property =3D asm_emit_property,
>  	.ref_local =3D asm_emit_ref_local,
>  	.ref_phandle =3D asm_emit_ref_phandle,
> +	.export_sym =3D asm_emit_export_sym,
>  };
> =20
>  static int stringtable_insert(struct data *d, const char *str)
> @@ -274,6 +291,7 @@ static void flatten_tree(struct node *tree, struct em=
itter *emit,
>  			 void *etarget, struct data *strbuf,
>  			 struct version_info *vi)
>  {
> +	struct symbol *exportsym;
>  	struct property *prop;
>  	struct node *child;
>  	bool seen_name_prop =3D false;
> @@ -342,6 +360,18 @@ static void flatten_tree(struct node *tree, struct e=
mitter *emit,
>  		emit->align(etarget, sizeof(cell_t));
>  	}
> =20
> +	if (vi->flags & FTF_EXPORT_IMPORT_SYM) {
> +		for_each_symbol(tree->exportsymlist, exportsym) {
> +			if (exportsym->is_local) {
> +				emit->export_sym(etarget);
> +				emit->string(etarget, exportsym->name, 0);
> +				emit->align(etarget, sizeof(cell_t));
> +				emit->cell(etarget, exportsym->phandle);
> +				continue;
> +			}
> +		}
> +	}
> +
>  	for_each_child(tree, child) {
>  		flatten_tree(child, emit, etarget, strbuf, vi);
>  	}
> @@ -820,9 +850,11 @@ static struct node *unflatten_tree(struct inbuf *dtb=
uf,
>  		node->name =3D xstrdup(flatname);
> =20
>  	do {
> +		struct symbol *exportsym;
>  		struct property *prop;
>  		struct node *child;
>  		struct marker *m;
> +		cell_t phandle;
> =20
>  		val =3D flat_read_word(dtbuf);
>  		switch (val) {
> @@ -876,6 +908,17 @@ static struct node *unflatten_tree(struct inbuf *dtb=
uf,
>  			prop->val =3D data_append_markers(prop->val, m);
>  			break;
> =20
> +		case FDT_EXPORT_SYM:
> +			if (!(flags & FTF_EXPORT_IMPORT_SYM))
> +				die("FDT_EXPORT_SYM tag found in flat tree"
> +					" version <18\n");
> +			str =3D flat_read_string(dtbuf);
> +			phandle =3D flat_read_word(dtbuf);
> +			exportsym =3D build_exportsym(str, NULL, phandle, NULL);
> +			exportsym->is_local =3D true;
> +			add_symbol(&node->exportsymlist, exportsym);
> +			break;
> +
>  		default:
>  			die("Invalid opcode word %08x in device tree blob\n",
>  			    val);
> @@ -996,7 +1039,7 @@ struct dt_info *dt_from_blob(const char *fname)
>  	}
> =20
>  	if (version >=3D 18) {
> -		flags |=3D FTF_REF_XXX | FTF_DTFLAGS;
> +		flags |=3D FTF_REF_XXX | FTF_DTFLAGS | FTF_EXPORT_IMPORT_SYM;
>  		dtsflags |=3D fdt32_to_cpu(fdt->dt_flags) & FDT_FLAG_ADDON ?
>  				DTSF_ADDON : 0;
>  	}
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 8f3c35d..44d7399 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -232,6 +232,22 @@ uint32_t fdt_next_tag_full(const void *fdt, int star=
toffset, int *nextoffset)
>  			return FDT_END; /* premature end */
>  		break;
> =20
> +	case FDT_EXPORT_SYM:
> +		/* Skip name */
> +		do {
> +			p =3D fdt_offset_ptr(fdt, offset++, 1);
> +		} while (p && (*p !=3D '\0'));
> +		if (!can_assume(VALID_DTB) && !p)
> +			return FDT_END; /* premature end */
> +		offset =3D FDT_CELLALIGN(offset);
> +
> +		/* Skip phandle */
> +		tmp32p =3D fdt_offset_ptr(fdt, offset, sizeof(*tmp32p));
> +		if (!can_assume(VALID_DTB) && !tmp32p)
> +			return FDT_END; /* premature end */
> +		offset +=3D sizeof(fdt32_t);
> +		break;
> +
>  	default:
>  		return FDT_END;
>  	}
> @@ -273,6 +289,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
> =20
>  		case FDT_REF_LOCAL:
>  		case FDT_REF_PHANDLE:
> +		case FDT_EXPORT_SYM:
>  			/*
>  			 * Next tag is a meta-data tag present in the middle
>  			 * of the structure -> Skip it and look at next one
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index 94f65e6..e85bc07 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -53,6 +53,7 @@ struct fdt_property {
>  #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
>  #define FDT_FLAG_ADDON  0x1
>  #define FDT_TAGSIZE	sizeof(fdt32_t)
> +#define FDT_CELLSIZE	sizeof(fdt32_t)
> =20
>  #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
>  #define FDT_END_NODE	0x2		/* End node */
> @@ -63,6 +64,7 @@ struct fdt_property {
>  #define FDT_REF_PHANDLE 0x6		/* external phandle reference: offset,
>  					   external label */
>  #define FDT_END		0x9
> +#define FDT_EXPORT_SYM	0xa		/* export symbol: name, phandle value */
> =20
>  #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
>  #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 0e103ca..d80d218 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -9,6 +9,7 @@
> =20
>  #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
>  #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
> +#define FDT_CELLALIGN(x)	(FDT_ALIGN((x), FDT_CELLSIZE))
> =20
>  int32_t fdt_ro_probe_(const void *fdt);
>  #define FDT_RO_PROBE(fdt)						\
> diff --git a/livetree.c b/livetree.c
> index 7cf3ee5..7efa1da 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -74,7 +74,7 @@ struct symbol *reverse_symbol(struct symbol *list)
>  	return head;
>  }
> =20
> -static void add_symbol(struct symbol **list, struct symbol *new)
> +void add_symbol(struct symbol **list, struct symbol *new)
>  {
>  	struct symbol **s;
> =20
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--ixZrUEgDavWM5vwy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloh9QACgkQzQJF27ox
2GeP/BAAhV5x9uBozg7ascAhTCFnqkBRJcEdP7RLfof70dQHZuUxM64lk6lo7gsF
v+RkE8fL3z+Tq54XvCjp9uq3voJudjEQj1sCYZ3HrHn87dERbJlfYqQvLMV1Stbr
KDq8v5oGIN4fI09i67B+ypY/eLbEw2rshHtW9JrJQz1rwST3wpzoBxepdAWbD273
Dac5FnXK8f9S80agTn0a5f7byEwpABKGdmbQybiMrDY2aaeQFyeHwzECoGy15jZr
a4VxP8Ct61rGsBW1n5aSaxE77HTgwmR2amGR7TqnpCRtsUzGShlp0Xx+Eu6udn1s
D3jPcrjBBokIZfiIBULCLzk7318Jh77XG5fP396kHCh5cOacgmoIigziaZ7rpBfl
Fgb7KTgLA5e1cvzTPIDlm21ijeJINTEtzO8E/6DK+3mtsjQclsiv3Ea25f391a5k
EuTgdHt9v5Y+4JxvRP5eCGI+ubYli/HXosHS5U5YhUb8BMQ8R6uQd6ZZ4bDimXCO
qUCLKjK9U53In4R8Ws3NGJkG8HETSq0OzGAcCIoV1cSLvEVsukVELcrOz/1yRFzJ
AP4bV/z9H8jrGs4lCD1jYp2VOx86rnhsL0LfN5MeEStigeo+lSHrRUhJC7rvDp3Z
oEq1bT14FKsDsjvmU5+e4s34I5eAVPyTS018qLbGShBREtuMKzU=
=nqXr
-----END PGP SIGNATURE-----

--ixZrUEgDavWM5vwy--
