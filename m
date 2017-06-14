From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] manual: Document missing options
Date: Wed, 14 Jun 2017 17:50:27 +0300
Message-ID: <1497451827-15219-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=iyOEvm3NpfJWiZ9mICm+z4qZG+GV5oF4nwyYaJq/Whg=;
        b=rg9STnNNCDc1rkihBKZCz0L7XW4bdK4LmW8/siQicHt/p+Fn4tcf7DzE0TSFIWyAlj
         TB5+KUgBifccmtkirKEoZbosdwe/Aeqr0xHx4pGaUfO7JP8k76lkLThRwCcDpKEyVZza
         RVbj2Y32nRbtBJruq61If8TBWZ3YlhvFq7KPQ=
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

The -d and -s options were undocumented. Add an entry in the manual.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/manual.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 2f07350..d4e99e3 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -674,4 +674,8 @@ The fdtdump program prints a readable version of a flat device tree file.
 
 The syntax of the fdtdump command line is:
 
-    fdtdump <DTB-file-name>
+    fdtdump [options] <DTB-file-name>
+
+Where options are:
+    -d,--debug          Dump debug information while decoding the file
+    -s,--scan           Scan for an embedded fdt in given file
-- 
2.1.4
