Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552408;
	b=3YvPmL0KB15DAGCvpy7DEUEW8ktYOPyLdpdIXsfuOIlbRGwf7DFLfN6TFEzM2ptsQ+Fi
	 8TyRMMtjMbyc85RvbomCH3ilYrgQDDY6wFIqnFiYrey5W4/z1hz2Otvj7UNeFAVHVm/lh
	 S4g92cy3uN/lurOq4YR0WMjk1C9vRuFsSAZYsXirOe/iGHXKO4ZgEeAMwE6MFRAOmXfsc
	 P/iVbB8xPcL/T1ndpKtPaZICJyMvFeKWJOME4vmAiy7sUoIpJ/CNv91RtN/5P5Rde1bAB
	 56PsztnQp0IInWKQdaKe2xl7YdOJHANLcWQDKsqM6a2gt2S3++vgU/f5+xl1AztjHmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552408;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=DTJyOxbf+haA341yD/TunC05jM+l+s3sA7W2OGhqEmM=;
	b=TsU9dM9QEbLyMnBtaUM/vTE2gB0T7dzHbcppFuJol6oANV51bks06Pvi61HBLR/FAzeE
	 pNbiAsdXXbY2hGr8n4UHG84yk0Gd3GkOmo2Y9MpnbYmV6VEYkPyZ2EzMPticRF9tEpF7s
	 ZHq11v4QKQrNPKOT7SknB3yMPzQ5BrU+1daOwp3pNYtTOA1+Qp6i81V4/7ib3BXDu9DM4
	 kQzsF8Bcy/SBsxx+zL45ioOU+PmGytCuf4yxqeZLJF0yWYYRZPfHbwxw5WcrzN2ip7z73
	 /sA7UpxxNLnGqyuyuhhctdpcWMkA9Zj92WoRuONY4x7O4Od21BG7mZP1RmTkfSnVwow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	dkim=pass header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=CitQ41US;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBC1606A31A;
	Wed, 21 Oct 2026 03:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBC1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=202610 header.b=CitQ41US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1792552403;
	bh=DTJyOxbf+haA341yD/TunC05jM+l+s3sA7W2OGhqEmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CitQ41USJ3Qc3e+FedmKa+cQCn5fTgvie2uVVGtT8TMs6mov2/cOnk9/HyfJmfjTf
	 2WTfzNsX03tWFJC98MV1/28ZWu3lY4g4oxbA960JnYEnW4pXW1BQZd3Y/s9fKt+Opu
	 YAD2ZFiL3HK4HwWOnAgWP5BDET914YtAU3Z6OU3b10lwtvIEbSZjoVSQ+hKNzxr9nQ
	 iLHcz2bHIwjng46tinD/kzOQDOFIB73frf4rU/WUUmSIBf6xdNvaimb7ESjz3n2n4V
	 5Acd1U8QjJSvN1SGJ7b2mU+VLx8EhOmXLhFmlOulH5gOAp+XWEcO7UKBfiZQvBXxwV
	 BepyF2G5wRKOg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4j8Z9b3p1Hz4wLS; Wed, 21 Oct 2026 14:13:23 +1100 (AEDT)
Date: Wed, 21 Oct 2026 14:13:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 07/74] Add support for FDT_PROPDATA_PHANDLE dtb tag
Message-ID: <atgtw8QubzVfWMYP@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-8-herve.codina@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="qbpNZZGYc3ugXr+U"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-8-herve.codina@bootlin.com>

--qbpNZZGYc3ugXr+U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:36AM +0200, Herve Codina wrote:
> FDT_PROPDATA_PHANDLE dtb tag is a meta-data tag attached to a property.
>=20
> It indicates that the property defined before this tag (FDT_PROP) uses a
> phandle value and the node related to this phandle value is local (i.e.
> the node is present in the device-tree blob).
>=20
> It is followed by one value:
>  - offset (32bit):
>      Offset in the property data where the phandle is available.

