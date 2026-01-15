Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C22DC767;
	Thu, 15 Jan 2026 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459406; cv=none; b=Mu9QkM+u2QKc8cwIS/GXVLbr6yTS+CspJCRm5ytnI3Rh8oN4iZQI72jIkXpVjxOUqLe6Yae+94vcG0pop+BxH3aAZ5uAVeB84AgT/dSb1QnELM3z6MqUklZdUFh/mDR2WpMl5qXHdQ3Erei3pRM5F6HmeiVB0uNmn8pjf5+HYB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459406; c=relaxed/simple;
	bh=tCyK4KldAUXTuiuRRKtykK8ttKuD6Cl4z+W4Ecw4Ckc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmuDTkrg/1VNIIOmXvhv8RkKprUbKKzbCSrrqigc72n6znainxPsqI4eVdYPEf8IPjEeHAKsCJ5KwFBLXXjOngMJnA9gVf+d9LYvlmhWhsIWrG5Z1fzuA4lMFM8UhhDww8XvyoMKXGPsRmCGuxbHGwKtv+tFelqMSH8gCnktXVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=LRsxmCgS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="LRsxmCgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768459402;
	bh=R985+SJtxckOyFHtl6dA9dH2ieMM+QBUKPgzhVStz54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRsxmCgSI/1d2YJynqo11wnw4u7HSi2yiDufB/ygMfrXBDhaMxoxt5oYpbFBOk9kz
	 5X9AxCur+ni8F2AgczlzTMuw11+YWrxxetBo/cptKtZK3ghSdCfE7QAUaZVrt4QwU9
	 rOMECPQWBuPVnJDQIUwJXYVIGGFU0Xq8rn32lwRd+yHsA/iDc8XpYhePAoNXWHlu49
	 Dx6M60y7/gRRRrkmWPtLG39ysHrLfDXUZFnYgXW3LC8j4hRLB2XvmdeJEpuRVGqdAG
	 DF0mPyc7fYcpvrzSowmZRKvDtu5JyD63IY7f3ZSEwKZ3CaJxr6GQTXLeNL4dzQQJmp
	 IzPLBw43xjU4A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsD2f0HzWz4wDk; Thu, 15 Jan 2026 17:43:22 +1100 (AEDT)
Date: Thu, 15 Jan 2026 17:41:11 +1100
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
Subject: Re: [RFC PATCH 35/77] Add support for FDT_IMPORT_SYM dtb tag
Message-ID: <aWiMB8MljbOl-RRX@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-36-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="su4AnIOq3ZPyhezC"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-36-herve.codina@bootlin.com>


--su4AnIOq3ZPyhezC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:25PM +0100, Herve Codina wrote:
> The FDT_IMPORT_SYM dtb tag is a meta-data tag defining an imported
> symbol. It can be present globally in an addon dtb (i.e. outside nodes
> definition) meaning that this symbol needs to be resolved when the dtb
> is applied.
>=20
> The tag is followed by two values and possible alignment paddings:
>   - name (string including \0)
>       The import symbol name. I.e. the name used to reference this
>       imported symbol.
>   - padding:
>       Padding (0x00) added to have the next value aligned on 32bit.
>   - compatible (string including \0)
>       The compatible string that can be used for symbol resolution.
>       This string can be an empty string if it is not relevant.
>   - padding:
>       Padding (0x00) added to have the next value aligned on 32bit.
>=20
> Example:
>   FDT_IMPORT_SYM 'foo1' 0x00 0x00 0x00 'bar,foo'
>=20
>   This means that 'foo1' is an imported symbol and it is 'bar,foo'
>   compatible.
>=20
>   This is what is encoded in the dtb when the related dts has the
>   following imported symbol defined:
>     /import/ foo1: "bar,foo";
>=20
> If several symbols are imported, several FDT_IMPORT_SYM are present.
> Each of them defining one imported symbol. For instance, importing
> 'foo1' ("bar,foo" compatible) and 'baz1' ("bar,baz" compatible) leads
> to the following sequence:
>   FDT_IMPORT_SYM 'foo1' 0x00 0x00 0x00 'bar,foo'
>   FDT_IMPORT_SYM 'baz1' 0x00 0x00 0x00 'bar,baz'
>=20
> If FDT_IMPORT_SYM tags are present in the dtb, they are present after
> the root node definition (i.e. after the FDT_END_NODE related to the
> first FDT_BEGIN_NODE).
>=20
> Add support for this new dtb tag.

