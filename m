Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603593;
	b=k5784Tey3at1FEy7tvp0w6qWXwW1BnTbXHRvJvCGpQCjPbnNvNmouH89z9MmzdiNgtqJ
	 YqSJMyU0lkXxHoOe3m4IZlTglszOsVDoJE/+Oqnk2pDzqk69/D8nK9xEhyNvAyKJd2RaY
	 JRoPPoyshmaWM7gxsoyMJHipeBeVockL7XHGdrUmAGdLhzwzvsCnjsWsJNLYFXBu8MHvA
	 VHNT3Sw6etCqSH3IlBk/G+HrrsKttY30trfo8gmMRD5FknXos2fObyO3kBSDb2Mh08sDO
	 Bg73yIj11M2LLxHDKTzcvivE7ONNsr3Yf/3lkLBlMl79u85265aECvxLGj4D94wp7fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603593;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=zTaav9JJqi7o41CWz6I8xC0Eiog2roG1fHHx2DjpFK4=;
	b=h0yL+lMbw7XoqSToqcDBfmsg09VLUP3RCypLE4e7xHLwO9YihsO/lymK0WO7P2RY5nee
	 ASc9pB8DBT8puCQahkVoC6xXrxv8jt1JPaua4N+7NDuy28m7fT/FMB3x4AmE4Ah96kNed
	 Y+3Le09eLhOQ9rdTQfUBd5WssCcLQ/Im4E1CRFxZqDREab8z/J9PbuqFvRzY4qDPO16JV
	 QByD8+HQVL96hXTbzPcxIUO/BsxeJzDa4Qlvs6FapiiebeJ5WOMeWrEnhMmuamizejMtH
	 CQ2fTxHFagiVwCi0JQ0uUFSm6QE3WEICvHAZlbCTkf+7ZGYHnjBXyUQOxBqANk//lDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0YocWKM+;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F0606A31D
	for <devicetree-compiler@vger.kernel.org>; Wed, 21 Oct 2026 17:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0YocWKM+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2ED9CC5CD6A;
	Wed, 21 Oct 2026 17:27:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFFB3606E3;
	Wed, 21 Oct 2026 17:26:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2A0A103289F5;
	Wed, 21 Oct 2026 19:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792603585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zTaav9JJqi7o41CWz6I8xC0Eiog2roG1fHHx2DjpFK4=;
	b=0YocWKM+QJdGzkfXaBT5rSZcx4bgm8BVHIKJqiSBJw3ubpoqN9w/sAKkdzXpfUUx2Yg32f
	UskT3sFESnz1osFU5n8O7Lw7VLbe1YxMjueSsw6XV/8VyqCl+4ZLGfp0qLh3mo2VcN/0eV
	1ce3hl6rtavaZLjhHu7etB7ZZ0WLq7QwFtrAyy544KXZqoFG6WxgyvfV5ipEwMwq99iJEW
	1FqaAzCP/uveEYTDdVxxpCcHph3gbEEwFqryy30jRGF87tI+238C8Z7I6xJGUNb1248Xvo
	wTGTebbGkZxQVSOYaQu11VKdVXLYnsVXXsisuaEyDxsyEwMJ0OqnODibPZn0lQ==
Date: Wed, 21 Oct 2026 19:26:15 +0200
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
Subject: Re: [RFC PATCH v2 07/74] Add support for FDT_PROPDATA_PHANDLE dtb
 tag
Message-ID: <20261021192615.1f5b91ff@bootlin.com>
In-Reply-To: <atgtw8QubzVfWMYP@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-8-herve.codina@bootlin.com>
	<atgtw8QubzVfWMYP@gractus.seuss>
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

