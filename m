From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] checks: Fix bus-range check
Date: Tue, 29 Jun 2021 13:43:04 +0200
Message-ID: <20210629114304.2451114-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EUc22cGM9C2OnOUHX+LbN0Zx7p5F8ZElFxFYXrgNDDw=;
        b=TBSMlCWo/gg9tOVRuy0nH6e1HYb7qvgHaPRMrgnUnsWlHJC3qRFXfth1DDkkS8vZRb
         flVeuQprBEoPgKOpZNTy7H2YtoIPAHvU91haqRWzMT41wZ1xHsRiWid103Kg+vIUJiVH
         Uuw+SF6oa2+pkDGjO+Z+Suy4tFMAwve5Tyg9nvlu34ipMmly5GMVjXL27T2Hb7Bo1BIT
         ykdj6xyIRC65nU51peGKMjn176Vsw+ILEC8nsr9FAYjAERqQdckibu9n9UIwqEn0G4bX
         Y0WEmhKHGGB3RX/A3YOsT2vae+9gXwsJiDn+pZeDYWHvlwuNw0ngFZWJ3yDUTlk0KNEH
         7ftg==
List-ID: <devicetree-compiler.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The upper limit of the bus-range is specified by the second cell of the
bus-range property.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index e2690e90f90c..fb3fc9cda4b1 100644
--- a/checks.c
+++ b/checks.c
@@ -892,7 +892,7 @@ static void check_pci_device_bus_num(struct check *c, struct dt_info *dti, struc
 	} else {
 		cells = (cell_t *)prop->val.val;
 		min_bus = fdt32_to_cpu(cells[0]);
-		max_bus = fdt32_to_cpu(cells[0]);
+		max_bus = fdt32_to_cpu(cells[1]);
 	}
 	if ((bus_num < min_bus) || (bus_num > max_bus))
 		FAIL_PROP(c, dti, node, prop, "PCI bus number %d out of range, expected (%d - %d)",
-- 
2.32.0

