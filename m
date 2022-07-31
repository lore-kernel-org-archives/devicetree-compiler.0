From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [PATCH] Don't generate erroneous fixups from reference to path
Date: Sun, 31 Jul 2022 22:11:00 +1000
Message-ID: <20220731121100.253043-1-david@gibson.dropbear.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gibson.dropbear.id.au; s=201602; t=1659269464;
        bh=QdoKGje/TnmRVTkd7vRtl8kRnuIuXsfTL7mMYgLhmtg=;
        h=From:To:Cc:Subject:Date:From;
        b=du9iPJCe87piOhhYOMMzVZvKB9YCC/xWuPnRlxCJ88Ikz41kYWZNXt90M7pakNpjL
         hvgFVZJLy3FwY3Rt8m2XjYSGo3HhypX8+eP/NzfNSeqv8r4ac6klAaspw+bVEJcv6m
         0DKxv/0wlZ1Ln1Lg8fG8mSxuIDqLEvZHgANvy2Ec=
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

The dtb overlay format only permits (non local) fixups to reference labels,
not paths.  That's because the fixup target goes into the property name in
the overlay, and property names aren't permitted to include '/' characters.

Stop erroneously generating such fixups, because we didn't check for this
case.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 livetree.c                  | 6 ++++++
 tests/fixup-ref-to-path.dts | 6 ++++++
 tests/run_tests.sh          | 1 +
 3 files changed, 13 insertions(+)
 create mode 100644 tests/fixup-ref-to-path.dts

diff --git a/livetree.c b/livetree.c
index 169462d..f46a098 100644
--- a/livetree.c
+++ b/livetree.c
@@ -919,6 +919,12 @@ static void add_fixup_entry(struct dt_info *dti, struct node *fn,
 	/* m->ref can only be a REF_PHANDLE, but check anyway */
 	assert(m->type == REF_PHANDLE);
 
+	/* The format only permits fixups for references to label, not
+	 * references to path */
+	if (strchr(m->ref, '/'))
+		die("Can't generate fixup for reference to path &{%s}\n",
+		    m->ref);
+
 	/* there shouldn't be any ':' in the arguments */
 	if (strchr(node->fullpath, ':') || strchr(prop->name, ':'))
 		die("arguments should not contain ':'\n");
diff --git a/tests/fixup-ref-to-path.dts b/tests/fixup-ref-to-path.dts
new file mode 100644
index 0000000..f6dcba0
--- /dev/null
+++ b/tests/fixup-ref-to-path.dts
@@ -0,0 +1,6 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	prop = < &{/path/to/node} >;
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 0cabd13..244df8a 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -271,6 +271,7 @@ libfdt_overlay_tests () {
 	run_dtc_test -I dts -O dtb -o $tree.test.dtb "$SRCDIR/$tree.dts"
 	run_test overlay_bad_fixup overlay_base_no_symbols.test.dtb $tree.test.dtb
     done
+    run_sh_test "$SRCDIR/dtc-fatal.sh" -I dts -O dtb -o /dev/null fixup-ref-to-path.dts
 }
 
 # Tests to exercise dtc's overlay generation support
-- 
2.37.1

