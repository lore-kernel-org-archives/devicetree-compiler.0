Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8A23DEB6;
	Thu, 15 Jan 2026 01:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768440910; cv=none; b=IuE7EuSmq9U9J0WZL5cAk9bgFuzOtCYhrE6aI/rBAFjVwn/M95jGKD2WP3Klkw+IbKKHKeXjQagD98m1z14SrwEy19JC7r34n5n+2BI6vTPwcxMIBd3Gd54iID4QJihdxavlOWm/CR3N1908Zs76uoDPNTmHC2ysbq1qRnPiyB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768440910; c=relaxed/simple;
	bh=vrJ5Onaidmg8Mj25Bw2rU+OzaJHYu0vA6ObNiaJmPsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jl07zsa1pYcCcyUaOuzbb1DY1632P29ZCkMR9aefvVzMoZRol6BTkBmCmpXWjDV0NezDSrIQ7gI6HqRoxMfW3GO51JW802RUSIPNhlXlS1B5PT/sTzyofYnXJWoG5n9a0DZ0Z9JEX3vzlQBSy0sSBKuAno3kXL0suqs2Nh/lris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au; spf=pass smtp.mailfrom=gandalf.ozlabs.org; dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b=Cg94T0VF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.b="Cg94T0VF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202512; t=1768440903;
	bh=iqIWDfSNu2QzgRlMv7foHMFZz6jvcgrBoz2eavRLKr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cg94T0VFkkk8E6uxCp3qAYZvWdhaIO9tDh/i0EWy8eZHhSLFVLAWS3WUCd4Pz2mCY
	 qlTjZVf8JMtFDwUr9BjXBMWmRkf5e+ifuQHJlEP3R7qDW4u+1tD3HD76ZUwtDwXbbs
	 6H86pEP5cPCTYQ2T9gTq1KOJ/MEEq+v2/kRJV/uHYVRv3jxgStQWulN6Gle4tItxD2
	 NL5vWmdtgKqNCXXvjG4kdawkbx+Oo6X9M+tH631F3J36/lGX7DjkJHg9QxM4PYgZwO
	 u2sGMIHSGfxvkUviZbyJsPuJtumO7evqn+2egB/NdmjYFKn5EbAohoyXNR1l/M6I6d
	 ft/ccDQ4Pu3kw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4ds5Bv27Sfz4wCR; Thu, 15 Jan 2026 12:35:03 +1100 (AEDT)
Date: Thu, 15 Jan 2026 12:24:49 +1100
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
Subject: Re: [RFC PATCH 11/77] Add support for FDT_REF_PHANDLE dtb tag
Message-ID: <aWhB4fYnXCD2f6Uq@zatzit>
References: <20260112142009.1006236-1-herve.codina@bootlin.com>
 <20260112142009.1006236-12-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bC9QrpiiTJamxNMG"
Content-Disposition: inline
In-Reply-To: <20260112142009.1006236-12-herve.codina@bootlin.com>


--bC9QrpiiTJamxNMG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 03:19:01PM +0100, Herve Codina wrote:
> The FDT_REF_PHANDLE dtb tag is similar to the FDT_REF_LOCAL tag except
> that it identifies a reference to an external phandle. The node
> referenced by the phandle is not present in the device-tree blob.

The names FDT_REF_PHANDLE and FDT_REF_LOCAL are perhaps a little
misleading - both are marking a phandle, the difference is in the form
of reference.  That's quite difference from the distinction between
the REF_PHANDLE and REF_PATH marker types, where the difference is in
what the reference expands to in the property.

> The FDT_REF_PHANDLE dtb tag is a meta-data tag attached to a property.
>=20
> It indicates that the property defined before this tag (FDT_PROP) uses a
> phandle value and the node related to this phandle value is not local
> node (i.e. the node is not present in the device-tree blob). This tag
> can be available only in overlay or addon device-tree blobs. The phandle
> value used in the property has to be resolved when the device-tree blob
> is applied on top of a base device-tree.

This is kind of looking ahead, but does that imply that this tag is
only valid in addon dtbs?

> It is followed by two values and a possible alignment padding:
>  - offset (32bit):
>      Offset in the property data where the phandle is available.
>  - label (string including \0):
>      The label to use to resolve the phandle value.

I expect it will become apparent later in the series, but it would be
helpful to clarify what the scope of that label is.  A single node?
The whole tree?  Across a tree and all its possible addons?

