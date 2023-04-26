From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] dtc: When compiling to dts interpret /__symbols__ and /__local_fixups__
Date: Wed, 26 Apr 2023 20:25:58 +0200
Message-ID: <20230426182558.573161-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=7401; i=u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; h=from:subject; bh=9swWHSv5r88hjK3C4zpACTFWSIIHCnUV6/v/1LBQrPs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkSWywmUoomBrHzKaLxovzpTIJExdLBOUru+MFe zj3Br4Ip5GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZElssAAKCRCPgPtYfRL+ Tu0TB/0eFMdf39epBUj97ZBX/Q26dODftEyP5kT6f4tKpGJnNztPR0ViAKL3QUFy7DZkRqyF0/5 tItf9+H/rSSaLHIUeQ+WcLcw2eZia163FeE1lgL/L+WjG6miLqPjKeao1RQ6t180pmWF4auCDJp 9gVWP3r4yqnz3dR72k1TqsZZwnAIH3pddRJtoMHhTTxqKHmRo76pfxvTtDjmMWrtNxlv4Sh+zj3 q9HhWgcTLNnZLbYMqGFuemkDRf731ohnH8/unQtWtZ8cSapHLxd485B4UVFkkNosTNjlNCU17TX MabfOtqLE7XaS9Vx/QqIp/sBELDzvQpuRjmsUw2MEKI16ASm
X-Developer-Key: i=u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The data contained in these nodes can be used to restore labels for nodes
(from __symbols__ if -@ is given) and to identify which data values are
references (from __local_fixups__ if -L is given).

The resulting dts doesn't necessarily compiles back into the bitwise same
dtb, but the result is equivalent and easier to modify without breaking
references.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+Ir=
Q@public.gmane.org>
---
 dtc.c        | 16 +++++++---
 dtc.h        |  2 ++
 livetree.c   | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 treesource.c | 37 +++++++++++++++------
 4 files changed, 132 insertions(+), 13 deletions(-)

diff --git a/dtc.c b/dtc.c
index d2e4e2b55b5c..e36f0dfad313 100644
--- a/dtc.c
+++ b/dtc.c
@@ -335,12 +335,20 @@ int main(int argc, char *argv[])
 	if (auto_label_aliases)
 		generate_label_tree(dti, "aliases", false);
=20
-	if (generate_symbols)
-		generate_label_tree(dti, "__symbols__", true);
+	if (generate_symbols) {
+		if (streq(inform, "fs") || streq(inform, "dtb"))
+			generate_labels_from_tree(dti, "__symbols__");
+		else
+			generate_label_tree(dti, "__symbols__", true);
+	}
=20
 	if (generate_fixups) {
-		generate_fixups_tree(dti, "__fixups__");
-		generate_local_fixups_tree(dti, "__local_fixups__");
+		if (streq(inform, "fs") || streq(inform, "dtb")) {
+			fixup_local_phandles(dti, "__local_fixups__");
+		} else {
+			generate_fixups_tree(dti, "__fixups__");
+			generate_local_fixups_tree(dti, "__local_fixups__");
+		}
 	}
=20
 	if (sort)
diff --git a/dtc.h b/dtc.h
index 4c4aaca1fc41..4c278ed30b26 100644
--- a/dtc.h
+++ b/dtc.h
@@ -337,8 +337,10 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct node *tree, uint32_t boot_cpuid_phys);
 void sort_tree(struct dt_info *dti);
 void generate_label_tree(struct dt_info *dti, const char *name, bool alloc=
ph);
+void generate_labels_from_tree(struct dt_info *dti, const char *name);
 void generate_fixups_tree(struct dt_info *dti, const char *name);
 void generate_local_fixups_tree(struct dt_info *dti, const char *name);
+void fixup_local_phandles(struct dt_info *dti, const char *name);
=20
 /* Checks */
=20
diff --git a/livetree.c b/livetree.c
index 0ec47ed41e2b..a4fa5278718e 100644
--- a/livetree.c
+++ b/livetree.c
@@ -1056,6 +1056,25 @@ void generate_label_tree(struct dt_info *dti, const =
char *name, bool allocph)
 				     dti->dt, allocph);
 }
=20
+void generate_labels_from_tree(struct dt_info *dti, const char *name)
+{
+	struct node *an;
+	struct property *p;
+
+	an =3D get_subnode(dti->dt, name);
+	if (!an)
+		return;
+
+	for_each_property(an, p) {
+		struct node *labeled_node;
+
+		labeled_node =3D get_node_by_path(dti->dt, p->val.val);
+		add_label(&labeled_node->labels, p->name);
+	}
+
+	delete_node(an);
+}
+
 void generate_fixups_tree(struct dt_info *dti, const char *name)
 {
 	if (!any_fixup_tree(dti, dti->dt))
@@ -1071,3 +1090,74 @@ void generate_local_fixups_tree(struct dt_info *dti,=
 const char *name)
 	generate_local_fixups_tree_internal(dti, build_root_node(dti->dt, name),
 					    dti->dt);
 }
