From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] Preserve datatype information when parsing dts
Date: Tue, 12 Dec 2017 17:14:09 +1100
Message-ID: <20171212061409.GO2226@umbus.fritz.box>
References: <20171128115710.9267-1-grant.likely@arm.com>
 <20171128115710.9267-2-grant.likely@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ncX6roZrNNHXnAbh"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1513059258;
        bh=hOzE7NAzdKNvoNsqDDsfMoq0AD8/n7R01rAZtqf6iNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JIXP2k7ZYnMVE4YmktJcafnYL1wURCFv5dK2rZ/pTjRMK3HQt4D2/BuuinZDHxWK9
         ynAchIS/Rb2AOMEy79PTp0jXrUrlvJy9q1NffzEpBzQtoCTZ1mRyhozL+LkZPS222q
         0BxE6G3IJCksB0ZNTjQXmyHVyZM7IkPjdybbBLc8=
Content-Disposition: inline
In-Reply-To: <20171128115710.9267-2-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>


--ncX6roZrNNHXnAbh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 11:57:09AM +0000, Grant Likely wrote:
> The current code throws away all the data type and grouping information
> when parsing the DTS source file, which makes it difficult to
> reconstruct the data format when emitting a format that can express data
> types (ie. dts and yaml). Use the marker list to mark the beginning and
> end of each integer array block (<> and []), the datatype contained in
> each (8, 16, 32 & 64 bit widths), and the start of each string.
>=20
> At the same time, factor out the heuristic code used to guess a property
> type at emit time. It is a pretty well defined standalone block that
> could be used elsewhere, for instance, when emitting YAML source. Factor
> it out into a separate function so that it can be reused, and also to
> simplify the write_propval() function.
>=20
> When emitting, group integer output back into the same groups as the
> original source and use the REF_PATH and REF_PHANDLE markers to emit the
> the node reference instead of a raw path or phandle.
>=20
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

I'm a bit dubious how well forcing the marker mechanism to do all this
stuff it was never intended for can work in the long term.  Still,
it's an interesting experiment.