Since these are global to the whole tree, would a new block make more
sense?

>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  fdtdump.c    | 11 +++++++++
>  flattree.c   | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/fdt.c | 28 ++++++++++++++++++++++
>  libfdt/fdt.h |  1 +
>  4 files changed, 107 insertions(+), 1 deletion(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 8baadc4..04e6e38 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -198,6 +198,17 @@ static void dump_blob(void *blob, bool debug)
>  			continue;
>  		}
> =20
> +		if (tag =3D=3D FDT_IMPORT_SYM) {
> +			s =3D p;
> +			p =3D PALIGN(p + strlen(s) + 1, 4);
> +			t =3D p;
> +			p =3D PALIGN(p + strlen(t) + 1, 4);
> +
> +			printf("%*s// [FDT_IMPORT_SYM] '%s' (%s)\n", depth * shift, "",
> +				s, t);
> +			continue;
> +		}
> +
>  		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "=
", tag);
>  		break;
>  	}
> diff --git a/flattree.c b/flattree.c
> index 47a289f..add02f0 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -50,6 +50,7 @@ struct emitter {
>  	void (*ref_phandle)(void *);
>  	void (*export_sym)(void *);
>  	void (*export_sym_ref)(void *);
> +	void (*import_sym)(void *);
>  };
> =20
>  static void bin_emit_cell(void *e, cell_t val)
> @@ -119,6 +120,11 @@ static void bin_emit_export_sym_ref(void *e)
>  	bin_emit_cell(e, FDT_EXPORT_SYM_REF);
>  }
> =20
> +static void bin_emit_import_sym(void *e)
> +{
> +	bin_emit_cell(e, FDT_IMPORT_SYM);
> +}
> +
>  static struct emitter bin_emitter =3D {
>  	.cell =3D bin_emit_cell,
>  	.string =3D bin_emit_string,
> @@ -131,6 +137,7 @@ static struct emitter bin_emitter =3D {
>  	.ref_phandle =3D bin_emit_ref_phandle,
>  	.export_sym =3D bin_emit_export_sym,
>  	.export_sym_ref =3D bin_emit_export_sym_ref,
> +	.import_sym =3D bin_emit_import_sym,
>  };
> =20
>  static void emit_label(FILE *f, const char *prefix, const char *label)
> @@ -274,6 +281,17 @@ static void asm_emit_export_sym_ref(void *e)
>  	asm_emit_cell(e, FDT_EXPORT_SYM_REF);
>  }
> =20
> +static void asm_emit_import_sym(void *e)
> +{
> +	/*
> +	 * Import symbols are an feature introduced for addons.
> +	 * Addons device-tree blob have to reason to be in the asm format.
> +	 *
> +	 * Need to be implemented if really needed.
> +	 */
> +	die("FDT_IMPORT_SYM not supported in asm output\n");
> +}
> +
>  static struct emitter asm_emitter =3D {
>  	.cell =3D asm_emit_cell,
>  	.string =3D asm_emit_string,
> @@ -286,6 +304,7 @@ static struct emitter asm_emitter =3D {
>  	.ref_phandle =3D asm_emit_ref_phandle,
>  	.export_sym =3D asm_emit_export_sym,
>  	.export_sym =3D asm_emit_export_sym_ref,
> +	.import_sym =3D asm_emit_import_sym,
>  };
> =20
>  static int stringtable_insert(struct data *d, const char *str)
> @@ -461,6 +480,26 @@ static void make_fdt_header(struct fdt_header *fdt,
>  		fdt->dt_flags =3D cpu_to_fdt32(dt_flags);
>  }
> =20
> +static void flatten_imports(struct symbol *importsymlist, struct emitter=
 *emit,
> +			 void *etarget, struct version_info *vi, uint32_t dt_flags)
> +{
> +	struct symbol *importsym;
> +
> +	if (!(vi->flags & FTF_EXPORT_IMPORT_SYM))
> +		return;
> +
> +	if (!(dt_flags & FDT_FLAG_ADDON) && importsymlist)
> +		die("Only addons can have an import list\n");
> +
> +	for_each_symbol(importsymlist, importsym) {
> +		emit->import_sym(etarget);
> +		emit->string(etarget, importsym->name, 0);
> +		emit->align(etarget, sizeof(cell_t));
> +		emit->string(etarget, importsym->compatible, 0);
> +		emit->align(etarget, sizeof(cell_t));
> +	}
> +}
> +
>  void dt_to_blob(FILE *f, struct dt_info *dti, int version)
>  {
>  	struct version_info *vi =3D NULL;
> @@ -483,6 +522,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int ver=
sion)
>  	dt_flags |=3D dti->dtsflags & DTSF_ADDON ? FDT_FLAG_ADDON : 0;
> =20
>  	flatten_tree(dti->dt, &bin_emitter, &dtbuf, &strbuf, vi);
> +	flatten_imports(dti->importsymlist, &bin_emitter, &dtbuf, vi, dt_flags);
>  	bin_emit_cell(&dtbuf, FDT_END);
> =20
>  	reservebuf =3D flatten_reserve_list(dti->reservelist, vi);
> @@ -574,6 +614,9 @@ void dt_to_asm(FILE *f, struct dt_info *dti, int vers=
ion)
>  	const char *symprefix =3D "dt";
>  	uint32_t dt_flags =3D 0;
> =20
> +	if (dti->importsymlist)
> +		die("Import symbols not supported in asm format\n");
> +
>  	for (i =3D 0; i < ARRAY_SIZE(version_table); i++) {
>  		if (version_table[i].version =3D=3D version)
>  			vi =3D &version_table[i];
> @@ -810,6 +853,16 @@ static struct property *flat_read_property(struct in=
buf *dtbuf,
>  	return build_property(name, val, NULL);
>  }
> =20
> +static struct symbol *flat_read_importsym(struct inbuf *inb)
> +{
> +	const char *name;
> +	const char *compatible;
> +
> +	name =3D flat_read_string(inb);
> +	compatible =3D  flat_read_string(inb);
> +
> +	return build_importsym(name, compatible, NULL);
> +}
> =20
>  static struct reserve_info *flat_read_mem_reserve(struct inbuf *inb)
>  {
> @@ -984,6 +1037,8 @@ struct dt_info *dt_from_blob(const char *fname)
>  	int sizeleft;
>  	struct reserve_info *reservelist;
>  	struct node *tree;
> +	struct symbol *importsymlist =3D NULL;
> +	struct symbol *importsym;
>  	uint32_t val;
>  	int flags =3D 0;
>  	unsigned int dtsflags =3D 0;
> @@ -1098,6 +1153,17 @@ struct dt_info *dt_from_blob(const char *fname)
>  	tree =3D unflatten_tree(&dtbuf, &strbuf, "", flags);
> =20
>  	val =3D flat_read_word(&dtbuf);
> +
> +	if (dtsflags & DTSF_ADDON) {
> +		if (flags & FTF_EXPORT_IMPORT_SYM) {
> +			while (val =3D=3D FDT_IMPORT_SYM) {
> +				importsym =3D flat_read_importsym(&dtbuf);
> +				add_symbol(&importsymlist, importsym);
> +				val =3D flat_read_word(&dtbuf);
> +			}
> +		}
> +	}
> +
>  	if (val !=3D FDT_END)
>  		die("Device tree blob doesn't end with FDT_END\n");
> =20
> @@ -1105,5 +1171,5 @@ struct dt_info *dt_from_blob(const char *fname)
> =20
>  	fclose(f);
> =20
> -	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_=
phys, NULL);
> +	return build_dt_info(DTSF_V1 | dtsflags, reservelist, tree, boot_cpuid_=
phys, importsymlist);
>  }
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index febfa71..c169dd9 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -271,6 +271,23 @@ uint32_t fdt_next_tag_full(const void *fdt, int star=
toffset, int *nextoffset)
>  			return FDT_END; /* premature end */
>  		break;
> =20
> +	case FDT_IMPORT_SYM:
> +		/* Skip name */
> +		do {
> +			p =3D fdt_offset_ptr(fdt, offset++, 1);
> +		} while (p && (*p !=3D '\0'));
> +		if (!can_assume(VALID_DTB) && !p)
> +			return FDT_END; /* premature end */
> +		offset =3D FDT_CELLALIGN(offset);
> +
> +		/* Skip compatible */
> +		do {
> +			p =3D fdt_offset_ptr(fdt, offset++, 1);
> +		} while (p && (*p !=3D '\0'));
> +		if (!can_assume(VALID_DTB) && !p)
> +			return FDT_END; /* premature end */
> +		break;
> +
>  	default:
>  		return FDT_END;
>  	}
> @@ -286,6 +303,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  {
>  	uint32_t tag, tmp_tag;
>  	int tmp_offset, tmp_next;
> +	int is_skip_to_end =3D 0;
> =20
>  	/* Retrieve next tag */
>  	tag =3D fdt_next_tag_full(fdt, startoffset, nextoffset);
> @@ -300,6 +318,9 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  		case FDT_END_NODE:
>  		case FDT_PROP:
>  		case FDT_NOP:
> +			if (is_skip_to_end)
> +				break;
> +
>  		case FDT_END:
>  			/*
>  			 * Next tag is not a meta-data tag -> Ok this next tag
> @@ -320,6 +341,13 @@ uint32_t fdt_next_tag(const void *fdt, int startoffs=
et, int *nextoffset)
>  			 */
>  			break;
> =20
> +		case FDT_IMPORT_SYM:
> +			/* Those tags are available at the root level, after the
> +			 * root node -> Skip everything until FDT_END
> +			 */
> +			is_skip_to_end =3D 1;
> +			break;
> +
>  		default:
>  			break;
>  		}
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index c23723b..b6c23ef 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -67,6 +67,7 @@ struct fdt_property {
>  #define FDT_EXPORT_SYM	0xa		/* export symbol: name, phandle value */
>  #define FDT_EXPORT_SYM_REF 0xb		/* export symbol: name, phandle value (m=
aybe
>  					   unresolved), external label */
> +#define FDT_IMPORT_SYM	0xc		/* import symbol: name, compatible */
> =20
>  #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
>  #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--su4AnIOq3ZPyhezC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmlojAYACgkQzQJF27ox
2GcnxxAAq4nvR1gXUw8hmCdTmrB87c220ERWopLlBdEcTPww6sgyCE4mxuolQgn4
1edSvRGm5zTNvJpNo2WO0ncTjt4ggsZ+ptDuBhzqETXwqzSkHSzjyC8zx2JvSoC5
i1maMh/CIMm0OnansWouuEN/1a6sbui8QrxWdO1wS1lmKm2JSsCwELEmGR4hIYO2
EW0uqJ2KVU15CjzarLK8nr1NPfgulCi+eTh+r3vXKxm59Z3Bow8xVLTfBWjOa8wV
h7Sv3RD0gTIjyK8Ucl3uRn8CxQVgssZea7GHxIXANKa/VUNo5rVNMTs1dJD44koC
kdlLhN/wBIOSBx0Vobg7ByZHa0iJ/bY5TBleTyZCsrs6wlWQU9GyK/fc1Dg5dRmO
kPMZIbSIF7XXgtHBbuS3gkmUCWfu6MD2SId5s+DbVw+KFdqY3FIOJ+5RKyohcbJx
Mdyo3ouADEiyLb59FGEb1nP0HBFo9X90F8FWNOKSgbzJ5SEi+xFOSj7F9SdgEpnW
YM7nHEvp3FdVLV7aaaqRiH72XIt9zamGtNMiFR74B/ARDj4qr4TyI2xwpMjJYr52
u46rTEEa++xxSH35YFiDPvrQKMOvehZyaB+WfkSZcUKoy0/opv6fQgaTuK+Q9tMQ
2/G7WDnqGONzMDk5/06hiejTKCrh3kERSPPAOSSmTAZ8lRA0J74=
=XOeS
-----END PGP SIGNATURE-----

--su4AnIOq3ZPyhezC--