>  - padding:
>      Padding (0x00) added to have the next tag aligned on 32bit.
>=20
> Example:
>   FDT_PROP 0x00000008 xxxxxxxx 0x00 0x01 0x02 0x03 0xff 0xff 0xff 0xff
>   FDT_REF_PHANDLE 0x00000004 "foo1" 0x00 0x00 0x00
>=20
>   This means that at the offset 4 of the property data, the value
>   (0xffffffff) is an unresolved phandle value and the related node is
>   the node referenced by "foo1".
>=20
>   This is what is encoded in the dtb when the related dts has a property
>   with the value set to <0x00010203 &foo1> with 'foo1' a reference
>   to an non local node.
>=20
> If several non local phandles are used in the property data, several
> FDT_REF_PHANDLE are present after the FDT_PROP tag. Each of them points
> with its offset value to the position of one phandle.
>=20
> For instance, if a first property with 8 bytes of data has a
> unresolved phandle value at offset 4 referenced by "foo" and a second
> property with 16 bytes of data has unresolved phandle values at offset 0
> and 8 referenced by "bar" and "baz", the following tags sequence is
> present:
>   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
>   FDT_REF_PHANDLE 0x00000004 "foo" 0x00 0x00 0x00
>   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
>   FDT_REF_LOCAL 0x00000000 "bar" 0x00 0x00 0x00
>   FDT_REF_LOCAL 0x00000008 "baz" 0x00 0x00 0x00
>=20
> Add support for this new dtb tag.
>=20
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Link: https://lore.kernel.org/all/aL-2fmYsbexEtpNp@zatzit/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtc.c        | 12 ++++++++++++
>  fdtdump.c    | 10 ++++++++++
>  flattree.c   | 37 +++++++++++++++++++++++++++++++++++++
>  libfdt/fdt.c | 16 ++++++++++++++++
>  libfdt/fdt.h |  2 ++
>  5 files changed, 77 insertions(+)
>=20
> diff --git a/dtc.c b/dtc.c
> index d0b4de3..fe8e8e4 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -336,6 +336,18 @@ int main(int argc, char *argv[])
>  	update_phandles_ref(dti);
>  	mark_local_phandles(dti);
> =20
> +	/*
> +	 * With FDT_REF_PHANDLE added in dtbs, we need to identified
> +	 * if some unresolved phandle references are allowed in the dtb
> +	 * we have parsed (needed for process_check() to run properly).
> +	 *
> +	 * Identify plugin device-trees (overlays) based on specific node
> +	 * presence.
> +	 */
> +	if (get_subnode(dti->dt, "__fixups__") ||
> +	    get_subnode(dti->dt, "__local_fixups__"))
> +		dti->dtsflags |=3D DTSF_PLUGIN;
> +
>  	process_checks(force, dti);
> =20
>  	if (auto_label_aliases)
> diff --git a/fdtdump.c b/fdtdump.c
> index dffa9a6..7300280 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -158,6 +158,16 @@ static void dump_blob(void *blob, bool debug)
>  			continue;
>  		}
> =20
> +		if (tag =3D=3D FDT_REF_PHANDLE) {
> +			offset =3D fdt32_to_cpu(GET_CELL(p));
> +			s =3D p;
> +			p =3D PALIGN(p + strlen(s) + 1, 4);
> +
> +			printf("%*s// [FDT_REF_PHANDLE] %s[%"PRIu32"], ref =3D %s\n",
> +				depth * shift, "", last_prop_name, offset, s);
> +			continue;
> +		}
> +
>  		fprintf(stderr, "%*s ** Unknown tag 0x%08"PRIx32"\n", depth * shift, "=
", tag);
>  		break;
>  	}
> diff --git a/flattree.c b/flattree.c
> index 5c597ad..07f7545 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -44,6 +44,7 @@ struct emitter {
>  	void (*endnode)(void *, struct label *labels);
>  	void (*property)(void *, struct label *labels);
>  	void (*ref_local)(void *);
> +	void (*ref_phandle)(void *);
>  };
> =20
>  static void bin_emit_cell(void *e, cell_t val)
> @@ -98,6 +99,11 @@ static void bin_emit_ref_local(void *e)
>  	bin_emit_cell(e, FDT_REF_LOCAL);
>  }
> =20
> +static void bin_emit_ref_phandle(void *e)
> +{
> +	bin_emit_cell(e, FDT_REF_PHANDLE);
> +}
> +
>  static struct emitter bin_emitter =3D {
>  	.cell =3D bin_emit_cell,
>  	.string =3D bin_emit_string,
> @@ -107,6 +113,7 @@ static struct emitter bin_emitter =3D {
>  	.endnode =3D bin_emit_endnode,
>  	.property =3D bin_emit_property,
>  	.ref_local =3D bin_emit_ref_local,
> +	.ref_phandle =3D bin_emit_ref_phandle,
>  };
> =20
>  static void emit_label(FILE *f, const char *prefix, const char *label)
> @@ -226,6 +233,14 @@ static void asm_emit_ref_local(void *e)
>  	asm_emit_cell(e, FDT_REF_LOCAL);
>  }
> =20
> +static void asm_emit_ref_phandle(void *e)
> +{
> +	FILE *f =3D e;
> +
> +	fprintf(f, "\t/* FDT_REF_PHANDLE */\n");
> +	asm_emit_cell(e, FDT_REF_PHANDLE);
> +}
> +
>  static struct emitter asm_emitter =3D {
>  	.cell =3D asm_emit_cell,
>  	.string =3D asm_emit_string,
> @@ -235,6 +250,7 @@ static struct emitter asm_emitter =3D {
>  	.endnode =3D asm_emit_endnode,
>  	.property =3D asm_emit_property,
>  	.ref_local =3D asm_emit_ref_local,
> +	.ref_phandle =3D asm_emit_ref_phandle,
>  };
> =20
>  static int stringtable_insert(struct data *d, const char *str)
> @@ -299,6 +315,15 @@ static void flatten_tree(struct node *tree, struct e=
mitter *emit,
>  					emit->cell(etarget, m->offset);
>  					continue;
>  				}
> +
> +				if (m->ref[0] =3D=3D '/')
> +					die("Phandle uses a non local reference by path (%s)\n",
> +					    m->ref);
> +
> +				emit->ref_phandle(etarget);
> +				emit->cell(etarget, m->offset);
> +				emit->string(etarget, m->ref, 0);
> +				emit->align(etarget, sizeof(cell_t));
>  			}
>  		}
>  	}
> @@ -767,6 +792,7 @@ static struct node *unflatten_tree(struct inbuf *dtbu=
f,
>  	const char *flatname;
>  	uint32_t val;
>  	uint32_t offset;
> +	const char *str;
> =20
>  	node =3D build_node(NULL, NULL, NULL);
> =20
> @@ -824,6 +850,17 @@ static struct node *unflatten_tree(struct inbuf *dtb=
uf,
>  			prop->val =3D data_append_markers(prop->val, m);
>  			break;
> =20
> +		case FDT_REF_PHANDLE:
> +			if (!(flags & FTF_REF_XXX))
> +				die("REF_PHANDLE tag found in flat tree"
> +					" version <18\n");
> +
> +			offset =3D flat_read_word(dtbuf);
> +			str =3D flat_read_string(dtbuf);
> +			m =3D alloc_marker(offset, REF_PHANDLE, xstrdup(str));
> +			prop->val =3D data_append_markers(prop->val, m);
> +			break;
> +
>  		default:
>  			die("Invalid opcode word %08x in device tree blob\n",
>  			    val);
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 7268fb6..8f3c35d 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -217,6 +217,21 @@ uint32_t fdt_next_tag_full(const void *fdt, int star=
toffset, int *nextoffset)
>  		offset +=3D sizeof(fdt32_t);
>  		break;
> =20
> +	case FDT_REF_PHANDLE:
> +		/* Skip offset value */
> +		tmp32p =3D fdt_offset_ptr(fdt, offset, sizeof(*tmp32p));
> +		if (!can_assume(VALID_DTB) && !tmp32p)
> +			return FDT_END; /* premature end */
> +		offset +=3D sizeof(fdt32_t);
> +
> +		/* Skip ref */
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
> @@ -257,6 +272,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffse=
t, int *nextoffset)
>  			return tag;
> =20
>  		case FDT_REF_LOCAL:
> +		case FDT_REF_PHANDLE:
>  			/*
>  			 * Next tag is a meta-data tag present in the middle
>  			 * of the structure -> Skip it and look at next one
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index f8efdf1..530d2e5 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -56,6 +56,8 @@ struct fdt_property {
>  					   size, content */
>  #define FDT_NOP		0x4		/* nop */
>  #define FDT_REF_LOCAL   0x5		/* local phandle reference: offset */
> +#define FDT_REF_PHANDLE 0x6		/* external phandle reference: offset,
> +					   external label */
>  #define FDT_END		0x9
> =20
>  #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
> --=20
> 2.52.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--bC9QrpiiTJamxNMG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmloQeAACgkQzQJF27ox
2GcwhxAAjunMSwYlFkVKH+LhVsKr6N1T6ME1UkSPVHS5BhT9XZ9OdWvmhmaf2Vnd
UrCd+tTzztbNbudwITU8Rnzii2mihx9ioWPIC2HqNtJcPGxUbtiYeDFTjUfZXF8o
op00cKYEBGqG8A1CXcYnW3tDRfAy+Fn41uoTlR0ZipOk1xTRBHGHJ+7tX/tIn/m6
ERpCKrVJXTmRYCsu7XO2NDv4+UjE//cMnt5hnUgevnBxw6NNbKZfrQgbuvGKTp+1
ImCOmxALbz5T+fae5ktFDyDyzONuSXFrnKSfBmwdPHnAg52OJWhkyNpJMCFF1+jh
wsJKmcn8yKAnPz8V28+wB/22YimGAEskXvX57zD6Fy0PrEPzXrqTDRqh4NN8wIpb
KB5Kv8pu0wPPffvo9u+DGPNJCysAL9TzJsI5a+uy+dNnjYejX4hfG/JyaxZY/Fvz
KgXQA2nuL/bGg0MPldh0ONGxPxaGatwVEFExWmwyE3kVJA6Gp7vsBQhH+ZWfrNoA
C7RVTmar9hjbblrluaxeAKHX8MDScjCgytkDOMyTVgo61xQYYBFXKmgjtcbfWcrK
3z72ZzPab4ssMiTGpKn6qE+OlxCoXwdYxiF8fFL0+IvBueT7NYe+lVnQMupHSQOt
7s6CWJQ7s9UegVe/Bf/aOnBDhqqkMWcHNpuvD8pR4us5lLaWA3s=
=++ek
-----END PGP SIGNATURE-----

--bC9QrpiiTJamxNMG--
