From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [RFC PATCH v2 2/4] of: fdt: print dtb build information
Date: Fri, 21 Feb 2020 17:14:16 +0100
Message-ID: <20200221161418.20225-3-alexandre.torgue@st.com>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2k+VXll0ozFYAI5ID9m7C2U0U8scssOA0fcMpcXtXIM=;
 b=bmhKR4Jj2v4OBlocrm1fUnIqFZz6PDmU/lALGE8c/S1Dj2kVFDH/OkRqbjUaGi/V3Tlr
 K77vwuIaiqGVoqS5DBpCnenFIKPYDi4NFDdJmNclLpvOXHnxJmO2aBTI2KByDUNZWL2o
 F7B/3m8EP3WB6dnAbZVr6K4kPn3HLdGFvgrQPn/2fhCoI8Ip4GHVF3pz0LIjNIjf93jh
 QjQELb05eRu1BPqSul0VyjuZRMGWSpzmXVxGCJ4MOFLnFRdJjbP/ZZulWslmUISV/8ZH
 GlrMSEfOyOe4t3e2o2RgGiWpzlFI55wqk6Iftd0O/ulSgZOFDxwrdRmVcopnkuhCNegL KQ== 
In-Reply-To: <20200221161418.20225-1-alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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

