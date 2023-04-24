From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] dtc: Add an option to generate __local_fixups__
Date: Mon, 24 Apr 2023 18:10:07 +0200
Message-ID: <20230424161007.104212-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This happens implicitly for dts files with a /plugin/ tag.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+Ir=
Q@public.gmane.org>
---
 Documentation/manual.txt | 5 +++++
 dtc.c                    | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 15a7837d3cef..94dafb8ace6b 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -126,6 +126,11 @@ Options:
 	property for each label. The property's name is the label name and the
 	value is the path of the labeled node.
=20
+    -L
+	Generates a __local_fixups__ node at the root node. For each property
+	that contains a phandle, the __local_fixups__ node contains a property
+	(at path __local_fixups__/$a if $a is the path of the node). It's value
+	is a list of offsets that are phandle values.
=20
     -A
 	Generate automatically aliases for all node labels. This is similar to
diff --git a/dtc.c b/dtc.c
index bc786c543b7e..d2e4e2b55b5c 100644
--- a/dtc.c
+++ b/dtc.c
@@ -47,7 +47,7 @@ static void fill_fullpaths(struct node *tree, const char =
*prefix)
=20
 /* Usage related data. */
 static const char usage_synopsis[] =3D "dtc [options] <input file>";
-static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@=
AThv";
+static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@=
LAThv";
 static struct option const usage_long_opts[] =3D {
 	{"quiet",            no_argument, NULL, 'q'},
 	{"in-format",         a_argument, NULL, 'I'},
@@ -67,6 +67,7 @@ static struct option const usage_long_opts[] =3D {
 	{"warning",           a_argument, NULL, 'W'},
 	{"error",             a_argument, NULL, 'E'},
 	{"symbols",	     no_argument, NULL, '@'},
+	{"local-fixups",     no_argument, NULL, 'L'},
 	{"auto-alias",       no_argument, NULL, 'A'},
 	{"annotate",         no_argument, NULL, 'T'},
 	{"help",             no_argument, NULL, 'h'},
@@ -252,6 +253,11 @@ int main(int argc, char *argv[])
 		case '@':
 			generate_symbols =3D 1;
 			break;
+
+		case 'L':
+			generate_fixups =3D 1;
+			break;
+
 		case 'A':
 			auto_label_aliases =3D 1;
 			break;

base-commit: 2cdf93a6d402a161edf16de6011bd5ad76382e92
prerequisite-patch-id: a819463d7047680b5865233f136e35ac3e3d4ee9
--=20
2.39.2