+
+static void fixup_local_phandles_node(struct node *lf, struct node *n)
+{
+	struct property *lfp;
+	struct node *lfsubnode;
+
+	for_each_property(lf, lfp) {
+		struct property *p =3D get_property(n, lfp->name);
+		size_t i;
+
+		if (!p || p->val.len % sizeof(fdt32_t))
+			die("invalid length of property %s in node %s\n", lfp->name, lf->fullpa=
th);
+
+		for (i =3D 0; i < lfp->val.len; i +=3D sizeof(fdt32_t)) {
+			struct marker *m, **mi;
+
+			m =3D xmalloc(sizeof(*m));
+			m->offset =3D fdt32_to_cpu(*(fdt32_t *)(lfp->val.val + i));
+			m->type =3D REF_PHANDLE;
+			m->ref =3D NULL;
+
+			/* keep the list sorted in ascending ->offset order */
+			for (mi =3D &p->val.markers; *mi && (*mi)->offset < m->offset;)
+				mi =3D &(*mi)->next;
+
+			m->next =3D *mi;
+			*mi =3D m;
+		}
+	}
+
+	for_each_child(lf, lfsubnode) {
+		struct node *subnode =3D get_subnode(n, lfsubnode->name);
+
+		if (!subnode)
+			die("fixup for non-existent node in %s\n", lfsubnode->fullpath);
+
+		fixup_local_phandles_node(lfsubnode, subnode);
+	}
+}
+
+static void drop_phandles(struct node *n)
+{
+	struct property *p;
+	struct node *sn;
+
+	p =3D get_property(n, "phandle");
+	if (p)
+		delete_property(p);
+
+	p =3D get_property(n, "linux,phandle");
+	if (p)
+		delete_property(p);
+
+	for_each_child(n, sn)
+		drop_phandles(sn);
+}
+
+void fixup_local_phandles(struct dt_info *dti, const char *name)
+{
+	struct node *an;
+
+	an =3D get_subnode(dti->dt, name);
+	if (!an)
+		return;
+
+	fixup_local_phandles_node(an, dti->dt);
+
+	drop_phandles(dti->dt);
+
+	delete_node(an);
+}
diff --git a/treesource.c b/treesource.c
index de30188189fb..32f3171c14c3 100644
--- a/treesource.c
+++ b/treesource.c
@@ -172,7 +172,7 @@ static enum markertype guess_value_type(struct property=
 *prop)
 	return TYPE_UINT8;
 }
=20
-static void write_propval(FILE *f, struct property *prop)
+static void write_propval(FILE *f, struct node *root, struct property *pro=
p)
 {
 	size_t len =3D prop->val.len;
 	struct marker *m =3D prop->val.markers;
@@ -219,6 +219,9 @@ static void write_propval(FILE *f, struct property *pro=
p)
 		if (emit_type =3D=3D TYPE_NONE || chunk_len =3D=3D 0)
 			continue;
=20
+		if (m->offset !=3D 0)
+			fputc(' ', f);
+
 		switch(emit_type) {
 		case TYPE_UINT16:
 			write_propval_int(f, p, chunk_len, 2);
@@ -230,10 +233,26 @@ static void write_propval(FILE *f, struct property *p=
rop)
 					break;
=20
 			if (m_phandle) {
-				if (m_phandle->ref[0] =3D=3D '/')
-					fprintf(f, "&{%s}", m_phandle->ref);
-				else
-					fprintf(f, "&%s", m_phandle->ref);
+				if (m_phandle->ref) {
+					if (m_phandle->ref[0] =3D=3D '/')
+						fprintf(f, "&{%s}", m_phandle->ref);
+					else
+						fprintf(f, "&%s", m_phandle->ref);
+				} else {
+					cell_t phandle =3D fdt32_to_cpu(*(const fdt32_t *)p);
+					struct node *n =3D get_node_by_phandle(root, phandle);
+
+					if (!n) {
+						fprintf(f, "&??");
+					} else {
+						if (n->labels) {
+							fprintf(f, "&%s", n->labels->label);
+						} else {
+							fprintf(f, "&{%s}", n->fullpath);
+						}
+					}
+
+				}
 				if (chunk_len > 4) {
 					fputc(' ', f);
 					write_propval_int(f, p + 4, chunk_len - 4, 4);
@@ -270,7 +289,7 @@ static void write_propval(FILE *f, struct property *pro=
p)
 	fprintf(f, "\n");
 }
=20
-static void write_tree_source_node(FILE *f, struct node *tree, int level)
+static void write_tree_source_node(FILE *f, struct node *root, struct node=
 *tree, int level)
 {
 	struct property *prop;
 	struct node *child;
@@ -299,11 +318,11 @@ static void write_tree_source_node(FILE *f, struct no=
de *tree, int level)
 		for_each_label(prop->labels, l)
 			fprintf(f, "%s: ", l->label);
 		fprintf(f, "%s", prop->name);
-		write_propval(f, prop);
+		write_propval(f, root, prop);
 	}
 	for_each_child(tree, child) {
 		fprintf(f, "\n");
-		write_tree_source_node(f, child, level+1);
+		write_tree_source_node(f, root, child, level+1);
 	}
 	write_prefix(f, level);
 	fprintf(f, "};");
@@ -333,5 +352,5 @@ void dt_to_source(FILE *f, struct dt_info *dti)
 			(unsigned long long)re->size);
 	}
=20
-	write_tree_source_node(f, dti->dt, 0);
+	write_tree_source_node(f, dti->dt, dti->dt, 0);
 }
--=20
2.39.2

