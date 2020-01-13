From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [RFC PATCH 3/3] scripts: Use -B dtc option to generate dtb build information.
Date: Mon, 13 Jan 2020 19:16:25 +0100
Message-ID: <20200113181625.3130-4-alexandre.torgue@st.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=FqG6RRGJ2qKprjOk0E+7QuGlz/uGedPc3JymgcduaQ4=;
 b=eCNF0WOg9K4tDw9RTmicRxS5A+zMzFcTwmsTg39uB7uSO69KAzpbUDOQY9V2NWhWP5Ol
 SGYVwg1xbvb61jKy8H3etrl75FA4eB0J4A7BNXk2SEJIo6LeVv/2hUqoOkx1+rFlzlmU
 mdII2AFjLmKRAreYf0SMtHhqhMERibztr++oSjyIMsMFEe+UBWt9HMXw5AC8rP9uduHV
 T9LrMraYDU8dEtAKsAtaYJO+HEWX82zfvMvwYaVsZRxTlN/ID+ko4SWnrf8KbxOkIIKj
 yBL846byoTHXE1x8Y1KCQTUva8XCz3cQWr1CU7KkzTNpztUTTQ06blaHuQEyI7sIkjDs cQ== 
In-Reply-To: <20200113181625.3130-1-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This commit adds a new script to create a string in tmp file with
some information (date, linux version, user). This file is then used by
dtc with -B option to append dts file with a new property.
During kernel boot it will then be possible to printout DTB build
information (date, linux version used, user).

Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3fa32f83b2d7..6a98eac1e56d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -235,6 +235,7 @@ quiet_cmd_gzip = GZIP    $@
 # DTC
 # ---------------------------------------------------------------------------
 DTC ?= $(objtree)/scripts/dtc/dtc
+DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info
 
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
@@ -275,11 +276,13 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
-	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(DTC) -O $(2) -o $@ -b 0 \
+       $(DTB_GEN_INFO) $(@).info ;\
+       $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+       $(DTC) -O $(2) -o $@ -b 0 -B $(@).info\
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
-		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
+               -d $(depfile).dtc.tmp $(dtc-tmp) ; \
+       rm $(@).info ; \
+       cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc,dtb)
diff --git a/scripts/gen_dtb_build_info b/scripts/gen_dtb_build_info
new file mode 100755
index 000000000000..30cf7506b9d5
--- /dev/null
+++ b/scripts/gen_dtb_build_info
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+DTB_TARGET=$@
+COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
+
+touch $DTB_TARGET
+
+{
+  echo From Linux $KERNELRELEASE by $COMPILE_BY the $(date).
+} > $DTB_TARGET
-- 
2.17.1