The definition of the tag seems fine.  As a general rule, data within
properties is not aligned, so it might be worth noting explicitly that
offset can be any integer, not just multiples of 4.

The name seems a little clunky, but I'm struggling a bit to come up
with a better one.  FDT_PHANDLE_LOCAL maybe?  FDT_PLINK_LOCAL?

> Example:
>   FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0x04
>   FDT_PROPDATA_PHANDLE 0x00000004
>=20
>   This means that at the offset 4 of the property data, the value
>   (0x01020304) is a phandle and the related node is available in the
>   dtb.
>=20
>   This is what is encoded in the dtb when the related dts has a property
>   with the value set to <0xcafedeca &foo> with 'foo' a reference to an
>   existing node where the phandle value is 0x01020304.
>=20
> If several local phandles are used in the property data, several
> FDT_PROPDATA_PHANDLE are present after the FDT_PROP tag. Each of them
> points with its offset value to the position of one phandle.
>=20
> For instance, if a first property with 8 bytes of data has a phandle
> value at offset 4 and a second property with 16 bytes of data has
> phandle values at offset 0 and 8, the following tags sequence is
> present:
>   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
>   FDT_PROPDATA_PHANDLE 0x00000004
>   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
>   FDT_PROPDATA_PHANDLE 0x00000000
>   FDT_PROPDATA_PHANDLE 0x00000008
>=20
> Add support for this new dtb tag.
>=20
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Link: https://lore.kernel.org/all/aL-2fmYsbexEtpNp@zatzit/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  data.c             |  3 ++-
>  dtc.h              |  2 ++
>  fdtdump.c          | 15 ++++++++++-
>  flattree.c         | 63 ++++++++++++++++++++++++++++++++++++++++++++--
>  libfdt/fdt.c       | 37 ++++++++++++++++++++++++++-
>  libfdt/fdt.h       | 11 ++++++++
>  libfdt/fdt_check.c | 46 ++++++++++++++++++++++++++++++---
>  libfdt/libfdt.h    |  3 ++-
>  treesource.c       |  1 +
>  9 files changed, 171 insertions(+), 10 deletions(-)
>=20
> diff --git a/data.c b/data.c
> index 5b25aa06..9bae7047 100644
> --- a/data.c
> +++ b/data.c
> @@ -127,7 +127,7 @@ struct data data_insert_at_marker(struct data d, stru=
ct marker *m,
>  	return d;
>  }
> =20
> -static struct data data_append_markers(struct data d, struct marker *m)
> +struct data data_append_markers(struct data d, struct marker *m)
>  {
>  	struct marker **mp =3D &d.markers;
> =20
> @@ -288,6 +288,7 @@ struct marker *alloc_marker(unsigned int offset, enum=
 markertype type,
>  	m->type =3D type;
>  	m->ref =3D ref;
>  	m->next =3D NULL;
> +	m->is_local =3D 0;

Storing is_local in the marker doesn't make sense to me.  I think the
locality should be calculated only when we actually go to emit the dtb
- I believe we should be able to deduce it from m->ref.

>  	return m;
>  }
> diff --git a/dtc.h b/dtc.h
> index ef3f2682..64eaffde 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -128,6 +128,7 @@ struct  marker {
>  	enum markertype type;
>  	unsigned int offset;
>  	char *ref;
> +	bool is_local;
>  	struct marker *next;
>  };
> =20
> @@ -187,6 +188,7 @@ struct data data_insert_data(struct data d, struct ma=
rker *m, struct data old);
>  struct marker *alloc_marker(unsigned int offset, enum markertype type,
>  			    char *ref);
>  struct data data_add_marker(struct data d, enum markertype type, char *r=
ef);
> +struct data data_append_markers(struct data d, struct marker *m);
> =20
>  bool data_is_one_string(struct data d);
> =20
> diff --git a/fdtdump.c b/fdtdump.c
> index f26d3a89..4ee9acc3 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -84,8 +84,9 @@ static void dump_blob(void *blob, bool debug, int dump_=
unknown)
>  	const char *p_strings =3D (const char *)blob + off_str;
>  	uint32_t version =3D fdt32_to_cpu(bph->version);
>  	uint32_t totalsize =3D fdt32_to_cpu(bph->totalsize);
> -	uint32_t tag;
> +	uint32_t tag, offset;
>  	const char *p, *d, *s, *t;
> +	const char *last_prop_name =3D NULL;
>  	int depth, sz, shift;
>  	int i;
>  	uint64_t addr, size;
> @@ -138,6 +139,7 @@ static void dump_blob(void *blob, bool debug, int dum=
p_unknown)
>  		        (uintptr_t)p - blob_off - 4, tag, tagname(tag));
> =20
>  		if (tag =3D=3D FDT_BEGIN_NODE) {
> +			last_prop_name =3D NULL;
>  			s =3D p;
>  			p =3D PALIGN(p + strlen(s) + 1, 4);
> =20
> @@ -151,6 +153,7 @@ static void dump_blob(void *blob, bool debug, int dum=
p_unknown)
>  		}
> =20
>  		if (tag =3D=3D FDT_END_NODE) {
> +			last_prop_name =3D NULL;
>  			depth--;
> =20
>  			printf("%*s};\n", depth * shift, "");
> @@ -176,6 +179,16 @@ static void dump_blob(void *blob, bool debug, int du=
mp_unknown)
>  			printf("%*s%s", depth * shift, "", s);
>  			utilfdt_print_data(t, sz);
>  			printf(";\n");
> +			last_prop_name =3D s;
> +			continue;
> +		}
> +
> +		if (tag =3D=3D FDT_PROPDATA_PHANDLE) {
> +			p =3D get_structured_tag_data(tag, p, &d, &sz);
> +			offset =3D fdt32_to_cpu(GET_CELL(d));
> +
> +			printf("%*s// [FDT_PROPDATA_PHANDLE] %s[%"PRIu32"]\n", depth * shift,=
 "",
> +				last_prop_name, offset);
>  			continue;
>  		}
> =20
> diff --git a/flattree.c b/flattree.c
> index dd451f0c..92d191d5 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -15,6 +15,7 @@
>  #define FTF_NOPS	0x40
>  #define FTF_DTFLAGS	0x80
>  #define FTF_LCVERSW	0x100
> +#define FTF_PROPDATA_PHANDLE	0x200
> =20
>  static struct version_info {
>  	int version;
> @@ -38,7 +39,7 @@ static struct version_info {
>  	 FTF_LCVERSW},
>  	{20, 18, 18, FDT_V20_SIZE,
>  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
> -	 FTF_LCVERSW},
> +	 FTF_LCVERSW|FTF_PROPDATA_PHANDLE},
>  };
> =20
>  struct emitter {
> @@ -49,6 +50,7 @@ struct emitter {
>  	void (*beginnode)(void *, struct label *labels);
>  	void (*endnode)(void *, struct label *labels);
>  	void (*property)(void *, struct label *labels);
> +	void (*propdata_phandle)(void *);

The only reason begginnode, endnode and property have custom function
pointers here, and don't just re-use emitter->cell, is that in -Oasm
mode we attach symbols to nodes and properties, based on the labels.

That's not a concern for this new tag, so we shouldn't need a custom
emitter function.

>  };
> =20
>  static void bin_emit_cell(void *e, cell_t val)
> @@ -98,6 +100,11 @@ static void bin_emit_property(void *e, struct label *=
labels)
>  	bin_emit_cell(e, FDT_PROP);
>  }
> =20
> +static void bin_emit_propdata_phandle(void *e)
> +{
> +	bin_emit_cell(e, FDT_PROPDATA_PHANDLE);
> +}
> +
>  static struct emitter bin_emitter =3D {
>  	.cell =3D bin_emit_cell,
>  	.string =3D bin_emit_string,
> @@ -106,6 +113,7 @@ static struct emitter bin_emitter =3D {
>  	.beginnode =3D bin_emit_beginnode,
>  	.endnode =3D bin_emit_endnode,
>  	.property =3D bin_emit_property,
> +	.propdata_phandle =3D bin_emit_propdata_phandle,
>  };
> =20
>  static void emit_label(FILE *f, const char *prefix, const char *label)
> @@ -217,6 +225,14 @@ static void asm_emit_property(void *e, struct label =
*labels)
>  	asm_emit_cell(e, FDT_PROP);
>  }
> =20
> +static void asm_emit_propdata_phandle(void *e)
> +{
> +	FILE *f =3D e;
> +
> +	fprintf(f, "\t/* FDT_PROPDATA_PHANDLE */\n");
> +	asm_emit_cell(e, FDT_PROPDATA_PHANDLE);
> +}
> +
>  static struct emitter asm_emitter =3D {
>  	.cell =3D asm_emit_cell,
>  	.string =3D asm_emit_string,
> @@ -225,6 +241,7 @@ static struct emitter asm_emitter =3D {
>  	.beginnode =3D asm_emit_beginnode,
>  	.endnode =3D asm_emit_endnode,
>  	.property =3D asm_emit_property,
> +	.propdata_phandle =3D asm_emit_propdata_phandle,
>  };
> =20
>  static int stringtable_insert(struct data *d, const char *str)
> @@ -249,6 +266,7 @@ static void flatten_tree(struct node *tree, struct em=
itter *emit,
>  	struct property *prop;
>  	struct node *child;
>  	bool seen_name_prop =3D false;
> +	struct marker *m;
> =20
>  	if (tree->deleted)
>  		return;
> @@ -279,6 +297,17 @@ static void flatten_tree(struct node *tree, struct e=
mitter *emit,
> =20
>  		emit->data(etarget, prop->val);
>  		emit->align(etarget, sizeof(cell_t));
> +
> +		if (vi->flags & FTF_PROPDATA_PHANDLE) {
> +			m =3D prop->val.markers;
> +			for_each_marker_of_type(m, REF_PHANDLE) {
> +				if (m->is_local) {
> +					emit->propdata_phandle(etarget);
> +					emit->cell(etarget, m->offset);
> +					continue;
> +				}
> +			}
> +		}
>  	}
> =20
>  	if ((vi->flags & FTF_NAMEPROPS) && !seen_name_prop) {
> @@ -674,6 +703,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
>  		case FDT_PROP:
>  		case FDT_NOP:
>  		case FDT_END:
> +		case FDT_PROPDATA_PHANDLE:
>  			return tag;
>  		default:
>  			break;
> @@ -811,9 +841,11 @@ static struct node *unflatten_tree(struct inbuf *dtb=
uf,
>  				   struct inbuf *strbuf,
>  				   const char *parent_flatname, int flags)
>  {
> +	struct property *prop =3D NULL;
>  	struct node *node;
>  	const char *flatname;
>  	uint32_t val;
> +	uint32_t offset;
> =20
>  	node =3D build_node(NULL, NULL, NULL);
> =20
> @@ -826,8 +858,8 @@ static struct node *unflatten_tree(struct inbuf *dtbu=
f,
>  		node->name =3D xstrdup(flatname);
> =20
>  	do {
> -		struct property *prop;
>  		struct node *child;
> +		struct marker *m;
> =20
>  		val =3D flat_read_tag(dtbuf);
>  		switch (val) {
> @@ -840,11 +872,13 @@ static struct node *unflatten_tree(struct inbuf *dt=
buf,
>  			break;
> =20
>  		case FDT_BEGIN_NODE:
> +			prop =3D NULL;
>  			child =3D unflatten_tree(dtbuf,strbuf, flatname, flags);
>  			add_child(node, child);
>  			break;
> =20
>  		case FDT_END_NODE:
> +			prop =3D NULL;
>  			break;
> =20
>  		case FDT_END:
> @@ -859,6 +893,28 @@ static struct node *unflatten_tree(struct inbuf *dtb=
uf,
>  			/* Ignore */
>  			break;
> =20
> +		case FDT_PROPDATA_PHANDLE:
> +			if (!(flags & FTF_PROPDATA_PHANDLE))
> +				die("PROPDATA_PHANDLE tag found in flat tree"
> +				    " version <20\n");
> +
> +			if (!prop)
> +				die("PROPDATA_PHANDLE tag found without a previous PROP tag");
> +
> +			offset =3D flat_read_word(dtbuf);
> +
> +			/*
> +			 * A reference to a phandle is present in the property
> +			 * Mark the whole property as TYPE_UINT32.
> +			 */
> +			property_add_marker(prop, TYPE_UINT32, 0, NULL);
> +
> +			/* Mark the offset as a local phandle reference */
> +			m =3D alloc_marker(offset, REF_PHANDLE, NULL);
> +			m->is_local =3D true;
> +			prop->val =3D data_append_markers(prop->val, m);

This doesn't properly populate m->ref which is an essential field in a
REF_PHANDLE marker.  Of course, doing so is kind of tricky - it
requires searching for the node with the referenced phandle, which
might not have been parsed yet.  So, alas, it will require a second
pass to fix up the REF_PHANDLE markers.

Also, markers are required to be inserted in order of offset (other
parts of the code rely on this).  So you'll either need to sort as you
insert, or require that FDT_PROPDATA_PHANDLE tags also come in offset
order (but then you need to check and enforce that).

> +			break;
> +
>  		default:
>  			die("Invalid opcode word %08x in device tree blob\n",
>  			    val);
> @@ -981,6 +1037,9 @@ struct dt_info *dt_from_blob(const char *fname)
>  	if (version >=3D 18)
>  		flags |=3D FTF_DTFLAGS | FTF_LCVERSW;
> =20
> +	if (version >=3D 20)
> +		flags |=3D FTF_PROPDATA_PHANDLE;
> +
>  	inbuf_init(&memresvbuf,
>  		   blob + off_mem_rsvmap, blob + totalsize);
>  	inbuf_init(&dtbuf, blob + off_dt, blob + totalsize);
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 8c026f26..3762fbef 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -213,7 +213,7 @@ int fdt_get_structured_tag_data(uint32_t tag, const v=
oid *fdt, int offset,
> =20
>  static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *=
nextoffset)
>  {
> -	const fdt32_t *tagp, *lenp;
> +	const fdt32_t *tagp, *lenp, *tmp32p;
>  	uint32_t tag, len, sum;
>  	int offset =3D startoffset;
>  	int tmp_offset;
> @@ -262,6 +262,25 @@ static uint32_t fdt_next_tag_all(const void *fdt, in=
t startoffset, int *nextoffs
>  	case FDT_NOP:
>  		break;
> =20
> +	case FDT_PROPDATA_PHANDLE:
> +		tmp_offset =3D fdt_get_structured_tag_data(tag, fdt, offset, &len);
> +		if (tmp_offset < 0)
> +			return FDT_END; /* premature end */
> +
> +		sum =3D tmp_offset + len;
> +
> +		if (!can_assume(VALID_DTB) && len < FDT_CELLSIZE)
> +			return FDT_END; /* premature end */
> +
> +		/* Check offset value */
> +		tmp32p =3D fdt_offset_ptr(fdt, tmp_offset, sizeof(*tmp32p));
> +		if (!can_assume(VALID_DTB) && !tmp32p)
> +			return FDT_END; /* premature end */
> +
> +		/* Skip the whole data bloc */

s/bloc/block/

("bloc" is used in English, but has specific meanings that don't apply
here).

> +		offset =3D sum;
> +		break;
> +
>  	default:
>  		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
>  			return FDT_END;
> @@ -290,6 +309,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
>  	case FDT_PROP:
>  	case FDT_NOP:
>  	case FDT_END:
> +	case FDT_PROPDATA_PHANDLE:
>  		return false;
>  	default:
>  		break;
> @@ -342,11 +362,26 @@ uint32_t fdt_next_tag_filter(const void *fdt, int o=
ffset, int *nextoffset,
> =20
>  bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
>  {
> +	switch (tag) {
> +	case FDT_PROPDATA_PHANDLE:
> +		return true;
> +
> +	default:
> +		break;
> +	}
> +
>  	return false;
>  }
> =20
>  bool fdt_tag_is_property_metadata(uint32_t tag)
>  {
> +	switch (tag) {
> +	case FDT_PROPDATA_PHANDLE:
> +		return true;
> +	default:
> +		break;
> +	}
> +
>  	return false;
>  }
> =20
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index 7c59fed2..2f681088 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -84,6 +84,17 @@ struct fdt_property {
>  #define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
>  #define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)
> =20
> +/*
> + * local phandle tag (meta-data). 1 cell: offset
> + *
> + * It indicates that the property defined before this tag (FDT_PROP) use=
s a
> + * phandle value and the node related to this phandle value is local (i.=
e.
> + * the node is present in the device-tree blob).
> + *
> + * offset: Offset in the property data where the phandle is available
> + */
> +#define FDT_PROPDATA_PHANDLE   FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0x10=
00)
> +
>  #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
>  #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
>  #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index 2fd5b61d..ac297841 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -14,12 +14,15 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  {
>  	int err;
>  	int num_memrsv;
> -	int offset, nextoffset =3D 0;
> +	int offset, nextoffset =3D 0, d, tmp;
>  	uint32_t tag;
>  	unsigned int depth =3D 0;
> -	const void *prop;
> +	const void *prop =3D NULL;
>  	const char *propname;
> +	int proplen;
>  	bool expect_end =3D false;
> +	const fdt32_t *pfdt32;
> +	uint32_t val;
> =20
>  	if (can_assume(PERFECT))
>  		return 0;
> @@ -58,6 +61,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  			return 0;
> =20
>  		case FDT_BEGIN_NODE:
> +			prop =3D NULL;
>  			depth++;
>  			if (depth > INT_MAX)
>  				return -FDT_ERR_BADSTRUCTURE;
> @@ -77,6 +81,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  			break;
> =20
>  		case FDT_END_NODE:
> +			prop =3D NULL;
>  			if (depth =3D=3D 0)
>  				return -FDT_ERR_BADSTRUCTURE;
>  			depth--;
> @@ -86,9 +91,42 @@ int fdt_check_full(const void *fdt, size_t bufsize)
> =20
>  		case FDT_PROP:
>  			prop =3D fdt_getprop_by_offset(fdt, offset, &propname,
> -						     &err);
> +						     &proplen);
>  			if (!prop)
> -				return err;
> +				return proplen;
> +			break;
> +
> +		case FDT_PROPDATA_PHANDLE:
> +			/* Be sure that a property is available before this tag */
> +			if (!prop)
> +				return -FDT_ERR_BADSTRUCTURE;
> +
> +			d =3D fdt_get_structured_tag_data(tag, fdt,
> +							offset + FDT_TAGSIZE, NULL);
> +			if (d < 0)
> +				return d;
> +
> +			/* Retrieve the offset of the phandle in the property */
> +			pfdt32 =3D fdt_offset_ptr(fdt, d, sizeof(*pfdt32));
> +			if (!pfdt32)
> +				return -FDT_ERR_BADSTRUCTURE;
> +			tmp =3D fdt32_to_cpu(*pfdt32);

You can use fdt32_ld_() for this.

> +
> +			/* Check this offset */
> +			if (tmp % sizeof(fdt32_t))
> +				return -FDT_ERR_BADVALUE;

I don't think we can insist these are aligned.  A binding which had a
string followed by a phandle could naturally lead to unaligned phandle valu=
es.

> +			if ((uint32_t)proplen < tmp + sizeof(fdt32_t))

Need to check for overflows here.

> +				return -FDT_ERR_BADSTRUCTURE;

I'm not sure BADSTRUCTURE makes sense for this.  I think it's probably
worth adding a new error code for bad metadata tags.

> +
> +			/* Retrieve the phandle value from the property */
> +			pfdt32 =3D prop;
> +			pfdt32 +=3D tmp / sizeof(fdt32_t);

Again, this will need updating for non-aligned phandles.

> +			val =3D fdt32_ld(pfdt32);

=2E.. which reminds me the entire fdt32_ld() interface is kind of
broken.  They're specifically intended to handle misaligned accesses,
strictly speaking it's already UB to generate a misaligned pointer, so
there's a problem before we even call it.  Fixing this within API/ABI
constraints is a nasty problem :(.

> +
> +			/* Check the phandle value */
> +			tmp =3D fdt_node_offset_by_phandle(fdt, val);

Oof.  fdt_check_full() is already pretty expensive, but this is a big
step up: this takes it (roughly speaking) from O(n) to O(n^2).  Don't
really see a way to avoid that if this remains a "full check".

> +			if (tmp < 0)
> +				return tmp;

Error code probably needs translation here: the most likely error here
is NOTFOUND, which is a weird think to get from fdt_check_full().

>  			break;
> =20
>  		default:
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 5e1e0d06..ee811266 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -150,7 +150,8 @@ static inline void *fdt_offset_ptr_w(void *fdt, int o=
ffset, int checklen)
>   * be set to the offset immediately following the tag.
>   *
>   * returns:
> - *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_EN=
D),
> + *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_END
> + *	or any other known tags),

This hunk looks like it belongs in an earlier patch.

>   *	FDT_END, if offset is out of bounds
>   */
>  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> diff --git a/treesource.c b/treesource.c
> index bf648bf6..0e33e3e1 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -168,6 +168,7 @@ static struct marker **add_marker(struct marker **mi,
>  	nm->offset =3D offset;
>  	nm->ref =3D ref;
>  	nm->next =3D *mi;
> +	nm->is_local =3D 0;
>  	*mi =3D nm;
> =20
>  	return &nm->next;
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--qbpNZZGYc3ugXr+U
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmrYLcMACgkQzQJF27ox
2GcBBhAAhrqS/9tjgjgLztMTbwqhAtg7B4ZJdFLkIPiRLRXeMlI98dZQ9/r0tZfY
Or+g4pcoHcpKJige2RVS7VNhkpoYAdUQmkonBqUZnYDaZU7HxjXH9K/9jRoulZoA
c/56xBpk6W/HOta+vwYHjjDldg+BqAuM7g7qWnE4VNVKEjVm1u1Int/NkOeOBjqU
VsuEIHZJ/f6hesf2bLT4+3boT1/VOqJsVPFbAz3Ple14LETyqHIqylucB9R84rT+
32Yiyc8W/fjGdKDOh7Rf7ca08J2oB+cacXEb8lDMlRKZNoS/5gysS4HYEeRgOX7/
P0KULyInB27KWD7KNSllgL1F6qhIJaLpoeQeDRHxTZpVvbz9ZyxPo8wsxMzvRfKd
FH4VYxKkGuZ+DvogxNdV1fh/kWkBv7R+Os6c/7UCCTJnrMyTJ7RT2fLJn/VoIm37
HVI1ks9VH9iEqO8cL3QirRS6J8duVMn+tSgXGEyeXApb1TB8B4yVFr274ktjS9XL
gqYiwVDQbIgryv4+azD7Ai/XkE9HW3+S0sUuHO138TPZvCNa3HtmS7LFzSvx+VoY
E/yCImh41Pvr39gPdjQ5Mr2dHsosucb/sg8Oa2bqK/qOn2UlB7h/eYxUHxHAtlWN
FRRHLjsXZ20mAk5sYLiP8Sx0kYu1+faeUcM2WgRr8YuDEh7XWlY=
=B8QB
-----END PGP SIGNATURE-----

--qbpNZZGYc3ugXr+U--
