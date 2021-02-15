From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [DTC][RFC] dtc: Allow better error reporting
Date: Mon, 15 Feb 2021 13:12:07 +0530
Message-ID: <20210215074207.sok4c7lipjewdckx@vireshk-i7>
References: <3950d7da35130a850ba9217ac7bfef781fa850b2.1613042485.git.viresh.kumar@linaro.org>
 <CAL_JsqLfLQe7bxcGYeoSWsBnS+JoagLcOZ-RGS0hbdwjRhfBqA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V5YYk6/rar/i52FpC9KWHNpAlVpOp2WPO0stU2wdP1s=;
        b=rLVQQnntLpVGDR+Wg9ire97NwxE6+omRiztTB8P3B0leyg4z41wrzPAyD+UOLaIRJ/
         KCfX0IDsnZWpoLTppZDVvzbD0XJehRDkpBqvscvGen+M3lIrQy52c9kqBkaWNgXtPDVm
         pJaYY037Qa3EZfUzjKlWh0UzkEeOfX6mRIA4cb6CWUwdWhGLCNhvzCgdygveiGR8ktct
         eyn1KNceFpZ5eu/N2pkSkh/Mbex/7xPrTdmR2J/4m/SBTEfCcKeZhTB1JwAKkJtWw7MZ
         EVuJH0lANe9HJbS+XckL0DPk0l3sLJjIXVLi5yxt49H+KaT8MobOGcEfsuTJpYyOBKOO
         ID3w==
Content-Disposition: inline
In-Reply-To: <CAL_JsqLfLQe7bxcGYeoSWsBnS+JoagLcOZ-RGS0hbdwjRhfBqA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Mills <bill.mills-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <loeliger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On 11-02-21, 08:22, Rob Herring wrote:
> This needs to go in libfdt.
> 
> The executables can always print, it's the libfdt library that may or
> may not be able to.

Sure, Will add this delta to the patch..

$ gd 3950d7da35130a850ba9217ac7bfef781fa850b2..
diff --git a/dtc.h b/dtc.h
index b8ffec155263..d3e82fb8e3db 100644
--- a/dtc.h
+++ b/dtc.h
@@ -29,12 +29,6 @@
 #define debug(...)
 #endif
 
-#ifdef VERBOSE
-#define dtc_err(fmt, ...)      fprintf(stderr, "DTC: %s: %d: " fmt, __func__, __LINE__, ##__VA_ARGS__)
-#else
-#define dtc_err(fmt, ...)
-#endif
-
 #define DEFAULT_FDT_VERSION    17
 
 /*
diff --git a/fdtoverlay.c b/fdtoverlay.c
index 5f60ce4e4cea..5350af65679f 100644
--- a/fdtoverlay.c
+++ b/fdtoverlay.c
@@ -16,7 +16,6 @@
 
 #include <libfdt.h>
 
-#include "dtc.h"
 #include "util.h"
 
 #define BUF_INCREMENT  65536
diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index b24286ac8c6c..17fc6075412f 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -10,7 +10,6 @@
 #include <libfdt.h>
 
 #include "libfdt_internal.h"
-#include "../dtc.h"
 
 /**
  * overlay_get_target_phandle - retrieves the target phandle of a fragment
diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
index 16bda1906a7b..fc7b3fa2eb2a 100644
--- a/libfdt/libfdt_internal.h
+++ b/libfdt/libfdt_internal.h
@@ -7,6 +7,12 @@
  */
 #include <fdt.h>
 
+#ifdef VERBOSE
+#define dtc_err(fmt, ...)      fprintf(stderr, "DTC: %s: %d: " fmt, __func__, __LINE__, ##__VA_ARGS__)
+#else
+#define dtc_err(fmt, ...)
+#endif
+
 #define FDT_ALIGN(x, a)                (((x) + (a) - 1) & ~((a) - 1))
 #define FDT_TAGALIGN(x)                (FDT_ALIGN((x), FDT_TAGSIZE))
 
-- 
viresh
