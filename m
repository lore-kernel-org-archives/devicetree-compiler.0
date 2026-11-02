Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599951;
	b=fAOwrDA21x6Katqzty3xQ57UOvKkwp04ClWPR7QYl5bS2jUhU/ItKRSRd5Hgv+Lu542c
	 5n9gwYTBTv84/pRw6jYcebtDrQefvEydVkEKeKii4FlPAg03OQxL8cpDNrX6DtslKXY2v
	 uXRcpYBFkB9DWnnu1AfssGYZzq7H6QizC6rCgNhwiY7OkyaUxymruEWSbMtT5VbTfJ0al
	 9xKIezmKC+0Zi1gZULRVD0SmFhop/2cktMfRhSkMg6blemybmja8U8BVkd0IVZHfpzGBS
	 viJQTHG1Buyr4kDYUeDQ/W7j1yUtxTCwKKxRHp6nfp6wM37X4e5JXV0/MWsMXoqXeLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599951;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=GK1Tv9cGLqLZXdGnoTaOHiPscILRTL0TQ97U2kfZgBU=;
	b=YpB37n2H72IsrbKmbVVYdwj1zF2fQw8t/iB0rip168CzIrtM9C5B13S1abb2OU9Vhmbp
	 U7pMhGP+CX5ChAY4xaqsvBVgkHAW3X3p6aCnfvJKnUBMCMQ3BJgNioPsLJ0Q4OkRA3C9M
	 ZT62ugYEWgWiPU5G6eTEk9cdeD5viiR0wk2qusCJvtOnYmCNtKzRnNbsvTu763JK5OgiL
	 D81tUYtLaUTyq1pPl9UmVP/Aj+s0oK+lU/fclYfnEZpYUce6Q31DElD8tv/ZzAY8Olt/R
	 28RbOiH2zPAnGcA1UzazDYSKTe93wjCa1ZxVgS0BrAAfroJiLzItgmhfmLmaHWDO/Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gibson.dropbear.id.au;
	spf=pass smtp.mailfrom=gandalf.ozlabs.org;
	arc=none smtp.remote-ip=150.107.74.76
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22153606A337;
	Mon,  2 Nov 2026 06:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22153606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.dropbear.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gandalf.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=202610; t=1793599946;
	bh=GK1Tv9cGLqLZXdGnoTaOHiPscILRTL0TQ97U2kfZgBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t3abexSCyXZS3K0nZ1CyG8tvdzY0Z2jSgnTdjkmddea4VOK95mxOsmoy8/Cv6nOJr
	 JA9OxOntBkzCeNwodgaUdxDnXz0ddIGKZXOnOJcPzRcsnXBnVZzYk5xyF8iOOcsEYY
	 2ZkNYB3pwU84av2CNZdriKUVOZK+h2/eVJRHq3Cv5c3tvTAd+XdBJxPcLsVIY7ekxE
	 i5ZQvjTxkW5HLu4be3k5ZQNZA9rG+5IPeVrAlMZIAB5UQvdnmnDOlZ7sLyQLv0ovpS
	 XzVEJSFrDBphPaqsmCxwJEyA5j+I/UN7O+sO29ESPLSS46/0z6DDMPw6cb/b22gCLc
	 cFTKXP/vPawxw==
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
	id 4jJ1Zf0Ld3z4wC6; Mon, 02 Nov 2026 17:12:26 +1100 (AEDT)
Date: Mon, 2 Nov 2026 17:12:15 +1100
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
Subject: Re: [RFC PATCH v2 11/74] Add support for FDT_PROPDATA_PHANDLE_REF
 dtb tag
Message-ID: <augpqjHVMq4nYdlr@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
 <20260826094950.1088288-12-herve.codina@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="qsZ77WCgSEzZDLcX"
Content-Disposition: inline
In-Reply-To: <20260826094950.1088288-12-herve.codina@bootlin.com>

