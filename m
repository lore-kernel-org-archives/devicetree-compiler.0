From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [RFC PATCH v2 4/4] script: make automatic dtb build info generation
Date: Fri, 21 Feb 2020 17:12:17 +0100
Message-ID: <20200221161217.20069-5-alexandre.torgue@st.com>
References: <20200221161217.20069-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <linux-kbuild-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=j0cy0mKA7cM8Tk6Z9M9zdWvIoHNs4Pm0R3aUHtmCHIs=;
 b=ZgvvblOR1TTNkCPnTK2ZYbzpoTDZHAs2urCgIi4n8hxRJniMckK0ED6dE2lOD7KV8l4n
 8wwaz6xOY/BevZurX+Sgl5DFTzz10sykb3fo+M8S4BVG7g9xt8UjLVnD9JUxOAsP5I9u
 ci55Yi/HblFgrlKcOVXFnlAzNpoGlRmMxf7WQq//BcuAZf/Y/tOXfNdpo5wyL0G/0MI0
 CEIMny1ZVLzoM8frv5pkSKKSJHAqWc21kQNUph+55/pMKhBPVI7OAj9rPKsTD8/titVf
 PyINOjdDh+uqJ1mJu/oxAPd6RaRRxLtOC4aw0L3rVrme9NbtlH8FR5GVsu8G8bBb2Rqp Tg== 
In-Reply-To: <20200221161217.20069-1-alexandre.torgue@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Ian Lepore <ian@freebsd.org>

Append each "xxx.dtb.dts.tmp" file with "build-info" entry during dtb
build. It allows to get build information (date, source version, ...)
for each device tree without modify them manually.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index a5af84ef4ffc..f084e78267b2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -289,6 +289,7 @@ quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(DTB_GEN_INFO) $(src) ; \
 	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+	$(DTB_GEN_INFO) $(src) $(dtc-tmp) ; \
 	$(DTC) -O $(2) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
index 0cd8bd98e410..72f31e386787 100755
--- a/scripts/gen_dtb_build_info.sh
+++ b/scripts/gen_dtb_build_info.sh
@@ -6,5 +6,7 @@ set -o nounset
 DTB_DIR=$1
 DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
 DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
+DTS_FILE=$2
 
-printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
+printf "$DTB_INFO" > "arch/arm/boot/dts/dtb-build.txt"
+echo "&{/} {build-info = /incbin/(\"dtb-build.txt\");};" >> $DTS_FILE
-- 
2.17.1

