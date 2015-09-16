From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 3/3] dtc: linux kernel build process to create annotated
 .dts
Date: Tue, 15 Sep 2015 21:29:16 -0700
Message-ID: <55F8F01C.4050305@gmail.com>
References: <55F8EB35.5010601@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=RBSKI7OXwHhESnCqyiojZPhVuALMcVDCUk4XSRpl3l4=;
        b=OgRr0dPIFu1uD5HJFRO+jHH/i2/atnxSRANUFGnQ7zFH0r5YJ60tjqQam3FAcrw4aW
         1ZhDUWWqBw/RHREdctKQ7ZkMg3RXIbzp4nb43bbACoHe052V45OUAHhMAc/Oe69nk/rs
         ZJkuSCDxek37M1Xgsth1mY3u9rIq1+aqM0SfmUeps3LVdsGDj3Llvjark9j4PxAKGZcc
         UMYJwEtPt/pSreQj9IdnRJo4aR+U7j0maIvvQD0bX9GVdI7hN9SuEUMohEBsPststy26
         3uWd5iuEgvPduhtIwNQqAP1ot7n/BzhKv/uZTfkul4UBMfmgp9AaqW252UgQQ/kC90tk
         AdJg==
In-Reply-To: <55F8EB35.5010601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Add a new temp file in the build directory arch/${arch}/boot/dts/
that contains the expanded device tree source with source file locations.

Requires a new version of the dtc compiler that understands the
--annotate flag.

Not-signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 scripts/Makefile.lib |    3 +++
 1 file changed, 3 insertions(+)

Index: b/scripts/Makefile.lib
===================================================================
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -287,12 +287,15 @@ cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
 		-i $(dir $<) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
+	$(objtree)/scripts/dtc/dtc --annotate -O dts -o $(dtc-annotate-tmp) \
+		 $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
 $(obj)/%.dtb: $(src)/%.dts FORCE
 	$(call if_changed_dep,dtc)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
+dtc-annotate-tmp = $(subst $(comma),_,$(dot-target).annotate.dts.tmp)
 
 # Bzip2
 # ---------------------------------------------------------------------------
