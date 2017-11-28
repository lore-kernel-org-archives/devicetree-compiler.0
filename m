From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 2/2] Add support for YAML output
Date: Tue, 28 Nov 2017 11:57:10 +0000
Message-ID: <20171128115710.9267-3-grant.likely@arm.com>
References: <20171128115710.9267-1-grant.likely@arm.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2wzHtzKiMQn8H/FH4i9KFRKbZFqoNUgh+xbRHGj4n1A=;
        b=JhOJEQCKYGeudjVXHzv3bUPV/lGjF7V0KA6EPvWFop58n3Y6R1/8LPKqV8jkik35gC
         /Q7XgBOdwYJXbH7v7Uz8RRlw/h7lLSFRHEYfAal87VlvrXHQdnWG4/0HZNDbRXO/AXaJ
         4lOtmZlp5E9l2w8i2mDwUyTgsz2DUIwyswNcGDlGVcdaFlnq+yHN9S4RtWEGmUqw0bBX
         hHW8OvVOTE9iRnm+A8BdrQkUXKd8bLYgE1e5G16kSumu8ickShAr0ZwKenD8z2nAK+WV
         yAD4YpL32KPSNdGxC6kSRUoQZBv7epW4HSjVc+0zoebv6x6GF4rktOPPAlSKiUIUn2mW
         c1GA==
In-Reply-To: <20171128115710.9267-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

DO NOT MERGE! This is prototype code and the YAML encoding has not been
finalized yet.

Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/manual.txt |   2 +
 Makefile                 |   1 +
 Makefile.dtc             |   1 +
 dtc.c                    |   5 +
 dtc.h                    |   4 +
 yamltree.c               | 355 +++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 368 insertions(+)
 create mode 100644 yamltree.c

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 72403ac..5bedf05 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -78,6 +78,8 @@ The currently supported Output Formats are:
         then simply be added to your Makefile.  Additionally, the
         assembly file exports some symbols that can be used.
 
+     - "yaml": DT encoded in YAML
+
 
 3) Command Line
 
diff --git a/Makefile b/Makefile
index e1e138a..a1db301 100644
--- a/Makefile
+++ b/Makefile
@@ -35,6 +35,7 @@ INCLUDEDIR = $(PREFIX)/include
 HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
 	    sed -e 's/\(cygwin\|msys\).*/\1/')
 
+LDFLAGS = -L/usr/local/lib -lyaml
 ifeq ($(HOSTOS),darwin)
 SHAREDLIB_EXT     = dylib
 SHAREDLIB_CFLAGS  = -fPIC
diff --git a/Makefile.dtc b/Makefile.dtc
index bece49b..f97239d 100644
--- a/Makefile.dtc
+++ b/Makefile.dtc
@@ -8,6 +8,7 @@ DTC_SRCS = \
 	data.c \
 	dtc.c \
 	flattree.c \
+	yamltree.c \
 	fstree.c \
 	livetree.c \
 	srcpos.c \
