From: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] check: Inform about missing ranges
Date: Sun,  8 Mar 2020 17:56:43 +0100
Message-ID: <20200308165643.19281-1-arkadiusz@drabczyk.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

In check_unit_address_vs_reg() warning message already says 'reg _or_
ranges' when reg or ranges are present but unit name is missing.  Add
this message for compatibility to say "reg _or_ ranges" when unit name
is present but neither reg nor ranges are present.

Signed-off-by: Arkadiusz Drabczyk <arkadiusz-42WfZ8EewN5g9hUCZPvPmw@public.gmane.org>
---
 checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 8acbc05..4b3c486 100644
--- a/checks.c
+++ b/checks.c
@@ -352,7 +352,7 @@ static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
 			FAIL(c, dti, node, "node has a reg or ranges property, but no unit name");
 	} else {
 		if (unitname[0])
-			FAIL(c, dti, node, "node has a unit name, but no reg property");
+			FAIL(c, dti, node, "node has a unit name, but no reg or ranges property");
 	}
 }
 WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
-- 
2.9.0

