From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] dtc: Add an option to generate __local_fixups__ and __fixups__
Date: Mon, 22 May 2023 10:16:29 +0200
Message-ID: <20230522081629.385489-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; h=from:subject; bh=34D6kX0s1CEg6AAdIIvUjmWGGsbWJ45Rz3LPgvebVAY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkayTcGG4Sqd8w6txBo9FGBXgThWLW6dzYAteYt IeRkiDSfTCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGsk3AAKCRCPgPtYfRL+ Tq6rB/4gToyU6x0jU5nA6zUu29hMhBvBCdrYlACGsTxlOSZepsGPAioPT4ZU22WWZTOTME/pwoT nVgZgEnv8YBPqAO6SL7JktJJIgQr2z1jPz9B2SEzPWkMMgXt0RsVBQ/UOUzPYmQWQYrorHoijhO /iYQEngqI6IBUEVeN6tj/y897cXWarXnpAKHRKc37LQmR+axy1ZZGive15Sm0Aq79m0yZ89We7z LXYY5yfq4ejdoMaKMLB32irIqa6UKCYf8v1O83s6KXWTIzEPNmQ/OhyCzpt0Upb5DIPzmPV+0Yr 8bG89p0hT1O5MBsPgJu654TqZXqSSNmiVuBQI/EmLSvtV2KC
X-Developer-Key: i=u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, entwicklung-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org

This happens implicitly for dts files with a /plugin/ tag.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+Ir=
Q@public.gmane.org>
---
 Documentation/manual.txt | 14 ++++++++++++++
 dtc.c                    |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 15a7837d3cef..598c6e694c55 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -126,6 +126,20 @@ Options:
 	property for each label. The property's name is the label name and the
 	value is the path of the labeled node.
=20
+    -L
+	Possibly generates a __local_fixups__ and a __fixups__ node at the root n=
ode.
+	For each property that contains a phandle reference using a locally
+	defined phandle, the __local_fixups__ node contains a property (at path
+	/__local_fixups__/$a if $a is the path of the node). Its value is a list
+	of offsets that are phandle values. If there are no such properties, no
+	__local_fixups__ node is generated.
+	For each undefined label used in at least one reference, the __fixups__
+	node contains a property. Its name is the label name, its value is a
+	list of locations where the label is used in a reference in the format
+	"path:property:offset". If there is no undefined label, no __fixups__
+	nodes is generated.
+	Enabled by default for compiling overlays (i.e. dts files with a
+	/plugin/ tag).
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

base-commit: 3b02a94b486f998aa22d898b427820a805d0904f
--=20
2.39.2

