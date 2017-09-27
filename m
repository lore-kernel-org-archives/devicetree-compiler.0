From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH dtc] checks: Use proper format modifier for size_t
Date: Wed, 27 Sep 2017 15:04:09 +0200
Message-ID: <20170927130409.9092-1-thierry.reding@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jAZXy1Sax0BO6KrmheDKIbsIpU3eTuUeyUZsHKhTP6o=;
        b=FKwXW9x3YjPYbIB0Ahn2nAMYGqQNeOuecKuCbwYymGZAccTZIVQE4RNyAilR8vpclS
         iQAga1uNk0jAMre9gnRPg52ENqiJrfwLMDdrhzC+yzm0bO2y0RwpAeux39SG00CCHqpz
         hAlLF8hy6mM8txoYeO80psIHUkpn8meV1lpps4gl+tsJjEGprqvjnuMzt1PJM/tBrSHD
         sGZsALGj5XtZNwYW00Cy0e8XI/xvW1yvX2To5dLqU+jlIBDxpiCn3M4mHgXprXASsXki
         XibVzHTda9YqGNkLxY9+3EucT+0ide03kjiLJRsF1/sUd5fjpDTyqptMMe5+Ak8CC0po
         ONSA==
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The size of size_t can vary between architectures, so using %ld isn't
going to work on 32-bit builds. Use the %zu modifier to make sure it is
always correct.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 checks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index 902f2e374025..08a3a29edae3 100644
--- a/checks.c
+++ b/checks.c
@@ -972,7 +972,7 @@ static void check_property_phandle_args(struct check *c,
 	int cell, cellsize = 0;
 
 	if (prop->val.len % sizeof(cell_t)) {
-		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %ld in node %s",
+		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %zu in node %s",
 		     prop->name, prop->val.len, sizeof(cell_t), node->fullpath);
 		return;
 	}
@@ -1163,7 +1163,7 @@ static void check_interrupts_property(struct check *c,
 		return;
 
 	if (irq_prop->val.len % sizeof(cell_t))
-		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %ld in node %s",
+		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %zu in node %s",
 		     irq_prop->name, irq_prop->val.len, sizeof(cell_t),
 		     node->fullpath);
 
-- 
2.14.1
