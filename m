From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/3] manual: Document prettification fdtdump options
Date: Wed, 14 Jun 2017 17:53:50 +0300
Message-ID: <1497452030-15588-4-git-send-email-pantelis.antoniou@konsulko.com>
References: <1497452030-15588-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0bsT7KFVmgYkSC6mTkTucm/IWcPLfiFN+7hA3CO2q5o=;
        b=cbKqeo/MOOnRMWLrqjfZqC3+KROWUqNHKneloV9mYdRVv3GUTPOB898ol8brpAYeAR
         a5TJTbLaf5WODCj7v2mgKN9wYt5nRTZegrRiDiFPc+BaqXT5wkVXHjLAyXy8TROHcEvx
         5r3U0nhie3jWSpzz7R0Snjz2x5IMI3DiVaiKE=
In-Reply-To: <1497452030-15588-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Document the new fdtdump options that make output prettier.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/manual.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 72403ac..27ca3af 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -679,6 +679,8 @@ The syntax of the fdtdump command line is:
 Where options are:
     -d,--debug          Dump debug information while decoding the file
     -s,--scan           Scan for an embedded fdt in given file
+    -w,--width		Width of output in columns
+    -S,--shift		Shift space amount when recursing in a node
 
 3) fdtoverlay -- Flat Device Tree overlay applicator
 
-- 
2.1.4
