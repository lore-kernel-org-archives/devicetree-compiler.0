From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] manual: Fix and improve documentation about -@
Date: Mon, 24 Apr 2023 17:28:02 +0200
Message-ID: <20230424152802.96250-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Device trees with a /plugin/ tag ("overlays") generate a __fixups__ node
when needed and independent of -q being given or not. The same is true for
__local__fixups__. So don't mention these two nodes in the paragraph about
-@.

To not shorten the description too much, describe the semantic of the
properties contained in the generated __symbols__ node.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+Ir=
Q@public.gmane.org>
---
 Documentation/manual.txt | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 2087a4d3e754..15a7837d3cef 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -122,12 +122,10 @@ Options:
 	Relevant for dtb and asm output only.
=20
     -@
-	Generates a __symbols__ node at the root node of the resulting blob
-	for any node labels used, and for any local references using phandles
-	it also generates a __local_fixups__ node that tracks them.
+	Generates a __symbols__ node at the root node. This node contains a
+	property for each label. The property's name is the label name and the
+	value is the path of the labeled node.
=20
-	When using the /plugin/ tag all unresolved label references to
-	be tracked in the __fixups__ node, making dynamic resolution possible.
=20
     -A
 	Generate automatically aliases for all node labels. This is similar to
--=20
2.39.2