> ---
>  data.c       |   4 +-
>  dtc-parser.y |  21 +++--
>  dtc.h        |   9 +++
>  livetree.c   |  49 ++++++++++++
>  treesource.c | 249 ++++++++++++++++++++++++++++++++---------------------=
------
>  5 files changed, 212 insertions(+), 120 deletions(-)
>=20
> diff --git a/data.c b/data.c
> index aa37a16..0aef0b5 100644
> --- a/data.c
> +++ b/data.c
> @@ -74,7 +74,8 @@ struct data data_copy_escape_string(const char *s, int =
len)
>  	struct data d;
>  	char *q;
> =20
> -	d =3D data_grow_for(empty_data, len + 1);
> +	d =3D data_add_marker(empty_data, MARKER_STRING, NULL);
> +	d =3D data_grow_for(d, len + 1);
> =20
>  	q =3D d.val;
>  	while (i < len) {
> @@ -94,6 +95,7 @@ struct data data_copy_file(FILE *f, size_t maxlen)
>  {
>  	struct data d =3D empty_data;
> =20
> +	d =3D data_add_marker(d, MARKER_BLOB, NULL);
>  	while (!feof(f) && (d.len < maxlen)) {
>  		size_t chunksize, ret;
> =20
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 44af170..41fbd3f 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -266,11 +266,13 @@ propdata:
>  		}
>  	| propdataprefix arrayprefix '>'
>  		{
> -			$$ =3D data_merge($1, $2.data);
> +			$1 =3D data_merge($1, $2.data);
> +			$$ =3D data_add_marker($1, MARKER_NONE, NULL);
>  		}
>  	| propdataprefix '[' bytestring ']'
>  		{
> -			$$ =3D data_merge($1, $3);
> +			$1 =3D data_merge($1, $3);
> +			$$ =3D data_add_marker($1, MARKER_NONE, NULL);
>  		}
>  	| propdataprefix DT_REF
>  		{
> @@ -327,22 +329,27 @@ arrayprefix:
>  	DT_BITS DT_LITERAL '<'
>  		{
>  			unsigned long long bits;
> +			enum markertype type =3D MARKER_UINT32;
> =20
>  			bits =3D $2;
> =20
> -			if ((bits !=3D  8) && (bits !=3D 16) &&
> -			    (bits !=3D 32) && (bits !=3D 64)) {
> +			switch (bits) {
> +			case 8: type =3D MARKER_UINT8; break;
> +			case 16: type =3D MARKER_UINT16; break;
> +			case 32: type =3D MARKER_UINT32; break;
> +			case 64: type =3D MARKER_UINT64; break;
> +			default:
>  				ERROR(&@2, "Array elements must be"
>  				      " 8, 16, 32 or 64-bits");
>  				bits =3D 32;
>  			}
> =20
> -			$$.data =3D empty_data;
> +			$$.data =3D data_add_marker(empty_data, type, NULL);
>  			$$.bits =3D bits;
>  		}
>  	| '<'
>  		{
> -			$$.data =3D empty_data;
> +			$$.data =3D data_add_marker(empty_data, MARKER_UINT32, NULL);
>  			$$.bits =3D 32;
>  		}
>  	| arrayprefix integer_prim
> @@ -486,7 +493,7 @@ integer_unary:
>  bytestring:
>  	  /* empty */
>  		{
> -			$$ =3D empty_data;
> +			$$ =3D data_add_marker(empty_data, MARKER_UINT8, NULL);
>  		}
>  	| bytestring DT_BYTE
>  		{
> diff --git a/dtc.h b/dtc.h
> index 3b18a42..32a7655 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -74,9 +74,17 @@ typedef uint32_t cell_t;
> =20
>  /* Data blobs */
>  enum markertype {
> +	MARKER_NONE =3D 0,
>  	REF_PHANDLE,
>  	REF_PATH,
>  	LABEL,
> +	MARKER_UINT8,
> +	MARKER_UINT16,
> +	MARKER_UINT32,
> +	MARKER_UINT64,
> +	MARKER_BLOB,
> +	MARKER_STRING,
> +	NUM_MARKERS,
>  };
> =20
>  struct  marker {
> @@ -198,6 +206,7 @@ struct property *build_property(char *name, struct da=
ta val);
>  struct property *build_property_delete(char *name);
>  struct property *chain_property(struct property *first, struct property =
*list);
>  struct property *reverse_properties(struct property *first);
> +enum markertype guess_propval_type(struct property *prop);
> =20
>  struct node *build_node(struct property *proplist, struct node *children=
);
>  struct node *build_node_delete(void);
> diff --git a/livetree.c b/livetree.c
> index 57b7db2..1bbdaf8 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -336,6 +336,55 @@ void append_to_property(struct node *node,
>  	}
>  }
> =20
> +static bool isstring(char c)
> +{
> +	return (isprint((unsigned char)c)
> +		|| (c =3D=3D '\0')
> +		|| strchr("\a\b\t\n\v\f\r", c));
> +}
> +
> +enum markertype guess_propval_type(struct property *prop)
> +{
> +	int len =3D prop->val.len;
> +	const char *p =3D prop->val.val;
> +	struct marker *m =3D prop->val.markers;
> +	int nnotstring =3D 0, nnul =3D 0;
> +	int nnotstringlbl =3D 0, nnotcelllbl =3D 0;
> +	int i;
> +
> +	/* Check if the property is type annotated */
> +	while (m && (m->type =3D=3D LABEL || m->type =3D=3D REF_PHANDLE))
> +		m =3D m->next;
> +	if (m && m->offset =3D=3D 0)
> +		return MARKER_NONE;
> +	m =3D prop->val.markers;
> +
> +	/* data type information missing, need to guess */
> +	for (i =3D 0; i < len; i++) {
> +		if (! isstring(p[i]))
> +			nnotstring++;
> +		if (p[i] =3D=3D '\0')
> +			nnul++;
> +	}
> +
> +	for_each_marker_of_type(m, LABEL) {
> +		if ((m->offset > 0) && (prop->val.val[m->offset - 1] !=3D '\0'))
> +			nnotstringlbl++;
> +		if ((m->offset % sizeof(cell_t)) !=3D 0)
> +			nnotcelllbl++;
> +	}
> +
> +	if ((p[len-1] =3D=3D '\0') && (nnotstring =3D=3D 0) && (nnul < (len-nnu=
l))
> +	    && (nnotstringlbl =3D=3D 0)) {
> +		return MARKER_STRING;
> +	} else if (((len % sizeof(cell_t)) =3D=3D 0) && (nnotcelllbl =3D=3D 0))=
 {
> +		return MARKER_UINT32;
> +	} else {
> +		return MARKER_UINT8;
> +	}
> +}
> +
>  struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
>  {
>  	struct reserve_info *new =3D xmalloc(sizeof(*new));
> diff --git a/treesource.c b/treesource.c
> index 2461a3d..cc3b223 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -54,29 +54,15 @@ static void write_prefix(FILE *f, int level)
>  		fputc('\t', f);
>  }
> =20
> -static bool isstring(char c)
> +static void write_propval_string(FILE *f, const char *str, size_t len)
>  {
> -	return (isprint((unsigned char)c)
> -		|| (c =3D=3D '\0')
> -		|| strchr("\a\b\t\n\v\f\r", c));
> -}
> -
> -static void write_propval_string(FILE *f, struct data val)
> -{
> -	const char *str =3D val.val;
>  	int i;
> -	struct marker *m =3D val.markers;
> =20
> -	assert(str[val.len-1] =3D=3D '\0');
> +	assert(str[len-1] =3D=3D '\0');
> =20
> -	while (m && (m->offset =3D=3D 0)) {
> -		if (m->type =3D=3D LABEL)
> -			fprintf(f, "%s: ", m->ref);
> -		m =3D m->next;
> -	}
>  	fprintf(f, "\"");
> =20
> -	for (i =3D 0; i < (val.len-1); i++) {
> +	for (i =3D 0; i < (len-1); i++) {
>  		char c =3D str[i];
> =20
>  		switch (c) {
> @@ -108,15 +94,7 @@ static void write_propval_string(FILE *f, struct data=
 val)
>  			fprintf(f, "\\\"");
>  			break;
>  		case '\0':
> -			fprintf(f, "\", ");
> -			while (m && (m->offset <=3D (i + 1))) {
> -				if (m->type =3D=3D LABEL) {
> -					assert(m->offset =3D=3D (i+1));
> -					fprintf(f, "%s: ", m->ref);
> -				}
> -				m =3D m->next;
> -			}
> -			fprintf(f, "\"");
> +			fprintf(f, "\", \"");
>  			break;
>  		default:
>  			if (isprint((unsigned char)c))
> @@ -126,114 +104,161 @@ static void write_propval_string(FILE *f, struct =
data val)
>  		}
>  	}
>  	fprintf(f, "\"");
> -
> -	/* Wrap up any labels at the end of the value */
> -	for_each_marker_of_type(m, LABEL) {
> -		assert (m->offset =3D=3D val.len);
> -		fprintf(f, " %s:", m->ref);
> -	}
>  }
> =20
> -static void write_propval_cells(FILE *f, struct data val)
> +static void write_propval_ref(FILE *f, struct node *np, const char *hint)
>  {
> -	void *propend =3D val.val + val.len;
> -	fdt32_t *cp =3D (fdt32_t *)val.val;
> -	struct marker *m =3D val.markers;
> -
> -	fprintf(f, "<");
> -	for (;;) {
> -		while (m && (m->offset <=3D ((char *)cp - val.val))) {
> -			if (m->type =3D=3D LABEL) {
> -				assert(m->offset =3D=3D ((char *)cp - val.val));
> -				fprintf(f, "%s: ", m->ref);
> -			}
> -			m =3D m->next;
> -		}
> +	struct label *l;
> +	struct node *root =3D np;
> =20
> -		fprintf(f, "0x%x", fdt32_to_cpu(*cp++));
> -		if ((void *)cp >=3D propend)
> -			break;
> -		fprintf(f, " ");
> -	}
> +	while (root->parent)
> +		root =3D root->parent;
> =20
> -	/* Wrap up any labels at the end of the value */
> -	for_each_marker_of_type(m, LABEL) {
> -		assert (m->offset =3D=3D val.len);
> -		fprintf(f, " %s:", m->ref);
> +	/* If possible, use the hint string as the reference */
> +	if (hint && np =3D=3D get_node_by_ref(root, hint)) {
> +		fprintf(f, hint[0] =3D=3D '/' ? " &{%s}" : " &%s", hint);
> +		return;
>  	}
> -	fprintf(f, ">");
> -}
> -
> -static void write_propval_bytes(FILE *f, struct data val)
> -{
> -	void *propend =3D val.val + val.len;
> -	const char *bp =3D val.val;
> -	struct marker *m =3D val.markers;
> -
> -	fprintf(f, "[");
> -	for (;;) {
> -		while (m && (m->offset =3D=3D (bp-val.val))) {
> -			if (m->type =3D=3D LABEL)
> -				fprintf(f, "%s: ", m->ref);
> -			m =3D m->next;
> -		}
> =20
> -		fprintf(f, "%02hhx", (unsigned char)(*bp++));
> -		if ((const void *)bp >=3D propend)
> -			break;
> -		fprintf(f, " ");
> +	/* Check if the node has a usable label */
> +	for_each_label(np->labels, l) {
> +		fprintf(f, " &%s", l->label);
> +		return;
>  	}
> =20
> -	/* Wrap up any labels at the end of the value */
> -	for_each_marker_of_type(m, LABEL) {
> -		assert (m->offset =3D=3D val.len);
> -		fprintf(f, " %s:", m->ref);
> -	}
> -	fprintf(f, "]");
> +	fprintf(f, " &{%s}", np->fullpath);
>  }
> =20
> -static void write_propval(FILE *f, struct property *prop)
> +const char * delim_start[NUM_MARKERS] =3D {
> +	[MARKER_BLOB] =3D "[",
> +	[MARKER_UINT8] =3D "[",
> +	[MARKER_UINT16] =3D "/bits/ 16 <",
> +	[MARKER_UINT32] =3D "<",
> +	[MARKER_UINT64] =3D "/bits/ 64 <",
> +};
> +const char * delim_end[NUM_MARKERS] =3D {
> +	[MARKER_BLOB] =3D " ]",
> +	[MARKER_UINT8] =3D " ]",
> +	[MARKER_UINT16] =3D " >",
> +	[MARKER_UINT32] =3D " >",
> +	[MARKER_UINT64] =3D " >",
> +};
> +static void write_propval(FILE *f, struct node *root, struct property *p=
rop)
>  {
> -	int len =3D prop->val.len;
> -	const char *p =3D prop->val.val;
> +	size_t len =3D prop->val.len;
> +	size_t chunk_len;
>  	struct marker *m =3D prop->val.markers;
> -	int nnotstring =3D 0, nnul =3D 0;
> -	int nnotstringlbl =3D 0, nnotcelllbl =3D 0;
> -	int i;
> +	struct marker dummy_marker =3D {
> +		.offset =3D 0, .type =3D MARKER_NONE, .next =3D m, .ref =3D NULL
> +	};
> +	enum markertype emit_type =3D MARKER_NONE;
> +	struct node *np;
> +	cell_t phandle;
> =20
>  	if (len =3D=3D 0) {
>  		fprintf(f, ";\n");
>  		return;
>  	}
> =20
> -	for (i =3D 0; i < len; i++) {
> -		if (! isstring(p[i]))
> -			nnotstring++;
> -		if (p[i] =3D=3D '\0')
> -			nnul++;
> -	}
> +	fprintf(f, " =3D ");
> =20
> -	for_each_marker_of_type(m, LABEL) {
> -		if ((m->offset > 0) && (prop->val.val[m->offset - 1] !=3D '\0'))
> -			nnotstringlbl++;
> -		if ((m->offset % sizeof(cell_t)) !=3D 0)
> -			nnotcelllbl++;
> -	}
> +	dummy_marker.type =3D guess_propval_type(prop);
> +	if (dummy_marker.type !=3D MARKER_NONE)
> +		m =3D &dummy_marker;
> =20
> -	fprintf(f, " =3D ");
> -	if ((p[len-1] =3D=3D '\0') && (nnotstring =3D=3D 0) && (nnul < (len-nnu=
l))
> -	    && (nnotstringlbl =3D=3D 0)) {
> -		write_propval_string(f, prop->val);
> -	} else if (((len % sizeof(cell_t)) =3D=3D 0) && (nnotcelllbl =3D=3D 0))=
 {
> -		write_propval_cells(f, prop->val);
> -	} else {
> -		write_propval_bytes(f, prop->val);
> +	for_each_marker(m) {
> +		chunk_len =3D (m->next ? m->next->offset : len) - m->offset;
> +		const char *p =3D &prop->val.val[m->offset];
> +		const char *end =3D p + chunk_len;
> +
> +		switch(m->type) {
> +		case MARKER_NONE:
> +			if (emit_type !=3D MARKER_NONE)
> +				fprintf(f, "%s", delim_end[emit_type]);
> +			emit_type =3D m->type;
> +			break;
> +		case MARKER_STRING:
> +		case MARKER_BLOB:
> +		case MARKER_UINT8:
> +		case MARKER_UINT16:
> +		case MARKER_UINT32:
> +		case MARKER_UINT64:
> +			emit_type =3D m->type;
> +			fprintf(f, m->offset ? ", %s" : "%s",
> +			           delim_start[emit_type] ? : "");
> +			break;
> +		case LABEL:
> +			fprintf(f, " %s:", m->ref);
> +			break;
> +		case REF_PHANDLE:
> +			assert(emit_type =3D=3D MARKER_UINT32);
> +			assert(chunk_len >=3D sizeof(fdt32_t));
> +			phandle =3D fdt32_to_cpu(*(const fdt32_t*)p);
> +			np =3D get_node_by_phandle(root, phandle);
> +			if (np) {
> +				write_propval_ref(f, np, NULL);
> +				chunk_len -=3D sizeof(fdt32_t);
> +				p +=3D sizeof(fdt32_t);
> +			}
> +			break;
> +		case REF_PATH:
> +			assert(emit_type =3D=3D MARKER_NONE);
> +			assert(strnlen(p, chunk_len) =3D=3D chunk_len - 1);
> +			np =3D get_node_by_ref(root, p);
> +			if (np) {
> +				write_propval_ref(f, np, m->ref);
> +				p +=3D chunk_len;
> +				chunk_len =3D 0;
> +			}
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		if (chunk_len <=3D 0)
> +			continue;
> +
> +		switch (emit_type) {
> +		case MARKER_BLOB:
> +		case MARKER_UINT8:
> +			for (; p < end; p++)
> +				fprintf(f, " %02"PRIx8, *(const uint8_t *)p);
> +			break;
> +		case MARKER_UINT16:
> +			assert((chunk_len % sizeof(fdt16_t)) =3D=3D 0);
> +			for (; p < end; p +=3D sizeof(fdt16_t))
> +				fprintf(f, " 0x%02"PRIx16,
> +				        fdt16_to_cpu(*(const fdt16_t*)p));
> +			break;
> +		case MARKER_UINT32:
> +			assert((chunk_len % sizeof(fdt32_t)) =3D=3D 0);
> +			for (; p < end; p +=3D sizeof(fdt32_t))
> +				fprintf(f, " 0x%02"PRIx32,
> +				        fdt32_to_cpu(*(const fdt32_t*)p));
> +			break;
> +		case MARKER_UINT64:
> +			assert((chunk_len % sizeof(fdt64_t)) =3D=3D 0);
> +			for (; p < end; p +=3D sizeof(fdt64_t))
> +				fprintf(f, " 0x%02"PRIx64,
> +				        fdt64_to_cpu(*(const fdt64_t*)p));
> +			break;
> +		case MARKER_STRING:
> +			assert(p[chunk_len-1] =3D=3D '\0');
> +			write_propval_string(f, p, chunk_len);
> +			break;
> +		default:
> +			/* Default to a block of raw bytes */
> +			fprintf(f, "[ ");
> +			for (; p < end; p++)
> +				fprintf(f, " %02"PRIx8, *p);
> +			fprintf(f, "]");
> +		}
>  	}
> =20
> -	fprintf(f, ";\n");
> +	fprintf(f, "%s;\n", delim_end[emit_type] ? : "");
>  }
> =20
> -static void write_tree_source_node(FILE *f, struct node *tree, int level)
> +static void write_tree_source_node(FILE *f, struct node *root, struct no=
de *tree, int level)
>  {
>  	struct property *prop;
>  	struct node *child;
> @@ -252,11 +277,11 @@ static void write_tree_source_node(FILE *f, struct =
node *tree, int level)
>  		for_each_label(prop->labels, l)
>  			fprintf(f, "%s: ", l->label);
>  		fprintf(f, "%s", prop->name);
> -		write_propval(f, prop);
> +		write_propval(f, root, prop);
>  	}
>  	for_each_child(tree, child) {
>  		fprintf(f, "\n");
> -		write_tree_source_node(f, child, level+1);
> +		write_tree_source_node(f, root, child, level+1);
>  	}
>  	write_prefix(f, level);
>  	fprintf(f, "};\n");
> @@ -279,6 +304,6 @@ void dt_to_source(FILE *f, struct dt_info *dti)
>  			(unsigned long long)re->size);
>  	}
> =20
> -	write_tree_source_node(f, dti->dt, 0);
> +	write_tree_source_node(f, dti->dt, dti->dt, 0);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ncX6roZrNNHXnAbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlovc64ACgkQbDjKyiDZ
s5Ju7g/+NiPFTlLFCDxnzry24KTep9hkG5b48pweRIKb8ayyEm2DocL9NXcXEUSX
PbTV91QYPNtcJAAhH7vf9q8ULpkdKRAcV8l49rA8iMwSkX1puxBs3TsdNki6SRK8
2yk0nEpFx4J0qMlIXa9N7V7bdEB1NQU2mbvoivyGxn5vQhY+x3kQkb5nDRgjKeLJ
yTlS86DPR5sWCWm4hRzfpZGgpwn3aW+fkyiFpeSJncIEfZf2w00H9bG0T6M8bZMo
jYXRAZz8vMKjnDDC3pQb0zWSduduKDn/HMOjNuYvR5Z4nb/yjjPwYN1D6pPlO+Zg
n+jjOYLIcWLV9VkfmRXmUKDGRN/KQgp6qZ2F/PAZJ/c1z0QgtXy2HHF1N9QyODyF
cqM6N1L+r7r+RkhNh/Urua80H4/cpI3RAgLRkRpAxBQlYqZszOwnDvsv9oCjr+91
WTb9T+v2kHSMaOJpHh2bkNO+l7950HNrrpon1WkXl8Cexdd2Ucm35TFsBJe6GtpY
ERvJIq9wmuKaqAAoaKMb35/XeOpJ5NZUCNHRZ46XflMjGNFm3hS1FPu4VkxzMyam
QJt6MgbDzRzhOUe3TKkU6xOpjBY0W9QYRW60QxAIYhZI6teX3dNinw+zCnVZOxJC
KJ9J1xIafMLd/HzFdGi8BiqfHSf5ANoVDoaAuHcGiYUt4ufw9U0=
=kah2
-----END PGP SIGNATURE-----

--ncX6roZrNNHXnAbh--
