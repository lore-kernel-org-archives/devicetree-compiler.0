From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH v2] libfdt: check for potential overrun in _fdt_splice()
Date: Tue, 1 Dec 2015 16:43:10 -0800
Message-ID: <1449016990-12730-1-git-send-email-bjorn.andersson@sonymobile.com>
References: <1439231942-28830-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439231942-28830-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

From: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

This patch catches the conditions where:
 - 'splicepoint' is set to a point outside of [ fdt, fdt_totalsize(fdt) )
 - 'newlen' is negative, or 'splicepoint' plus 'newlen' results in overflow

Either of these cases can be caused by math which overflows in calling
functions, or by sizes specified through dynamic means.

Signed-off-by: Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 libfdt/fdt_rw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
index 70adec6c371b..8be02b1f68f3 100644
--- a/libfdt/fdt_rw.c
+++ b/libfdt/fdt_rw.c
@@ -101,6 +101,8 @@ static int _fdt_splice(void *fdt, void *splicepoint, int oldlen, int newlen)
 
 	if (((p + oldlen) < p) || ((p + oldlen) > end))
 		return -FDT_ERR_BADOFFSET;
+	if ((p < (char *)fdt) || ((end - oldlen + newlen) < (char *)fdt))
+		return -FDT_ERR_BADOFFSET;
 	if ((end - oldlen + newlen) > ((char *)fdt + fdt_totalsize(fdt)))
 		return -FDT_ERR_NOSPACE;
 	memmove(p + newlen, p + oldlen, end - p - oldlen);
-- 
2.4.2
