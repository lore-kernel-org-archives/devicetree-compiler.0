Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549B410785;
	Thu, 15 Jan 2026 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458693; cv=none; b=NbRTnVIUYd160BPHjWph9zrIEf/vIAQ38l8Tdz5khVaDrWFelIRhLkmrPWXEcN1rX152eg8JgqhNhB96sRO9gJOtevDc0Qnl24EDj+Lj2jlHLZTZmggz+JcH0j5isjBteKCvYndTLkkTZR7fcdPT7PYzNYw0nrkvCmz2BKNQFI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458693; c=relaxed/simple;
	bh=clSgQJ3FoznqZMZK7+Ht/JfBznBVTG4xYcXR1r04+i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SY+Rg0Z10X1c+SVeOO9wl0XQv/nfPxmm5b4qcPFpWe6erjeaqkOqJvo3sjZZI72OnHaY25k4ajW4StH4u/Kh/n7hahN7eFLXuVspXEDpr213WKCZQmJv6QGxnKxugkhEcvb56ExTTUjfYbuHn6vm/szbxc1S3FTAURVFOMRjChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=ZRCRDmOa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="ZRCRDmOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768458687;
	bh=bAc/OM+xTMhatxegfi/Ylvlxfdj9vSuVvt3EClBDXNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRCRDmOa/8O7dG45+dIwQxIybo5h2EUYMA0B8F6U5Kb0TVOMMkuWjVsoEWXi9KFXz
	 d1ZVq93J6OZEulMteHW6flkWFZJmWwhRAEJh+YXr1xMy1q43Bz4vZ6CIwoCcHaU6ps
	 NOUGeK6KOgBrxDUIDM6/QgAd3mvJCktM4pKjZ6Jg31N9F2WotMkEYY+xVgcxgPdt/p
	 ZhfeqJnie2O1XkL7ELo++OUzqou0WGYwbAk4velcyPH3M4lGn0CuywuCVkXrYxcHQP
	 U0LRv6T2oJ7QVNAVYAbPkxQyZH3zCc2okA0cjPr9D4nFHZQH0vV/tMt9l1wb7/kJPu
	 uc8fpor4M3tVQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4dsCmv5rf1z4wDG; Thu, 15 Jan 2026 17:31:27 +1100 (AEDT)
Date: Thu, 15 Jan 2026 17:25:58 +1100
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
Subject: Re: [RFC PATCH 29/77] Add support for FDT_EXPORT_SYM_REF dtb tag
Message-ID: <aWiIdpH0oG7H4fMZ@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-30-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dTvBvcpWzv8FBtwh"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-30-herve.codina@bootlin.com>


--dTvBvcpWzv8FBtwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:19PM +0100, Herve Codina wrote:
> The FDT_EXPORT_SYM_REF dtb tag is similar to the FDT_EXPORT_SYM tag
> except that it identifies a reference to an external phandle. The node
> referenced by the phandle is not present in the device-tree blob.
>=20
> The FDT_EXPORT_SYM_REF dtb tag is a meta-data tag defining an exported
> symbol. It can be present in a node bloc meaning that a symbol is
> exported at this node level. The node pointed to by this symbol is not a
> local node (i.e. the node is not present in the device-tree blob.). This
> tag can be available only in overlay or addon device-tree blobs. The
> symbol has to be resolved when the device-tree blob is applied on top of
> a base device-tree.
>=20
> It is followed by three values and a possible alignment padding:
>   - name (string including \0)
>       The export symbol name. I.e. the name used to reference this
>       exported symbol.
>   - padding:
>       Padding (0x00) added to have the next value aligned on 32bit.
>   - phandle (32bit)
>       A placeholder for a phandle value.
>       This placeholder can be used during some dtb manipulation to store
>       a temporary phandle value.

Yuck.

