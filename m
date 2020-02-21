From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [RFC PATCH v2 4/4] script: make automatic dtb build info generation
Date: Fri, 21 Feb 2020 17:14:18 +0100
Message-ID: <20200221161418.20225-5-alexandre.torgue@st.com>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=j0cy0mKA7cM8Tk6Z9M9zdWvIoHNs4Pm0R3aUHtmCHIs=;
 b=Y2zDz/hsRrUDG815gVDc1oEZ8UmjKwq9y+nocwidSm+jGXAmlrXRPQKP3u5Fqz0eKtZ1
 kFSmzIASg8pgLFehDf2/NpiSxvIh8K95JsjR7xRA/Uu1RPtgVH4VRSNtigVVE0c+Zkqa
 v0XPiPVVvfLqUI/kv8Ikm4illMval7rbA+qi8vndSUi2riaIjAoZAdytnwUPRVnhu2sK
 5Vci8VOIPZS8vjVyWW9VoQijdzNtk9JKfZQHxKgz+/fy2W1Qy3rtxQfxVlj3ZS9BOvID
 oRfoO/pPLH7pJQafI22gjJKq6gYoqlBMaexIhwWyachx4E0XCZCGVEP0hlDFgEJlQZgg aA== 
In-Reply-To: <20200221161418.20225-1-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

Append each "xxx.dtb.dts.tmp" file with "build-info" entry during dtb
build. It allows to get build information (date, source version, ...)
for each device tree without modify them manually.

Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

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

