From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build information
Date: Fri, 21 Feb 2020 17:12:14 +0100
Message-ID: <20200221161217.20069-2-alexandre.torgue@st.com>
References: <20200221161217.20069-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=84l2b91e/di7VUflYudfHEI8dwDeDuErqQcawADT30M=;
 b=eJbIrsJYUQ2ZOSZ/PQkd/4nlZgrFvcK9JbFCrGcLZhnboFdyJRziUg7iyQc/HMnD+7+4
 tiHe0B7gRQx4wom954tO7ehuk3/I0lBeqZpnHCL8I76+LB3J1ldZx0ngZlGj3eQMaTNr
 XhCroGu8re8Q1j99sPeMQCjjYI/nc06ebb/snLCaYtRZ/oph6tKZjBoEMGQyaj0z92nd
 4nQuKbBAR27di/pTockDqlr5UUsLyOO8GG9oET+q5pXKHknUl0K01US6ZNnpBifinSTr
 AVR/7zS0EafkNjYfKTNY1BsuUjW8sFgKy9evj+ECNZWZMZEYnmXqpd3GpKF3SiGvFTOJ ew== 
In-Reply-To: <20200221161217.20069-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Ian Lepore <ian@freebsd.org>

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

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

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