On Wed, 21 Oct 2026 14:13:11 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Aug 26, 2026 at 11:48:36AM +0200, Herve Codina wrote:
> > FDT_PROPDATA_PHANDLE dtb tag is a meta-data tag attached to a property.
> > 
> > It indicates that the property defined before this tag (FDT_PROP) uses a
> > phandle value and the node related to this phandle value is local (i.e.
> > the node is present in the device-tree blob).
> > 
> > It is followed by one value:
> >  - offset (32bit):
> >      Offset in the property data where the phandle is available.  
> 
> The definition of the tag seems fine.  As a general rule, data within
> properties is not aligned, so it might be worth noting explicitly that
> offset can be any integer, not just multiples of 4.

Yes, it was obvious on my side but sure, I will explicitly mention that.

> 
> The name seems a little clunky, but I'm struggling a bit to come up
> with a better one.  FDT_PHANDLE_LOCAL maybe?  FDT_PLINK_LOCAL?

I would like to identify in the name that the tag is related to data in
the property.

If we look at all tags added by the addon series so far we have:

- Tags related to properties
  - FDT_PROPDATA_PHANDLE: A well defined phandle (local) value in the property
  - FDT_PROPDATA_PHANDLE_REF: A phandle value that needs to be resolved

- Tags related to node
  - FDT_EXPORT_SYM: Export a symbol whose the target is a local node (local phandle)
  - FDT_EXPORT_SYM_REF: Export a symbol whose the target needs to be resolved

- Global Tags
  - FDT_IMPORT_SYM: Import a symbol
  - FDT_BEGIN_NODE_REF: Only available at top level, the node is not local but
      we reference an existing node in the base tree (resolution needed).

I choose to not mention _LOCAL or any other suffix for local resources.
I use _REF when a reference is used that need to be resolved and I use PROPDATA
for tags related to property data.

Having FDT_PHANDLE_LOCAL will be consistent if we add the _LOCAL suffix in
all local resources.

FDT_PHANDLE can be ambiguous. Are we talking about the phandle (or linux,phandle)
property available in a node or the phandle value available in property data ?

FDT_PLINK moves out of the known terminology used in devicetree. No "plink" nor
"phandle link" are found in documentation.

What do you think is clunky ?
Is it the PROPDATA term itself ?

