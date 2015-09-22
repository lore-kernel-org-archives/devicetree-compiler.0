From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v2 3/3] dtc: linux kernel build process to create annotated
 .dts
Date: Mon, 21 Sep 2015 22:39:46 -0700
Message-ID: <5600E9A2.5050000@gmail.com>
References: <5600E191.9020903@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=RBSKI7OXwHhESnCqyiojZPhVuALMcVDCUk4XSRpl3l4=;
        b=0wTzVb/3Mo/3y7X+uwQM8Gfmy3GXSigmzbXxKMCsXRjzXRS0s7FcGL3qoX0tqrbZvx
         Z6wTwvo0mnaTW6Q61vF7hpvCGhuFTN6cFnraZB0SkL6eO5wU4meYHJlW2bCdZ1FkqRyG
         qGfFgvC4VvSeXNduqb6iUt6KR0cPIqxhEfNHZLcn3+Yyef+Hjj8j+vWKpPMz5QJ0AjIm
         as4exoGGWHv/36+PShOfokY8d3bJAsMybrtX4EvH0zrZQCEZwD+3qNZ1+bTkJsKf9d3D
         XX+5sgtuUFsmVuZ+WcTc5L1UFoqnNcceWa59VpNZ1OhNLJheLZlwIBH0mD03/WUEtam3
         AE7A==
In-Reply-To: <5600E191.9020903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

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