--qsZ77WCgSEzZDLcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:48:40AM +0200, Herve Codina wrote:
> The FDT_PROPDATA_PHANDLE_REF dtb tag is similar to the
> FDT_PROPDATA_PHANDLE tag except that it identifies a reference to an
> external phandle. The node referenced by the phandle is not present in
> the device-tree blob.
>=20
> The FDT_PROPDATA_PHANDLE_REF dtb tag is a meta-data tag attached to a
> property.
>=20
> It indicates that the property defined before this tag (FDT_PROP) uses a
> phandle value and the node related to this phandle value is not local
> node (i.e. the node is not present in the device-tree blob). This tag
> can be available only in overlay or addon device-tree blobs. The phandle
> value used in the property has to be resolved when the device-tree blob
> is applied on top of a base device-tree.
>=20
> The tag is followed by the length of the data part (structured tag), two
> values and a possible alignment padding:
>  - data part length (32bit): 4 + strlen(label) + 1
>  - offset (32bit):
>      Offset in the property data where the phandle is available.
>  - label (string including \0):
>      The label to use to resolve the phandle value.
>  - padding:
>      Padding (0x00) added to have the next tag aligned on 32bit.
>=20
> Example:
>   FDT_PROP 0x00000008 xxxxxxxx 0x00 0x01 0x02 0x03 0xff 0xff 0xff 0xff
>   FDT_PROPDATA_PHANDLE_REF 9 0x00000004 "foo1" 0x00 0x00 0x00
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
> FDT_PROPDATA_PHANDLE_REF are present after the FDT_PROP tag. Each of
> them points with its offset value to the position of one phandle.
>=20
> For instance, if a first property with 8 bytes of data has a
> unresolved phandle value at offset 4 referenced by "foo" and a second
> property with 16 bytes of data has unresolved phandle values at offset 0
> and 8 referenced by "bar" and "baz", the following tags sequence is
> present:
>   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
>   FDT_PROPDATA_PHANDLE_REF 8 0x00000004 "foo"
>   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
>   FDT_PROPDATA_PHANDLE_REF 8 0x00000000 "bar"
>   FDT_PROPDATA_PHANDLE_REF 8 0x00000008 "baz"
>=20
> Add support for this new dtb tag.
>=20
> Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> Link: https://lore.kernel.org/all/aL-2fmYsbexEtpNp@zatzit/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  fdtdump.c          | 10 ++++++
>  flattree.c         | 78 +++++++++++++++++++++++++++++++++++++++++++++-
>  libfdt/fdt.c       | 30 ++++++++++++++++++
>  libfdt/fdt.h       | 14 +++++++++
>  libfdt/fdt_check.c | 34 ++++++++++++++++++++
>  5 files changed, 165 insertions(+), 1 deletion(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 4ee9acc3..2acf3210 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -192,6 +192,16 @@ static void dump_blob(void *blob, bool debug, int du=
mp_unknown)
>  			continue;
>  		}
> =20
> +		if (tag =3D=3D FDT_PROPDATA_PHANDLE_REF) {
> +			p =3D get_structured_tag_data(tag, p, &d, &sz);
> +			offset =3D fdt32_to_cpu(GET_CELL(d));
> +			s =3D d;
> +
> +			printf("%*s// [FDT_PROPDATA_PHANDLE_REF] %s[%"PRIu32"], ref =3D %s\n",
> +				depth * shift, "", last_prop_name, offset, s);
> +			continue;
> +		}
> +
>  		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
>  			p =3D get_structured_tag_data(tag, p, &d, &sz);
> =20
> diff --git a/flattree.c b/flattree.c
> index 92d191d5..abc50873 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -51,6 +51,7 @@ struct emitter {
>  	void (*endnode)(void *, struct label *labels);
>  	void (*property)(void *, struct label *labels);
>  	void (*propdata_phandle)(void *);
> +	void (*propdata_phandle_ref)(void *);

As for propdata_phandle, a new hook shouldn't be necessary here.

>  };
> =20
>  static void bin_emit_cell(void *e, cell_t val)
> @@ -105,6 +106,11 @@ static void bin_emit_propdata_phandle(void *e)
>  	bin_emit_cell(e, FDT_PROPDATA_PHANDLE);
>  }
> =20
> +static void bin_emit_propdata_phandle_ref(void *e)
> +{
> +	bin_emit_cell(e, FDT_PROPDATA_PHANDLE_REF);
> +}
> +
>  static struct emitter bin_emitter =3D {
>  	.cell =3D bin_emit_cell,
>  	.string =3D bin_emit_string,
> @@ -114,6 +120,7 @@ static struct emitter bin_emitter =3D {
>  	.endnode =3D bin_emit_endnode,
>  	.property =3D bin_emit_property,
>  	.propdata_phandle =3D bin_emit_propdata_phandle,
> +	.propdata_phandle_ref =3D bin_emit_propdata_phandle_ref,
>  };
> =20
>  static void emit_label(FILE *f, const char *prefix, const char *label)
> @@ -233,6 +240,14 @@ static void asm_emit_propdata_phandle(void *e)
>  	asm_emit_cell(e, FDT_PROPDATA_PHANDLE);
>  }
> =20
> +static void asm_emit_propdata_phandle_ref(void *e)
> +{
> +	FILE *f =3D e;
> +
> +	fprintf(f, "\t/* FDT_PROPDATA_PHANDLE_REF */\n");
> +	asm_emit_cell(e, FDT_PROPDATA_PHANDLE_REF);
> +}
> +
>  static struct emitter asm_emitter =3D {
>  	.cell =3D asm_emit_cell,
>  	.string =3D asm_emit_string,
> @@ -242,6 +257,7 @@ static struct emitter asm_emitter =3D {
>  	.endnode =3D asm_emit_endnode,
>  	.property =3D asm_emit_property,
>  	.propdata_phandle =3D asm_emit_propdata_phandle,
> +	.propdata_phandle_ref =3D asm_emit_propdata_phandle_ref,
>  };
> =20
>  static int stringtable_insert(struct data *d, const char *str)
> @@ -306,6 +322,16 @@ static void flatten_tree(struct node *tree, struct e=
mitter *emit,
>  					emit->cell(etarget, m->offset);
>  					continue;
>  				}
> +
> +				if (m->ref[0] =3D=3D '/')
> +					die("Phandle uses a non local reference by path (%s)\n",
> +					    m->ref);
> +
> +				emit->propdata_phandle_ref(etarget);
> +				emit->cell(etarget, sizeof(cell_t) + strlen(m->ref) + 1);
> +				emit->cell(etarget, m->offset);
> +				emit->string(etarget, m->ref, 0);
> +				emit->align(etarget, sizeof(cell_t));
>  			}
>  		}
>  	}
> @@ -626,6 +652,16 @@ static void inbuf_init(struct inbuf *inb, void *base=
, void *limit)
>  	inb->ptr =3D inb->base;
>  }
> =20
> +static void flat_read_subbuf(struct inbuf *inb, struct inbuf *subbuf, in=
t len)
> +{
> +	if ((inb->ptr + len) > inb->limit)
> +		die("Premature end of data parsing flat device tree\n");
> +
> +	inbuf_init(subbuf, inb->ptr, inb->ptr + len);
> +
> +	inb->ptr +=3D len;
> +}
> +
>  static void flat_read_chunk(struct inbuf *inb, void *p, int len)
>  {
>  	if ((inb->ptr + len) > inb->limit)
> @@ -704,6 +740,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
>  		case FDT_NOP:
>  		case FDT_END:
>  		case FDT_PROPDATA_PHANDLE:
> +		case FDT_PROPDATA_PHANDLE_REF:
>  			return tag;
>  		default:
>  			break;
> @@ -713,7 +750,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
>  	die("Cannot skip unknown tag 0x%08x\n", tag);
>  }
> =20
> -static const char *flat_read_string(struct inbuf *inb)
> +static const char *flat_read_string_norealign(struct inbuf *inb)
>  {
>  	int len =3D 0;
>  	const char *p =3D inb->ptr;
> @@ -729,6 +766,15 @@ static const char *flat_read_string(struct inbuf *in=
b)
> =20
>  	inb->ptr +=3D len;
> =20
> +	return str;
> +}
> +
> +static const char *flat_read_string(struct inbuf *inb)
> +{
> +	const char *str;
> +
> +	str =3D flat_read_string_norealign(inb);
> +
>  	flat_realign(inb, sizeof(uint32_t));
> =20
>  	return str;
> @@ -844,8 +890,11 @@ static struct node *unflatten_tree(struct inbuf *dtb=
uf,
>  	struct property *prop =3D NULL;
>  	struct node *node;
>  	const char *flatname;
> +	struct inbuf subbuf;
>  	uint32_t val;
>  	uint32_t offset;
> +	uint32_t len;
> +	const char *str;
> =20
>  	node =3D build_node(NULL, NULL, NULL);
> =20
> @@ -915,6 +964,33 @@ static struct node *unflatten_tree(struct inbuf *dtb=
uf,
>  			prop->val =3D data_append_markers(prop->val, m);
>  			break;
> =20
> +		case FDT_PROPDATA_PHANDLE_REF:
> +			if (!(flags & FTF_PROPDATA_PHANDLE))
> +				die("PROPDATA_PHANDLE_REF tag found in flat tree"
> +					" version <20\n");
> +
> +			if (!prop)
> +				die("PROPDATA_PHANDLE_REF tag found without a previous PROP tag");
> +
> +			len =3D flat_read_word(dtbuf);
> +			flat_read_subbuf(dtbuf, &subbuf, len);
> +			flat_realign(dtbuf, sizeof(uint32_t));
> +
> +			offset =3D flat_read_word(&subbuf);
> +			str =3D flat_read_string_norealign(&subbuf);
> +
> +			/*
> +			 * A reference to a phandle is present in the property
> +			 * Mark the whole property as TYPE_UINT32.
> +			 */
> +			property_add_marker(prop, TYPE_UINT32, 0, NULL);

This isn't correct. There are existing bindings which mix phandle and
string or other data in a single property.

> +			/* Mark the offset as a external phandle reference */
> +			m =3D alloc_marker(offset, REF_PHANDLE, xstrdup(str));
> +			m->is_local =3D false;
> +			prop->val =3D data_append_markers(prop->val, m);
> +			break;
> +
>  		default:
>  			die("Invalid opcode word %08x in device tree blob\n",
>  			    val);
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 3762fbef..d23b886b 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -281,6 +281,33 @@ static uint32_t fdt_next_tag_all(const void *fdt, in=
t startoffset, int *nextoffs
>  		offset =3D sum;
>  		break;
> =20
> +	case FDT_PROPDATA_PHANDLE_REF:
> +		tmp_offset =3D fdt_get_structured_tag_data(tag, fdt, offset, &len);
> +		if (tmp_offset < 0)
> +			return FDT_END; /* premature end */
> +
> +		sum =3D tmp_offset + len;
> +
> +		/* Check offset value */
> +		tmp32p =3D fdt_offset_ptr(fdt, tmp_offset, sizeof(*tmp32p));
> +		if (!can_assume(VALID_DTB) && !tmp32p)
> +			return FDT_END; /* premature end */
> +		tmp_offset +=3D sizeof(fdt32_t);
> +
> +		/* Check ref string */
> +		do {
> +			p =3D fdt_offset_ptr(fdt, tmp_offset++, 1);
> +		} while (p && (*p !=3D '\0'));

Since we have the length from the structured tag, we should be able to
avoid validating the string bytes one by one.

> +		if (!can_assume(VALID_DTB) && !p)
> +			return FDT_END; /* premature end */
> +
> +		if (!can_assume(VALID_INPUT) && (uint32_t)tmp_offset > sum)
> +			return FDT_END; /* premature end */
> +
> +		/* Skip the whole data bloc */

block

> +		offset =3D sum;
> +		break;
> +
>  	default:
>  		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
>  			return FDT_END;
> @@ -310,6 +337,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
>  	case FDT_NOP:
>  	case FDT_END:
>  	case FDT_PROPDATA_PHANDLE:
> +	case FDT_PROPDATA_PHANDLE_REF:
>  		return false;
>  	default:
>  		break;
> @@ -364,6 +392,7 @@ bool fdt_tag_filter_skip_metadata(void *data, uint32_=
t tag)
>  {
>  	switch (tag) {
>  	case FDT_PROPDATA_PHANDLE:
> +	case FDT_PROPDATA_PHANDLE_REF:
>  		return true;
> =20
>  	default:
> @@ -377,6 +406,7 @@ bool fdt_tag_is_property_metadata(uint32_t tag)
>  {
>  	switch (tag) {
>  	case FDT_PROPDATA_PHANDLE:
> +	case FDT_PROPDATA_PHANDLE_REF:
>  		return true;
>  	default:
>  		break;
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index 2f681088..c151aa2b 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -95,6 +95,20 @@ struct fdt_property {
>   */
>  #define FDT_PROPDATA_PHANDLE   FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0x10=
00)
> =20
> +/*
> + * external phandle tag (meta-data). varlen: offset, string label
> + *
> + * It indicates that the property defined before this tag (FDT_PROP) use=
s a
> + * phandle value and the node related to this phandle value is not local
> + * node (i.e. the node is not present in the device-tree blob). The phan=
dle
> + * value used in the property has to be resolved when the device-tree bl=
ob
> + * is applied on top of a base device-tree.
> + *
> + * offset: Offset in the property data where the phandle is available
> + * label: The label to use to resolve the phandle value
> + */
> +#define FDT_PROPDATA_PHANDLE_REF  FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, =
0x1001)
> +
>  #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
>  #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
>  #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
> diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> index ac297841..96dd7dc0 100644
> --- a/libfdt/fdt_check.c
> +++ b/libfdt/fdt_check.c
> @@ -22,6 +22,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  	int proplen;
>  	bool expect_end =3D false;
>  	const fdt32_t *pfdt32;
> +	const char *str;
>  	uint32_t val;
> =20
>  	if (can_assume(PERFECT))
> @@ -129,6 +130,39 @@ int fdt_check_full(const void *fdt, size_t bufsize)
>  				return tmp;
>  			break;
> =20
> +		case FDT_PROPDATA_PHANDLE_REF:
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
> +
> +			/* Check this offset */
> +			if (tmp % sizeof(fdt32_t))
> +				return -FDT_ERR_BADVALUE;

Again, misaligned phandles need to be supported.

> +			if ((uint32_t)proplen < tmp + sizeof(fdt32_t))

Beware overflows.

> +				return -FDT_ERR_BADSTRUCTURE;
> +
> +			/* Retrieve the reference */
> +			d +=3D sizeof(fdt32_t);
> +			str =3D fdt_offset_ptr(fdt, d, 1);
> +			if (!str)
> +				return -FDT_ERR_BADSTRUCTURE;
> +
> +			/* Check that the reference is not an empty string */
> +			if (!strlen(str))
> +				return -FDT_ERR_BADVALUE;

It might be worth being stricter about the string validation: you
already know the total length from the structured tag.  So, you can
require that:
	1. Every byte of the label except the last is !=3D \0
	2. The last byte of the label is \0
	3. Any padding bytes after the tag data are 0

And, come to that we should probably define a valid character set for
labels and enforce that ('/' needs to be excluded, at least).


> +			break;
> +
>  		default:
>  			return -FDT_ERR_INTERNAL;
>  		}
> --=20
> 2.55.0
>=20
>=20

--=20
David Gibson (he or they)	| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you, not the other way
				| around.
http://www.ozlabs.org/~dgibson

--qsZ77WCgSEzZDLcX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEO+dNsU4E3yXUXRK2zQJF27ox2GcFAmroKaoACgkQzQJF27ox
2GckvxAAhQ323kltwGrAjxhSDbGP/MsocIfNfgfy7GwnL2751zbz7Y6RaQoBIpUp
h1IgLnfR0Ph8zIp3I3FewwN5fpI6xv+85csx8WiMtiWTzKUgsdL1TUEfb7WepKCZ
I9uJuhwuckgfIPD1uQ6++JKd9Hi4yXSGjyDuSPE1U/ozHMwTy8vMjnkXw5L0N54t
tynd8wbv794aGsFkswVTlthNbV1yrpIB1PpSmleIm4oWWbfoCptI5V5Fsar98tku
lccH0UvDDHZECFPlYolShsapmSLxZMipjnFCCKtf8oY8CYkUc01zTFmAqoGB09cV
6yfKwpdzE6RtzOKvUXFD4WWKiLBLpTrel5YZeNRWTjLQX2uEVX78wUsZQ2p+YRNc
Fk6iJ+is8gGK9KaEIBRFuEnR0TWxmBEptiFvHhJsIx0Nk/pSIviX7qpUhXWRk5y4
6867mwUYxnqHoko/3ywc0WI0680XX7UO32X2V7ibFqsA82N/CNX8G7ErZcxEApUz
wSC/HmffW3/166IR0iqCbwvAPV8X2LPVssIqLZi4D7YwrllEewswGPn+6eMCISdX
Iu3sdXiFbwMab/YNuf9d+0M6qcOXo7san6i+ua0Xxk0zi8LQlAP1grur8S7twmZ0
9+lYjn/vCMZPYDW0IHhsGU8ixlC51Lhq5cdcyfva19599VeE5tU=
=nDga
-----END PGP SIGNATURE-----

--qsZ77WCgSEzZDLcX--