diff --git a/dtc.c b/dtc.c
index c36994e..4926757 100644
--- a/dtc.c
+++ b/dtc.c
@@ -95,6 +95,7 @@ static const char * const usage_opts_help[] = {
 	"\n\tOutput formats are:\n"
 	 "\t\tdts - device tree source text\n"
 	 "\t\tdtb - device tree blob\n"
+	 "\t\tyaml - device tree encoded as YAML\n"
 	 "\t\tasm - assembler source",
 	"\n\tBlob version to produce, defaults to "stringify(DEFAULT_FDT_VERSION)" (for dtb and asm output)",
 	"\n\tOutput dependency file",
@@ -128,6 +129,8 @@ static const char *guess_type_by_name(const char *fname, const char *fallback)
 		return fallback;
 	if (!strcasecmp(s, ".dts"))
 		return "dts";
+	if (!strcasecmp(s, ".yaml"))
+		return "yaml";
 	if (!strcasecmp(s, ".dtb"))
 		return "dtb";
 	return fallback;
@@ -350,6 +353,8 @@ int main(int argc, char *argv[])
 
 	if (streq(outform, "dts")) {
 		dt_to_source(outf, dti);
+	} else if (streq(outform, "yaml")) {
+		dt_to_yaml(outf, dti);
 	} else if (streq(outform, "dtb")) {
 		dt_to_blob(outf, dti, outversion);
 	} else if (streq(outform, "asm")) {
diff --git a/dtc.h b/dtc.h
index 32a7655..8db4814 100644
--- a/dtc.h
+++ b/dtc.h
@@ -295,6 +295,10 @@ struct dt_info *dt_from_blob(const char *fname);
 void dt_to_source(FILE *f, struct dt_info *dti);
 struct dt_info *dt_from_source(const char *f);
 
+/* YAML source */
+
+void dt_to_yaml(FILE *f, struct dt_info *dti);
+
 /* FS trees */
 
 struct dt_info *dt_from_fs(const char *dirname);
diff --git a/yamltree.c b/yamltree.c
new file mode 100644
index 0000000..cfdc9f3
--- /dev/null
+++ b/yamltree.c
@@ -0,0 +1,355 @@
+/*
+ * (C) Copyright Arm Holdings.  2017
+ * (C) Copyright David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, IBM Corporation.  2005.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#include <stdlib.h>
+#include <yaml.h>
+#include "dtc.h"
+#include "srcpos.h"
+
+char *yaml_error_name[] = {
+	[YAML_NO_ERROR] = "no error",
+	[YAML_MEMORY_ERROR] = "memory error",
+	[YAML_READER_ERROR] = "reader error",
+	[YAML_SCANNER_ERROR] = "scanner error",
+	[YAML_PARSER_ERROR] = "parser error",
+	[YAML_COMPOSER_ERROR] = "composer error",
+	[YAML_WRITER_ERROR] = "writer error",
+	[YAML_EMITTER_ERROR] = "emitter error",
+};
+
+#define yaml_die(emitter) die("yaml '%s': %s in %s, line %i", yaml_error_name[(emitter)->error], (emitter)->problem, __func__, __LINE__)
+
+static void yaml_propval_ref(yaml_emitter_t *emitter, struct node *np, char *hint, bool phandle)
+{
+	yaml_event_t event;
+	struct label *l;
+	struct node *root = np;
+	char *ref = NULL;
+
+	while (root->parent)
+		root = root->parent;
+
+	/* If possible, use the hint string as the reference */
+	if (hint && np == get_node_by_ref(root, hint))
+		ref = hint;
+
+	/* Check if the node has a usable label */
+	if (!ref) {
+		for_each_label(np->labels, l) {
+			ref = l->label;
+			break;
+		}
+	}
+
+	if (!ref)
+		ref = np->fullpath;
+
+	yaml_scalar_event_initialize(&event, NULL,
+		(yaml_char_t *)(phandle ? "!phandle" : "!path"), (yaml_char_t*)ref,
+		strlen(ref), 0, 0, YAML_DOUBLE_QUOTED_SCALAR_STYLE);
+	if (!yaml_emitter_emit(emitter, &event))
+		yaml_die(emitter);
+}
+
+static void yaml_propval_int(yaml_emitter_t *emitter, const char *p, int len, int width)
+{
+	yaml_event_t event;
+	const char *end = p + len;
+	char buf[32];
+
+	assert(len % width == 0);
+	for (; p < end; p += width) {
+		switch(width) {
+		case 1:
+			sprintf(buf, "0x%"PRIx8, *(const uint8_t*)p);
+			break;
+		case 2:
+			sprintf(buf, "0x%"PRIx16, fdt16_to_cpu(*(const fdt16_t*)p));
+			break;
+		case 4:
+			sprintf(buf, "0x%"PRIx32, fdt32_to_cpu(*(const fdt32_t*)p));
+			break;
+		case 8:
+			sprintf(buf, "0x%"PRIx64, fdt64_to_cpu(*(const fdt64_t*)p));
+			break;
+		}
+
+		yaml_scalar_event_initialize(&event, NULL,
+			(yaml_char_t*)YAML_INT_TAG, (yaml_char_t *)buf,
+			strlen(buf), 1, 1, YAML_PLAIN_SCALAR_STYLE);
+		if (!yaml_emitter_emit(emitter, &event))
+			yaml_die(emitter);
+	}
+}
+
+static void yaml_propval_string(yaml_emitter_t *emitter, char *str, int len)
+{
+	yaml_event_t event;
+	int i;
+
+	assert(str[len-1] == '\0');
+
+	/* Make sure the entire string is in the lower 7-bit ascii range */
+	for (i = 0; i < len; i++) {
+		if (!isascii(str[i])) {
+			fprintf(stderr, "Warning: non-ASCII character(s) in property string\n");
+			yaml_propval_int(emitter, str, len, 1);
+			return;
+		}
+	}
+
+	yaml_scalar_event_initialize(&event, NULL,
+		(yaml_char_t *)YAML_STR_TAG, (yaml_char_t*)str,
+		len-1, 0, 1, YAML_DOUBLE_QUOTED_SCALAR_STYLE);
+	if (!yaml_emitter_emit(emitter, &event))
+		yaml_die(emitter);
+}
+
+static char *group_tags[NUM_MARKERS] = {
+	[MARKER_BLOB] = "!u8",
+	[MARKER_UINT8] = "!u8",
+	[MARKER_UINT16] = "!u16",
+	[MARKER_UINT32] = YAML_SEQ_TAG,
+	[MARKER_UINT16] = "!u64",
+};
+
+static void yaml_propval(yaml_emitter_t *emitter, struct node *root, struct property *prop)
+{
+	yaml_event_t event;
+	int len = prop->val.len;
+	struct marker *m = prop->val.markers;
+	struct marker dummy_marker = {
+		.offset = 0, .type = MARKER_NONE, .next = m, .ref = NULL
+	};
+	enum markertype emit_type = MARKER_NONE;
+	struct node *np;
+	cell_t phandle;
+	unsigned int nesting = 0;
+
+	/* Emit the property name */
+	yaml_scalar_event_initialize(&event, NULL,
+		(yaml_char_t *)YAML_STR_TAG, (yaml_char_t*)prop->name,
+		strlen(prop->name), 1, 1, YAML_PLAIN_SCALAR_STYLE);
+	if (!yaml_emitter_emit(emitter, &event))
+		yaml_die(emitter);
+
+	/* Boolean properties are easiest to deal with. Length is zero, so just emit 'true' */
+	if (len == 0) {
+		yaml_scalar_event_initialize(&event, NULL,
+			(yaml_char_t *)YAML_BOOL_TAG,
+			(yaml_char_t*)"true",
+			strlen("true"), 1, 0, YAML_PLAIN_SCALAR_STYLE);
+		if (!yaml_emitter_emit(emitter, &event))
+			yaml_die(emitter);
+		return;
+	}
+
+	dummy_marker.type = guess_propval_type(prop);
+	if (dummy_marker.type != MARKER_NONE)
+		m = &dummy_marker;
+
+	yaml_sequence_start_event_initialize(&event, NULL,
+		(yaml_char_t*)YAML_SEQ_TAG, 1, YAML_FLOW_SEQUENCE_STYLE);
+	if (!yaml_emitter_emit(emitter, &event))
+		yaml_die(emitter);
+	nesting++;
+
+	for_each_marker(m) {
+		size_t chunk_len = (m->next ? m->next->offset : len) - m->offset;
+		char *p = &prop->val.val[m->offset];
+
+		switch (m->type) {
+		case MARKER_NONE:
+			if (!nesting)
+				break;
+			yaml_sequence_end_event_initialize(&event);
+			if (!yaml_emitter_emit(emitter, &event))
+				yaml_die(emitter);
+			emit_type = MARKER_NONE;
+			nesting--;
+			break;
+		case MARKER_STRING:
+			emit_type = m->type;
+			break;
+		case MARKER_BLOB:
+		case MARKER_UINT8:
+		case MARKER_UINT16:
+		case MARKER_UINT32:
+		case MARKER_UINT64:
+			emit_type = m->type;
+			yaml_sequence_start_event_initialize(&event, NULL,
+				(yaml_char_t*)group_tags[emit_type], m->type == MARKER_UINT32, YAML_FLOW_SEQUENCE_STYLE);
+			if (!yaml_emitter_emit(emitter, &event))
+				yaml_die(emitter);
+			nesting++;
+			break;
+		case REF_PHANDLE:
+			assert(emit_type == MARKER_UINT32);
+			assert(chunk_len >= sizeof(fdt32_t));
+			phandle = fdt32_to_cpu(*(const fdt32_t*)p);
+			np = get_node_by_phandle(root, phandle);
+			if (np) {
+				yaml_propval_ref(emitter, np, NULL, true);
+				chunk_len -= sizeof(fdt32_t);
+				p += sizeof(fdt32_t);
+			}
+			break;
+		case REF_PATH:
+			assert(emit_type == MARKER_NONE);
+			assert(strnlen(p, chunk_len) == chunk_len - 1);
+			np = get_node_by_ref(root, p);
+			if (np) {
+				yaml_propval_ref(emitter, np, m->ref, false);
+				p += chunk_len;
+				chunk_len = 0;
+			}
+			break;
+		default:
+			break;
+		}
+
+		if (chunk_len == 0)
+			continue;
+
+		switch (emit_type) {
+			case MARKER_BLOB:
+			case MARKER_UINT8:
+				yaml_propval_int(emitter, p, chunk_len, 1);
+				break;
+			case MARKER_UINT16:
+				yaml_propval_int(emitter, p, chunk_len, 2);
+				break;
+			case MARKER_UINT32:
+				yaml_propval_int(emitter, p, chunk_len, 4);
+				break;
+			case MARKER_UINT64:
+				yaml_propval_int(emitter, p, chunk_len, 8);
+				break;
+			case MARKER_STRING:
+				yaml_propval_string(emitter, p, chunk_len);
+				break;
+			default:
+				break;
+		}
+	}
+
+	while (nesting) {
+		yaml_sequence_end_event_initialize(&event);
+		if (!yaml_emitter_emit(emitter, &event))
+			yaml_die(emitter);
+		nesting--;
+	}
+}
+
+
+static void yaml_tree(struct node *root, struct node *tree, yaml_emitter_t *emitter)
+{
+	struct property *prop;
+	struct node *child;
+	struct label *l;
+	yaml_event_t event;
+
+	if (tree->deleted)
+		return;
+
+	yaml_mapping_start_event_initialize(&event, NULL,
+		(yaml_char_t *)YAML_MAP_TAG, 1, YAML_ANY_MAPPING_STYLE);
+	if (!yaml_emitter_emit(emitter, &event))
+		yaml_die(emitter);
+
+	if (tree->labels) {
+		yaml_scalar_event_initialize(&event, NULL,
+			(yaml_char_t *)YAML_STR_TAG, (yaml_char_t*)"$labels",
+			strlen("$labels"), 1, 0, YAML_PLAIN_SCALAR_STYLE);
+		if (!yaml_emitter_emit(emitter, &event))
+			yaml_die(emitter);
+
+		yaml_sequence_start_event_initialize(&event, NULL,
+			(yaml_char_t*)YAML_SEQ_TAG, 1, YAML_FLOW_SEQUENCE_STYLE);
+		if (!yaml_emitter_emit(emitter, &event))
+			yaml_die(emitter);
+
+		for_each_label(tree->labels, l) {
+			yaml_scalar_event_initialize(&event, NULL,
+				(yaml_char_t *)YAML_STR_TAG, (yaml_char_t*)l->label,
+				strlen(l->label), 1, 0, YAML_PLAIN_SCALAR_STYLE);
+			if (!yaml_emitter_emit(emitter, &event))
+				yaml_die(emitter);
+		}
+
+		yaml_sequence_end_event_initialize(&event);
+		if (!yaml_emitter_emit(emitter, &event))
+			yaml_die(emitter);
+	}
+
+	for_each_property(tree, prop)
+		yaml_propval(emitter, root, prop);
+
+	/* Loop over all the children, emitting them into the map */
+	for_each_child(tree, child) {
+		yaml_scalar_event_initialize(&event, NULL,
+			(yaml_char_t *)YAML_STR_TAG, (yaml_char_t*)child->name,
+			strlen(child->name), 1, 0, YAML_PLAIN_SCALAR_STYLE);
+		if (!yaml_emitter_emit(emitter, &event))
+			yaml_die(emitter);
+		yaml_tree(root, child, emitter);
+	}
+
+	yaml_mapping_end_event_initialize(&event);
+	if (!yaml_emitter_emit(emitter, &event))
+		yaml_die(emitter);
+}
+
+void dt_to_yaml(FILE *f, struct dt_info *dti)
+{
+	yaml_emitter_t emitter;
+	yaml_event_t event;
+
+	yaml_emitter_initialize(&emitter);
+	yaml_emitter_set_output_file(&emitter, f);
+	yaml_stream_start_event_initialize(&event, YAML_UTF8_ENCODING);
+	if (!yaml_emitter_emit(&emitter, &event))
+		yaml_die(&emitter);
+
+	yaml_document_start_event_initialize(&event, NULL, NULL, NULL, 0);
+	if (!yaml_emitter_emit(&emitter, &event))
+		yaml_die(&emitter);
+
+	yaml_sequence_start_event_initialize(&event, NULL, (yaml_char_t *)YAML_SEQ_TAG, 1, YAML_ANY_SEQUENCE_STYLE);
+	if (!yaml_emitter_emit(&emitter, &event))
+		yaml_die(&emitter);
+
+	yaml_tree(dti->dt, dti->dt, &emitter);
+
+	yaml_sequence_end_event_initialize(&event);
+	if (!yaml_emitter_emit(&emitter, &event))
+		yaml_die(&emitter);
+
+	yaml_document_end_event_initialize(&event, 0);
+	if (!yaml_emitter_emit(&emitter, &event))
+		yaml_die(&emitter);
+
+	yaml_stream_end_event_initialize(&event);
+	if (!yaml_emitter_emit(&emitter, &event))
+		yaml_die(&emitter);
+
+	yaml_emitter_delete(&emitter);
+}
+
-- 
2.11.0
