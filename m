Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697591;
	b=a3DQFgg2cm3U9jSk0xW/KaGd58JEE6wNCmiHI0rFcyQnxjo7a657zE973rHzVryhzQhf
	 nsMRavQdbYuQLtBxvzacOXrvAqzwGQXf+CRQcuGn5LyyjjiyuCnLpCIR1KkShrLnnmaSr
	 GJtKHQZWuxKdOPjx/5NLkFPP/JK9RopTTwzilJ4gj9JQxYv72oglBn0DHKD6oT8N0We8N
	 cx3Bc3bsLgsQH/4RaI85ouokOO0vns5s+1NTqLF1vSbhRNlkOso0RMnbgclxKFzJ/3NeP
	 m7rgIDSVRWILu4IeAp7HvCLLfmyJqNneHh6KNOpVtvuekPwaHzaB4w8kS3KwN8Ho0Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697591;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=kBYTIVsBdL7GwOkljA9W+Uq+An70iEDbPjUdqX4LQLU=;
	b=tYA4Cc76mSrsuVliOWUnN2ScAaHX45ilocA12+Ct2DFWYTILQaYWBVR3VsITlz6FCxz+
	 SlWTOCa8XGpPju6zydnfjwn7F1U7vbokYWy3cIOJWJTDQLUe/fFdRMeL559LohPZEl3wo
	 u7wLBU8aNMpsS9yWK19MubRjOBkSSxKEP7+yLvMOuiHtfb4CUxFCFCz31qRyuEJGNJO05
	 IJsH+Ho1CoAhznhZbZnlx9JhgsSiwr8V7Iia1FD/wlmB14XXCCNRGjKhvMm6pE9w5bmBs
	 1VS6XVEbiC1rBZyxogDR9u1TNbZ7sKj5xLAtqzJpL3bQW5Ha8plMR4JeMQH1ySRnQ9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CP0ocIvu;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06993606A326;
	Tue,  3 Nov 2026 09:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06993606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CP0ocIvu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 67B284E413C3;
	Tue,  3 Nov 2026 09:19:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32A836046C;
	Tue,  3 Nov 2026 09:19:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E995F10328ED0;
	Tue,  3 Nov 2026 10:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793697585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kBYTIVsBdL7GwOkljA9W+Uq+An70iEDbPjUdqX4LQLU=;
	b=CP0ocIvuqd+orfewJDO/YakrJi5FL2NyRnzwtqsM8ZzQQ14p9udYLxT28hyeJOyoOrTz3c
	/mpvbGTBVrB2jEGtk9X+r3RySljKQ8b/7f3K3p9qznKQRiIkAAiFGoYIKctkYUSvVR73kg
	KUz3jyF0nggfn2NCoxc6DiNVYVC4Uyd8oguaggRhg9ECoUDVdowO4q3De0UHa4f+PKiXQG
	s3MyxTSYJmOth4f1VsNnGkrblqMCgUZba//JlCb75A4etJpRvuOgXD6nB135VOH4WwQcSw
	X57hoal/VeO/5Qy5hG8M3qyArqikpiVCWRxbK6RLrl2K9yJhPPWzI3oGsaqHBg==
Date: Tue, 3 Nov 2026 10:19:38 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 11/74] Add support for FDT_PROPDATA_PHANDLE_REF
 dtb tag
Message-ID: <20261103101938.79985642@bootlin.com>
In-Reply-To: <augpqjHVMq4nYdlr@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-12-herve.codina@bootlin.com>
	<augpqjHVMq4nYdlr@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: devicetree-compiler@vger.kernel.org