> 
> > Example:
> >   FDT_PROP 0x00000008 xxxxxxxx 0xca 0xfe 0xde 0xca 0x01 0x02 0x03 0x04
> >   FDT_PROPDATA_PHANDLE 0x00000004
> > 
> >   This means that at the offset 4 of the property data, the value
> >   (0x01020304) is a phandle and the related node is available in the
> >   dtb.
> > 
> >   This is what is encoded in the dtb when the related dts has a property
> >   with the value set to <0xcafedeca &foo> with 'foo' a reference to an
> >   existing node where the phandle value is 0x01020304.
> > 
> > If several local phandles are used in the property data, several
> > FDT_PROPDATA_PHANDLE are present after the FDT_PROP tag. Each of them
> > points with its offset value to the position of one phandle.
> > 
> > For instance, if a first property with 8 bytes of data has a phandle
> > value at offset 4 and a second property with 16 bytes of data has
> > phandle values at offset 0 and 8, the following tags sequence is
> > present:
> >   FDT_PROP 0x00000008 xxxxxxxx <data bytes>
> >   FDT_PROPDATA_PHANDLE 0x00000004
> >   FDT_PROP 0x00000010 xxxxxxxx <data bytes>
> >   FDT_PROPDATA_PHANDLE 0x00000000
> >   FDT_PROPDATA_PHANDLE 0x00000008
> > 
> > Add support for this new dtb tag.
> > 
> > Suggested-by: David Gibson <david@gibson.dropbear.id.au>
> > Link: https://lore.kernel.org/all/aL-2fmYsbexEtpNp@zatzit/
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  data.c             |  3 ++-
> >  dtc.h              |  2 ++
> >  fdtdump.c          | 15 ++++++++++-
> >  flattree.c         | 63 ++++++++++++++++++++++++++++++++++++++++++++--
> >  libfdt/fdt.c       | 37 ++++++++++++++++++++++++++-
> >  libfdt/fdt.h       | 11 ++++++++
> >  libfdt/fdt_check.c | 46 ++++++++++++++++++++++++++++++---
> >  libfdt/libfdt.h    |  3 ++-
> >  treesource.c       |  1 +
> >  9 files changed, 171 insertions(+), 10 deletions(-)
> > 
> > diff --git a/data.c b/data.c
> > index 5b25aa06..9bae7047 100644
> > --- a/data.c
> > +++ b/data.c
> > @@ -127,7 +127,7 @@ struct data data_insert_at_marker(struct data d, struct marker *m,
> >  	return d;
> >  }
> >  
> > -static struct data data_append_markers(struct data d, struct marker *m)
> > +struct data data_append_markers(struct data d, struct marker *m)
> >  {
> >  	struct marker **mp = &d.markers;
> >  
> > @@ -288,6 +288,7 @@ struct marker *alloc_marker(unsigned int offset, enum markertype type,
> >  	m->type = type;
> >  	m->ref = ref;
> >  	m->next = NULL;
> > +	m->is_local = 0;  
> 
> Storing is_local in the marker doesn't make sense to me.  I think the
> locality should be calculated only when we actually go to emit the dtb
> - I believe we should be able to deduce it from m->ref.

When we parse a dtb, we do not have any reference for local phandle, we have
only the phandle value.

Later in build_dt_info(), complete_references() is called. This new function
is introduced in patch 9 ("dtc: Complete REF_PHANDLE markers with ref strings
and is_local flags"). It completes the reference either filling the ref field
based on the phandle value for all local reference (parsing from a dtb) or
setting is_local based on the reference (parsing from a dts).

> 
> >  	return m;
> >  }
> > diff --git a/dtc.h b/dtc.h
> > index ef3f2682..64eaffde 100644
> > --- a/dtc.h
> > +++ b/dtc.h
> > @@ -128,6 +128,7 @@ struct  marker {
> >  	enum markertype type;
> >  	unsigned int offset;
> >  	char *ref;
> > +	bool is_local;
> >  	struct marker *next;
> >  };
> >  
> > @@ -187,6 +188,7 @@ struct data data_insert_data(struct data d, struct marker *m, struct data old);
> >  struct marker *alloc_marker(unsigned int offset, enum markertype type,
> >  			    char *ref);
> >  struct data data_add_marker(struct data d, enum markertype type, char *ref);
> > +struct data data_append_markers(struct data d, struct marker *m);
> >  
> >  bool data_is_one_string(struct data d);
> >  
> > diff --git a/fdtdump.c b/fdtdump.c
> > index f26d3a89..4ee9acc3 100644
> > --- a/fdtdump.c
> > +++ b/fdtdump.c
> > @@ -84,8 +84,9 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
> >  	const char *p_strings = (const char *)blob + off_str;
> >  	uint32_t version = fdt32_to_cpu(bph->version);
> >  	uint32_t totalsize = fdt32_to_cpu(bph->totalsize);
> > -	uint32_t tag;
> > +	uint32_t tag, offset;
> >  	const char *p, *d, *s, *t;
> > +	const char *last_prop_name = NULL;
> >  	int depth, sz, shift;
> >  	int i;
> >  	uint64_t addr, size;
> > @@ -138,6 +139,7 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
> >  		        (uintptr_t)p - blob_off - 4, tag, tagname(tag));
> >  
> >  		if (tag == FDT_BEGIN_NODE) {
> > +			last_prop_name = NULL;
> >  			s = p;
> >  			p = PALIGN(p + strlen(s) + 1, 4);
> >  
> > @@ -151,6 +153,7 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
> >  		}
> >  
> >  		if (tag == FDT_END_NODE) {
> > +			last_prop_name = NULL;
> >  			depth--;
> >  
> >  			printf("%*s};\n", depth * shift, "");
> > @@ -176,6 +179,16 @@ static void dump_blob(void *blob, bool debug, int dump_unknown)
> >  			printf("%*s%s", depth * shift, "", s);
> >  			utilfdt_print_data(t, sz);
> >  			printf(";\n");
> > +			last_prop_name = s;
> > +			continue;
> > +		}
> > +
> > +		if (tag == FDT_PROPDATA_PHANDLE) {
> > +			p = get_structured_tag_data(tag, p, &d, &sz);
> > +			offset = fdt32_to_cpu(GET_CELL(d));
> > +
> > +			printf("%*s// [FDT_PROPDATA_PHANDLE] %s[%"PRIu32"]\n", depth * shift, "",
> > +				last_prop_name, offset);
> >  			continue;
> >  		}
> >  
> > diff --git a/flattree.c b/flattree.c
> > index dd451f0c..92d191d5 100644
> > --- a/flattree.c
> > +++ b/flattree.c
> > @@ -15,6 +15,7 @@
> >  #define FTF_NOPS	0x40
> >  #define FTF_DTFLAGS	0x80
> >  #define FTF_LCVERSW	0x100
> > +#define FTF_PROPDATA_PHANDLE	0x200
> >  
> >  static struct version_info {
> >  	int version;
> > @@ -38,7 +39,7 @@ static struct version_info {
> >  	 FTF_LCVERSW},
> >  	{20, 18, 18, FDT_V20_SIZE,
> >  	 FTF_BOOTCPUID|FTF_STRTABSIZE|FTF_STRUCTSIZE|FTF_NOPS|FTF_DTFLAGS|
> > -	 FTF_LCVERSW},
> > +	 FTF_LCVERSW|FTF_PROPDATA_PHANDLE},
> >  };
> >  
> >  struct emitter {
> > @@ -49,6 +50,7 @@ struct emitter {
> >  	void (*beginnode)(void *, struct label *labels);
> >  	void (*endnode)(void *, struct label *labels);
> >  	void (*property)(void *, struct label *labels);
> > +	void (*propdata_phandle)(void *);  
> 
> The only reason begginnode, endnode and property have custom function
> pointers here, and don't just re-use emitter->cell, is that in -Oasm
> mode we attach symbols to nodes and properties, based on the labels.
> 
> That's not a concern for this new tag, so we shouldn't need a custom
> emitter function.

Ok, I will remove the emitter.

> 
> >  };
> >  
> >  static void bin_emit_cell(void *e, cell_t val)
> > @@ -98,6 +100,11 @@ static void bin_emit_property(void *e, struct label *labels)
> >  	bin_emit_cell(e, FDT_PROP);
> >  }
> >  
> > +static void bin_emit_propdata_phandle(void *e)
> > +{
> > +	bin_emit_cell(e, FDT_PROPDATA_PHANDLE);
> > +}
> > +
> >  static struct emitter bin_emitter = {
> >  	.cell = bin_emit_cell,
> >  	.string = bin_emit_string,
> > @@ -106,6 +113,7 @@ static struct emitter bin_emitter = {
> >  	.beginnode = bin_emit_beginnode,
> >  	.endnode = bin_emit_endnode,
> >  	.property = bin_emit_property,
> > +	.propdata_phandle = bin_emit_propdata_phandle,
> >  };
> >  
> >  static void emit_label(FILE *f, const char *prefix, const char *label)
> > @@ -217,6 +225,14 @@ static void asm_emit_property(void *e, struct label *labels)
> >  	asm_emit_cell(e, FDT_PROP);
> >  }
> >  
> > +static void asm_emit_propdata_phandle(void *e)
> > +{
> > +	FILE *f = e;
> > +
> > +	fprintf(f, "\t/* FDT_PROPDATA_PHANDLE */\n");
> > +	asm_emit_cell(e, FDT_PROPDATA_PHANDLE);
> > +}
> > +
> >  static struct emitter asm_emitter = {
> >  	.cell = asm_emit_cell,
> >  	.string = asm_emit_string,
> > @@ -225,6 +241,7 @@ static struct emitter asm_emitter = {
> >  	.beginnode = asm_emit_beginnode,
> >  	.endnode = asm_emit_endnode,
> >  	.property = asm_emit_property,
> > +	.propdata_phandle = asm_emit_propdata_phandle,
> >  };
> >  
> >  static int stringtable_insert(struct data *d, const char *str)
> > @@ -249,6 +266,7 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
> >  	struct property *prop;
> >  	struct node *child;
> >  	bool seen_name_prop = false;
> > +	struct marker *m;
> >  
> >  	if (tree->deleted)
> >  		return;
> > @@ -279,6 +297,17 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
> >  
> >  		emit->data(etarget, prop->val);
> >  		emit->align(etarget, sizeof(cell_t));
> > +
> > +		if (vi->flags & FTF_PROPDATA_PHANDLE) {
> > +			m = prop->val.markers;
> > +			for_each_marker_of_type(m, REF_PHANDLE) {
> > +				if (m->is_local) {
> > +					emit->propdata_phandle(etarget);
> > +					emit->cell(etarget, m->offset);
> > +					continue;
> > +				}
> > +			}
> > +		}
> >  	}
> >  
> >  	if ((vi->flags & FTF_NAMEPROPS) && !seen_name_prop) {
> > @@ -674,6 +703,7 @@ static uint32_t flat_read_tag(struct inbuf *inb)
> >  		case FDT_PROP:
> >  		case FDT_NOP:
> >  		case FDT_END:
> > +		case FDT_PROPDATA_PHANDLE:
> >  			return tag;
> >  		default:
> >  			break;
> > @@ -811,9 +841,11 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
> >  				   struct inbuf *strbuf,
> >  				   const char *parent_flatname, int flags)
> >  {
> > +	struct property *prop = NULL;
> >  	struct node *node;
> >  	const char *flatname;
> >  	uint32_t val;
> > +	uint32_t offset;
> >  
> >  	node = build_node(NULL, NULL, NULL);
> >  
> > @@ -826,8 +858,8 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
> >  		node->name = xstrdup(flatname);
> >  
> >  	do {
> > -		struct property *prop;
> >  		struct node *child;
> > +		struct marker *m;
> >  
> >  		val = flat_read_tag(dtbuf);
> >  		switch (val) {
> > @@ -840,11 +872,13 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
> >  			break;
> >  
> >  		case FDT_BEGIN_NODE:
> > +			prop = NULL;
> >  			child = unflatten_tree(dtbuf,strbuf, flatname, flags);
> >  			add_child(node, child);
> >  			break;
> >  
> >  		case FDT_END_NODE:
> > +			prop = NULL;
> >  			break;
> >  
> >  		case FDT_END:
> > @@ -859,6 +893,28 @@ static struct node *unflatten_tree(struct inbuf *dtbuf,
> >  			/* Ignore */
> >  			break;
> >  
> > +		case FDT_PROPDATA_PHANDLE:
> > +			if (!(flags & FTF_PROPDATA_PHANDLE))
> > +				die("PROPDATA_PHANDLE tag found in flat tree"
> > +				    " version <20\n");
> > +
> > +			if (!prop)
> > +				die("PROPDATA_PHANDLE tag found without a previous PROP tag");
> > +
> > +			offset = flat_read_word(dtbuf);
> > +
> > +			/*
> > +			 * A reference to a phandle is present in the property
> > +			 * Mark the whole property as TYPE_UINT32.
> > +			 */
> > +			property_add_marker(prop, TYPE_UINT32, 0, NULL);
> > +
> > +			/* Mark the offset as a local phandle reference */
> > +			m = alloc_marker(offset, REF_PHANDLE, NULL);
> > +			m->is_local = true;
> > +			prop->val = data_append_markers(prop->val, m);  
> 
> This doesn't properly populate m->ref which is an essential field in a
> REF_PHANDLE marker.  Of course, doing so is kind of tricky - it
> requires searching for the node with the referenced phandle, which
> might not have been parsed yet.  So, alas, it will require a second
> pass to fix up the REF_PHANDLE markers.

We cannot do it here. The whole dtb needs to be parsed to set correctly
m->ref.

This is done by complete_references() introduced in patch 9.

> 
> Also, markers are required to be inserted in order of offset (other
> parts of the code rely on this).  So you'll either need to sort as you
> insert, or require that FDT_PROPDATA_PHANDLE tags also come in offset
> order (but then you need to check and enforce that).

I will insert the marker at the correct place in data_append_markers()
based on the offset value.

> 
> > +			break;
> > +
> >  		default:
> >  			die("Invalid opcode word %08x in device tree blob\n",
> >  			    val);
> > @@ -981,6 +1037,9 @@ struct dt_info *dt_from_blob(const char *fname)
> >  	if (version >= 18)
> >  		flags |= FTF_DTFLAGS | FTF_LCVERSW;
> >  
> > +	if (version >= 20)
> > +		flags |= FTF_PROPDATA_PHANDLE;
> > +
> >  	inbuf_init(&memresvbuf,
> >  		   blob + off_mem_rsvmap, blob + totalsize);
> >  	inbuf_init(&dtbuf, blob + off_dt, blob + totalsize);
> > diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> > index 8c026f26..3762fbef 100644
> > --- a/libfdt/fdt.c
> > +++ b/libfdt/fdt.c
> > @@ -213,7 +213,7 @@ int fdt_get_structured_tag_data(uint32_t tag, const void *fdt, int offset,
> >  
> >  static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffset)
> >  {
> > -	const fdt32_t *tagp, *lenp;
> > +	const fdt32_t *tagp, *lenp, *tmp32p;
> >  	uint32_t tag, len, sum;
> >  	int offset = startoffset;
> >  	int tmp_offset;
> > @@ -262,6 +262,25 @@ static uint32_t fdt_next_tag_all(const void *fdt, int startoffset, int *nextoffs
> >  	case FDT_NOP:
> >  		break;
> >  
> > +	case FDT_PROPDATA_PHANDLE:
> > +		tmp_offset = fdt_get_structured_tag_data(tag, fdt, offset, &len);
> > +		if (tmp_offset < 0)
> > +			return FDT_END; /* premature end */
> > +
> > +		sum = tmp_offset + len;
> > +
> > +		if (!can_assume(VALID_DTB) && len < FDT_CELLSIZE)
> > +			return FDT_END; /* premature end */
> > +
> > +		/* Check offset value */
> > +		tmp32p = fdt_offset_ptr(fdt, tmp_offset, sizeof(*tmp32p));
> > +		if (!can_assume(VALID_DTB) && !tmp32p)
> > +			return FDT_END; /* premature end */
> > +
> > +		/* Skip the whole data bloc */  
> 
> s/bloc/block/
> 
> ("bloc" is used in English, but has specific meanings that don't apply
> here).

Will be fixed.

> 
> > +		offset = sum;
> > +		break;
> > +
> >  	default:
> >  		if (!(tag & FDT_TAG_STRUCTURED) || !(tag & FDT_TAG_SKIP_SAFE))
> >  			return FDT_END;
> > @@ -290,6 +309,7 @@ static bool fdt_tag_is_unknown(uint32_t tag)
> >  	case FDT_PROP:
> >  	case FDT_NOP:
> >  	case FDT_END:
> > +	case FDT_PROPDATA_PHANDLE:
> >  		return false;
> >  	default:
> >  		break;
> > @@ -342,11 +362,26 @@ uint32_t fdt_next_tag_filter(const void *fdt, int offset, int *nextoffset,
> >  
> >  bool fdt_tag_filter_skip_metadata(void *data, uint32_t tag)
> >  {
> > +	switch (tag) {
> > +	case FDT_PROPDATA_PHANDLE:
> > +		return true;
> > +
> > +	default:
> > +		break;
> > +	}
> > +
> >  	return false;
> >  }
> >  
> >  bool fdt_tag_is_property_metadata(uint32_t tag)
> >  {
> > +	switch (tag) {
> > +	case FDT_PROPDATA_PHANDLE:
> > +		return true;
> > +	default:
> > +		break;
> > +	}
> > +
> >  	return false;
> >  }
> >  
> > diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> > index 7c59fed2..2f681088 100644
> > --- a/libfdt/fdt.h
> > +++ b/libfdt/fdt.h
> > @@ -84,6 +84,17 @@ struct fdt_property {
> >  #define FDT_TEST_VARLEN_CAN_SKIP	FDT_TAG_CAN_SKIP(FDT_TAG_DATA_VARLEN, 0)
> >  #define FDT_TEST_NONE_NO_SKIP		FDT_TAG_NO_SKIP(FDT_TAG_DATA_NONE, 0)
> >  
> > +/*
> > + * local phandle tag (meta-data). 1 cell: offset
> > + *
> > + * It indicates that the property defined before this tag (FDT_PROP) uses a
> > + * phandle value and the node related to this phandle value is local (i.e.
> > + * the node is present in the device-tree blob).
> > + *
> > + * offset: Offset in the property data where the phandle is available
> > + */
> > +#define FDT_PROPDATA_PHANDLE   FDT_TAG_CAN_SKIP(FDT_TAG_DATA_1CELL, 0x1000)
> > +
> >  #define FDT_V1_SIZE	(7*sizeof(fdt32_t))
> >  #define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
> >  #define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
> > diff --git a/libfdt/fdt_check.c b/libfdt/fdt_check.c
> > index 2fd5b61d..ac297841 100644
> > --- a/libfdt/fdt_check.c
> > +++ b/libfdt/fdt_check.c
> > @@ -14,12 +14,15 @@ int fdt_check_full(const void *fdt, size_t bufsize)
> >  {
> >  	int err;
> >  	int num_memrsv;
> > -	int offset, nextoffset = 0;
> > +	int offset, nextoffset = 0, d, tmp;
> >  	uint32_t tag;
> >  	unsigned int depth = 0;
> > -	const void *prop;
> > +	const void *prop = NULL;
> >  	const char *propname;
> > +	int proplen;
> >  	bool expect_end = false;
> > +	const fdt32_t *pfdt32;
> > +	uint32_t val;
> >  
> >  	if (can_assume(PERFECT))
> >  		return 0;
> > @@ -58,6 +61,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
> >  			return 0;
> >  
> >  		case FDT_BEGIN_NODE:
> > +			prop = NULL;
> >  			depth++;
> >  			if (depth > INT_MAX)
> >  				return -FDT_ERR_BADSTRUCTURE;
> > @@ -77,6 +81,7 @@ int fdt_check_full(const void *fdt, size_t bufsize)
> >  			break;
> >  
> >  		case FDT_END_NODE:
> > +			prop = NULL;
> >  			if (depth == 0)
> >  				return -FDT_ERR_BADSTRUCTURE;
> >  			depth--;
> > @@ -86,9 +91,42 @@ int fdt_check_full(const void *fdt, size_t bufsize)
> >  
> >  		case FDT_PROP:
> >  			prop = fdt_getprop_by_offset(fdt, offset, &propname,
> > -						     &err);
> > +						     &proplen);
> >  			if (!prop)
> > -				return err;
> > +				return proplen;
> > +			break;
> > +
> > +		case FDT_PROPDATA_PHANDLE:
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
> 
> You can use fdt32_ld_() for this.

Yes indeed, I will update.

> 
> > +
> > +			/* Check this offset */
> > +			if (tmp % sizeof(fdt32_t))
> > +				return -FDT_ERR_BADVALUE;  
> 
> I don't think we can insist these are aligned.  A binding which had a
> string followed by a phandle could naturally lead to unaligned phandle values.

Ok, will handle unaligned offset.

> 
> > +			if ((uint32_t)proplen < tmp + sizeof(fdt32_t))  
> 
> Need to check for overflows here.

What do you think about
	if ((tmp + sizeof(fdt32_t) < tmp) ||
	    (uint32_t)proplen < tmp + sizeof(fdt32_t))
		return -FDT_ERR_???

Probably using an uint32_t for tmp here.

> 
> > +				return -FDT_ERR_BADSTRUCTURE;  
> 
> I'm not sure BADSTRUCTURE makes sense for this.  I think it's probably
> worth adding a new error code for bad metadata tags.

#define FDT_ERR_BADMETADATA	20
	/* FDT_ERR_BADMETADATA: The device tree has corrupt metadata. */

Is it ok on your side ?

> 
> > +
> > +			/* Retrieve the phandle value from the property */
> > +			pfdt32 = prop;
> > +			pfdt32 += tmp / sizeof(fdt32_t);  
> 
> Again, this will need updating for non-aligned phandles.

Will handle unaligned offset.

> 
> > +			val = fdt32_ld(pfdt32);  
> 
> ... which reminds me the entire fdt32_ld() interface is kind of
> broken.  They're specifically intended to handle misaligned accesses,
> strictly speaking it's already UB to generate a misaligned pointer, so
> there's a problem before we even call it.  Fixing this within API/ABI
> constraints is a nasty problem :(.

I can introduce and use the following:
---- 8< ----
static inline uint32_t fdt32_ld_unaligned(const uint8_t *pfdt32)
{
	return ((uint32_t)b[0] << 24)
		| ((uint32_t)b[1] << 16)
		| ((uint32_t)b[2] << 8)
		| b[3];
}
---- 8< ----

> 
> > +
> > +			/* Check the phandle value */
> > +			tmp = fdt_node_offset_by_phandle(fdt, val);  
> 
> Oof.  fdt_check_full() is already pretty expensive, but this is a big
> step up: this takes it (roughly speaking) from O(n) to O(n^2).  Don't
> really see a way to avoid that if this remains a "full check".
> 
> > +			if (tmp < 0)
> > +				return tmp;  
> 
> Error code probably needs translation here: the most likely error here
> is NOTFOUND, which is a weird think to get from fdt_check_full().

Ok, I will translate to -FDT_ERR_BADPHANDLE

> 
> >  			break;
> >  
> >  		default:
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index 5e1e0d06..ee811266 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -150,7 +150,8 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
> >   * be set to the offset immediately following the tag.
> >   *
> >   * returns:
> > - *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_END),
> > + *	the tag type (FDT_BEGIN_NODE, FDT_END_NODE, FDT_PROP, FDT_NOP, FDT_END
> > + *	or any other known tags),  
> 
> This hunk looks like it belongs in an earlier patch.

Well we add FDT_PROPDATA_PHANDLE and this is the first known tag added other
the existing ones already listed. Do you prefer an exhaustive list of known tags?

Also worth noting that fdt_next_tag() can return all unknown strutured tags that
can be skipped this has to be mentioned in the series adding support for structured
tag.

> 
> >   *	FDT_END, if offset is out of bounds
> >   */
> >  uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
> > diff --git a/treesource.c b/treesource.c
> > index bf648bf6..0e33e3e1 100644
> > --- a/treesource.c
> > +++ b/treesource.c
> > @@ -168,6 +168,7 @@ static struct marker **add_marker(struct marker **mi,
> >  	nm->offset = offset;
> >  	nm->ref = ref;
> >  	nm->next = *mi;
> > +	nm->is_local = 0;
> >  	*mi = nm;
> >  
> >  	return &nm->next;
> > -- 
> > 2.55.0
> > 
> >   
> 

Best regards,
Hervé
