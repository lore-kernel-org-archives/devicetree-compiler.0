From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: [PATCH] dtc: Improve portability
Date: Thu, 23 Oct 2014 11:23:09 +0100
Message-ID: <5448D70D.3080409@raspberrypi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

1) Remove the double parentheses around two comparisons in checks.c.
    The OSX LLVM-based C compiler warns about them.
2) Put an explicit "=" in the TN() macro, in accordance with c99.

Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
---
  checks.c  | 4 ++--
  fdtdump.c | 2 +-
  2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/checks.c b/checks.c
index 47eda65..3bf0fa4 100644
--- a/checks.c
+++ b/checks.c
@@ -624,11 +624,11 @@ static void check_avoid_default_addr_size(struct 
check *c, struct node *dt,
      if (!reg && !ranges)
          return;

-    if ((node->parent->addr_cells == -1))
+    if (node->parent->addr_cells == -1)
          FAIL(c, "Relying on default #address-cells value for %s",
               node->fullpath);

-    if ((node->parent->size_cells == -1))
+    if (node->parent->size_cells == -1)
          FAIL(c, "Relying on default #size-cells value for %s",
               node->fullpath);
  }
diff --git a/fdtdump.c b/fdtdump.c
index a29aa5e..95a6a20 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -22,7 +22,7 @@
  static const char *tagname(uint32_t tag)
  {
      static const char * const names[] = {
-#define TN(t) [t] #t
+#define TN(t) [t] = #t
          TN(FDT_BEGIN_NODE),
          TN(FDT_END_NODE),
          TN(FDT_PROP),
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
