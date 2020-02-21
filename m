From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [RFC PATCH v2 2/4] of: fdt: print dtb build information
Date: Fri, 21 Feb 2020 17:12:15 +0100
Message-ID: <20200221161217.20069-3-alexandre.torgue@st.com>
References: <20200221161217.20069-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2k+VXll0ozFYAI5ID9m7C2U0U8scssOA0fcMpcXtXIM=;
 b=A5HTjgqGRWomdcxY2wBanohSWzeCO10NSYQVoWnt6pjJGxw6Yvy8y8bpHZLGZtHMniGZ
 SL+MlsQd42epFRUmre2Ni4ftrnzQMgHcDP+imm8Y/DfyHxMSiHDPAZDRYjcRNeKOsr9R
 K/n6uhnf4MoFR8FN5LlTtLgGZZpQg3so7Hv1206LVa4y+owyCYfJ1MwGaf9f+dGz3g1/
 DiblwtCglhy4TrUZzigNd729vl5F7dp0sY0O39ITjLUVFPWqhW7+uY3KY4ZFfFi5wBt5
 cd8SFtbOR/tvgr4bpDuxcUbKRWmdbp1hI9w4c7PPn96nk4jfsqk9JAOSQT84Us0yW04r /A== 
In-Reply-To: <20200221161217.20069-1-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

This commit prints out DTB build information (build time, dts source
version used, ...) if "Build-info" property exists in DTB root node.

Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 2cdf64d2456f..aa5989039746 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1224,9 +1224,18 @@ bool __init early_init_dt_scan(void *params)
  */
 void __init unflatten_device_tree(void)
 {
+	const char *build_info;
+	unsigned long dt_root;
+
 	__unflatten_device_tree(initial_boot_params, NULL, &of_root,
 				early_init_dt_alloc_memory_arch, false);
 
+	/* If available, provide dtb build information */
+	dt_root = of_get_flat_dt_root();
+	build_info = of_get_flat_dt_prop(dt_root, "build-info", NULL);
+	if (build_info)
+		pr_info("%s\n", build_info);
+
 	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
 	of_alias_scan(early_init_dt_alloc_memory_arch);
 
-- 
2.17.1

