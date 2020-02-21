From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build information
Date: Fri, 21 Feb 2020 17:14:15 +0100
Message-ID: <20200221161418.20225-2-alexandre.torgue@st.com>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=84l2b91e/di7VUflYudfHEI8dwDeDuErqQcawADT30M=;
 b=iy9fYeyD4J84NGAZwItOo4iPy9fHwru5Mzt1bG1ActChIhT78uBE1aX9PDjpjpPqb7Di
 sixhgAeW+WQM6ewcozXc7Yh6mt54AQ/oDO3cF64Ic6CZLagfy84PTOmum0bzbrDtxJak
 SErQh6iZNMm/arKDTwrcWFDg4RKhaXu9fqHCnp/wYbYdsJ14fUgdkweApX9SuDu/RcLH
 LchG2ggrKAHxjhtF2L4p4ZW6jtym6WjyD7XOZ3mSz17qcMV5D1KkqO4eg/nX5S205W0O
 I/87+kcBjeyxVKp+ffdutE7qDuwbAeVw5hwT7l+lxuLacXdbC6GYUyuqnHne6KPCXqID 1Q== 
In-Reply-To: <20200221161418.20225-1-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

This commit adds a new script to create a file (in dts file directory) with
some information (date, Linux version, user). This file could then be used
to populate "build-info" property in every dts file that would use this
build information:

Example:

/ {
	...
	build-info = /incbin/("dtb-build.txt");
	...
};

Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index bae62549e3d2..a5af84ef4ffc 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
 # DTC
 # ---------------------------------------------------------------------------
 DTC ?= $(objtree)/scripts/dtc/dtc
+DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
 
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
@@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
+	$(DTB_GEN_INFO) $(src) ; \
 	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(DTC) -O $(2) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
new file mode 100755
index 000000000000..0cd8bd98e410
--- /dev/null
+++ b/scripts/gen_dtb_build_info.sh
@@ -0,0 +1,10 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -o nounset
+
+DTB_DIR=$1
+DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
+DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
+
+printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
-- 
2.17.1