List-Id: <devicetree-compiler.vger.kernel.org>
List-Post: <mailto:devicetree-compiler@vger.kernel.org>
List-Help: <mailto:devicetree-compiler+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-compiler+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-compiler+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-compiler+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Mon, 2 Nov 2026 17:12:15 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 11:48:40AM +0200, Herve Codina wrote:
> > The FDT_PROPDATA_PHANDLE_REF dtb tag is similar to the
> > FDT_PROPDATA_PHANDLE tag except that it identifies a reference to an
> > external phandle. The node referenced by the phandle is not present in
> > the device-tree blob.
> > 
> > The FDT_PROPDATA_PHANDLE_REF dtb tag is a meta-data tag attached to a
> > property.
> > 
> > It indicates that the property defined before this tag (FDT_PROP) uses a
> > phandle value and the node related to this phandle value is not local
> > node (i.e. the node is not present in the device-tree blob). This tag
> > can be available only in overlay or addon device-tree blobs. The phandle
> > value used in the property has to be resolved when the device-tree blob
> > is applied on top of a base device-tree.
> > 
> > The tag is followed by the length of the data part (structured tag), two
> > values and a possible alignment padding:
> >  - data part length (32bit): 4 + strlen(label) + 1
> >  - offset (32bit):
> >      Offset in the property data where the phandle is available.
> >  - label (string including \0):
> >      The label to use to resolve the phandle value.
> >  - padding:
> >      Padding (0x00) added to have the next tag aligned on 32bit.
> > 
> > Example:
> >   FDT_PROP 0x00000008 xxxxxxxx 0x00 0x01 0x02 0x03 0xff 0xff 0xff 0xff
> >   FDT_PROPDATA_PHANDLE_REF 9 0x00000004 "foo1" 0x00 0x00 0x00
> > 
> >   This means that at the offset 4 of the property data, the value
> >   (0xffffffff) is an unresolved phandle value and the related node is
> >   the node referenced by "foo1".
> > 
> >   This is what is encoded in the dtb when the related dts has a property
> >   with the value set to <0x00010203 &foo1> with 'foo1' a reference
> >   to an non local node.
> > 
> > If several non local phandles are used in the property data, several
> > FDT_PROPDATA_PHANDLE_REF are present after the FDT_PROP tag. Each of
> > them points with its offset value to the position of one phandle.
> > 
> > For instance, if a first property with 8 bytes of data has a
> > unresolved phandle value at offset 4 referenced by "foo" and a second
> > property with 16 bytes of data has unresolved phandle values at offset 0
> > and 8 referenced by "bar" and "baz", the following tags sequence is
> > present:
> >   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
> >   FDT_PROPDATA_PHANDLE_REF 8 0x00000004 "foo"
> >   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
> >   FDT_PROPDATA_PHANDLE_REF 8 0x00000000 "bar"
> >   FDT_PROPDATA_PHANDLE_REF 8 0x00000008 "baz"
> > 
> > Add support for this new dtb tag.
> > 
> > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > Link: https://lore.kernel.org/all/aL-2fmYsbexEtpNp@zatzit/
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  fdtdump.c          | 10 ++++++
> >  flattree.c         | 78 +++++++++++++++++++++++++++++++++++++++++++++-
> >  libfdt/fdt.c       | 30 ++++++++++++++++++
> >  libfdt/fdt.h       | 14 +++++++++
> >  libfdt/fdt_check.c | 34 ++++++++++++++++++++
> >  5 files changed, 165 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fdtdump.c b/fdtdump.c
> > index 4ee9acc3..2acf3210 100644
> > --- a/fdtdump.c
> > +++ b/fdtdump.c
> > @@ -192,6 +192,16 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
> >  			continue;
> >  		}
> >  
> > +		if (tag == FDT_PROPDATA_PHANDLE_REF) {
> > +			p = get_structured_tag_data(tag, p, &d, &sz);
> > +			offset = fdt32_to_cpu(GET_CELL(d));
> > +			s = d;
> > +
> > +			printf("%*s// [FDT_PROPDATA_PHANDLE_REF] %s[%"PRIu32"], ref = %s\n",
> > +				depth * shift, "", last_prop_name, offset, s);
> > +			continue;
> > +		}
> > +
> >  		if ((tag & FDT_TAG_STRUCTURED) && (tag & FDT_TAG_SKIP_SAFE)) {
> >  			p = get_structured_tag_data(tag, p, &d, &sz);
> >  
> > diff --git a/flattree.c b/flattree.c
> > index 92d191d5..abc50873 100644
> > --- a/flattree.c
> > +++ b/flattree.c
> > @@ -51,6 +51,7 @@ struct emitter {
> >  	void (*endnode)(void *, struct label *labels);
> >  	void (*property)(void *, struct label *labels);
> >  	void (*propdata_phandle)(void *);
> > +	void (*propdata_phandle_ref)(void *);  
> 
> As for propdata_phandle, a new hook shouldn't be necessary here.

Ok.

> 
> >  };
> >  
> >  static void bin_emit_cell(void *e, cell_t val)
> > @@ -105,6 +106,11 @@ static void bin_emit_propdata_phandle(void *e)
> >  	bin_emit_cell(e, FDT_PROPDATA_PHANDLE);
> >  }
> >  
> > +static void bin_emit_propdata_phandle_ref(void *e)
> > +{
> > +	bin_emit_cell(e, FDT_PROPDATA_PHANDLE_REF);
> > +}
> > +
> >  static struct emitter bin_emitter = {
> >  	.cell = bin_emit_cell,
> >  	.string = bin_emit_string,
> > @@ -114,6 +120,7 @@ static struct emitter bin_emitter = {
> >  	.endnode = bin_emit_endnode,
> >  	.property = bin_emit_property,
> >  	.propdata_phandle = bin_emit_propdata_phandle,
> > +	.propdata_phandle_ref = bin_emit_propdata_phandle_ref,
> >  };
> >  
> >  static void emit_label(FILE *f, const char *prefix, const char *label)
> > @@ -233,6 +240,14 @@ static void asm_emit_propdata_phandle(void *e)
> >  	asm_emit_cell(e, FDT_PROPDATA_PHANDLE);
> >  }
> >  
> > +static void asm_emit_propdata_phandle_ref(void *e)
> > +{
> > +	FILE *f = e;
> > +
> > +	fprintf(f, "\t/* FDT_PROPDATA_PHANDLE_REF */\n");
> > +	asm_emit_cell(e, FDT_PROPDATA_PHANDLE_REF);
> > +}
> > +
> >  static struct emitter asm_emitter = {
> >  	.cell = asm_emit_cell,
> >  	.string = asm_emit_string,
> > @@ -242,6 +257,7 @@ static struct emitter asm_emitter = {
> >  	.endnode = asm_emit_endnode,
> >  	.property = asm_emit_property,
> >  	.propdata_phandle = asm_emit_propdata_phandle,
> > +	.propdata_phandle_ref = asm_emit_propdata_phandle_ref,
> >  };
> >  
> >  static int stringtable_insert(struct data *d, const char *str)
> > @@ -306,6 +322,16 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
> >  					emit->cell(etarget, m->offset);
> >  					continue;
> >  				}
> > +
> > +				if (m->ref[0] == '/')
> > +					die("Phandle uses a non local reference by path (%s)\n",
> > +					    m->ref);
> > +
> > +				emit->propdata_phandle_ref(etarget);
> > +				emit->cell(etarget, sizeof(cell_t) + strlen(m->ref) + 1);
> > +				emit->cell(etarget, m->offset);
> > +				emit->string(etarget, m->ref, 0);
> > +				emit->align(etarget, sizeof(cell_t));
> >  			}
> >  		}
> >  	}
> > @@ -626,6 +652,16 @@ static void inbuf_init(struct inbuf *inb, void *base, void *limit)
> >  	inb->ptr = inb->base;
> >  }
> >  
> > +static void flat_read_subbuf(struct inbuf *inb, struct inbuf *subbuf, int len)
> > +{
> > +	if ((inb->ptr + len) > inb->limit)
> > +		die("Premature end of data parsing flat device tree\n");
> > +
> > +	inbuf_init(subbuf, inb->ptr, inb->ptr + len);
> > +
> > +	inb->ptr += len;
> > +}
> > +
> >  static void flat_read_chunk(struct inbuf *inb, void *p, int len)
> >  {
> >  	if ((inb->ptr + len) > inb->limit)
> > @@ -704,6 +740,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
> >  		case FDT_NOP:
> >  		case FDT_END:
> >  		case FDT_PROPDATA_PHANDLE:
> > +		case FDT_PROPDATA_PHANDLE_REF:
> >  			return tag;
> >  		default:
> >  			break;
> > @@ -713,7 +750,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
> >  	die("Cannot skip unknown tag 0x%08x\n", tag);
> >  }
> >  
> > -static const char *flat_read_string(struct inbuf *inb)
> > +static const char *flat_read_string_norealign(struct inbuf *inb)
> >  {
> >  	int len = 0;
> >  	const char *p = inb->ptr;
> > @@ -729,6 +766,15 @@ static const char *flat_read_string(struct inbuf *inb)
> >  
> >  	inb->ptr += len;
> >  
> > +	return str;
> > +}
> > +
> > +static const char *flat_read_string(struct inbuf *inb)
> > +{
> > +	const char *str;
> > +
> > +	str = flat_read_string_norealign(inb);
> > +
> >  	flat_realign(inb, sizeof(uint32_t));
> >  
> >  	return str;
> > @@ -844,8 +890,11 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
> >  	struct property *prop = NULL;
> >  	struct node *node;
> >  	const char *flatname;
> > +	struct inbuf subbuf;
> >  	uint32_t val;
> >  	uint32_t offset;
> > +	uint32_t len;
> > +	const char *str;
> >  
> >  	node = build_node(NULL, NULL, NULL);
> >  
> > @@ -915,6 +964,33 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
> >  			prop->val = data_append_markers(prop->val, m);
> >  			break;
> >  
> > +		case FDT_PROPDATA_PHANDLE_REF:
> > +			if (!(flags & FTF_PROPDATA_PHANDLE))
> > +				die("PROPDATA_PHANDLE_REF tag found in flat tree"
> > +					" version <20\n");
> > +
> > +			if (!prop)
> > +				die("PROPDATA_PHANDLE_REF tag found without a previous PROP tag");
> > +
> > +			len = flat_read_word(dtbuf);
> > +			flat_read_subbuf(dtbuf, &subbuf, len);
> > +			flat_realign(dtbuf, sizeof(uint32_t));
> > +
> > +			offset = flat_read_word(&subbuf);
> > +			str = flat_read_string_norealign(&subbuf);
> > +
> > +			/*
> > +			 * A reference to a phandle is present in the property
> > +			 * Mark the whole property as TYPE_UINT32.
> > +			 */
> > +			property_add_marker(prop, TYPE_UINT32, 0, NULL);  
> 
> This isn't correct. There are existing bindings which mix phandle and
> string or other data in a single property.

Why did I do that?

My first try was without adding the TYPE_UINT32 marker.

With the following input dts:
---- 8< ----
/ {
	prop1 = <&node_a>;
	prop2 = <&node_a 123>;
	prop3 = <123 &node_a>;
	prop4 = <123 &node_a 123>;
	prop5 = <123 &node_a 123>, <456 &node_a 456>;

	node_a: node-a {
	};
};
---- 8< ----

Converting the dts to a dtb and converting back the dtb to a dts leads to the
following output dts:
---- 8< ----
/ {
	prop1 = <&{/node-a}>;
	prop2 = <&{/node-a}>, <0x7b>;
	prop3 = <0x7b>, <&{/node-a}>;
	prop4 = <0x7b>, <&{/node-a}>, <0x7b>;
	prop5 = <0x7b>, <&{/node-a}>, <0x7b 0x1c8>, <&{/node-a}>, <0x1c8>;

	node-a {
		phandle = <0x01>;
	};
};
---- 8< ----

This looks ugly and this is due to guess_type_markers() [0].

With the TYPE_UINT32 added to mark the whole property (I wasn't aware that we
can mix phandle and string or other data in a single property), the resulting
output dts (dtb -> dts) is better:
---- 8< ----
/ {
	prop1 = <&{/node-a}>;
	prop2 = <&{/node-a} 0x7b>;
	prop3 = <0x7b &{/node-a}>;
	prop4 = <0x7b &{/node-a} 0x7b>;
	prop5 = <0x7b &{/node-a} 0x7b 0x1c8 &{/node-a} 0x1c8>;

	node-a {
		phandle = <0x01>;
	};
};
---- 8< ----

Even if not perfect, I don't think that we can do better without adding metadata
in the dtb to mark types but that's an other story.

Now that I know that we can mix phandle and string or other data in a single
property, indeed, adding the TYPE_UINT32 to mark the whole property is not
correct anymore.

guess_type_markers() needs to be fixed. I will propose a fix in the next
iteration.

[0]: https://github.com/dgibson/dtc/blob/main/treesource.c#L249

> 
> > +			/* Mark the offset as a external phandle reference */
> > +			m = alloc_marker(offset, REF_PHANDLE, xstrdup(str));
> > +			m->is_local = false;
> > +			prop->val = data_append_markers(prop->val, m);
> > +			break;
> > +
> >  		default:
> >  			die("Invalid opcode word %08x in device tree blob\n",
> >  			    val);
> > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > index 3762fbef..d23b886b 100644
> > --- a/libfdt/fdt.c
> > +++ b/libfdt/fdt.c
> > @@ -281,6 +281,33 @@ static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffs
> >  		offset = sum;
> >  		break;
> >  
> > +	case FDT_PROPDATA_PHANDLE_REF:
> > +		tmp_offset = fdt_get_structured_tag_data(tag, fdt, offset, &len);
> > +		if (tmp_offset < 0)
> > +			return FDT_END; /* premature end */
> > +
> > +		sum = tmp_offset + len;
> > +
> > +		/* Check offset value */
> > +		tmp32p = fdt_offset_ptr(fdt, tmp_offset, sizeof(*tmp32p));
> > +		if (!can_assume(VALID_DTB) && !tmp32p)
> > +			return FDT_END; /* premature end */
> > +		tmp_offset += sizeof(fdt32_t);
> > +
> > +		/* Check ref string */
> > +		do {
> > +			p = fdt_offset_ptr(fdt, tmp_offset++, 1);
> > +		} while (p && (*p != '\0'));  
> 
> Since we have the length from the structured tag, we should be able to
> avoid validating the string bytes one by one.

Yes. I will optimize.

> 
> > +		if (!can_assume(VALID_DTB) && !p)
> > +			return FDT_END; /* premature end */
> > +
> > +		if (!can_assume(VALID_INPUT) && (uint32_t)tmp_offset > sum)
> > +			return FDT_END; /* premature end */
> > +
> > +		/* Skip the whole data bloc */  
> 
> block

Indeed.

> 
> > +		offset = sum;
> > +		break;
> > +
> >  	default:
> >  		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
> >  			return FDT_END;
> > @@ -310,6 +337,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
> >  	case FDT_NOP:
> >  	case FDT_END:
> >  	case FDT_PROPDATA_PHANDLE:
> > +	case FDT_PROPDATA_PHANDLE_REF:
> >  		return false;
> >  	default:
> >  		break;
> > @@ -364,6 +392,7 @@ bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
> >  {
> >  	switch (tag) {
> >  	case FDT_PROPDATA_PHANDLE:
> > +	case FDT_PROPDATA_PHANDLE_REF:
> >  		return true;
> >  
> >  	default:
> > @@ -377,6 +406,7 @@ bool fdt_tag_is_property_metadata(uint32_t tag)
> >  {
> >  	switch (tag) {
> >  	case FDT_PROPDATA_PHANDLE:
> > +	case FDT_PROPDATA_PHANDLE_REF:
> >  		return true;
> >  	default:
> >  		break;
> > diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> > index 2f681088..c151aa2b 100644
> > --- a/libfdt/fdt.h
> > +++ b/libfdt/fdt.h
> > @@ -95,6 +95,20 @@ struct fdt_property {
> >   */
> >  #define FDT_PROPDATA_PHANDLE   FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0x1000)
> >  
> > +/*
> > + * external phandle tag (meta-data). varlen: offset, string label
> > + *
> > + * It indicates that the property defined before this tag (FDT_PROP) uses a
> > + * phandle value and the node related to this phandle value is not local
> > + * node (i.e. the node is not present in the device-tree blob). The phandle
> > + * value used in the property has to be resolved when the device-tree blob
> > + * is applied on top of a base device-tree.
> > + *
> > + * offset: Offset in the property data where the phandle is available
> > + * label: The label to use to resolve the phandle value
> > + */
> > +#define FDT_PROPDATA_PHANDLE_REF  FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0x1001)
> > +
> >  #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
> >  #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
> >  #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
> > diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> > index ac297841..96dd7dc0 100644
> > --- a/libfdt/fdt_check.c
> > +++ b/libfdt/fdt_check.c
> > @@ -22,6 +22,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
> >  	int proplen;
> >  	bool expect_end = false;
> >  	const fdt32_t *pfdt32;
> > +	const char *str;
> >  	uint32_t val;
> >  
> >  	if (can_assume(PERFECT))
> > @@ -129,6 +130,39 @@ int fdt_check_full(const void *fdt, size_t bufsize)
> >  				return tmp;
> >  			break;
> >  
> > +		case FDT_PROPDATA_PHANDLE_REF:
> > +			/* Be sure that a property is available before this tag */
> > +			if (!prop)
> > +				return -FDT_ERR_BADSTRUCTURE;
> > +
> > +			d = fdt_get_structured_tag_data(tag, fdt,
> > +							offset + FDT_TAGSIZE, NULL);
> > +			if (d < 0)
> > +				return d;
> > +
> > +			/* Retrieve the offset of the phandle in the property */
> > +			pfdt32 = fdt_offset_ptr(fdt, d, sizeof(*pfdt32));
> > +			if (!pfdt32)
> > +				return -FDT_ERR_BADSTRUCTURE;
> > +			tmp = fdt32_to_cpu(*pfdt32);
> > +
> > +			/* Check this offset */
> > +			if (tmp % sizeof(fdt32_t))
> > +				return -FDT_ERR_BADVALUE;  
> 
> Again, misaligned phandles need to be supported.

Ok.

> 
> > +			if ((uint32_t)proplen < tmp + sizeof(fdt32_t))  
> 
> Beware overflows.

Will update.

> 
> > +				return -FDT_ERR_BADSTRUCTURE;
> > +
> > +			/* Retrieve the reference */
> > +			d += sizeof(fdt32_t);
> > +			str = fdt_offset_ptr(fdt, d, 1);
> > +			if (!str)
> > +				return -FDT_ERR_BADSTRUCTURE;
> > +
> > +			/* Check that the reference is not an empty string */
> > +			if (!strlen(str))
> > +				return -FDT_ERR_BADVALUE;  
> 
> It might be worth being stricter about the string validation: you
> already know the total length from the structured tag.  So, you can
> require that:
> 	1. Every byte of the label except the last is != \0
> 	2. The last byte of the label is \0
> 	3. Any padding bytes after the tag data are 0
> 
> And, come to that we should probably define a valid character set for
> labels and enforce that ('/' needs to be excluded, at least).

Right, I will propose something better in that way.

> 
> 
> > +			break;
> > +
> >  		default:
> >  			return -FDT_ERR_INTERNAL;
> >  		}
> > -- 
> > 2.55.0
> > 
> >   
> 

Best regards,
Hervé