>       In terms of FDT_EXPORT_SYM_REF definition, it has no meaningful
>       signification and will be probably set to 0xffffffff, the
>       unresolved phandle value.
>   - label (string including \0):
>       The label to use to resolve this symbol. This label is the
>       reference to the external phandle.
>   - padding:
>       Padding (0x00) added to have the next value aligned on 32bit.
>=20
> Example:
>   FDT_EXPORT_SYM_REF 'foo1' 0x00 0x00 0x00 0xffffffff 'foo_a' 0x00 0x00
>=20
>   This means that 'foo1' is an exported symbol and the node referenced
>   by this symbol is external to the dtb (unresolved symbol). This
>   external node is referenced by the "foo_a" label.
>=20
>   This is what is encoded in the dtb when the related dts has the
>   following exported symbol defined:
>     /export/ foo1: &foo_a;
>   with 'foo_a' a reference to a non local node.
>=20
> If several non local symbols are exported at a given node level, several
> FDT_EXPORT_SYM_REF are present. Each of them defining one symbol.
>=20
> For instance, exporting 'foo1' pointing the node referenced by 'foo_a'
> and exporting 'bar1' pointing to the node referenced by 'bar_b' leads to
> the following sequence:
>   FDT_EXPORT_SYM_REF 'foo1' 0x00 0x00 0x00 'foo_a' 0x00 0x00
>   FDT_EXPORT_SYM_REF 'bar1' 0x00 0x00 0x00 'bar_b' 0x00 0x00
>=20
> Add support for this new dtb tag.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  fdtdump.c    | 12 ++++++++++++
>  flattree.c   | 40 ++++++++++++++++++++++++++++++++++++++++
>  libfdt/fdt.c | 24 ++++++++++++++++++++++++
>  libfdt/fdt.h |  2 ++
>  4 files changed, 78 insertions(+)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index d1af5b6..8baadc4 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -186,6 +186,18 @@ static void dump_blob(void *blob, bool debug)
>  			continue;
>  		}
> =20
> +		if (tag =3D=3D FDT_EXPORT_SYM_REF) {
> +			s =3D p;
> +			p =3D PALIGN(p + strlen(s) + 1, 4);
> +			val32 =3D fdt32_to_cpu(GET_CELL(p));
> +			t =3D p;
> +			p =3D PALIGN(p + strlen(t) + 1, 4);
> +
> +			printf("%*s// [FDT_EXPORT_SYM_REF] '%s' -> '%s'\n", depth * shift, "",
> +				s, t);
> +			continue;
> +		}
> +
>  		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "=
", tag);
>  		break;
>  	}
> diff --git a/flattree.c b/flattree.c
> index bd52e81..d970259 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -49,6 +49,7 @@ struct emitter {
>  	void (*ref_local)(void *);
>  	void (*ref_phandle)(void *);
>  	void (*export_sym)(void *);
> +	void (*export_sym_ref)(void *);
>  };
> =20
>  static void bin_emit_cell(void *e, cell_t val)
> @@ -113,6 +114,11 @@ static void bin_emit_export_sym(void *e)
>  	bin_emit_cell(e, FDT_EXPORT_SYM);
>  }
> =20
> +static void bin_emit_export_sym_ref(void *e)
> +{
> +	bin_emit_cell(e, FDT_EXPORT_SYM_REF);
> +}
> +
>  static struct emitter bin_emitter =3D {
>  	.cell =3D bin_emit_cell,
>  	.string =3D bin_emit_string,
> @@ -124,6 +130,7 @@ static struct emitter bin_emitter =3D {
>  	.ref_local =3D bin_emit_ref_local,
>  	.ref_phandle =3D bin_emit_ref_phandle,
>  	.export_sym =3D bin_emit_export_sym,
> +	.export_sym_ref =3D bin_emit_export_sym_ref,
>  };
> =20
>  static void emit_label(FILE *f, const char *prefix, const char *label)
> @@ -259,6 +266,14 @@ static void asm_emit_export_sym(void *e)
>  	asm_emit_cell(e, FDT_EXPORT_SYM);
>  }
> =20
> +static void asm_emit_export_sym_ref(void *e)
> +{
> +	FILE *f =3D e;
> +
> +	fprintf(f, "\t/* FDT_EXPORT_SYM_REF */\n");
> +	asm_emit_cell(e, FDT_EXPORT_SYM_REF);
> +}
> +
>  static struct emitter asm_emitter =3D {
>  	.cell =3D asm_emit_cell,
>  	.string =3D asm_emit_string,
> @@ -270,6 +285,7 @@ static struct emitter asm_emitter =3D {
>  	.ref_local =3D asm_emit_ref_local,
>  	.ref_phandle =3D asm_emit_ref_phandle,
>  	.export_sym =3D asm_emit_export_sym,
> +	.export_sym =3D asm_emit_export_sym_ref,
>  };
> =20
>  static int stringtable_insert(struct data *d, const char *str)
> @@ -369,6 +385,18 @@ static void flatten_tree(struct node *tree, struct e=
mitter *emit,
>  				emit->cell(etarget, exportsym->phandle);
>  				continue;
>  			}
> +
> +			if (exportsym->ref[0] =3D=3D '/')
> +				die("Export symbol uses a non local reference by path (%s)\n",
> +				    m->ref);
> +
> +			emit->export_sym_ref(etarget);
> +			emit->string(etarget, exportsym->name, 0);
> +			emit->align(etarget, sizeof(cell_t));
> +			/* Placeholder for the phandle */
> +			emit->cell(etarget, exportsym->phandle);
> +			emit->string(etarget, exportsym->ref, 0);
> +			emit->align(etarget, sizeof(cell_t));
>  		}
>  	}
> =20
> @@ -838,6 +866,7 @@ static struct node *unflatten_tree(struct inbuf *dtbu=
f,
>  	uint32_t val;
>  	uint32_t offset;
>  	const char *str;
> +	const char *str2;
> =20
>  	node =3D build_node(NULL, NULL, NULL, NULL);
> =20
> @@ -919,6 +948,17 @@ static struct node *unflatten_tree(struct inbuf *dtb=
uf,
>  			add_symbol(&node->exportsymlist, exportsym);
>  			break;
> =20
> +		case FDT_EXPORT_SYM_REF:
> +			if (!(flags & FTF_EXPORT_IMPORT_SYM))
> +				die("FDT_EXPORT_SYM_REF tag found in flat tree"
> +					" version <18\n");
> +			str =3D flat_read_string(dtbuf); /* Name */
> +			phandle =3D flat_read_word(dtbuf); /* Phandle */
> +			str2 =3D flat_read_string(dtbuf); /* Ref */
> +			exportsym =3D build_exportsym(str, str2, phandle, NULL);
> +			add_symbol(&node->exportsymlist, exportsym);
> +			break;
> +
>  		default:
>  			die("Invalid opcode word %08x in device tree blob\n",
>  			    val);
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 44d7399..febfa71 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -248,6 +248,29 @@ uint32_t fdt_next_tag_full(const void *fdt, int star=
toffset, int *nextoffset)
>  		offset +=3D sizeof(fdt32_t);
>  		break;
> =20
> +	case FDT_EXPORT_SYM_REF:
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
> +
> +		/* Skip external name */
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
> @@ -290,6 +313,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  		case FDT_REF_LOCAL:
>  		case FDT_REF_PHANDLE:
>  		case FDT_EXPORT_SYM:
> +		case FDT_EXPORT_SYM_REF:
>  			/*
>  			 * Next tag is a meta-data tag present in the middle
>  			 * of the structure -> Skip it and look at next one
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index e85bc07..c23723b 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -65,6 +65,8 @@ struct fdt_property {
>  					   external label */
>  #define FDT_END		0x9
>  #define FDT_EXPORT_SYM	0xa		/* export symbol: name, phandle value */
> +#define FDT_EXPORT_SYM_REF 0xb		/* export symbol: name, phandle value (m=
aybe
> +					   unresolved), external label */
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

--dTvBvcpWzv8FBtwh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloiHUACgkQzQJF27ox
2GcV9RAAoHnVkrkm0N0g5W4WmSZ2MH6QOG9dwEjvIiCdiy2C5B9jO6WHcoYr5WyM
NW7ZFX/cEktpLD7WdwWPir1+Lv4UtYpJbj2ir3LDdf5ur7uqq8sm4OBWzh5jqEiG
jxslPUgPaCFFaeZEvFj25SxgygqfpkuD+MD+Kr2B2vCuxrDM3s+66v8Ve0KTvQM0
Ka3+BhJZOagpIeom53KoZpXqRFuoIKOCRErwGjlZQ8XcxyaXsQeXqxAi0oslGanR
hIwdH+kf84fBry8Q2AuwsuMI6O3Zl2ljH/BSq1ZkhUJokR8j3DOSVjMZ5FFfiD9v
sBuSgUdjUIlBAr8FMrz1KQp9U0ZebgHAZSXM5Ko4O+SPt1k0eK9bejxVKBm0SaP9
tFrMSvbGg7XenQ/JIyZfKc07QwpSdqTmdcef1RYFkX74gOztn1NAvoaMCmFRaa6D
8KK4X/4O7Tqi3p7SDCSafQalXMPuUiMTsE8t4BW5pt99zjOC/n6z9jFde28frBqU
DKhzONNs01PN6e75DQZKmxtQH4tQOt+ipHVy8OI0L8hYgkYU2DmgQd4SXyil4tpP
cftNjyOSp9yisyfKCaMmxpuOI2b6PRN/yLdfYZi+OnVVcEso0H6Tb5haPlq7KUy+
k+K+M1yykn5oG0hT2+IiW6Qf7mY7f8KAo3fMhHwMs8a5gAEBYrU=
=spLn
-----END PGP SIGNATURE-----

--dTvBvcpWzv8FBtwh--
